package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.util.Log;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

public final class OfficialLyricsPronunciation {
    private static final String TAG = "AppleMusicLrclib";
    private static final Map<Object, String> ORIGINALS = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Boolean> OFFICIAL_READINGS = Collections.synchronizedMap(new WeakHashMap<>());

    private OfficialLyricsPronunciation() {}

    public static void rememberOriginal(String ttml, Object song) {
        if (ttml != null && song != null) ORIGINALS.put(song, ttml);
    }

    static Object prepare(Context context, LrclibModels.TrackQuery query, Object original, String script) {
        String ttml = ORIGINALS.get(original);
        if (ttml == null || query == null) return original;
        try {
            Object song = invokeNoArgs(original, "get");
            if (song == null) return original;
            boolean officialReading = hasNativeReading(original);
            String lyricsId = (String) invokeNoArgs(song, "getLyricsId");
            boolean wordTiming = ((Number) invokeNoArgs(song, "getTiming")).longValue() == 2L;
            LyricsLineEditor.Sheet sheet = LyricsLineEditor.prepare(
                    context, query.trackKey, query.title, query.artist,
                    "apple:" + lyricsId, ttml, ttml, null, wordTiming, officialReading);
            if (!sheet.displayed.equals(ttml)) {
                long adamId = ((Number) invokeNoArgs(song, "getAdamId")).longValue();
                long queueId = ((Number) invokeNoArgs(song, "getQueueId")).longValue();
                Object parsed = LrclibReflection.parseTtmlToSongInfoPtr(sheet.displayed, adamId, queueId, lyricsId, script);
                if (parsed != null && (!officialReading || hasNativeReading(parsed))) {
                    LyricsLineEditor.remember(parsed, sheet);
                    OFFICIAL_READINGS.put(parsed, officialReading);
                    return parsed;
                }
            }
            LyricsLineEditor.remember(original, sheet.withDisplay(ttml));
        } catch (Exception e) {
            Log.w(TAG, "Could not prepare the official lyrics", e);
        }
        return original;
    }

    static boolean hasOfficialReading(Object songPtr) {
        Boolean official = OFFICIAL_READINGS.get(songPtr);
        return official != null ? official : hasNativeReading(songPtr);
    }

    private static boolean hasNativeReading(Object songPtr) {
        if (songPtr == null) return false;
        try {
            Object song = invokeNoArgs(songPtr, "get");
            Object languages = song == null ? null : invokeNoArgs(song, "getPronunciationLanguages");
            return languages != null && ((Number) invokeNoArgs(languages, "size")).longValue() > 0;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return false;
        }
    }

    private static Object invokeNoArgs(Object target, String method) throws ReflectiveOperationException {
        return target.getClass().getMethod(method).invoke(target);
    }
}
