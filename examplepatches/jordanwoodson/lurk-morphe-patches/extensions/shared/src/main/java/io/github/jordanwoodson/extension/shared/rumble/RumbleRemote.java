package io.github.jordanwoodson.extension.shared.rumble;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Build;
import android.view.InputDevice;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;

import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Remote control for Rumble's video page. The phone player only takes touches (Rumble's TV player handles keys,
 * but the phone app never shows it), so a TV remote, gamepad or keyboard can't pause or skip the video. While
 * the video page's player is on screen:
 *
 * <ul>
 *   <li>OK, Enter, Space and A play and pause; the media play, pause and play/pause keys do what they say.</li>
 *   <li>Left and right, rewind and fast forward skip 10 s (or the Seek interval), where the video can seek.</li>
 *   <li>Back leaves the player as Rumble's Back does (out of full screen, or the page into the mini player),
 *       taken before the views, where Compose could spend it on moving a D-pad focus.</li>
 *   <li>Up, down and every other key go to Rumble as before. The page keeps no D-pad focus of its own: Compose
 *       moves it through the screen behind the page (a search's results, say), so OK, left and right are the
 *       player's there too.</li>
 *   <li>While a text field has focus, a keyboard's keys go to it, and a remote's too while the on-screen keyboard
 *       is up.</li>
 * </ul>
 *
 * Rumble's player methods are found in its TV key handler and reached through bridged stubs.
 */
@SuppressWarnings("unused")
public final class RumbleRemote {
    static final String KEY = "remote_keys";

    /** Rumble's TV player skips 10 s per key. */
    private static final int SEEK_MILLIS = 10_000;

    private static final int NONE = 0;
    private static final int OK = 1;
    private static final int PLAY = 2;
    private static final int PAUSE = 3;
    private static final int TOGGLE = 4;
    private static final int BACKWARD = 5;
    private static final int FORWARD = 6;
    private static final int BACK = 7;

    /** Each player's screen type as Rumble last set it; the video page's are these. */
    private static final Map<Object, String> TYPES = Collections.synchronizedMap(new WeakHashMap<>());
    private static final String EMBEDDED = "EMBEDDED";
    private static final String FULL_SCREEN = "FULL_SCREEN_";
    /** Media3's video frame, inflated from XML, so the name survives R8. */
    private static final String FRAME = "androidx.media3.ui.AspectRatioFrameLayout";

    /** Keys whose down event was taken here; the matching up event is taken too. Main thread. */
    private static final Set<Integer> CLAIMED = new HashSet<>();

    private RumbleRemote() {
    }

    /** Injection point: the start of the player's screen type setter (feed, video page, full screen, mini player). */
    public static void onPlayerType(Object player, Object type) {
        if (player != null) TYPES.put(player, String.valueOf(type));
    }

    /**
     * Injection point: the start of the main activity's dispatchKeyEvent. True takes the event; false lets the
     * activity dispatch it as usual.
     */
    public static boolean dispatch(Activity activity, KeyEvent event) {
        if (activity == null || event == null) return false;
        try {
            int code = event.getKeyCode();
            if (event.getAction() == KeyEvent.ACTION_UP) {
                if (!CLAIMED.remove(code)) return false;
                if (code == KeyEvent.KEYCODE_BACK && !event.isCanceled()) {
                    Logger.d("remote: back");
                    activity.onBackPressed();
                }
                return true;
            }
            if (event.getAction() != KeyEvent.ACTION_DOWN) return false;
            int kind = kind(code);
            if (kind == NONE || !on()) return false;
            View[] frame = {null};
            Object player = pagePlayer(activity, frame);
            if (player == null) return false;
            // Media keys never type; the rest belong to a text field someone types into.
            boolean media = code != KeyEvent.KEYCODE_DPAD_LEFT && code != KeyEvent.KEYCODE_DPAD_RIGHT
                    && kind != OK && kind != BACK;
            if (!media && typing(activity, event)) return false;
            CLAIMED.add(code);
            if (kind == BACK) return true;
            if (event.getRepeatCount() > 0 && kind != BACKWARD && kind != FORWARD) return true;
            act(activity, frame[0], player, kind);
            return true;
        } catch (Throwable t) {
            Logger.d("remote: " + t);
            return false;
        }
    }

    private static boolean on() {
        return Settings.isRegistered(KEY) && Settings.isEnabled(KEY);
    }

    private static int kind(int code) {
        switch (code) {
            case KeyEvent.KEYCODE_DPAD_CENTER:
            case KeyEvent.KEYCODE_ENTER:
            case KeyEvent.KEYCODE_NUMPAD_ENTER:
            case KeyEvent.KEYCODE_SPACE:
            case KeyEvent.KEYCODE_BUTTON_A:
                return OK;
            case KeyEvent.KEYCODE_MEDIA_PLAY:
                return PLAY;
            case KeyEvent.KEYCODE_MEDIA_PAUSE:
                return PAUSE;
            case KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE:
                return TOGGLE;
            case KeyEvent.KEYCODE_DPAD_LEFT:
            case KeyEvent.KEYCODE_MEDIA_REWIND:
                return BACKWARD;
            case KeyEvent.KEYCODE_DPAD_RIGHT:
            case KeyEvent.KEYCODE_MEDIA_FAST_FORWARD:
                return FORWARD;
            case KeyEvent.KEYCODE_BACK:
                return BACK;
            default:
                return NONE;
        }
    }

    /** Plays, pauses or skips, and says so over the player: with its controls hidden nothing else would. */
    private static void act(Activity activity, View frame, Object player, int kind) {
        String text;
        switch (kind) {
            case OK:
            case TOGGLE:
                if (isPlaying(player)) {
                    pause(player);
                    text = "Paused";
                } else {
                    play(player);
                    text = "Playing";
                }
                break;
            case PLAY:
                play(player);
                text = "Playing";
                break;
            case PAUSE:
                pause(player);
                text = "Paused";
                break;
            case BACKWARD:
            case FORWARD:
                // Live streams without rewind can't seek; Rumble's TV player ignores the keys there too.
                if (!canSeek(player)) {
                    Logger.d("remote: can't seek");
                    return;
                }
                int millis = RumblePlayer.seekMillis(SEEK_MILLIS);
                if (kind == FORWARD) seekForward(player, millis);
                else seekBack(player, millis);
                text = (kind == FORWARD ? "+" : "-") + millis / 1000 + " s";
                break;
            default:
                return;
        }
        Logger.d("remote: " + text);
        RumbleGestures.flash(activity, text, frame);
    }

    /**
     * The video page's player shown in this activity: the one Rumble last put on the video page (embedded or full
     * screen) whose Media3 player (the content's or an ad's) the largest video frame on screen shows. Feed
     * previews, Shorts, the mini player and picture-in-picture have other types. The frame goes into {@code shown}.
     */
    private static Object pagePlayer(Activity activity, View[] shown) {
        Object[] best = {null};
        long[] bestArea = {0};
        frames(activity.getWindow().getDecorView(), frame -> {
            long area = (long) frame.getWidth() * frame.getHeight();
            if (area <= bestArea[0] || !(frame.getParent() instanceof View)) return;
            Object media = viewPlayer((View) frame.getParent());
            if (media == null) return;
            synchronized (TYPES) {
                for (Map.Entry<Object, String> entry : TYPES.entrySet()) {
                    String type = entry.getValue();
                    if ((EMBEDDED.equals(type) || type.startsWith(FULL_SCREEN)) && plays(entry.getKey(), media)) {
                        best[0] = entry.getKey();
                        bestArea[0] = area;
                        shown[0] = frame;
                        return;
                    }
                }
            }
        });
        return best[0];
    }

    private interface FrameVisitor {
        void visit(View frame);
    }

    private static void frames(View view, FrameVisitor visitor) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view.getClass().getName().equals(FRAME) && view.isShown() && view.getWidth() > 0) visitor.visit(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) frames(group.getChildAt(i), visitor);
        }
    }

    /**
     * Whether the key belongs to a focused text field. A Compose text field can keep the focus behind the video
     * page (search, after opening a result), where a remote's OK would only bring its keyboard up, so a remote's
     * keys count only while the on-screen keyboard shows; a keyboard's always do.
     */
    private static boolean typing(Activity activity, KeyEvent event) {
        View focus = activity.getCurrentFocus();
        if (focus == null || !focus.onCheckIsTextEditor()) return false;
        return fromKeyboard(event) || keyboardShown(activity);
    }

    private static boolean fromKeyboard(KeyEvent event) {
        if (event.isFromSource(InputDevice.SOURCE_DPAD) || event.isFromSource(InputDevice.SOURCE_GAMEPAD)) return false;
        KeyCharacterMap map = event.getKeyCharacterMap();
        int type = map == null ? KeyCharacterMap.NUMERIC : map.getKeyboardType();
        return type == KeyCharacterMap.FULL || type == KeyCharacterMap.ALPHA;
    }

    private static boolean keyboardShown(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            WindowInsets insets = decor.getRootWindowInsets();
            return insets != null && insets.isVisible(WindowInsets.Type.ime());
        }
        Rect frame = new Rect();
        decor.getWindowVisibleDisplayFrame(frame);
        int height = decor.getRootView().getHeight();
        return height > 0 && height - frame.bottom > height / 5;
    }

    // ---------------------------------------------------------------------------------------------
    // Replaced at patch time with calls to the player's and Media3's renamed methods.

    /** The Media3 player a PlayerView shows, or null for any other view. */
    private static Object viewPlayer(View view) {
        return null;
    }

    /** Whether the Media3 player is one of the player's (its content's or its ads'). */
    private static boolean plays(Object player, Object media) {
        return false;
    }

    private static boolean isPlaying(Object player) {
        return false;
    }

    private static void play(Object player) {
    }

    private static void pause(Object player) {
    }

    /** False for live streams without rewind. */
    private static boolean canSeek(Object player) {
        return false;
    }

    private static void seekBack(Object player, int millis) {
    }

    private static void seekForward(Object player, int millis) {
    }
}
