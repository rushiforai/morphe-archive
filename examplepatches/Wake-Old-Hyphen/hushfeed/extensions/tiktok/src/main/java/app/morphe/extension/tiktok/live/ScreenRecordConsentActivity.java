/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.live;

import android.app.Activity;
import android.content.Intent;
import android.media.projection.MediaProjectionManager;
import android.os.Bundle;

import app.morphe.extension.shared.Logger;

/**
 * A see-through screen that shows Android's own screen recording consent and reports the answer
 * to {@link ScreenCapture} (#37). It draws nothing of its own.
 */
public final class ScreenRecordConsentActivity extends Activity {
    private static final int REQUEST = 3701;

    @Override
    protected void onCreate(Bundle state) {
        setTheme(android.R.style.Theme_Translucent_NoTitleBar);
        super.onCreate(state);
        if (state != null) return;
        try {
            MediaProjectionManager manager = (MediaProjectionManager) getSystemService(MEDIA_PROJECTION_SERVICE);
            startActivityForResult(manager.createScreenCaptureIntent(), REQUEST);
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Could not ask for screen recording", failure);
            ScreenCapture.denied();
            finish();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST && resultCode == RESULT_OK && data != null) {
            ScreenCapture.consented(getApplicationContext(), resultCode, data);
        } else {
            ScreenCapture.denied();
        }
        finish();
    }
}
