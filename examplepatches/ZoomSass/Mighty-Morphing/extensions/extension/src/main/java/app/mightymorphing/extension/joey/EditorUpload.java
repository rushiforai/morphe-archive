package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Base64;
import android.util.Log;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Uploads a file chosen in the reply or edit toolbar through Reddit's media lease.
 * The editor keeps a marker for the media id. When the comment or edit is sent,
 * that marker becomes a rich-text image or video, which is how Reddit attaches
 * media to a comment. The temporary bucket address is never inserted.
 */
public final class EditorUpload {
    private static final String TAG = "MightyUpload";
    private static final ThreadLocal<String> PARENT = new ThreadLocal<>();
    private static final Pattern MARKER = Pattern.compile(
            "!?\\[[^\\]]*]\\(reddit-media:(img|gif|video):([A-Za-z0-9_./-]+)\\)");

    private EditorUpload() {}

    /** Single comment JPEG, PNG, or GIF. Post uploads stay on Joey's own path. */
    public static boolean still(Activity activity, List<?> uris, boolean post) {
        if (post || activity == null || uris == null || uris.size() != 1) return false;
        Object item = uris.get(0);
        if (!(item instanceof Uri)) return false;
        String mime = mime(activity, (Uri) item, name((Uri) item));
        if (!"image/jpeg".equals(mime) && !"image/png".equals(mime) && !"image/gif".equals(mime)
                && !"image/webp".equals(mime)) return false;
        start(activity, uris);
        return true;
    }

    /** Single comment MP4. MOV files and post videos stay on Joey's own paths. */
    public static boolean clip(Activity activity, List<?> uris, boolean post) {
        if (post || activity == null || uris == null || uris.size() != 1) return false;
        Object item = uris.get(0);
        if (!(item instanceof Uri)) return false;
        String mime = mime(activity, (Uri) item, name((Uri) item));
        if (!"video/mp4".equals(mime)) return false;
        start(activity, uris);
        return true;
    }

    public static void start(Activity activity, List<?> uris) {
        if (activity == null || uris == null || uris.isEmpty()) return;
        List<Uri> files = new ArrayList<>();
        for (Object item : uris) {
            if (item instanceof Uri) files.add((Uri) item);
        }
        if (files.isEmpty()) return;
        ProgressDialog progress = new ProgressDialog(activity);
        progress.setMessage("Uploading to Reddit…");
        progress.setCancelable(false);
        activity.runOnUiThread(progress::show);
        new Thread(() -> {
            try {
                List<String> links = new ArrayList<>();
                for (Uri file : files) links.add(publish(activity, progress, file));
                activity.runOnUiThread(() -> finish(activity, progress, links));
            } catch (Throwable failure) {
                Log.i(TAG, "upload failed", failure);
                activity.runOnUiThread(() -> {
                    dismiss(progress);
                    String message = failure.getMessage();
                    Toast.makeText(activity, message == null ? "Upload failed" : message, Toast.LENGTH_LONG).show();
                });
            }
        }, "reddit-media-upload").start();
    }

    private static void finish(Activity activity, ProgressDialog progress, List<String> links) {
        dismiss(progress);
        int editor = activity.getResources().getIdentifier("ReplyEditor", "id", activity.getPackageName());
        EditText text = activity.findViewById(editor);
        StringBuilder block = new StringBuilder();
        for (String link : links) {
            if (block.length() > 0) block.append('\n');
            block.append(link);
        }
        if (text != null) {
            int at = Math.max(0, text.getSelectionStart());
            text.getText().insert(at, block.toString());
            return;
        }
        Toast.makeText(activity, block.toString(), Toast.LENGTH_LONG).show();
    }

