package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.Button;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Comparator;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

/** Saves pending opt-in diagnostics privately. Uploads never run in the crash handler. */
final class CrashReportDelivery {
    private static final String ENDPOINT = "https://script.google.com/macros/s/AKfycbxiqsLXRiUTM10nGRghX8Rzb7G487B2Y1sm6GFzAbdxOQeK4PUR-qN0P0T3Ois6d_hLWQ/exec";
    private static final int REPORT_LIMIT = 24000;
    private static final int MAX_PENDING = 6;
    private static final AtomicBoolean SENDING = new AtomicBoolean();
    private static final String CHOICE = "consent_at";
    private static final String EXPLANATION = "クラッシュ・ANRの発生時刻、アプリとOSのバージョン、機種、処理スレッド名、エラーとスタックトレースを、Haiagaruの管理者が管理するGoogleスプレッドシートに送信します。エラーやトレースに端末の状態や利用中の情報が含まれる場合があります。端末への保存は送信設定に関係なく行います。";

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("haiagaru_crash_reporting", Context.MODE_PRIVATE);
    }

    static void firstSettings(Activity activity) {
        if (!prefs(activity).contains(CHOICE)) showConsent(activity, null);
    }

    static void bindSetting(Activity activity, Button button) {
        Runnable refresh = () -> button.setText("クラッシュ・ANRログを送信する（"
                + (prefs(activity).getLong(CHOICE, 0) > 0 ? "オン" : "オフ") + "）");
        refresh.run();
        button.setOnClickListener(v -> showConsent(activity, refresh));
    }

    private static void showConsent(Activity activity, Runnable refresh) {
        if (activity.isFinishing() || activity.isDestroyed()) return;
        new HaiagaruDialog.Builder(activity).setTitle("クラッシュ・ANRログの送信")
                .setMessage(EXPLANATION)
                .setPositiveButton("同意して送信を有効にする", (dialog, which) -> {
                    if (prefs(activity).getLong(CHOICE, 0) <= 0)
                        prefs(activity).edit().putLong(CHOICE, System.currentTimeMillis()).apply();
                    if (refresh != null) refresh.run();
                })
                .setNegativeButton("送信しない", (dialog, which) -> {
                    disable(activity);
                    if (refresh != null) refresh.run();
                }).show();
    }

    private static File outbox(Context c) { return new File(c.getFilesDir(), "haiagaru-report-outbox"); }

    private static synchronized void disable(Context c) {
        prefs(c).edit().putLong(CHOICE, 0).apply();
        File[] files = outbox(c).listFiles();
        if (files != null) for (File file : files) file.delete();
    }

    static synchronized void enqueue(Context c, String type, long time, String report) {
        long consent = prefs(c).getLong(CHOICE, 0);
        if (consent <= 0 || time < consent) return;
        File dir = outbox(c);
        if (!dir.isDirectory() && !dir.mkdirs()) return;
        File[] pending = dir.listFiles(file -> file.getName().endsWith(".json"));
        if (pending != null && pending.length >= MAX_PENDING) {
            Arrays.sort(pending, Comparator.comparingLong(File::lastModified));
            if (!pending[0].delete()) return;
        }
        String id = UUID.randomUUID().toString();
        File temp = new File(dir, id + ".tmp");
        try {
            int end = Math.min(REPORT_LIMIT, report.length());
            if (end < report.length() && Character.isHighSurrogate(report.charAt(end-1))) end--;
            byte[] bytes = new JSONObject().put("id", id).put("type", type).put("time", time)
                    .put("report", report.substring(0, end)).toString().getBytes(StandardCharsets.UTF_8);
            try (FileOutputStream output = new FileOutputStream(temp)) { output.write(bytes); }
            temp.renameTo(new File(dir, id + ".json"));
        } catch (Exception ignored) {
            // The original report remains saved locally.
        } finally { temp.delete(); }
    }

    static void flush(Context c) {
        if (prefs(c).getLong(CHOICE, 0) <= 0 || !SENDING.compareAndSet(false, true)) return;
        Context app = c.getApplicationContext();
        new Thread(() -> {
            try {
                File[] files = outbox(app).listFiles(file -> file.getName().endsWith(".json"));
                if (files == null) return;
                Arrays.sort(files, Comparator.comparingLong(File::lastModified));
                for (File file : files) {
                    if (prefs(app).getLong(CHOICE, 0) <= 0) break;
                    if (!file.isFile()) continue;
                    byte[] contents;
                    try (FileInputStream input = new FileInputStream(file)) { contents = read(input, 128 * 1024); }
                    if (!send(contents)) break;
                    file.delete();
                }
            } catch (Exception error) {
                // Keep pending files for the next start after a transient failure.
            } finally { SENDING.set(false); }
        }, "Haiagaru-report-delivery").start();
    }

    private static boolean send(byte[] contents) throws Exception {
        HttpURLConnection request = connect(new URL(ENDPOINT));
        try {
            request.setRequestMethod("POST");
            request.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            request.setDoOutput(true);
            request.setFixedLengthStreamingMode(contents.length);
            try (java.io.OutputStream stream = request.getOutputStream()) { stream.write(contents); }
            if (request.getResponseCode() == 302 || request.getResponseCode() == 303) {
                URL redirected = new URL(request.getHeaderField("Location"));
                if (!"https".equals(redirected.getProtocol()) || redirected.getUserInfo() != null
                        || redirected.getPort() != -1 || !"script.googleusercontent.com".equals(redirected.getHost()))
                    return false;
                HttpURLConnection result = connect(redirected);
                try { return accepted(result, contents); } finally { result.disconnect(); }
            }
            return accepted(request, contents);
        } finally { request.disconnect(); }
    }

    private static HttpURLConnection connect(URL url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(8000);
        connection.setReadTimeout(12000);
        connection.setInstanceFollowRedirects(false);
        return connection;
    }

    private static boolean accepted(HttpURLConnection response, byte[] sent) throws Exception {
        if (response.getResponseCode() != 200) return false;
        try (InputStream input = response.getInputStream()) {
            JSONObject result = new JSONObject(new String(read(input, 2048), StandardCharsets.UTF_8));
            return result.optBoolean("ok") && new JSONObject(new String(sent, StandardCharsets.UTF_8))
                    .getString("id").equals(result.optString("id"));
        }
    }

    private static byte[] read(InputStream input, int limit) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        for (int count; (count = input.read(buffer)) != -1;) {
            if (out.size() + count > limit) throw new IOException("Report exceeds size limit");
            out.write(buffer, 0, count);
        }
        return out.toByteArray();
    }

    private CrashReportDelivery() {}
}
