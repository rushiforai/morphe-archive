package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.Manifest;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.widget.Toast;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;

/** Transparent proxy that completes default-folder creation after Android grants access. */
public final class LocalMediaDefaultFolderAccessActivity extends Activity {
    private static final int REQUEST_ALL_FILES_ACCESS = 7202;
    private static final int REQUEST_LEGACY_STORAGE = 7203;
    private boolean requestStarted;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestStarted = savedInstanceState != null &&
                savedInstanceState.getBoolean("requestStarted", false);
        if (!requestStarted) requestAccess();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("requestStarted", requestStarted);
        super.onSaveInstanceState(state);
    }

    private void requestAccess() {
        requestStarted = true;
        if (LocalMediaRuntime.hasDefaultFolderAccess(this)) {
            finishWithFolderResult();
            return;
        }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            requestPermissions(new String[]{
                    Manifest.permission.READ_EXTERNAL_STORAGE,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE
            }, REQUEST_LEGACY_STORAGE);
            return;
        }
        Intent appAccess = new Intent(
                Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                Uri.parse("package:" + getPackageName())
        );
        try {
            startActivityForResult(appAccess, REQUEST_ALL_FILES_ACCESS);
        } catch (ActivityNotFoundException | SecurityException ignored) {
            try {
                startActivityForResult(
                        new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION),
                        REQUEST_ALL_FILES_ACCESS
                );
            } catch (ActivityNotFoundException | SecurityException unavailable) {
                Toast.makeText(this,
                        "Android storage access settings are unavailable",
                        Toast.LENGTH_LONG).show();
                finish();
            }
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_ALL_FILES_ACCESS) finishWithFolderResult();
    }

    @Override public void onRequestPermissionsResult(
            int requestCode,
            String[] permissions,
            int[] grantResults
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQUEST_LEGACY_STORAGE) finishWithFolderResult();
    }

    private void finishWithFolderResult() {
        if (!LocalMediaRuntime.hasDefaultFolderAccess(this)) {
            Toast.makeText(this,
                    "Storage access required. Return to Library > Storage to retry.",
                    Toast.LENGTH_LONG).show();
        } else if (!LocalMediaRuntime.ensureDefaultFolder(this)) {
            Toast.makeText(this,
                    "Movies/Nuvio could not be created",
                    Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(this,
                    "Storage folder ready: Movies/Nuvio",
                    Toast.LENGTH_SHORT).show();
        }
        LocalMediaLibraryUi.invalidate();
        MorpheSettingsUi.refresh();
        finish();
    }
}
