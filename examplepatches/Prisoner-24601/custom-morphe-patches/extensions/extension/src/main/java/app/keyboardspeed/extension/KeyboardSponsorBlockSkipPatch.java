package app.keyboardspeed.extension;

import android.app.Activity;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Presses the skip button of SponsorBlock with a key of a hardware keyboard (Enter by default).
 * <p>
 * The buttons are those of the SponsorBlock patch of the Morphe YouTube patches: the button that skips the segment
 * the video is in, and the button that skips to the highlight. The segment button also counts while it's hidden
 * with the player controls (the 'auto hide skip button' setting of Morphe), as long as the video is in the segment,
 * because showing the controls would show it again. While there is no button, the key keeps its default action.
 */
@SuppressWarnings("unused")
public final class KeyboardSponsorBlockSkipPatch {
    private static final String TAG = "KeyboardSponsorBlockSkip";

    private static final String VIEW_CONTROLLER_CLASS =
            "app.morphe.extension.youtube.sponsorblock.ui.SponsorBlockViewController";
    private static final String PLAYBACK_CONTROLLER_CLASS =
            "app.morphe.extension.shared.sponsorblock.SegmentPlaybackController";

    private static Field skipSponsorButtonRef;
    private static Field skipSegment;
    private static Field skipHighlightButtonRef;
    private static Method insideSkippableSegment;
    private static boolean lookedUp;
    private static boolean found;

    /**
     * If the first press of the key pressed a button, so its repeats and its release are consumed too.
     */
    private static boolean consumingKey;

    private KeyboardSponsorBlockSkipPatch() {
    }

    /**
     * Key code of the shortcut.
     * The body is replaced at patch time with the key chosen in the patch options.
     */
    static int getKeyCode() {
        return KeyEvent.KEYCODE_ENTER;
    }

    private static boolean isKey(KeyEvent event) {
        final int keyCode = event.getKeyCode();
        final int shortcut = getKeyCode();
        return keyCode == shortcut
                || (shortcut == KeyEvent.KEYCODE_ENTER && keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER);
    }

    /**
     * @return Whether the event was consumed.
     */
    static boolean handleKey(Activity activity, KeyEvent event) {
        if (!isKey(event)) {
            return false;
        }

        if (KeyboardShortcutsPatch.isFirstPress(event)) {
            consumingKey = pressSkipButton();
            return consumingKey;
        }

        final boolean consume = consumingKey;
        if (event.getAction() == KeyEvent.ACTION_UP) {
            consumingKey = false;
        }
        return consume;
    }

    /**
     * @return If a skip button was pressed.
     */
    private static boolean pressSkipButton() {
        if (!lookUp()) {
            return false;
        }
        try {
            // The segment button, also while it's hidden with the player controls.
            View sponsorButton = getButton(skipSponsorButtonRef);
            if (sponsorButton != null && (sponsorButton.isShown()
                    || (skipSegment.get(null) != null && (boolean) insideSkippableSegment.invoke(null)))) {
                return click(sponsorButton);
            }

            View highlightButton = getButton(skipHighlightButtonRef);
            if (highlightButton != null && highlightButton.isShown()) {
                return click(highlightButton);
            }
        } catch (Exception ex) {
            Log.e(TAG, "pressSkipButton failure", ex);
        }
        return false;
    }

    private static View getButton(Field reference) throws IllegalAccessException {
        Object button = ((WeakReference<?>) reference.get(null)).get();
        return button instanceof View ? (View) button : null;
    }

    private static boolean click(View button) throws ReflectiveOperationException {
        button.getClass().getMethod("skipButtonClicked").invoke(button);
        return true;
    }

    private static boolean lookUp() {
        if (!lookedUp) {
            lookedUp = true;
            try {
                ClassLoader loader = KeyboardSponsorBlockSkipPatch.class.getClassLoader();
                Class<?> viewController = Class.forName(VIEW_CONTROLLER_CLASS, true, loader);
                skipSponsorButtonRef = accessibleField(viewController, "skipSponsorButtonRef");
                skipSegment = accessibleField(viewController, "skipSegment");
                skipHighlightButtonRef = accessibleField(viewController, "skipHighlightButtonRef");
                insideSkippableSegment = Class.forName(PLAYBACK_CONTROLLER_CLASS, true, loader)
                        .getMethod("currentlyInsideSkippableSegment");
                found = true;
            } catch (Exception ex) {
                Log.w(TAG, "SponsorBlock of the Morphe patches not found", ex);
            }
        }
        return found;
    }

    private static Field accessibleField(Class<?> type, String name) throws NoSuchFieldException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }
}
