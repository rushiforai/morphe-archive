package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

/**
 * Play a random song: one song from all of Spotify, or from the user's library.
 * <p>
 * Threading: a run starts on the main thread, from a tap, and returns at once: it only posts its
 * first step to the bridge thread. Each later step runs there too, in the last one's callback, and
 * none of them waits: the Web API search runs on the Web API thread and hands its answer back, and
 * a library retry is put off with postDelayed. Toasts are posted back to the main thread.
 */
public final class RandomSong {
    private static final String QUERY_CHARACTERS = "abcdefghijklmnopqrstuvwxyz0123456789";
    /** The Web API searches no deeper than this. */
    private static final int OFFSETS = 1000;
    /** A list the core is still loading is asked again this many times, this far apart. Shuffle+ waits the same way. */
    static final int LOADING_RETRIES = 3;
    static final long LOADING_RETRY_MILLIS = 1000;

    private RandomSong() {}

    static String randomQuery(Random random) {
        return String.valueOf(QUERY_CHARACTERS.charAt(random.nextInt(QUERY_CHARACTERS.length())));
    }

    static int randomOffset(Random random) {
        return random.nextInt(OFFSETS);
    }

    /** {@code {source, position}} of global index {@code r} across {@code sizes}, where {@code 0 <= r < sum(sizes)}. */
    static int[] pick(long[] sizes, long r) {
        for (int i = 0; i < sizes.length; i++) {
            if (r < sizes[i]) return new int[] {i, (int) r};
            r -= sizes[i];
        }
        throw new IllegalArgumentException("past the last source");
    }

    // ---- From Spotify ----

    /** Starts a run that plays one song from all of Spotify; it returns at once. */
    public static void playFromSpotify(Context context) {
        playFromSpotify(context, WebApi.HTTP);
    }

    static void playFromSpotify(Context context, WebApi.Http http) {
        try {
            Context app = context.getApplicationContext();
            PlayerBridge.post(() -> WebApi.token(step(app, token -> search(app, http, token))));
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't start a random song from Spotify", e);
        }
    }

    /**
     * On the bridge thread: one search, and one more below the total when its page came back empty.
     * Each runs on the Web API thread, and its answer comes back here.
     */
    private static void search(Context context, WebApi.Http http, byte[] tokenBytes) {
        String token = new String(tokenBytes, StandardCharsets.UTF_8);
        Random random = ThreadLocalRandom.current();
        String query = randomQuery(random);
        WebApi.get(http, WebApi.searchUrl(query, randomOffset(random)), token, step(context, body -> {
            WebApi.SearchResult found = WebApi.parseSearch(new String(body, StandardCharsets.UTF_8));
            if (found.trackUri == null && found.total > 0) {
                int offset = ThreadLocalRandom.current().nextInt(Math.min(found.total, OFFSETS));
                WebApi.get(http, WebApi.searchUrl(query, offset), token, step(context, again ->
                        playFound(context, query, WebApi.parseSearch(new String(again, StandardCharsets.UTF_8)))));
            } else {
                playFound(context, query, found);
            }
        }));
    }

    /** Plays the track alone in its context, so Spotify's autoplay carries on after it. */
    private static void playFound(Context context, String query, WebApi.SearchResult found) throws IOException {
        if (found.trackUri == null) throw new IOException("no song matched \"" + query + "\"");
        play(context, found.trackUri, null, "Playing " + found.trackUri + " from Spotify");
    }

    // ---- From my library ----

    /** Starts a run that plays one song from the user's library; it returns at once. */
    public static void playFromLibrary(Context context) {
        playFromLibrary(context, LOADING_RETRY_MILLIS);
    }

    static void playFromLibrary(Context context, long loadingRetryMillis) {
        try {
            PlayerBridge.post(new FromLibrary(context.getApplicationContext(), loadingRetryMillis)::list);
        } catch (Throwable e) {
            Log.w("Spicetify", "Couldn't start a random song from the library", e);
        }
    }

