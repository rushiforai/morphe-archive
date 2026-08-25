package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
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
    public static final String EXTRA_REQUIRE_WRITE =
            "io.github.liongalahad.nuviotv.extra.MORPHE_STORAGE_REQUIRE_WRITE";
    public static final String EXTRA_FOLDER_PATH =
            "io.github.liongalahad.nuviotv.extra.MORPHE_STORAGE_FOLDER_PATH";
    private boolean started;
    private boolean requireWrite;

    public static Intent intent(Context context, boolean requireWrite) {
        return new Intent(context, MorpheStorageFolderPickerActivity.class)
                .putExtra(EXTRA_REQUIRE_WRITE, requireWrite);
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        started = state != null && state.getBoolean("started", false);
        requireWrite = state != null
                ? state.getBoolean("requireWrite", false)
                : getIntent().getBooleanExtra(EXTRA_REQUIRE_WRITE, false);
        if (!started) launch();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("started", started);
        state.putBoolean("requireWrite", requireWrite);
        super.onSaveInstanceState(state);
    }

    private void launch() {
        started = true;
        if (MorpheStorageInternalFolderPickerActivity.hasDirectAccess(this, requireWrite)) {
            startActivityForResult(
                    new Intent(this, MorpheStorageInternalFolderPickerActivity.class)
                            .putExtra(EXTRA_REQUIRE_WRITE, requireWrite), REQUEST_TREE);
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
                new Intent(this, MorpheStorageInternalFolderPickerActivity.class)
                        .putExtra(EXTRA_REQUIRE_WRITE, requireWrite), REQUEST_TREE);
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
                    Uri fileLocation = Uri.fromFile(new java.io.File(folderPath));
                    saved = (!requireWrite || MorpheStoragePath.isWritableSelection(this, fileLocation)) &&
                            MorpheStoragePath.setFolderPath(this, folderPath);
                } else if (tree != null) {
                    int flags = data.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION |
                            Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                    if (!hasRequiredGrant(flags, requireWrite)) {
                        saved = false;
                    } else {
                        if ((flags & Intent.FLAG_GRANT_WRITE_URI_PERMISSION) != 0) {
                            getContentResolver().takePersistableUriPermission(
                                    tree,
                                    Intent.FLAG_GRANT_READ_URI_PERMISSION |
                                            Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                            );
                        } else {
                            getContentResolver().takePersistableUriPermission(
                                    tree,
                                    Intent.FLAG_GRANT_READ_URI_PERMISSION
                            );
                        }
                        saved = MorpheStoragePath.setTreeUri(this, tree);
                    }
                } else {
                    saved = false;
                }
                Toast.makeText(this, saved
                                ? "Local storage path: " + MorpheStoragePath.displayLabel()
                                : requireWrite
                                        ? "Select a folder that allows file creation"
                                        : "Folder selection could not be saved",
                        saved ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG).show();
                if (saved) MorpheSettingsUi.refresh();
            } catch (SecurityException error) {
                Toast.makeText(this, "Folder access could not be saved", Toast.LENGTH_LONG).show();
            }
        }
        finish();
    }

    static boolean hasRequiredGrant(int flags, boolean requireWrite) {
        boolean readable = (flags & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0;
        boolean writable = (flags & Intent.FLAG_GRANT_WRITE_URI_PERMISSION) != 0;
        return readable && (!requireWrite || writable);
    }
}
