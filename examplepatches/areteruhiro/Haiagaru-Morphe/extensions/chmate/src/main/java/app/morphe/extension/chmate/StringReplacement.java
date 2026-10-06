package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CodingErrorAction;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;

/** UI rendering reads only a cached snapshot; storage I/O always runs off the UI thread. */
public final class StringReplacement {
    static final String PREFS = "haiagaru_replace_str";
    static final String SAMPLE = "; Haiagaru: UTF-8、タブ区切り。投稿本文・保存DATは変更しません。\n"
            + "; 検索文字<TAB>置換文字。<ex>は大小区別なし、<ex2>は区別あり。\n"
            + "; 空の置換文字は削除。本文(msg)のみ対応。正規表現・URL条件は未対応。\n"
            + "; 次はサンプルです。先頭の ; を外すと有効になります。\n"
            + "; <ex2>https://example■.com/\thttps://example.com/\tmsg\n";
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static final AtomicBoolean loading = new AtomicBoolean();
    private static volatile ReplacementRules rules = ReplacementRules.empty();
    private static volatile boolean enabled;
    private static volatile long lastReload;
    static volatile String status = "ファイルを作成または選択してください";

    static SharedPreferences prefs(Context c) { return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE); }
    public static boolean supported(Context c) {
        try {
            String v = c.getPackageManager().getPackageInfo(c.getPackageName(), 0).versionName;
            return "0.8.10.191 dev".equals(v) || "0.8.10.226 dev".equals(v)
                    || "0.8.10.241".equals(v) || "0.8.10.242 dev".equals(v);
        } catch (Exception ignored) { return false; }
    }
    public static String apply(String input) { return enabled ? rules.apply(input) : input; }

    static void setEnabled(Context c, boolean value) {
        prefs(c).edit().putBoolean("enabled", value).apply();
        enabled = value;
        reload(c, true, null);
    }

    static void select(Context c, Uri uri) {
        enabled = false;
        rules = ReplacementRules.empty();
        prefs(c).edit().putString("uri", uri.toString()).apply();
        lastReload = 0;
    }

    public static void reload(Context context, boolean force, Runnable complete) {
        Context c = context.getApplicationContext();
        if (!supported(c)) return;
        enabled = prefs(c).getBoolean("enabled", false);
        if (!force && System.currentTimeMillis() - lastReload < 2000) return;
        if (!force && !loading.compareAndSet(false, true)) return;
        if (force) loading.set(true);
        lastReload = System.currentTimeMillis();
        String uri = prefs(c).getString("uri", "");
        IO.execute(() -> {
            try {
                if (uri.isEmpty()) { rules = ReplacementRules.empty(); status = "ファイル未選択"; return; }
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                try (InputStream input = c.getContentResolver().openInputStream(Uri.parse(uri))) {
                    if (input == null) throw new java.io.IOException("ファイルを開けません");
                    byte[] buffer = new byte[4096];
                    int count;
                    while ((count = input.read(buffer)) != -1) {
                        if (bytes.size() + count > 131072) throw new java.io.IOException("TXTは128KBまでです");
                        bytes.write(buffer, 0, count);
                    }
                }
                String text = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                        .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes.toByteArray())).toString();
                ReplacementRules loaded = ReplacementRules.parse(text);
                // A file selection changed while reading: never publish stale rules.
                if (uri.equals(prefs(c).getString("uri", ""))) {
                    rules = loaded;
                    status = loaded.size() + "件のルールを読み込みました。スレを開き直すと反映します。";
                }
            } catch (Exception error) {
                rules = ReplacementRules.empty();
                status = "読み込み失敗: " + error.getMessage() + "（置換なしで表示します）";
            } finally {
                loading.set(false);
                if (complete != null) complete.run();
            }
        });
    }
}
