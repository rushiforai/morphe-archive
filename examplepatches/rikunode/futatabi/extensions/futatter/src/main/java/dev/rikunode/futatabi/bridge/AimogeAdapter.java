package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/** Read-only adapter for the documented 2026-11-11 public Aimoge API. */
final class AimogeAdapter {
    private static final String API = "https://api.nijiurachan.net";
    private static final String API_VERSION = "2026-11-11";
    private static final String BOARD = "aimg";
    private static final Charset SJIS = Charset.forName("Shift_JIS");
    private static final long CATALOG_TTL = 90000L;
    private final BridgeIndex ids;
    private final Context context;
    private final Map<String, Cached> cache = new HashMap<>();
    private long lastApiFetch;
    private volatile boolean policyChecked;

    private static final class Cached {
        final byte[] data;
        final long until;
        Cached(byte[] data, long until) { this.data = data; this.until = until; }
    }

    AimogeAdapter(Context context) {
        this.context=context;
        ids = new BridgeIndex(context);
    }

    BridgeServer.BridgeResponse route(String rawPath) {
        try {
            String path = rawPath.split("\\?", 2)[0];
            if ("/aimoge/".equals(path) || "/aimoge/futaba.php".equals(path)) {
                if ("/aimoge/futaba.php".equals(path) && !rawPath.contains("mode=cat"))
                    return BridgeServer.BridgeResponse.text(404, "Unsupported page");
                return BridgeServer.BridgeResponse.html(BridgePalette.decorate(context,catalog()));
            }
            if (path.matches("^/aimoge/res/[0-9]{13}\\.htm$")) {
                String id = path.substring("/aimoge/res/".length(), path.length() - 4);
                String uuid = ids.threadUuid(id);
                if (uuid == null) return BridgeServer.BridgeResponse.text(404, "Unknown thread");
                return BridgeServer.BridgeResponse.html(BridgePalette.decorate(context,thread(id, uuid)));
            }
            boolean thumb = path.matches("^/aimoge/(thumb|cat)/[0-9]{13}s\\.jpg$");
            boolean original = path.matches("^/aimoge/src/[0-9]{13}\\.jpg$");
            if (thumb || original) {
                String file = path.substring(path.lastIndexOf('/') + 1);
                String id = file.substring(0, 13);
                String url = ids.imageUrl(id, thumb);
                if (url == null) return BridgeServer.BridgeResponse.text(404, "Unknown image");
                try {
                    return BridgeServer.BridgeResponse.image(image(url));
                } catch (Exception imageError) {
                    if (thumb) throw imageError;
                    String fallback = ids.imageUrl(id, true);
                    if (fallback == null || fallback.equals(url)) throw imageError;
                    return BridgeServer.BridgeResponse.image(image(fallback));
                }
            }
            return BridgeServer.BridgeResponse.text(404, "Unknown route");
        } catch (Exception ex) {
            return BridgeServer.BridgeResponse.text(503, "Upstream unavailable");
        }
    }

    JSONObject threadsJson() throws Exception {
        ensureClientPolicy();
        JSONObject upstream = new JSONObject(new String(fetch(API + "/catalog/" + BOARD +
                "?sort=bump&limit=20&page=1", 90000L, true), StandardCharsets.UTF_8));
        org.json.JSONArray summaries = new org.json.JSONArray();
        org.json.JSONArray threads = upstream.getJSONArray("threads");
        for (int i = 0; i < threads.length(); i++) {
            JSONObject entry = threads.getJSONObject(i);
            JSONObject summary = new JSONObject();
            summary.put("id", entry.getString("id"));
            summary.put("title", entry.getJSONObject("opPost").optString("body", ""));
            summary.put("replies", entry.optInt("replyCount", 0));
            summaries.put(summary);
        }
        JSONObject answer = new JSONObject();
        answer.put("threads", summaries);
        return answer;
    }

