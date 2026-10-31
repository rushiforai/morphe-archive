package app.morphe.extension.syncforreddit.ui.gestures;

import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.DEFAULT_SEEK_SPAN;
import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.DOUBLE_TAP;
import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.SEEK;
import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.SEEK_NEEDS_DOUBLE_TAP;
import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.SEEK_PRECISION;
import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.SEEK_SPAN;
import static app.morphe.extension.syncforreddit.ui.gestures.VideoGestureSettings.VOLUME;

import android.content.Context;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.reflect.Field;

import app.morphe.extension.shared.Logger;
import com.laurencedawson.reddit_sync.ui.views.video.CustomExoPlayerView;

/**
 * Gestures for Sync's video and GIF player.
 *
 * <p>A double tap plays or pauses, where it otherwise zooms; dragging sideways seeks; and
 * dragging up or down after a double tap changes the volume. Each is read from the settings as
 * it is made, so any of them can be turned off without the app being repatched.
 *
 * <p>The player draws on a texture view that already carries a touch listener, the one that
 * pinches and pans the picture. Replacing it would take zooming away, so this one is put in
 * front and hands on everything it does not claim for itself. Once it does claim a drag, the
 * listener behind it is told the touch was cancelled, so it does not go on believing a pinch is
 * still in progress.
 *
 * @noinspection unused
 */
public final class VideoGesturePatch {
    /** No gesture is being made. */
    private static final int IDLE = 0;
    /** A touch is down and could still become any of them. */
    private static final int UNDECIDED = 1;
    /** Dragging sideways, seeking. */
    private static final int SEEKING = 2;
    /** Dragging up or down after a double tap, changing the volume. */
    private static final int CHANGING_VOLUME = 3;
    /** Passed to the listener behind, and not ours to interpret. */
    private static final int PASSED_ON = 4;

    /** Sync's own play and pause button, in the viewer the player is opened in. */
    private static final String PLAY_BUTTON = "image_gif_controls";

    /** How often the picture is moved while a seek is being dragged out. */
    private static final long SEEK_PREVIEW_MS = 60;

    /**
     * How far up or down a seek drag has to wander before it changes how much of the video the
     * same sideways distance covers, in the density independent pixels a finger is measured in.
     */
    private static final float PRECISION_BAND_DP = 90f;

    /** What a sideways drag covers, from farthest up to farthest down. */
    private static final float[] PRECISION = {4f, 2f, 1f, 0.5f, 0.25f};
    private static final String[] PRECISION_NAMED =
            {"coarse", "quicker", "normal", "finer", "finest"};

    private VideoGesturePatch() {}

    /**
     * Called once the player has built its texture view.
     *
     * @param player The player, which is also what the gestures act on.
     */
    public static void install(CustomExoPlayerView player) {
        try {
            View drawnOn = childOf(player);
            if (drawnOn == null) {
                return;
            }
            View.OnTouchListener behind = listenerOn(drawnOn);
            drawnOn.setOnTouchListener(new Gestures(player, behind));
            VideoGestureSettings.report(player.getContext());
        } catch (Exception ex) {
            // A player without gestures is the app as it was, so this is not worth a toast.
            Logger.printInfo(() -> "Could not add gestures to the player: " + ex);
        }
    }

    /** The view the video is drawn on, which the player adds before anything else. */
    private static View childOf(CustomExoPlayerView player) {
        return player.getChildCount() == 0 ? null : player.getChildAt(0);
    }

    /**
     * The listener already on the view, found by what it is rather than by the name of the field
     * holding it: the class holding it is obfuscated and its field names change with every build
     * of the app.
     */
    private static View.OnTouchListener listenerOn(View view) {
        for (Field field : view.getClass().getDeclaredFields()) {
            try {
                field.setAccessible(true);
                Object held = field.get(view);
                if (held instanceof View.OnTouchListener) {
                    return (View.OnTouchListener) held;
                }
            } catch (Throwable ignored) {
                // A field that will not be read is not the one being looked for.
            }
        }
        return null;
    }

    private static final class Gestures implements View.OnTouchListener {
        private final CustomExoPlayerView player;
        private final View.OnTouchListener behind;
        private final VideoGestureOverlay overlay;
        private final int slop;

