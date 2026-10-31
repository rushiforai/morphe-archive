package app.originisland.extension;

import static app.originisland.extension.MusicCardProtocol.*;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaDescription;
import android.media.MediaMetadata;
import android.media.Rating;
import android.media.browse.MediaBrowser;
import android.media.session.MediaSession;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.service.media.MediaBrowserService;
import android.util.Log;

import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Makes LastWave speak the protocol of the OriginOS music card (com.vivo.musicwidgetmix):
 * the song, the heart button, which likes the song the way LastWave does, the playlist,
 * which is the queue of the session, and the loop mode button, which is the repeat and
 * the shuffle mode of the session.
 *
 * The card draws the cover from the image in the metadata, and only reads the address of the
 * cover from files of the device. LastWave gives the cover by its address on the web, and an
 * image that can be kept on the graphics processor, which the card cannot draw from, so the
 * card is given an image it can draw.
 */
@SuppressWarnings("unused")
public final class LastWaveMusicCardPatch {

    private static final String TAG = "OriginIslandLastWave";

    /**
     * The card only listens for the metadata once it has connected, which takes a moment.
     */
    private static final long PUBLISH_AFTER_CONNECTING_DELAY_MS = 1500;

    /**
     * Changing the loop mode changes the repeat and the shuffle mode one after the other.
     */
    private static final long PUBLISH_LAST_METADATA_DELAY_MS = 150;

    /**
     * Largest width and height of the cover the card is given.
     */
    private static final int MAX_COVER_SIZE = 720;
    private static final int MAX_COVERS_KEPT = 8;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static final ExecutorService coverLoader = Executors.newSingleThreadExecutor();

