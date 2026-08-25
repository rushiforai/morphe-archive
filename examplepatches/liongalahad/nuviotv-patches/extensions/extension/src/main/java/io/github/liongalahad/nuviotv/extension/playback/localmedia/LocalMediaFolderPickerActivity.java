package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.provider.DocumentsContract;
import android.widget.Toast;

import java.util.List;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;

/** Transparent proxy that obtains and persists access to the selected media tree. */
public final class LocalMediaFolderPickerActivity extends Activity {
    private static final int REQUEST_TREE = 7201;
    static final String EXTRA_FOLDER_PATH =
            "io.github.liongalahad.nuviotv.extra.LOCAL_MEDIA_FOLDER_PATH";
    private boolean pickerStarted;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pickerStarted = savedInstanceState != null && savedInstanceState.getBoolean("pickerStarted", false);
        if (!pickerStarted) launchPicker();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("pickerStarted", pickerStarted);
        super.onSaveInstanceState(state);
    }

    private void launchPicker() {
        pickerStarted = true;
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION |
                        Intent.FLAG_GRANT_WRITE_URI_PERMISSION |
                        Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION |
                        Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        Uri initial = DocumentsContract.buildDocumentUri(
                "com.android.externalstorage.documents",
                LocalMediaRuntime.DEFAULT_DOCUMENT_ID
        );
        intent.putExtra(DocumentsContract.EXTRA_INITIAL_URI, initial);
        if (launchDocumentsUi(intent, "com.google.android.documentsui")) return;
        if (launchDocumentsUi(intent, "com.android.documentsui")) return;
        PackageManager packageManager = getPackageManager();
        List<ResolveInfo> candidates = packageManager.queryIntentActivities(
                intent,
                0
        );
        for (ResolveInfo candidate : candidates) {
            if (launchResolvedPicker(intent, candidate)) return;
        }
        startActivityForResult(
                new Intent(this, LocalMediaInternalFolderPickerActivity.class),
                REQUEST_TREE
        );
    }

    private boolean launchDocumentsUi(Intent source, String packageName) {
        Intent explicit = new Intent(source).setComponent(new ComponentName(
                packageName,
                "com.android.documentsui.picker.PickActivity"
        ));
        try {
            startActivityForResult(explicit, REQUEST_TREE);
            return true;
        } catch (ActivityNotFoundException | SecurityException ignored) {
            return false;
        }
    }

    private boolean launchResolvedPicker(Intent source, ResolveInfo resolved) {
        if (!isUsableTreePicker(resolved)) return false;
        Intent explicit = new Intent(source).setComponent(new ComponentName(
                resolved.activityInfo.packageName,
                resolved.activityInfo.name
        ));
        try {
            startActivityForResult(explicit, REQUEST_TREE);
            return true;
        } catch (ActivityNotFoundException | SecurityException ignored) {
            return false;
        }
    }

    static boolean isUsableTreePicker(ResolveInfo resolved) {
        return resolved != null && resolved.activityInfo != null &&
                !"com.android.tv.frameworkpackagestubs".equals(
                        resolved.activityInfo.packageName
                );
    }

    @android.annotation.SuppressLint("WrongConstant")
    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_TREE && resultCode == RESULT_OK && data != null) {
            String folderPath = data.getStringExtra(EXTRA_FOLDER_PATH);
            Uri treeUri = data.getData();
            try {
                boolean saved;
                if (folderPath != null) {
                    saved = LocalMediaRuntime.setFolderPath(this, folderPath);
                } else if (treeUri != null) {
                    int flags = data.getFlags() &
                            (Intent.FLAG_GRANT_READ_URI_PERMISSION |
                                    Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                    if ((flags & Intent.FLAG_GRANT_READ_URI_PERMISSION) == 0) {
                        saved = false;
                    } else {
                        getContentResolver().takePersistableUriPermission(treeUri, flags);
                        saved = LocalMediaRuntime.setTreeUri(this, treeUri);
                    }
                } else {
                    saved = false;
                }
                if (!saved) {
                    Toast.makeText(this, "Folder selection could not be saved", Toast.LENGTH_LONG).show();
                    finish();
                    return;
                }
                Toast.makeText(this, "Storage folder: " + LocalMediaRuntime.folderDisplayLabel(),
                        Toast.LENGTH_SHORT).show();
                MorpheSettingsUi.refresh();
            } catch (SecurityException error) {
                Toast.makeText(this, "Folder access could not be saved", Toast.LENGTH_LONG).show();
            }
        }
        finish();
    }
}
