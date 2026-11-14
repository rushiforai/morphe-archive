package android.view.contentcapture;

import android.view.ViewStructure;
import android.view.autofill.AutofillId;

/**
 * Android 10's ContentCaptureSession for Android 9, where the class does not exist (patch "Android 9 (API 28)").
 * Loaded only on Android 9 (classes load parent first). Android 9 has no content capture: View.getContentCaptureSession
 * returns null there (View28), as Android 10 does when content capture is off, so no session ever exists and these
 * members only let Maps' code link.
 */
public abstract class ContentCaptureSession implements AutoCloseable {
    protected ContentCaptureSession() {
    }

    public final AutofillId newAutofillId(AutofillId hostId, long virtualChildId) {
        return null;
    }

    public final ViewStructure newVirtualViewStructure(AutofillId parentId, long virtualId) {
        return null;
    }

    public final void notifyViewAppeared(ViewStructure node) {
    }

    public final void notifyViewDisappeared(AutofillId id) {
    }

    public final void notifyViewsDisappeared(AutofillId hostId, long[] virtualIds) {
    }

    public final void notifyViewTextChanged(AutofillId id, CharSequence text) {
    }

    @Override
    public void close() {
    }
}
