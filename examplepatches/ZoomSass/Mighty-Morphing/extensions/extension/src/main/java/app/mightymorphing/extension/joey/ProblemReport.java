package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

/**
 * "Report a problem": a plain-text, technical-only description of this install, previewed in
 * full, then copied, shared, or uploaded to dpaste for 30 days. Everything in it comes from an
 * allow-list. No account, subreddit, link, filter or anything the user typed is included.
 * Crashes are recorded from app start with class and method lines only.
 */
public final class ProblemReport {
    private static final String CRASH_FILE = "morphe_crashes.txt";
    private static final int KEEP_CRASHES = 3;
    private static final String HANDLE = "u/ZoomSass";
    private static volatile boolean sInstalled;
    private static volatile Context sApp;

    private ProblemReport() {
    }

    /** The app context, once install has run. Null before that. */
    static Context app() {
        return sApp;
    }

    /** Replaced by the patch with the bundle version it was built as. */
    public static String bundleVersion() {
        return "unknown";
    }

    // ---------------------------------------------------------------------
    // Crash recorder
    // ---------------------------------------------------------------------

    /** MyApplication.onCreate. Records a crash, then hands it on as before. */
    public static void install(Context context) {
        if (sInstalled || context == null) return;
        sInstalled = true;
        Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        sApp = app;
        Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            try {
                record(app, thread, error);
            } catch (Throwable ignored) {
            }
            if (previous != null) previous.uncaughtException(thread, error);
        });
    }

    private static void record(Context context, Thread thread, Throwable error) throws Exception {
        StringBuilder out = new StringBuilder();
        out.append("-- ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US).format(new Date()))
                .append(" thread ").append(thread == null ? "?" : thread.getName()).append('\n');
        Throwable at = error;
        for (int depth = 0; at != null && depth < 4; depth++, at = at.getCause()) {
            out.append(depth == 0 ? "" : "Caused by: ").append(at.getClass().getName());
            String message = scrub(at.getMessage());
            if (!message.isEmpty()) out.append(": ").append(message);
            out.append('\n');
            StackTraceElement[] frames = at.getStackTrace();
            for (int i = 0; i < frames.length && i < 18; i++) {
                out.append("  at ").append(frames[i].getClassName()).append('.').append(frames[i].getMethodName()).append('\n');
            }
        }
        List<String> kept = crashes(context);
        kept.add(out.toString());
        while (kept.size() > KEEP_CRASHES) kept.remove(0);
        StringBuilder all = new StringBuilder();
        for (String crash : kept) all.append(crash).append("\u0000");
        try (OutputStream file = new FileOutputStream(new File(context.getFilesDir(), CRASH_FILE))) {
            file.write(all.toString().getBytes(StandardCharsets.UTF_8));
        }
    }

    private static List<String> crashes(Context context) {
        List<String> list = new ArrayList<>();
        File file = new File(context.getFilesDir(), CRASH_FILE);
        if (!file.exists()) return list;
        try (InputStream in = new java.io.FileInputStream(file)) {
            byte[] data = new byte[(int) Math.min(file.length(), 64 * 1024)];
            int read = in.read(data);
            for (String part : new String(data, 0, Math.max(0, read), StandardCharsets.UTF_8).split("\u0000")) {
                if (!part.trim().isEmpty()) list.add(part);
            }
        } catch (Throwable ignored) {
        }
        return list;
    }

    /** Messages can carry links or names. Those are replaced; the rest stays, shortened. */
    static String scrub(String text) {
        if (text == null) return "";
        String out = text
                .replaceAll("https?://\\S+", "<link>")
                .replaceAll("(?i)\\b/?u/[A-Za-z0-9_-]+", "u/<user>")
                .replaceAll("(?i)\\b/?r/[A-Za-z0-9_]+", "r/<sub>")
                .replaceAll("[\\w.+-]+@[\\w-]+\\.[\\w.]+", "<email>");
        return out.length() > 300 ? out.substring(0, 300) + "…" : out;
    }

    // ---------------------------------------------------------------------
    // The report
    // ---------------------------------------------------------------------

    static String build(Activity activity) {
        StringBuilder out = new StringBuilder();
        out.append("Mighty Morphing problem report\n");
        out.append("Bundle: ").append(bundleVersion()).append('\n');
        try {
            out.append("Joey: ").append(activity.getPackageManager()
                    .getPackageInfo(activity.getPackageName(), 0).versionName).append('\n');
        } catch (Throwable ignored) {
        }
        out.append("Android: ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT).append(")\n");
        out.append("Device: ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');

        List<String> patches = new ArrayList<>();
        if (MorpheSettings.modernUiControls()) patches.add("Modern UI");
        if (MorpheSettings.mediaEnhancementControls()) patches.add("Media enhancements");
        if (MorpheSettings.pictureControls()) patches.add("Inline comment media");
        if (MorpheSettings.backupControls()) patches.add("Backup");
        if (MorpheSettings.showHideControls()) patches.add("Show and hide");
        if (MorpheSettings.undeleteControls()) patches.add("Removed content");
        if (SeasonalBanner.isEnabled()) patches.add("Seasonal banner");
        if (MorpheSplash.isEnabled()) patches.add("Splash");
        out.append("Patches seen: ").append(patches.isEmpty() ? "none" : String.join(", ", patches)).append('\n');

        Configuration config = activity.getResources().getConfiguration();
        DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        out.append("\n[Screen]\n");
        out.append("Size: ").append(config.screenWidthDp).append(" x ").append(config.screenHeightDp)
                .append(" dp, smallest ").append(config.smallestScreenWidthDp).append(" dp\n");
        out.append("Density: ").append(metrics.densityDpi).append(" dpi, font scale ").append(config.fontScale).append('\n');
        out.append("Orientation: ").append(config.orientation == Configuration.ORIENTATION_LANDSCAPE ? "landscape" : "portrait").append('\n');
        describeWindow(activity, config, metrics, out);
        out.append("Light or dark (system): ")
                .append((config.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES ? "dark" : "light").append('\n');

        if (MorpheSettings.modernUiControls()) {
            out.append("\n[Modern UI]\n");
            boolean on = ModernUi.isModernUiEnabled(activity);
            out.append("Modern: ").append(on ? "on" : "off (Classic)").append('\n');
            try {
                String theme = ModernUi.getMaterialAccent(activity);
                out.append("Theme: ").append(ModernTheme.isMine(theme) ? "my theme from " + ModernTheme.mineBase(activity, theme) : theme)
                        .append(", mode ").append(ModernTheme.mode(activity))
                        .append(", showing ").append(ModernTheme.wantsLight(activity, theme) ? "light" : "dark")
                        .append('\n');
                String changes = ModernTheme.describeChanges(activity, theme);
                out.append("Theme changes: ").append(changes.isEmpty() ? "none" : changes).append('\n');
                ModernTheme.Depth depth = ModernTheme.depth(activity, theme, ModernTheme.wantsLight(activity, theme));
                out.append("Comment levels: ").append(depth.preset).append(", ").append(depth.count)
                        .append(depth.hidden ? ", bars hidden" : "").append('\n');
                out.append("Icons: ").append(ModernIcons.saved(activity).isEmpty() ? "Joey" : ModernIcons.saved(activity)).append('\n');
            } catch (Throwable ignored) {
            }
            out.append("Layout reset undo available: ").append(ModernSettings.canUndo(activity) ? "yes" : "no").append('\n');
            out.append("\n[Joey layout settings set by the user, Modern copy and Classic]\n");
            try {
                ModernSettings.describe(activity, out);
            } catch (Throwable ignored) {
            }
        }

        out.append("\n[Joey shared settings]\n");
        out.append("Immersive full-screen: ").append(joeyFlag("g0")).append('\n');
        out.append("Bottom navigation: ").append(joeyFlag("h0")).append('\n');
        out.append("Tab layout for subreddit: ").append(joeyFlag("H")).append('\n');

        out.append("\n[Morphe settings]\n");
        describeMorphe(activity, out);

        out.append("\n[Network]\n");
        describeNetwork(activity, out);

        out.append("\n[Comment request counts since last clear]\n");
        List<String> counts = RequestLog.counts(activity);
        if (counts.isEmpty()) out.append("none recorded\n");
        for (String line : counts) out.append(line).append('\n');

        out.append("\n[Recent request problems]\n");
        List<String> requests = RequestLog.lines(activity);
        if (requests.isEmpty()) out.append("none recorded\n");
        for (String line : requests) out.append(line).append('\n');

        out.append("\n[Recent good requests]\n");
        List<String> good = RequestLog.goodLines(activity);
        if (good.isEmpty()) out.append("none recorded\n");
        for (String line : good) out.append(line).append('\n');

        out.append("\n[Recent crashes]\n");
        List<String> crashes = crashes(activity);
        if (crashes.isEmpty()) out.append("none recorded\n");
        for (String crash : crashes) out.append(crash);
        return out.toString();
    }

    /** Connection type and whether a VPN is on. Nothing about the network's name or address. */
    private static void describeNetwork(Activity activity, StringBuilder out) {
        try {
            android.net.ConnectivityManager manager = (android.net.ConnectivityManager)
                    activity.getSystemService(Context.CONNECTIVITY_SERVICE);
            android.net.Network network = manager == null ? null : manager.getActiveNetwork();
            android.net.NetworkCapabilities caps = network == null ? null : manager.getNetworkCapabilities(network);
            if (caps == null) {
                out.append("Connection: none or unknown\n");
                return;
            }
            String type = caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI) ? "wifi"
                    : caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_CELLULAR) ? "mobile"
                    : caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_ETHERNET) ? "ethernet" : "other";
            out.append("Connection: ").append(type).append('\n');
            out.append("VPN: ").append(caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_VPN) ? "on" : "off")
                    .append('\n');
        } catch (Throwable ignored) {
            out.append("Connection: unknown\n");
        }
    }

    /** Window versus the whole display (split screen, pop-up, folded or unfolded) and navigation mode. */
    private static void describeWindow(Activity activity, Configuration config, DisplayMetrics metrics, StringBuilder out) {
        try {
            boolean multi = Build.VERSION.SDK_INT >= 24 && activity.isInMultiWindowMode();
            out.append("Window: ").append(multi ? "split screen or pop-up" : "full screen").append('\n');
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Rect max = activity.getWindowManager().getMaximumWindowMetrics().getBounds();
                android.graphics.Rect now = activity.getWindowManager().getCurrentWindowMetrics().getBounds();
                float d = metrics.density;
                out.append("Display: ").append(Math.round(max.width() / d)).append(" x ").append(Math.round(max.height() / d))
                        .append(" dp, window ").append(Math.round(now.width() / d)).append(" x ").append(Math.round(now.height() / d))
                        .append(" dp\n");
                int shortSide = Math.round(Math.min(max.width(), max.height()) / d);
                int longSide = Math.round(Math.max(max.width(), max.height()) / d);
                if (activity.getPackageManager().hasSystemFeature("android.hardware.sensor.hinge_angle")) {
                    out.append("Foldable: yes, ").append(longSide < shortSide * 1.6f ? "probably unfolded" : "probably folded")
                            .append('\n');
                }
            }
        } catch (Throwable ignored) {
        }
        String nav;
        try {
            int mode = android.provider.Settings.Secure.getInt(activity.getContentResolver(), "navigation_mode", -1);
            nav = mode == 2 ? "gesture" : mode == 1 ? "2-button" : mode == 0 ? "3-button" : "unknown";
        } catch (Throwable t) {
            nav = "unknown";
        }
        out.append("Navigation: ").append(nav).append('\n');
    }

    private static String joeyFlag(String field) {
        try {
            return String.valueOf(Class.forName("za.a").getField(field).getBoolean(null));
        } catch (Throwable ignored) {
            return "unknown";
        }
    }

    /** Switches, numbers and short codes only. Anything that could hold names or text is counted. */
    private static void describeMorphe(Context context, StringBuilder out) {
        SharedPreferences prefs = context.getSharedPreferences("mighty_morphing", Context.MODE_PRIVATE);
        int withheld = 0;
        int skipped = 0;
        for (Map.Entry<String, ?> entry : new TreeMap<>(prefs.getAll()).entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            String lower = key.toLowerCase(Locale.US);
            boolean personal = lower.contains("filter") || lower.contains("user") || lower.contains("account")
                    || lower.contains("name") || lower.contains("my_themes") || lower.contains("undo")
                    || lower.contains("sub") || lower.contains("draft") || lower.contains("history");
            boolean simple = value instanceof Boolean || value instanceof Number
                    || (value instanceof String && ((String) value).matches("[A-Za-z0-9_:#.,\\- ]{0,40}"));
            boolean cosmetic = lower.startsWith("morphe_splash") || lower.startsWith("download")
                    || lower.startsWith("branding") || lower.startsWith("sidebar_bird") || lower.endsWith("_migrated")
                    || lower.equals("material_accent") || lower.equals("icon_pack") || lower.equals("theme_mode")
                    || lower.startsWith("theme_");
            if (cosmetic) {
                skipped++;
                continue;
            }
            if (personal || !simple) {
                withheld++;
                continue;
            }
            out.append(key).append(": ").append(value).append('\n');
        }
    }

    // ---------------------------------------------------------------------
    // Screen and sending
    // ---------------------------------------------------------------------

    static void show(Activity activity) {
        String report;
        try {
            report = build(activity);
        } catch (Throwable t) {
            report = "Mighty Morphing problem report\nThe report could not be built: " + t.getClass().getName();
        }
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout page = MorpheDialog.page(activity, "Report a problem",
                "A report of your phone, screen, app versions, changed settings and recent comment requests "
                        + "(feature names, status codes and counts only). No account, subreddits, "
                        + "posts or anything you've written. It's all shown below, and that's all that gets sent. "
                        + "Uploads are private links, deleted after 30 days.");
        android.widget.EditText note = new android.widget.EditText(activity);
        note.setHint("Optional: what went wrong, and on which screen?");
        note.setTextSize(14);
        note.setTextColor(MorpheDialog.text(activity));
        note.setHintTextColor((MorpheDialog.text(activity) & 0x00FFFFFF) | 0x88000000);
        note.setMinLines(2);
        note.setMaxLines(4);
        note.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | android.text.InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
        page.addView(note, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        String[] base = {report};
        TextView body = new TextView(activity);
        body.setText(base[0]);
        body.setTypeface(Typeface.MONOSPACE);
        body.setTextSize(11);
        body.setTextColor(MorpheDialog.text(activity));
        body.setTextIsSelectable(true);
        ScrollView scroll = new ScrollView(activity);
        scroll.addView(body);
        int height = Math.round(Math.min(300 * density, activity.getResources().getDisplayMetrics().heightPixels * 0.45f));
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        AlertDialog[] shown = new AlertDialog[1];
        TextView copy = MorpheDialog.action(activity, "Copy", MorpheDialog.TEXT);
        copy.setOnClickListener(v -> {
            clip(activity, withNote(base[0], note));
            Toast.makeText(activity, "Report copied", Toast.LENGTH_SHORT).show();
        });
        TextView share = MorpheDialog.action(activity, "Share", MorpheDialog.TEXT);
        share.setOnClickListener(v -> {
            Intent send = new Intent(Intent.ACTION_SEND).setType("text/plain").putExtra(Intent.EXTRA_TEXT, withNote(base[0], note));
            activity.startActivity(Intent.createChooser(send, "Send report"));
        });
        TextView upload = MorpheDialog.action(activity, "Upload", MorpheDialog.GOLD);
        upload.setOnClickListener(v -> {
            upload.setEnabled(false);
            upload.setText("Uploading…");
            upload(activity, withNote(base[0], note), link -> {
                if (shown[0] != null) shown[0].dismiss();
                if (link == null) {
                    Toast.makeText(activity, "Upload failed. Use Copy or Share instead.", Toast.LENGTH_LONG).show();
                    return;
                }
                uploaded(activity, link);
            });
        });
        TextView clear = MorpheDialog.action(activity, "Clear", MorpheDialog.SUB);
        clear.setOnClickListener(v -> {
            new File(activity.getFilesDir(), CRASH_FILE).delete();
            RequestLog.clear(activity);
            try {
                base[0] = build(activity);
            } catch (Throwable t) {
                return;
            }
            body.setText(base[0]);
            clear.setVisibility(android.view.View.GONE);
            Toast.makeText(activity, "Crash and request logs cleared", Toast.LENGTH_SHORT).show();
        });
        if (crashes(activity).isEmpty() && RequestLog.isEmpty(activity)) {
            page.addView(MorpheDialog.actions(activity, copy, share, upload));
        } else {
            page.addView(MorpheDialog.actions(activity, clear, copy, share, upload));
        }
        shown[0] = MorpheDialog.show(activity, page, 520);
    }

    private static String withNote(String report, android.widget.EditText note) {
        String said = note.getText().toString().trim();
        if (said.isEmpty()) return report;
        int end = report.indexOf('\n');
        return report.substring(0, end + 1) + "\n[What the user said]\n" + said + "\n" + report.substring(end + 1);
    }

    private interface LinkSink {
        void put(String link);
    }

    /** dpaste.com: anonymous, plain text, deleted after 30 days. The reply body is the link. */
    private static void upload(Activity activity, String text, LinkSink sink) {
        new Thread(() -> {
            String link = null;
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL("https://dpaste.com/api/v2/").openConnection();
                if (connection instanceof javax.net.ssl.HttpsURLConnection) {
                    javax.net.ssl.SSLSocketFactory factory = yrFactory();
                    if (factory != null) ((javax.net.ssl.HttpsURLConnection) connection).setSSLSocketFactory(factory);
                }
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);
                connection.setConnectTimeout(15000);
                connection.setReadTimeout(20000);
                connection.setRequestProperty("User-Agent", "MightyMorphing/" + bundleVersion());
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
                String form = "content=" + URLEncoder.encode(text, "UTF-8")
                        + "&syntax=text&expiry_days=30&title=" + URLEncoder.encode("Mighty Morphing report", "UTF-8");
                try (OutputStream body = connection.getOutputStream()) {
                    body.write(form.getBytes(StandardCharsets.UTF_8));
                }
                int code = connection.getResponseCode();
                InputStream stream = code >= 400 ? connection.getErrorStream() : connection.getInputStream();
                String reply = "";
                if (stream != null) {
                    try (InputStream in = stream) {
                        byte[] data = new byte[2048];
                        int read = in.read(data);
                        reply = read > 0 ? new String(data, 0, read, StandardCharsets.UTF_8).trim() : "";
                    }
                }
                if (code >= 200 && code < 300) {
                    if (reply.startsWith("http")) link = reply.split("\\s")[0];
                    else if (connection.getHeaderField("Location") != null) link = connection.getHeaderField("Location");
                }
                android.util.Log.w("MorpheReport", "upload HTTP " + code + " reply: "
                        + (reply.length() > 200 ? reply.substring(0, 200) : reply));
            } catch (Throwable t) {
                android.util.Log.w("MorpheReport", "upload failed", t);
                if (t instanceof javax.net.ssl.SSLException) diagnose("dpaste.com");
            } finally {
                if (connection != null) connection.disconnect();
            }
            String result = link;
            activity.runOnUiThread(() -> sink.put(result));
        }, "morphe-report").start();
    }

    /**
     * Let's Encrypt "Root YR", cross-signed by ISRG Root X1 (letsencrypt.org/certs/gen-y/root-yr-by-x1.pem,
     * valid to 2032-09-02). dpaste.com chains to Root YR, which older Android trust stores lack. This
     * certificate is not trusted on its own: it is only appended to the server's chain so the system
     * can verify it up to ISRG Root X1, which every supported Android already trusts.
     */
    private static final String ROOT_YR_BY_X1 = ""
            + "MIIF9DCCA9ygAwIBAgIRAPJLbRf52a18scn+p4eCaZ8wDQYJKoZIhvcNAQELBQAw"
            + "TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh"
            + "cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMjYwNTEzMDAwMDAw"
            + "WhcNMzIwOTAyMjM1OTU5WjAuMQswCQYDVQQGEwJVUzENMAsGA1UEChMESVNSRzEQ"
            + "MA4GA1UEAxMHUm9vdCBZUjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIB"
            + "ANvGJnN78CTJdWL3+eGfsLN5TrNBJs+VH9hRXqRbwxu9sGNiB0BD1fcOxbSUQCJI"
            + "M1xE13Db+5Cw1w0s0EBYsvuIP/6joF0w8cuImbgR1OGgYbSQ4OpzI+DG8SGuTlcE"
            + "873OCS+kh3srlo6vl43M5OJg4Aeo1sfHp6kTJDoIiFBNJAY+OKfX/FUvYKuhjT+n"
            + "o49lmqmupSBI5PkBQiqrEGtWU5uxU/cQWHGu8jSjFBznZqvbNPLMXMLFxCb3WTfr"
            + "JBXXjqvWG+v4bjzxjjeAtOlU7qarRDvNOyAuQYLln904M+faKx8hnLCpJ15ZqaEg"
            + "cNlY+9MMWcC5yvL2A2j3l9+2buggZX+dOE91zYmIdawTvSZuVvlbRrAlLxIB6pwM"
            + "BjneXCjYQ8+3BCCjssbSNpZU3hTcBDdhfAlEDlYr6pEatnMdmDT5BqnKC92bd0Eh"
            + "M1fbLHioLccLCuievT8ZkPhZrq7Mii7gNXAcUEAR8+lzYal+9zTg7C5DALyVOeG/"
            + "CqfRAMn1KSHCR0NSA6P8tn/mGRlnCct5rtVCLnVySVpU6H1qGg3DgTOuskf8eahT"
            + "MiYbI5ezPJmO5ertalskQ1utp74+eDy92PI4ftHKTbq9IWhH4YZKh3WnJEIt+oQv"
            + "lYZbY8tpEroKrFB6PFGzrJIDRyts4HqvuH52RFj2zv/BAgMBAAGjgeswgegwDgYD"
            + "VR0PAQH/BAQDAgEGMBMGA1UdJQQMMAoGCCsGAQUFBwMBMA8GA1UdEwEB/wQFMAMB"
            + "Af8wHQYDVR0OBBYEFN7nW2DQIm1AKH0/DQH+pLVStFGUMB8GA1UdIwQYMBaAFHm0"
            + "WeZ7tuXkAXOACIjIGlj26ZtuMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAoYW"
            + "aHR0cDovL3gxLmkubGVuY3Iub3JnLzATBgNVHSAEDDAKMAgGBmeBDAECATAnBgNV"
            + "HR8EIDAeMBygGqAYhhZodHRwOi8veDEuYy5sZW5jci5vcmcvMA0GCSqGSIb3DQEB"
            + "CwUAA4ICAQA8spSI95KKfn2W6GMmDpHBJSPaLbsS3W93cijJCRCYAc1fsJgL1FIL"
            + "7C0C9ecPOdcwB2fi0Dk2p94j9iTJCxmt5CFSKLRWwnXT2MMSXexVxqoVB79BdWPx"
            + "VXETkVme/qYSAuKVHh5Ps+5BixgmwS1JkjSAc+MfrUbNssVEEnH0aEiAh+rotXAV"
            + "JSP/Ye7LJPEwD9DWG72vVWbhAcuOf5OLjz57Ctk7MgQHynZ7+PlHJtajroCaIbtC"
            + "r6tcZZaAwUQm+jQyeWdV+2hv9deOYFmKeQyjjcSrN5Nadrw+L9DZJLbA1HqeNvLh"
            + "BgqpP0fvJq2N6EtD574N6eMI7uMsJTnji2UDz9el5XLSv9fqJMuDQtYVb2oTNoKp"
            + "oUqhxPVC0aq4eG5MESaIdn8b5ZGSSeAJLMHXljEdlNza+ncfkviXk1POLnnFdvx8"
            + "/gk6M374WbLWFXw8N141B/Rl/tINGfl1TxOIiqtiMYkL02RSGb1kq34BL9NPP27z"
            + "RGMuHGnzS3hFIrRTfKxrzUZ9RzQWzEG3K6fJ3r2nqSltkeytis9DIBoFY9VmVyjL"
            + "M71DMi+y1+TRSJVClEMwvA4yL++7q9XZx5r5wBRWB4kQTKH5qyoZnDw7iiuh1lID"
            + "yDFx8r7i9vIJU5HS3moZLkYWAOilMaV9N56A9Bgb6dNcHkvg3NoaYA==";

    private static javax.net.ssl.SSLSocketFactory yrFactory;

    private static synchronized javax.net.ssl.SSLSocketFactory yrFactory() {
        if (yrFactory != null) return yrFactory;
        try {
            javax.net.ssl.TrustManagerFactory tmf = javax.net.ssl.TrustManagerFactory.getInstance(
                    javax.net.ssl.TrustManagerFactory.getDefaultAlgorithm());
            tmf.init((java.security.KeyStore) null);
            javax.net.ssl.X509TrustManager found = null;
            for (javax.net.ssl.TrustManager m : tmf.getTrustManagers()) {
                if (m instanceof javax.net.ssl.X509TrustManager) found = (javax.net.ssl.X509TrustManager) m;
            }
            if (found == null) return null;
            javax.net.ssl.X509TrustManager system = found;
            java.security.cert.X509Certificate bridge = (java.security.cert.X509Certificate)
                    java.security.cert.CertificateFactory.getInstance("X.509").generateCertificate(
                            new java.io.ByteArrayInputStream(android.util.Base64.decode(ROOT_YR_BY_X1, android.util.Base64.DEFAULT)));
            javax.net.ssl.X509TrustManager bridged = new javax.net.ssl.X509TrustManager() {
                @Override
                public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String auth)
                        throws java.security.cert.CertificateException {
                    system.checkClientTrusted(chain, auth);
                }

                @Override
                public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String auth)
                        throws java.security.cert.CertificateException {
                    try {
                        system.checkServerTrusted(chain, auth);
                    } catch (java.security.cert.CertificateException first) {
                        java.security.cert.X509Certificate top = chain[chain.length - 1];
                        if (!top.getIssuerX500Principal().equals(bridge.getSubjectX500Principal())) throw first;
                        java.security.cert.X509Certificate[] longer = java.util.Arrays.copyOf(chain, chain.length + 1);
                        longer[chain.length] = bridge;
                        // Still the system's own check: it must verify all the way to ISRG Root X1.
                        system.checkServerTrusted(longer, auth);
                    }
                }

                @Override
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                    return system.getAcceptedIssuers();
                }
            };
            javax.net.ssl.SSLContext context = javax.net.ssl.SSLContext.getInstance("TLS");
            context.init(null, new javax.net.ssl.TrustManager[]{bridged}, null);
            yrFactory = context.getSocketFactory();
        } catch (Throwable t) {
            android.util.Log.w("MorpheReport", "Root YR bridge unavailable: " + t);
        }
        return yrFactory;
    }

    /**
     * Logs what the phone actually reached: the addresses it resolved, and every certificate the
     * server presented, with the system's verdict on them. Runs only after a failed upload.
     */
    private static void diagnose(String host) {
        String tag = "MorpheReport";
        try {
            for (java.net.InetAddress address : java.net.InetAddress.getAllByName(host)) {
                android.util.Log.w(tag, "resolved " + host + " -> " + address.getHostAddress());
            }
        } catch (Throwable t) {
            android.util.Log.w(tag, "resolve failed: " + t);
        }
        javax.net.ssl.X509TrustManager system = null;
        try {
            javax.net.ssl.TrustManagerFactory factory = javax.net.ssl.TrustManagerFactory.getInstance(
                    javax.net.ssl.TrustManagerFactory.getDefaultAlgorithm());
            factory.init((java.security.KeyStore) null);
            for (javax.net.ssl.TrustManager manager : factory.getTrustManagers()) {
                if (manager instanceof javax.net.ssl.X509TrustManager) system = (javax.net.ssl.X509TrustManager) manager;
            }
        } catch (Throwable t) {
            android.util.Log.w(tag, "no system trust manager: " + t);
        }
        javax.net.ssl.X509TrustManager verdict = system;
        java.security.cert.X509Certificate[][] seen = new java.security.cert.X509Certificate[1][];
        javax.net.ssl.X509TrustManager recorder = new javax.net.ssl.X509TrustManager() {
            @Override
            public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String auth) {
            }

            @Override
            public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String auth) {
                seen[0] = chain;
            }

            @Override
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return new java.security.cert.X509Certificate[0];
            }
        };
        javax.net.ssl.SSLSocket socket = null;
        try {
            // Records only. Nothing is sent over this connection.
            javax.net.ssl.SSLContext context = javax.net.ssl.SSLContext.getInstance("TLS");
            context.init(null, new javax.net.ssl.TrustManager[]{recorder}, null);
            socket = (javax.net.ssl.SSLSocket) context.getSocketFactory().createSocket(host, 443);
            socket.setSoTimeout(10000);
            socket.startHandshake();
        } catch (Throwable t) {
            android.util.Log.w(tag, "handshake for diagnosis: " + t);
        } finally {
            try {
                if (socket != null) socket.close();
            } catch (Throwable ignored) {
            }
        }
        java.security.cert.X509Certificate[] chain = seen[0];
        if (chain == null) {
            android.util.Log.w(tag, "no certificate chain received");
            return;
        }
        android.util.Log.w(tag, "server sent " + chain.length + " certificate(s)");
        for (int i = 0; i < chain.length; i++) {
            java.security.cert.X509Certificate cert = chain[i];
            android.util.Log.w(tag, "#" + i + " subject: " + cert.getSubjectX500Principal().getName());
            android.util.Log.w(tag, "#" + i + " issuer:  " + cert.getIssuerX500Principal().getName());
            android.util.Log.w(tag, "#" + i + " valid:   " + cert.getNotBefore() + " to " + cert.getNotAfter());
        }
        if (verdict != null) {
            try {
                verdict.checkServerTrusted(chain, "ECDHE_RSA");
                android.util.Log.w(tag, "system trust: accepted");
            } catch (Throwable t) {
                android.util.Log.w(tag, "system trust: rejected: " + t.getMessage());
            }
        }
    }

    private static void uploaded(Activity activity, String link) {
        clip(activity, link);
        LinearLayout page = MorpheDialog.page(activity, "Report uploaded",
                "The link is copied. Send it to " + HANDLE + " in a Reddit message or chat. It is deleted after 30 days.");
        TextView shown = new TextView(activity);
        shown.setText(link);
        shown.setTextIsSelectable(true);
        shown.setTextSize(15);
        shown.setTextColor(MorpheDialog.text(activity));
        shown.setPadding(0, Math.round(8 * activity.getResources().getDisplayMetrics().density), 0, 0);
        page.addView(shown);
        AlertDialog[] dialog = new AlertDialog[1];
        TextView again = MorpheDialog.action(activity, "Copy link", MorpheDialog.TEXT);
        again.setOnClickListener(v -> {
            clip(activity, link);
            Toast.makeText(activity, "Link copied", Toast.LENGTH_SHORT).show();
        });
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        done.setOnClickListener(v -> dialog[0].dismiss());
        page.addView(MorpheDialog.actions(activity, again, done));
        dialog[0] = MorpheDialog.show(activity, page);
    }

    private static void clip(Context context, String text) {
        try {
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText("Mighty Morphing report", text));
        } catch (Throwable ignored) {
        }
    }
}
