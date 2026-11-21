/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.downloads;

import java.text.Normalizer;
import java.util.Locale;
import java.util.Set;

final class ExportNames {
    // Allow room for provider-added suffixes on file systems that limit names by bytes, not characters.
    private static final int MAX_BYTES = 180;

    private ExportNames() {}

    static String unused(String displayName, boolean directory, Set<String> taken) {
        String name = sanitize(displayName);
        int dot = name.lastIndexOf('.');
        boolean hasExtension = !directory && dot > 0 && name.length() - dot <= 12;
        String extension = hasExtension ? name.substring(dot) : "";
        String stem = hasExtension ? trim(name.substring(0, dot)) : name;
        // Keep the budget even for an extension made up of multibyte characters.
        for (long copy = 1; ; copy++) {
            String suffix = (copy == 1 ? "" : " (" + copy + ")") + extension;
            String candidate = truncate(stem, MAX_BYTES - utf8Length(suffix)) + suffix;
            if (!taken.contains(key(candidate))) return candidate;
        }
    }

    static String key(String name) {
        return Normalizer.normalize(name, Normalizer.Form.NFC).toLowerCase(Locale.ROOT);
    }

    /** Reject provider names that cannot be used as a single relative M3U8 path segment. */
    static void requirePortable(String name) {
        if (name.isBlank() || name.equals(".") || name.equals("..") || name.indexOf('/') >= 0
                || name.indexOf('\\') >= 0 || name.indexOf('\n') >= 0 || name.indexOf('\r') >= 0) {
            throw new IllegalArgumentException("Not a portable filename");
        }
    }

    private static String sanitize(String value) {
        String normalized = Normalizer.normalize(value, Normalizer.Form.NFC);
        StringBuilder safe = new StringBuilder(normalized.length());
        for (int index = 0; index < normalized.length(); ) {
            int point = normalized.codePointAt(index);
            index += Character.charCount(point);
            safe.appendCodePoint(Character.isISOControl(point) || point == 0x2028 || point == 0x2029
                    || "\\/<>:\"|?*".indexOf(point) >= 0 || Character.getType(point) == Character.SURROGATE
                    ? '_' : point);
        }
        String name = trim(safe.toString());
        return name.isEmpty() ? "_" : name;
    }

    private static String trim(String value) {
        int start = 0;
        int end = value.length();
        while (start < end && (value.charAt(start) == '.' || Character.isWhitespace(value.charAt(start)))) start++;
        while (end > start && (value.charAt(end - 1) == '.' || Character.isWhitespace(value.charAt(end - 1)))) end--;
        return value.substring(start, end);
    }

    private static String truncate(String value, int budget) {
        int end = 0;
        while (end < value.length()) {
            int point = value.codePointAt(end);
            budget -= utf8Bytes(point);
            if (budget < 0) break;
            end += Character.charCount(point);
        }
        String truncated = trim(value.substring(0, end));
        return truncated.isEmpty() ? "_" : truncated;
    }

    private static int utf8Length(String value) {
        int bytes = 0;
        for (int i = 0; i < value.length(); ) {
            int point = value.codePointAt(i);
            bytes += utf8Bytes(point);
            i += Character.charCount(point);
        }
        return bytes;
    }

    private static int utf8Bytes(int point) {
        return point < 0x80 ? 1 : point < 0x800 ? 2 : point < 0x10000 ? 3 : 4;
    }
}
