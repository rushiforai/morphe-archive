package dev.jason.gboardpatches.extension.webclipboard;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsActivity;

public final class WebClipboardTilePreferencesActivity extends Activity {
    private static final String TAG = "GboardWebClipboard";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            Intent settingsIntent =
                    GboardPatchesSettingsActivity.createWebClipboardSettingsIntent(this);
            settingsIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            startActivity(settingsIntent);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to open Web Clipboard tile preferences", throwable);
        } finally {
            finish();
        }
    }
}
