package app.spicetify.extension.spotify.extensions;

import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

/**
 * A long-press on Now Playing's shuffle button runs Shuffle+. Hook N1 hands over the button at the end
 * of its constructor. Only the long-click listener is set, so a tap still toggles Spotify's own shuffle.
 */
public final class NowPlayingShuffle {
    private NowPlayingShuffle() {}

    /** Hook N1. Never throws into Spotify. */
    public static void onButton(View button) {
        try {
            button.setOnLongClickListener(NowPlayingShuffle::onLongPress);
            // TalkBack long-presses with performLongClick, so it would get nothing from a long-press
            // offered while Shuffle+ is off. The framework asks this each time it describes the
            // button, so the switch is read fresh.
            button.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    try {
                        boolean on = Extensions.isOn(host.getContext(), Extensions.SHUFFLE_PLUS);
                        info.setLongClickable(on);
                        if (on) {
                            info.addAction(new AccessibilityNodeInfo.AccessibilityAction(
                                    AccessibilityNodeInfo.ACTION_LONG_CLICK, "Shuffle+"));
                        } else {
                            info.removeAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK);
                        }
                    } catch (Throwable e) {
                        Log.w("Spicetify", "Couldn't describe Shuffle+ to accessibility services", e);
                    }
                }
            });
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't add Shuffle+ to Now Playing's shuffle button", e);
        }
    }

    /**
     * On the main thread. Off, or on a throw, false lets the press end as a tap. On, Shuffle+ only
     * posts its run to the bridge thread, and true makes Android skip the tap and give haptic feedback.
     */
    private static boolean onLongPress(View button) {
        try {
            if (!Extensions.isOn(button.getContext(), Extensions.SHUFFLE_PLUS)) return false;
            ShufflePlus.shuffleWhatsPlaying(button.getContext());
            return true;
        } catch (Throwable e) {
            Log.w("Spicetify", "Shuffle+ from Now Playing failed", e);
            return false;
        }
    }
}
