package app.afterglow.extension.diagnostics;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.i18n.L10n;

/** The native Android share sheet receives a read-only text file, with clipboard fallback. */
public final class DebugLogShare {
    private DebugLogShare() {}
    public static void show(Activity activity) {
        DebugLog.readForShare(body -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            if (body.isEmpty()) {
                Toast.makeText(activity, L10n.get("NoDebugLog", "No log yet — enable Debug Logging first."), Toast.LENGTH_SHORT).show();
                return;
            }
            Context context = activity.getApplicationContext();
            new Thread(() -> {
                Uri uri = null;
                try { uri = DebugLogProvider.snapshot(context, body); }
                catch (Exception ignored) { /* Same clipboard fallback as iOS. */ }
                Uri snapshot = uri;
                Afterglow.runOnMain(() -> {
                    if (activity.isFinishing() || activity.isDestroyed()) return;
                    if (snapshot != null) {
                        try {
                            Intent send = new Intent(Intent.ACTION_SEND).setType("text/plain")
                                    .putExtra(Intent.EXTRA_STREAM, snapshot)
                                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                            send.setClipData(ClipData.newUri(activity.getContentResolver(), DebugLogProvider.FILE_NAME, snapshot));
                            activity.startActivity(Intent.createChooser(send, L10n.get("ShareDebugLog", "Share debug log")));
                            return;
                        } catch (Exception ignored) { /* Clipboard remains available. */ }
                    }
                    try {
                        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                        clipboard.setPrimaryClip(ClipData.newPlainText(DebugLogProvider.FILE_NAME, body));
                        Toast.makeText(activity, L10n.get("LogCopied", "Log copied"), Toast.LENGTH_SHORT).show();
                    } catch (Exception error) {
                        Toast.makeText(activity, "Could not share the debug log.", Toast.LENGTH_LONG).show();
                    }
                });
            }, "Afterglow-share-log").start();
        });
    }
}
