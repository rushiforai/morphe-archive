package com.travianpatch.notifier;

/** "HH:MM" text for minutes after midnight (the settings store minutes; people read clock times). Pure logic. */
final class Clock {

    private Clock() {
    }

    /** Minutes after midnight for "H:MM" / "HH:MM", or -1 when the text isn't a valid time. */
    static int parse(String text) {
        if (text == null) {
            return -1;
        }
        String[] parts = text.trim().split(":");
        if (parts.length != 2) {
            return -1;
        }
        try {
            int h = Integer.parseInt(parts[0].trim());
            int m = Integer.parseInt(parts[1].trim());
            if (h < 0 || h > 23 || m < 0 || m > 59) {
                return -1;
            }
            return h * 60 + m;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** "HH:MM"; values past midnight (e.g. 1500) wrap to the next day's clock (01:00). */
    static String format(int minutes) {
        int m = ((minutes % 1440) + 1440) % 1440;
        return String.format(java.util.Locale.US, "%02d:%02d", m / 60, m % 60);
    }

    /** The end of a range as minutes after the start's midnight: an end earlier than the start is the next day. */
    static int endAfter(int start, int end) {
        return end < start ? end + 1440 : end;
    }
}
