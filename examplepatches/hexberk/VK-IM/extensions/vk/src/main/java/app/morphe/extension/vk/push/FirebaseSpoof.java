package app.morphe.extension.vk.push;

import java.net.URLConnection;

/**
 * Firebase identifies the calling app to Google by the X-Android-Package and X-Android-Cert
 * headers. VK's API key accepts only the official package and signing certificate, so a
 * re-signed or cloned app is refused a Firebase installation and never gets an FCM token.
 */
@SuppressWarnings("unused")
public final class FirebaseSpoof {
    private static final String PACKAGE_HEADER = "X-Android-Package";
    private static final String CERT_HEADER = "X-Android-Cert";

    /** SHA-1 of the official VK signing certificate (O=VKontakte), shared by VK and VK Messenger. */
    private static final String ORIGINAL_CERT_SHA1 = "48761EEF50EE53AFC4CC9C5F10E6BDE7F8F5B82F";

    /** Replaced by the patch with the original package name. */
    private static String originalPackageName() {
        return null;
    }

    private static String spoof(String key, String value) {
        if (PACKAGE_HEADER.equalsIgnoreCase(key)) {
            String original = originalPackageName();
            return original != null ? original : value;
        }
        if (CERT_HEADER.equalsIgnoreCase(key)) return ORIGINAL_CERT_SHA1;
        return value;
    }

    public static void addRequestProperty(URLConnection connection, String key, String value) {
        connection.addRequestProperty(key, spoof(key, value));
    }

    public static void setRequestProperty(URLConnection connection, String key, String value) {
        connection.setRequestProperty(key, spoof(key, value));
    }
}