    private byte[] catalog() throws Exception {
        ensureClientPolicy();
        JSONObject result = new JSONObject(new String(fetch(API + "/catalog/" + BOARD +
                "?sort=bump&limit=20&page=1", 90000L, true), StandardCharsets.UTF_8));
        JSONArray threads = result.getJSONArray("threads");
        StringBuilder html = pageStart("あいもげ");
        html.append("<table id='cattable'><tr>");
        for (int i = 0; i < threads.length(); i++) {
            JSONObject t = threads.getJSONObject(i);
            String uuid = t.getString("id");
            String tid = ids.threadId(uuid);
            JSONObject op = t.getJSONObject("opPost");
            JSONObject attachment = attachment(op);
            String thumb = thumbnailTag(attachment);
            String description = op.optString("body", "");
            if (description.length() > 90) description = description.substring(0, 90);
            html.append("<td><a href='res/").append(tid).append(".htm'>")
                    .append(thumb).append("</a><small>")
                    .append(escape(description)).append("</small><font size=2>")
                    .append(Math.max(0, t.optInt("replyCount", 0))).append("</font></td>");
            if (i % 5 == 4 && i < threads.length() - 1) html.append("</tr><tr>");
        }
        html.append("</tr></table></body></html>");
        return html.toString().getBytes(SJIS);
    }

    synchronized void invalidateThread(String uuid) {
        cache.remove(API + "/thread/" + uuid + "/public");
    }

    String stockThreadUuid(String id) { return ids.threadUuid(id); }

    synchronized String confirmedNewThread(JSONObject accepted) throws Exception {
        String thread=java.util.UUID.fromString(accepted.getString("threadId")).toString();
        if(accepted.getInt("seq")!=0||!"public".equals(accepted.getString("status")))return null;
        String post=java.util.UUID.fromString(accepted.getString("postId")).toString();
        JSONArray posts=new JSONObject(new String(fetch(API+"/thread/"+thread+"/public",0,true),StandardCharsets.UTF_8)).getJSONArray("posts");
        for(int i=0;i<posts.length();i++){
            JSONObject p=posts.getJSONObject(i);
            if(post.equals(p.optString("id"))&&thread.equals(p.optString("threadId"))&&p.optInt("seq",-1)==0){
                cache.remove(API+"/catalog/"+BOARD+"?sort=bump&limit=20&page=1");
                return ids.threadId(thread);
            }
        }
        return null;
    }

    /** Only an actual returned UUID/seq and official public number can acknowledge a stock post. */
    synchronized String confirmedNumber(String thread, JSONObject accepted) throws Exception {
        String post = java.util.UUID.fromString(accepted.getString("postId")).toString();
        if (!thread.equals(accepted.getString("threadId")) || !"public".equals(accepted.getString("status")))
            return null;
        int seq = accepted.getInt("seq");
        if (seq <= 0) return null;
        String route = API + "/thread/" + thread + "/public";
        cache.remove(route);
        JSONArray posts = new JSONObject(new String(fetch(route, 0, true), StandardCharsets.UTF_8)).getJSONArray("posts");
        for (int i=0;i<posts.length();i++) {
            JSONObject p=posts.getJSONObject(i);
            if (!post.equals(p.optString("id")) || seq!=p.optInt("seq",-1)
                    || !thread.equals(p.optString("threadId"))) continue;
            Object value=p.opt("postSequenceNo");
            if (!(value instanceof Number)) return null;
            String number=value.toString();
            return number.matches("[1-9][0-9]{0,17}") ? number : null;
        }
        return null;
    }

