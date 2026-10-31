package app.fakhradio.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Rewrites the media session metadata the app publishes, so the system media
 * card and notification show the song instead of the station.
 *
 * <p>The app's {@code MediaMetadataCompat} and {@code MediaSessionCompat} keep
 * their class names but R8 renames their methods, so this class only touches
 * them through {@link Parcel} (the metadata parcels as a single {@link Bundle})
 * and through a reflective lookup by method signature.
 */
@SuppressWarnings("unused")
public final class NowPlaying {
    private static final String TITLE = "android.media.metadata.TITLE";
    private static final String ARTIST = "android.media.metadata.ARTIST";
    private static final String ALBUM = "android.media.metadata.ALBUM";
    private static final String ART = "android.media.metadata.ART";
    private static final String ART_URI = "android.media.metadata.ART_URI";
    private static final String DISPLAY_TITLE = "android.media.metadata.DISPLAY_TITLE";
    private static final String DISPLAY_SUBTITLE = "android.media.metadata.DISPLAY_SUBTITLE";
    private static final String DISPLAY_ICON_URI = "android.media.metadata.DISPLAY_ICON_URI";
    private static final String STATION_ICON_URI = "appmind.media.metadata.PLAYABLE_ICON_URI";
    private static final int MAX_ART_SIZE = 512;
    private static final int CACHE_SIZE = 12;
    private static final int MAX_REDIRECTS = 5;
    private static final long RETRY_AFTER_MS = 30_000;
    private static final String TAG = "FakhRadio";

    private static final ExecutorService loader = Executors.newFixedThreadPool(2);
    private static final Handler main = new Handler(Looper.getMainLooper());