    /**
     * Called after a comment or edit has built its request. A media marker in the
     * text is replaced with the rich-text document Reddit expects.
     */
    public static void attach(Map<String, String> params) {
        if (params == null) return;
        String body = params.get("text");
        if (body == null || !body.contains("reddit-media:")) return;
        String thing = params.get("thing_id");
        if (thing == null || !(thing.startsWith("t1_") || thing.startsWith("t3_"))) return;
        try {
            String rich = document(body);
            params.put("richtext_json", rich);
            params.put("text", "");
            params.put("return_rtjson", "true");
            params.put("api_type", "json");
            PARENT.set(thing);
            Log.i(TAG, "comment media " + rich);
        } catch (Throwable failure) {
            Log.i(TAG, "comment media skipped", failure);
        }
    }

    /**
     * Joey scrolls to the new comment using the id in the submit response. An image
     * response omits that id, so look up the comment that was just posted.
     */
    public static String submittedId(Object node) {
        String parent = PARENT.get();
        if (parent == null) return null;
        if (node != null && (hasErrors(node) || hasThings(node))) {
            PARENT.remove();
            return null;
        }
        String id = recentId(parent);
        PARENT.remove();
        return id == null || id.isEmpty() ? null : id;
    }

    private static boolean hasThings(Object node) {
        try {
            java.lang.reflect.Method get = node.getClass().getMethod("get", String.class);
            Object data = get.invoke(node, "data");
            if (data == null) return false;
            Object things = get.invoke(data, "things");
            if (things == null) return false;
            Object size = things.getClass().getMethod("size").invoke(things);
            return size instanceof Integer && (Integer) size > 0;
        } catch (Throwable failure) {
            return false;
        }
    }

    private static boolean hasErrors(Object node) {
        try {
            java.lang.reflect.Method get = node.getClass().getMethod("get", String.class);
            Object errors = get.invoke(node, "errors");
            if (errors == null) return false;
            Object size = errors.getClass().getMethod("size").invoke(errors);
            return size instanceof Integer && (Integer) size > 0;
        } catch (Throwable failure) {
            return false;
        }
    }

    private static String recentId(String parent) {
        try {
            String access = token(application());
            String name = new JSONObject(get(access, "https://oauth.reddit.com/api/v1/me", 5000))
                    .optString("name", "");
            if (name.isEmpty()) throw new IllegalStateException("Reddit did not name the account");
            String url = "https://oauth.reddit.com/user/" + url(name) + "/comments?limit=10&sort=new&raw_json=1";
            String posted = null;
            for (int attempt = 0; attempt < 4; attempt++) {
                if (attempt > 0) Thread.sleep(300);
                String[] found = matchParent(new JSONObject(get(access, url, 5000)).getJSONObject("data").getJSONArray("children"), parent);
                if (found == null) continue;
                posted = found[0];
                if ("ready".equals(found[1])) return posted;
            }
            if (posted != null) Log.i(TAG, "comment id " + posted + " image still processing");
            return posted;
        } catch (Throwable failure) {
            Log.i(TAG, "comment id lookup failed", failure);
        }
        return null;
    }

    /** [0] is the comment id. [1] is "ready" once Reddit has supplied an image URL. */
    private static String[] matchParent(JSONArray children, String parent) {
        long now = System.currentTimeMillis() / 1000L;
        for (int i = 0; i < children.length(); i++) {
            JSONObject data = children.optJSONObject(i);
            if (data == null) continue;
            data = data.optJSONObject("data");
            if (data == null || !parent.equals(data.optString("parent_id"))) continue;
            long created = data.optLong("created_utc", 0L);
            if (created > 0 && now - created > 180) continue;
            String id = data.optString("id", "");
            if (id.isEmpty()) continue;
            boolean ready = imageReady(data.optJSONObject("media_metadata"));
            if (ready) Log.i(TAG, "comment id " + id);
            return new String[] { id, ready ? "ready" : "processing" };
        }
        return null;
    }

