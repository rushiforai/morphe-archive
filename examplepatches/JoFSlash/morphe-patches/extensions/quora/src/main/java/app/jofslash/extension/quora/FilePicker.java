package app.jofslash.extension.quora;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

/**
 * Lets you pick a file and hands it back. Android sends the picked file to the activity that
 * asked, which is Quora's own; a fragment without a view on it gets the answer instead, so the
 * patches don't need an activity of their own.
 */
@SuppressWarnings("deprecation")
public final class FilePicker extends android.app.Fragment {

    interface Picked {
        void picked(Uri uri);
    }

    private static final String TAG = "JoFSlashPatches";
    private static final String FRAGMENT_TAG = "jofslash_file_picker";
    private static final int REQUEST = 0x4a0f;

    // Gone when Android ends the app while the picker is open; the pick is then dropped.
    private static Picked pending;

    /** Android recreates the fragment by this constructor. */
    public FilePicker() {
    }

    /** Opens the system file picker for the given types; the callback runs only when a file is picked. */
    static boolean pick(Activity activity, String[] types, Picked picked) {
        try {
            android.app.FragmentManager fragments = activity.getFragmentManager();
            android.app.Fragment old = fragments.findFragmentByTag(FRAGMENT_TAG);
            if (old != null) fragments.beginTransaction().remove(old).commitNow();
            FilePicker picker = new FilePicker();
            pending = picked;
            fragments.beginTransaction().add(picker, FRAGMENT_TAG).commitNow();
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("*/*")
                    .putExtra(Intent.EXTRA_MIME_TYPES, types);
            picker.startActivityForResult(intent, REQUEST);
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open the file picker", ex);
            pending = null;
            return false;
        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        Picked picked = pending;
        pending = null;
        try {
            getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
        } catch (Exception ignored) {
            // Removed with the activity anyway.
        }
        if (requestCode != REQUEST || resultCode != Activity.RESULT_OK || data == null || data.getData() == null
                || picked == null) {
            return;
        }
        try {
            picked.picked(data.getData());
        } catch (Exception ex) {
            Log.e(TAG, "Failed to use the picked file", ex);
        }
    }
}
