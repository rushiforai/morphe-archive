package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

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
import io.github.liongalahad.nuviotv.extension.settings.MorpheStoragePath;

/** Requests access for the default Movies/Nuvio path when no usable SAF picker exists. */
public final class LocalDownloadsDefaultFolderAccessActivity extends Activity {
    private static final int REQUEST_ACCESS = 7312;
    private boolean started;
    @Override protected void onCreate(Bundle state) {
        super.onCreate(state); started = state != null && state.getBoolean("started", false);
        if (!started) requestAccess();
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("started", started); super.onSaveInstanceState(state);
    }
    private void requestAccess() {
        started = true;
        if (LocalDownloadsRuntime.hasDefaultFolderAccess(this)) { finishRequest(); return; }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            requestPermissions(new String[]{Manifest.permission.READ_EXTERNAL_STORAGE,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE}, REQUEST_ACCESS); return;
        }
        try {
            startActivityForResult(new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                    Uri.parse("package:" + getPackageName())), REQUEST_ACCESS);
        } catch (ActivityNotFoundException | SecurityException error) {
            try { startActivityForResult(new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION), REQUEST_ACCESS); }
            catch (ActivityNotFoundException | SecurityException unavailable) { finishRequest(); }
        }
    }
    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data); if (requestCode == REQUEST_ACCESS) finishRequest();
    }
    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results); if (requestCode == REQUEST_ACCESS) finishRequest();
    }
    private void finishRequest() {
        if (LocalDownloadsRuntime.hasDefaultFolderAccess(this) &&
                (MorpheStoragePath.defaultFolder().isDirectory() || MorpheStoragePath.defaultFolder().mkdirs())) {
            Toast.makeText(this, "Local storage path: Movies/Nuvio", Toast.LENGTH_SHORT).show();
            setResult(RESULT_OK); MorpheSettingsUi.refresh();
        } else {
            Toast.makeText(this, "Storage access was not granted", Toast.LENGTH_LONG).show();
            setResult(RESULT_CANCELED);
        }
        finish();
    }
}
