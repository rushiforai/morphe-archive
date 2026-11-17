// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.backup;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * The YAML of a settings file: comments, top-level scalars, and maps of one level under a top-level key. Values are
 * what SharedPreferences holds: booleans and ints as YAML writes them, longs tagged {@code !long}, floats tagged
 * {@code !float}, strings double-quoted and string sets tagged {@code !set} as a flow sequence. Reading also takes plain
 * and single-quoted strings, untagged numbers and untagged flow sequences, for files edited by hand.
 */
public final class SettingsYaml {
    private static final Pattern PLAIN_KEY = Pattern.compile("[A-Za-z_][A-Za-z0-9_.\\-]*");
    private static final Pattern INTEGER = Pattern.compile("[-+]?[0-9]+");
    private static final Pattern DECIMAL =
            Pattern.compile("[-+]?([0-9]+\\.[0-9]*|\\.[0-9]+)([eE][-+]?[0-9]+)?|[-+]?[0-9]+[eE][-+]?[0-9]+");
    private static final Set<String> RESERVED =
            new HashSet<>(Arrays.asList("true", "false", "yes", "no", "on", "off", "null", "y", "n"));

    /** A line of a settings file that can't be read, numbered from 1. */
    public static final class SettingsYamlException extends Exception {
        public final int line;

        SettingsYamlException(int line, String message) {
            super(message);
            this.line = line;
        }
    }

    /** What a file holds: its top-level scalars and its maps. */
    public static final class Document {
        public final Map<String, Object> scalars = new LinkedHashMap<>();
        public final Map<String, Map<String, Object>> maps = new LinkedHashMap<>();
    }

    private SettingsYaml() {
    }

    /** The file: {@code comments} first, then the scalars, then each map. */
    public static String write(List<String> comments, Document document) {
        StringBuilder out = new StringBuilder();
        for (String comment : comments) out.append("# ").append(comment).append('\n');
        for (Map.Entry<String, Object> entry : document.scalars.entrySet()) {
            out.append(key(entry.getKey())).append(": ").append(value(entry.getValue())).append('\n');
        }
        for (Map.Entry<String, Map<String, Object>> map : document.maps.entrySet()) {
            out.append(key(map.getKey())).append(':');
            if (map.getValue().isEmpty()) out.append(" {}");
            out.append('\n');
            for (Map.Entry<String, Object> entry : map.getValue().entrySet()) {
                out.append("  ").append(key(entry.getKey())).append(": ").append(value(entry.getValue())).append('\n');
            }
        }
        return out.toString();
    }

    /** The top-level scalars and maps of {@code text}. An empty map reads as an empty map. */
    public static Document read(String text) throws SettingsYamlException {
        Document document = new Document();
        Map<String, Object> current = null;
        if (text.startsWith("\uFEFF")) text = text.substring(1);
        String[] lines = text.split("\r?\n|\r", -1);
        for (int index = 0; index < lines.length; index++) {
            int number = index + 1;
            String line = stripEnd(lines[index]);
            String content = line.trim();
            if (content.isEmpty() || content.startsWith("#")) continue;
            if (content.equals("---") || content.equals("...")) continue;
            int indent = line.indexOf(content);
            if (line.substring(0, indent).indexOf('\t') >= 0) {
                throw new SettingsYamlException(number, "tabs can't indent YAML");
            }
            Parser parser = new Parser(content, number);
            String key = parser.key();
            if (indent == 0) {
                current = null;
                if (parser.atEnd()) {
                    current = new LinkedHashMap<>();
                    document.maps.put(key, current);
                } else if (parser.rest().equals("{}")) {
                    document.maps.put(key, new LinkedHashMap<>());
                } else {
                    Object value = parser.value();
                    if (value != null) document.scalars.put(key, value);
                }
            } else {
                if (current == null) throw new SettingsYamlException(number, "indented line outside a map");
                if (parser.atEnd()) throw new SettingsYamlException(number, key + " has no value");
                Object value = parser.value();
                if (value != null) current.put(key, value);
            }
        }
        return document;
    }

