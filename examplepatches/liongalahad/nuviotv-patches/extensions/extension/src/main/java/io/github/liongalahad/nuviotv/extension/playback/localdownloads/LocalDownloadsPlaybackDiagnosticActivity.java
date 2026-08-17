package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;

/** Temporary tester-facing diagnostics for device-specific downloaded-file playback failures. */
public final class LocalDownloadsPlaybackDiagnosticActivity extends Activity {
    private static final String PREFS = "morphe_patches";
    private static final String REPORT_KEY = "debug.local_downloads.playback_report";
    private static final String EXTRA_REPORT = "report";
    private static final AtomicBoolean INSTALLED = new AtomicBoolean();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile String armedReport;
    private String displayedReport;

    static void install(Context context) {
        if (context == null || !INSTALLED.compareAndSet(false, true)) return;
        Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            String armed = armedReport;
            if (armed != null) persist(context, armed +
                    "\n\nStage: uncaught player crash" +
                    "\nThread: " + safe(thread == null ? null : thread.getName()) +
                    "\n\n" + stackTrace(error));
            if (previous != null) previous.uncaughtException(thread, error);
        });
        MAIN.postDelayed(() -> showSaved(context), 1_200L);
    }

    static void arm(Context context, String origin, String mediaUri, String route, Object controller) {
        install(context);
        String uriDetails = "URI: (empty)";
        try {
            Uri uri = Uri.parse(mediaUri);
            String scheme = uri.getScheme() == null ? "none" : uri.getScheme();
            uriDetails = "URI scheme: " + scheme + "\nURI: " + safeLong(mediaUri);
            if ("file".equalsIgnoreCase(scheme)) {
                File file = new File(uri.getPath());
                uriDetails += "\nFile exists: " + file.exists() +
                        "\nFile readable: " + file.canRead() +
                        "\nFile bytes: " + file.length();
            } else if ("content".equalsIgnoreCase(scheme)) {
                uriDetails += "\nProvider: " + safe(uri.getAuthority());
            }
        } catch (RuntimeException error) {
            uriDetails += "\nURI inspection: " + error.getClass().getName() +
                    ": " + safe(error.getMessage());
        }
        armedReport = header(context, "DL-PLAYBACK") +
                "\nOrigin: " + safe(origin) +
                "\n" + uriDetails +
                "\nRoute length: " + (route == null ? 0 : route.length()) +
                "\nRoute: " + safeLong(route) +
                "\nController: " + (controller == null ? "null" : controller.getClass().getName()) +
                "\nDestination: " + controllerDestination(controller);
    }

    static void report(Context context, String stage, Throwable error) {
        String report = (armedReport == null ? header(context, "DL-PLAYBACK") : armedReport) +
                "\n\nStage: " + safe(stage) + "\n\n" + stackTrace(error);
        persist(context, report);
        show(context, report);
    }

    private static String stackTrace(Throwable source) {
        Throwable error = source;
        if (error instanceof InvocationTargetException &&
                ((InvocationTargetException) error).getTargetException() != null) {
            error = ((InvocationTargetException) error).getTargetException();
        }
        if (error == null) return "No exception was supplied.";
        StringWriter buffer = new StringWriter();
        error.printStackTrace(new PrintWriter(buffer));
        return buffer.toString();
    }

    private static String header(Context context, String code) {
        String version = "unknown";
        try {
            android.content.pm.PackageInfo info = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0);
            version = info.versionName + " (" +
                    (Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode) + ")";
        } catch (Throwable ignored) { }
        return "NuvioTV local playback diagnostic" +
                "\nGenerated: " + new SimpleDateFormat(
                        "yyyy-MM-dd HH:mm:ss Z", Locale.US).format(new Date()) +
                "\nCode: " + code +
                "\nPackage: " + safe(context.getPackageName()) +
                "\nVersion: " + safe(version) +
                "\nDevice: " + safe(Build.MANUFACTURER) + " " + safe(Build.MODEL) +
                "\nAndroid: " + safe(Build.VERSION.RELEASE) + " (API " + Build.VERSION.SDK_INT + ")" +
                "\nABI: " + (Build.SUPPORTED_ABIS.length == 0 ? "unknown" : Build.SUPPORTED_ABIS[0]) +
                "\nBuild: " + safe(Build.FINGERPRINT);
    }

    private static String controllerDestination(Object controller) {
        if (controller == null) return "controller is null";
        try {
            for (Class<?> owner = controller.getClass(); owner != null; owner = owner.getSuperclass()) {
                try {
                    Method method = owner.getDeclaredMethod("h");
                    method.setAccessible(true);
                    Object destination = method.invoke(controller);
                    return safeLong(String.valueOf(destination));
                } catch (NoSuchMethodException ignored) { }
            }
            return "current-destination method not found";
        } catch (Throwable error) {
            return error.getClass().getName() + ": " + safe(error.getMessage());
        }
    }

    private static String safe(String value) {
        if (value == null || value.trim().isEmpty()) return "(empty)";
        value = value.replace('\n', ' ').replace('\r', ' ').trim();
        return value.length() > 700 ? value.substring(0, 700) : value;
    }

    private static String safeLong(String value) {
        if (value == null || value.trim().isEmpty()) return "(empty)";
        value = value.replace('\r', ' ').trim();
        return value.length() > 12_000 ? value.substring(0, 12_000) : value;
    }

    private static void persist(Context context, String report) {
        if (context != null) context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putString(REPORT_KEY, report).commit();
    }

    private static void showSaved(Context context) {
        String report = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString(REPORT_KEY, null);
        if (report == null || report.isEmpty()) return;
        show(context, report);
    }

    private static void show(Context context, String report) {
        Intent intent = new Intent(context, LocalDownloadsPlaybackDiagnosticActivity.class)
                .putExtra(EXTRA_REPORT, report)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        try { context.startActivity(intent); }
        catch (RuntimeException ignored) { }
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        String report = getIntent().getStringExtra(EXTRA_REPORT);
        if (report == null || report.isEmpty()) { finish(); return; }
        displayedReport = report;

        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setPadding(dp(24), dp(24), dp(24), dp(24));
        outer.setBackgroundColor(0xE6000000);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(28), dp(24), dp(28), dp(24));
        card.setBackground(LocalDownloadsTvUi.shape(
                LocalDownloadsTvUi.CARD, dp(18), dp(1), Color.rgb(90, 90, 90)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(760), dp(520)));

        TextView title = LocalDownloadsTvUi.text(this, 24, LocalDownloadsTvUi.TEXT_PRIMARY);
        title.setText("Playback diagnostic");
        card.addView(title, new LinearLayout.LayoutParams(-1, -2));

        TextView instruction = LocalDownloadsTvUi.text(this, 17, LocalDownloadsTvUi.TEXT_PRIMARY);
        instruction.setText("Save the diagnostic log into Local storage, then send the text file to the developer.");
        LinearLayout.LayoutParams instructionParams = new LinearLayout.LayoutParams(-1, -2);
        instructionParams.topMargin = dp(10);
        card.addView(instruction, instructionParams);

        TextView details = LocalDownloadsTvUi.text(this, 15, LocalDownloadsTvUi.TEXT_SECONDARY);
        details.setText(report);
        details.setTextIsSelectable(true);
        ScrollView scroll = new ScrollView(this);
        scroll.addView(details, new ScrollView.LayoutParams(-1, -2));
        LinearLayout.LayoutParams scrollParams = new LinearLayout.LayoutParams(-1, 0, 1f);
        scrollParams.topMargin = dp(16);
        card.addView(scroll, scrollParams);

        LinearLayout actions = new LinearLayout(this);
        actions.setGravity(Gravity.END);
        Button save = LocalDownloadsTvUi.button(this, "Save log file");
        save.setOnClickListener(view -> saveLogToLocalStorage());
        actions.addView(save, new LinearLayout.LayoutParams(dp(230), dp(56)));
        Button close = LocalDownloadsTvUi.button(this, "Close");
        close.setOnClickListener(view -> {
            clearSavedReport();
            finish();
        });
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(dp(180), dp(56));
        closeParams.leftMargin = dp(12);
        actions.addView(close, closeParams);
        LinearLayout.LayoutParams actionsParams = new LinearLayout.LayoutParams(-1, dp(56));
        actionsParams.topMargin = dp(14);
        card.addView(actions, actionsParams);

        setContentView(outer);
        save.requestFocus();
    }

    @Override public void onBackPressed() { finish(); }

    private void saveLogToLocalStorage() {
        String filename = "NuvioTV-local-playback-diagnostic-" +
                new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date()) + ".txt";
        try {
            Uri root = MorpheStoragePath.uri();
            try (OutputStream output = openLog(root, filename)) {
                if (output == null) throw new IOException("Selected storage path could not be opened");
                output.write(displayedReport.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                output.flush();
            }
            clearSavedReport();
            Toast.makeText(this, "Saved in Local storage as " + filename,
                    Toast.LENGTH_LONG).show();
            finish();
        } catch (Throwable error) {
            Toast.makeText(this, "Unable to save the log in Local storage: " +
                    safe(error.getMessage()), Toast.LENGTH_LONG).show();
        }
    }

    private OutputStream openLog(Uri root, String filename) throws IOException {
        if (root != null && "file".equalsIgnoreCase(root.getScheme())) {
            File folder = new File(root.getPath());
            if (!folder.isDirectory() && !folder.mkdirs()) {
                throw new IOException("Storage folder could not be created");
            }
            return new FileOutputStream(new File(folder, filename));
        }
        if (root != null && "content".equalsIgnoreCase(root.getScheme())) {
            Uri documentRoot = DocumentsContract.buildDocumentUriUsingTree(
                    root, DocumentsContract.getTreeDocumentId(root));
            Uri document = DocumentsContract.createDocument(
                    getContentResolver(), documentRoot, "text/plain", filename);
            if (document == null) throw new IOException("Log file could not be created");
            OutputStream output = getContentResolver().openOutputStream(document, "w");
            if (output == null) throw new IOException("Log file could not be opened");
            return output;
        }
        throw new IOException("Unsupported Local storage path");
    }

    private void clearSavedReport() {
        getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().remove(REPORT_KEY).commit();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }
}