    private static boolean imageReady(JSONObject meta) {
        if (meta == null) return false;
        java.util.Iterator<String> keys = meta.keys();
        while (keys.hasNext()) {
            JSONObject entry = meta.optJSONObject(keys.next());
            if (entry == null || !"valid".equals(entry.optString("status"))) continue;
            JSONObject source = entry.optJSONObject("s");
            if (source == null) continue;
            String url = source.optString("u", source.optString("gif", source.optString("mp4", "")));
            if (url.isEmpty()) url = entry.optString("hlsUrl", "");
            if (url.startsWith("http")) return true;
        }
        return false;
    }

    private static Context application() throws Exception {
        Object app = Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication")
                .invoke(null);
        if (!(app instanceof Context)) throw new IllegalStateException("Sign in again before uploading");
        return (Context) app;
    }

    private static String get(String token, String url) throws Exception {
        return get(token, url, 20000);
    }

    private static String get(String token, String url, int timeout) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(timeout);
        conn.setReadTimeout(timeout);
        conn.setRequestProperty("Authorization", "Bearer " + token);
        conn.setRequestProperty("User-Agent", "Joey:o.o.joey:2.1.6.5");
        String text = readResponse(conn);
        int code = conn.getResponseCode();
        conn.disconnect();
        if (code / 100 != 2) throw new IllegalStateException("Reddit listing HTTP " + code);
        return text;
    }

    private static String document(String body) throws Exception {
        JSONArray document = new JSONArray();
        Matcher matcher = MARKER.matcher(body);
        int at = 0;
        while (matcher.find()) {
            paragraph(document, body.substring(at, matcher.start()));
            JSONObject media = new JSONObject();
            String kind = matcher.group(1);
            if (!"img".equals(kind) && !"gif".equals(kind) && !"video".equals(kind)) throw new IllegalStateException("empty");
            media.put("e", kind);
            media.put("id", matcher.group(2));
            document.put(media);
            at = matcher.end();
        }
        paragraph(document, body.substring(at));
        if (document.length() == 0) throw new IllegalStateException("empty");
        return new JSONObject().put("document", document).toString();
    }

    private static void paragraph(JSONArray document, String chunk) throws Exception {
        String[] lines = chunk.split("\n");
        for (String line : lines) {
            if (line.trim().isEmpty()) continue;
            JSONObject text = new JSONObject();
            text.put("e", "text");
            text.put("t", line);
            JSONObject paragraph = new JSONObject();
            paragraph.put("e", "par");
            paragraph.put("c", new JSONArray().put(text));
            document.put(paragraph);
        }
    }

    private static String publish(Activity activity, ProgressDialog progress, Uri file) throws Exception {
        String token = token(activity);
        String name = name(file);
        String mime = mime(activity, file, name);
        byte[] bytes = read(activity, file);
        boolean gif = "image/gif".equals(mime);
        boolean video = "video/mp4".equals(mime);
        if (gif) {
            if (!name.endsWith(".gif")) name = "image.gif";
        } else if ("image/webp".equals(mime)) {
            if (!name.endsWith(".webp")) name = "image.webp";
        } else if (video) {
            if (!name.endsWith(".mp4")) name = "video.mp4";
        } else if (!name.endsWith(".jpg") && !name.endsWith(".jpeg") && !name.endsWith(".png")) {
            name = "image/png".equals(mime) ? "image.png" : "image.jpg";
        }
        Log.i(TAG, "lease " + mime + " " + bytes.length + " bytes");
        JSONObject lease = lease(token, name, mime);
        JSONObject args = lease.getJSONObject("args");
        JSONObject asset = lease.getJSONObject("asset");
        String action = args.optString("action", "");
        if (!video && !gif && action.contains("reddit-uploaded-video")) {
            throw new IllegalStateException("Reddit leased this image as video");
        }
        String id = asset.optString("asset_id", "");
        if (id.isEmpty()) throw new IllegalStateException("Reddit did not accept the file");
        boolean clip = video || action.contains("reddit-uploaded-video");
        VideoListen listen = null;
        if (clip) {
            String address = asset.optString("websocket_url", "");
            if (address.isEmpty()) address = lease.optString("websocket_url", "");
            if (address.isEmpty()) throw new IllegalStateException("Reddit did not return a video");
            activity.runOnUiThread(() -> progress.setMessage("Finishing the video…"));
            listen = new VideoListen(address);
            listen.begin();
        }
        Log.i(TAG, "send " + id);
        send(args, bytes, name);
        if (listen != null) {
            id = listen.await();
            Log.i(TAG, "video " + id);
        }
        String kind = clip ? "video" : (gif ? "gif" : "img");
        String marker = "![](reddit-media:" + kind + ":" + id + ")";
        Log.i(TAG, "media " + marker);
        return marker;
    }

    /**
     * Reddit sends the finished video id once, on the lease socket. The connection has to
     * be open before the file upload, or that message is already gone.
     */
    private static final class VideoListen extends Thread {
        private final String address;
        private final CountDownLatch opened = new CountDownLatch(1);
        private final CountDownLatch finished = new CountDownLatch(1);
        private volatile String videoId = "";
        private volatile Exception failure;

        VideoListen(String address) {
            super("reddit-video");
            this.address = address;
        }

        void begin() throws Exception {
            start();
            if (!opened.await(20, TimeUnit.SECONDS)) {
                throw new IllegalStateException("Reddit did not finish the video");
            }
            if (failure != null) throw failure;
        }

        String await() throws Exception {
            if (!finished.await(120, TimeUnit.SECONDS) || videoId.isEmpty()) {
                if (failure != null) throw failure;
                throw new IllegalStateException("Reddit did not finish the video");
            }
            return videoId;
        }

        @Override
        public void run() {
            SSLSocket socket = null;
            try {
                URI uri = URI.create(address);
                String path = uri.getRawPath() == null || uri.getRawPath().isEmpty() ? "/" : uri.getRawPath();
                if (uri.getRawQuery() != null) path += "?" + uri.getRawQuery();
                int port = uri.getPort() == -1 ? 443 : uri.getPort();
                socket = (SSLSocket) SSLSocketFactory.getDefault().createSocket(uri.getHost(), port);
                socket.setSoTimeout(130000);
                OutputStream out = socket.getOutputStream();
                byte[] key = new byte[16];
                new SecureRandom().nextBytes(key);
                String request = "GET " + path + " HTTP/1.1\r\n"
                        + "Host: " + uri.getHost() + "\r\n"
                        + "Upgrade: websocket\r\n"
                        + "Connection: Upgrade\r\n"
                        + "Sec-WebSocket-Key: " + Base64.encodeToString(key, Base64.NO_WRAP) + "\r\n"
                        + "Sec-WebSocket-Version: 13\r\n"
                        + "Origin: https://www.reddit.com\r\n\r\n";
                out.write(request.getBytes(StandardCharsets.UTF_8));
                out.flush();
                InputStream in = socket.getInputStream();
                if (!headers(in).contains(" 101 ")) {
                    throw new IllegalStateException("Reddit did not finish the video");
                }
                opened.countDown();
                ByteArrayOutputStream message = new ByteArrayOutputStream();
                while (videoId.isEmpty()) {
                    int first = in.read();
                    int second = in.read();
                    if (first < 0 || second < 0) break;
                    boolean finalFrame = (first & 0x80) != 0;
                    int opcode = first & 0x0f;
                    boolean masked = (second & 0x80) != 0;
                    int length = second & 0x7f;
                    if (length == 126) length = ((in.read() & 0xff) << 8) | (in.read() & 0xff);
                    else if (length == 127) {
                        length = 0;
                        for (int i = 0; i < 8; i++) length = (length << 8) | (in.read() & 0xff);
                    }
                    if (length < 0 || length > 1000000) break;
                    byte[] mask = new byte[4];
                    if (masked) readFully(in, mask);
                    byte[] body = new byte[length];
                    readFully(in, body);
                    if (masked) {
                        for (int i = 0; i < body.length; i++) body[i] ^= mask[i % 4];
                    }
                    if (opcode == 8) break;
                    if (opcode == 9) {
                        sendFrame(out, 0x8a, body);
                        continue;
                    }
                    if (opcode == 1) message.reset();
                    if (opcode == 1 || opcode == 0) message.write(body);
                    if (!finalFrame || message.size() == 0) continue;
                    String found = idFrom(message.toString("UTF-8"));
                    message.reset();
                    if (!found.isEmpty()) {
                        videoId = found;
                        break;
                    }
                }
            } catch (Exception error) {
                failure = error;
            } finally {
                opened.countDown();
                finished.countDown();
                if (socket != null) {
                    try {
                        socket.close();
                    } catch (Exception ignored) {
                    }
                }
            }
        }

        private String idFrom(String text) throws Exception {
            JSONObject json = new JSONObject(text);
            String type = json.optString("type", "");
            Log.i(TAG, "video status " + type);
            if ("failed".equals(type) || "failure".equals(type)) {
                throw new IllegalStateException("Reddit could not process the video");
            }
            if (!"success".equals(type)) return "";
            JSONObject payload = json.optJSONObject("payload");
            if (payload == null) return "";
            String redirect = java.net.URLDecoder.decode(payload.optString("redirect", ""), "UTF-8");
            Matcher video = Pattern.compile("(?:v\\.redd\\.it/|/video/)([A-Za-z0-9]+)").matcher(redirect);
            if (video.find()) return video.group(1);
            String direct = payload.optString("media_id", payload.optString("video_id", ""));
            return direct.matches("[A-Za-z0-9]+") ? direct : "";
        }
    }

    private static String headers(InputStream in) throws Exception {
        ByteArrayOutputStream headers = new ByteArrayOutputStream();
        int matched = 0;
        byte[] end = new byte[]{'\r', '\n', '\r', '\n'};
        while (matched < 4) {
            int value = in.read();
            if (value < 0) break;
            headers.write(value);
            matched = value == end[matched] ? matched + 1 : (value == '\r' ? 1 : 0);
        }
        return headers.toString(StandardCharsets.UTF_8);
    }

    private static void readFully(InputStream in, byte[] body) throws Exception {
        int read = 0;
        while (read < body.length) {
            int got = in.read(body, read, body.length - read);
            if (got < 0) throw new IllegalStateException("Reddit did not finish the video");
            read += got;
        }
    }

    private static void sendFrame(OutputStream out, int header, byte[] body) throws Exception {
        byte[] mask = new byte[4];
        new SecureRandom().nextBytes(mask);
        out.write(header);
        out.write(0x80 | body.length);
        out.write(mask);
        for (int i = 0; i < body.length; i++) out.write(body[i] ^ mask[i % 4]);
        out.flush();
    }

    private static String mime(Activity activity, Uri file, String name) {
        String mime = activity.getContentResolver().getType(file);
        if (mime == null || mime.isEmpty() || "application/octet-stream".equals(mime)) {
            if (name.endsWith(".png")) mime = "image/png";
            else if (name.endsWith(".gif")) mime = "image/gif";
            else if (name.endsWith(".webp")) mime = "image/webp";
            else if (name.endsWith(".mp4")) mime = "video/mp4";
            else mime = "image/jpeg";
        }
        if ("image/jpg".equals(mime)) mime = "image/jpeg";
        return mime;
    }

    private static String token(Context context) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences("Authentication", 0);
        String raw = prefs.getString("access_token", "");
        if (raw == null) raw = "";
        String access = raw.startsWith("{") ? new JSONObject(raw).optString("access_token", "") : raw;
        long expiry = prefs.getLong("access_token_expiry", 0L);
        if (access.isEmpty() || expiry < System.currentTimeMillis()) {
            throw new IllegalStateException("Sign in again before uploading");
        }
        return access;
    }

    private static JSONObject lease(String token, String name, String mime) throws Exception {
        byte[] body = ("filepath=" + url(name) + "&mimetype=" + url(mime)).getBytes(StandardCharsets.UTF_8);
        HttpURLConnection conn = (HttpURLConnection) new URL("https://oauth.reddit.com/api/media/asset.json").openConnection();
        conn.setConnectTimeout(20000);
        conn.setReadTimeout(20000);
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Authorization", "Bearer " + token);
        conn.setRequestProperty("User-Agent", "Joey:o.o.joey:2.1.6.5");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setFixedLengthStreamingMode(body.length);
        try (OutputStream out = conn.getOutputStream()) {
            out.write(body);
        }
        String text = readResponse(conn);
        if (conn.getResponseCode() / 100 != 2) {
            throw new IllegalStateException("Reddit refused the upload");
        }
        return new JSONObject(text);
    }

    private static String send(JSONObject args, byte[] file, String name) throws Exception {
        String action = args.getString("action");
        if (action.startsWith("//")) action = "https:" + action;
        JSONArray fields = args.getJSONArray("fields");
        String boundary = UUID.randomUUID().toString();
        ByteArrayOutputStream form = new ByteArrayOutputStream();
        for (int i = 0; i < fields.length(); i++) {
            JSONObject field = fields.getJSONObject(i);
            part(form, boundary, field.getString("name"), field.getString("value"));
        }
        form.write(("--" + boundary + "\r\nContent-Disposition: form-data; name=\"file\"; filename=\""
                + name + "\"\r\nContent-Type: application/octet-stream\r\n\r\n").getBytes(StandardCharsets.UTF_8));
        form.write(file);
        form.write(("\r\n--" + boundary + "--\r\n").getBytes(StandardCharsets.UTF_8));
        byte[] body = form.toByteArray();
        HttpURLConnection conn = (HttpURLConnection) new URL(action).openConnection();
        conn.setConnectTimeout(20000);
        conn.setReadTimeout(60000);
        conn.setDoOutput(true);
        conn.setRequestMethod("POST");
        conn.setFixedLengthStreamingMode(body.length);
        conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        try (OutputStream out = conn.getOutputStream()) {
            out.write(body);
        }
        int code = conn.getResponseCode();
        String response = readResponse(conn);
        conn.disconnect();
        if (code / 100 != 2) throw new IllegalStateException("The upload did not finish");
        return response;
    }

    private static void part(OutputStream out, String boundary, String name, String value) throws Exception {
        out.write(("--" + boundary + "\r\nContent-Disposition: form-data; name=\"" + name + "\"\r\n\r\n"
                + value + "\r\n").getBytes(StandardCharsets.UTF_8));
    }

    private static byte[] read(Activity activity, Uri file) throws Exception {
        try (InputStream in = activity.getContentResolver().openInputStream(file)) {
            if (in == null) throw new IllegalStateException("The selected file could not be read");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
            return out.toByteArray();
        }
    }

    private static String readResponse(HttpURLConnection conn) throws Exception {
        InputStream in;
        try {
            in = conn.getResponseCode() / 100 == 2 ? conn.getInputStream() : conn.getErrorStream();
        } catch (Throwable failure) {
            in = conn.getErrorStream();
        }
        if (in == null) return "";
        try (InputStream stream = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = stream.read(buf)) > 0 && out.size() < 1024 * 1024) out.write(buf, 0, n);
            return out.toString("UTF-8");
        }
    }

    private static String name(Uri file) {
        String last = file.getLastPathSegment();
        if (last == null || last.isEmpty()) last = "upload";
        last = last.replaceAll("[^A-Za-z0-9._-]", "");
        if (last.isEmpty()) last = "upload";
        return last.toLowerCase(Locale.US);
    }

    private static String url(String value) throws Exception {
        return java.net.URLEncoder.encode(value, "UTF-8");
    }

    private static void dismiss(ProgressDialog progress) {
        try {
            if (progress.isShowing()) progress.dismiss();
        } catch (Throwable ignored) {
        }
    }
}
