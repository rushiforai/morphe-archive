package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.util.Log;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * Shuffle+, after Spicetify's desktop {@code shuffle+.js}: lists every song of the playlist, album or
 * Liked Songs that's playing, or of the playlist its menu asks for, shuffles them with Fisher-Yates,
 * and plays that exact order with Spotify's own shuffle off.
 * <p>
 * Threading: a run starts on the main thread, from Now Playing's shuffle button, a playlist's menu or
 * its sheet's button, and returns at once: it only posts its first step to the bridge thread. Each
 * later step runs there too, in the last one's callback, and none of them waits: a retry for a list
 * still loading is put off with postDelayed. Toasts are posted back to the main thread.
 */
public final class ShufflePlus {
    /** A playlist or Liked Songs is listed this many songs at a time. */
    private static final int PAGE = 500;
    private static final String UNSUPPORTED = "Shuffle+ works on playlists, albums and Liked Songs";
    private static final String REFUSED = "Spotify refused Shuffle+ (free accounts can't choose the order)";
    /**
     * The context URI most recently shuffled by Shuffle+, or null when playing in standard preset
     * order or after switching to another context.
     */
    private static volatile String shuffledContextUri;
    private static volatile Runnable stateObserver;
    /**
     * The bridge streams the player state only while something listens, so this listens while Shuffle+
     * is on so {@link PlayerBridge#lastState()} knows what's playing even with Trash Bin off, and
     * clears {@link #shuffledContextUri} when playback moves to a different context.
     */
    private static final PlayerBridge.StateListener KEEP_ALIVE = state -> {
        if (state == null || state.contextUri == null) return;
        String current = Esperanto.isLikedSongs(state.contextUri) ? Esperanto.LIKED_SONGS : state.contextUri;
        String shuffled = shuffledContextUri;
        if (shuffled != null && !shuffled.equals(current)) {
            setShuffledContextUri(null);
        }
    };
    /** Not a 64-bit generator, which can reach only a sliver of the orders of a list past 20 songs. */
    private static final Random RANDOM = new SecureRandom();

    enum Mode {
        SHUFFLE,
        PRESET,
        TOGGLE
    }

    private ShufflePlus() {}

    static void register() {
        Extensions.onSwitch(Extensions.SHUFFLE_PLUS, ShufflePlus::onSwitch);
    }

    /**
     * Adds the keep-alive listener when Shuffle+ turns on, and removes it when it turns off. The
     * bridge closes the stream only when its last listener goes, so Trash Bin's keeps it open.
     * Synchronized, so an on from Spotify's start can't add the listener after an off from the
     * switch has removed it.
     */
    private static synchronized void onSwitch(Context context, boolean on) {
        if (!on) {
            PlayerBridge.removeStateListener(KEEP_ALIVE);
            setShuffledContextUri(null);
        } else if (Extensions.isOn(context, Extensions.SHUFFLE_PLUS)) {
            PlayerBridge.addStateListener(KEEP_ALIVE);
        }
    }

    /** Whether Shuffle+ is actively shuffling the current context (rather than playing in preset order). */
    public static boolean isShuffled() {
        return shuffledContextUri != null;
    }

    static void setStateObserver(Runnable observer) {
        stateObserver = observer;
    }

    static void setShuffledContextUri(String contextUri) {
        shuffledContextUri = contextUri;
        Runnable observer = stateObserver;
        if (observer != null) {
            try {
                observer.run();
            } catch (Throwable e) {
                Log.w("Spicetify", "Couldn't notify Shuffle+ state observer", e);
            }
        }
    }

    /**
     * Fisher-Yates, the textbook descending-index swap: each index from the last down to 1 swaps with
     * a uniformly chosen index at or below it. {@link Collections#shuffle(List, Random)} is documented
     * to do exactly that.
     */
    static <T> void fisherYates(List<T> list, Random random) {
        Collections.shuffle(list, random);
    }

    /**
     * Now Playing's tap: toggles what's playing between Shuffle+ (true Fisher-Yates random order) and
     * standard preset order (no mixing or shuffling of the playlist).
     */
    public static void toggleWhatsPlaying(Context context) {
        toggleWhatsPlaying(context, RandomSong.LOADING_RETRY_MILLIS, RANDOM);
    }

    static void toggleWhatsPlaying(Context context, long loadingRetryMillis, Random random) {
        run(context, null, loadingRetryMillis, random, Mode.TOGGLE);
    }

    /** Plays what's playing in its standard preset order, with Spotify's shuffle and mixing off. */
    public static void playPresetOrderWhatsPlaying(Context context) {
        playPresetOrderWhatsPlaying(context, RandomSong.LOADING_RETRY_MILLIS);
    }

    static void playPresetOrderWhatsPlaying(Context context, long loadingRetryMillis) {
        run(context, null, loadingRetryMillis, RANDOM, Mode.PRESET);
    }

    /** Now Playing's long-press and its sheet's button: shuffles what's playing. It only posts the run. */
    public static void shuffleWhatsPlaying(Context context) {
        shuffleWhatsPlaying(context, RandomSong.LOADING_RETRY_MILLIS, RANDOM);
    }

    static void shuffleWhatsPlaying(Context context, long loadingRetryMillis, Random random) {
        shuffle(context, null, loadingRetryMillis, random);
    }

    /**
     * A playlist's menu: shuffles and plays the list {@code contextUri}, whatever is playing, even
     * nothing. On the main thread, it only posts the run.
     */
    static void shuffle(Context context, String contextUri) {
        shuffle(context, contextUri, RandomSong.LOADING_RETRY_MILLIS, RANDOM);
    }

