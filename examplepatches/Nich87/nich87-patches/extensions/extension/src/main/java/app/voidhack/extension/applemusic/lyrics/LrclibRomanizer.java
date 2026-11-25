package app.voidhack.extension.applemusic.lyrics;

import android.icu.text.Transliterator;
import android.os.Build;
import android.util.Log;

import com.atilika.kuromoji.ipadic.Token;
import com.atilika.kuromoji.ipadic.Tokenizer;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.function.UnaryOperator;

final class LrclibRomanizer {
    private static final String TAG = "AppleMusicLrclib";
    private static final int MAX_LINE_LENGTH = 1_000;
    private static final ThreadLocal<Transliterator> ANY_LATIN = new ThreadLocal<>();

    private LrclibRomanizer() {}

    static UnaryOperator<String> create(String sourceLanguage, String lyricsText) {
        if (Build.VERSION.SDK_INT < 29 || !hasNonLatinLetters(lyricsText)) return null;
        String language = sourceLanguage == null ? "" : Locale.forLanguageTag(sourceLanguage).getLanguage();
        // Untagged LRC can contain kanji-only lines mixed with lines that identify Japanese by kana.
        boolean kana = hasKana(lyricsText);
        boolean japanese = language.equals("ja")
                || (!language.equals("zh") && !language.equals("ko") && kana);
        try {
            Tokenizer tokenizer = kana || (japanese && hasHan(lyricsText))
                    ? KuromojiDictionary.get(LrclibController.getAppContext()) : null;
            Transliterator transliterator = getAnyLatinTransliterator();
            return (TimedPronunciation.Romanizer) (line, spans) ->
                    romanizeLine(line, japanese, tokenizer, transliterator, spans);
        } catch (RuntimeException e) {
            Log.w(TAG, "Could not initialize lyric romanization", e);
            return null;
        }
    }

    private static Transliterator getAnyLatinTransliterator() {
        Transliterator instance = ANY_LATIN.get();
        if (instance == null) {
            instance = Transliterator.getInstance("Any-Latin");
            ANY_LATIN.set(instance);
        }
        return instance;
    }

    private static TimedPronunciation.Reading romanizeLine(
            String line, boolean japanese, Tokenizer tokenizer, Transliterator transliterator,
            List<TimedPronunciation.SourceSpan> spans) {
        if (line.length() > MAX_LINE_LENGTH || !hasNonLatinLetters(line)) return null;
        try {
            String text = Normalizer.normalize(line, Normalizer.Form.NFC);
            List<TimedPronunciation.Part> parts = null;
            if (hasKana(text) || (japanese && hasHan(text))) {
                // The source spans index the original string, so NFC changes preclude alignment.
                if (tokenizer != null && spans.size() > 1 && text.equals(line)) parts = new ArrayList<>();
                text = japaneseReading(text, tokenizer, parts);
                if (text == null) return null;
            }
            String romanized = transliterator.transliterate(text).trim();
            if (romanized.isEmpty() || romanized.equals(line.trim()) || hasNonLatinLetters(romanized)) return null;
            List<TimedPronunciation.Word> words = parts == null ? Collections.emptyList()
                    : TimedPronunciation.align(line, parts, spans, transliterator::transliterate, romanized);
            return new TimedPronunciation.Reading(romanized, words);
        } catch (RuntimeException e) {
            Log.w(TAG, "Could not romanize a lyric line", e);
            return null;
        }
    }

