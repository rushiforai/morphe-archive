package app.morphe.extension.youtube.addon;

import android.view.View;

import java.util.function.Consumer;
import java.util.function.LongConsumer;

/**
 * Signature stub of the add-on API of Morphe Patches
 * (extensions/youtube/.../addon/AddOnApi.java). The patch checks at patch time
 * that the real class has each of these methods.
 */
public final class AddOnApi {
    private AddOnApi() {
    }

    /** The listener gets the view of one of the player's bottom buttons. */
    public static void addPlayerOverlayButtonsListener(Consumer<View> listener) {
        throw new UnsupportedOperationException();
    }

    public static void addNewVideoStartedListener(Runnable listener) {
        throw new UnsupportedOperationException();
    }

    public static void addVideoIdListener(Consumer<String> listener) {
        throw new UnsupportedOperationException();
    }

    /** The listener gets Morphe's VideoState enum. */
    public static void addVideoStateListener(Consumer<Object> listener) {
        throw new UnsupportedOperationException();
    }

    public static void addVideoTimeListener(LongConsumer listener) {
        throw new UnsupportedOperationException();
    }
}
