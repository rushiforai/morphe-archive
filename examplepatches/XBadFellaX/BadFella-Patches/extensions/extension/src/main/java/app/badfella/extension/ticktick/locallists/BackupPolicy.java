package app.badfella.extension.ticktick.locallists;

/** User-facing intervals and reminders, independent of Android's scheduler. */
public final class BackupPolicy {
    public static final long MIN_MINUTES = 15;
    public static final long MAX_MINUTES = 30 * 24 * 60;
    private BackupPolicy() { }

    public static void validateInterval(long minutes) {
        if (minutes != 0 && (minutes < MIN_MINUTES || minutes > MAX_MINUTES)) {
            throw new IllegalArgumentException("Choose 15 minutes to 30 days, or turn scheduling off");
        }
    }

    public static boolean isDue(long lastSuccess, long minutes, long now) {
        validateInterval(minutes);
        if (lastSuccess <= 0) return true;
        long interval = (minutes == 0 ? 7 * 24 * 60 : minutes) * 60_000L;
        return now >= lastSuccess && now - lastSuccess >= interval;
    }

    public static String intervalLabel(long minutes) {
        validateInterval(minutes);
        if (minutes == 0) return "Off";
        if (minutes % (24 * 60) == 0) {
            long days = minutes / (24 * 60);
            return days == 1 ? "Daily" : days == 7 ? "Weekly" : "Every " + days + " days";
        }
        if (minutes == 60) return "Every hour";
        if (minutes % 60 == 0) return "Every " + minutes / 60 + " hours";
        return "Every " + minutes + " minutes";
    }
}
