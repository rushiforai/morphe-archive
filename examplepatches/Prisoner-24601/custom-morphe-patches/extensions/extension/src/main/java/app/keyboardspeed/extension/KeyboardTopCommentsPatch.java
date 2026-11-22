package app.keyboardspeed.extension;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Shows the Top comments of the opened video with a key of a hardware keyboard (K by default).
 * <p>
 * The Timed view of the comments has no sort buttons (Top, Timed, Newest): they are replaced by a message at the
 * top of the list, which the list scrolls away from while it follows the video. If a Top button is shown, the key
 * presses it. Otherwise the comments are closed and a new comments panel of the video is opened, which shows the
 * Top comments with the sort buttons, as when the comments are first opened.
 */
@SuppressWarnings("unused")
public final class KeyboardTopCommentsPatch {
    private static final String TAG = "KeyboardTopComments";

    /**
     * Text of the sort button, as the app shows it in English.
     */
    private static final String TOP_BUTTON_TEXT = "Top";

    /**
     * Time for the open comments panel to close, before the new one is opened.
     */
    private static final long CLOSE_PANEL_DELAY_MS = 300;

    private static final Handler handler = new Handler(Looper.getMainLooper());

    private KeyboardTopCommentsPatch() {
    }

    /**
     * Key code of the shortcut.
     * The body is replaced at patch time with the key chosen in the patch options.
     */
    static int getKeyCode() {
        return KeyEvent.KEYCODE_K;
    }

    /**
     * @return Whether the event was consumed.
     */
    static boolean handleKey(Activity activity, KeyEvent event) {
        if (event.getKeyCode() != getKeyCode() || !Morphe.isPlayerOpen()) {
            return false;
        }
        if (KeyboardShortcutsPatch.isFirstPress(event)) {
            showTopComments(activity);
        }
        return true;
    }

    private static void showTopComments(Activity activity) {
        View closeButton = KeyboardCommentsPatch.findShownPanelCloseButton(activity);
        if (closeButton != null) {
            View panel = findPanel(closeButton);
            if (panel != null && pressTopButton(panel)) {
                Log.d(TAG, "Pressed the Top button of the comments");
                return;
            }
        }

        String videoId = Morphe.getVideoId();
        if (videoId == null) {
            Toast.makeText(activity, "Top comments are not available", Toast.LENGTH_SHORT).show();
            return;
        }
        Log.d(TAG, "Opening new comments for video: " + videoId);
        if (closeButton != null) {
            closeButton.performClick();
            handler.postDelayed(() -> CommentsMenuItemPatch.openComments(videoId, false), CLOSE_PANEL_DELAY_MS);
        } else {
            CommentsMenuItemPatch.openComments(videoId, false);
        }
    }

    /**
     * @return The panel of the close button: the ancestor below the header wrapper, a few levels up.
     */
    private static View findPanel(View closeButton) {
        View view = closeButton;
        for (int level = 0; level < 6 && view.getParent() instanceof View parent; level++) {
            view = parent;
        }
        return view;
    }

    /**
     * Presses the Top sort button shown in the panel.
     *
     * @return If the button was found and pressed.
     */
    private static boolean pressTopButton(View view) {
        if (!view.isShown()) {
            return false;
        }
        CharSequence description = view.getContentDescription();
        CharSequence text = view instanceof TextView textView ? textView.getText() : null;
        if (isTopText(description) || isTopText(text)) {
            View clickable = view;
            while (clickable != null && !clickable.isClickable()) {
                clickable = clickable.getParent() instanceof View parent ? parent : null;
            }
            if (clickable != null && clickable.performClick()) {
                return true;
            }
        }
        if (view instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                if (pressTopButton(group.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean isTopText(CharSequence text) {
        return text != null && text.toString().trim().equalsIgnoreCase(TOP_BUTTON_TEXT);
    }
}
