package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Shuffle+, after Spicetify's {@code shuffle+.js}: lists every song of the playlist, album or Liked
 * Songs that's playing, shuffles them with Fisher-Yates, and plays that exact order with Spotify's
 * own shuffle off.
 * <p>
 * Threading: {@link #shuffleWhatsPlaying} runs on the main thread and only posts the first step to
 * the bridge thread. Each later step runs there too, in the last one's callback, and nothing waits:
 * a retry for a list still loading is a postDelayed. Toasts go back to the main thread.
 */
public final class ShufflePlus {
    private static final String TAG = "ShufflePlus";
    /** A playlist or Liked Songs is listed this many songs at a time. */
    private static final int PAGE = 500;
    /** How many of the shuffled songs are also queued. */
    private static final int QUEUED = 100;
    private static final long QUEUE_DELAY_MILLIS = 1000;
    private static final long DEBOUNCE_MILLIS = 2000;
    private static volatile long lastStart = -DEBOUNCE_MILLIS;
    /** The queue is topped up when this many queued songs are left. */
    private static final int TOP_UP_AT = 20;
    private static final int STATE_RETRIES = 5;
    private static final long STATE_RETRY_MILLIS = 1000;
    private static final int LOADING_RETRIES = 3;
    private static final long LOADING_RETRY_MILLIS = 1000;
    /** Not a 64-bit generator, which can reach only a sliver of the orders of a list past 20 songs. */
    private static final Random RANDOM = new SecureRandom();

    private ShufflePlus() {}

    /** Now Playing's long-press. Never throws into Spotify. */
    public static void shuffleWhatsPlaying(Context context) {
        try {
            long now = SystemClock.elapsedRealtime();
            if (now - lastStart < DEBOUNCE_MILLIS) return; // a double press must not run two shuffles at once
            lastStart = now;
            PlayerBridge.post(new Run(context.getApplicationContext(), RANDOM)::start);
        } catch (Throwable e) {
            Log.w(TAG, "Couldn't start Shuffle+", e);
        }
    }

    /** Fisher-Yates: each index from the last down to 1 swaps with a uniformly chosen one at or below it. */
    static <T> void fisherYates(List<T> list, Random random) {
        for (int i = list.size() - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            T swap = list.get(i);
            list.set(i, list.get(j));
            list.set(j, swap);
        }
    }

    // The last shuffle, for topping up its queue. Only the bridge thread touches these.
    private static String shuffledContext;
    private static List<String> shuffledOrder = new ArrayList<>();
    private static final Map<String, Integer> POSITIONS = new HashMap<>();
    /** Index in {@link #shuffledOrder} after the last song queued so far. */
    private static int queuedEnd;
    private static boolean watching;

    private static String normalized(String contextUri) {
        return Esperanto.isLikedSongs(contextUri) ? Esperanto.LIKED_SONGS : contextUri;
    }

    private static void forget() {
        POSITIONS.clear();
        queuedEnd = 0;
    }

    private static void remember(String contextUri, List<String> order, int queued) {
        shuffledContext = contextUri;
        shuffledOrder = new ArrayList<>(order);
        POSITIONS.clear();
        for (int i = 0; i < shuffledOrder.size(); i++) POSITIONS.putIfAbsent(shuffledOrder.get(i), i);
        queuedEnd = queued;
        if (!watching) {
            watching = true;
            PlayerBridge.addStateListener(ShufflePlus::topUp);
        }
    }

    /** On each player state: when the queue is nearly used up, queues the next songs of the order. */
    private static void topUp(Esperanto.PlayerState state) {
        Integer position = state.trackUri == null || state.contextUri == null ? null : POSITIONS.get(state.trackUri);
        // Only a song inside the queued part counts: a recently played one sits far past it, at the list's end.
        if (position == null || !shuffledContext.equals(normalized(state.contextUri))
                || position >= queuedEnd || queuedEnd - position > TOP_UP_AT || queuedEnd >= shuffledOrder.size()) {
            return;
        }
        int end = Math.min(position + 1 + QUEUED, shuffledOrder.size());
        List<String> next = new ArrayList<>(shuffledOrder.subList(position + 1, end));
        queuedEnd = end; // set now, so the states that follow don't send it again
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SetQueue", Esperanto.setQueue(next, state.queueRevision),
            new PlayerBridge.Result() {
                @Override
                public void done(byte[] body) {
                    Log.i(TAG, "Topped up the queue to song " + end);
                }

                @Override
                public void failed(String reason) {
                    Log.w(TAG, "Couldn't top up the queue: " + reason);
                }
            });
    }

    private interface Step {
        void run(byte[] body) throws Exception;
    }

    /** One shuffle of one list. Its steps run one at a time on the bridge thread, so the fields need no lock. */
    private static final class Run {
        private final Context context;
        private final Random random;
        private final List<String> uris = new ArrayList<>();
        private String contextUri;
        private int retries;
        private int stateWaits;

        Run(Context context, Random random) {
            this.context = context;
            this.random = random;
        }

        void start() {
            Esperanto.PlayerState state = PlayerBridge.lastState();
            if (state == null || state.contextUri == null) {
                // Right after start-up or sign-in the state may not have arrived yet: wait a few seconds for it.
                if (stateWaits++ < STATE_RETRIES) {
                    PlayerBridge.postDelayed(this::start, STATE_RETRY_MILLIS);
                    return;
                }
                Log.i(TAG, state == null ? "No player state received" : "The player state has no context");
                tell("Nothing is playing yet; start a playlist or album first");
                return;
            }
            // Spotify plays any of Liked Songs' uris as the list's own, so listing and Play both use that one.
            contextUri = Esperanto.isLikedSongs(state.contextUri) ? Esperanto.LIKED_SONGS : state.contextUri;
            if (contextUri.startsWith("spotify:playlist:")) {
                list();
            } else if (contextUri.startsWith("spotify:album:")) {
                call(Esperanto.METADATA, "GetEntity", Esperanto.getEntity(contextUri), body -> {
                    uris.addAll(Esperanto.parseAlbumTracks(body));
                    play();
                });
            } else {
                tell("Shuffle+ works on playlists, albums and Liked Songs");
            }
        }

        /** Lists the page after the songs read so far; a page still loading is asked again later. */
        private void list() {
            call(Esperanto.PLAYLIST, "Get", Esperanto.playlistGet(contextUri, uris.size(), PAGE), body -> {
                Esperanto.PlaylistPage page = Esperanto.parsePlaylistGet(body);
                if (page.loading) {
                    if (retries++ == LOADING_RETRIES) throw new IOException("the playlist is still loading");
                    PlayerBridge.postDelayed(this::list, LOADING_RETRY_MILLIS);
                    return;
                }
                uris.addAll(page.uris);
                // An empty page ends the listing, so a length that's off can't loop.
                if (!page.uris.isEmpty() && uris.size() < page.length) list();
                else play();
            });
        }

        private void play() {
            if (uris.isEmpty()) {
                tell("Found no songs to shuffle");
                return;
            }
            fisherYates(uris, random);
            List<String> ordered = RecentlyPlayed.recentLast(context, uris);
            forget(); // no top-up of the old order while the new one is being set
            call(Esperanto.CONTEXT_PLAYER, "Play", Esperanto.playOrder(contextUri, ordered, 0), body -> {
                int error = Esperanto.parseResult(body);
                if (error == Esperanto.FORBIDDEN) {
                    tell("Spotify refused Shuffle+ (free accounts can't choose the order)");
                } else if (error != Esperanto.OK) {
                    throw new IOException("Spotify answered error " + error);
                } else {
                    tell("Shuffled " + uris.size() + " songs");
                    queue(ordered);
                }
            });
        }

        /**
         * Also queues the next songs of the order. A play command's explicit page is dropped when another
         * device is the one playing, and only the queue reaches it.
         */
        private void queue(List<String> ordered) {
            List<String> next = ordered.subList(Math.min(1, ordered.size()), Math.min(QUEUED + 1, ordered.size()));
            // The play command changes the queue's revision; the state stream reports the new one a moment later.
            PlayerBridge.postDelayed(() -> {
                Esperanto.PlayerState state = PlayerBridge.lastState();
                long revision = state == null ? 0 : state.queueRevision;
                remember(contextUri, ordered, next.size() + 1);
                call(Esperanto.CONTEXT_PLAYER, "SetQueue", Esperanto.setQueue(next, revision), body ->
                    Log.i(TAG, "Queued " + next.size() + " songs, result " + Esperanto.parseResult(body)));
            }, QUEUE_DELAY_MILLIS);
        }

        /** Sends a request; {@code next} runs on the bridge thread, and a failure of either ends the run with a toast. */
        private void call(String service, String method, byte[] request, Step next) {
            PlayerBridge.call(service, method, request, new PlayerBridge.Result() {
                @Override
                public void done(byte[] body) {
                    try {
                        next.run(body);
                    } catch (Throwable e) {
                        fail(e.getMessage() != null ? e.getMessage() : e.toString(), e);
                    }
                }

                @Override
                public void failed(String reason) {
                    fail(reason, null);
                }
            });
        }

        private void fail(String reason, Throwable e) {
            Log.w(TAG, "Shuffle+ failed: " + reason, e);
            tell("Couldn't shuffle: " + reason);
        }

        private void tell(String line) {
            Log.i(TAG, line);
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Toast.makeText(context, line, Toast.LENGTH_LONG).show();
                } catch (Throwable e) {
                    Log.w(TAG, "Couldn't show a Toast", e);
                }
            });
        }
    }
}
