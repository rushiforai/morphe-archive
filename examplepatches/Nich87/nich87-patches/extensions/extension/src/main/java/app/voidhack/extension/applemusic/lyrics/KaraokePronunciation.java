package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.text.Html;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.util.ArrayMap;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

public final class KaraokePronunciation {
    private static final float INACTIVE_ALPHA = 0.42f;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, Boolean> LOCAL_GUIDES = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<ViewGroup, Pending> PENDING = new WeakHashMap<>();
    private static final Map<Object, Map<TextView, Guide>> GUIDES = new WeakHashMap<>();
    private static final Map<Object, Playback> SONGS = new WeakHashMap<>();

    private static volatile Method getSuggestedWordOffset;
    private static volatile Method songPtrGet;
    private static volatile Method songHasPronunciation;
    private static volatile Method wordVectorSize;
    private static volatile Method wordVectorGet;
    private static volatile Method wordPtrGet;
    private static volatile Method wordHtmlLineText;
    private static volatile Method wordBegin;
    private static volatile Method wordEnd;

    private static final class Playback {
        final Map<TextView, Guide> timed = new WeakHashMap<>();
        long position = Long.MIN_VALUE;
    }

    private static final class Word {
        final int start;
        final int beginMs;

        Word(int start, int beginMs) {
            this.start = start;
            this.beginMs = beginMs;
        }
    }

    private static final class Guide {
        final Playback playback;
        final Spanned text;
        final List<Word> words;
        int line;
        boolean active;
        int paintedThrough = -1;

        Guide(Playback playback, Spanned text, List<Word> words) {
            this.playback = playback;
            this.text = text;
            this.words = words;
        }

        void render(TextView view) {
            float targetAlpha = active ? 1f : INACTIVE_ALPHA;
            if (view.getAlpha() != targetAlpha) view.setAlpha(targetAlpha);
            if (words.isEmpty()) return;

            int futureStart = text.length();
            if (active) {
                for (Word word : words) {
                    if (word.beginMs > playback.position) {
                        futureStart = word.start;
                        break;
                    }
                }
            }
            if (futureStart == paintedThrough) return;
            paintedThrough = futureStart;
            if (futureStart == text.length()) {
                view.setText(text);
            } else {
                SpannableString highlighted = new SpannableString(text);
                int color = view.getCurrentTextColor();
                int dim = (color & 0x00FFFFFF) | (Math.round(Color.alpha(color) * INACTIVE_ALPHA) << 24);
                highlighted.setSpan(new ForegroundColorSpan(dim), futureStart, text.length(),
                        Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                view.setText(highlighted);
            }
        }
    }

    private static final class Pending {
        final ArrayMap<?, ?> marker = new ArrayMap<>();
        final TextView view;
        final Guide guide;

        Pending(TextView view, Guide guide) {
            this.view = view;
            this.guide = guide;
        }
    }

    private KaraokePronunciation() {}

    public static boolean usesLineGuide(Object songPtr) {
        if (songPtr == null) return false;
        Boolean cached = LOCAL_GUIDES.get(songPtr);
        if (cached != null) return cached;
        boolean result = hasLocalGuide(songPtr);
        LOCAL_GUIDES.put(songPtr, result);
        return result;
    }

    private static boolean hasLocalGuide(Object songPtr) {
        try {
            Method get = songPtrGet;
            if (get == null) {
                get = songPtr.getClass().getMethod("get");
                songPtrGet = get;
            }
            Object song = get.invoke(songPtr);
            if (song == null) return false;
            Method has = songHasPronunciation;
            if (has == null) {
                has = song.getClass().getMethod("hasPronunciation", String.class);
                songHasPronunciation = has;
            }
            return Boolean.TRUE.equals(has.invoke(song, LrclibParser.PRONUNCIATION_LANGUAGE));
        } catch (ReflectiveOperationException | RuntimeException e) {
            return false;
        }
    }

    public static ArrayMap<?, ?> capture(Object songPtr, String html, ViewGroup row, int wordLayout, Object words) {
        if (!usesLineGuide(songPtr)) return null;
        Context context = row.getContext();
        boolean backing = wordLayout == LrclibStrings.id(context, "layout", "lyrics_word_pronunciation_bg");
        String name = backing ? "lyrics_bg_translation_line_karaoke" : "lyrics_translation_line_karaoke";
        int layout = LrclibStrings.id(context, "layout", name);
        if (layout == 0) return null;

        View view = LayoutInflater.from(context).inflate(layout, row, false);
        if (!(view instanceof TextView text)) return null;
        text.setId(View.NO_ID);
        text.setTag(null);
        Spanned reading = Html.fromHtml(html, Html.FROM_HTML_MODE_COMPACT);
        text.setText(reading);

        Playback playback = SONGS.computeIfAbsent(songPtr, ignored -> new Playback());
        Pending pending = new Pending(text, new Guide(playback, reading, readWords(words, reading.toString())));
        PENDING.put(row, pending);
        return pending.marker;
    }