    /**
     * One pick from the library, evenly across the songs of Liked Songs, the playlists and the saved
     * albums. Evenly as far as the counts allow: a playlist is weighed by its Your Library TRACK
     * count, so when some of its songs can't play, the others come up a little more often. A source
     * whose size can't be read is left out of the pick. Its steps run one at a time on the bridge
     * thread: the first is posted there, a retry is posted there after its delay, and every other
     * step runs in the last one's bridge callback. So the fields need no lock.
     */
    private static final class FromLibrary {
        private final Context context;
        private final long loadingRetryMillis;
        private final Map<String, List<String>> albumTracks = new HashMap<>();
        private List<Esperanto.LibrarySource> sources;
        private long[] sizes;
        private int retries;
        /** How many sources couldn't be sized, and why the first one couldn't. */
        private int unreadable;
        private String unreadableReason;

        FromLibrary(Context context, long loadingRetryMillis) {
            this.context = context;
            this.loadingRetryMillis = loadingRetryMillis;
        }

        void list() {
            call(Esperanto.YOUR_LIBRARY, "All", Esperanto.yourLibraryAll(), this::listed);
        }

        private void listed(byte[] body) throws IOException {
            Esperanto.Library library = Esperanto.parseYourLibrary(body);
            if (library.loading) {
                if (retries++ == LOADING_RETRIES) throw new IOException("your library is still loading");
                PlayerBridge.postDelayed(this::list, loadingRetryMillis);
                return;
            }
            sources = library.sources;
            sizes = new long[sources.size()];
            size(0);
        }

        /**
         * Sizes each source from {@code first} on, one request at a time, then chooses. A playlist
         * with a count needs no request. Liked Songs and a playlist without one go by their playable
         * length, and an album by its track list, which is kept for the pick.
         */
        private void size(int first) {
            for (int i = first; i < sources.size(); i++) {
                Esperanto.LibrarySource source = sources.get(i);
                int index = i;
                if (source.album) {
                    sizeWith(index, Esperanto.METADATA, "GetEntity", Esperanto.getEntity(source.uri), body -> {
                        List<String> tracks = Esperanto.parseAlbumTracks(body);
                        albumTracks.put(source.uri, tracks);
                        sizes[index] = tracks.size();
                    });
                    return;
                }
                if (source.trackCount < 0) {
                    sizeWith(index, Esperanto.PLAYLIST, "Get", Esperanto.playlistGet(source.uri, 0, 0),
                            body -> sizes[index] = Esperanto.parsePlaylistGet(body).length);
                    return;
                }
                sizes[i] = source.trackCount;
            }
            choose();
        }

        /**
         * One size request, whose answer {@code read} turns into the source's size. A source that
         * can't be read, through a failed call or an answer that won't parse, is left out with size
         * 0 and sizing goes on; only a lost router ends the run.
         */
        private void sizeWith(int index, String service, String method, byte[] request, Step read) {
            PlayerBridge.Result next = step(context, ignored -> size(index + 1));
            PlayerBridge.call(service, method, request, new PlayerBridge.Result() {
                @Override
                public void done(byte[] body) {
                    try {
                        read.run(body);
                    } catch (Throwable e) {
                        unreadable(index, reason(e));
                    }
                    next.done(body);
                }

                @Override
                public void failed(String reason) {
                    if (PlayerBridge.NOT_CONNECTED.equals(reason)) {
                        next.failed(reason);
                        return;
                    }
                    unreadable(index, reason);
                    next.done(null);
                }
            });
        }

        private void unreadable(int index, String reason) {
            sizes[index] = 0;
            if (unreadable++ == 0) unreadableReason = reason;
        }

        private void choose() {
            long total = 0;
            for (long size : sizes) total += size;
            if (total == 0) {
                // With sources left out, that's why nothing is left, not an empty library.
                if (unreadable > 0) {
                    fail(context, unreadableReason, null);
                } else {
                    tell(context, Extensions.RANDOM_SONG, "Your library has no songs to pick from");
                }
                return;
            }
            int[] picked = pick(sizes, ThreadLocalRandom.current().nextLong(total));
            int index = picked[0];
            Esperanto.LibrarySource source = sources.get(index);
            if (source.album) {
                play(source.uri, albumTracks.get(source.uri).get(picked[1]));
            } else if (source.trackCount < 0) {
                fetch(source.uri, picked[1]);
            } else {
                // The count includes unplayable songs, so the position may not exist: take a new one
                // below the playable length. A playlist with no playable songs leaves the pick.
                call(Esperanto.PLAYLIST, "Get", Esperanto.playlistGet(source.uri, 0, 0), body -> {
                    int length = Esperanto.parsePlaylistGet(body).length;
                    if (length == 0) {
                        sizes[index] = 0;
                        choose();
                    } else {
                        fetch(source.uri, ThreadLocalRandom.current().nextInt(length));
                    }
                });
            }
        }

