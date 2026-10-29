package app.kyurem39.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.net.Uri;
import android.os.Environment;
import android.provider.OpenableColumns;
import android.util.Log;

import org.json.JSONArray;

import java.io.ByteArrayOutputStream;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Translates the subtitles of the videos the app plays into the language chosen in the patch
 * settings.
 *
 * <p>Subtitles come from two places: files next to the video, which the app loads through
 * {@code SubtitleOps} and the manual picker in {@code PlayerViewModel}, and subtitle tracks embedded
 * in the video file itself. Both end up here. A translated copy is written to the app cache and
 * added as a separate mpv track, so the original subtitle remains available.
 *
 * <p>This class is written in Java because the app's Kotlin runtime was shrunk by R8 and must not be
 * used by extension code. It only uses framework APIs, plus {@code org.json}, which is part of
 * Android.
 */
public final class MorpheSubtitles {
    private static final String TAG = "MorpheSubtitles";
    private static final String ENDPOINT =
        "https://translate.googleapis.com/translate_a/single";
    private static final int MAX_BATCH_CHARS = 3000;
    private static final String MARKER = "@@@";
    private static final int MAX_CUE_MILLIS = 10000;
    private static final int UNKNOWN_CUE_MILLIS = 3000;

    // Matroska (EBML) element ids used by the built-in subtitle reader.
    private static final long MKV_EBML = 0x1A45DFA3L;
    private static final long MKV_SEGMENT = 0x18538067L;
    private static final long MKV_SEEK_HEAD = 0x114D9B74L;
    private static final long MKV_INFO = 0x1549A966L;
    private static final long MKV_TIMESTAMP_SCALE = 0x2AD7B1L;
    private static final long MKV_TRACKS = 0x1654AE6BL;
    private static final long MKV_TRACK_ENTRY = 0xAEL;
    private static final long MKV_TRACK_NUMBER = 0xD7L;
    private static final long MKV_TRACK_TYPE = 0x83L;
    private static final long MKV_CODEC_ID = 0x86L;
    private static final long MKV_CLUSTER = 0x1F43B675L;
    private static final long MKV_TIMESTAMP = 0xE7L;
    private static final long MKV_SIMPLE_BLOCK = 0xA3L;
    private static final long MKV_BLOCK_GROUP = 0xA0L;
    private static final long MKV_BLOCK = 0xA1L;
    private static final long MKV_BLOCK_DURATION = 0x9BL;
    private static final long MKV_CUES = 0x1C53BB6BL;
    private static final long MKV_CHAPTERS = 0x1043A770L;
    private static final long MKV_ATTACHMENTS = 0x1941A469L;
    private static final long MKV_TAGS = 0x1254C367L;

    private static final String[] CODES = {
        "vi", "en", "ja", "ko", "zh-CN", "zh-TW", "th", "id", "ms", "fil",
        "hi", "es", "fr", "de", "pt", "ru", "ar", "it", "tr",
    };

    private static final String[] ENGLISH_NAMES = {
        "Vietnamese", "English", "Japanese", "Korean",
        "Chinese (Simplified)", "Chinese (Traditional)", "Thai", "Indonesian",
        "Malay", "Filipino", "Hindi", "Spanish", "French", "German",
        "Portuguese", "Russian", "Arabic", "Italian", "Turkish",
    };

    private static final String[] VIETNAMESE_NAMES = {
        "Tiếng Việt", "Tiếng Anh", "Tiếng Nhật", "Tiếng Hàn",
        "Tiếng Trung (Giản thể)", "Tiếng Trung (Phồn thể)", "Tiếng Thái",
        "Tiếng Indonesia", "Tiếng Mã Lai", "Tiếng Philippines", "Tiếng Hindi",
        "Tiếng Tây Ban Nha", "Tiếng Pháp", "Tiếng Đức", "Tiếng Bồ Đào Nha",
        "Tiếng Nga", "Tiếng Ả Rập", "Tiếng Ý", "Tiếng Thổ Nhĩ Kỳ",
    };

    private static final Pattern MICRO_DVD_LINE =
        Pattern.compile("^(\\{\\d+\\}\\{\\d+\\})(.*)$");
    private static final Pattern MARKER_SPLIT = Pattern.compile("\\s*@@@\\s*");

    private static final Set<String> RUNNING =
        Collections.synchronizedSet(new HashSet<String>());

    /**
     * Videos whose translation was already started recently, keyed by file or URI and target
     * language. The app reports a loaded file more than once (the player observer and the subtitle
     * loader both run), and only one of those calls must add the translated track.
     */
    private static final Map<String, Long> CLAIMED = new HashMap<String, Long>();
    private static final long CLAIM_MILLIS = 10000;

    /** {@code MPV_EVENT_FILE_LOADED} from {@code mpv/event.h}. */
    private static final int MPV_EVENT_FILE_LOADED = 8;

    /**
     * Time the app gets to pick its own subtitle track after a file is loaded. The app selects the
     * track from a coroutine, up to a second after the file-loaded event, so the patch has to wait
     * for it; otherwise its own selection would be replaced.
     */
    private static final long FILE_SELECT_DELAY_MILLIS = 2000;

    /** Time the player gets to drop the translated track after the switch is turned off. */
    private static final long TOGGLE_SELECT_DELAY_MILLIS = 250;

    /** Guards the deferred selection so that only the most recent request can run. */
    private static final Object SELECT_LOCK = new Object();
    private static long selectGeneration;

    private MorpheSubtitles() {}

    public static String[] languageCodes() {
        return CODES.clone();
    }

    public static String[] languageNames(boolean vietnamese) {
        return (vietnamese ? VIETNAMESE_NAMES : ENGLISH_NAMES).clone();
    }

    public static String displayName(String code, boolean vietnamese) {
        if (code != null) {
            for (int index = 0; index < CODES.length; index++) {
                if (CODES[index].equalsIgnoreCase(code)) {
                    return (vietnamese ? VIETNAMESE_NAMES : ENGLISH_NAMES)[index];
                }
            }
        }
        return code == null ? "" : code;
    }

