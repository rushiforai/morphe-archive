package app.morphe.extension.aliexpress.patches;

@SuppressWarnings("unused")
public final class DisableAnalyticsPatch {

    public static boolean shouldTrackEvent() {
        return false;
    }

    public static String rewriteAnalyticsUrl(String originalUrl) {
        if (originalUrl == null) return null;
        if (originalUrl.contains("analytics")
            || originalUrl.contains("track")
            || originalUrl.contains("collect")
            || originalUrl.contains("ump")
            || originalUrl.contains("sensors")
            || originalUrl.contains("umeng")) {
            return null;
        }
        return originalUrl;
    }
}