    JSONObject replyTargets(String uuid) throws Exception {
        java.util.UUID.fromString(uuid);
        ensureClientPolicy();
        JSONArray posts = new JSONObject(new String(fetch(API + "/thread/" + uuid + "/public",
                30000L, true), StandardCharsets.UTF_8)).getJSONArray("posts");
        JSONArray targets = new JSONArray();
        String title = "";
        for (int i = 0; i < posts.length(); i++) {
            JSONObject post = posts.getJSONObject(i);
            String excerpt = PostPresentation.excerpt(post.optString("body", ""));
            int seq = post.optInt("seq", i);
            if (seq == 0) title = excerpt;
            long number = post.optLong("postSequenceNo", 0);
            if (number > 0) targets.put(new JSONObject().put("number", Long.toString(number))
                    .put("seq", seq).put("excerpt", excerpt));
        }
        return new JSONObject().put("title", title).put("targets", targets);
    }

    private byte[] thread(String id, String uuid) throws Exception {
        ensureClientPolicy();
        JSONObject result = new JSONObject(new String(fetch(API + "/thread/" + uuid + "/public",
                30000L, true), StandardCharsets.UTF_8));
        JSONArray posts = result.getJSONArray("posts");
        StringBuilder html = pageStart("あいもげのスレ");
        html.append("<div class='thre' data-res='").append(id).append("'>");
        for (int i = 0; i < posts.length(); i++) {
            JSONObject post = posts.getJSONObject(i);
            int seq = post.optInt("seq", i);
            String postId = post.isNull("postSequenceNo") ?
                    (id + seq) : Long.toString(post.getLong("postSequenceNo"));
            if (i > 0) html.append("<table border=0><tr><td class=rts></td><td class=rtd>")
                    .append("<span id='delcheck").append(postId).append("' class='rsc'>")
                    .append(i).append("</span>");
            JSONObject attachment = attachment(post);
            if (attachment != null) {
                String imageId = imageId(attachment);
                html.append("<a href='/aimoge/src/").append(imageId).append(".jpg'>")
                        .append(imageId).append(".jpg</a><br>")
                        .append("<a href='/aimoge/src/").append(imageId).append(".jpg'>")
                        .append(thumbnailTag(attachment)).append("</a>");
            }
            html.append("<span class='csb'>無念</span>Name<span class='cnm'>としあき</span>")
                    .append("<span class='cnw'>").append(escape(post.optString("createdAt", "")))
                    .append("</span><span class='cno'>No.").append(postId).append("</span>")
                    .append("<blockquote>").append(FutabaQuoteMarkup.render(escape(post.optString("body", ""))))
                    .append("</blockquote>");
            if (i > 0) html.append("</td></tr></table>");
        }
        html.append("</div></body></html>");
        return html.toString().getBytes(SJIS);
    }

    private String thumbnailTag(JSONObject attachment) {
        if (attachment == null) return "";
        String id = imageId(attachment);
        return "<img src='/aimoge/thumb/" + id + "s.jpg' width=50 height=50>";
    }

    private String imageId(JSONObject attachment) {
        String key = attachment.optString("id");
        String original = attachment.optString("originalUrl");
        String thumbnail = attachment.optString("thumbnailUrl");
        // A futaba .jpg route cannot decode MP4. Reuse the official preview
        // frame as its still image, without downloading a video.
        if ("video".equals(attachment.optString("kind")) ||
                attachment.optString("mime").startsWith("video/")) original = thumbnail;
        return ids.imageId(key, original, thumbnail);
    }

    private static JSONObject attachment(JSONObject post) {
        JSONObject one = post.optJSONObject("attachment");
        if (one != null) return one;
        JSONArray attachments = post.optJSONArray("attachments");
        return attachments != null && attachments.length() > 0 ?
                attachments.optJSONObject(0) : null;
    }

