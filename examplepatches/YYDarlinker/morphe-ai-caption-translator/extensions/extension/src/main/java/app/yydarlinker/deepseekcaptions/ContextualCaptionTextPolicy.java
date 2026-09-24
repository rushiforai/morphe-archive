package app.yydarlinker.deepseekcaptions;

import java.util.Locale;

/** Deterministic quality gates for Contextual Unit source and translated text. */
final class ContextualCaptionTextPolicy {
    private static final String[] NON_SPEECH_MARKERS = {
            "music", "applause", "laughter", "laughing", "laughs", "chuckles",
            "cheering", "sighs", "sighing", "clears throat", "throat clearing",
            "coughs", "coughing", "inaudible", "noise", "background noise",
            "singing", "instrumental",
            "音乐", "乐曲", "掌声", "笑声", "大笑", "欢呼", "叹气", "叹息",
            "清嗓", "清喉咙", "咳嗽", "听不清", "噪声", "背景音", "歌声"
    };

    private ContextualCaptionTextPolicy() {}

    static String sourceForTranslation(String value) {
        return sanitize(value, false);
    }

    static String translationForDisplay(String value) {
        return sanitize(value, true);
    }

    static boolean suppressWithoutTranslation(String source) {
        String raw = normalize(source);
        return !raw.isEmpty() && sourceForTranslation(raw).isEmpty();
    }

    static boolean adequateTranslation(String source, String translated) {
        String cleanSource = sourceForTranslation(source);
        String cleanTarget = translationForDisplay(translated);
        if (cleanSource.isEmpty()) return cleanTarget.isEmpty();
        if (cleanTarget.isEmpty() || looksLikeProtocolLeak(cleanTarget)) return false;

        int sourceInformation = informationCharacters(cleanSource);
        int targetInformation = informationCharacters(cleanTarget);
        int sourceWords = latinWordCount(cleanSource);

        // Reject only extreme collapses. Short utterances such as "hot" -> "热" and
        // "yes" -> "是" remain valid, while "give me something" -> "热" does not.
        if (sourceWords >= 3 && sourceInformation >= 10 && targetInformation <= 1) return false;
        return sourceWords < 6 || sourceInformation < 24 || targetInformation > 2;
    }

    /**
     * Detect a transport/display bridge that repeats only material already present in the
     * immediately preceding source unit. The caller additionally enforces timing/cue adjacency.
     */
    static boolean redundantBridge(String previousSource, String currentSource) {
        String previous = canonicalLexical(previousSource);
        String current = canonicalLexical(currentSource);
        if (previous.length() < 4 || current.length() < 4) return false;
        if (previous.equals(current)) return true;
        return current.length() >= 8 &&
                current.length() * 100 >= previous.length() * 55 &&
                previous.contains(current);
    }

    private static String sanitize(String value, boolean translatedOutput) {
        String text = stripSpeakerArrows(normalize(value))
                .replace(">>", "")
                .replace("♪", "")
                .replace("♫", "")
                .trim();
        if (text.isEmpty()) return "";

        StringBuilder out = new StringBuilder(text.length());
        int index = 0;
        while (index < text.length()) {
            char open = text.charAt(index);
            char close = matchingClose(open);
            if (close != 0) {
                int end = text.indexOf(close, index + 1);
                if (end > index && end - index <= 48) {
                    String content = text.substring(index + 1, end).trim();
                    boolean edgeAnnotation = onlyDecorationBefore(text, index) ||
                            onlyDecorationAfter(text, end + 1);
                    boolean square = open == '[' || open == '【';
                    if (knownNonSpeech(content) ||
                            square && edgeAnnotation && !containsDigit(content)) {
                        index = end + 1;
                        continue;
                    }
                }
            }
            out.append(open);
            index++;
        }

        String clean = stripSpeakerArrows(out.toString()).trim();
        if (translatedOutput && isDecorationOnly(clean)) return "";
        return clean;
    }