    /**
     * Called for every mpv event, before the app handles it.
     *
     * <p>This is the only call site that runs for every video the player opens. The app's subtitle
     * loader cannot be used for that: the file browser opens videos through a content URI, which the
     * player turns into an {@code fd://} descriptor, and the loader skips those because they have no
     * parent directory. The event is delivered on mpv's own thread, so the work started here is
     * asynchronous.
     */
    public static void onPlayerEvent(Object observer, int eventId) {
        if (eventId != MPV_EVENT_FILE_LOADED) return;

        try {
            Context context = appContext();
            if (context == null) return;

            Activity activity = observerActivity(observer);
            if (activity == null) return;

            Uri uri = intentUri(activity);
            if (uri == null) return;

            // With translation off the patch only makes sure the video's own subtitle track is
            // selected, exactly as it would be without the patch. The app picks its own track
            // later, so the selection is deferred until it is done.
            if (!MorphePrefs.isSubtitleTranslationEnabled(context)) {
                selectEmbeddedSubtitleLater(activity, FILE_SELECT_DELAY_MILLIS);
                return;
            }

            String name = queryDisplayName(context, uri);
            if (name == null || name.isEmpty()) name = uri.getLastPathSegment();
            if (name == null || name.isEmpty()) name = "video";

            File video = videoFile(context, uri);
            if (video != null) {
                translateForVideo(context, video, name, activity);
            } else {
                // No filesystem path (for example a document provider URI): read the embedded
                // subtitle track straight from the URI.
                translateEmbedded(context, uri.toString(), uri, name, activity);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Could not start subtitle translation for the loaded file", failure);
        }
    }

    /**
     * Selects the video's own subtitle track, as if the patch were not installed.
     *
     * <p>Only tracks embedded in the video are considered. When several exist the default one is
     * preferred, otherwise the first. Nothing is written when the video has no embedded subtitle,
     * when the player is not running, or when the track is selected already.
     */
    public static void selectEmbeddedSubtitle(Activity owner) {
        if (!playerReady(owner)) return;

        try {
            Object instance = mpvInstance();
            Method getString = mpvMethod("getPropertyString", String.class);
            Method getInt = mpvMethod("getPropertyInt", String.class);
            Method getBoolean = mpvMethod("getPropertyBoolean", String.class);

            int count = trackCount();
            int selected = -1;
            int first = -1;

            for (int index = 0; index < count; index++) {
                Object type = getString.invoke(instance, "track-list/" + index + "/type");
                if (!"sub".equals(type)) continue;

                Object external = getBoolean.invoke(
                    instance,
                    "track-list/" + index + "/external"
                );
                if (Boolean.TRUE.equals(external)) continue;

                Object id = getInt.invoke(instance, "track-list/" + index + "/id");
                if (!(id instanceof Integer) || (Integer) id <= 0) continue;

                if (first < 0) first = (Integer) id;

                Object isDefault = getBoolean.invoke(
                    instance,
                    "track-list/" + index + "/default"
                );
                if (Boolean.TRUE.equals(isDefault)) {
                    selected = (Integer) id;
                    break;
                }
            }

            if (selected < 0) selected = first;
            if (selected < 0) return;

            // The app may have picked this track on its own already.
            if (selectedSidId() == selected) return;

            mpvMethod("setPropertyInt", String.class, int.class).invoke(
                instance,
                "sid",
                selected
            );
            mpvMethod("setPropertyBoolean", String.class, boolean.class).invoke(
                instance,
                "sub-visibility",
                true
            );
            Log.d(TAG, "Selected embedded subtitle track " + selected);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not select the embedded subtitle track", failure);
        }
    }

    /**
     * Selects the embedded subtitle off the calling thread, once the player has settled.
     *
     * <p>Used when the switch is turned off during playback, where the app is not going to select
     * a track again.
     */
    public static void selectEmbeddedSubtitleLater(Activity owner) {
        selectEmbeddedSubtitleLater(owner, TOGGLE_SELECT_DELAY_MILLIS);
    }

    /**
     * Selects the embedded subtitle after {@code delayMillis}.
     *
     * <p>The switch is read again when the delay is over: it may have been turned back on, and
     * then the translation path owns the track selection. A newer request cancels an older one, so
     * one file load selects once. Nothing is written when the player has been left in the meantime.
     */
    private static void selectEmbeddedSubtitleLater(final Activity owner, final long delayMillis) {
        final Context context = appContext();
        if (context == null) return;

        final long generation;
        synchronized (SELECT_LOCK) {
            generation = ++selectGeneration;
        }

        new Thread(
            new Runnable() {
                @Override
                public void run() {
                    sleep(delayMillis);

                    synchronized (SELECT_LOCK) {
                        if (generation != selectGeneration) return;
                    }
                    if (MorphePrefs.isSubtitleTranslationEnabled(context)) return;

                    selectEmbeddedSubtitle(owner);
                }
            },
            "MorpheSubtitleSelect"
        ).start();
    }

    /**
     * Whether the app's player is running, so that mpv may be called.
     *
     * <p>The settings sheet can be opened from a screen that has no player, and the player may
     * already be closing. Calling into mpv then crashes the process instead of throwing.
     */
    private static boolean playerReady(Activity owner) {
        Activity activity = owner == null ? MorpheHook.currentActivity() : owner;
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;

        try {
            Class<?> player = Class.forName(
                "app.marlboroadvance.mpvex.ui.player.PlayerActivity"
            );
            if (!player.isInstance(activity)) return false;
            return player.getField("mpvInitialized").getBoolean(activity);
        } catch (Throwable failure) {
            return false;
        }
    }

    /** Called before the app's automatic local-subtitle scan. */
    public static void onAutoload(String videoFilePath, String videoFileName) {
        try {
            Context context = appContext();
            if (context == null || !MorphePrefs.isSubtitleTranslationEnabled(context)) return;
            if (videoFilePath == null || videoFileName == null) return;
            if (videoFilePath.startsWith("content://") || videoFilePath.startsWith("fd://")) {
                return;
            }

            translateForVideo(context, new File(videoFilePath), videoFileName, MorpheHook.currentActivity());
        } catch (Throwable failure) {
            Log.w(TAG, "Could not start automatic subtitle translation", failure);
        }
    }

    /**
     * Translates the subtitle file next to {@code video}, or the subtitle track embedded in it when
     * there is no separate file.
     */
    private static void translateForVideo(
        Context context,
        File video,
        String videoFileName,
        Activity owner
    ) {
        if (video == null || !video.isFile()) return;

        String target = MorphePrefs.subtitleTargetLanguage(context);
        if (!claim(video.getAbsolutePath() + "|" + target)) return;

        File directory = video.getParentFile();
        if (directory == null) return;

        String baseName = videoFileName == null ? video.getName() : videoFileName;
        int dot = baseName.lastIndexOf('.');
        if (dot > 0) baseName = baseName.substring(0, dot);
        String base = baseName.toLowerCase(Locale.ROOT);

        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (!file.isFile() || !isTranslatable(file.getName())) continue;
                String name = file.getName();
                int nameDot = name.lastIndexOf('.');
                String stem = nameDot > 0 ? name.substring(0, nameDot) : name;
                if (!stem.toLowerCase(Locale.ROOT).startsWith(base)) continue;

                translateFile(context, file, name, owner);
                return;
            }
        }

