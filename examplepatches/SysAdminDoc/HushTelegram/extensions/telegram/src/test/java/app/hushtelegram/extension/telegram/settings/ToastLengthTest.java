/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Android cuts a text toast from an app aimed at Android 12 or later at two lines, about 64
 * English characters on a Samsung S22. Anything past that is lost, so every toast text is read
 * out of the sources and held to that length.
 */
public class ToastLengthTest {
    private static final int ENGLISH_LIMIT = 64;
    // Translations run longer than English. This catches the ones that run far longer.
    private static final int TRANSLATION_LIMIT = 80;
    private static final String[] LANGUAGES = {"bg", "de", "es", "in", "pt-rBR", "tr"};

    // ChatTypeFolders.switchBack hands its text back to be shown, as the folder switch's toast.
    private static final Pattern TOAST_CALL = Pattern.compile("\\b(?:showToastShort|showToastLong|watch|makeText|switchBack)\\(");
    // Texts that reach a toast through a variable of this name.
    private static final Pattern TOAST_VARIABLE = Pattern.compile("\\b(?:said|refused|done)\\s*=(?!=)");
    // Methods that build a toast text and hand it back.
    private static final Pattern TOAST_BUILDER = Pattern.compile(
            "\\b(?:static|public|protected|private)\\s+(?:static\\s+)?[\\w<>.\\[\\]]+\\s+"
                    + "(?:refusal|importedMessage|clearedMessage|preferenceChangeRecoveredMessage"
                    + "|preferenceChangeRecoveryFailedMessage|write|note)\\s*\\([^)]*\\)[^{;]*\\{");
    private static final Pattern L10N_CALL = Pattern.compile("L10n\\s*\\.\\s*(t|f|quantity)\\s*\\(");
    private static final Pattern LITERAL_RUN = Pattern.compile(
            "\"(?:[^\"\\\\]|\\\\.)*\"(?:\\s*\\+\\s*\"(?:[^\"\\\\]|\\\\.)*\")*");
    private static final Pattern LITERAL = Pattern.compile("\"((?:[^\"\\\\]|\\\\.)*)\"");
    private static final Pattern PLACEHOLDER = Pattern.compile("%(?:\\d+\\$)?[a-zA-Z]");

    /** One toast text and the source file it came from. */
    private static final class Found {
        final String english;
        final String file;

        Found(String english, String file) {
            this.english = english;
            this.file = file;
        }
    }

    @Test
    public void eachToastFitsTwoLines() throws IOException {
        List<Found> found = toastTexts();
        List<String> tooLong = new ArrayList<>();
        for (Found toast : found) {
            int length = fixedLength(toast.english);
            if (length > ENGLISH_LIMIT) {
                tooLong.add(toast.file + ": \"" + toast.english + "\" is " + length + " characters, over " + ENGLISH_LIMIT);
            }
        }
        assertEquals("toasts past two lines:\n" + String.join("\n", tooLong), 0, tooLong.size());
    }

    @Test
    public void eachToastTranslationStaysShort() throws IOException {
        Map<String, Map<String, String>> tables = new LinkedHashMap<>();
        for (String language : LANGUAGES) tables.put(language, table(language));
        List<String> tooLong = new ArrayList<>();
        for (Found toast : toastTexts()) {
            for (String language : LANGUAGES) {
                String translated = tables.get(language).get(toast.english);
                // L10nCatalogTest holds each table to the code's English, so a missing row fails there.
                if (translated == null) continue;
                int length = fixedLength(translated);
                if (length > TRANSLATION_LIMIT) {
                    tooLong.add(language + ".tsv: \"" + toast.english + "\" (" + toast.file + ") translates to "
                            + length + " characters, over " + TRANSLATION_LIMIT);
                }
            }
        }
        assertEquals("translated toasts past two lines:\n" + String.join("\n", tooLong), 0, tooLong.size());
    }

    @Test
    public void theScanFindsTheToastsItChecks() throws IOException {
        List<String> texts = toastTexts().stream().map(t -> t.english).collect(Collectors.toList());
        // A scan that quietly found nothing would pass every other test here.
        assertTrue("found " + texts.size(), texts.size() >= 40);
        assertTrue(texts.contains("Filters saved."));
        assertTrue(texts.contains("Can't open the link. Go to %1$s."));
        assertTrue(texts.contains("That app is slow to answer. Nothing was changed. Try again."));
        // Toast.makeText straight from a hook, and a text handed to it through a variable.
        assertTrue(texts.contains("Photo copied"));
        assertTrue(texts.contains("Forwarding to %1$s"));
        // The folder switch's texts, put back with the switch and said once Telegram answers.
        assertTrue(texts.contains("Sign in to Telegram first."));
        assertTrue(texts.contains("Telegram turned the folders down. Try again later."));
        assertTrue(texts.contains("Asking Telegram to make your folders."));
        // The settings lock's refusal, built by SettingsLock.note and shown by refuses().
        assertTrue(texts.contains("Settings are locked. Tap Start unlock, then wait 24 hours."));
    }

