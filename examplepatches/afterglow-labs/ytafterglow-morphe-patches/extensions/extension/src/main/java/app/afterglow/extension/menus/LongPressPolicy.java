package app.afterglow.extension.menus;

/** Value rules shared by the native long-press tools, without Android dependencies. */
public final class LongPressPolicy {
    private LongPressPolicy() {}

    /** iOS didPressPause uses whole elapsed seconds and the canonical watch URL. */
    public static String timestampLink(String videoId, long timeMs) {
        if (videoId == null || videoId.length() != 11 || timeMs < 0) return null;
        for (int i = 0; i < videoId.length(); i++) {
            char c = videoId.charAt(i);
            if (!(c >= 'a' && c <= 'z') && !(c >= 'A' && c <= 'Z')
                    && !(c >= '0' && c <= '9') && c != '_' && c != '-') return null;
        }
        return "https://www.youtube.com/watch?v=" + videoId + "&t=" + timeMs / 1000 + "s";
    }

}
