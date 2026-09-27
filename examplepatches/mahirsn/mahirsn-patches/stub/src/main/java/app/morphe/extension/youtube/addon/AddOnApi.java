package app.morphe.extension.youtube.addon;

import java.util.function.Consumer;
import java.util.function.LongConsumer;

import app.morphe.extension.youtube.shared.VideoState;

/** Signature stub of the Morphe Patches add-on API. */
public final class AddOnApi {
    public static void addVideoIdListener(Consumer<String> listener) { throw new UnsupportedOperationException(); }
    public static void addVideoTimeListener(LongConsumer listener) { throw new UnsupportedOperationException(); }
    public static void addVideoStateListener(Consumer<VideoState> listener) { throw new UnsupportedOperationException(); }
    /** The listener gets an android.view.View; Object here keeps Android out of this stub. */
    public static void addPlayerOverlayButtonsListener(Consumer<Object> listener) { throw new UnsupportedOperationException(); }
    /** Same: the listener gets the legacy player controls view. */
    public static void addLegacyPlayerControlsListener(Consumer<Object> listener) { throw new UnsupportedOperationException(); }
}