        // No separate subtitle file sits next to the video, so its subtitles may be embedded.
        translateEmbedded(context, video.getAbsolutePath(), video, videoFileName, owner);
    }

    /**
     * Marks a video as handled for this session and target. Returns {@code false} when another call
     * claimed it moments ago.
     */
    private static boolean claim(String key) {
        long now = System.currentTimeMillis();
        synchronized (CLAIMED) {
            Long last = CLAIMED.get(key);
            if (last != null && now - last < CLAIM_MILLIS) return false;

            CLAIMED.put(key, now);
            if (CLAIMED.size() > 64) {
                for (Iterator<Map.Entry<String, Long>> iterator = CLAIMED.entrySet().iterator();
                    iterator.hasNext(); ) {
                    if (now - iterator.next().getValue() > CLAIM_MILLIS) iterator.remove();
                }
            }
            return true;
        }
    }

    /** The activity that reported the mpv event. */
    private static Activity observerActivity(Object observer) {
        if (observer != null) {
            try {
                java.lang.reflect.Field field = observer.getClass().getDeclaredField("activity");
                field.setAccessible(true);
                Object value = field.get(observer);
                if (value instanceof Activity) return (Activity) value;
            } catch (Throwable ignored) {
                // Fall back to the activity the app currently shows.
            }
        }
        return MorpheHook.currentActivity();
    }

    /** The media URI the player was started with. */
    private static Uri intentUri(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null) return null;

        Uri data = intent.getData();
        if (data != null) return data;

        String extra = intent.getStringExtra("uri");
        return extra == null || extra.isEmpty() ? null : Uri.parse(extra);
    }

    /**
     * Filesystem file of a media URI, or {@code null} when it cannot be resolved.
     *
     * <p>The app itself resolves content URIs this way for its playback history: the data column of
     * the media store, then the relative path and display name.
     */
    private static File videoFile(Context context, Uri uri) {
        String scheme = uri.getScheme();
        if (scheme == null) return null;

        if ("file".equalsIgnoreCase(scheme)) {
            String path = uri.getPath();
            return path == null ? null : new File(path);
        }
        if (!"content".equalsIgnoreCase(scheme)) return null;

        String path = queryColumn(context, uri, "_data");
        if (path == null || path.isEmpty()) {
            String relative = queryColumn(context, uri, "relative_path");
            String name = queryColumn(context, uri, "display_name");
            if (relative == null || name == null) return null;
            path = Environment.getExternalStorageDirectory().getAbsolutePath()
                + "/" + relative + name;
        }

        File file = new File(path);
        return file.isFile() ? file : null;
    }

    /** One string column of a content URI, or {@code null} when it is unavailable. */
    private static String queryColumn(Context context, Uri uri, String column) {
        try (Cursor cursor = context.getContentResolver().query(
            uri,
            new String[] {column},
            null,
            null,
            null
        )) {
            if (cursor == null || !cursor.moveToFirst()) return null;

            int index = cursor.getColumnIndex(column);
            return index < 0 ? null : cursor.getString(index);
        } catch (Throwable failure) {
            return null;
        }
    }

    /** Called before the app adds a subtitle chosen by the user. */
    public static void onSubtitleUri(Uri uri) {
        try {
            Context context = appContext();
            if (context == null || uri == null) return;
            if (!MorphePrefs.isSubtitleTranslationEnabled(context)) return;

            String scheme = uri.getScheme();
            Activity owner = MorpheHook.currentActivity();
            if (scheme == null || "file".equalsIgnoreCase(scheme)) {
                String path = uri.getPath();
                if (path == null) return;
                File file = new File(path);
                if (isTranslatable(file.getName())) {
                    translateFile(context, file, file.getName(), owner);
                }
            } else if ("content".equalsIgnoreCase(scheme)) {
                String name = queryDisplayName(context, uri);
                if (name == null || !isTranslatable(name)) return;
                translateContent(context, uri, name, owner);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Could not start subtitle translation", failure);
        }
    }

    private static void translateFile(
        final Context context,
        final File source,
        final String displayName,
        final Activity owner
    ) {
        if (!source.isFile() || source.length() == 0) return;

        final String target = MorphePrefs.subtitleTargetLanguage(context);
        final String key = source.getAbsolutePath() + "|" + target;
        final File cache = cacheFile(context, key, displayName, target);
        if (cache == null) return;

        if (cache.isFile() && cache.length() > 0 && cache.lastModified() >= source.lastModified()) {
            addTrackLater(context, cache, displayName, target, owner);
            return;
        }

        if (!RUNNING.add(key)) return;

        new Thread(
            new Runnable() {
                @Override
                public void run() {
                    try {
                        String text = readText(source);
                        Translation translation =
                            translateText(text, target, extensionOf(displayName));
                        if (translation == null) return;
                        if (sameLanguage(translation.detected, target) || !translation.changed) {
                            Log.i(TAG, "Subtitle already in " + target + ": " + source);
                            return;
                        }
                        writeText(cache, translation.text);
                        addTrack(context, cache, displayName, target, owner);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Could not translate " + source, failure);
                    } finally {
                        RUNNING.remove(key);
                    }
                }
            },
            "MorpheSubtitleTranslation"
        ).start();
    }

    private static void translateContent(
        final Context context,
        final Uri uri,
        final String displayName,
        final Activity owner
    ) {
        final String target = MorphePrefs.subtitleTargetLanguage(context);
        final String key = uri.toString() + "|" + target;
        final File cache = cacheFile(context, key, displayName, target);
        if (cache == null) return;

        if (cache.isFile() && cache.length() > 0) {
            addTrackLater(context, cache, displayName, target, owner);
            return;
        }

        if (!RUNNING.add(key)) return;

        new Thread(
            new Runnable() {
                @Override
                public void run() {
                    try {
                        String text = readText(context, uri);
                        Translation translation =
                            translateText(text, target, extensionOf(displayName));
                        if (translation == null) return;
                        if (sameLanguage(translation.detected, target) || !translation.changed) {
                            Log.i(TAG, "Subtitle already in " + target + ": " + uri);
                            return;
                        }
                        writeText(cache, translation.text);
                        addTrack(context, cache, displayName, target, owner);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Could not translate " + uri, failure);
                    } finally {
                        RUNNING.remove(key);
                    }
                }
            },
            "MorpheSubtitleTranslation"
        ).start();
    }

    /**
     * Translates the text subtitle track embedded in a video, when it has one.
     *
     * <p>The container is read with {@link MediaExtractor}, which is the platform demuxer and
     * understands the formats mpvEx plays, so no per-container parsing is needed. The cues are
     * written as SRT and then translated, which is the same path an external file takes.
     *
     * @param identity stable key of the video, used for the cache file name
     * @param source the video as a {@link File} or as a {@link Uri}
     */
    private static void translateEmbedded(
        final Context context,
        final String identity,
        final Object source,
        final String videoName,
        final Activity owner
    ) {
        if (source == null) return;
        if (source instanceof File) {
            File file = (File) source;
            if (!file.isFile() || file.length() == 0) return;
        }

        final String target = MorphePrefs.subtitleTargetLanguage(context);
        final String key = identity + "|embedded|" + target;

        String base = videoName == null || videoName.isEmpty() ? "video" : videoName;
        int dot = base.lastIndexOf('.');
        if (dot > 0) base = base.substring(0, dot);

        final File cache = cacheFile(context, key, base + ".embedded.srt", target);
        if (cache == null) return;

        final String displayName = base + " (embedded)";
        final long stamp = source instanceof File ? ((File) source).lastModified() : 0L;

        if (cache.isFile() && cache.length() > 0 && (stamp == 0L || cache.lastModified() >= stamp)) {
            addTrackLater(context, cache, displayName, target, owner);
            return;
        }

        if (!RUNNING.add(key)) return;

        new Thread(
            new Runnable() {
                @Override
                public void run() {
                    try {
                        String text = extractEmbedded(context, source);
                        if (text == null) return;

                        Translation translation = translateText(text, target, "srt");
                        if (translation == null) return;
                        if (sameLanguage(translation.detected, target) || !translation.changed) {
                            Log.i(TAG, "Embedded subtitles already in " + target + ": " + identity);
                            return;
                        }
                        writeText(cache, translation.text);
                        addTrack(context, cache, displayName, target, owner);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Could not translate embedded subtitles of " + identity, failure);
                    } finally {
                        RUNNING.remove(key);
                    }
                }
            },
            "MorpheEmbeddedTranslation"
        ).start();
    }

    /**
     * Reads the embedded subtitle track the player is using and returns it as SRT, or {@code null}
     * when the video has no text subtitle track.
     *
     * <p>{@link MediaExtractor} is tried first because it is the platform demuxer. Some devices do
     * not expose Matroska subtitle tracks through it (they report only the video and audio tracks),
     * so Matroska files fall back to a small built-in reader.
     */
    private static String extractEmbedded(Context context, Object source) {
        String text = extractWithMediaExtractor(context, source);
        if (text != null) return text;
        if (source instanceof File) return extractMkv((File) source);
        return null;
    }

    /** Reads the selected embedded subtitle track through {@link MediaExtractor}. */
    private static String extractWithMediaExtractor(Context context, Object source) {
        MediaExtractor extractor = new MediaExtractor();
        try {
            if (source instanceof File) {
                extractor.setDataSource(((File) source).getAbsolutePath());
            } else {
                extractor.setDataSource(context, (Uri) source, null);
            }

            List<Integer> subtitleTracks = new ArrayList<Integer>();
            List<String> kinds = new ArrayList<String>();
            StringBuilder mimes = new StringBuilder();
            for (int index = 0; index < extractor.getTrackCount(); index++) {
                String mime = extractor.getTrackFormat(index).getString(MediaFormat.KEY_MIME);
                mimes.append(index).append('=').append(mime).append(' ');
                if (!isSubtitleMime(mime)) continue;
                subtitleTracks.add(index);
                kinds.add(embeddedKind(mime));
            }
            Log.i(TAG, "Embedded tracks in " + label(source) + ": " + mimes);

            int chosen = -1;
            int wanted = selectedEmbeddedPosition();
            if (wanted >= 0 && wanted < subtitleTracks.size() && kinds.get(wanted) != null) {
                chosen = wanted;
            } else {
                for (int position = 0; position < subtitleTracks.size(); position++) {
                    if (kinds.get(position) == null) continue;
                    chosen = position;
                    break;
                }
            }

            if (chosen < 0) {
                Log.i(TAG, "No embedded text subtitle in " + label(source));
                return null;
            }

            String kind = kinds.get(chosen);
            extractor.selectTrack(subtitleTracks.get(chosen));

            List<TimedText> cues = new ArrayList<TimedText>();
            ByteBuffer buffer = ByteBuffer.allocate(1024 * 1024);
            while (true) {
                buffer.clear();
                int size = extractor.readSampleData(buffer, 0);
                if (size < 0) break;

                long time = extractor.getSampleTime();
                byte[] data = new byte[size];
                buffer.position(0);
                buffer.get(data, 0, size);

                addCue(cues, embeddedText(data, kind), time / 1000);
                if (!extractor.advance()) break;
            }

            Log.i(
                TAG,
                "Read " + cues.size() + " embedded subtitle cue(s) from " + label(source)
                    + " (" + kind + ")"
            );
            return cues.isEmpty() ? null : toSrt(cues);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not read embedded subtitles from " + label(source), failure);
            return null;
        } finally {
            extractor.release();
        }
    }

    /**
     * Reads the selected text subtitle track of a Matroska file.
     *
     * <p>Some devices report only the video and audio tracks of a Matroska file through
     * {@link MediaExtractor}, so the container is read directly here. Only the parts needed for
     * subtitles are parsed: the track list, the timestamp scale and the subtitle blocks.
     */
    private static String extractMkv(File file) {
        MkvParser parser = new MkvParser(selectedEmbeddedPosition());
        try {
            parser.parse(file);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not read Matroska subtitles of " + file.getName(), failure);
        }

        Log.i(
            TAG,
            "Read " + parser.cues.size() + " Matroska subtitle cue(s) from " + file.getName()
        );
        return parser.cues.isEmpty() ? null : toSrt(parser.cues);
    }

    /** Minimal Matroska reader that only collects one text subtitle track. */
    private static final class MkvParser {
        private final int wanted;
        final List<TimedText> cues = new ArrayList<TimedText>();

        private final List<Long> numbers = new ArrayList<Long>();
        private final List<String> kinds = new ArrayList<String>();
        private long scale = 1000000L;
        private long clusterMillis;
        private long pendingId = -1L;
        private long pendingSize = -1L;
        private long target = -1;
        private String targetKind;

        MkvParser(int wanted) {
            this.wanted = wanted;
        }

        void parse(File file) throws IOException {
            try (InputStream input = new BufferedInputStream(new FileInputStream(file), 65536)) {
                MkvReader reader = new MkvReader(input);

                long id = reader.readId();
                long size = reader.readSize();
                if (id != MKV_EBML || size < 0) return;
                reader.skipTo(reader.position + size);

                while (true) {
                    id = reader.readId();
                    if (id < 0) break;

                    size = reader.readSize();
                    if (id == MKV_SEGMENT) {
                        segment(reader, size < 0 ? Long.MAX_VALUE : reader.position + size);
                        break;
                    }
                    if (size < 0) break;
                    reader.skipTo(reader.position + size);
                }
            }
        }

        private void segment(MkvReader reader, long end) throws IOException {
            while (reader.position < end) {
                long id = pendingId >= 0 ? pendingId : reader.readId();
                long size = pendingId >= 0 ? pendingSize : reader.readSize();
                pendingId = -1L;
                pendingSize = -1L;
                if (id < 0) return;

                if (id == MKV_CLUSTER) {
                    cluster(reader, size);
                    continue;
                }
                if (size < 0) return;

                long dataEnd = reader.position + size;
                if (id == MKV_INFO) {
                    info(reader, dataEnd);
                } else if (id == MKV_TRACKS) {
                    tracks(reader, dataEnd);
                }
                reader.skipTo(dataEnd);
            }
        }

        private void info(MkvReader reader, long end) throws IOException {
            while (reader.position < end) {
                long id = reader.readId();
                long size = reader.readSize();
                if (id < 0 || size < 0) return;

                long dataEnd = reader.position + size;
                if (id == MKV_TIMESTAMP_SCALE) scale = reader.readUnsigned(size);
                reader.skipTo(dataEnd);
            }
        }

        private void tracks(MkvReader reader, long end) throws IOException {
            while (reader.position < end) {
                long id = reader.readId();
                long size = reader.readSize();
                if (id < 0 || size < 0) return;

                long dataEnd = reader.position + size;
                if (id == MKV_TRACK_ENTRY) entry(reader, dataEnd);
                reader.skipTo(dataEnd);
            }
        }

        private void entry(MkvReader reader, long end) throws IOException {
            long number = -1;
            long type = -1;
            String codec = null;

            while (reader.position < end) {
                long id = reader.readId();
                long size = reader.readSize();
                if (id < 0 || size < 0) return;

                long dataEnd = reader.position + size;
                if (id == MKV_TRACK_NUMBER) {
                    number = reader.readUnsigned(size);
                } else if (id == MKV_TRACK_TYPE) {
                    type = reader.readUnsigned(size);
                } else if (id == MKV_CODEC_ID) {
                    codec = reader.readString((int) size);
                }
                reader.skipTo(dataEnd);
            }

            if (type != 0x11 || number < 0) return;

            String kind = mkvKind(codec);
            if (kind == null) return;

            numbers.add(number);
            kinds.add(kind);
        }

        private void cluster(MkvReader reader, long size) throws IOException {
            long end = size < 0 ? Long.MAX_VALUE : reader.position + size;
            clusterMillis = 0L;

            while (reader.position < end) {
                long id = reader.readId();
                if (id < 0) return;

                long childSize = reader.readSize();
                if (isTopLevel(id)) {
                    pendingId = id;
                    pendingSize = childSize;
                    return;
                }
                if (childSize < 0) return;

                long dataEnd = reader.position + childSize;
                if (id == MKV_TIMESTAMP) {
                    clusterMillis = millis(reader.readUnsigned(childSize));
                } else if (id == MKV_SIMPLE_BLOCK) {
                    TimedText cue = block(reader, childSize);
                    if (cue != null) cues.add(cue);
                } else if (id == MKV_BLOCK_GROUP) {
                    group(reader, dataEnd);
                }
                reader.skipTo(dataEnd);
            }
        }

        private void group(MkvReader reader, long end) throws IOException {
            TimedText cue = null;
            long duration = -1;

            while (reader.position < end) {
                long id = reader.readId();
                long size = reader.readSize();
                if (id < 0 || size < 0) return;

                long dataEnd = reader.position + size;
                if (id == MKV_BLOCK) {
                    cue = block(reader, size);
                } else if (id == MKV_BLOCK_DURATION) {
                    duration = millis(reader.readUnsigned(size));
                }
                reader.skipTo(dataEnd);
            }

            if (cue == null) return;
            cues.add(
                duration > 0 ? new TimedText(cue.start, cue.start + duration, cue.text) : cue
            );
        }

        /** One subtitle block, or {@code null} when it belongs to another track. */
        private TimedText block(MkvReader reader, long size) throws IOException {
            long end = reader.position + size;
            long track = reader.readVint();
            int high = reader.read();
            int low = reader.read();
            reader.read(); // flags
            if (track < 0 || high < 0 || low < 0) return null;

            long start = clusterMillis + millis((short) ((high << 8) | low));

            int length = (int) Math.max(0, Math.min(end - reader.position, Integer.MAX_VALUE));
            byte[] payload = new byte[length];
            if (length > 0) reader.readFully(payload, 0, length);

            if (target < 0) resolveTarget();
            if (target < 0 || track != target) return null;

            String text = blockText(payload, targetKind);
            return text == null || text.isEmpty() ? null : new TimedText(start, -1, text);
        }

        private void resolveTarget() {
            if (numbers.isEmpty()) return;

            int position = wanted >= 0 && wanted < numbers.size() ? wanted : 0;
            target = numbers.get(position).longValue();
            targetKind = kinds.get(position);
        }

        private String blockText(byte[] payload, String kind) {
            if (payload.length == 0) return null;

            String text = decode(payload);
            if ("ass".equals(kind)) {
                // ReadOrder, Layer, Style, Name, MarginL, MarginR, MarginV, Effect, Text
                String[] fields = text.split(",", 9);
                text = fields.length == 9 ? fields[8] : text;
            } else if ("vtt".equals(kind)) {
                text = text.replaceAll("<[^>]*>", "");
            }
            return cleanCueText(text);
        }

        private long millis(long ticks) {
            return Math.round(ticks * scale / 1000000.0);
        }

        private boolean isTopLevel(long id) {
            return id == MKV_CLUSTER
                || id == MKV_TRACKS
                || id == MKV_INFO
                || id == MKV_SEEK_HEAD
                || id == MKV_CUES
                || id == MKV_CHAPTERS
                || id == MKV_ATTACHMENTS
                || id == MKV_TAGS;
        }
    }

    /** Subtitle kind of a Matroska codec id, or {@code null} when its text cannot be read. */
    private static String mkvKind(String codec) {
        if (codec == null) return null;
        if (codec.contains("UTF8")) return "srt";
        if (codec.contains("ASS") || codec.contains("SSA")) return "ass";
        if (codec.contains("WEBVTT") || codec.contains("VTT")) return "vtt";
        return null;
    }

    /** Byte reader with the EBML variable-length integers Matroska uses. */
    private static final class MkvReader {
        private final InputStream input;
        long position;

        MkvReader(InputStream input) {
            this.input = input;
        }

        int read() throws IOException {
            int value = input.read();
            if (value >= 0) position++;
            return value;
        }

        /** Element id, or -1 at the end of the file. */
        long readId() throws IOException {
            int first = read();
            if (first < 0) return -1;

            int length = 1;
            for (int mask = 0x80; mask > 0x08 && (first & mask) == 0; mask >>= 1) length++;

            long value = first;
            for (int index = 1; index < length; index++) {
                int next = read();
                if (next < 0) return -1;
                value = (value << 8) | next;
            }
            return value;
        }

        /** Element size, or -1 when it is unknown or the file ended. */
        long readSize() throws IOException {
            int first = read();
            if (first < 0) return -1;

            int mask = 0x80;
            int length = 1;
            while (length < 8 && (first & mask) == 0) {
                mask >>= 1;
                length++;
            }

            long value = first & (mask - 1);
            boolean unknown = value == mask - 1;
            for (int index = 1; index < length; index++) {
                int next = read();
                if (next < 0) return -1;
                value = (value << 8) | next;
                if (next != 0xFF) unknown = false;
            }
            return unknown ? -1 : value;
        }

        /** Variable-length integer without the unknown-size meaning. */
        long readVint() throws IOException {
            int first = read();
            if (first < 0) return -1;

            int mask = 0x80;
            int length = 1;
            while (length < 8 && (first & mask) == 0) {
                mask >>= 1;
                length++;
            }

            long value = first & (mask - 1);
            for (int index = 1; index < length; index++) {
                int next = read();
                if (next < 0) return -1;
                value = (value << 8) | next;
            }
            return value;
        }

        long readUnsigned(long size) throws IOException {
            long value = 0;
            for (long index = 0; index < size; index++) {
                int next = read();
                if (next < 0) return value;
                value = (value << 8) | next;
            }
            return value;
        }

        String readString(int size) throws IOException {
            byte[] data = new byte[Math.max(0, size)];
            readFully(data, 0, data.length);

            int length = data.length;
            while (length > 0 && data[length - 1] == 0) length--;
            return new String(data, 0, length, StandardCharsets.UTF_8);
        }

        void readFully(byte[] target, int offset, int length) throws IOException {
            int done = 0;
            while (done < length) {
                int count = input.read(target, offset + done, length - done);
                if (count < 0) break;
                done += count;
                position += count;
            }
        }

        void skipTo(long target) throws IOException {
            while (position < target) {
                long skipped = input.skip(target - position);
                if (skipped > 0) {
                    position += skipped;
                } else if (read() < 0) {
                    position = target;
                    return;
                }
            }
        }
    }

    /** Short name of a video source, for log messages. */
    private static String label(Object source) {
        if (source instanceof File) return ((File) source).getName();
        if (source instanceof Uri) {
            String name = ((Uri) source).getLastPathSegment();
            return name == null ? source.toString() : name;
        }
        return String.valueOf(source);
    }

    /**
     * Turns one subtitle sample into a cue. Samples usually carry the text only, with the timing in
     * the container, but SSA dialogue lines and WebVTT cues can carry their own timing.
     */
    private static void addCue(List<TimedText> cues, String raw, long containerMillis) {
        if (raw == null) return;

        String text = raw.replace("\r\n", "\n").replace('\r', '\n').trim();
        if (text.isEmpty()) return;

        int arrow = text.indexOf("-->");
        if (arrow > 0) {
            int lineStart = text.lastIndexOf('\n', arrow - 1) + 1;
            int lineEnd = text.indexOf('\n', arrow);
            String timing = text.substring(lineStart, lineEnd < 0 ? text.length() : lineEnd);
            String[] bounds = timing.split("-->");
            long start = bounds.length == 2 ? parseTimecode(bounds[0]) : -1;
            long end = bounds.length == 2 ? parseTimecode(bounds[1]) : -1;
            if (start >= 0) {
                String body = lineEnd < 0 ? "" : text.substring(lineEnd + 1);
                cues.add(new TimedText(start, end, cleanCueText(body)));
                return;
            }
        }

        if (text.regionMatches(true, 0, "Dialogue:", 0, 9)) {
            // Dialogue: layer,start,end,style,name,marginL,marginR,marginV,effect,text
            String[] fields = text.split(",", 10);
            if (fields.length == 10) {
                long start = parseTimecode(fields[1]);
                long end = parseTimecode(fields[2]);
                if (start >= 0) {
                    cues.add(new TimedText(start, end, cleanCueText(fields[9])));
                    return;
                }
            }
        }

        cues.add(new TimedText(containerMillis, -1, cleanCueText(text)));
    }

    /** Text of one sample, without the format's own framing. */
    private static String embeddedText(byte[] data, String kind) {
        if (data == null || data.length == 0) return null;

        if ("tx3g".equals(kind)) {
            // 3GPP timed text: a two byte length followed by the UTF-8 text.
            if (data.length < 2) return null;
            int length = ((data[0] & 0xFF) << 8) | (data[1] & 0xFF);
            if (length <= 0 || length > data.length - 2) length = data.length - 2;
            return new String(data, 2, length, StandardCharsets.UTF_8);
        }

        return decode(data);
    }

    /** Removes SSA override tags and turns their line breaks into real ones. */
    private static String cleanCueText(String text) {
        return text.replaceAll("\\{[^}]*\\}", "")
            .replace("\\N", "\n")
            .replace("\\n", "\n")
            .trim();
    }

    /** Writes the cues as SRT, the format the translation path understands. */
    private static String toSrt(List<TimedText> cues) {
        Collections.sort(
            cues,
            new Comparator<TimedText>() {
                @Override
                public int compare(TimedText left, TimedText right) {
                    if (left.start < right.start) return -1;
                    return left.start == right.start ? 0 : 1;
                }
            }
        );

        StringBuilder out = new StringBuilder();
        for (int index = 0; index < cues.size(); index++) {
            TimedText cue = cues.get(index);

            long end = cue.end;
            if (end <= cue.start) {
                long next = index + 1 < cues.size() ? cues.get(index + 1).start : -1;
                end = next > cue.start
                    ? Math.min(next, cue.start + MAX_CUE_MILLIS)
                    : cue.start + UNKNOWN_CUE_MILLIS;
            }

            if (out.length() > 0) out.append('\n');
            out.append(index + 1).append('\n');
            out.append(srtTimecode(cue.start)).append(" --> ").append(srtTimecode(end)).append('\n');
            out.append(cue.text).append('\n');
        }
        return out.toString();
    }

    private static String srtTimecode(long milliseconds) {
        long value = Math.max(0, milliseconds);
        long hours = value / 3600000;
        long minutes = (value % 3600000) / 60000;
        long seconds = (value % 60000) / 1000;
        return String.format(
            Locale.US,
            "%02d:%02d:%02d,%03d",
            hours,
            minutes,
            seconds,
            value % 1000
        );
    }

    /** Milliseconds of an SRT, WebVTT or SSA timecode, or -1 when it cannot be read. */
    private static long parseTimecode(String value) {
        String[] parts = value.trim().replace(',', '.').split(":");
        if (parts.length < 2) return -1;

        try {
            double seconds = Double.parseDouble(parts[parts.length - 1]);
            int minutes = Integer.parseInt(parts[parts.length - 2].trim());
            int hours = parts.length > 2 ? Integer.parseInt(parts[parts.length - 3].trim()) : 0;
            return Math.round(((hours * 60 + minutes) * 60 + seconds) * 1000);
        } catch (NumberFormatException invalid) {
            return -1;
        }
    }

    /** Subtitle kind of an embedded track, or {@code null} when its text cannot be read. */
    private static String embeddedKind(String mime) {
        if (mime == null) return null;

        String value = mime.toLowerCase(Locale.ROOT);
        if (value.contains("subrip") || value.contains("srt")) return "srt";
        if (value.contains("ssa") || value.contains("ass")) return "ass";
        if (value.contains("vtt")) return "vtt";
        if (value.contains("tx3g") || value.contains("3gpp") || value.contains("quicktime-text")) {
            return "tx3g";
        }
        return null;
    }

    private static boolean isSubtitleMime(String mime) {
        if (mime == null) return false;
        if (embeddedKind(mime) != null) return true;

        String value = mime.toLowerCase(Locale.ROOT);
        return value.contains("pgs")
            || value.contains("dvb")
            || value.contains("dvd")
            || value.contains("vobsub")
            || value.contains("subtitle");
    }

    /**
     * Position of the embedded subtitle track among the container's subtitle tracks, following the
     * track mpv selected. Falls back to the first one.
     */
    private static int selectedEmbeddedPosition() {
        int position = 0;
        int selected = selectedSidId();
        int count = trackCount();

        for (int index = 0; index < count; index++) {
            if (!"sub".equals(property("track-list/" + index + "/type"))) continue;
            if ("yes".equalsIgnoreCase(property("track-list/" + index + "/external"))) continue;

            Object id = propertyInt("track-list/" + index + "/id");
            if (selected > 0 && id instanceof Integer && (Integer) id == selected) return position;
            position++;
        }
        return 0;
    }

    /**
     * Adds the translated track on a background thread.
     *
     * <p>The track is added synchronously from the hook when the translation is already cached, and
     * the hook runs inside the app's own subtitle-loading coroutine. Selecting the track takes a
     * moment, and that must not delay the app's own subtitle commands.
     */
    private static void addTrackLater(
        final Context context,
        final File file,
        final String displayName,
        final String target,
        final Activity owner
    ) {
        new Thread(
            new Runnable() {
                @Override
                public void run() {
                    addTrack(context, file, displayName, target, owner);
                }
            },
            "MorpheSubtitleTrack"
        ).start();
    }

    private static void addTrack(
        Context context,
        File file,
        String sourceName,
        String target,
        Activity owner
    ) {
        if (file == null || !file.isFile() || file.length() == 0) return;

        // Translation can take a while. mpv must not be called once its player has been closed:
        // the native handle is gone by then.
        if (playerGone(owner)) {
            Log.i(TAG, "Player closed before " + sourceName + " could be translated");
            return;
        }

        String name = sourceName == null || sourceName.isEmpty() ? "Subtitle" : sourceName;
        String title = name + " [" + displayName(target, isVietnameseUi(context)) + "]";

        // The app reports a loaded file more than once, so the same track may already be there.
        int existing = findTrackId(title);
        if (existing > 0) {
            selectId(existing);
            return;
        }

        int translated = -1;
        try {
            Object instance = mpvInstance();
            Method command = mpvMethod("command", String[].class);
            int before = trackCount();
            command.invoke(
                instance,
                (Object) new String[] {"sub-add", file.getAbsolutePath(), "select", title}
            );
            translated = trackIdWithTitle(before, title);
            Log.i(
                TAG,
                "Added translated subtitle: " + file + " (" + target + "), track " + translated
            );
        } catch (Throwable failure) {
            Log.w(TAG, "Could not add translated subtitle track", failure);
            return;
        }

        if (translated <= 0) logTracks();

        // The app adds its own copy of the subtitle too, and that copy is selected when it is
        // added, which would undo the selection above. The app can do that seconds after this
        // track was added, so keep the translated track selected for a while. Only the selection
        // is written, and only when it actually changed: writing it on every pass would keep mpv
        // busy and delay the app's own subtitle commands.
        long deadline = System.currentTimeMillis() + 5000;
        int track = translated;
        while (System.currentTimeMillis() < deadline) {
            if (playerGone(owner)) return;

            // The user may have turned translation off while this track was being added; the
            // switch then owns the subtitle selection.
            if (!MorphePrefs.isSubtitleTranslationEnabled(context)) return;

            if (track <= 0) track = findTrackId(title);
            selectId(track);
            sleep(150);
        }
    }

    /** Lists the subtitle tracks in logcat. Used when the translated track cannot be found. */
    private static void logTracks() {
        try {
            Object instance = mpvInstance();
            Method getString = mpvMethod("getPropertyString", String.class);
            Method getInt = mpvMethod("getPropertyInt", String.class);

            int count = trackCount();
            for (int index = 0; index < count; index++) {
                Object type = getString.invoke(instance, "track-list/" + index + "/type");
                Object id = getInt.invoke(instance, "track-list/" + index + "/id");
                Object title = getString.invoke(instance, "track-list/" + index + "/title");
                Log.d(TAG, "Track " + id + " (" + type + "): " + title);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Could not read subtitle track list", failure);
        }
    }

    /** Id of the subtitle track carrying {@code title}, once it has appeared, or -1. */
    private static int trackIdWithTitle(int before, String title) {
        if (before < 0) return -1;

        long deadline = System.currentTimeMillis() + 1500;
        while (System.currentTimeMillis() < deadline) {
            int count = trackCount();
            if (count > before) {
                int id = findTrackId(title);
                if (id > 0) return id;
            }
            sleep(50);
        }
        return -1;
    }

    /** Id of the subtitle track whose title matches, or -1. */
    private static int findTrackId(String title) {
        try {
            Object instance = mpvInstance();
            Method getString = mpvMethod("getPropertyString", String.class);
            Method getInt = mpvMethod("getPropertyInt", String.class);

            int count = trackCount();
            for (int index = 0; index < count; index++) {
                Object type = getString.invoke(instance, "track-list/" + index + "/type");
                if (!"sub".equals(type)) continue;
                Object trackTitle = getString.invoke(instance, "track-list/" + index + "/title");
                if (!title.equals(trackTitle)) continue;

                Object id = getInt.invoke(instance, "track-list/" + index + "/id");
                if (id instanceof Integer) return (Integer) id;
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Could not read subtitle track list", failure);
        }
        return -1;
    }

    /** Selects a subtitle track by id unless it is selected already. */
    private static void selectId(int id) {
        if (id <= 0) return;

        String selected = selectedSid();
        if (selected != null && selected.equals(String.valueOf(id))) return;

        try {
            mpvMethod("setPropertyInt", String.class, int.class).invoke(mpvInstance(), "sid", id);
            Log.d(TAG, "Selected translated subtitle track " + id);
        } catch (Throwable failure) {
            Log.w(TAG, "Could not select translated subtitle track " + id, failure);
        }
    }

    /**
     * Value of mpv's {@code sid} property, or {@code null} when it cannot be read.
     *
     * <p>{@code sid} has no integer representation, so it is read as a string: a track id, or
     * {@code no} when subtitles are off.
     */
    private static String selectedSid() {
        String value = property("sid");
        return value == null ? null : value.trim();
    }

    /** Id of the selected subtitle track, or -1 when subtitles are off or unreadable. */
    private static int selectedSidId() {
        String selected = selectedSid();
        if (selected == null || "no".equalsIgnoreCase(selected)) return -1;

        try {
            return Integer.parseInt(selected);
        } catch (NumberFormatException invalid) {
            return -1;
        }
    }

    /** A string property of the running player, or {@code null} when it cannot be read. */
    private static String property(String name) {
        try {
            Object value = mpvMethod("getPropertyString", String.class).invoke(
                mpvInstance(),
                name
            );
            return value instanceof String ? (String) value : null;
        } catch (Throwable failure) {
            return null;
        }
    }

    /** An integer property of the running player, or {@code null} when it cannot be read. */
    private static Object propertyInt(String name) {
        try {
            return mpvMethod("getPropertyInt", String.class).invoke(mpvInstance(), name);
        } catch (Throwable failure) {
            return null;
        }
    }

    /** Whether the player this translation belongs to has been left. */
    private static boolean playerGone(Activity owner) {
        if (owner == null) return false;
        if (owner.isFinishing() || owner.isDestroyed()) return true;
        return MorpheHook.currentActivity() != owner;
    }

    /** Number of tracks mpv currently reports, or -1 when mpv is not reachable. */
    private static int trackCount() {
        try {
            Object value = mpvMethod("getPropertyInt", String.class).invoke(
                mpvInstance(),
                "track-list/count"
            );
            return value instanceof Integer ? (Integer) value : -1;
        } catch (Throwable failure) {
            return -1;
        }
    }

    private static Object mpvInstance() throws Exception {
        Class<?> mpv = Class.forName("is.xyz.mpv.MPVLib");
        return mpv.getField("INSTANCE").get(null);
    }

    private static Method mpvMethod(String name, Class<?>... parameters) throws Exception {
        return Class.forName("is.xyz.mpv.MPVLib").getMethod(name, parameters);
    }

    private static Translation translateText(String text, String target, String extension)
        throws IOException {
        if (text == null || text.trim().isEmpty()) return null;
        if ("ass".equals(extension) || "ssa".equals(extension)) {
            return translateAss(text, target);
        }
        if ("vtt".equals(extension)) {
            return translateSrt(text, target);
        }
        if ("sub".equals(extension)) {
            return translateMicroDvd(text, target);
        }
        return translateSrt(text, target);
    }

    private static Translation translateSrt(String source, String target)
        throws IOException {
        String normalized = normalize(source);
        String[] blocks = normalized.split("\n\n+", -1);

        List<Cue> cues = new ArrayList<Cue>();
        List<String> texts = new ArrayList<String>();

        for (String block : blocks) {
            String[] lines = block.split("\n", -1);
            int timing = findTimingLine(lines);
            if (timing < 0 || timing + 1 >= lines.length) {
                cues.add(new Cue(block, null));
                continue;
            }

            String text = join(lines, timing + 1, lines.length);
            if (text.trim().isEmpty()) {
                cues.add(new Cue(block, null));
                continue;
            }

            cues.add(new Cue(block, text));
            texts.add(text);
        }

        if (texts.isEmpty()) return null;

        BatchResult result = translateAll(texts, target);
        StringBuilder out = new StringBuilder();
        int translatedIndex = 0;

        for (int index = 0; index < cues.size(); index++) {
            if (index > 0) out.append("\n\n");

            Cue cue = cues.get(index);
            if (cue.text == null) {
                out.append(cue.block);
                continue;
            }

            String[] lines = cue.block.split("\n", -1);
            int timing = findTimingLine(lines);
            out.append(join(lines, 0, timing + 1));
            out.append('\n');
            out.append(result.texts.get(translatedIndex++));
        }

        out.append('\n');
        return new Translation(out.toString(), result.detected, result.changed);
    }

    private static Translation translateAss(String source, String target) throws IOException {
        String normalized = normalize(source);
        String[] lines = normalized.split("\n", -1);

        boolean events = false;
        int textField = 9;
        List<Integer> dialogueLines = new ArrayList<Integer>();
        List<String> texts = new ArrayList<String>();

        for (int index = 0; index < lines.length; index++) {
            String line = lines[index];
            String trimmed = line.trim();

            if (trimmed.equalsIgnoreCase("[Events]")) {
                events = true;
                continue;
            }
            if (trimmed.startsWith("[") && trimmed.endsWith("]")) {
                events = false;
                continue;
            }
            if (!events) continue;

            if (trimmed.regionMatches(true, 0, "Format:", 0, 7)) {
                String[] fields = trimmed.substring(7).split(",");
                for (int field = 0; field < fields.length; field++) {
                    if (fields[field].trim().equalsIgnoreCase("Text")) {
                        textField = field;
                        break;
                    }
                }
            }

            if (!line.regionMatches(true, 0, "Dialogue:", 0, 9)) continue;

            int start = fieldStart(line, textField);
            if (start < 0 || start >= line.length()) continue;

            String text = line.substring(start);
            if (text.trim().isEmpty()) continue;

            dialogueLines.add(index);
            texts.add(text);
        }

        if (texts.isEmpty()) return null;

        BatchResult result = translateAll(texts, target);
        String[] output = lines.clone();
        int translatedIndex = 0;

        for (Integer lineIndex : dialogueLines) {
            String line = output[lineIndex];
            int start = fieldStart(line, textField);
            if (start < 0) continue;

            String original = line.substring(start);
            String leading = leadingWhitespace(original);
            output[lineIndex] = line.substring(0, start)
                + leading
                + result.texts.get(translatedIndex++);
        }

        return new Translation(
            join(output, 0, output.length),
            result.detected,
            result.changed
        );
    }

    private static Translation translateMicroDvd(String source, String target) throws IOException {
        String normalized = normalize(source);
        String[] lines = normalized.split("\n", -1);
        List<String> texts = new ArrayList<String>();
        List<Integer> lineIndexes = new ArrayList<Integer>();

        for (int index = 0; index < lines.length; index++) {
            Matcher matcher = MICRO_DVD_LINE.matcher(lines[index]);
            if (!matcher.matches()) continue;

            String text = matcher.group(2);
            if (text.trim().isEmpty()) continue;

            lineIndexes.add(index);
            texts.add(text.replace("|", "\n"));
        }

        if (texts.isEmpty()) return null;

        BatchResult result = translateAll(texts, target);
        String[] output = lines.clone();
        int translatedIndex = 0;

        for (Integer lineIndex : lineIndexes) {
            Matcher matcher = MICRO_DVD_LINE.matcher(output[lineIndex]);
            if (!matcher.matches()) continue;

            String translated = result.texts.get(translatedIndex++).replace("\n", "|");
            output[lineIndex] = matcher.group(1) + translated;
        }

        return new Translation(
            join(output, 0, output.length),
            result.detected,
            result.changed
        );
    }

    private static BatchResult translateAll(List<String> texts, String target)
        throws IOException {
        List<String> translated = new ArrayList<String>(texts.size());
        String detected = null;
        boolean changed = false;
        int index = 0;

        while (index < texts.size()) {
            int end = index;
            int chars = 0;

            while (end < texts.size()) {
                int length = texts.get(end).length();
                if (end > index && chars + length + MARKER.length() + 2 > MAX_BATCH_CHARS) {
                    break;
                }
                chars += length + MARKER.length() + 2;
                end++;
            }

            List<String> batch = texts.subList(index, end);
            BatchResult batchResult = translateBatch(batch, target);

            if (detected == null && batchResult.detected != null
                && !batchResult.detected.isEmpty()) {
                detected = batchResult.detected;
            }

            for (int item = 0; item < batch.size(); item++) {
                String value = batchResult.texts.get(item);
                translated.add(value);
                if (!value.equals(batch.get(item))) changed = true;
            }

            index = end;
            if (index < texts.size()) sleep(200);
        }

        return new BatchResult(translated, detected, changed);
    }

    private static BatchResult translateBatch(List<String> batch, String target)
        throws IOException {
        if (batch.size() == 1) {
            Response response = request(batch.get(0), target);
            List<String> value = Collections.singletonList(response.text);
            return new BatchResult(value, response.detected, false);
        }

        StringBuilder joined = new StringBuilder();
        for (int index = 0; index < batch.size(); index++) {
            if (index > 0) joined.append('\n').append(MARKER).append('\n');
            joined.append(batch.get(index));
        }

        Response response = request(joined.toString(), target);
        String[] parts = MARKER_SPLIT.split(response.text, -1);
        if (parts.length == batch.size()) {
            List<String> value = new ArrayList<String>(parts.length);
            Collections.addAll(value, parts);
            return new BatchResult(value, response.detected, false);
        }

        // Google merged or dropped a cue. Fall back to one request per cue so the
        // translated file still lines up with the original timings.
        Log.w(TAG, "Batch split mismatch (" + parts.length + " of " + batch.size()
            + "), translating cues individually");
        List<String> value = new ArrayList<String>(batch.size());
        String detected = response.detected;
        for (String item : batch) {
            Response single = request(item, target);
            value.add(single.text);
            if (detected == null || detected.isEmpty()) detected = single.detected;
            sleep(100);
        }
        return new BatchResult(value, detected, false);
    }

    private static Response request(String text, String target) throws IOException {
        String body = "client=gtx&sl=auto&dt=t&tl="
            + URLEncoder.encode(target, "UTF-8")
            + "&q="
            + URLEncoder.encode(text, "UTF-8");

        IOException lastFailure = null;

        for (int attempt = 0; attempt < 3; attempt++) {
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(ENDPOINT).openConnection();
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);
                connection.setConnectTimeout(15000);
                connection.setReadTimeout(20000);
                connection.setRequestProperty(
                    "Content-Type",
                    "application/x-www-form-urlencoded; charset=UTF-8"
                );
                connection.setRequestProperty(
                    "User-Agent",
                    "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 "
                        + "(KHTML, like Gecko) Chrome/120.0 Mobile Safari/537.36"
                );

                byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
                connection.setFixedLengthStreamingMode(bytes.length);
                try (OutputStream output = connection.getOutputStream()) {
                    output.write(bytes);
                }

                int code = connection.getResponseCode();
                if (code == 429 || code >= 500) {
                    lastFailure = new IOException("HTTP " + code);
                    sleep(1000L << attempt);
                    continue;
                }
                if (code != 200) throw new IOException("HTTP " + code);

                String response = readAll(connection.getInputStream());
                if (response.isEmpty()) throw new IOException("Empty translation response");

                JSONArray root = new JSONArray(response);
                JSONArray segments = root.optJSONArray(0);
                StringBuilder translated = new StringBuilder();

                if (segments != null) {
                    for (int index = 0; index < segments.length(); index++) {
                        JSONArray segment = segments.optJSONArray(index);
                        if (segment != null) translated.append(segment.optString(0, ""));
                    }
                }

                if (translated.length() == 0) {
                    throw new IOException("Translation response has no text");
                }

                return new Response(translated.toString(), root.optString(2, ""));
            } catch (IOException failure) {
                lastFailure = failure;
                if (attempt == 2) break;
                sleep(1000L << attempt);
            } catch (Exception failure) {
                lastFailure = new IOException("Could not parse translation response", failure);
                if (attempt == 2) break;
                sleep(1000L << attempt);
            } finally {
                if (connection != null) connection.disconnect();
            }
        }

        throw lastFailure == null ? new IOException("Translation failed") : lastFailure;
    }

    private static boolean sameLanguage(String detected, String target) {
        if (detected == null || detected.isEmpty() || target == null || target.isEmpty()) {
            return false;
        }

        String first = detected.toLowerCase(Locale.ROOT).replace('_', '-');
        String second = target.toLowerCase(Locale.ROOT).replace('_', '-');

        if (first.equals(second)) return true;

        if (first.startsWith("zh") && second.startsWith("zh")) {
            if (first.equals("zh") || second.equals("zh")) return false;
            boolean firstTraditional = first.contains("tw") || first.contains("hant");
            boolean secondTraditional = second.contains("tw") || second.contains("hant");
            return firstTraditional == secondTraditional;
        }

        return first.startsWith(second + "-") || second.startsWith(first + "-");
    }

    private static String queryDisplayName(Context context, Uri uri) {
        Cursor cursor = null;
        try {
            cursor = context.getContentResolver().query(
                uri,
                new String[] {OpenableColumns.DISPLAY_NAME},
                null,
                null,
                null
            );
            if (cursor != null && cursor.moveToFirst()) {
                int column = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                if (column >= 0) {
                    String name = cursor.getString(column);
                    if (name != null && !name.isEmpty()) return name;
                }
            }
        } catch (Throwable ignored) {
            // Fall back to the last path segment.
        } finally {
            if (cursor != null) cursor.close();
        }

        String last = uri.getLastPathSegment();
        return last == null || last.isEmpty() ? "subtitle.srt" : last;
    }

    private static File cacheFile(
        Context context,
        String key,
        String sourceName,
        String target
    ) {
        File root = context.getCacheDir();
        if (root == null) root = context.getFilesDir();
        if (root == null) return null;

        File directory = new File(root, "morphe-subtitles");
        if (!directory.isDirectory() && !directory.mkdirs()) {
            Log.w(TAG, "Could not create subtitle cache directory");
        }

        String extension = extensionOf(sourceName);
        if ("ssa".equals(extension)) extension = "ass";
        if (!isTranslatable(sourceName)) extension = "srt";

        return new File(
            directory,
            Integer.toHexString(key.hashCode()) + "-GoogleTranslate." + target + "." + extension
        );
    }

    private static boolean isTranslatable(String fileName) {
        String extension = extensionOf(fileName);
        return "srt".equals(extension)
            || "vtt".equals(extension)
            || "ass".equals(extension)
            || "ssa".equals(extension)
            || "sub".equals(extension);
    }

    private static String extensionOf(String fileName) {
        if (fileName == null) return "";
        int dot = fileName.lastIndexOf('.');
        if (dot < 0 || dot == fileName.length() - 1) return "";
        return fileName.substring(dot + 1).toLowerCase(Locale.ROOT);
    }

    private static int findTimingLine(String[] lines) {
        for (int index = 0; index < lines.length; index++) {
            if (lines[index].contains("-->")) return index;
        }
        return -1;
    }

    private static int fieldStart(String line, int fieldIndex) {
        if (fieldIndex < 0) return -1;
        int commas = 0;
        for (int index = 0; index < line.length(); index++) {
            if (line.charAt(index) != ',') continue;
            commas++;
            if (commas == fieldIndex) return index + 1;
        }
        return -1;
    }

    private static String leadingWhitespace(String value) {
        int index = 0;
        while (index < value.length() && Character.isWhitespace(value.charAt(index))) index++;
        return value.substring(0, index);
    }

    private static String join(String[] lines, int from, int to) {
        StringBuilder out = new StringBuilder();
        for (int index = from; index < to; index++) {
            if (index > from) out.append('\n');
            out.append(lines[index]);
        }
        return out.toString();
    }

    private static String readText(File file) throws IOException {
        try (InputStream input = new FileInputStream(file)) {
            return decode(readAllBytes(input));
        }
    }

    private static String readText(Context context, Uri uri) throws IOException {
        try (InputStream input = context.getContentResolver().openInputStream(uri)) {
            if (input == null) throw new IOException("Could not open " + uri);
            return decode(readAllBytes(input));
        }
    }

    private static byte[] readAllBytes(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int read;
        while ((read = input.read(buffer)) != -1) output.write(buffer, 0, read);
        return output.toByteArray();
    }

    private static String readAll(InputStream input) throws IOException {
        return new String(readAllBytes(input), StandardCharsets.UTF_8);
    }

    private static String decode(byte[] bytes) {
        if (bytes.length >= 3
            && (bytes[0] & 0xFF) == 0xEF
            && (bytes[1] & 0xFF) == 0xBB
            && (bytes[2] & 0xFF) == 0xBF) {
            return normalize(new String(bytes, 3, bytes.length - 3, StandardCharsets.UTF_8));
        }
        if (bytes.length >= 2
            && (bytes[0] & 0xFF) == 0xFF
            && (bytes[1] & 0xFF) == 0xFE) {
            return normalize(new String(bytes, 2, bytes.length - 2, StandardCharsets.UTF_16LE));
        }
        if (bytes.length >= 2
            && (bytes[0] & 0xFF) == 0xFE
            && (bytes[1] & 0xFF) == 0xFF) {
            return normalize(new String(bytes, 2, bytes.length - 2, StandardCharsets.UTF_16BE));
        }

        CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder()
            .onMalformedInput(CodingErrorAction.REPORT)
            .onUnmappableCharacter(CodingErrorAction.REPORT);
        try {
            return normalize(decoder.decode(ByteBuffer.wrap(bytes)).toString());
        } catch (CharacterCodingException ignored) {
            return normalize(new String(bytes, Charset.forName("windows-1252")));
        }
    }

    private static String normalize(String text) {
        if (text.startsWith("\uFEFF")) text = text.substring(1);
        return text.replace("\r\n", "\n").replace('\r', '\n');
    }

    private static void writeText(File file, String text) throws IOException {
        File directory = file.getParentFile();
        if (directory != null && !directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Could not create " + directory);
        }

        File temporary = new File(file.getAbsolutePath() + ".tmp");
        try (OutputStreamWriter writer = new OutputStreamWriter(
            new FileOutputStream(temporary),
            StandardCharsets.UTF_8
        )) {
            writer.write(text);
        }

        if (temporary.renameTo(file)) return;

        try (
            InputStream input = new FileInputStream(temporary);
            OutputStream output = new FileOutputStream(file)
        ) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) != -1) output.write(buffer, 0, read);
        } finally {
            // Best effort; the temporary file is inside the cache.
            //noinspection ResultOfMethodCallIgnored
            temporary.delete();
        }
    }

    private static Context appContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object application = currentApplication.invoke(null);
            if (application instanceof Context) return (Context) application;
        } catch (Throwable ignored) {
            // Fall through to the tracked activity.
        }

        Activity activity = MorpheHook.currentActivity();
        return activity;
    }

    private static boolean isVietnameseUi(Context context) {
        return "vi".equals(
            context.getResources().getConfiguration().getLocales().get(0).getLanguage()
        );
    }

    private static void sleep(long milliseconds) {
        try {
            Thread.sleep(milliseconds);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        }
    }

    private static final class Cue {
        final String block;
        final String text;

        Cue(String block, String text) {
            this.block = block;
            this.text = text;
        }
    }

    /** One cue of an embedded subtitle track. */
    private static final class TimedText {
        final long start;
        final long end;
        final String text;

        TimedText(long start, long end, String text) {
            this.start = start;
            this.end = end;
            this.text = text;
        }
    }

    private static final class Response {
        final String text;
        final String detected;

        Response(String text, String detected) {
            this.text = text;
            this.detected = detected;
        }
    }

    private static final class BatchResult {
        final List<String> texts;
        final String detected;
        final boolean changed;

        BatchResult(List<String> texts, String detected, boolean changed) {
            this.texts = texts;
            this.detected = detected;
            this.changed = changed;
        }
    }

    private static final class Translation {
        final String text;
        final String detected;
        final boolean changed;

        Translation(String text, String detected, boolean changed) {
            this.text = text;
            this.detected = detected;
            this.changed = changed;
        }
    }
}