    private static String japaneseReading(String text, Tokenizer tokenizer, List<TimedPronunciation.Part> parts) {
        if (tokenizer == null) return hasHan(text) ? null : text;
        List<Token> tokens = tokenizer.tokenize(text);
        Map<Integer, String> contextualReadings = contextualVerbReadings(tokenizer, text, tokens);
        StringBuilder reading = new StringBuilder(text.length());
        boolean previousReading = false;
        for (int i = 0; i < tokens.size(); i++) {
            Token token = tokens.get(i);
            String surface = token.getSurface();
            int readingStart = reading.length();
            boolean containsHan = hasHan(surface);
            if (!containsHan && !hasKana(surface)) {
                if (previousReading && Character.isLetterOrDigit(surface.codePointAt(0))) reading.append(' ');
                reading.append(surface);
                previousReading = false;
            } else {
                String pronunciation = contextualReadings.getOrDefault(i, token.getPronunciation());
                if (pronunciation.equals("*")) {
                    if (containsHan) return null;
                    pronunciation = surface;
                }
                if (reading.length() > 0) {
                    int previous = reading.codePointBefore(reading.length());
                    if ("!?！？。、".indexOf(previous) >= 0
                            || (Character.isLetterOrDigit(previous) && (!previousReading || !joinsPreviousWord(token)))) {
                        reading.append(' ');
                    }
                }
                reading.append(pronunciation);
                previousReading = true;
            }
            if (parts != null) {
                parts.add(new TimedPronunciation.Part(token.getPosition(),
                        token.getPosition() + surface.length(), reading.substring(readingStart)));
            }
        }
        return reading.toString();
    }

    private static Map<Integer, String> contextualVerbReadings(
            Tokenizer tokenizer, String text, List<Token> tokens) {
        StringBuilder expanded = null;
        Map<Integer, Integer> stemsByPosition = new HashMap<>();
        for (int i = 1; i < tokens.size(); i++) {
            Token suffix = tokens.get(i);
            Token stem = tokens.get(i - 1);
            String base = suffix.getBaseForm();
            int suffixStart = suffix.getPosition();
            if (!("てる".equals(base) || "でる".equals(base))
                    || !suffix.getPartOfSpeechLevel2().equals("非自立")
                    || suffix.getSurface().charAt(0) != base.charAt(0)
                    || !stem.getPartOfSpeechLevel1().equals("動詞")
                    || !stem.isKnown()
                    || stem.getPosition() + stem.getSurface().length() != suffixStart) {
                continue;
            }
            // Restoring the elided い lets IPADIC score the preceding verb against ている/でいる.
            if (expanded == null) expanded = new StringBuilder(text);
            int shift = stemsByPosition.size();
            stemsByPosition.put(stem.getPosition() + shift, i - 1);
            expanded.insert(suffixStart + shift + 1, 'い');
        }
        if (expanded == null) return Collections.emptyMap();

        Map<Integer, String> readings = new HashMap<>();
        for (Token candidate : tokenizer.tokenize(expanded.toString())) {
            Integer originalIndex = stemsByPosition.get(candidate.getPosition());
            if (originalIndex != null
                    && candidate.getSurface().equals(tokens.get(originalIndex).getSurface())
                    && candidate.getPartOfSpeechLevel1().equals("動詞")
                    && !candidate.getPronunciation().equals("*")) {
                readings.put(originalIndex, candidate.getPronunciation());
            }
        }
        return readings;
    }

    private static boolean joinsPreviousWord(Token token) {
        String partOfSpeech = token.getPartOfSpeechLevel1();
        String subtype = token.getPartOfSpeechLevel2();
        return partOfSpeech.equals("助動詞")
                || subtype.equals("接続助詞")
                || subtype.equals("接尾")
                || (partOfSpeech.equals("動詞") && subtype.equals("非自立"));
    }

    private static boolean hasHan(String text) {
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            if (Character.UnicodeScript.of(cp) == Character.UnicodeScript.HAN) return true;
            i += Character.charCount(cp);
        }
        return false;
    }

    private static boolean hasKana(String text) {
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            Character.UnicodeScript script = Character.UnicodeScript.of(cp);
            if (script == Character.UnicodeScript.HIRAGANA || script == Character.UnicodeScript.KATAKANA) return true;
            i += Character.charCount(cp);
        }
        return false;
    }

    private static boolean hasNonLatinLetters(String text) {
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            if (Character.isLetter(cp)) {
                Character.UnicodeScript script = Character.UnicodeScript.of(cp);
                if (script != Character.UnicodeScript.LATIN
                        && script != Character.UnicodeScript.COMMON
                        && script != Character.UnicodeScript.INHERITED) {
                    return true;
                }
            }
            i += Character.charCount(cp);
        }
        return false;
    }
}
