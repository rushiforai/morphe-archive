package app.consumerclarity;

public final class ConsumerClarityWebView {
    private ConsumerClarityWebView() {}

    private static void set(Object settings, String field, boolean value) {
        try {
            settings.getClass().getField(field).set(settings, value);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException(error);
        }
    }

    private static void set(Object settings, String field, int value) {
        try {
            settings.getClass().getField(field).setInt(settings, value);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException(error);
        }
    }

    private static boolean enabled(String key) {
        return ConsumerClaritySettings.enabled(key);
    }

    public static void requireMediaGesture(Object settings) {
        if (enabled("webview_media_gesture")) set(settings, "mediaPlaybackRequiresUserGesture", true);
    }

    public static void blockThirdPartyCookies(Object settings) {
        if (enabled("webview_third_party_cookies")) set(settings, "thirdPartyCookiesEnabled", false);
    }

    public static void disableGeolocation(Object settings) {
        if (enabled("webview_geolocation")) set(settings, "geolocationEnabled", false);
    }

    public static void enableSafeBrowsing(Object settings) {
        if (enabled("webview_safe_browsing")) set(settings, "safeBrowsingEnabled", true);
    }

    public static void blockFileAccess(Object settings) {
        if (enabled("webview_file_access")) set(settings, "allowFileAccess", false);
    }

    public static void blockContentAccess(Object settings) {
        if (enabled("webview_content_access")) set(settings, "allowContentAccess", false);
    }

    public static void useIncognito(Object settings) {
        if (enabled("webview_incognito")) set(settings, "incognito", true);
    }

    public static void blockNetworkImages(Object settings) {
        if (enabled("webview_data_saver")) set(settings, "blockNetworkImage", true);
    }

    public static void disableBackgroundAudio(Object settings) {
        if (enabled("webview_background_audio")) set(settings, "allowBackgroundAudioPlaying", false);
    }

    public static void forceDark(Object settings) {
        if (enabled("webview_dark_mode")) {
            set(settings, "algorithmicDarkeningAllowed", true);
            set(settings, "forceDark", 2);
        }
    }

    public static void disableFormData(Object settings) {
        if (enabled("webview_form_data")) set(settings, "saveFormData", false);
    }

    public static void blockPopupWindows(Object settings) {
        if (enabled("webview_popup_windows")) {
            set(settings, "supportMultipleWindows", false);
            set(settings, "javaScriptCanOpenWindowsAutomatically", false);
        }
    }

    public static void disableDomStorage(Object settings) {
        if (enabled("webview_dom_storage")) set(settings, "domStorageEnabled", false);
    }

    public static void disableDatabase(Object settings) {
        if (enabled("webview_database")) set(settings, "databaseEnabled", false);
    }

    public static void disableCache(Object settings) {
        if (enabled("webview_cache")) set(settings, "cacheEnabled", false);
    }

    public static void blockMixedContent(Object settings) {
        if (enabled("webview_mixed_content")) set(settings, "mixedContentMode", 0);
    }

    public static void blockFileUrls(Object settings) {
        if (enabled("webview_file_urls")) {
            set(settings, "allowFileAccessFromFileURLs", false);
            set(settings, "allowUniversalAccessFromFileURLs", false);
        }
    }
}
