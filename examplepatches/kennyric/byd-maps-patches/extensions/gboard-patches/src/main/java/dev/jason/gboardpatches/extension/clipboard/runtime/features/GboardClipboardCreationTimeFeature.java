package dev.jason.gboardpatches.extension.clipboard;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

final class GboardClipboardCreationTimeFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardCreationTimeFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    String formatToken(long clipTimestamp) {
        return support.runSafely("format clipboard creation time token", () -> {
            SimpleDateFormat formatter = new SimpleDateFormat("M/d HH:mm", Locale.US);
            return formatter.format(new Date(clipTimestamp));
        }, null);
    }

    boolean isToken(String token) {
        return token != null && token.matches("\\d{1,2}/\\d{1,2} \\d{2}:\\d{2}");
    }
}
