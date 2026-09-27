package app.lchanc3.extension.localdream;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * Where the upscale screen's image picker, which the patch makes allow several
 * images, hands over what was picked.
 */
@SuppressWarnings("unused")
public final class BatchUpscalePatch {

    static final String LOG_TAG = "BatchUpscale";

    /**
     * Called at the top of the picker's callback with what the picker returned,
     * a list of Uris now; returns what the callback goes on with, the one Uri it
     * was written for or null for nothing.
     *
     * One image is left to the screen as before. More are handed to the batch
     * screen, and the upscale screen stays as it was underneath it: its backend
     * keeps running there, and the batch screen uses it.
     */
    public static Object onImagesPicked(Context context, Object picked) {
        if (!(picked instanceof List)) {
            return picked;
        }
        ArrayList<Uri> uris = new ArrayList<>();
        for (Object item : (List<?>) picked) {
            if (item instanceof Uri && !uris.contains(item)) {
                uris.add((Uri) item);
            }
        }
        if (uris.isEmpty()) {
            return null;
        }
        if (uris.size() == 1) {
            return uris.get(0);
        }

        try {
            if (BatchJob.isConnectedDeviceMode(context)) {
                // The host's upscaler paths are only known to the screen itself.
                Toast.makeText(context, Strings.get(context).connectedDeviceMode, Toast.LENGTH_LONG).show();
                return uris.get(0);
            }
            BatchUpscaleActivity.start(context, uris);
            return null;
        } catch (Throwable ex) {
            Log.e(LOG_TAG, "Could not open the batch screen", ex);
            return uris.get(0);
        }
    }

    private BatchUpscalePatch() {
    }
}
