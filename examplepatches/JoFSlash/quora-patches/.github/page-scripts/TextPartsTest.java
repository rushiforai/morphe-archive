package app.jofslash.extension.quora;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

/** Checks how TextParts splits long answers for Google Translate. Run by run.sh. */
public final class TextPartsTest {

    private static int failures;

    private static void check(boolean ok, String what) {
        if (!ok) {
            failures++;
            System.err.println("FAIL TextParts: " + what);
        }
    }

    /** Every part fits both limits, and together they hold all the words of the text in order. */
    private static void fits(String name, String text, int expectedParts) {
        List<String> parts = TextParts.split(text);
        if (expectedParts > 0) check(parts.size() == expectedParts, name + ": " + parts.size() + " parts, expected " + expectedParts);
        for (String part : parts) {
            check(part.length() <= TextParts.MAX_CHARS, name + ": a part has " + part.length() + " characters");
            // URLEncoder writes a space as + where the link has %20; count it as 3 like the link does.
            int encoded = URLEncoder.encode(part, StandardCharsets.UTF_8).replace("+", "%20").length();
            check(encoded <= TextParts.MAX_ENCODED, name + ": a part is " + encoded + " characters in the link");
            check(!part.isEmpty() && part.equals(part.trim()), name + ": an empty or untrimmed part");
        }
        // No character is lost or added; only the spaces at the cuts can go.
        String joined = String.join("", parts).replaceAll("\\s+", "");
        check(joined.equals(text.replaceAll("\\s+", "")), name + ": the parts don't add up to the text");
    }

    public static void main(String[] args) {
        fits("short", "A short answer.", 1);
        fits("empty", "   ", 0);

        StringBuilder english = new StringBuilder();
        for (int i = 0; english.length() < 10000; i++) {
            english.append("This is sentence number ").append(i).append(" of a long answer. ");
            if (i % 7 == 6) english.append("\n\n");
        }
        fits("long English", english.toString(), 3);
        // Parts end at a paragraph or a sentence when there is one.
        for (String part : TextParts.split(english.toString())) {
            check(part.endsWith("."), "long English: a part ends mid-sentence: …" + part.substring(part.length() - 20));
        }

        StringBuilder cyrillic = new StringBuilder();
        while (cyrillic.length() < 5000) cyrillic.append("Это предложение на русском языке. ");
        // 5000 Cyrillic letters are about 27000 characters in a link, so more than the two parts by length.
        fits("Cyrillic", cyrillic.toString(), 0);
        check(TextParts.split(cyrillic.toString()).size() >= 3, "Cyrillic: split by link length too");

        StringBuilder emoji = new StringBuilder();
        while (emoji.length() < 9000) emoji.append("😀");
        fits("emoji without spaces", emoji.toString(), 0);
        for (String part : TextParts.split(emoji.toString())) {
            check(!Character.isLowSurrogate(part.charAt(0)), "emoji: a part starts inside a surrogate pair");
        }

        StringBuilder word = new StringBuilder();
        while (word.length() < 12000) word.append('x');
        fits("one long word", word.toString(), 3);

        System.out.println("TextParts: " + (failures == 0 ? "ok" : failures + " failure(s)"));
        if (failures > 0) System.exit(1);
    }
}
