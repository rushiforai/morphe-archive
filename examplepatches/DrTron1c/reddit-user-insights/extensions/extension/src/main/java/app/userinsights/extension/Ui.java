package app.userinsights.extension;

import android.content.Context;

import java.util.Locale;

final class Ui {
    private Ui() {
    }

    static int dp(Context context, float value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    static String formatCount(int count) {
        if (count >= 1_000_000) {
            return String.format(Locale.US, "%.1fm", count / 1_000_000f).replace(".0m", "m");
        }
        if (count >= 10_000) {
            return (count / 1000) + "k";
        }
        if (count >= 1000) {
            return String.format(Locale.US, "%.1fk", count / 1000f).replace(".0k", "k");
        }
        return String.valueOf(count);
    }

    /** "5m", "3h", "2d", "4mo", "1y" like Reddit shows. */
    static String timeAgo(long createdUtcSeconds) {
        if (createdUtcSeconds <= 0) {
            return "";
        }
        long seconds = Math.max(0, System.currentTimeMillis() / 1000 - createdUtcSeconds);
        if (seconds < 60) {
            return "now";
        }
        long minutes = seconds / 60;
        if (minutes < 60) {
            return minutes + "m";
        }
        long hours = minutes / 60;
        if (hours < 24) {
            return hours + "h";
        }
        long days = hours / 24;
        if (days < 30) {
            return days + "d";
        }
        long months = days / 30;
        if (months < 12) {
            return months + "mo";
        }
        return (days / 365) + "y";
    }
}
