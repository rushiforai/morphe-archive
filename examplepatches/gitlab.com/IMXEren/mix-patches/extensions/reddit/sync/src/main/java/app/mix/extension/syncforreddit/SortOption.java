/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import java.util.Locale;

final class SortOption {
    final String name;
    final String time;

    private SortOption(String name, String time) {
        this.name = name;
        this.time = time;
    }

    static SortOption from(String value) {
        if (value == null) {
            return new SortOption("", null);
        }
        String normalized = value.trim().toLowerCase(Locale.ROOT);
        if (normalized.startsWith("t=")) {
            String time = normalized.substring(2);
            return new SortOption("top", isTime(time) ? time : null);
        }

        int separator = firstSeparator(normalized);
        if (separator > 0) {
            String time = normalized.substring(separator + 1).trim();
            if (isTime(time)) {
                return new SortOption(normalized.substring(0, separator), time);
            }
        }
        return new SortOption(normalized, null);
    }

    static SortOption profile(String access, String sort) {
        SortOption secondary = from(sort);
        String name = secondary.name;
        if (sort == null || sort.trim().toLowerCase(Locale.ROOT).startsWith("t=")) {
            String primary = from(access).name;
            if (!primary.isEmpty()) {
                name = primary;
            }
        }
        if (!"hot".equals(name) && !"new".equals(name)
                && !"top".equals(name) && !"controversial".equals(name)) {
            name = "new";
        }
        return new SortOption(name, secondary.time);
    }

    String stateKey() {
        return name + '|' + (time == null ? "" : time);
    }

    private static int firstSeparator(String value) {
        int result = -1;
        for (char separator : new char[]{' ', '_', '-'}) {
            int index = value.indexOf(separator);
            if (index >= 0 && (result < 0 || index < result)) {
                result = index;
            }
        }
        return result;
    }

    private static boolean isTime(String value) {
        return "hour".equals(value) || "day".equals(value) || "week".equals(value)
                || "month".equals(value) || "year".equals(value) || "all".equals(value);
    }
}
