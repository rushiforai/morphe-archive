package dev.utaa.linimal.extension.i18n;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 翻訳表の網羅性の検証です。
 *
 * <p>extension のソースに書いた日本語の文字列（{@code +} でつないだものは 1 つとして扱います）が、
 * すべての言語の表にあることを確かめます。日本語の文言を足したのに訳を足し忘れると、その言語では
 * 英語や日本語の原文が出てしまうためです。</p>
 */
public final class LinimalTranslationsTest {
    private static final Path SOURCES = Paths.get("src/main/java");
    private static final Pattern JAPANESE = Pattern.compile("[\\u3040-\\u30ff\\u4e00-\\u9fff]");
    private static final Pattern FORMAT = Pattern.compile("%[sd%]");
    private static final LinimalText.Language[] TRANSLATED = {
            LinimalText.Language.ENGLISH,
            LinimalText.Language.TRADITIONAL_CHINESE,
            LinimalText.Language.THAI,
            LinimalText.Language.INDONESIAN,
    };

    @Test
    public void everyJapaneseStringInTheSourcesIsTranslatedForEveryLanguage() throws IOException {
        Set<String> keys = japaneseStringsInSources();
        assertTrue("ソースから日本語の文言を読み取れませんでした。", keys.size() > 50);
        for (LinimalText.Language language : TRANSLATED) {
            Set<String> missing = new TreeSet<>(keys);
            missing.removeAll(LinimalText.tableForTesting(language).keySet());
            assertEquals(language + " の訳がありません: " + missing, 0, missing.size());
        }
    }

    @Test
    public void everyTableHasTheSameKeys() {
        Set<String> english = LinimalText.tableForTesting(LinimalText.Language.ENGLISH).keySet();
        for (LinimalText.Language language : TRANSLATED) {
            assertEquals(language.toString(), new TreeSet<>(english),
                    new TreeSet<>(LinimalText.tableForTesting(language).keySet()));
        }
    }

    /** 表だけに残った原文は、ソースから消えた文言です。 */
    @Test
    public void tablesHaveNoUnusedKeys() throws IOException {
        Set<String> unused = new TreeSet<>(LinimalText.tableForTesting(LinimalText.Language.ENGLISH).keySet());
        unused.removeAll(japaneseStringsInSources());
        assertEquals("使われていない訳: " + unused, 0, unused.size());
    }

    @Test
    public void translationsKeepFormatSpecifiersAndLineBreaks() {
        for (LinimalText.Language language : TRANSLATED) {
            for (Map.Entry<String, String> entry : LinimalText.tableForTesting(language).entrySet()) {
                String original = entry.getKey();
                String translated = entry.getValue();
                assertFalse(language + ": " + original, translated.trim().isEmpty());
                assertEquals(language + ": " + original, specifiers(original), specifiers(translated));
                assertEquals(language + ": " + original, count(original, '\n'), count(translated, '\n'));
                if (language != LinimalText.Language.TRADITIONAL_CHINESE) {
                    assertFalse(language + " に日本語が残っています: " + translated,
                            JAPANESE.matcher(translated).find());
                }
            }
        }
    }

    private static List<String> specifiers(String text) {
        List<String> found = new ArrayList<>();
        Matcher matcher = FORMAT.matcher(text);
        while (matcher.find()) {
            found.add(matcher.group());
        }
        return found;
    }

    private static int count(String text, char c) {
        int count = 0;
        for (int i = 0; i < text.length(); i++) {
            if (text.charAt(i) == c) {
                count++;
            }
        }
        return count;
    }

    static Set<String> japaneseStringsInSources() throws IOException {
        Set<String> keys = new LinkedHashSet<>();
        List<Path> files;
        try (Stream<Path> walk = Files.walk(SOURCES)) {
            files = walk.filter(path -> path.toString().endsWith(".java"))
                    .filter(path -> !path.getFileName().toString().equals("LinimalTranslations.java"))
                    .sorted()
                    .collect(Collectors.toList());
        }
        for (Path file : files) {
            String source = new String(Files.readAllBytes(file), StandardCharsets.UTF_8);
            for (String value : stringChains(stripComments(source))) {
                if (JAPANESE.matcher(value).find()) {
                    keys.add(value);
                }
            }
        }
        return keys;
    }

    /** コメントを除きます。文字列と文字のリテラルはそのまま残します。 */
    private static String stripComments(String source) {
        StringBuilder out = new StringBuilder();
        int i = 0;
        while (i < source.length()) {
            if (source.startsWith("//", i)) {
                int end = source.indexOf('\n', i);
                i = end < 0 ? source.length() : end;
            } else if (source.startsWith("/*", i)) {
                int end = source.indexOf("*/", i);
                i = end < 0 ? source.length() : end + 2;
            } else if (source.charAt(i) == '"' || source.charAt(i) == '\'') {
                char quote = source.charAt(i);
                int j = i + 1;
                while (j < source.length() && source.charAt(j) != quote) {
                    j += source.charAt(j) == '\\' ? 2 : 1;
                }
                out.append(source, i, Math.min(j + 1, source.length()));
                i = j + 1;
            } else {
                out.append(source.charAt(i++));
            }
        }
        return out.toString();
    }

    /** {@code "a" + "b"} のように連結したリテラルを 1 つの値にします。 */
    private static List<String> stringChains(String source) {
        String literal = "\"(?:[^\"\\\\\\n]|\\\\.)*\"";
        Pattern chain = Pattern.compile(literal + "(?:\\s*\\+\\s*" + literal + ")*");
        Pattern single = Pattern.compile(literal);
        List<String> values = new ArrayList<>();
        Matcher matcher = chain.matcher(source);
        while (matcher.find()) {
            StringBuilder value = new StringBuilder();
            Matcher part = single.matcher(matcher.group());
            while (part.find()) {
                String text = part.group();
                value.append(unescape(text.substring(1, text.length() - 1)));
            }
            values.add(value.toString());
        }
        return values;
    }

    private static String unescape(String text) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c != '\\' || i + 1 >= text.length()) {
                out.append(c);
                continue;
            }
            char next = text.charAt(++i);
            switch (next) {
                case 'n':
                    out.append('\n');
                    break;
                case 't':
                    out.append('\t');
                    break;
                case 'u':
                    out.append((char) Integer.parseInt(text.substring(i + 1, i + 5), 16));
                    i += 4;
                    break;
                default:
                    out.append(next);
            }
        }
        return out.toString();
    }
}
