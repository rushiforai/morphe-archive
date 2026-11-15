/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import java.util.Locale;

/** Runtime half of the clone patches. */
public final class CloneSupport {
    private CloneSupport() {
    }

    /**
     * Stands in for an app helper that answers "does [text] contain [part], ignoring case". Apps that guard against
     * running under another package name call it as (original name, own package name); a clone's name extends the
     * original with a dotted suffix, so a package-looking [part] that continues [text] after a dot is answered "yes".
     * Every other call keeps its meaning.
     */
    public static boolean containsOrIsClone(String text, String part) {
        try {
            String haystack = text.toLowerCase(Locale.ROOT);
            String needle = part.toLowerCase(Locale.ROOT);
            if (haystack.contains(needle)) return true;
            return haystack.indexOf('.') > 0 && haystack.indexOf(' ') < 0 && needle.startsWith(haystack + ".");
        } catch (Exception e) {
            return false;
        }
    }
}
