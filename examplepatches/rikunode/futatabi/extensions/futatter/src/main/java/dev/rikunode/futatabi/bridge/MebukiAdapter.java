package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/** Public trial catalogue; authenticated data is only returned to the in-process reader. */
final class MebukiAdapter {
    private static final String HOST = "https://mebuki.moe";
    private static final String STORAGE = "https://storage.mebuki.moe/";
    private static final Charset SJIS = Charset.forName("Shift_JIS");
    private final SharedPreferences index;
    private final Context context;
    private final java.util.LinkedHashMap<String,String> privateImages = new java.util.LinkedHashMap<>();
    private String imageSession = "";

    MebukiAdapter(Context context) {
        this.context = context;
        index = context.getSharedPreferences("futatabi_mebuki_index", Context.MODE_PRIVATE);
    }

    BridgeServer.BridgeResponse route(String rawPath) { return route(rawPath,false); }
    BridgeServer.BridgeResponse route(String rawPath, boolean internal) {
        try {
            String path = rawPath.split("\\?", 2)[0];
            if ("/mebuki/".equals(path) || ("/mebuki/futaba.php".equals(path) &&
                    BridgeServer.hasCatalogMode(rawPath)))
                return BridgeServer.BridgeResponse.html(catalog());
            if (path.matches("/mebuki/res/[0-9]{13}\\.htm")) {
                String id = path.substring("/mebuki/res/".length(), path.length() - 4);
                if (internal && MebukiSession.safeCookie(MebukiSession.saved(context))) {
                    String cookie=MebukiSession.saved(context);
                    try {
                        MebukiThreadData data=readPrivateThread(context,id);
                        byte[] html=data.nativeHtml(id,url->rememberPrivateImage(cookie,url));
                        if(cookie.equals(MebukiSession.saved(context)))
                            return BridgeServer.BridgeResponse.html(html);
                    } catch(Exception ignored) { /* keep the explicit notice on any failure */ }
                }
                return BridgeServer.BridgeResponse.html(unavailableThread(id));
            }
            if (path.matches("/mebuki/(thumb|cat|src)/[0-9]{13}s?\\.jpg")) {
                String id = path.substring(path.lastIndexOf('/') + 1, path.lastIndexOf('/') + 14);
                String remote = index.getString("img." + id, null);
                if (remote == null && internal) {
                    String cookie=MebukiSession.saved(context);
                    String candidate=privateImage(cookie,id);
                    if(candidate!=null && MebukiSession.verify(cookie)==MebukiSession.State.AUTHENTICATED
                            && cookie.equals(MebukiSession.saved(context))) {
                        byte[] image=fetchImage(candidate);
                        if(cookie.equals(MebukiSession.saved(context))) return BridgeServer.BridgeResponse.image(image);
                    }
                }
                if (remote == null) return BridgeServer.BridgeResponse.text(404, "Unknown image");
                return BridgeServer.BridgeResponse.image(fetchImage(remote));
            }
            return BridgeServer.BridgeResponse.text(404, "Unknown route");
        } catch (Exception ex) {
            return BridgeServer.BridgeResponse.text(503, "Mebuki trial unavailable");
        }
    }

    private synchronized String rememberPrivateImage(String cookie,String url) {
        if(!cookie.equals(MebukiSession.saved(context)))return null;
        if(!cookie.equals(imageSession)){privateImages.clear();imageSession=cookie;}
        try {
            byte[] digest=MessageDigest.getInstance("SHA-256").digest(("private."+url).getBytes(StandardCharsets.UTF_8));
            long n=java.nio.ByteBuffer.wrap(digest).getLong() & Long.MAX_VALUE;
            String id=Long.toString(1000000000000L+n%9000000000000L);
            if(index.contains("img."+id))return null;
            String existing=privateImages.get(id);
            if(existing!=null&&!existing.equals(url))return null;
            if(privateImages.size()>=512&&existing==null)privateImages.remove(privateImages.keySet().iterator().next());
            privateImages.put(id,url);return id;
        }catch(Exception ex){return null;}
    }
    private synchronized String privateImage(String cookie,String id) {
        if(!cookie.equals(imageSession)){privateImages.clear();imageSession=cookie;return null;}
        return MebukiSession.safeCookie(cookie)?privateImages.get(id):null;
    }

    MebukiThreadData readPrivateThread(Context context, String id) throws Exception {
        String slug = slugForThreadId(id);
        String cookie = MebukiSession.saved(context);
        MebukiThreadData result = MebukiSession.readThread(slug, cookie);
        if (!cookie.equals(MebukiSession.saved(context)))
            throw new MebukiSession.ReadFailure("SESSION_CHANGED");
        return result;
    }

    // Does not enter the public image index; the session cookie is not sent.
    byte[] readPrivateImage(String url) throws Exception {
        if (!MebukiThreadData.safeImage(url)) throw new IllegalArgumentException("Invalid attachment");
        return download(url, 3_000_000, true);
    }

    JSONObject threadsJson() throws Exception {
        byte[] response = download(HOST + "/api/trial/trending", 250_000, false);
        JSONArray raw = new JSONObject(new String(response, StandardCharsets.UTF_8)).getJSONArray("threads");
        JSONArray threads = new JSONArray();
        for (int i = 0; i < raw.length() && i < 45; i++) {
            JSONObject entry = raw.getJSONObject(i);
            String slug = entry.getString("slug");
            if (!slug.matches("[A-Za-z0-9_-]{8,24}")) continue;
            String id = remember("thread.", slug);
            JSONObject item = new JSONObject();
            item.put("id", id);
            item.put("title", entry.optString("name", ""));
            item.put("replies", entry.optInt("messageCount", 0));
            String image = entry.optString("imageUrl", "");
            if (image.startsWith(STORAGE)) item.put("imageId", remember("img.", image));
            threads.put(item);
        }
        if (threads.length() == 0) throw new IllegalStateException("No trial entries");
        JSONObject result = new JSONObject();
        result.put("threads", threads);
        result.put("trial", true);
        result.put("delayed", true);
        result.put("threadReadingAvailable", false);
        return result;
    }