    /**
     * Covers that were loaded from the web, by their address, and the image the card was last
     * given for an image of the app.
     */
    private static final Map<String, Bitmap> loadedCovers = new LinkedHashMap<String, Bitmap>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) {
            return size() > MAX_COVERS_KEPT;
        }
    };
    private static final Map<String, Boolean> coversLoading = new LinkedHashMap<>();
    private static Bitmap lastAppCover;
    private static Bitmap lastDrawableCover;
    private static final Runnable publishLastMetadataTask = LastWaveMusicCardPatch::publishLastMetadata;

    private static WeakReference<MediaSession> sessionRef = new WeakReference<>(null);
    private static WeakReference<MediaBrowserService> browserServiceRef = new WeakReference<>(null);
    private static PlayModes playModes;

    /**
     * Metadata as last given to the session, before the keys of the card are added.
     */
    private static MediaMetadata lastMetadata;
    private static String trackId = "";
    private static Boolean likedPublished;

    /**
     * A like is toggled in the background, and LastWave can change it as well,
     * so it is checked again this often while the card is connected.
     */
    private static final long LIKE_CHECK_INTERVAL_MS = 1_500;
    private static final Runnable checkLikeTask = LastWaveMusicCardPatch::checkLike;
    private static boolean cardConnected;

    /**
     * The lyrics LastWave loaded last, as LRC, and the media id of the song they are for.
     */
    private static String lyrics = "";
    private static String lyricsFor = "";
    private static final Runnable sendLyricsTask = LastWaveMusicCardPatch::sendLyrics;

    private LastWaveMusicCardPatch() {
    }

    /**
     * Injection point.
     *
     * The card is given a root of the platform, so that everything it asks the media browser
     * service for goes through the platform.
     *
     * @return The root for the client, or null if the client is not the music card.
     */
    public static MediaBrowserService.BrowserRoot onGetBrowserRoot(String clientPackageName) {
        if (!MUSIC_CARD_PACKAGE.equals(clientPackageName)) {
            return null;
        }

        mainHandler.postDelayed(publishLastMetadataTask, PUBLISH_AFTER_CONNECTING_DELAY_MS);
        // The card only listens for lyrics once it has connected.
        mainHandler.postDelayed(sendLyricsTask, PUBLISH_AFTER_CONNECTING_DELAY_MS);
        if (!cardConnected) {
            cardConnected = true;
            mainHandler.postDelayed(checkLikeTask, LIKE_CHECK_INTERVAL_MS);
        }
        return new MediaBrowserService.BrowserRoot(BROWSER_ROOT_ID, null);
    }

    /**
     * Injection point. Called as the app makes a session.
     */
    public static void onSessionCreated(MediaSession session) {
        // The app sets the session up after it has made it.
        mainHandler.post(() -> {
            synchronized (LastWaveMusicCardPatch.class) {
                if (sessionRef.get() == null) {
                    attachSession(session);
                }
            }
        });
    }

    /**
     * Injection point. Called with the metadata of the app.
     */
    public static synchronized MediaMetadata onSetMetadata(MediaSession session, MediaMetadata metadata) {
        try {
            attachSession(session);
            lastMetadata = metadata;

            if (metadata == null) {
                return null;
            }

            // The card ignores a song change unless the media id changes as well.
            String mediaId = mediaIdOf(
                    metadata.getString(MediaMetadata.METADATA_KEY_TITLE),
                    metadata.getString(MediaMetadata.METADATA_KEY_ARTIST)
            );
            if (!mediaId.equals(trackId)) {
                trackId = mediaId;

                MediaBrowserService browserService = browserServiceRef.get();
                if (browserService != null) {
                    browserService.notifyChildrenChanged(LIST_CURRENT);
                }

                // Sent after the metadata, so the card has the song the lyrics are for.
                mainHandler.post(sendLyricsTask);
            }

            return withMusicCardKeys(metadata);
        } catch (Exception ex) {
            Log.e(TAG, "onSetMetadata failure", ex);
        }

        return metadata;
    }

    /**
     * Injection point. The card sends a heart rating for its heart button.
     */
    public static Rating onSetRating(Rating rating) {
        try {
            if (rating == null || rating.getRatingStyle() != Rating.RATING_HEART) {
                return rating;
            }

            Boolean liked = LastWaveLikes.isLiked();
            Log.i(TAG, "Heart rating received: " + rating.hasHeart() + ", liked: " + liked);
            if (liked != null && liked != rating.hasHeart() && LastWaveLikes.toggleLike()) {
                // The like is toggled in the background.
                mainHandler.postDelayed(checkLikeTask, 400);
            }
        } catch (Exception ex) {
            Log.e(TAG, "onSetRating failure", ex);
        }

        return rating;
    }

    private static void checkLike() {
        try {
            Boolean liked = LastWaveLikes.isLiked();
            if (liked != null && !liked.equals(likedPublished)) {
                publishLastMetadataSoon();
            }
        } catch (Exception ex) {
            Log.e(TAG, "checkLike failure", ex);
        }

        mainHandler.removeCallbacks(checkLikeTask);
        mainHandler.postDelayed(checkLikeTask, LIKE_CHECK_INTERVAL_MS);
    }

    /**
     * Injection point.
     *
     * @return The custom action the app should handle, or null if it was handled here.
     */
    public static synchronized String onCustomAction(String action, Bundle extras) {
        try {
            if (!ACTION_PLAY_MODE.equals(action)) {
                return action;
            }

            int loopMode = extras == null ? 0 : extras.getInt(KEY_LOOP_MODE);
            Log.i(TAG, "Loop mode received: " + loopMode);

            // LastWave repeats and shuffles at the same time, which the card has no mode for,
            // so shuffling turns repeating off, and repeating turns shuffling off.
            if (playModes != null) {
                if (loopMode == LOOP_MODE_RANDOM) {
                    playModes.setRepeatMode(PlayModes.REPEAT_MODE_NONE);
                    playModes.setShuffleMode(PlayModes.SHUFFLE_MODE_ALL);
                } else {
                    playModes.setShuffleMode(PlayModes.SHUFFLE_MODE_NONE);
                    playModes.setRepeatMode(loopMode == LOOP_MODE_SINGLE
                            ? PlayModes.REPEAT_MODE_ONE
                            : PlayModes.REPEAT_MODE_ALL);
                }
            }

            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onCustomAction failure", ex);
        }

        return action;
    }

    /**
     * Injection point.
     *
     * @return The parent the app should load the children of, or null if they were loaded here.
     */
    public static synchronized String onLoadChildren(MediaBrowserService browserService, String parentId,
                                                     MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result,
                                                     Bundle options) {
        try {
            if (!LIST_CURRENT.equals(parentId)) {
                // The card only asks for the lists it is told of, and nothing else of the app.
                if (BROWSER_ROOT_ID.equals(parentId)) {
                    result.sendResult(new ArrayList<>());
                    return null;
                }
                return parentId;
            }

            browserServiceRef = new WeakReference<>(browserService);

            int page = options == null ? 0 : options.getInt(LIST_KEY_PAGE);
            List<MediaDescription> songs = new ArrayList<>();
            List<MediaSession.QueueItem> queue = page == 0 ? getQueue() : null;
            if (queue != null) {
                for (MediaSession.QueueItem song : queue) {
                    MediaDescription description = song.getDescription();
                    songs.add(new MediaDescription.Builder()
                            .setMediaId(mediaIdOf(description.getTitle(), description.getSubtitle()))
                            .setTitle(description.getTitle())
                            .setSubtitle(description.getSubtitle() == null ? "" : description.getSubtitle())
                            .build());
                }
            }

            Log.i(TAG, "Playlist loaded: " + songs.size() + " songs");
            if (songs.isEmpty() && page == 0) {
                songs.add(new MediaDescription.Builder()
                        .setMediaId(EMPTY_LIST_MEDIA_ID)
                        .setTitle("Nothing playing")
                        .setSubtitle("Play something in LastWave")
                        .build());
            }
            result.sendResult(toSinglePage(songs));

            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onLoadChildren failure", ex);
        }

        return parentId;
    }

    /**
     * Injection point.
     */
    public static String onLoadChildren(MediaBrowserService browserService, String parentId,
                                        MediaBrowserService.Result<List<MediaBrowser.MediaItem>> result) {
        return onLoadChildren(browserService, parentId, result, null);
    }

    /**
     * Injection point.
     *
     * @return The media id the app should play, or null if it was played here.
     */
    public static synchronized String onPlayFromMediaId(String mediaId, Bundle extras) {
        try {
            if (EMPTY_LIST_MEDIA_ID.equals(mediaId)) {
                return null;
            }
            if (mediaId == null || extras == null || !LIST_CURRENT.equals(extras.getString(KEY_LIST))) {
                return mediaId;
            }

            MediaSession session = sessionRef.get();
            List<MediaSession.QueueItem> queue = getQueue();
            if (session != null && queue != null) {
                for (MediaSession.QueueItem song : queue) {
                    MediaDescription description = song.getDescription();
                    if (mediaId.equals(mediaIdOf(description.getTitle(), description.getSubtitle()))) {
                        session.getController().getTransportControls().skipToQueueItem(song.getQueueId());
                        break;
                    }
                }
            }

            return null;
        } catch (Exception ex) {
            Log.e(TAG, "onPlayFromMediaId failure", ex);
        }

        return mediaId;
    }

    private static List<MediaSession.QueueItem> getQueue() {
        MediaSession session = sessionRef.get();
        return session == null ? null : session.getController().getQueue();
    }

    /**
     * The same song gets the same media id in the metadata and in the queue.
     */
    static String mediaIdOf(CharSequence title, CharSequence artist) {
        return Integer.toHexString(Objects.hash(
                title == null ? null : title.toString(),
                artist == null ? null : artist.toString()
        ));
    }

    static synchronized void onLyricsChanged(String mediaId, String lrc) {
        if (!lrc.equals(lyrics) || !mediaId.equals(lyricsFor)) {
            lyrics = lrc;
            lyricsFor = mediaId;
            // The app may still be about to publish the song these lyrics are for.
            mainHandler.post(sendLyricsTask);
        }
    }

    /**
     * Sends the lyrics of the song that plays, or none if LastWave has not loaded them yet.
     */
    private static synchronized void sendLyrics() {
        try {
            MediaSession session = sessionRef.get();
            if (session == null) {
                return;
            }

            String lrc = trackId.equals(lyricsFor) ? lyrics : "";

            // The app keeps extras of its own on the session.
            Bundle appExtras = session.getController().getExtras();
            Bundle extras = appExtras == null ? new Bundle() : new Bundle(appExtras);
            extras.putString(EXTRA_ACTION, EXTRA_ACTION_LYRICS_CHANGED);
            extras.putString(EXTRA_MEDIA_ID, trackId);
            extras.putString(EXTRA_LYRICS, lrc);
            session.setExtras(extras);

            Log.i(TAG, "Lyrics sent: " + lrc.length() + " characters");
        } catch (Exception ex) {
            Log.e(TAG, "sendLyrics failure", ex);
        }
    }

    private static void attachSession(MediaSession session) {
        if (session != null && sessionRef.get() != session) {
            sessionRef = new WeakReference<>(session);
            playModes = new PlayModes(session, mainHandler, LastWaveMusicCardPatch::publishLastMetadataSoon);
        }
    }

    private static void publishLastMetadataSoon() {
        mainHandler.removeCallbacks(publishLastMetadataTask);
        mainHandler.postDelayed(publishLastMetadataTask, PUBLISH_LAST_METADATA_DELAY_MS);
    }

    /**
     * The card only reads the loop mode and what it may control when the metadata changes.
     */
    private static synchronized void publishLastMetadata() {
        try {
            MediaSession session = sessionRef.get();
            if (session != null && lastMetadata != null) {
                session.setMetadata(withMusicCardKeys(lastMetadata));
            }
        } catch (Exception ex) {
            Log.e(TAG, "publishLastMetadata failure", ex);
        }
    }

    /**
     * @return An image of the cover the card can draw, or null if there is none yet.
     */
    private static Bitmap getDrawableCover(MediaMetadata metadata) {
        // The image LastWave gives the session can stand in for the cover while it loads it,
        // so the cover is loaded from its address, and the image is only used until it is.
        String address = metadata.getString(MediaMetadata.METADATA_KEY_ALBUM_ART_URI);
        if (address == null) {
            address = metadata.getString(MediaMetadata.METADATA_KEY_ART_URI);
        }
        if (address != null && (address.startsWith("https://") || address.startsWith("http://"))) {
            Bitmap loaded = loadedCovers.get(address);
            if (loaded != null) {
                return loaded;
            }
            if (!coversLoading.containsKey(address)) {
                coversLoading.put(address, true);
                String coverAddress = address;
                coverLoader.execute(() -> loadCover(coverAddress));
            }
        }

        Bitmap appCover = metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
        if (appCover == null) {
            appCover = metadata.getBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON);
        }
        if (appCover == null || appCover.isRecycled()) {
            return null;
        }
        if (appCover != lastAppCover) {
            lastAppCover = appCover;
            lastDrawableCover = toDrawable(appCover);
            Log.i(TAG, "Cover of the app: " + appCover.getWidth() + "x" + appCover.getHeight()
                    + ", " + appCover.getConfig());
        }
        return lastDrawableCover;
    }

    private static void loadCover(String address) {
        Bitmap cover = null;
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(10_000);
            try (InputStream stream = connection.getInputStream()) {
                Bitmap decoded = BitmapFactory.decodeStream(stream);
                if (decoded != null) {
                    cover = toDrawable(decoded);
                }
            } finally {
                connection.disconnect();
            }
        } catch (Exception ex) {
            Log.e(TAG, "loadCover failure", ex);
        }

        synchronized (LastWaveMusicCardPatch.class) {
            coversLoading.remove(address);
            if (cover != null) {
                loadedCovers.put(address, cover);
                publishLastMetadataSoon();
            }
            Log.i(TAG, "Cover loaded from " + address + ": " + (cover == null ? "failed" : cover.getWidth() + "x" + cover.getHeight()));
        }
    }

    /**
     * @return The image in memory the card can draw from, and no larger than it needs.
     */
    private static Bitmap toDrawable(Bitmap image) {
        try {
            Bitmap drawable = image;
            if (image.getConfig() == null || image.getConfig() == Bitmap.Config.HARDWARE) {
                drawable = image.copy(Bitmap.Config.ARGB_8888, false);
            }

            int largest = Math.max(drawable.getWidth(), drawable.getHeight());
            if (largest > MAX_COVER_SIZE) {
                float scale = MAX_COVER_SIZE / (float) largest;
                drawable = Bitmap.createScaledBitmap(drawable,
                        Math.max(1, Math.round(drawable.getWidth() * scale)),
                        Math.max(1, Math.round(drawable.getHeight() * scale)), true);
            }
            return drawable;
        } catch (Exception ex) {
            Log.e(TAG, "toDrawable failure", ex);
            return image;
        }
    }

    private static final String[] COVER_ADDRESS_KEYS = {
            MediaMetadata.METADATA_KEY_ALBUM_ART_URI,
            MediaMetadata.METADATA_KEY_ART_URI,
            MediaMetadata.METADATA_KEY_DISPLAY_ICON_URI,
    };

    /**
     * @return The metadata without the addresses of the cover, which it has no way to remove.
     */
    private static MediaMetadata.Builder withoutCoverAddresses(MediaMetadata metadata) {
        MediaMetadata.Builder builder = new MediaMetadata.Builder();

        keys:
        for (String key : metadata.keySet()) {
            for (String addressKey : COVER_ADDRESS_KEYS) {
                if (addressKey.equals(key)) {
                    continue keys;
                }
            }

            try {
                Bitmap bitmap = metadata.getBitmap(key);
                if (bitmap != null) {
                    builder.putBitmap(key, bitmap);
                    continue;
                }
            } catch (Exception ignored) {
                // Not an image.
            }
            try {
                Rating rating = metadata.getRating(key);
                if (rating != null) {
                    builder.putRating(key, rating);
                    continue;
                }
            } catch (Exception ignored) {
                // Not a rating.
            }
            try {
                CharSequence text = metadata.getText(key);
                if (text != null) {
                    builder.putText(key, text);
                    continue;
                }
            } catch (Exception ignored) {
                // Not a text.
            }
            try {
                builder.putLong(key, metadata.getLong(key));
            } catch (Exception ignored) {
                // Of a kind the builder does not take.
            }
        }

        return builder;
    }

    private static MediaMetadata withMusicCardKeys(MediaMetadata metadata) {
        // LastWave tells the card what it may control itself since version 5.0.0, such as the heart
        // and its lists, which this only adds to.
        long supportEvent = metadata.getLong(KEY_SUPPORT_EVENT)
                | EVENT_PLAY_CONTROL | EVENT_MUSIC_INFO | EVENT_MUSIC_IMAGE
                | EVENT_SEEK_POSITION | EVENT_LIST_CURRENT | EVENT_MUSIC_LRC;

        Boolean liked = LastWaveLikes.isLiked();
        likedPublished = liked;

        Bitmap cover = getDrawableCover(metadata);

        // The card prefers the address of the cover, and can only read it from a file of the
        // device, so the card is given the image of the cover without its address.
        MediaMetadata.Builder builder = cover == null
                ? new MediaMetadata.Builder(metadata)
                : withoutCoverAddresses(metadata);
        builder.putString(MediaMetadata.METADATA_KEY_MEDIA_ID, trackId);

        if (cover != null) {
            builder.putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART, cover);
            builder.putBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON, cover);
            builder.putBitmap(MediaMetadata.METADATA_KEY_ART, cover);
        }

        if (liked != null) {
            supportEvent |= EVENT_FAVORITE;
            builder.putRating(MediaMetadata.METADATA_KEY_RATING, Rating.newHeartRating(liked));
        }

        if (playModes != null && playModes.isKnown()) {
            supportEvent |= EVENT_LOOP_MODE;

            int loopMode;
            if (playModes.getShuffleMode() >= PlayModes.SHUFFLE_MODE_ALL) {
                loopMode = LOOP_MODE_RANDOM;
            } else if (playModes.getRepeatMode() == PlayModes.REPEAT_MODE_ONE) {
                loopMode = LOOP_MODE_SINGLE;
            } else {
                loopMode = LOOP_MODE_LIST;
            }
            builder.putLong(KEY_LOOP_MODE, loopMode);
        }

        return builder.putLong(KEY_SUPPORT_EVENT, supportEvent).build();
    }
}