    private static List<Word> readWords(Object vector, String reading) {
        List<Word> words = new ArrayList<>();
        int cursor = 0;
        int lastEnd = -1;
        try {
            Method sizeMethod = wordVectorSize;
            Method getWord = wordVectorGet;
            if (sizeMethod == null || getWord == null) {
                Class<?> vectorClass = vector.getClass();
                sizeMethod = vectorClass.getMethod("size");
                getWord = vectorClass.getMethod("get", long.class);
                wordVectorSize = sizeMethod;
                wordVectorGet = getWord;
            }
            long count = ((Number) sizeMethod.invoke(vector)).longValue();
            for (long i = 0; i < count; i++) {
                Object ptr = getWord.invoke(vector, i);
                Method ptrGet = wordPtrGet;
                if (ptrGet == null) {
                    ptrGet = ptr.getClass().getMethod("get");
                    wordPtrGet = ptrGet;
                }
                Object word = ptrGet.invoke(ptr);
                Method htmlMethod = wordHtmlLineText;
                Method beginMethod = wordBegin;
                Method endMethod = wordEnd;
                if (htmlMethod == null || beginMethod == null || endMethod == null) {
                    Class<?> wordClass = word.getClass();
                    htmlMethod = wordClass.getMethod("getHtmlLineText");
                    beginMethod = wordClass.getMethod("getBegin");
                    endMethod = wordClass.getMethod("getEnd");
                    wordHtmlLineText = htmlMethod;
                    wordBegin = beginMethod;
                    wordEnd = endMethod;
                }
                String html = (String) htmlMethod.invoke(word);
                String text = Html.fromHtml(html, Html.FROM_HTML_MODE_COMPACT).toString().trim();
                if (isSpace(text)) continue;

                int begin = ((Number) beginMethod.invoke(word)).intValue();
                int end = ((Number) endMethod.invoke(word)).intValue();
                int start = reading.indexOf(text, cursor);
                if (start < 0 || !isSpace(reading.substring(cursor, start)) ||
                        begin < 0 || begin < lastEnd || end <= begin) return List.of();

                words.add(new Word(start, begin));
                lastEnd = end;
                cursor = start + text.length();
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            return List.of();
        }
        return words.size() >= 2 && isSpace(reading.substring(cursor)) ? words : List.of();
    }

    private static boolean isSpace(String text) {
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            if (!Character.isWhitespace(cp) && !Character.isSpaceChar(cp)) return false;
            i += Character.charCount(cp);
        }
        return true;
    }

    public static Object take(ViewGroup row, ArrayMap<?, ?> inlineWords) {
        Pending pending = PENDING.remove(row);
        return pending != null && pending.marker == inlineWords ? pending : null;
    }

    public static void attach(Object adapter, ViewGroup row, Object data, int line, Set<?> activeLines) {
        Pending pending = (Pending) data;
        TextView view = pending.view;
        Guide guide = pending.guide;
        guide.line = line;
        guide.active = activeLines.contains(line);
        guide.render(view);
        row.addView(view);
        GUIDES.computeIfAbsent(adapter, ignored -> new WeakHashMap<>()).put(view, guide);
        if (!guide.words.isEmpty()) guide.playback.timed.put(view, guide);
    }

    public static void syncActiveLines(Object adapter, Set<?> activeLines) {
        Map<TextView, Guide> guides = GUIDES.get(adapter);
        if (guides == null) return;
        for (var iterator = guides.entrySet().iterator(); iterator.hasNext();) {
            Map.Entry<TextView, Guide> entry = iterator.next();
            TextView view = entry.getKey();
            if (view.getParent() == null) {
                iterator.remove();
            } else {
                Guide guide = entry.getValue();
                guide.active = activeLines.contains(guide.line);
                guide.render(view);
            }
        }
    }

    public static void syncPosition(Object processor, Object songPtr, long position) {
        if (LyricsFeatures.editor()) {
            LyricsInterludes.onTick(songPtr, position);
        }
        if (!LyricsFeatures.pronunciation() || !usesLineGuide(songPtr)) return;
        long alignmentPosition = position - suggestedWordOffset(processor);
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(() -> updatePosition(songPtr, alignmentPosition));
        } else {
            updatePosition(songPtr, alignmentPosition);
        }
    }

    private static int suggestedWordOffset(Object processor) {
        try {
            Method method = getSuggestedWordOffset;
            if (method == null) {
                method = processor.getClass().getMethod("getSuggestedWordOffset");
                getSuggestedWordOffset = method;
            }
            return ((Number) method.invoke(processor)).intValue();
        } catch (ReflectiveOperationException | RuntimeException e) {
            return 0;
        }
    }

    private static void updatePosition(Object songPtr, long position) {
        if (!usesLineGuide(songPtr)) return;
        Playback playback = SONGS.computeIfAbsent(songPtr, ignored -> new Playback());
        playback.position = position;
        for (var iterator = playback.timed.entrySet().iterator(); iterator.hasNext();) {
            Map.Entry<TextView, Guide> entry = iterator.next();
            TextView view = entry.getKey();
            if (view.getParent() == null) {
                iterator.remove();
            } else if (entry.getValue().active) {
                entry.getValue().render(view);
            }
        }
    }
}