        private int doing = IDLE;
        private float downX;
        private float downY;
        /** When the last touch was lifted, for deciding whether this one is a second tap. */
        private long lastLifted;
        private float lastLiftedX;
        private float lastLiftedY;
        private boolean afterDoubleTap;

        /** Where the video was when a seek began, and where the drag would put it. */
        private int seekingFrom;
        private int seekingTo;
        /** The volume a volume drag started from, so that the drag is read as a distance. */
        private int startingVolume = -1;
        /** Whether a seek interrupted playback, and so should hand it back when it is done. */
        private boolean playingBeforeSeek;
        /** When the video was last moved during a drag, so that it is not moved every frame. */
        private long lastSeekAt;
        /**
         * How far the drag has carried the video so far, added to as it goes rather than
         * measured from where it began: how much a sideways distance is worth changes while the
         * drag is in progress, and what it was already worth should not change with it.
         */
        private float seekedBy;
        private float lastSeekX;

        /**
         * The first tap of what might become a double tap, held back rather than passed on.
         *
         * <p>Sync closes the viewer on a tap. Handing the first tap on and then swallowing the
         * second leaves the app seeing one tap and closing, which is what happened. Neither tap
         * is handed on until it is known that no second one is coming, and then both are.
         */
        private MotionEvent heldDown;
        private MotionEvent heldUp;
        private final Handler afterTheTap = new Handler(Looper.getMainLooper());

        Gestures(CustomExoPlayerView player, View.OnTouchListener behind) {
            this.player = player;
            this.behind = behind;
            this.overlay = new VideoGestureOverlay(player);
            this.slop = ViewConfiguration.get(player.getContext()).getScaledTouchSlop();
        }

        @Override
        public boolean onTouch(View view, MotionEvent event) {
            try {
                Boolean handled = interpret(view, event);
                if (handled != null) {
                    return handled;
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read the gesture: " + ex);
                doing = PASSED_ON;
            }
            return behind != null && behind.onTouch(view, event);
        }

        /**
         * @return Whether the gesture was ours, or null for one to be handed on.
         */
        private Boolean interpret(View view, MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    return began(view, event);
                case MotionEvent.ACTION_MOVE:
                    return moved(view, event);
                case MotionEvent.ACTION_UP:
                    return lifted(view, event);
                case MotionEvent.ACTION_CANCEL:
                    return ended(false);
                case MotionEvent.ACTION_POINTER_DOWN:
                    // A second finger means a pinch, which is not ours.
                    ended(true);
                    return null;
                default:
                    return doing == SEEKING || doing == CHANGING_VOLUME ? Boolean.TRUE : null;
            }
        }

        private Boolean began(View view, MotionEvent event) {
            downX = event.getX();
            downY = event.getY();
            afterDoubleTap = soonAfterLift(event);
            doing = UNDECIDED;
            startingVolume = -1;

            if (afterDoubleTap && anyDoubleTapGesture()) {
                // The second tap. The first is still held, and now never needs handing on.
                dropHeldTap();
                // Up and down after a double tap is ours, and what the player sits in must not
                // take the drag for putting the viewer away before it is read.
                disallowInterception();
                return Boolean.TRUE;
            }
            doing = PASSED_ON;
            releaseHeldDown();
            heldDown = MotionEvent.obtain(event);
            return null;
        }