    private byte[] image(String url) throws Exception {
        // Storage URL comes only from validated API attachment metadata.
        byte[] source = fetch(url, 600000L, false);
        Bitmap bitmap = BitmapFactory.decodeByteArray(source, 0, source.length);
        if (bitmap == null) throw new IllegalArgumentException("Unsupported image data");
        try {
            int width = bitmap.getWidth(), height = bitmap.getHeight();
            if (width > 960 || height > 960) {
                float scale = Math.min(960f / width, 960f / height);
                Bitmap resized = Bitmap.createScaledBitmap(bitmap,
                        Math.max(1, Math.round(width * scale)),
                        Math.max(1, Math.round(height * scale)), true);
                if (resized != bitmap) {
                    bitmap.recycle();
                    bitmap = resized;
                }
            }
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            if (!bitmap.compress(Bitmap.CompressFormat.JPEG, 85, output))
                throw new IllegalArgumentException("JPEG encoding failed");
            return output.toByteArray();
        } finally {
            bitmap.recycle();
        }
    }

    private synchronized void ensureClientPolicy() throws Exception {
        if (policyChecked) return;
        JSONObject policy = new JSONObject(new String(fetch(API + "/client-policy",
                3600000L, true), StandardCharsets.UTF_8));
        if (!BOARD.equals(policy.optString("boardKey")))
            throw new IllegalStateException("Unexpected client-policy board");
        policyChecked = true;
    }

    private synchronized byte[] fetch(String url, long ttl, boolean api) throws Exception {
        long now = System.currentTimeMillis();
        Cached existing = cache.get(url);
        if (existing != null && existing.until > now) return existing.data;
        if (api) {
            long delay = 1500L - (now - lastApiFetch);
            if (delay > 0) Thread.sleep(delay);
            lastApiFetch = System.currentTimeMillis();
        }
        URL target = new URL(url);
        if (!"https".equalsIgnoreCase(target.getProtocol()) ||
                !(api ? "api.nijiurachan.net".equals(target.getHost())
                        : "storage.nijiurachan.net".equals(target.getHost())))
            throw new IllegalArgumentException("Disallowed upstream host");
        HttpURLConnection connection = (HttpURLConnection) target.openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(6000);
        connection.setReadTimeout(10000);
        connection.setRequestMethod("GET");
        connection.setRequestProperty("User-Agent", "futatabi/0.2.0 (read-only)");
        if (api) {
            connection.setRequestProperty("X-Api-Version", API_VERSION);
            connection.setRequestProperty("X-Board-Key", BOARD);
            connection.setRequestProperty("Accept", "application/json");
        }
        try {
            if (connection.getResponseCode() != 200) throw new IllegalStateException("API HTTP non-200");
            int max = api ? 1500000 : 5000000;
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            try (InputStream input = connection.getInputStream()) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = input.read(buf)) != -1) {
                    if (output.size() + n > max) throw new IllegalArgumentException("Response too large");
                    output.write(buf, 0, n);
                }
            }
            byte[] value = output.toByteArray();
            if (cache.size() >= 64) cache.clear();
            cache.put(url, new Cached(value, System.currentTimeMillis() + ttl));
            return value;
        } finally {
            connection.disconnect();
        }
    }

    private static StringBuilder pageStart(String title) {
        return new StringBuilder("<!DOCTYPE html><html><head>")
                .append("<meta http-equiv='Content-Type' content='text/html; charset=Shift_JIS'>")
                .append("<title>").append(escape(title)).append("</title></head><body>");
    }

    private static String escape(String text) {
        CharsetEncoder encoder = SJIS.newEncoder();
        StringBuilder out = new StringBuilder();
        for (int offset = 0; offset < text.length();) {
            int cp = text.codePointAt(offset);
            offset += Character.charCount(cp);
            if (cp == '&') out.append("&amp;");
            else if (cp == '<') out.append("&lt;");
            else if (cp == '>') out.append("&gt;");
            else if (cp == '"') out.append("&quot;");
            else if (cp == '\'') out.append("&#39;");
            else if (cp == '\n') out.append("<br>");
            else if (!encoder.canEncode(new String(Character.toChars(cp))))
                out.append("&#").append(cp).append(";");
            else out.appendCodePoint(cp);
        }
        return out.toString();
    }
}
