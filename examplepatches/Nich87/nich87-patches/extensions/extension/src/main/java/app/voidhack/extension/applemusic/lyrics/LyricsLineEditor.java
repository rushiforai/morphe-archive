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
        final boolean wordTimed;
        final boolean hasOfficialReading;
        final List<LyricsEditTtml.InterludeRange> explicitInterludes;

        Sheet(String trackKey, String documentKey, String original, String displayed) {
            this(trackKey, documentKey, original, original, displayed, false, false, Collections.emptyList());
        }

        Sheet(String trackKey, String documentKey, String original, String baseline, String displayed) {
            this(trackKey, documentKey, original, baseline, displayed, false, false, Collections.emptyList());
        }

        Sheet(
                String trackKey,
                String documentKey,
                String original,
                String baseline,
                String displayed,
                boolean wordTimed,
                boolean hasOfficialReading,
                List<LyricsEditTtml.InterludeRange> explicitInterludes) {
            this.trackKey = trackKey;
            this.documentKey = documentKey;
            this.original = original;
            this.baseline = baseline == null ? original : baseline;
            this.displayed = displayed;
            this.wordTimed = wordTimed;
            this.hasOfficialReading = hasOfficialReading;
            this.explicitInterludes = explicitInterludes == null
                    ? Collections.emptyList()
                    : explicitInterludes;
        }

        Sheet withDisplay(String ttml) {
            return new Sheet(trackKey, documentKey, original, baseline, ttml,
                    wordTimed, hasOfficialReading, explicitInterludes);
        }
    }

    private LyricsLineEditor() {}

    static boolean hasTextEdits(Map<Integer, LyricsEditTtml.Edit> edits) {
        if (edits == null) return false;
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
        if (original == null) {
            return new Sheet(trackKey, documentKey, null, null, null, wordTiming, hasOfficialReading, Collections.emptyList());
        }
        String baseline = original;
        String ttml = generated;
        List<LyricsEditTtml.InterludeRange> interludes = Collections.emptyList();
        try {
            boolean allowPronunciation = LyricsFeatures.pronunciation();
            boolean allowEditor = LyricsFeatures.editor();
            boolean needRomanization = allowPronunciation && !hasOfficialReading && LrclibPrefs.isRomanizationEnabled(context);
            if (generated != null) {
                baseline = generated;
            } else if (needRomanization) {
                String guide = OfficialLyricsTtml.addGuide(original, wordTiming, LrclibRomanizer::create);
                if (guide != null) baseline = guide;
            }

            LyricsEditTtml.DocumentEdit docEdit = allowEditor ? LyricsEdits.loadDocument(context, documentKey) : null;
            if (docEdit != null) {
                ttml = LyricsEditTtml.applyDocument(
                        original,
                        baseline,
                        docEdit,
                        wordTiming,
                        needRomanization,
                        needRomanization ? LrclibRomanizer::create : null,
                        allowPronunciation);
                interludes = LyricsEditTtml.extractInterludeRanges(docEdit);
                if (documentKey != null) {
                    LyricsEdits.backfillMetadata(
                            context, documentKey, trackKey, trackTitle, artistName,
                            LyricsEditTtml.editedLinesForDocument(baseline, ttml, docEdit));
                }
            } else {
                Map<Integer, LyricsEditTtml.Edit> legacyEdits =
                        (allowEditor && edits != null) ? edits : Collections.emptyMap();
                String editedText = LyricsEditTtml.applyText(original, legacyEdits);
                if (!editedText.equals(original)) {
                    ttml = editedText;
                    if (needRomanization) {
                        String guide = OfficialLyricsTtml.addGuide(ttml, wordTiming, LrclibRomanizer::create);
                        if (guide != null) ttml = guide;
                    }
                } else {
                    ttml = baseline;
                }
                if (allowPronunciation || hasOfficialReading) {
                    ttml = LyricsEditTtml.applyReadings(ttml, legacyEdits);
                }
                interludes = allowEditor ? LyricsEditTtml.extractTtmlInterludeRanges(ttml) : Collections.emptyList();
                if (!legacyEdits.isEmpty() && documentKey != null) {
                    LyricsEdits.backfillMetadata(
                            context, documentKey, trackKey, trackTitle, artistName,
                            LyricsEditTtml.editedLines(baseline, ttml, legacyEdits));
                }
            }
        } catch (Exception error) {
            Log.w(TAG, "Could not apply lyric edits", error);
            ttml = generated != null ? generated : original;
            interludes = LyricsFeatures.editor()
                    ? LyricsEditTtml.extractTtmlInterludeRanges(ttml)
                    : Collections.emptyList();
        }
        return new Sheet(trackKey, documentKey, original, baseline, ttml, wordTiming, hasOfficialReading, interludes);
    }

    static void remember(Object song, Sheet lyrics) {
        if (song != null && lyrics != null) {
            PARSED.put(song, lyrics);
            if (LyricsFeatures.editor()) {
                LyricsInterludes.remember(song, lyrics.explicitInterludes);
            }
            if (lyrics.trackKey != null && !lyrics.trackKey.isEmpty()) {
                BY_TRACK.put(lyrics.trackKey, lyrics);
            }
        }
    }

    static void bind(Object fragment, Object song) {
        if (LyricsFeatures.editor()) {
            LyricsInterludes.setActiveSong(song);
        }
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

    static boolean hasEditsForSheet(Context context, Sheet sheet) {
        return context != null && sheet != null && sheet.documentKey != null
                && LyricsEdits.hasAnyEdits(context, sheet.documentKey);
    }

    static List<LyricsEditTtml.EditedLine> listEditedLines(Context context, Sheet sheet) {
        if (context == null || sheet == null || sheet.documentKey == null) return Collections.emptyList();
        try {
            LyricsEditTtml.DocumentEdit docEdit = LyricsEdits.loadDocument(context, sheet.documentKey);
            if (docEdit != null) {
                return LyricsEditTtml.editedLinesForDocument(sheet.baseline, sheet.displayed, docEdit);
            }
            Map<Integer, LyricsEditTtml.Edit> edits = LyricsEdits.load(context, sheet.documentKey);
            if (edits.isEmpty()) return Collections.emptyList();
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

    static boolean openEditorForCurrentTrack(
            Activity activity, Object fragment, LrclibModels.TrackQuery query, Sheet sheet, Runnable onSaved) {
        if (!LyricsFeatures.editor() || activity == null || activity.isFinishing()
                || sheet == null || sheet.documentKey == null) {
            return false;
        }
        LyricsEditorPage.open(activity, fragment, sheet, query, -1, () -> {
            LrclibController.reloadCurrentTrack(activity, fragment, false);
            if (onSaved != null) onSaved.run();
        });
        return true;
    }

    static boolean onTimedLineHeld(Object fragment, View anchor, Object nativeLine, Runnable share) {
        if (!LyricsFeatures.editor()) return false;
        Rendered rendered = VISIBLE.get(fragment);
        if (rendered == null) return false;
        try {
            Object line = call(nativeLine, "get");
            long start = ((Number) call(line, "getBegin")).longValue();
            String text = normalize(Html.fromHtml((String) call(line, "getHtmlLineText"),
                    Html.FROM_HTML_MODE_COMPACT).toString());
            List<LyricsEditTtml.Row> rows = LyricsEditTtml.rows(rendered.sheet.displayed);
            int matchedPosition = -1;
            for (int i = 0; i < rows.size(); i++) {
                LyricsEditTtml.Row row = rows.get(i);
                if ((row.startMs >= 0 && row.startMs != start) || !normalize(row.text).equals(text)) continue;
                if (matchedPosition >= 0) {
                    // Ambiguous duplicate line at same timestamp: still open editor focused on first match.
                    break;
                }
                matchedPosition = i;
            }
            return openFromGesture(fragment, anchor, rendered.sheet, matchedPosition, share);
        } catch (Exception error) {
            Log.w(TAG, "Could not locate the synchronized lyric line", error);
            return openFromGesture(fragment, anchor, rendered.sheet, -1, share);
        }
    }

    static boolean onStaticLineHeld(Object fragment, View anchor, int displayedLine) {
        if (!LyricsFeatures.editor()) return false;
        Rendered rendered = VISIBLE.get(fragment);
        if (rendered == null || displayedLine < 0) return false;
        int matchedPosition = -1;
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
            if (displayedLine < visibleLines.size() && !visibleLines.get(displayedLine).isEmpty()) {
                int visible = 0;
                for (int i = 0; i < rows.size(); i++) {
                    LyricsEditTtml.Row row = rows.get(i);
                    int first = visible;
                    String expected = normalize(row.text);
                    String matched = "";
                    while (!expected.equals(matched) && visible < visibleLines.size()) {
                        String part = visibleLines.get(visible++);
                        if (part.isEmpty()) continue;
                        matched = matched.isEmpty() ? part : matched + " " + part;
                        if (!expected.startsWith(matched)) break;
                    }
                    if (!expected.equals(matched)) break;
                    if (displayedLine >= first && displayedLine < visible) {
                        matchedPosition = i;
                        break;
                    }
                }
            }
        } catch (Exception error) {
            Log.w(TAG, "Could not locate the unsynchronized lyric line", error);
        }
        return openFromGesture(fragment, anchor, rendered.sheet, matchedPosition, null);
    }

    private static boolean openFromGesture(
            Object fragment, View anchor, Sheet sheet, int focusLineIndex, Runnable share) {
        Activity activity = LrclibReflection.getActivity(fragment);
        if (activity == null || activity.isFinishing() || sheet.documentKey == null) return false;
        LrclibModels.TrackQuery query = LrclibController.getCurrentTrackQuery(fragment);
        if (query == null || !sheet.trackKey.equals(query.trackKey)) return false;

        Runnable openFullEditor = () -> {
            if (!isVisible(fragment, sheet)) return;
            LyricsEditorPage.open(activity, fragment, sheet, query, focusLineIndex, () -> {
                if (isVisible(fragment, sheet)) {
                    LrclibController.reloadCurrentTrack(activity, fragment, false);
                }
            });
        };
        if (share == null) {
            openFullEditor.run();
        } else {
            LyricsEditSheet.showActions(activity, openFullEditor, () -> {
                if (isVisible(fragment, sheet) && anchor.isAttachedToWindow()) share.run();
            });
        }
        return true;
    }

    static boolean saveDocument(
            Activity activity,
            Sheet sheet,
            LrclibModels.TrackQuery query,
            LyricsEditTtml.DocumentEdit docEdit) {
        if (activity == null || sheet == null || sheet.documentKey == null) return false;
        String trackTitle = query != null ? query.title : "";
        String artistName = query != null ? query.artist : "";
        List<LyricsEditTtml.EditedLine> summary = Collections.emptyList();
        try {
            summary = LyricsEditTtml.editedLinesForDocument(sheet.baseline, null, docEdit);
        } catch (Exception ignored) {
        }
        if (!LyricsEdits.saveDocument(
                activity, sheet.documentKey, docEdit, sheet.trackKey, trackTitle, artistName, summary)) {
            Toast.makeText(activity, LrclibStrings.text(activity, "edit_lyric_save_failed"), Toast.LENGTH_SHORT).show();
            return false;
        }
        return true;
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
}