    private static String stripEnd(String text) {
        int end = text.length();
        while (end > 0 && Character.isWhitespace(text.charAt(end - 1))) end--;
        return text.substring(0, end);
    }

    private static String key(String key) {
        return PLAIN_KEY.matcher(key).matches() && !RESERVED.contains(key.toLowerCase(Locale.ROOT)) ? key : quote(key);
    }

    private static String value(Object value) {
        if (value instanceof Boolean || value instanceof Integer) return value.toString();
        if (value instanceof Long) return "!long " + value;
        if (value instanceof Float) return "!float " + value;
        if (value instanceof Set) {
            List<String> items = new ArrayList<>();
            for (Object item : (Set<?>) value) items.add(String.valueOf(item));
            Collections.sort(items);
            StringBuilder out = new StringBuilder("!set [");
            for (int i = 0; i < items.size(); i++) {
                if (i > 0) out.append(", ");
                out.append(quote(items.get(i)));
            }
            return out.append(']').toString();
        }
        return quote(String.valueOf(value));
    }

    private static String quote(String text) {
        StringBuilder out = new StringBuilder("\"");
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '"') out.append("\\\"");
            else if (c == '\\') out.append("\\\\");
            else if (c == '\n') out.append("\\n");
            else if (c == '\r') out.append("\\r");
            else if (c == '\t') out.append("\\t");
            else if (c < ' ' || (c >= '\u007f' && c <= '\u009f') || c == '\u2028' || c == '\u2029' || c == '\uFEFF') {
                out.append(String.format(Locale.ROOT, "\\u%04x", (int) c));
            } else out.append(c);
        }
        return out.append('"').toString();
    }

    private static final class Parser {
        private final String text;
        private final int line;
        private int at;

        Parser(String text, int line) {
            this.text = text;
            this.line = line;
        }

        boolean atEnd() {
            skipSpaces();
            return at >= text.length() || text.charAt(at) == '#';
        }

        String rest() {
            String rest = text.substring(at);
            int comment = rest.indexOf(" #");
            return (comment >= 0 ? rest.substring(0, comment) : rest).trim();
        }

        String key() throws SettingsYamlException {
            String key;
            if (peek() == '"') key = doubleQuoted();
            else if (peek() == '\'') key = singleQuoted();
            else {
                int start = at;
                while (at < text.length() && !(text.charAt(at) == ':' && isSpaceOrEnd(at + 1))) at++;
                key = text.substring(start, at).trim();
            }
            skipSpaces();
            if (peek() != ':') throw fail("a key must end with \":\"");
            at++;
            if (!isSpaceOrEnd(at)) throw fail("\":\" must be followed by a space");
            if (key.isEmpty()) throw fail("empty key");
            return key;
        }

        /** The value, or null for {@code null} and {@code ~}. */
        Object value() throws SettingsYamlException {
            skipSpaces();
            Object value;
            if (text.startsWith("!long ", at)) {
                at += 6;
                String plain = plain();
                try {
                    value = Long.parseLong(stripPlus(plain));
                } catch (NumberFormatException ex) {
                    throw fail("not a whole number: " + plain);
                }
            } else if (text.startsWith("!float ", at)) {
                at += 7;
                String plain = plain();
                try {
                    value = Float.parseFloat(plain);
                } catch (NumberFormatException ex) {
                    throw fail("not a number: " + plain);
                }
            } else if (text.startsWith("!set ", at)) {
                at += 5;
                skipSpaces();
                value = sequence();
            } else if (peek() == '[') {
                value = sequence();
            } else if (peek() == '"') {
                value = doubleQuoted();
            } else if (peek() == '\'') {
                value = singleQuoted();
            } else if (peek() == '!') {
                throw fail("unknown tag: " + plain());
            } else {
                value = scalar(plain());
            }
            if (!atEnd()) throw fail("unexpected text after the value: " + text.substring(at));
            return value;
        }

        private static Object scalar(String plain) {
            if (plain.equals("~") || plain.equalsIgnoreCase("null")) return null;
            if (plain.equalsIgnoreCase("true")) return Boolean.TRUE;
            if (plain.equalsIgnoreCase("false")) return Boolean.FALSE;
            if (INTEGER.matcher(plain).matches()) {
                String digits = stripPlus(plain);
                try {
                    return Integer.parseInt(digits);
                } catch (NumberFormatException ex) {
                    try {
                        return Long.parseLong(digits);
                    } catch (NumberFormatException tooBig) {
                        return plain;
                    }
                }
            }
            if (DECIMAL.matcher(plain).matches()) return Float.parseFloat(plain);
            return plain;
        }

        private static String stripPlus(String number) {
            return number.startsWith("+") ? number.substring(1) : number;
        }

        private Set<String> sequence() throws SettingsYamlException {
            if (peek() != '[') throw fail("!set needs a [ ] list");
            at++;
            Set<String> items = new LinkedHashSet<>();
            skipSpaces();
            if (peek() == ']') {
                at++;
                return items;
            }
            while (true) {
                skipSpaces();
                String item;
                if (peek() == '"') item = doubleQuoted();
                else if (peek() == '\'') item = singleQuoted();
                else {
                    int start = at;
                    while (at < text.length() && text.charAt(at) != ',' && text.charAt(at) != ']') at++;
                    item = text.substring(start, at).trim();
                }
                items.add(item);
                skipSpaces();
                if (peek() == ',') {
                    at++;
                } else if (peek() == ']') {
                    at++;
                    return items;
                } else {
                    throw fail("a list item must be followed by \",\" or \"]\"");
                }
            }
        }

        private String plain() {
            int start = at;
            while (at < text.length() && !(text.charAt(at) == '#' && at > start && text.charAt(at - 1) == ' ')) at++;
            return text.substring(start, at).trim();
        }

        private String doubleQuoted() throws SettingsYamlException {
            at++;
            StringBuilder out = new StringBuilder();
            while (true) {
                if (at >= text.length()) throw fail("a string has no closing \"");
                char c = text.charAt(at++);
                if (c == '"') return out.toString();
                if (c != '\\') {
                    out.append(c);
                    continue;
                }
                if (at >= text.length()) throw fail("a string has no closing \"");
                char escape = text.charAt(at++);
                switch (escape) {
                    case 'n': out.append('\n'); break;
                    case 'r': out.append('\r'); break;
                    case 't': out.append('\t'); break;
                    case '0': out.append('\u0000'); break;
                    case '"':
                    case '\\':
                    case '/':
                    case ' ': out.append(escape); break;
                    case 'x': out.appendCodePoint(hex(2)); break;
                    case 'u': out.appendCodePoint(hex(4)); break;
                    case 'U': out.appendCodePoint(hex(8)); break;
                    default: throw fail("unknown escape: \\" + escape);
                }
            }
        }

        private int hex(int digits) throws SettingsYamlException {
            if (at + digits > text.length()) throw fail("an escape needs " + digits + " hex digits");
            int code;
            try {
                code = Integer.parseInt(text.substring(at, at + digits), 16);
            } catch (NumberFormatException ex) {
                throw fail("an escape needs hex digits");
            }
            if (!Character.isValidCodePoint(code)) throw fail("an escape needs hex digits");
            at += digits;
            return code;
        }

        private String singleQuoted() throws SettingsYamlException {
            at++;
            StringBuilder out = new StringBuilder();
            while (true) {
                if (at >= text.length()) throw fail("a string has no closing '");
                char c = text.charAt(at++);
                if (c != '\'') {
                    out.append(c);
                } else if (peek() == '\'') {
                    out.append('\'');
                    at++;
                } else {
                    return out.toString();
                }
            }
        }

        private char peek() {
            return at < text.length() ? text.charAt(at) : '\0';
        }

        private boolean isSpaceOrEnd(int index) {
            return index >= text.length() || text.charAt(index) == ' ';
        }

        private void skipSpaces() {
            while (at < text.length() && text.charAt(at) == ' ') at++;
        }

        private SettingsYamlException fail(String message) {
            return new SettingsYamlException(line, message);
        }
    }
}
