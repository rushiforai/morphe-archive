package app.voidhack.extension.applemusic.lyrics;

import android.app.Activity;
import android.content.Context;
import android.text.Html;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

final class LyricsLineEditor {
    private static final String TAG = "AppleMusicLrclib";
    private static final Map<Object, Sheet> PARSED = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Rendered> VISIBLE = new WeakHashMap<>();
    private static final Map<String, Sheet> BY_TRACK = Collections.synchronizedMap(
            new LinkedHashMap<String, Sheet>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Sheet> eldest) {
                    return size() > 16;
                }
            });

    private static final class Rendered {
        final Sheet sheet;
        final Object song;

        Rendered(Sheet sheet, Object song) {
            this.sheet = sheet;
            this.song = song;
        }
    }

    static final class Sheet {
        final String trackKey;
        final String documentKey;
        final String original;
        final String baseline;
        final String displayed;

        Sheet(String trackKey, String documentKey, String original, String displayed) {
            this(trackKey, documentKey, original, original, displayed);
        }

        Sheet(String trackKey, String documentKey, String original, String baseline, String displayed) {
            this.trackKey = trackKey;
            this.documentKey = documentKey;
            this.original = original;
            this.baseline = baseline == null ? original : baseline;
            this.displayed = displayed;
        }

        Sheet withDisplay(String ttml) {
            return new Sheet(trackKey, documentKey, original, baseline, ttml);
        }
    }

    private LyricsLineEditor() {}

    static boolean hasTextEdits(Map<Integer, LyricsEditTtml.Edit> edits) {
        for (LyricsEditTtml.Edit edit : edits.values()) {
            if (edit.text != null) return true;
        }
        return false;
    }

    static Sheet prepare(
            Context context, String trackKey, String sourceKey, String sourceLyrics, String original,
            String generated, boolean wordTiming, boolean hasOfficialReading) {
        return prepare(context, trackKey, "", "", sourceKey, sourceLyrics, original, generated, wordTiming, hasOfficialReading);
    }

    static Sheet prepare(
            Context context, String trackKey, String trackTitle, String artistName,
            String sourceKey, String sourceLyrics, String original,
            String generated, boolean wordTiming, boolean hasOfficialReading) {
        String documentKey = LyricsEdits.documentKey(trackKey, sourceKey, sourceLyrics);
        return prepare(context, trackKey, trackTitle, artistName, documentKey, LyricsEdits.load(context, documentKey),
                original, generated, wordTiming, hasOfficialReading);
    }

    static Sheet prepare(
            Context context, String trackKey, String documentKey, Map<Integer, LyricsEditTtml.Edit> edits,
            String original, String generated, boolean wordTiming, boolean hasOfficialReading) {
        return prepare(context, trackKey, "", "", documentKey, edits, original, generated, wordTiming, hasOfficialReading);
    }

    static Sheet prepare(
            Context context, String trackKey, String trackTitle, String artistName,
            String documentKey, Map<Integer, LyricsEditTtml.Edit> edits,
            String original, String generated, boolean wordTiming, boolean hasOfficialReading) {
        if (original == null) return new Sheet(trackKey, documentKey, null, null, null);
        String baseline = original;
        String ttml = generated;
        try {
            boolean needRomanization = !hasOfficialReading && LrclibPrefs.isRomanizationEnabled(context);
            if (generated != null) {
                baseline = generated;
            } else if (needRomanization) {
                String guide = OfficialLyricsTtml.addGuide(original, wordTiming, LrclibRomanizer::create);
                if (guide != null) baseline = guide;
            }

            String editedText = LyricsEditTtml.applyText(original, edits);
            if (!editedText.equals(original)) {
                ttml = editedText;
                if (needRomanization) {
                    String guide = OfficialLyricsTtml.addGuide(ttml, wordTiming, LrclibRomanizer::create);
                    if (guide != null) ttml = guide;
                }
            } else {
                ttml = baseline;
            }
            ttml = LyricsEditTtml.applyReadings(ttml, edits);
            if (edits != null && !edits.isEmpty() && documentKey != null) {
                LyricsEdits.backfillMetadata(
                        context, documentKey, trackKey, trackTitle, artistName,
                        LyricsEditTtml.editedLines(baseline, ttml, edits));
            }
        } catch (Exception error) {
            Log.w(TAG, "Could not apply lyric edits", error);
            ttml = generated != null ? generated : original;
        }
        return new Sheet(trackKey, documentKey, original, baseline, ttml);
    }

    static void remember(Object song, Sheet lyrics) {
        if (song != null && lyrics != null) {
            PARSED.put(song, lyrics);
            if (lyrics.trackKey != null && !lyrics.trackKey.isEmpty()) {
                BY_TRACK.put(lyrics.trackKey, lyrics);
            }
        }
    }

    static void bind(Object fragment, Object song) {
        Sheet lyrics = song == null ? null : PARSED.get(song);
        if (lyrics == null) {
            VISIBLE.remove(fragment);
        } else {
            VISIBLE.put(fragment, new Rendered(lyrics, song));
            if (lyrics.trackKey != null && !lyrics.trackKey.isEmpty()) {
                BY_TRACK.put(lyrics.trackKey, lyrics);
            }
        }
    }

    static Sheet getActiveSheet(Object fragment, String trackKey) {
        if (fragment != null) {
            Rendered rendered = VISIBLE.get(fragment);
            if (rendered != null && rendered.sheet != null) {
                if (trackKey == null || trackKey.isEmpty() || trackKey.equals(rendered.sheet.trackKey)) {
                    return rendered.sheet;
                }
            }
        }
        if (trackKey != null && !trackKey.isEmpty()) {
            return BY_TRACK.get(trackKey);
        }
        return null;
    }

    static List<LyricsEditTtml.EditedLine> listEditedLines(Context context, Sheet sheet) {
        if (context == null || sheet == null || sheet.documentKey == null) return Collections.emptyList();
        Map<Integer, LyricsEditTtml.Edit> edits = LyricsEdits.load(context, sheet.documentKey);
        if (edits.isEmpty()) return Collections.emptyList();
        try {
            return LyricsEditTtml.editedLines(sheet.baseline, sheet.displayed, edits);
        } catch (Exception error) {
            Log.w(TAG, "Could not list edited lyric lines", error);
            return Collections.emptyList();
        }
    }

    static boolean restoreLine(Context context, String documentKey, int index) {
        return LyricsEdits.save(context, documentKey, index, null, null);
    }

    static boolean restoreAll(Context context, String documentKey) {
        return LyricsEdits.clearDocument(context, documentKey);
    }

    static boolean onTimedLineHeld(Object fragment, View anchor, Object nativeLine, Runnable share) {
        Rendered rendered = VISIBLE.get(fragment);
        if (rendered == null) return false;
        try {
            Object line = call(nativeLine, "get");
            long start = ((Number) call(line, "getBegin")).longValue();
            String text = normalize(Html.fromHtml((String) call(line, "getHtmlLineText"),
                    Html.FROM_HTML_MODE_COMPACT).toString());
            LyricsEditTtml.Row match = null;
            for (LyricsEditTtml.Row row : LyricsEditTtml.rows(rendered.sheet.displayed)) {
                if ((row.startMs >= 0 && row.startMs != start) || !normalize(row.text).equals(text)) continue;
                if (match != null) return false;
                match = row;
            }
            return open(fragment, anchor, rendered.sheet, match, share);
        } catch (Exception error) {
            Log.w(TAG, "Could not locate the synchronized lyric line", error);
            return false;
        }
    }

    static boolean onStaticLineHeld(Object fragment, View anchor, int displayedLine) {
        Rendered rendered = VISIBLE.get(fragment);
        if (rendered == null || displayedLine < 0) return false;
        try {
            List<LyricsEditTtml.Row> rows = LyricsEditTtml.rows(rendered.sheet.displayed);
            Object song = call(rendered.song, "get");
            Object legacy = song.getClass().getMethod("generateLegacyLyricsLines", String.class).invoke(song, "");
            long count = ((Number) call(legacy, "size")).longValue();
            java.lang.reflect.Method get = legacy.getClass().getMethod("get", long.class);
            List<String> visibleLines = new ArrayList<>();
            for (long i = 0; i < count; i++) {
                String line = (String) get.invoke(legacy, i);
                for (String part : line.split("\n", -1)) visibleLines.add(normalize(part));
            }
            if (displayedLine >= visibleLines.size() || visibleLines.get(displayedLine).isEmpty()) return false;

            int visible = 0;
            for (LyricsEditTtml.Row row : rows) {
                int first = visible;
                String expected = normalize(row.text);
                String matched = "";
                while (!expected.equals(matched) && visible < visibleLines.size()) {
                    String part = visibleLines.get(visible++);
                    if (part.isEmpty()) continue;
                    matched = matched.isEmpty() ? part : matched + " " + part;
                    if (!expected.startsWith(matched)) return false;
                }
                if (!expected.equals(matched)) return false;
                if (displayedLine >= first && displayedLine < visible) {
                    return open(fragment, anchor, rendered.sheet, row, null);
                }
            }
        } catch (Exception error) {
            Log.w(TAG, "Could not locate the unsynchronized lyric line", error);
        }
        return false;
    }

    private static boolean open(
            Object fragment, View anchor, Sheet sheet, LyricsEditTtml.Row line, Runnable share) {
        Activity activity = LrclibReflection.getActivity(fragment);
        if (activity == null || activity.isFinishing() || sheet.documentKey == null || line == null) return false;
        LrclibModels.TrackQuery query = LrclibController.getCurrentTrackQuery(fragment);
        if (query == null || !sheet.trackKey.equals(query.trackKey)) return false;

        try {
            for (LyricsEditTtml.Row original : LyricsEditTtml.rows(sheet.baseline)) {
                if (original.index != line.index) continue;

                Runnable edit = () -> showDialog(activity, fragment, sheet, line, original);
                if (share == null) {
                    edit.run();
                } else {
                    LyricsEditSheet.showActions(activity, () -> {
                        if (isVisible(fragment, sheet)) edit.run();
                    }, () -> {
                        if (isVisible(fragment, sheet) && anchor.isAttachedToWindow()) share.run();
                    });
                }
                return true;
            }
            return false;
        } catch (Exception error) {
            Log.w(TAG, "Could not open the lyric editor", error);
            return false;
        }
    }

    private static String normalize(String text) {
        return text.replaceAll("[\\s\\u00a0\\u3000]+", " ").trim();
    }

    private static Object call(Object target, String method) throws ReflectiveOperationException {
        return target.getClass().getMethod(method).invoke(target);
    }

    private static boolean isVisible(Object fragment, Sheet sheet) {
        Rendered rendered = VISIBLE.get(fragment);
        return rendered != null && rendered.sheet == sheet;
    }

    private static void showDialog(
            Activity activity, Object fragment, Sheet sheet, LyricsEditTtml.Row line, LyricsEditTtml.Row original) {
        LyricsEditTtml.Edit previous = LyricsEdits.load(activity, sheet.documentKey).get(line.index);
        LrclibModels.TrackQuery query = LrclibController.getCurrentTrackQuery(fragment);
        String trackTitle = query != null ? query.title : "";
        String artistName = query != null ? query.artist : "";
        LyricsEditSheet.showEditor(
                activity,
                line.text,
                line.reading,
                previous != null ? original.text : null,
                previous != null ? original.reading : null,
                (textValue, readingValue) -> {
                    String replacement = textValue.equals(line.text) ? textValue : singleLine(textValue);
                    String replacementReading = readingValue.equals(line.reading)
                            ? (previous == null ? null : previous.reading) : singleLine(readingValue);
                    if (replacementReading != null && replacementReading.equals(original.reading)) {
                        replacementReading = null;
                    }
                    return save(activity, sheet, line.index,
                            replacement.equals(original.text) ? null : replacement,
                            replacementReading,
                            trackTitle,
                            artistName,
                            original.text,
                            original.reading,
                            original.startMs);
                },
                previous == null ? null : () -> save(
                        activity, sheet, line.index, null, null, trackTitle, artistName,
                        original.text, original.reading, original.startMs),
                () -> {
                    if (isVisible(fragment, sheet)) {
                        LrclibController.reloadCurrentTrack(activity, fragment, false);
                    }
                });
    }

    private static String singleLine(String text) {
        return text.replaceAll("\\R", " ").trim();
    }

    private static boolean save(
            Activity activity,
            Sheet sheet,
            int index,
            String text,
            String reading,
            String trackTitle,
            String artistName,
            String originalText,
            String originalReading,
            long startMs) {
        if (!LyricsEdits.save(activity, sheet.documentKey, index, text, reading,
                sheet.trackKey, trackTitle, artistName, originalText, originalReading, startMs)) {
            Toast.makeText(activity, LrclibStrings.text(activity, "edit_lyric_save_failed"), Toast.LENGTH_SHORT).show();
            return false;
        }
        return true;
    }
}
