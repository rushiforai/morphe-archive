package app.tiktoklitepatches.extension;

import java.text.NumberFormat;

public final class ExactCounts {
    private static final ThreadLocal<NumberFormat> FORMAT = new ThreadLocal<NumberFormat>() {
        @Override
        protected NumberFormat initialValue() {
            return NumberFormat.getIntegerInstance();
        }
    };

    private ExactCounts() {
    }

    public static String format(long count) {
        return FORMAT.get().format(Math.max(0L, count));
    }
}
