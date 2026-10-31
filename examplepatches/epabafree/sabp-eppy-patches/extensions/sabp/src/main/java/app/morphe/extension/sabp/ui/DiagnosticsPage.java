package app.morphe.extension.sabp.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Build;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyDiag;
import app.morphe.extension.sabp.EppyFlags;
import app.morphe.extension.sabp.EppyRoute;
import app.morphe.extension.sabp.EppyTheme;

/**
 * Diagnostics: versions, which SABP hooks the patch found, a runtime check of each bridge,
 * feature kill switches, storage used by eppy, recent errors, the last crash and an exportable
 * log. Reached from Settings → About (and by tapping the version line five times).
 */
public final class DiagnosticsPage extends Page {
    public static final String KEY = "diagnostics";

    public DiagnosticsPage(Host host) {
        super(host, KEY, null, "Diagnostics", true);
        build();
    }

    private void build() {
        body.removeAllViews();

        sectionTitle("Versions");
        LinearLayout v = card();
        mono(v, summary(c));

        sectionTitle("Patch hooks");
        LinearLayout h = card();
        String report = EppyBridge.hookReport();
        if (report == null || report.isEmpty()) {
            note(h, EppyBridge.isLinked() ? "The patch predates the hook report." : "The eppy bytecode patch was not applied: eppy can't control playback.");
        } else {
            int missing = 0;
            StringBuilder b = new StringBuilder();
            for (String e : report.split(";")) {
                int eq = e.indexOf('=');
                if (eq < 0) continue;
                boolean ok = e.substring(eq + 1).equals("ok");
                if (!ok) missing++;
                b.append(ok ? "✓ " : "✗ ").append(e.substring(0, eq));
                if (!ok) b.append(" — ").append(e.substring(eq + 1)).append(" → ").append(effect(e.substring(0, eq)));
                b.append('\n');
            }
            note(h, missing == 0 ? "All SABP targets were found when patching." : missing + " optional target(s) were not found. The features that need them are hidden.");
            mono(h, b.toString().trim());
        }
        row(h, chip(EppyIcon.CHECK, "Run runtime check", () -> show("Runtime check", EppyBridge.selfCheck(c))));

        sectionTitle("Feature switches");
        LinearLayout f = card();
        note(f, "Turn a feature off to rule it out when something misbehaves. It stays off until you turn it back on here.");
        for (String flag : EppyFlags.ALL) {
            f.addView(switchRow(EppyFlags.title(flag), null, EppyFlags.on(c, flag), (b, on) -> EppyFlags.set(c, flag, on)));
        }

        sectionTitle("Storage used by eppy");
        LinearLayout s = card();
        mono(s, storage(c));

        sectionTitle("Recent errors");
        LinearLayout e = card();
        String errors = EppyDiag.lastErrors();
        if (errors.isEmpty()) note(e, "No errors recorded.");
        else {
            mono(e, errors);
            row(e, chip(EppyIcon.LIST, "Copy", () -> copy("eppy errors", errors)),
                    chip(EppyIcon.CLOSE, "Clear", () -> {
                        EppyDiag.clearErrors();
                        build();
                    }));
        }

        sectionTitle("Last crash");
        LinearLayout cr = card();
        String crash = EppyDiag.lastCrash();
        if (crash == null) note(cr, "No crash recorded.");
        else {
            note(cr, firstLines(crash, 4));
            row(cr, chip(EppyIcon.LIST, "Copy crash report", () -> copy("eppy crash report", crash)),
                    chip(EppyIcon.FORWARD, "Share", () -> share("eppy crash report", crash)),
                    chip(EppyIcon.CLOSE, "Clear", () -> {
                        EppyDiag.clearCrash();
                        build();
                    }));
        }

        sectionTitle("Log");
        LinearLayout l = card();
        note(l, "What eppy did recently (no book text or audio). Attach it to a bug report.");
        row(l, chip(EppyIcon.LIST, "View", () -> show("eppy log", fullReport())),
                chip(EppyIcon.CHECK, "Copy", () -> copy("eppy log", fullReport())),
                chip(EppyIcon.FORWARD, "Export", () -> share("eppy diagnostics", fullReport())));
    }

    /** What the user loses when a hook is missing. */
    private static String effect(String hook) {
        switch (hook) {
            case "covers":
            case "coverLoader": return "no covers in eppy";
            case "seek":
            case "seekTracking": return "seek bar is read-only";
            case "filePosition": return "position from media session only";
            case "jump": return "chapters/bookmarks can't jump";
            case "bookmarksLoad":
            case "bookmarksSave": return "bookmarks open in Classic";
            case "charactersLoad":
            case "charactersSave": return "characters open in Classic";
            case "speed": return "speed panel uses SABP's speed toggle only";
            case "sleepRemaining": return "no countdown on the sleep button";
            case "classicMenu":
            case "classicSettings": return "use the app-icon shortcut to switch back";
            default: return "feature hidden";
        }
    }