    /** Downloaded artwork by URL, least recently used first. */
    private static final Map<String, Bitmap> cache = new LinkedHashMap<String, Bitmap>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) {
            return size() > CACHE_SIZE;
        }
    };
    private static final Set<String> loading = new HashSet<>();
    /** When each URL last failed to download, so it is retried later instead of never. */
    private static final Map<String, Long> failedAt = new HashMap<>();

    private static Context lastContext;
    private static Object lastSession;
    private static Parcelable lastMetadata;

    private NowPlaying() {
    }

    /**
     * Called by the patched {@code MediaService2.Z()} right before it hands
     * {@code metadata} to {@code session}. Returns the metadata to publish instead.
     *
     * <p>Attaches the best artwork that is already downloaded: the song's, else
     * the station logo. Whatever is missing is fetched in the background, and the
     * metadata is published again once it arrives.
     *
     * @param context  the media service, used to post the media notification again
     * @param session  the service's {@code MediaSessionCompat}
     * @param metadata the {@code MediaMetadataCompat} the app built, or null
     * @return the rewritten metadata, or {@code metadata} unchanged on any failure
     */
    public static synchronized Parcelable decorate(Context context, Object session, Parcelable metadata) {
        lastContext = context;
        lastSession = session;
        lastMetadata = metadata;
        if (metadata == null) {
            return null;
        }
        try {
            Bundle bundle = toBundle(metadata);
            CharSequence song = bundle.getString(TITLE);
            if (!TextUtils.isEmpty(song)) {
                // The station moves to the album line, where players that show
                // three lines still list it.
                bundle.putCharSequence(ALBUM, bundle.getCharSequence(DISPLAY_TITLE));
                bundle.putCharSequence(DISPLAY_TITLE, song);
                bundle.putCharSequence(DISPLAY_SUBTITLE, bundle.getString(ARTIST));
            }
            Bitmap art = null;
            for (String url : artworkUrls(bundle)) {
                Bitmap cached = cache.get(url);
                if (cached != null) {
                    art = cached;
                    break;
                }
                load(url);
            }
            if (art != null) {
                bundle.putParcelable(ART, art);
            }
            return fromBundle(metadata, bundle);
        } catch (Throwable t) {
            Log.w(TAG, "decorate failed", t);
            return metadata;
        }
    }

    /** The artwork URLs in {@code bundle}, best first: the song's, then the station logo. */
    private static Set<String> artworkUrls(Bundle bundle) {
        Set<String> urls = new LinkedHashSet<>();
        for (String key : new String[] {ART_URI, DISPLAY_ICON_URI, STATION_ICON_URI}) {
            String url = bundle.getString(key);
            if (!TextUtils.isEmpty(url)) {
                urls.add(url);
            }
        }
        return urls;
    }

    /**
     * Downloads {@code url} off the main thread unless it is already loading or
     * failed recently, then publishes the last metadata again so it picks the
     * bitmap up.
     */
    private static void load(String url) {
        Long failed = failedAt.get(url);
        if (loading.contains(url) || (failed != null && SystemClock.elapsedRealtime() - failed < RETRY_AFTER_MS)) {
            return;
        }
        loading.add(url);
        loader.execute(() -> {
            Bitmap bitmap = download(url);
            synchronized (NowPlaying.class) {
                loading.remove(url);
                if (bitmap == null) {
                    failedAt.put(url, SystemClock.elapsedRealtime());
                    return;
                }
                failedAt.remove(url);
                cache.put(url, bitmap);
            }
            main.post(NowPlaying::republish);
        });
    }

    /**
     * Sets the last metadata on the last session again, with whatever artwork is
     * cached now, then posts the media notification again. SystemUI only reads
     * the session metadata, artwork included, when the media notification is
     * posted or updated; a metadata change alone leaves the card on the picture
     * it read when the song started.
     */
    private static void republish() {
        Context context;
        Object session;
        Parcelable metadata;
        synchronized (NowPlaying.class) {
            context = lastContext;
            session = lastSession;
            metadata = lastMetadata;
        }
        if (session == null || metadata == null) {
            return;
        }
        try {
            Parcelable decorated = decorate(context, session, metadata);
            for (Method method : session.getClass().getMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (method.getReturnType() == void.class && parameters.length == 1
                        && parameters[0] == metadata.getClass()) {
                    method.invoke(session, decorated);
                    repostMediaNotification(context);
                    return;
                }
            }
            Log.w(TAG, "republish found no setMetadata on " + session.getClass().getName());
        } catch (Throwable t) {
            // The next metadata update from the app attaches the cached bitmap anyway.
            Log.w(TAG, "republish failed", t);
        }
    }

    /** Posts the app's media notification again unchanged, so SystemUI reads the session metadata anew. */
    private static void repostMediaNotification(Context context) {
        if (context == null) {
            return;
        }
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        for (StatusBarNotification posted : manager.getActiveNotifications()) {
            Notification notification = posted.getNotification();
            if (notification.extras.containsKey(Notification.EXTRA_MEDIA_SESSION)) {
                notification.flags |= Notification.FLAG_ONLY_ALERT_ONCE;
                manager.notify(posted.getTag(), posted.getId(), notification);
            }
        }
    }

    /**
     * Fetches and decodes the image at {@code url}, scaled down to about
     * {@code MAX_ART_SIZE} pixels. Follows redirects itself, since
     * {@link HttpURLConnection} does not follow one between http and https.
     */
    private static Bitmap download(String url) {
        try {
            URL current = new URL(url);
            for (int hop = 0; hop <= MAX_REDIRECTS; hop++) {
                HttpURLConnection connection = (HttpURLConnection) current.openConnection();
                try {
                    connection.setInstanceFollowRedirects(false);
                    connection.setConnectTimeout(10_000);
                    connection.setReadTimeout(10_000);
                    int code = connection.getResponseCode();
                    if (code >= 300 && code < 400) {
                        String location = connection.getHeaderField("Location");
                        if (location == null) {
                            return null;
                        }
                        current = new URL(current, location);
                        continue;
                    }
                    if (code != HttpURLConnection.HTTP_OK) {
                        Log.w(TAG, "download " + current + " got HTTP " + code);
                        return null;
                    }
                    try (InputStream in = connection.getInputStream()) {
                        return decode(readAll(in));
                    }
                } finally {
                    connection.disconnect();
                }
            }
        } catch (Throwable t) {
            // Falls through to null; the URL is retried after RETRY_AFTER_MS.
            Log.w(TAG, "download " + url + " failed", t);
        }
        return null;
    }

    /** Decodes {@code data}, halving the size until it is at most about {@code MAX_ART_SIZE} pixels. */
    private static Bitmap decode(byte[] data) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(data, 0, data.length, bounds);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = 1;
        while (Math.max(bounds.outWidth, bounds.outHeight) / (options.inSampleSize * 2) >= MAX_ART_SIZE) {
            options.inSampleSize *= 2;
        }
        return BitmapFactory.decodeByteArray(data, 0, data.length, options);
    }

    /** Reads {@code in} to the end. */
    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
        return out.toByteArray();
    }

    /** Unpacks the metadata's backing bundle; MediaMetadataCompat parcels as exactly that. */
    private static Bundle toBundle(Parcelable metadata) {
        Parcel parcel = Parcel.obtain();
        try {
            metadata.writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            Bundle bundle = parcel.readBundle(metadata.getClass().getClassLoader());
            return bundle != null ? bundle : new Bundle();
        } finally {
            parcel.recycle();
        }
    }

    /** Builds a new metadata of the same class as {@code template} around {@code bundle}, through its CREATOR. */
    private static Parcelable fromBundle(Parcelable template, Bundle bundle) throws ReflectiveOperationException {
        Parcelable.Creator<?> creator =
                (Parcelable.Creator<?>) template.getClass().getField("CREATOR").get(null);
        Parcel parcel = Parcel.obtain();
        try {
            parcel.writeBundle(bundle);
            parcel.setDataPosition(0);
            return (Parcelable) creator.createFromParcel(parcel);
        } finally {
            parcel.recycle();
        }
    }
}
