package semicoloncolonel.mobilestream.extension.fema;

import android.content.Context;
import android.net.Uri;
import android.util.Log;

import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Storage shared by the offline cache, the image cache, and the save service.
 *
 * Each saved page is two files in the app's private storage: KEY.json holds
 * the response in the form Capacitor's HTTP plugin returns it, and KEY.req
 * records the request, so the save service can repeat it. Images are saved
 * under images/. Every write goes to a temporary file first and replaces the
 * saved copy only after it is complete, so a failed download never removes
 * content that was already saved.
 */
final class OfflineStore {
    static final String TAG = "MSP-FEMA-CACHE";
    private static final String DIR = "msp-offline-cache";
    private static final String[] CONTENT_HOSTS = {"m.fema.gov", "www.fema.gov", "fema.gov"};
    private static final String[] IMAGE_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif", ".webp", ".svg"};
    private static final Pattern IMAGE_URL = Pattern.compile(
            // Saved JSON escapes slashes as \/, so backslashes are allowed in the path.
            "https?:(?:\\\\?/){2}(?:m\\.|www\\.)?fema\\.gov[^\"'\\s<>]*?\\.(?:jpe?g|png|gif|webp|svg)",
            Pattern.CASE_INSENSITIVE);
    private static final int TIMEOUT_MS = 20_000;

    private OfflineStore() {
    }

    static boolean isContentHost(String host) {
        if (host == null) return false;
        for (String contentHost : CONTENT_HOSTS) {
            if (contentHost.equalsIgnoreCase(host)) return true;
        }
        return false;
    }

    static boolean isImage(Uri uri) {
        String path = uri.getPath();
        if (path == null) return false;
        path = path.toLowerCase(Locale.US);
        for (String extension : IMAGE_EXTENSIONS) {
            if (path.endsWith(extension)) return true;
        }
        return false;
    }

    static File dir(Context context) {
        File dir = new File(context.getFilesDir(), DIR);
        if (!dir.isDirectory()) dir.mkdirs();
        return dir;
    }

    static File imageDir(Context context) {
        File dir = new File(dir(context), "images");
        if (!dir.isDirectory()) dir.mkdirs();
        return dir;
    }

    /** No parameters, or empty ones, key the same way the app's own requests do. */
    static String key(String url, String params) {
        if (params == null || params.isEmpty() || "{}".equals(params)) params = "null";
        return sha256(url + "\n" + params);
    }

    static File page(Context context, String key) {
        return new File(dir(context), key + ".json");
    }

    static File image(Context context, String url) {
        return new File(imageDir(context), sha256(url));
    }

    static void savePage(Context context, String key, String url, String params, String responseJson) {
        File dir = dir(context);
        writeAtomically(new File(dir, key + ".json"), responseJson.getBytes(StandardCharsets.UTF_8));
        try {
            JSONObject request = new JSONObject();
            request.put("url", url);
            if (params != null && !params.isEmpty() && !"null".equals(params) && !"{}".equals(params)) {
                request.put("params", params);
            }
            writeAtomically(new File(dir, key + ".req"), request.toString().getBytes(StandardCharsets.UTF_8));
        } catch (Exception ex) {
            Log.w(TAG, "could not record request", ex);
        }
    }

    /** The url and params of every saved page, for a refresh. */
    static List<String[]> savedRequests(Context context) {
        List<String[]> requests = new ArrayList<>();
        File[] files = dir(context).listFiles((d, name) -> name.endsWith(".req"));
        if (files == null) return requests;
        for (File file : files) {
            try {
                JSONObject request = new JSONObject(new String(read(file), StandardCharsets.UTF_8));
                requests.add(new String[]{request.getString("url"), request.optString("params", null)});
            } catch (Exception ex) {
                Log.w(TAG, "could not read request record", ex);
            }
        }
        return requests;
    }

