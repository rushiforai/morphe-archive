/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import app.pixkk.extension.core.Settings;

/**
 * Old-style counts. TikTok's count formatters write 12,345 as "12.3K" in English but with the
 * language's own word in others, "12,3 тыс." in Russian. Each one asks here first, and with the
 * switch on gets the count back as it used to be written everywhere: 12.3K, 1.2M, 1.2B.
 */
public final class OldStyleCounts {
    private OldStyleCounts() {
    }

    /** Called first in each count formatter. Null leaves the count to TikTok. */
    public static String format(long count) {
        if (count < 10_000 || !Settings.OLD_STYLE_COUNTS.get()) return null;
        if (count < 1_000_000) return scaled(count, 1_000L, 'K');
        if (count < 1_000_000_000) return scaled(count, 1_000_000L, 'M');
        return scaled(count, 1_000_000_000L, 'B');
    }

    /** One decimal, cut rather than rounded so 999,999 never reads as 1000.0K, and no ".0". */
    private static String scaled(long count, long unit, char suffix) {
        long tenths = count / (unit / 10);
        String text = (tenths / 10) + (tenths % 10 == 0 ? "" : "." + (tenths % 10));
        return text + suffix;
    }
}
