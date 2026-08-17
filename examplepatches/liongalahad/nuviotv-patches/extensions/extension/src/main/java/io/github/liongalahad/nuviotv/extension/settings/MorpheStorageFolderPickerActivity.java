package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.provider.DocumentsContract;
import android.widget.Toast;

import java.util.List;

/** Shared SAF-first folder picker for every installed local-storage consumer. */
public final class MorpheStorageFolderPickerActivity extends Activity {
    private static final int REQUEST_TREE = 7351;
    public static final String EXTRA_FOLDER_PATH =
            "io.github.liongalahad.nuviotv.extra.MORPHE_STORAGE_FOLDER_PATH";
    private boolean started;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        started = state != null && state.getBoolean("started", false);
        if (!started) launch();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("started", started);
        super.onSaveInstanceState(state);
    }

    private void launch() {
        started = true;
        if (MorpheStorageInternalFolderPickerActivity.hasDirectAccess(this)) {
            startActivityForResult(
                    new Intent(this, MorpheStorageInternalFolderPickerActivity.class), REQUEST_TREE);
            return;
        }
        Intent source = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).addFlags(
                Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION |
                        Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION |
                        Intent.FLAG_GRANT_PREFIX_URI_PERMISSION
        );
        source.putExtra(DocumentsContract.EXTRA_INITIAL_URI, DocumentsContract.buildDocumentUri(
                "com.android.externalstorage.documents", MorpheStoragePath.DEFAULT_DOCUMENT_ID));
        if (launchDocumentsUi(source, "com.google.android.documentsui") ||
                launchDocumentsUi(source, "com.android.documentsui")) return;
        List<ResolveInfo> candidates = getPackageManager().queryIntentActivities(source, 0);
        for (ResolveInfo candidate : candidates) {
            if (!isUsableTreePicker(candidate)) continue;
            try {
                startActivityForResult(new Intent(source).setComponent(new ComponentName(
                        candidate.activityInfo.packageName, candidate.activityInfo.name)), REQUEST_TREE);
                return;
            } catch (ActivityNotFoundException | SecurityException ignored) { }
        }
        startActivityForResult(
                new Intent(this, MorpheStorageInternalFolderPickerActivity.class), REQUEST_TREE);
    }

    private boolean launchDocumentsUi(Intent source, String pkg) {
        try {
            startActivityForResult(new Intent(source).setComponent(new ComponentName(
                    pkg, "com.android.documentsui.picker.PickActivity")), REQUEST_TREE);
            return true;
        } catch (ActivityNotFoundException | SecurityException ignored) {
            return false;
        }
    }

    static boolean isUsableTreePicker(ResolveInfo candidate) {
        return candidate != null && candidate.activityInfo != null &&
                !"com.android.tv.frameworkpackagestubs".equals(candidate.activityInfo.packageName);
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_TREE && resultCode == RESULT_OK && data != null) {
            String folderPath = data.getStringExtra(EXTRA_FOLDER_PATH);
            Uri tree = data.getData();
            try {
                boolean saved;
                if (folderPath != null) {
                    saved = MorpheStoragePath.setFolderPath(this, folderPath);
                } else if (tree != null) {
                    int flags = data.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION |
                            Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                    getContentResolver().takePersistableUriPermission(tree, flags);
                    saved = MorpheStoragePath.setTreeUri(this, tree);
                } else {
                    saved = false;
                }
                Toast.makeText(this, saved
                                ? "Local storage path: " + MorpheStoragePath.displayLabel()
                                : "Folder selection could not be saved",
                        saved ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG).show();
                if (saved) MorpheSettingsUi.refresh();
            } catch (SecurityException error) {
                Toast.makeText(this, "Folder access could not be saved", Toast.LENGTH_LONG).show();
            }
        }
        finish();
    }
}
