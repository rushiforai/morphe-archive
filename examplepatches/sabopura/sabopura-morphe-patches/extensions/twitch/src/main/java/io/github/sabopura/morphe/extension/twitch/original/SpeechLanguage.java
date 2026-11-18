package io.github.sabopura.morphe.extension.twitch.original;

/** Which voice reads a chat message. Pure Java for tests. */
final class SpeechLanguage {
    static final String AUTO = "auto", DEVICE = "device", JAPANESE = "ja", ENGLISH = "en";

    private SpeechLanguage() {
    }

    /**
     * The language of the voice for {@code text}, or "" for the device's own.
     *
     * @param choice the setting: one of the constants above
     * @param device the device's language code
     * @param latinDevice whether the device's language is written in Latin letters: its voice then
     *                    reads them, while the voice of another script reads them badly and English does
     * @param before the answer for the message read before this one, kept when this one names no language
     */
    static String of(String choice, String text, String device, boolean latinDevice, String before) {
        String language = named(choice, text, device, latinDevice, before);
        // The device's own language goes by "": asked for by name, the engine would load the same voice again.
        return language.equals(device) ? "" : language;
    }

    private static String named(String choice, String text, String device, boolean latinDevice, String before) {
        if (JAPANESE.equals(choice) || ENGLISH.equals(choice)) return choice;
        if (!AUTO.equals(choice) || text == null) return "";
        boolean han = false, hangul = false, latin = false, laugh = false;
        for (int i = 0; i < text.length(); ) {
            int point = text.codePointAt(i);
            i += Character.charCount(point);
            if (!Character.isLetter(point)) continue;
            Character.UnicodeScript script = Character.UnicodeScript.of(point);
            // Kana settles it: a Japanese message may hold Latin words and emote names as well.
            if (script == Character.UnicodeScript.HIRAGANA || script == Character.UnicodeScript.KATAKANA) return JAPANESE;
            if (script == Character.UnicodeScript.HAN) han = true;
            else if (script == Character.UnicodeScript.HANGUL) hangul = true;
            // "www" is how Japanese chat laughs, in either width of the letter: it names no language.
            else if (script == Character.UnicodeScript.LATIN && "wWｗＷ".indexOf(point) >= 0) laugh = true;
            else if (script == Character.UnicodeScript.LATIN) latin = true;
        }
        if (han) return "zh".equals(device) ? "zh" : JAPANESE;
        if (hangul) return "ko";
        if (latin) return latinDevice ? "" : ENGLISH;
        // Laughter and applause alone are Japanese on a Japanese device, whatever was read before them.
        if (JAPANESE.equals(device) && (laugh || text.contains("888") || text.contains("８８８"))) return JAPANESE;
        // Digits and punctuation: read on in the voice the chat is being read in.
        return before;
    }

    /** Whether the words the reader adds (the sender's comma, "link") are Japanese for this voice. */
    static boolean japanese(String language, String device) {
        return JAPANESE.equals(language.isEmpty() ? device : language);
    }
}
