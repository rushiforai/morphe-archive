/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12
 */

package app.morphe.extension.shared.patches;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Pure version/channel policy, independent of Android and network state. */
public final class PatchesUpdateData {
    private static final Pattern VERSION = Pattern.compile(
            "^(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)"
                    + "(?:-([0-9A-Za-z-]+(?:\\.[0-9A-Za-z-]+)*))?"
                    + "(?:\\+([0-9A-Za-z-]+(?:\\.[0-9A-Za-z-]+)*))?$");

    private PatchesUpdateData() {
    }

    public static String defaultChannel(String installed) {
        return installed.contains("-dev.") ? "DEV" : "STABLE";
    }

    private static String[] parse(String version) {
        if (version == null) return null;

        Matcher match = VERSION.matcher(version);
        if (!match.matches()) return null;

        String prerelease = match.group(4);
        if (prerelease != null) {
            for (String identifier : prerelease.split("\\.")) {
                if (numeric(identifier) && identifier.length() > 1 && identifier.charAt(0) == '0') return null;
            }
        }

        return new String[]{match.group(1), match.group(2), match.group(3), prerelease};
    }

    private static boolean numeric(String identifier) {
        for (int index = 0; index < identifier.length(); index++) {
            char character = identifier.charAt(index);
            if (character < '0' || character > '9') return false;
        }
        return true;
    }

    private static int compareNumbers(String first, String second) {
        int length = Integer.compare(first.length(), second.length());
        return length == 0 ? first.compareTo(second) : length;
    }

    /** Null means either version is not SemVer. Build metadata does not affect precedence. */
    public static Integer compareVersions(String first, String second) {
        String[] left = parse(first);
        String[] right = parse(second);
        if (left == null || right == null) return null;

        for (int index = 0; index < 3; index++) {
            int comparison = compareNumbers(left[index], right[index]);
            if (comparison != 0) return comparison;
        }

        if (left[3] == null) return right[3] == null ? 0 : 1;
        if (right[3] == null) return -1;

        String[] leftIdentifiers = left[3].split("\\.");
        String[] rightIdentifiers = right[3].split("\\.");
        for (int index = 0; index < Math.min(leftIdentifiers.length, rightIdentifiers.length); index++) {
            String leftIdentifier = leftIdentifiers[index];
            String rightIdentifier = rightIdentifiers[index];
            boolean leftNumeric = numeric(leftIdentifier);
            boolean rightNumeric = numeric(rightIdentifier);
            int comparison;
            if (leftNumeric && rightNumeric) {
                comparison = compareNumbers(leftIdentifier, rightIdentifier);
            } else if (leftNumeric != rightNumeric) {
                comparison = leftNumeric ? -1 : 1;
            } else {
                comparison = leftIdentifier.compareTo(rightIdentifier);
            }
            if (comparison != 0) return comparison;
        }
        return Integer.compare(leftIdentifiers.length, rightIdentifiers.length);
    }

    /** Returns the newest eligible version, never an equal/older or malformed version. */
    public static String selectVersion(String installed, String channel, String stable, String development) {
        if (!"STABLE".equals(channel) && !"DEV".equals(channel)) return null;

        String selected = null;
        String[] stableParts = parse(stable);
        Integer stableComparison = compareVersions(stable, installed);
        if (stableParts != null && stableParts[3] == null && stableComparison != null && stableComparison > 0) {
            selected = stable;
        }

        if ("DEV".equals(channel)) {
            Integer developmentComparison = compareVersions(development, installed);
            if (developmentComparison != null && developmentComparison > 0
                    && (selected == null || compareVersions(development, selected) > 0)) {
                selected = development;
            }
        }
        return selected;
    }

    /** Bounded plain text: headings, links and bullets remain readable without rendering remote HTML. */
    public static String releaseNotes(String markdown) {
        String notes = markdown.substring(0, Math.min(markdown.length(), 12000))
                .replaceAll("!\\[([^\\]]*)]\\([^)]*\\)", "$1")
                .replaceAll("\\[([^\\]]+)]\\([^)]*\\)", "$1")
                .replaceAll("(?m)^\\s{0,3}#{1,6}\\s*", "")
                .replaceAll("(?m)^\\s*[-*+]\\s+", "• ")
                .replaceAll("<[^>]*>", "")
                .replace("**", "").replace("__", "").replace("`", "")
                .replaceAll("\\n{3,}", "\n\n").trim();
        return notes.length() > 2400 ? notes.substring(0, 2400) + "…" : notes;
    }
}