    /** Image URLs referenced by any saved page. */
    static Set<String> referencedImages(Context context) {
        Set<String> urls = new LinkedHashSet<>();
        File[] files = dir(context).listFiles((d, name) -> name.endsWith(".json"));
        if (files == null) return urls;
        for (File file : files) {
            try {
                Matcher matcher = IMAGE_URL.matcher(new String(read(file), StandardCharsets.UTF_8));
                while (matcher.find()) urls.add(matcher.group().replace("\\/", "/"));
            } catch (Exception ex) {
                Log.w(TAG, "could not scan saved page", ex);
            }
        }
        return urls;
    }

    /**
     * Downloads a page and returns it in the form Capacitor's HTTP plugin
     * returns responses: status, headers, url, and data, with JSON data parsed.
     * Null unless the server answered with success.
     */
    static String fetchPage(String url, String params) throws Exception {
        String target = url;
        if (params != null && !params.isEmpty() && !"null".equals(params)) {
            JSONObject query = new JSONObject(params);
            Uri.Builder builder = Uri.parse(url).buildUpon();
            for (java.util.Iterator<String> keys = query.keys(); keys.hasNext(); ) {
                String name = keys.next();
                builder.appendQueryParameter(name, query.optString(name));
            }
            target = builder.build().toString();
        }

        HttpURLConnection connection = open(target);
        try {
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) return null;
            String contentType = connection.getContentType();
            String body;
            try (InputStream in = connection.getInputStream()) {
                body = new String(readAll(in), StandardCharsets.UTF_8);
            }

            JSONObject headers = new JSONObject();
            if (contentType != null) headers.put("Content-Type", contentType);
            JSONObject response = new JSONObject();
            response.put("status", status);
            response.put("headers", headers);
            response.put("url", connection.getURL().toString());
            Object data = body;
            if (contentType != null && contentType.toLowerCase(Locale.US).contains("json")) {
                try {
                    data = new JSONTokener(body).nextValue();
                } catch (Exception ex) {
                    data = body;
                }
            }
            response.put("data", data);
            return response.toString();
        } finally {
            connection.disconnect();
        }
    }

    /** Downloads an image into the cache. False if it could not be saved. */
    static boolean fetchImage(Context context, String url) {
        HttpURLConnection connection = null;
        try {
            connection = open(url);
            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) return false;
            byte[] bytes;
            try (InputStream in = connection.getInputStream()) {
                bytes = readAll(in);
            }
            return bytes.length > 0 && writeAtomically(image(context, url), bytes);
        } catch (Exception ex) {
            Log.w(TAG, "could not save image " + url, ex);
            return false;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    static String mimeType(Uri uri) {
        String path = uri.getPath() == null ? "" : uri.getPath().toLowerCase(Locale.US);
        if (path.endsWith(".png")) return "image/png";
        if (path.endsWith(".gif")) return "image/gif";
        if (path.endsWith(".webp")) return "image/webp";
        if (path.endsWith(".svg")) return "image/svg+xml";
        return "image/jpeg";
    }

    static byte[] read(File file) throws Exception {
        try (FileInputStream in = new FileInputStream(file)) {
            return readAll(in);
        }
    }

    private static HttpURLConnection open(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(TIMEOUT_MS);
        connection.setReadTimeout(TIMEOUT_MS);
        connection.setInstanceFollowRedirects(true);
        return connection;
    }

    private static byte[] readAll(InputStream in) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[64 * 1024];
        for (int n; (n = in.read(buffer)) > 0; ) bytes.write(buffer, 0, n);
        return bytes.toByteArray();
    }

    private static boolean writeAtomically(File file, byte[] bytes) {
        File temp = new File(file.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(temp)) {
            out.write(bytes);
        } catch (Exception ex) {
            Log.w(TAG, "could not save " + file.getName(), ex);
            temp.delete();
            return false;
        }
        if (temp.renameTo(file)) return true;
        temp.delete();
        return false;
    }

    private static String sha256(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (byte b : digest) hex.append(String.format("%02x", b));
            return hex.toString();
        } catch (Exception ex) {
            throw new IllegalStateException(ex);
        }
    }
}
