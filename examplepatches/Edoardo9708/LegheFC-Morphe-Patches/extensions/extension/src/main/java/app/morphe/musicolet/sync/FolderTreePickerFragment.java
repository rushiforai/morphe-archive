/*
 * Platform Fragment dedicated to Android's SAF folder picker.
 * This avoids altering the obfuscated PlaylistEditActivity.onActivityResult.
 * The picker returns a tree URI to the live editor only; nothing is persisted.
 */
package app.morphe.musicolet.sync;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

public final class FolderTreePickerFragment extends Fragment {
    public interface Callback { void onFolderSelected(Uri treeUri); }

    private static final String TAG = "Morphe.FolderPicker";
    private static final String FRAGMENT_TAG = "morphe-folder-picker-v1";
    private static final int FOLDER_REQUEST = 0x4d70;

    private Callback callback;

    /** Do not add this fragment to an Activity after its state was saved. */
    public static FolderTreePickerFragment findOrAttach(Activity activity) {
        FragmentManager fm = activity.getFragmentManager();
        Fragment existing = fm.findFragmentByTag(FRAGMENT_TAG);
        if (existing instanceof FolderTreePickerFragment) {
            return (FolderTreePickerFragment) existing;
        }
        if (fm.isStateSaved()) {
            throw new IllegalStateException("Editor state saved; picker unavailable");
        }
        FolderTreePickerFragment fragment = new FolderTreePickerFragment();
        fm.beginTransaction().add(fragment, FRAGMENT_TAG).commit();
        fm.executePendingTransactions();
        return fragment;
    }

    public void setCallback(Callback callback) { this.callback = callback; }

    public void launchPicker() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        // No takePersistableUriPermission() in the UI-only prototype.
        startActivityForResult(intent, FOLDER_REQUEST);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != FOLDER_REQUEST || resultCode != Activity.RESULT_OK || data == null) return;
        Uri selected = data.getData();
        if (selected == null) return;
        Callback listener = callback;
        if (listener != null) listener.onFolderSelected(selected);
        else Log.w(TAG, "Folder chosen but editor callback is unavailable");
    }

    @Override
    public void onDestroy() {
        callback = null;
        super.onDestroy();
    }
}