    private byte[] catalog() throws Exception {
        JSONArray items = threadsJson().getJSONArray("threads");
        StringBuilder html = new StringBuilder("<html><head><meta charset='Shift_JIS'></head><body>");
        html.append("<small>めぶきちゃんねる おためし（5分遅延／スレ本文はログイン後に要確認）</small>");
        html.append("<table id='cattable'><tr>");
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            String id = item.getString("id");
            html.append("<td><a href='res/").append(id).append(".htm'>");
            String imageId = item.optString("imageId", "");
            if (!imageId.isEmpty()) html.append("<img src='/mebuki/thumb/").append(imageId).append("s.jpg'>");
            html.append("</a><small>").append(escape(item.optString("title", ""))).append("</small>");
            html.append("<font size=2>").append(item.optInt("replies", 0)).append("</font></td>");
            if (i % 5 == 4 && i != items.length() - 1) html.append("</tr><tr>");
        }
        html.append("</tr></table></body></html>");
        return html.toString().getBytes(SJIS);
    }

    // Local diagnostic document, not a real upstream post or proof of authentication.
    static byte[] unavailableThread(String id) {
        if (!id.matches("[0-9]{13}")) throw new IllegalArgumentException("Invalid thread ID");
        return ("<!DOCTYPE html><html><head><meta charset='Shift_JIS'>"
                + "<title>futatabi notice</title></head><body><div class='thre' data-res='" + id + "'>"
                + "<span class='csb'>futatabi</span>Name <span class='cnm'>アプリからの案内</span>"
                + "<span class='cnw'>-</span><span class='cno'>No." + id + "</span>"
                + "<blockquote>めぶきちゃんねるの認証済み本文は専用画面で表示します。<br>"
                + "拡張ホームのめぶきちゃんねるログインで認証・保存を確認してください。<br>"
                + "下のリンクを押して本文を開く。または拡張ホームの「めぶきちゃんねる：本文を読む」へ。<br>"
                + "<a href='https://futatabi.invalid/mebuki/" + id + "'>https://futatabi.invalid/mebuki/" + id + "</a>"
                + "</blockquote></div></body></html>").getBytes(SJIS);
    }

    private byte[] fetchImage(String url) throws Exception {
        byte[] raw = download(url, 3_000_000, true);
        Bitmap bitmap = BitmapFactory.decodeByteArray(raw, 0, raw.length);
        if (bitmap == null) throw new IllegalArgumentException("Image not decodable");
        try {
            int width = bitmap.getWidth(), height = bitmap.getHeight();
            if (width > 240 || height > 240) {
                float ratio = Math.min(240f / width, 240f / height);
                Bitmap resized = Bitmap.createScaledBitmap(bitmap,
                        Math.max(1, Math.round(width * ratio)), Math.max(1, Math.round(height * ratio)), true);
                if (resized != bitmap) { bitmap.recycle(); bitmap = resized; }
            }
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            if (!bitmap.compress(Bitmap.CompressFormat.JPEG, 80, out))
                throw new IllegalStateException("JPEG compression failed");
            return out.toByteArray();
        } finally { bitmap.recycle(); }
    }

    private byte[] download(String url, int maxBytes, boolean image) throws Exception {
        URL target = new URL(url);
        if (!((!image && "https".equals(target.getProtocol()) &&
                "mebuki.moe".equals(target.getHost()) && "/api/trial/trending".equals(target.getPath()))
                || (image && "https".equals(target.getProtocol()) &&
                "storage.mebuki.moe".equals(target.getHost()) &&
                target.getPath().startsWith("/uploads/attachments/"))))
            throw new IllegalArgumentException("Unexpected upstream URL");
        HttpURLConnection connection = (HttpURLConnection) target.openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(7000);
        connection.setReadTimeout(12000);
        connection.setRequestProperty("Accept", image ? "image/*" : "application/json");
        try {
            if (connection.getResponseCode() != 200) throw new IllegalStateException("Upstream not available");
            try (InputStream in = connection.getInputStream()) {
                return AimogeWriteClient.bounded(in, maxBytes);
            }
        } finally { connection.disconnect(); }
    }

    String slugForThreadId(String threadId) {
        if (threadId == null || !threadId.matches("[0-9]{13}")) return null;
        return index.getString("thread." + threadId, null);
    }

    private synchronized String remember(String prefix, String upstream) throws Exception {
        byte[] hashed = MessageDigest.getInstance("SHA-256")
                .digest((prefix + upstream).getBytes(StandardCharsets.UTF_8));
        long bits = 0;
        for (int i = 0; i < 8; i++) bits = (bits << 8) | (hashed[i] & 255L);
        long n = 1000000000000L + ((bits & Long.MAX_VALUE) % 9000000000000L);
        String id = Long.toString(n);
        String existing = index.getString(prefix + id, null);
        if (existing != null && !existing.equals(upstream)) throw new IllegalStateException("ID collision");
        if (existing == null) index.edit().putString(prefix + id, upstream).commit();
        return id;
    }

    private static String escape(String text) {
        return text.replace("&", "&amp;").replace("<", "&lt;")
                .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
}
