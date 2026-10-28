package app.originisland.extension;

import android.app.Activity;
import android.content.res.Resources;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.util.TypedValue;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/**
 * Shows the line of the lyrics that is sung in the player, between the cover and the title
 * of the song.
 *
 * The lyrics are those of the "Third-party lyrics" patch of Morphe, which has them with
 * the time of each line. Without it, or without lyrics for a song, nothing is shown.
 */
@SuppressWarnings("unused")
public final class PlayerLyricsPatch {

    private static final String TAG = "OriginIslandPlayerLyrics";

    /**
     * Views of the player: the cover, and the title and the artist of the song below it.
     * The app places them by moving them, and not in a layout, so the line is placed over
     * the player in the room between them, and moved along with them. The patch makes the
     * app leave more room below the cover, see the patch.
     */
    private static final String COVER_ID = "watch_fragment_container";
    private static final String SONG_ID = "current_song_view";

    /**
     * Least room between the cover and the title for the line to be shown in.
     */
    private static final float MIN_ROOM_DP = 24;

    /**
     * Package of the resources of the app, which patches can install under another package.
     */
    private static final String APP_RESOURCES_PACKAGE = "com.google.android.apps.youtube.music";

    private static final Object VIEW_TAG = new Object();

    /**
     * How far ahead of the song the lyrics run, so a line and its words come in as they are sung
     * rather than just after.
     */
    private static final long LYRICS_LEAD_MS = 250;

    private static final long UPDATE_INTERVAL_MS = 100;
    private static final long UPDATE_INTERVAL_HIDDEN_MS = 1_000;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static final Runnable updateTask = PlayerLyricsPatch::update;

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<LyricLineView> viewRef = new WeakReference<>(null);
    private static WeakReference<View> coverRef = new WeakReference<>(null);
    private static WeakReference<View> songRef = new WeakReference<>(null);
    /**
     * Playback state of each session of the app. The app makes more than the one it plays with.
     */
    private static final List<PlaybackState[]> playbackStates = new ArrayList<>();
    private static final List<MediaController> controllers = new ArrayList<>();
    /**
     * Who wrote the song, and the line shown before the first one is sung, which names them.
     */
    private static String credit = "";
    private static MorpheLyrics.Line creditLine;
    private static Boolean lyricsSupported;
    private static List<MorpheLyrics.Line> lines = new ArrayList<>();
    private static int coverId;
    private static int songId;

    private PlayerLyricsPatch() {
    }

    /**
     * Injection point. Called as the app makes a session.
     */
    public static void onSessionCreated(MediaSession session) {
        // The app sets the session up after it has made it.
        mainHandler.post(() -> {
            try {
                MediaController controller = session.getController();
                PlaybackState[] playbackState = {controller.getPlaybackState()};
                playbackStates.add(playbackState);
                controllers.add(controller);
                controller.registerCallback(new MediaController.Callback() {
                    @Override
                    public void onPlaybackStateChanged(PlaybackState state) {
                        playbackState[0] = state;
                    }

                    @Override
                    public void onSessionDestroyed() {
                        playbackStates.remove(playbackState);
                        controllers.remove(controller);
                    }
                }, mainHandler);
                Log.i(TAG, "Session " + playbackStates.size() + " of the app is followed");
            } catch (Exception ex) {
                Log.e(TAG, "onSessionCreated failure", ex);
            }
        });
    }

    /**
     * Injection point. Called as the main activity of the app comes to the front.
     */
    public static void onActivityResume(Activity activity) {
        try {
            activityRef = new WeakReference<>(activity);

            if (lyricsSupported == null) {
                lyricsSupported = MorpheLyrics.addLinesListener(PlayerLyricsPatch::onLyricsChanged);
            }
            if (lyricsSupported) {
                mainHandler.removeCallbacks(updateTask);
                mainHandler.post(updateTask);
            }
        } catch (Exception ex) {
            Log.e(TAG, "onActivityResume failure", ex);
        }
    }

    private static void onLyricsChanged(List<MorpheLyrics.Line> changed, String changedCredit) {
        lines = changed;
        credit = changedCredit;
        creditLine = null;

        int withWords = 0;
        for (MorpheLyrics.Line line : changed) {
            if (!line.words.isEmpty()) {
                withWords++;
            }
        }
        Log.i(TAG, "Lyrics changed: " + changed.size() + " lines, " + withWords + " with times for their words, "
                + (changedCredit.isEmpty() ? "no writers" : changedCredit));
    }

    private static void update() {
        boolean shown = false;
        try {
            Activity activity = activityRef.get();
            if (activity == null || activity.isDestroyed()) {
                return;
            }

            LyricLineView view = getView(activity);
            if (view != null) {
                MorpheLyrics.Line line = getCurrentLine();
                // The line is placed as the player is drawn, see place().
                View song = songRef.get();
                boolean visible = song != null && song.isShown();

                int visibility = visible ? View.VISIBLE : View.GONE;
                if (view.getVisibility() != visibility) {
                    view.setVisibility(visibility);
                }
                if (visible) {
                    view.setLine(line);
                }
                visible = visible && line != null;
                shown = visible && view.isShown();
            }
        } catch (Exception ex) {
            Log.e(TAG, "update failure", ex);
        } finally {
            Activity activity = activityRef.get();
            if (activity != null && !activity.isDestroyed()) {
                mainHandler.postDelayed(updateTask, shown ? UPDATE_INTERVAL_MS : UPDATE_INTERVAL_HIDDEN_MS);
            }
        }
    }

