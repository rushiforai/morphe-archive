package app.yydarlinker.aicaptions.diagnostics;

import app.yydarlinker.aicaptions.settings.CaptionSettingsDialogs;
import app.yydarlinker.aicaptions.settings.CaptionSettingsPreference;
import app.yydarlinker.aicaptions.settings.CaptionStrings;
import app.yydarlinker.aicaptions.settings.MorpheDialog;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.widget.Toast;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/** Opens the recent diagnostic text on demand from the settings page. */
@SuppressWarnings("deprecation")
public final class CaptionDiagnosticsDialogs {

    private boolean loading;

    public void open(Context context) {
        if (loading) return;
        loading = true;
        Handler main = new Handler(Looper.getMainLooper());
        CaptionDiagnostics.export(text -> main.post(() -> {
            loading = false;
            if (CaptionSettingsPreference.hasWindow(context))
                CaptionSettingsDialogs.run(context, () -> showText(context, text));
        }));
    }

    private static void showText(Context context, String text) {
        String title = CaptionStrings.get(context, "diagnostics");
        boolean empty = text.isEmpty();
        Runnable copy = empty ? null : () -> CaptionSettingsDialogs.run(context, () -> {
            ClipboardManager clipboard = context.getSystemService(ClipboardManager.class);
            if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText(title, text));
        });
        Runnable save = empty || Build.VERSION.SDK_INT < 29 ? null : () -> saveInBackground(context, text);
        new MorpheDialog(context, title).diagnostics(
                empty ? CaptionStrings.get(context, "diagnostic_no_records") : text,
                CaptionStrings.get(context, "copy"), copy,
                CaptionStrings.get(context, "save_diagnostics"), save,
                CaptionStrings.get(context, "clear_diagnostics_action"), () -> confirmClear(context),
                CaptionStrings.get(context, "close")).show();
    }

    private static void confirmClear(Context context) {
        String title = CaptionStrings.get(context, "clear_diagnostics");
        CaptionSettingsDialogs.confirm(context, title,
                "clear_diagnostics_confirm", "clear_diagnostics_action",
                () -> CaptionDiagnostics.clear(context));
    }

    private static void saveInBackground(Context context, String text) {
        Context app = context.getApplicationContext();
        Handler main = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            String name = "caption-diagnostics-" + System.currentTimeMillis() + ".txt";
            String message;
            try {
                save(app.getContentResolver(), name, text);
                message = String.format(Locale.ROOT, CaptionStrings.get(app, "save_ok"), name);
            } catch (IOException | RuntimeException error) {
                message = String.format(Locale.ROOT, CaptionStrings.get(app, "save_failed"),
                        CaptionDiagnostics.errorDetail(error));
            }
            String result = message;
            main.post(() -> Toast.makeText(app, result, Toast.LENGTH_LONG).show());
        }, "caption-diagnostics-export").start();
    }

    private static void save(ContentResolver resolver, String name, String text) throws IOException {
        ContentValues values = new ContentValues();
        values.put(MediaStore.Downloads.DISPLAY_NAME, name);
        values.put(MediaStore.Downloads.MIME_TYPE, "text/plain");
        values.put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
        values.put(MediaStore.Downloads.IS_PENDING, 1);
        Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
        if (uri == null) throw new IOException("diagnostics_create_failed");
        boolean saved = false;
        try {
            try (OutputStream stream = resolver.openOutputStream(uri)) {
                if (stream == null) throw new IOException("diagnostics_open_failed");
                stream.write(text.getBytes(StandardCharsets.UTF_8));
            }
            values.clear();
            values.put(MediaStore.Downloads.IS_PENDING, 0);
            if (resolver.update(uri, values, null, null) != 1)
                throw new IOException("diagnostics_publish_failed");
            saved = true;
        } finally {
            if (!saved) resolver.delete(uri, null, null);
        }
    }
}
