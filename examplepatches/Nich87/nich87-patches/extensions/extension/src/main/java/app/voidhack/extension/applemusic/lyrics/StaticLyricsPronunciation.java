package app.voidhack.extension.applemusic.lyrics;

import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.RelativeSizeSpan;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;

/** Extends the legacy, unsynced lyrics adapter with the native pronunciation selection. */
public final class StaticLyricsPronunciation {
    private static final String TAG = "AppleMusicLrclib";
    private static final Map<Object, Sheet> SHEETS = new WeakHashMap<>();
    private static final Map<Object, Sheet> ADAPTERS = new WeakHashMap<>();

    private StaticLyricsPronunciation() {}

    private static final class Sheet {
        WeakReference<Object> adapter;
        Object song;
        boolean selected;
        String original;
        CharSequence withGuide;
    }

    public static void clear(Object fragment) {
        Sheet sheet = SHEETS.get(fragment);
        if (sheet == null || sheet.adapter == null) return;
        Object adapter = sheet.adapter.get();
        if (adapter != null) ADAPTERS.remove(adapter);
        sheet.adapter = null;
        sheet.song = null;
        sheet.original = null;
        sheet.withGuide = null;
    }

    public static void bind(Object fragment, Object adapter, Object song) {
        if (song == null) return;
        Sheet sheet = SHEETS.computeIfAbsent(fragment, ignored -> new Sheet());
        sheet.adapter = new WeakReference<>(adapter);
        sheet.song = song;
        ADAPTERS.put(adapter, sheet);
    }

    public static void onSelectionChanged(Object fragment, Boolean selected) {
        Sheet sheet = SHEETS.computeIfAbsent(fragment, ignored -> new Sheet());
        boolean show = Boolean.TRUE.equals(selected);
        if (sheet.selected == show) return;
        sheet.selected = show;
        Object adapter = sheet.adapter == null ? null : sheet.adapter.get();
        if (adapter == null) return;
        try {
            call(adapter, "voidhackRefreshStaticLyrics");
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w(TAG, "Could not refresh the static lyrics adapter", e);
        }
    }

    public static CharSequence display(Object adapter, String original) {
        Sheet sheet = ADAPTERS.get(adapter);
        if (sheet == null || !sheet.selected || original == null || original.isEmpty()) return original;
        if (!Objects.equals(sheet.original, original)) {
            sheet.original = original;
            sheet.withGuide = original;
            try {
                sheet.withGuide = addGuide(original, sheet.song);
            } catch (ReflectiveOperationException | RuntimeException e) {
                Log.w(TAG, "Could not show the static lyrics pronunciation", e);
            }
        }
        return sheet.withGuide;
    }

    private static CharSequence addGuide(String original, Object songPtr) throws ReflectiveOperationException {
        Object song = call(songPtr, "get");
        Object languages = call(song, "getPronunciationLanguages");
        Class<?> locale = Class.forName(
                "com.apple.android.music.playback.util.LocaleUtil", false, song.getClass().getClassLoader());
        Object language = locale.getMethod("matchToSystemLyricsScript", languages.getClass()).invoke(null, languages);
        if (language == null || !Boolean.TRUE.equals(
                song.getClass().getMethod("setPronunciation", String.class).invoke(song, language))) {
            return original;
        }

        Map<String, ArrayDeque<String>> guides = new HashMap<>();
        Object sections = call(song, "getSections");
        long sectionCount = size(sections);
        for (long sectionIndex = 0; sectionIndex < sectionCount; sectionIndex++) {
            Object section = call(element(sections, sectionIndex), "get");
            Object lines = call(section, "getLines");
            long lineCount = size(lines);
            for (long lineIndex = 0; lineIndex < lineCount; lineIndex++) {
                Object line = call(element(lines, lineIndex), "get");
                String text = fromHtml((String) call(line, "getHtmlLineText"));
                String guide = fromHtml((String) call(line, "getHtmlPronunciationLineText"));
                guides.computeIfAbsent(text, ignored -> new ArrayDeque<>()).add(guide);
            }
        }

        SpannableStringBuilder display = new SpannableStringBuilder();
        boolean added = false;
        String[] lines = original.split("\n", -1);
        for (int i = 0; i < lines.length; i++) {
            if (i > 0) display.append('\n');
            String line = lines[i];
            display.append(line);
            ArrayDeque<String> matches = guides.get(line.trim());
            String guide = matches == null ? null : matches.poll();
            if (guide != null && !guide.isEmpty() && !guide.equals(line.trim())) {
                int start = display.append('\n').length();
                display.append(guide);
                display.setSpan(new RelativeSizeSpan(0.72f), start, display.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                added = true;
            }
        }
        return added ? display : original;
    }

    private static String fromHtml(String text) {
        return text == null || text.isEmpty() ? ""
                : Html.fromHtml(text, Html.FROM_HTML_MODE_COMPACT).toString().trim();
    }

    private static Object call(Object target, String method) throws ReflectiveOperationException {
        return target.getClass().getMethod(method).invoke(target);
    }

    private static long size(Object vector) throws ReflectiveOperationException {
        return ((Number) call(vector, "size")).longValue();
    }

    private static Object element(Object vector, long index) throws ReflectiveOperationException {
        return vector.getClass().getMethod("get", long.class).invoke(vector, index);
    }
}
