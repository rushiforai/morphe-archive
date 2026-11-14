package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

/**
 * The pick screen the Instants shutter starts with Send Instants from your gallery on. It opens the phone's gallery app
 * for one photo and hands it to [InstantGallery], staying until the photo is read, since the gallery's read grant goes
 * with this screen. Not exported, and it draws nothing.
 */
public final class InstantPickActivity extends Activity {
    private static final int PICK = 1;
    /** Whether the held press got its answer, a pick or a back-out. */
    private boolean answered;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        // Android stopped this screen while the gallery app was open. The gallery's answer still comes back here.
        if (state != null) return;
        try {
            Intent pick = InstantGallery.pickIntent(this);
            if (pick == null) {
                give("gallery_missing");
                return;
            }
            startActivityForResult(pick, PICK);
        } catch (ActivityNotFoundException error) {
            give("gallery_missing");
        } catch (RuntimeException error) {
            Settings.hookFailedPrivately(InstantGallery.KEY, "Can't open your gallery app", error);
            give("gallery_failed");
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != PICK || answered) return;
        answered = true;
        Uri photo = resultCode == RESULT_OK ? first(data) : null;
        if (photo == null) {
            InstantGallery.canceled();
            finish();
            return;
        }
        InstantGallery.picked(getApplicationContext(), photo, this::finish);
    }

    @Override protected void onDestroy() {
        // Closed some other way, so the held press is dropped and the shutter frees up.
        if (!answered && isFinishing()) {
            answered = true;
            InstantGallery.canceled();
        }
        super.onDestroy();
    }

    /** The picked photo: the result's data, or the first item a gallery that answers in ClipData sends. */
    static Uri first(Intent data) {
        if (data == null) return null;
        if (data.getData() != null) return data.getData();
        ClipData clip = data.getClipData();
        return clip != null && clip.getItemCount() > 0 ? clip.getItemAt(0).getUri() : null;
    }

    /** Ends with nothing picked, saying why. */
    private void give(String message) {
        answered = true;
        InstantGallery.canceled();
        Toast.makeText(this, new SettingsText(this).get(message), Toast.LENGTH_LONG).show();
        finish();
    }
}