    /** Shuffles {@code contextUri}, or what's playing when it's null. */
    static void shuffle(Context context, String contextUri, long loadingRetryMillis, Random random) {
        run(context, contextUri, loadingRetryMillis, random, Mode.SHUFFLE);
    }

    private static void run(Context context, String contextUri, long loadingRetryMillis, Random random, Mode mode) {
        try {
            PlayerBridge.post(new Run(context.getApplicationContext(), contextUri, loadingRetryMillis, random, mode)::start);
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't start Shuffle+", e);
        }
    }

    /**
     * One shuffle or preset-order run of a list. Its steps run one at a time on the bridge thread: the
     * first is posted there, a retry is posted there after its delay, and every other step runs in the
     * last one's bridge callback. So the fields need no lock.
     */
    private static final class Run {
        private final Context context;
        private final long loadingRetryMillis;
        private final Random random;
        private final Mode mode;
        private final List<String> uris = new ArrayList<>();
        private String contextUri;
        private String currentTrackUri;
        private boolean shuffle;
        private int retries;

        /** A run of the list {@code contextUri}, or of what's playing when it's null. */
        Run(Context context, String contextUri, long loadingRetryMillis, Random random, Mode mode) {
            this.context = context;
            this.contextUri = contextUri;
            this.loadingRetryMillis = loadingRetryMillis;
            this.random = random;
            this.mode = mode;
        }

        /**
         * Lists the playlist, Liked Songs or album asked for, or else the one playing; anything else is
         * only told. While Shuffle+ is off nothing shuffles, even when Trash Bin's stream says what's playing.
         */
        void start() {
            if (!Extensions.isOn(context, Extensions.SHUFFLE_PLUS)) return;
            String asked = contextUri;
            Esperanto.PlayerState state = PlayerBridge.lastState();
            if (state != null) {
                currentTrackUri = state.trackUri;
            }
            if (asked == null) {
                if (state == null) {
                    // ponytail: no stream is opened for one run. It's open while Shuffle+ is on, and the
                    // bridge opens again one that ended.
                    fail("Spotify hasn't said what's playing yet; try again in a moment", null);
                    return;
                }
                asked = state.contextUri == null ? "" : state.contextUri;
            }
            // Spotify plays any of Liked Songs' uris as the list's own, so the listing and Play both use that one.
            contextUri = Esperanto.isLikedSongs(asked) ? Esperanto.LIKED_SONGS : asked;
            shuffle = mode == Mode.SHUFFLE || (mode == Mode.TOGGLE && !contextUri.equals(shuffledContextUri));
            if (contextUri.startsWith("spotify:playlist:")) {
                list();
            } else if (contextUri.startsWith("spotify:album:")) {
                call(Esperanto.METADATA, "GetEntity", Esperanto.getEntity(contextUri), body -> {
                    uris.addAll(Esperanto.parseAlbumTracks(body));
                    play();
                });
            } else {
                RandomSong.tell(context, Extensions.SHUFFLE_PLUS, UNSUPPORTED);
            }
        }

        /**
         * Lists the page after the songs read so far, until the list's length. A page still loading is
         * asked again later, and an empty page ends the listing, so a length that's off can't loop.
         */
        private void list() {
            call(Esperanto.PLAYLIST, "Get", Esperanto.playlistGet(contextUri, uris.size(), PAGE), body -> {
                Esperanto.PlaylistPage page = Esperanto.parsePlaylistGet(body);
                if (page.loading) {
                    if (retries++ == RandomSong.LOADING_RETRIES) throw new IOException("the playlist is still loading");
                    PlayerBridge.postDelayed(this::list, loadingRetryMillis);
                    return;
                }
                uris.addAll(page.uris);
                if (!page.uris.isEmpty() && uris.size() < page.length) {
                    list();
                } else {
                    play();
                }
            });
        }

        /**
         * Shuffles the list (in Shuffle+ mode) or keeps its standard preset order (in preset mode) and
         * plays it in that exact order with Spotify's own shuffle/mixing off.
         */
        private void play() {
            if (uris.isEmpty()) {
                RandomSong.tell(context, Extensions.SHUFFLE_PLUS, "Found no songs to shuffle");
                return;
            }
            int firstTrackIndex = 0;
            if (shuffle) {
                fisherYates(uris, random);
            } else if (currentTrackUri != null) {
                int index = uris.indexOf(currentTrackUri);
                if (index > 0) firstTrackIndex = index;
            }
            call(Esperanto.CONTEXT_PLAYER, "Play", Esperanto.playOrder(contextUri, uris, firstTrackIndex), body -> {
                int error = Esperanto.parseResult(body);
                if (error == Esperanto.FORBIDDEN) {
                    RandomSong.tell(context, Extensions.SHUFFLE_PLUS, REFUSED);
                } else if (error != Esperanto.OK) {
                    throw new IOException("Spotify answered error " + error);
                } else if (shuffle) {
                    setShuffledContextUri(contextUri);
                    Extensions.status(Extensions.SHUFFLE_PLUS, "Shuffled " + uris.size() + " songs");
                } else {
                    setShuffledContextUri(null);
                    Extensions.status(Extensions.SHUFFLE_PLUS, "Preset order (" + uris.size() + " songs)");
                }
            });
        }

        private void call(String service, String method, byte[] request, RandomSong.Step next) {
            PlayerBridge.call(service, method, request, RandomSong.step(next, this::fail));
        }

        private void fail(String reason, Throwable e) {
            Log.w("Spicetify", "Shuffle+ failed: " + reason, e);
            RandomSong.tell(context, Extensions.SHUFFLE_PLUS, "Couldn't shuffle: " + reason);
        }
    }
}