    /**
     * @return The line that is sung, or null if there is none.
     */
    private static MorpheLyrics.Line getCurrentLine() {
        long position = getPosition();
        if (position < 0) {
            return null;
        }

        MorpheLyrics.Line current = null;
        for (MorpheLyrics.Line line : lines) {
            if (line.startTimeMs > position) {
                break;
            }
            current = line;
        }

        // Until the first line is sung, the artist and the lyrics are given credit.
        if (current == null && !lines.isEmpty()) {
            return getCreditLine();
        }

        return current;
    }

    private static MorpheLyrics.Line getCreditLine() {
        String artist = "";
        try {
            for (MediaController controller : controllers) {
                MediaMetadata metadata = controller.getMetadata();
                String metadataArtist = metadata == null ? null : metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
                if (metadataArtist != null && !metadataArtist.trim().isEmpty()) {
                    artist = metadataArtist.trim();
                    break;
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "getCreditLine failure", ex);
        }

        // Who wrote the song, or the artist if that is not known.
        String text = credit.isEmpty() ? artist : credit;
        if (text.isEmpty()) {
            return null;
        }
        // The same line is kept while it is shown, so that it only comes in once.
        if (creditLine == null || !creditLine.text.equals(text)) {
            creditLine = new MorpheLyrics.Line(0, text, new ArrayList<>());
        }

        return creditLine;
    }

    /**
     * @return The position the song is at in milliseconds, or -1 if there is none.
     */
    private static long getPosition() {
        // The session the app plays with is the one that was last given a position.
        PlaybackState state = null;
        for (PlaybackState[] playbackState : playbackStates) {
            if (playbackState[0] != null && (state == null
                    || playbackState[0].getLastPositionUpdateTime() > state.getLastPositionUpdateTime())) {
                state = playbackState[0];
            }
        }
        if (state == null) {
            return -1;
        }

        long position = state.getPosition();
        if (state.getState() == PlaybackState.STATE_PLAYING) {
            position += (long) ((SystemClock.elapsedRealtime() - state.getLastPositionUpdateTime())
                    * state.getPlaybackSpeed());
        }

        return position + LYRICS_LEAD_MS;
    }

    /**
     * Places the line in the room between the cover and the title, and fades it with the title.
     */
    private static void place(LyricLineView view) {
        try {
            View cover = coverRef.get();
            View song = songRef.get();
            if (cover == null || song == null || !cover.isShown()) {
                if (view.getAlpha() != 0) {
                    view.setAlpha(0);
                }
                return;
            }

            int[] coverLocation = new int[2];
            int[] songLocation = new int[2];
            int[] layerLocation = new int[2];
            cover.getLocationOnScreen(coverLocation);
            song.getLocationOnScreen(songLocation);
            ((View) view.getParent()).getLocationOnScreen(layerLocation);

            float coverBottom = coverLocation[1] + cover.getHeight() * cover.getScaleY();
            float room = songLocation[1] - coverBottom;
            float minRoom = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, MIN_ROOM_DP,
                    view.getResources().getDisplayMetrics());

            // The title fades as the player is pulled down, and so does the line.
            float alpha = room < minRoom ? 0 : song.getAlpha();
            if (view.getAlpha() != alpha) {
                view.setAlpha(alpha);
            }
            if (alpha == 0) {
                return;
            }

            view.setAvailableHeight(room);
            float translation = coverBottom - layerLocation[1] - view.getTop();
            if (view.getTranslationY() != translation) {
                view.setTranslationY(translation);
            }
        } catch (Exception ex) {
            Log.e(TAG, "place failure", ex);
        }
    }

    private static View findShownView(View view, int id) {
        if (view.getVisibility() != View.VISIBLE) {
            return null;
        }
        if (view.getId() == id) {
            return view;
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findShownView(group.getChildAt(i), id);
                if (found != null) {
                    return found;
                }
            }
        }

        return null;
    }

    private static int getId(Activity activity, String name) {
        Resources resources = activity.getResources();
        for (String resourcesPackage : new String[]{activity.getPackageName(), APP_RESOURCES_PACKAGE}) {
            int id = resources.getIdentifier(name, "id", resourcesPackage);
            if (id != 0) {
                return id;
            }
        }

        return 0;
    }

    /**
     * @return The view of the line in the player, or null if the player is not made yet.
     */
    private static LyricLineView getView(Activity activity) {
        LyricLineView view = viewRef.get();
        if (view != null && view.isAttachedToWindow() && view.getContext() == activity) {
            return view;
        }

        if (coverId == 0 || songId == 0) {
            coverId = getId(activity, COVER_ID);
            songId = getId(activity, SONG_ID);
            if (coverId == 0 || songId == 0) {
                return null;
            }
        }

        View decor = activity.getWindow().getDecorView();
        View song = findShownView(decor, songId);
        View cover = findShownView(decor, coverId);
        if (song == null || cover == null || !(song.getParent() instanceof FrameLayout)) {
            return null;
        }
        FrameLayout layer = (FrameLayout) song.getParent();

        for (int i = layer.getChildCount() - 1; i >= 0; i--) {
            if (layer.getChildAt(i).getTag() == VIEW_TAG) {
                layer.removeViewAt(i);
            }
        }

        view = new LyricLineView(activity, PlayerLyricsPatch::getPosition);
        view.setTag(VIEW_TAG);
        view.setVisibility(View.GONE);

        // Above the views of the player that it does not cover, so that they keep their touches.
        layer.addView(view, layer.indexOfChild(song), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        viewRef = new WeakReference<>(view);
        coverRef = new WeakReference<>(cover);
        songRef = new WeakReference<>(song);

        // The player moves its views as it is pulled down and up, so the line follows them
        // every time the player is drawn.
        LyricLineView placed = view;
        layer.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (!placed.isAttachedToWindow()) {
                    layer.getViewTreeObserver().removeOnPreDrawListener(this);
                } else {
                    place(placed);
                }
                return true;
            }
        });
        Log.i(TAG, "Line added to the player");

        return view;
    }
}