    private static String normalize(String value) {
        return value == null ? "" : value.replace('［','[').replace('］',']').replace('\u00a0', ' ').replace("\r", "").trim();
    }

    private static String stripSpeakerArrows(String value) {
        if (value == null || value.isEmpty()) return "";
        StringBuilder out = new StringBuilder(value.length());
        boolean lineStart = true;
        int index = 0;
        while (index < value.length()) {
            char c = value.charAt(index);
            if (lineStart) {
                while (index < value.length() && Character.isWhitespace(value.charAt(index)) &&
                        value.charAt(index) != '\n') index++;
                int arrows = index;
                while (arrows < value.length() && value.charAt(arrows) == '>') arrows++;
                if (arrows > index) {
                    index = arrows;
                    while (index < value.length() && value.charAt(index) == ' ') index++;
                }
                lineStart = false;
                if (index >= value.length()) break;
                c = value.charAt(index);
            }
            out.append(c);
            lineStart = c == '\n';
            index++;
        }
        return out.toString();
    }

    private static char matchingClose(char open) {
        if (open == '[') return ']';
        if (open == '【') return '】';
        if (open == '(') return ')';
        if (open == '（') return '）';
        return 0;
    }

    private static boolean knownNonSpeech(String content) {
        String clean = content == null ? "" : content.toLowerCase(Locale.ROOT)
                .replace(':', ' ').replace('：', ' ').trim();
        for (String marker : NON_SPEECH_MARKERS) {
            if (clean.equals(marker) || clean.startsWith(marker + " ") || clean.endsWith(" " + marker)) {
                return true;
            }
        }
        return false;
    }

    private static boolean onlyDecorationBefore(String value, int endExclusive) {
        for (int i = 0; i < endExclusive; i++) {
            char c = value.charAt(i);
            if (!Character.isWhitespace(c) && ">>-—:：".indexOf(c) < 0) return false;
        }
        return true;
    }

    private static boolean onlyDecorationAfter(String value, int from) {
        for (int i = from; i < value.length(); i++) {
            char c = value.charAt(i);
            if (!Character.isWhitespace(c) && ".,!?;:，。！？；：-—".indexOf(c) < 0) return false;
        }
        return true;
    }

    private static boolean containsDigit(String value) {
        for (int i = 0; i < value.length(); i++) if (Character.isDigit(value.charAt(i))) return true;
        return false;
    }

    private static boolean isDecorationOnly(String value) {
        if (value == null || value.isEmpty()) return true;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (Character.isLetterOrDigit(c) || isCjk(c)) return false;
        }
        return true;
    }

    private static boolean looksLikeProtocolLeak(String value) {
        String lower = value.toLowerCase(Locale.ROOT);
        return lower.startsWith("```") || lower.contains("\"translations\"") ||
                lower.matches("^\\s*\\{\\s*\\\"?id\\\"?\\s*:.*");
    }

    private static int informationCharacters(String value) {
        int count = 0;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (Character.isLetterOrDigit(c) || isCjk(c)) count++;
        }
        return count;
    }

    private static int latinWordCount(String value) {
        int count = 0;
        boolean inWord = false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            boolean lexical = c < 128 && Character.isLetterOrDigit(c);
            if (lexical && !inWord) count++;
            inWord = lexical;
        }
        return count;
    }

    private static String canonicalLexical(String value) {
        String clean = sourceForTranslation(value).toLowerCase(Locale.ROOT);
        StringBuilder out = new StringBuilder(clean.length());
        for (int i = 0; i < clean.length(); i++) {
            char c = clean.charAt(i);
            if (Character.isLetterOrDigit(c) || isCjk(c)) out.append(c);
        }
        return out.toString();
    }

    private static boolean isCjk(char value) {
        Character.UnicodeScript script = Character.UnicodeScript.of(value);
        return script == Character.UnicodeScript.HAN ||
                script == Character.UnicodeScript.HIRAGANA ||
                script == Character.UnicodeScript.KATAKANA ||
                script == Character.UnicodeScript.HANGUL;
    }
}