    private static int fixedLength(String text) {
        return PLACEHOLDER.matcher(text).replaceAll("").length();
    }

    private static List<Found> toastTexts() throws IOException {
        List<Found> found = new ArrayList<>();
        for (Path root : new Path[]{
                repositoryFile("extensions/telegram/src/main/java").toPath(),
                repositoryFile("extensions/shared/library/src/main/java").toPath()}) {
            List<Path> sources;
            try (Stream<Path> walk = Files.walk(root)) {
                sources = walk.filter(p -> p.toString().endsWith(".java")).sorted().collect(Collectors.toList());
            }
            for (Path source : sources) {
                String name = source.getFileName().toString();
                if (name.equals("Utils.java")) continue;
                String text = new String(Files.readAllBytes(source), StandardCharsets.UTF_8);
                scan(text, TOAST_CALL, name, found);
                scan(text, TOAST_VARIABLE, name, found);
                Matcher builder = TOAST_BUILDER.matcher(text);
                while (builder.find()) addTexts(text.substring(builder.end(), closingBrace(text, builder.end())), name, found);
            }
        }
        return found;
    }

    /** Reads each match's argument (or right-hand side) up to where it ends and keeps its L10n texts. */
    private static void scan(String text, Pattern start, String file, List<Found> into) {
        Matcher m = start.matcher(text);
        while (m.find()) addTexts(text.substring(m.end(), expressionEnd(text, m.end())), file, into);
    }

    private static void addTexts(String expression, String file, List<Found> into) {
        Matcher call = L10N_CALL.matcher(expression);
        while (call.find()) {
            Matcher run = LITERAL_RUN.matcher(expression);
            // The text is the first quoted run after the call's opening paren, or the first two for quantity.
            int from = call.end();
            int wanted = call.group(1).equals("quantity") ? 2 : 1;
            while (wanted > 0 && run.find(from)) {
                String between = expression.substring(from, run.start());
                // Only a leading argument like a context may sit between the paren and the text.
                if (!between.matches("(?s)[\\s,]*(?:[A-Za-z_][\\w.]*[\\s,]+)?")) break;
                into.add(new Found(unescape(joined(run.group())), file));
                from = run.end();
                wanted--;
            }
        }
    }

    private static String joined(String run) {
        Matcher part = LITERAL.matcher(run);
        StringBuilder out = new StringBuilder();
        while (part.find()) out.append(part.group(1));
        return out.toString();
    }

    private static String unescape(String literal) {
        return literal.replace("\\\"", "\"").replace("\\'", "'").replace("\\\\", "\\");
    }

    /** The index of the bracket that closes the one just before [from], or of the statement's semicolon. */
    private static int expressionEnd(String text, int from) {
        int depth = 0;
        boolean quoted = false;
        for (int i = from; i < text.length(); i++) {
            char c = text.charAt(i);
            if (quoted) {
                if (c == '\\') i++;
                else if (c == '"') quoted = false;
            } else if (c == '"') {
                quoted = true;
            } else if (c == '(' || c == '{') {
                depth++;
            } else if (c == ')' || c == '}') {
                if (depth == 0) return i;
                depth--;
            } else if (c == ';' && depth == 0) {
                return i;
            }
        }
        return text.length();
    }

    private static int closingBrace(String text, int from) {
        int depth = 1;
        boolean quoted = false;
        for (int i = from; i < text.length(); i++) {
            char c = text.charAt(i);
            if (quoted) {
                if (c == '\\') i++;
                else if (c == '"') quoted = false;
            } else if (c == '"') {
                quoted = true;
            } else if (c == '{') {
                depth++;
            } else if (c == '}' && --depth == 0) {
                return i;
            }
        }
        return text.length();
    }

    private static Map<String, String> table(String language) throws IOException {
        File file = repositoryFile("extensions/shared/library/src/main/l10n/" + language + ".tsv");
        Map<String, String> rows = new LinkedHashMap<>();
        for (String line : Files.readAllLines(file.toPath(), StandardCharsets.UTF_8)) {
            int tab = line.indexOf('\t');
            if (line.startsWith("#") || tab < 0) continue;
            rows.put(line.substring(0, tab), line.substring(tab + 1));
        }
        return rows;
    }

    private static File repositoryFile(String name) {
        File dir = new File("").getAbsoluteFile();
        while (dir != null && !new File(dir, "settings.gradle.kts").isFile()) dir = dir.getParentFile();
        if (dir == null) throw new IllegalStateException("No repository root above " + new File("").getAbsolutePath());
        return new File(dir, name);
    }
}
