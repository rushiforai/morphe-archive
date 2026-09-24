package app.yydarlinker.deepseekcaptions;

import java.util.Locale;

final class SentenceBoundaryUtil {
    private SentenceBoundaryUtil() {}

    static String stripMusicAnnotations(String text) {
        if (text == null) return "";
        return text.replace("[Music]", "")
                .replace("[music]", "")
                .replace("[MUSIC]", "")
                .replace("[音乐]", "")
                .replace("【音乐】", "")
                .replace("（音乐）", "")
                .replace("(Music)", "")
                .replace("(music)", "")
                .replace("♪", "")
                .replace("♫", "")
                .trim();
    }

    static boolean strong(String text, int index) {
        char c = text.charAt(index);
        if (c == '?' || c == '!' || c == '。' || c == '？' || c == '！') return true;
        if (c != '.') return false;
        char before = index > 0 ? text.charAt(index - 1) : 0;
        char after = index + 1 < text.length() ? text.charAt(index + 1) : 0;
        if (Character.isDigit(before) && Character.isDigit(after)) return false;
        if (before == '.' || after == '.') return false;

        int start = index - 1;
        while (start >= 0 && Character.isLetter(text.charAt(start))) start--;
        String word = text.substring(start + 1, index).toLowerCase(Locale.ROOT);
        if (word.equals("mr") || word.equals("mrs") || word.equals("ms") || word.equals("dr") ||
                word.equals("prof") || word.equals("sr") || word.equals("jr") || word.equals("vs") ||
                word.equals("etc") || word.equals("st") || word.equals("no")) {
            return false;
        }
        if (word.length() == 1 && index + 2 < text.length() &&
                Character.isUpperCase(text.charAt(index + 2))) {
            return false;
        }
        return true;
    }

    static boolean weak(char c) {
        return c == ',' || c == ';' || c == ':' || c == '，' || c == '；' || c == '：' ||
                c == '—' || c == '–';
    }

    static boolean closer(char c) {
        return c == '"' || c == '\'' || c == '”' || c == '’' || c == ')' || c == '）' ||
                c == ']' || c == '】' || c == '》' || c == '」' || c == '』';
    }

    static boolean needsSpace(String left, String right) {
        if (left == null || right == null || left.isEmpty() || right.isEmpty()) return false;
        char a = left.charAt(left.length() - 1);
        char b = right.charAt(0);
        return latinLike(a) && latinLike(b);
    }

    static boolean tiny(String text) {
        if (text == null) return true;
        String clean = text.trim();
        int cjk = 0;
        int words = 0;
        boolean inWord = false;
        for (int i = 0; i < clean.length(); i++) {
            char c = clean.charAt(i);
            Character.UnicodeScript script = Character.UnicodeScript.of(c);
            if (script == Character.UnicodeScript.HAN || script == Character.UnicodeScript.HIRAGANA ||
                    script == Character.UnicodeScript.KATAKANA || script == Character.UnicodeScript.HANGUL) {
                cjk++;
            }
            if (Character.isLetterOrDigit(c)) {
                if (!inWord) words++;
                inWord = true;
            } else {
                inWord = false;
            }
        }
        if (cjk > 0) return cjk < 4;
        return words < 2;
    }

    static boolean startsClause(String text) {
        if (text == null) return false;
        String clean = text.trim();
        String lower = clean.toLowerCase(Locale.ROOT);
        return lower.startsWith("but ") || lower.startsWith("however ") ||
                lower.startsWith("because ") || lower.startsWith("so ") ||
                lower.startsWith("and ") || lower.startsWith("while ") ||
                clean.startsWith("但是") || clean.startsWith("不过") || clean.startsWith("然而") ||
                clean.startsWith("所以") || clean.startsWith("因为") || clean.startsWith("而且");
    }

    private static boolean latinLike(char c) {
        return c < 128 && (Character.isLetterOrDigit(c) || c == '\'' || c == '"');
    }
}
