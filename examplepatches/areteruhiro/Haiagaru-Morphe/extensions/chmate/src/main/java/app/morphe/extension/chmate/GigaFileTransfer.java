package app.morphe.extension.chmate;

import android.content.Context;
import android.net.Uri;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class GigaFileTransfer {
    private static final String HOME = "https://gigafile.nu/";
    private static final Pattern SERVER = Pattern.compile("\\bvar\\s+server\\s*=\\s*\"([0-9]{1,4}\\.gigafile\\.nu)\"");
    private static final long CHUNK_SIZE = 100L * 1024 * 1024;
    static final long MAX_SIZE = 300L * 1024 * 1024 * 1024;
    static final int[] DAYS = {3, 5, 7, 14, 30, 60, 100};
    private final MediaUploadClient.Transport transport;
    private volatile HttpURLConnection active;
    private volatile boolean cancelled;

    interface Progress {
        void update(long sent, long size);
    }

    static final class Result {
        final String url;
        final boolean passwordSet;
        Result(String url, boolean passwordSet) {
            this.url = url;
            this.passwordSet = passwordSet;
        }
    }

    GigaFileTransfer() {
        this(url -> (HttpURLConnection) url.openConnection());
    }

    GigaFileTransfer(MediaUploadClient.Transport transport) {
        this.transport = transport;
    }

    void cancel() {
        cancelled = true;
        HttpURLConnection connection = active;
        if (connection != null) connection.disconnect();
    }

    Result upload(Context context, InputStream input, long size, String name, int days,
                  String password, Progress progress) throws Exception {
        if (size < 0 || size > MAX_SIZE) throw new IOException("ファイルサイズを確認してください。");
        if (!password.matches("[A-Za-z0-9]{0,4}")) throw new IOException("パスワードは半角英数字4文字以内です。");
        String host = uploadHost();
        String id = UUID.randomUUID().toString().replace("-", "");
        int count = Math.max(1, (int) ((size + CHUNK_SIZE - 1) / CHUNK_SIZE));
        JSONObject result = null;
        long sent = 0;
        byte[] buffer = new byte[65536];
        for (int index = 0; index < count; index++) {
            long length = Math.min(CHUNK_SIZE, size - sent);
            String boundary = "Haiagaru" + UUID.randomUUID().toString().replace("-", "");
            byte[] header = multipartHeader(boundary,id,name,index,count,days).getBytes(StandardCharsets.UTF_8);
            byte[] tail = ("\r\n--" + boundary + "--\r\n").getBytes(StandardCharsets.US_ASCII);
            HttpURLConnection connection = open("https://" + host + "/upload_chunk.php");
            try {
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);
                connection.setRequestProperty("Origin", "https://gigafile.nu");
                connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
                connection.setFixedLengthStreamingMode(header.length + length + tail.length);
                try (OutputStream out = connection.getOutputStream()) {
                    out.write(header);
                    for (long remaining = length; remaining > 0;) {
                        checkCancelled();
                        int n = input.read(buffer,0,(int) Math.min(buffer.length,remaining));
                        if (n < 0) throw new IOException("ファイルを最後まで読み取れませんでした。");
                        out.write(buffer,0,n);
                        sent += n;
                        remaining -= n;
                        progress.update(sent,size);
                    }
                    if (index == count - 1 && input.read() != -1) throw new IOException("選択したファイルのサイズが変わりました。");
                    out.write(tail);
                }
                result = new JSONObject(read(connection,65536));
                if (result.optInt("status",-1) != 0) throw new IOException("ギガファイル便がアップロードを受理しませんでした。");
            } finally { close(connection); }
        }
        String url = result.optString("url"), key = result.optString("delkey"), filename = result.optString("filename");
        if (!MediaUploadWebPolicy.gigaShare(url) || !key.matches("[A-Za-z0-9]{1,64}"))
            throw new IOException("送信先から共有URLと削除キーを確認できませんでした。");
        // Persist the confirmed upload even when password setup fails or is cancelled.
        JSONObject entry = new JSONObject().put("url",url).put("key",key).put("name",name);
        GigaFileUploadHistory.save(context,new JSONArray().put(entry).toString());
        boolean protectedFile = false;
        if (!password.isEmpty() && !filename.isEmpty() && filename.length() < 250) {
            try {
                String settings = new Uri.Builder().scheme("https").authority(host).appendPath("set_dlkey.php")
                        .appendQueryParameter("file", filename).appendQueryParameter("delkey", key)
                        .appendQueryParameter("dlkey", password).build().toString();
                HttpURLConnection connection = open(settings);
                try { protectedFile = new JSONObject(read(connection,65536)).optInt("status",-1) == 0; }
                finally { close(connection); }
            } catch (Exception unavailable) {
                // The upload is already recorded; do not resubmit it.
            }
        }
        return new Result(url, protectedFile);
    }

    String uploadHost() throws IOException {
        HttpURLConnection connection = open(HOME);
        try {
            Matcher matcher = SERVER.matcher(read(connection, 1024 * 1024));
            if (!matcher.find()) throw new IOException("ギガファイル便のアップロード先を確認できませんでした。");
            return matcher.group(1);
        } finally { close(connection); }
    }

    static String multipartHeader(String boundary,String id,String name,int index,int count,int days) {
        StringBuilder header = new StringBuilder();
        part(header,boundary,"id",id);
        part(header,boundary,"name",name);
        part(header,boundary,"chunk",Integer.toString(index));
        part(header,boundary,"chunks",Integer.toString(count));
        part(header,boundary,"lifetime",Integer.toString(days));
        return header.append("--").append(boundary)
                .append("\r\nContent-Disposition: form-data; name=\"file\"; filename=\"blob\"\r\n")
                .append("Content-Type: application/octet-stream\r\n\r\n").toString();
    }

    private static void part(StringBuilder out,String boundary,String key,String value) {
        out.append("--").append(boundary).append("\r\nContent-Disposition: form-data; name=\"")
                .append(key).append("\"\r\n\r\n").append(value).append("\r\n");
    }

    private HttpURLConnection open(String address) throws IOException {
        checkCancelled();
        HttpURLConnection connection = transport.open(new URL(address));
        connection.setConnectTimeout(30000);
        connection.setReadTimeout(120000);
        connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("Referer",HOME);
        active = connection;
        if (cancelled) { close(connection); checkCancelled(); }
        return connection;
    }

    private String read(HttpURLConnection connection,int limit) throws IOException {
        if (connection.getResponseCode() != 200) throw new IOException("ギガファイル便との通信に失敗しました。");
        try (InputStream in = connection.getInputStream(); ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            for (int len; (len = in.read(buffer)) != -1;) {
                checkCancelled();
                if (bytes.size() + len > limit) throw new IOException("ギガファイル便の応答が大きすぎます。");
                bytes.write(buffer,0,len);
            }
            return bytes.toString(StandardCharsets.UTF_8.name());
        }
    }

    void checkCancelled() throws IOException {
        if (cancelled) throw new IOException("アップロードを中止しました。");
    }

    private void close(HttpURLConnection connection) {
        connection.disconnect();
        active = null;
    }
}