    public static String summary(Context c) {
        StringBuilder b = new StringBuilder();
        b.append("eppy ").append(EppyTheme.configString(c, "eppy_version", "?")).append('\n');
        try {
            android.content.pm.PackageInfo pi = c.getPackageManager().getPackageInfo(c.getPackageName(), 0);
            b.append("Smart AudioBook Player ").append(pi.versionName).append(" (").append(pi.getLongVersionCode()).append(")\n");
        } catch (Throwable ignored) {
        }
        b.append("Android ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT).append(") · ")
                .append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');
        b.append("Player interface: ").append(EppyRoute.playerInterface(c)).append('\n');
        b.append("Style: ").append(EppyTheme.prefs(c).getString("skin", EppyTheme.configString(c, "eppy_default_skin", "material"))).append('\n');
        b.append("Speech matching patch option: ").append(EppyTheme.configString(c, "eppy_speech", "off"));
        return b.toString();
    }

    public static String storage(Context c) {
        StringBuilder b = new StringBuilder();
        File files = c.getFilesDir();
        File[] list = files.listFiles();
        long eppyFiles = 0;
        if (list != null) {
            for (File f : list) {
                if (!f.getName().startsWith("eppy")) continue;
                long size = size(f);
                eppyFiles += size;
                b.append(f.getName()).append(": ").append(human(size)).append('\n');
            }
        }
        File prefs = new File(c.getApplicationInfo().dataDir, "shared_prefs");
        File[] pl = prefs.listFiles();
        long prefBytes = 0;
        if (pl != null) for (File f : pl) if (f.getName().startsWith("eppy")) prefBytes += f.length();
        b.append("settings and metadata cache: ").append(human(prefBytes)).append('\n');
        b.append("app cache folder (shared with SABP): ").append(human(size(c.getCacheDir()))).append('\n');
        b.append("eppy total: ").append(human(eppyFiles + prefBytes));
        return b.toString();
    }

    private static long size(File f) {
        if (f == null || !f.exists()) return 0;
        if (f.isFile()) return f.length();
        long s = 0;
        File[] l = f.listFiles();
        if (l != null) for (File x : l) s += size(x);
        return s;
    }

    private static String human(long b) {
        if (b < 1024) return b + " B";
        if (b < 1024 * 1024) return String.format(java.util.Locale.US, "%.1f KB", b / 1024.0);
        return String.format(java.util.Locale.US, "%.1f MB", b / (1024.0 * 1024));
    }

    private String fullReport() {
        return summary(c) + "\n\nHooks: " + EppyBridge.hookReport()
                + "\n\nFeature switches: " + flags()
                + "\n\n" + storage(c)
                + "\n\n--- recent errors ---\n" + EppyDiag.lastErrors()
                + "\n--- log ---\n" + EppyDiag.logText();
    }

    private String flags() {
        StringBuilder b = new StringBuilder();
        for (String f : EppyFlags.ALL) b.append(f).append('=').append(EppyFlags.on(c, f) ? "on" : "off").append(' ');
        return b.toString().trim();
    }

    private void mono(ViewGroup parent, String s) {
        TextView tv = Ui.text(c, t, s, 12, 400, t.onSurface);
        tv.setTypeface(Typeface.MONOSPACE);
        tv.setTextIsSelectable(true);
        tv.setPadding(Ui.dp(c, 16), Ui.dp(c, 6), Ui.dp(c, 16), Ui.dp(c, 6));
        parent.addView(tv);
    }

    private LinearLayout chip(int icon, String label, Runnable r) {
        return Ui.chip(c, t, icon, label, false, v -> r.run());
    }

    private void row(ViewGroup parent, LinearLayout... chips) {
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 16), Ui.dp(c, 4), Ui.dp(c, 16), Ui.dp(c, 8));
        for (int i = 0; i < chips.length; i++) {
            if (i > 0) row.addView(Ui.space(c, 8, 1));
            row.addView(chips[i]);
        }
        HorizontalScrollView hs = new HorizontalScrollView(c);
        hs.setHorizontalScrollBarEnabled(false);
        hs.addView(row);
        parent.addView(hs);
    }

    private static String firstLines(String s, int n) {
        String[] lines = s.split("\n");
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < Math.min(n, lines.length); i++) b.append(i > 0 ? "\n" : "").append(lines[i].trim());
        return b.toString();
    }

    private void copy(String label, String text) {
        ClipboardManager cm = (ClipboardManager) c.getSystemService(Context.CLIPBOARD_SERVICE);
        if (cm != null) cm.setPrimaryClip(ClipData.newPlainText(label, text));
        Toast.makeText(c, "Copied. Paste it into your bug report.", Toast.LENGTH_SHORT).show();
    }

    private void share(String subject, String text) {
        Intent i = new Intent(Intent.ACTION_SEND);
        i.setType("text/plain");
        i.putExtra(Intent.EXTRA_SUBJECT, subject);
        i.putExtra(Intent.EXTRA_TEXT, text);
        try {
            c.startActivity(Intent.createChooser(i, "Export " + subject));
        } catch (Throwable e) {
            copy(subject, text);
        }
    }

    private void show(String title, String text) {
        Sheet sh = new Sheet(host.overlayRoot(), t, title);
        TextView tv = Ui.text(c, t, text, 12, 400, t.onSurface);
        tv.setTypeface(Typeface.MONOSPACE);
        tv.setTextIsSelectable(true);
        tv.setPadding(Ui.dp(c, 24), 0, Ui.dp(c, 24), Ui.dp(c, 16));
        sh.content().addView(tv);
        sh.item(EppyIcon.LIST, "Copy", null, () -> copy(title, text));
        sh.show();
    }
}