        private Boolean moved(View view, MotionEvent event) {
            if (doing == SEEKING) {
                showSeek(view, event);
                return Boolean.TRUE;
            }
            if (doing == CHANGING_VOLUME) {
                changeVolume(view, event.getY() - downY);
                return Boolean.TRUE;
            }
            if (doing != UNDECIDED && doing != PASSED_ON) {
                return null;
            }

            float sideways = event.getX() - downX;
            float upOrDown = event.getY() - downY;
            if (Math.abs(sideways) < slop && Math.abs(upOrDown) < slop) {
                return doing == UNDECIDED ? Boolean.TRUE : null;
            }

            Context context = view.getContext();
            if (Math.abs(upOrDown) > Math.abs(sideways)) {
                // Up and down is Sync's own gesture for putting the viewer away, so the volume is
                // only ever changed after a double tap, which nothing else answers to.
                if (afterDoubleTap && VideoGestureSettings.enabled(context, VOLUME, true)) {
                    return claim(view, CHANGING_VOLUME);
                }
            } else if (seekingAllowed(context)) {
                seekingFrom = player.getProgress();
                seekingTo = seekingFrom;
                Playback playback = Playback.of(player);
                playingBeforeSeek = playback != null && playback.isPlaying();
                if (playingBeforeSeek) {
                    // Held still, so that what is drawn is where the drag has reached rather
                    // than the video carrying on from where it was.
                    playback.setPlaying(false);
                }
                lastSeekAt = 0;
                seekedBy = 0f;
                lastSeekX = event.getX();
                return claim(view, SEEKING);
            }

            doing = PASSED_ON;
            return null;
        }

        private Boolean lifted(View view, MotionEvent event) {
            int was = doing;
            boolean wasAfterDoubleTap = afterDoubleTap;
            lastLifted = event.getEventTime();
            lastLiftedX = event.getX();
            lastLiftedY = event.getY();

            if (was == SEEKING) {
                player.seekTo(seekingTo);
                if (playingBeforeSeek) {
                    resumePlaying();
                }
                overlay.hide();
                doing = IDLE;
                return Boolean.TRUE;
            }
            if (was == CHANGING_VOLUME) {
                overlay.hide();
                doing = IDLE;
                return Boolean.TRUE;
            }

            doing = IDLE;
            boolean still = Math.abs(event.getX() - downX) < slop
                    && Math.abs(event.getY() - downY) < slop;

            if (was == UNDECIDED && wasAfterDoubleTap) {
                if (still && VideoGestureSettings.enabled(player.getContext(), DOUBLE_TAP, true)) {
                    playOrPause();
                } else if (still) {
                    // Play and pause is off, but the bar should still not come and go for a
                    // gesture nothing was asked to do anything about.
                    }
                // Not a lift to count a further tap from: three taps are two gestures, not three.
                lastLifted = 0;
                return Boolean.TRUE;
            }

            // A first tap that could still become a double one is held rather than handed on,
            // and handed on late if no second tap arrives. A press held long enough to be a long
            // press is not one of those: it has already been answered as a long press, and
            // holding its lift back would hand it on later as a tap on top of that.
            boolean brief = event.getEventTime() - event.getDownTime()
                    < ViewConfiguration.getLongPressTimeout();
            if (was == PASSED_ON && still && brief && anyDoubleTapGesture()) {
                holdTap(view, event);
                return Boolean.TRUE;
            }
            // A drag rather than a tap: the press it began with is the app's, and was handed on
            // when it happened, so there is nothing left to hold.
            releaseHeldDown();
            return null;
        }

        private Boolean ended(boolean handOn) {
            boolean ours = doing == SEEKING || doing == CHANGING_VOLUME;
            if (doing == SEEKING && playingBeforeSeek) {
                resumePlaying();
            }
            if (ours) {
                overlay.hide();
            }
            dropHeldTap();
            doing = IDLE;
            return ours && !handOn ? Boolean.TRUE : null;
        }

        /**
         * Takes the gesture for ourselves: the listener behind is told the touch was cancelled,
         * and whatever the view sits in is asked to stop taking sideways drags for its own.
         */
        private Boolean claim(View view, int gesture) {
            doing = gesture;
            dropHeldTap();
            cancelBehind(view);
            ViewParent parent = view.getParent();
            if (parent != null) {
                parent.requestDisallowInterceptTouchEvent(true);
            }
            return Boolean.TRUE;
        }

        /** Tells the listener behind that the touch it was following is over. */
        private void cancelBehind(View view) {
            if (behind == null) {
                return;
            }
            MotionEvent cancel = MotionEvent.obtain(0, 0, MotionEvent.ACTION_CANCEL, 0f, 0f, 0);
            try {
                behind.onTouch(view, cancel);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not end the touch behind: " + ex);
            } finally {
                cancel.recycle();
            }
        }

