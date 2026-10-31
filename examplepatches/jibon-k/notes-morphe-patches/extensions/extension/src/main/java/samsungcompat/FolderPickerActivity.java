package samsungcompat;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/**
 * Transparent activity that opens the system folder picker and hands the result to the backup / sync
 * code, so no fragment of the app needs an onActivityResult hook. Declared by the "Backup to folder" patch.
 */
public final class FolderPickerActivity extends Activity {
    private static final int PICK = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            try {
                startActivityForResult(NotesBackup.createFolderPickerIntent(), PICK);
            } catch (Exception e) {
                finish();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == PICK && resultCode == RESULT_OK && data != null) {
            NotesBackup.onFolderSelected(this, data.getData());
        }
        finish();
    }
}