        private void fetch(String playlistUri, int position) {
            call(Esperanto.PLAYLIST, "Get", Esperanto.playlistGet(playlistUri, position, 1), body -> {
                List<String> uris = Esperanto.parsePlaylistGet(body).uris;
                if (uris.isEmpty()) throw new IOException("no song at " + position + " in " + playlistUri);
                play(playlistUri, uris.get(0));
            });
        }

        /** The counts in the status are for comparing with the Library screen. */
        private void play(String sourceUri, String trackUri) {
            int albums = 0;
            for (Esperanto.LibrarySource source : sources) {
                if (source.album) albums++;
            }
            int playlists = sources.size() - 1 - albums; // sources[0] is Liked Songs
            String leftOut = unreadable == 0 ? "" : "; " + unreadable + " couldn't be read";
            RandomSong.play(context, sourceUri, trackUri, "Playing " + trackUri + " from your library ("
                    + playlists + " playlists, " + albums + " albums and Liked Songs" + leftOut + ")");
        }

        private void call(String service, String method, byte[] request, Step next) {
            PlayerBridge.call(service, method, request, step(context, next));
        }
    }

    // ---- Both ----

    /** Plays {@code contextUri}, from {@code trackUri} when it isn't null, then shows {@code playing} as the status. */
    private static void play(Context context, String contextUri, String trackUri, String playing) {
        byte[] request = Esperanto.playContext(contextUri, trackUri);
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "Play", request, step(context, body -> {
            int error = Esperanto.parseResult(body);
            if (error != Esperanto.OK) throw new IOException("Spotify refused to play it (error " + error + ")");
            Extensions.status(Extensions.RANDOM_SONG, playing);
        }));
    }

    /** What a step does with its answer. Anything it throws ends the run, as a failed call does. */
    interface Step {
        void run(byte[] body) throws Exception;
    }

    /** How a run ends when a step fails: {@code e} is what the step threw, or null when the call failed. */
    interface Failure {
        void fail(String reason, Throwable e);
    }

    /** {@code next} as a bridge callback that ends this extension's run through {@link #fail}. */
    private static PlayerBridge.Result step(Context context, Step next) {
        return step(next, (reason, e) -> fail(context, reason, e));
    }

    /**
     * {@code next} as a bridge callback, which runs on the bridge thread and never throws: a failed
     * call, or anything {@code next} throws, goes to {@code failure}. Shuffle+ runs its steps this way too.
     */
    static PlayerBridge.Result step(Step next, Failure failure) {
        return new PlayerBridge.Result() {
            @Override
            public void done(byte[] body) {
                try {
                    next.run(body);
                } catch (Throwable e) {
                    failure.fail(reason(e), e);
                }
            }

            @Override
            public void failed(String reason) {
                failure.fail(reason, null);
            }
        };
    }

    private static String reason(Throwable e) {
        return e.getMessage() != null ? e.getMessage() : e.toString();
    }

    private static void fail(Context context, String reason, Throwable e) {
        Log.w("Spicetify", "Play a random song failed: " + reason, e);
        tell(context, Extensions.RANDOM_SONG, "Couldn't find a random song: " + reason);
    }

    /** Shows {@code line} as extension {@code id}'s status, and in a Toast on the main thread. */
    static void tell(Context context, String id, String line) {
        Extensions.status(id, line);
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Toast.makeText(context, line, Toast.LENGTH_LONG).show();
            } catch (Throwable e) {
                Log.w("Spicetify", "Couldn't show a Toast", e);
            }
        });
    }
}