        private boolean anyDoubleTapGesture() {
            Context context = player.getContext();
            return VideoGestureSettings.enabled(context, DOUBLE_TAP, true)
                    || VideoGestureSettings.enabled(context, VOLUME, true)
                    || VideoGestureSettings.enabled(context, SEEK_NEEDS_DOUBLE_TAP, false);
        }

        private boolean soonAfterLift(MotionEvent event) {
            if (lastLifted == 0) {
                return false;
            }
            long since = event.getEventTime() - lastLifted;
            return since <= ViewConfiguration.getDoubleTapTimeout()
                    && Math.abs(event.getX() - lastLiftedX) < slop * 3
                    && Math.abs(event.getY() - lastLiftedY) < slop * 3;
        }

        private boolean seekingAllowed(Context context) {
            int when = VideoGestureSettings.number(
                    context, SEEK, VideoGestureSettings.DEFAULT_SEEK);
            if (when == VideoGestureSettings.SEEK_NEVER) {
                return false;
            }
            if (VideoGestureSettings.enabled(context, SEEK_NEEDS_DOUBLE_TAP, false)
                    && !afterDoubleTap) {
                return false;
            }
            if (player.getDuration() <= 0) {
                return false;
            }
            return when == VideoGestureSettings.SEEK_ANYWHERE || !inSomethingThatPages();
        }

        /**
         * Whether the player sits in something that pages sideways, which is what an album is.
         * Asked of the views themselves rather than of their names, which are obfuscated: a view
         * that can be scrolled sideways is one a sideways drag already means something to.
         */
        private boolean inSomethingThatPages() {
            ViewParent parent = player.getParent();
            while (parent instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) parent;
                if (group.canScrollHorizontally(1) || group.canScrollHorizontally(-1)) {
                    return true;
                }
                parent = group.getParent();
            }
            return false;
        }

        private void showSeek(View view, MotionEvent event) {
            int duration = player.getDuration();
            if (duration <= 0) {
                return;
            }
            int width = Math.max(view.getWidth(), 1);
            int span = VideoGestureSettings.number(
                    view.getContext(), SEEK_SPAN, DEFAULT_SEEK_SPAN) * 1000;
            // A short video is covered end to end, so a swipe always reaches all of it.
            int across = Math.min(span, duration);

            int band = precisionBand(view, event.getY() - downY);
            float sideways = event.getX() - lastSeekX;
            lastSeekX = event.getX();
            seekedBy += sideways / width * across * PRECISION[band];

            seekingTo = Math.max(0, Math.min(duration, seekingFrom + Math.round(seekedBy)));
            overlay.show(overlay.describeSeek(seekingTo, duration, seekingTo - seekingFrom,
                    PRECISION[band], PRECISION_NAMED[band]));

            // The picture follows the drag, at a rate the player can keep up with.
            long now = android.os.SystemClock.uptimeMillis();
            if (now - lastSeekAt >= SEEK_PREVIEW_MS) {
                lastSeekAt = now;
                player.seekTo(seekingTo);
            }
        }

        /**
         * Moves the volume the device is playing at, in the steps the device has. How many there
         * are is the device's own affair, and is usually about fifteen; nothing public offers a
         * finer hold on it than that.
         */
        private void changeVolume(View view, float upOrDown) {
            AudioManager audio = (AudioManager)
                    view.getContext().getSystemService(Context.AUDIO_SERVICE);
            if (audio == null) {
                return;
            }
            int steps = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            if (startingVolume < 0) {
                startingVolume = audio.getStreamVolume(AudioManager.STREAM_MUSIC);
            }
            int height = Math.max(view.getHeight(), 1);
            // Upwards is louder, and the whole height covers silent to full.
            int wanted = Math.max(0, Math.min(steps,
                    startingVolume + Math.round(-upOrDown / height * steps)));

            audio.setStreamVolume(AudioManager.STREAM_MUSIC, wanted, 0);
            // Raising the volume of a video Sync opened muted should be heard.
            if (wanted > 0) {
                player.setMuted(false);
            }
            overlay.show(overlay.describeVolume(wanted, steps));
        }

