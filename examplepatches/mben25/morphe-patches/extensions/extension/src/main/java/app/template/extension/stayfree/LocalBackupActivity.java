package app.template.extension.stayfree;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Invisible activity that drives the system file picker for {@link LocalBackup}: it owns the
 * picker's result (StayFree's own activities can't receive it), runs the export or restore off
 * the main thread, and finishes.
 */
@SuppressWarnings("unused")
public final class LocalBackupActivity extends Activity {
    static final String ACTION_EXPORT = "app.template.extension.stayfree.LOCAL_BACKUP_EXPORT";
    static final String ACTION_RESTORE = "app.template.extension.stayfree.LOCAL_BACKUP_RESTORE";

    private static final int REQUEST_PICK = 0x5F0A;
    private static final String STATE_PICKING = "picking";

    private final Handler main = new Handler(Looper.getMainLooper());

    static void start(Context context, String action) {
        context.startActivity(new Intent(context, LocalBackupActivity.class).setAction(action));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Recreated while the picker is open: its result still comes to this instance.
        if (savedInstanceState != null && savedInstanceState.getBoolean(STATE_PICKING)) return;

        Intent picker;
        if (ACTION_EXPORT.equals(getIntent().getAction())) {
            String stamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm", Locale.US).format(new Date());
            picker = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("application/zip")
                    .putExtra(Intent.EXTRA_TITLE, "StayFree-backup_" + stamp + ".zip");
        } else if (ACTION_RESTORE.equals(getIntent().getAction())) {
            picker = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    // Some providers report zips as octet-stream.
                    .setType("*/*")
                    .putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                            "application/zip", "application/x-zip-compressed", "application/octet-stream"});
        } else {
            finish();
            return;
        }

        try {
            startActivityForResult(picker, REQUEST_PICK);
        } catch (ActivityNotFoundException e) {
            toast("No file picker available");
            finish();
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putBoolean(STATE_PICKING, true);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_PICK) return;
        Uri uri = data != null ? data.getData() : null;
        if (resultCode != RESULT_OK || uri == null) {
            finish();
            return;
        }

        if (ACTION_EXPORT.equals(getIntent().getAction())) {
            toast("Exporting backup…");
            new Thread(() -> runExport(uri), "StayFreeLocalBackup").start();
        } else {
            toast("Reading backup…");
            new Thread(() -> runRestore(uri), "StayFreeLocalBackup").start();
        }
    }

    private void runExport(Uri uri) {
        String message;
        try (OutputStream out = getContentResolver().openOutputStream(uri, "wt")) {
            if (out == null) throw new java.io.IOException("Cannot open " + uri);
            LocalBackup.export(getApplicationContext(), out);
            message = "Backup exported";
        } catch (Exception e) {
            Log.e(LocalBackup.TAG, "Export failed", e);
            message = "Export failed: " + e.getMessage();
        }
        String result = message;
        main.post(() -> {
            toast(result);
            finish();
        });
    }

    private void runRestore(Uri uri) {
        boolean staged;
        String error = null;
        try (InputStream in = getContentResolver().openInputStream(uri)) {
            if (in == null) throw new java.io.IOException("Cannot open " + uri);
            staged = LocalBackup.stageRestore(getApplicationContext(), in);
            if (!staged) error = "This file is not a StayFree local backup.";
        } catch (Exception e) {
            Log.e(LocalBackup.TAG, "Restore failed", e);
            staged = false;
            error = "Restore failed: " + e.getMessage();
        }

        boolean ok = staged;
        String failure = error;
        main.post(() -> {
            if (isFinishing() || isDestroyed()) {
                if (ok) LocalBackup.restartApp(this);
                return;
            }
            if (ok) {
                toast("Backup restored, restarting StayFree…");
                main.postDelayed(() -> LocalBackup.restartApp(this), 600);
            } else {
                new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                        .setTitle("Restore failed")
                        .setMessage(failure)
                        .setPositiveButton(android.R.string.ok, null)
                        .setOnDismissListener(dialog -> finish())
                        .show();
            }
        });
    }

    private void toast(String message) {
        Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
    }
}
