package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.widget.Toast;

/** Transient system-document-picker host. The selected source is copied into private app storage. */
public final class LocalSubtitlePickerActivity extends Activity {
    private static final int OPEN_SUBTITLE = 7712;
    private static final String STATE_LAUNCHED = "morphe_picker_launched";

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state == null || !state.getBoolean(STATE_LAUNCHED, false)) openPicker();
    }

    @Override
    protected void onSaveInstanceState(Bundle state) {
        state.putBoolean(STATE_LAUNCHED, true);
        super.onSaveInstanceState(state);
    }

    private void openPicker() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*")
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        try {
            startActivityForResult(intent, OPEN_SUBTITLE);
        } catch (ActivityNotFoundException error) {
            Toast.makeText(this, "No compatible file picker is installed", Toast.LENGTH_LONG).show();
            finish();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != OPEN_SUBTITLE) return;
        LocalSubtitleRuntime.ImportedSubtitle imported = null;
        if (resultCode == RESULT_OK && data != null && data.getData() != null) {
            Uri uri = data.getData();
            String name = displayName(uri);
            try {
                imported = LocalSubtitleRuntime.importFile(this, uri, name);
                Toast.makeText(this, "Imported " + imported.displayName, Toast.LENGTH_SHORT).show();
            } catch (Throwable error) {
                String message = error.getMessage();
                Toast.makeText(
                        this,
                        message == null || message.trim().isEmpty() ? "Unable to import subtitle file" : message,
                        Toast.LENGTH_LONG
                ).show();
            }
        }
        finish();
        if (imported != null) LocalSubtitleRuntime.selectAfterPickerReturns(imported);
    }

    private String displayName(Uri uri) {
        try (Cursor cursor = getContentResolver().query(
                uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null
        )) {
            if (cursor != null && cursor.moveToFirst()) {
                String name = cursor.getString(0);
                if (name != null && !name.trim().isEmpty()) return name;
            }
        } catch (Throwable ignored) {
            // Fall through to the final URI segment.
        }
        String segment = uri.getLastPathSegment();
        return segment == null || segment.trim().isEmpty() ? "subtitle.srt" : segment;
    }
}