        /**
         * Which of the bands the finger is in, counted from the coarsest. Held away from the
         * line it started on, a drag covers more of the video above it and less below, as a
         * video player is expected to behave.
         */
        private int precisionBand(View view, float upOrDown) {
            int middleOnly = PRECISION.length / 2;
            if (!VideoGestureSettings.enabled(view.getContext(), SEEK_PRECISION, true)) {
                return middleOnly;
            }
            float band = PRECISION_BAND_DP * view.getResources().getDisplayMetrics().density;
            int steps = Math.round(upOrDown / band);
            return Math.max(0, Math.min(PRECISION.length - 1, middleOnly + steps));
        }

        private void resumePlaying() {
            Playback playback = Playback.of(player);
            if (playback != null) {
                playback.setPlaying(true);
            }
        }

        /**
         * Holds a tap back for as long as a second one could still follow, and hands it on if
         * none does, so that a tap meant on its own still reaches the app.
         */
        private void holdTap(View view, MotionEvent up) {
            // Holding the lift back without saying so leaves the listener behind believing the
            // finger is still down, and half a second later it calls that a long press, which
            // Sync answers by turning the chrome of the viewer off.
            cancelBehind(view);
            releaseHeldUp();
            heldUp = MotionEvent.obtain(up);
            afterTheTap.removeCallbacksAndMessages(null);
            afterTheTap.postDelayed(() -> handOnHeldTap(view),
                    ViewConfiguration.getDoubleTapTimeout());
        }

        /** Hands on a tap that turned out to be on its own, press and lift together. */
        private void handOnHeldTap(View view) {
            MotionEvent down = heldDown;
            MotionEvent up = heldUp;
            heldDown = null;
            heldUp = null;
            try {
                if (behind != null && down != null && up != null) {
                    behind.onTouch(view, down);
                    behind.onTouch(view, up);
                }
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not hand on a tap: " + ex);
            } finally {
                if (down != null) down.recycle();
                if (up != null) up.recycle();
            }
        }

        /** Forgets a held tap, for a second tap that arrived or a drag that began. */
        private void dropHeldTap() {
            afterTheTap.removeCallbacksAndMessages(null);
            releaseHeldDown();
            releaseHeldUp();
        }

        private void releaseHeldDown() {
            if (heldDown != null) {
                heldDown.recycle();
                heldDown = null;
            }
        }

        private void releaseHeldUp() {
            if (heldUp != null) {
                heldUp.recycle();
                heldUp = null;
            }
        }

        private void disallowInterception() {
            ViewParent parent = player.getParent();
            if (parent != null) {
                parent.requestDisallowInterceptTouchEvent(true);
            }
        }

        /**
         * Plays or pauses by pressing Sync's own button, where there is one.
         *
         * <p>Sync keeps whether a video is playing on that button rather than asking the player,
         * and draws the button from it. Stopping the player without it leaves the two disagreeing:
         * the video stops and the button goes on offering to stop it. Pressing the button does
         * both, and leaves everything Sync draws from it right.
         */
        private void playOrPause() {
            View button = syncsOwnButton();
            if (button != null) {
                // Selected is Sync's way of saying the video is already stopped.
                boolean paused = button.isSelected();
                button.performClick();
                overlay.flash(overlay.describePaused(!paused));
                return;
            }

            // Nothing to press, as in a feed: stop the player itself instead.
            Playback playback = Playback.of(player);
            if (playback == null) {
                return;
            }
            boolean playing = playback.isPlaying();
            playback.setPlaying(!playing);
            overlay.flash(overlay.describePaused(playing));
        }

        /**
         * The play and pause button of the viewer the player is in, found by the name of its id.
         * Names of resources survive where names in the code do not.
         */
        private View syncsOwnButton() {
            try {
                Context context = player.getContext();
                int id = context.getResources().getIdentifier(
                        PLAY_BUTTON, "id", context.getPackageName());
                if (id == 0) {
                    return null;
                }
                // Taken whether or not it can be seen: a button out of sight still works, and
                // is what keeps Sync's idea of the video and its own agreeing.
                return player.getRootView().findViewById(id);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not find the play button: " + ex);
                return null;
            }
        }
    }
}
