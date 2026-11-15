/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at df79f7d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushpinterest.extension.pinterest.notifications;

import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Pattern;

import app.hushpinterest.extension.pinterest.coexist.OwnAuthorities;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Pinterest's Firebase API key only answers requests that name Pinterest's own signing
 * certificate. Firebase sends the fingerprint of the certificate the app is installed with, so a
 * patched build was refused (403, API_KEY_ANDROID_APP_BLOCKED), never got an installation and
 * never got a push token. While the switch is on, the fingerprint Firebase sends to its own
 * Installations service is Pinterest's. Nothing else in the request changes, and no request is
 * made here.
 */
public final class PushNotifications {
    private PushNotifications() {}

    /**
     * SHA-1 of Pinterest's signing certificate (CN=Carl Rice, OU=Android, O=Pinterest Inc), in the
     * upper-case hex Firebase writes. The patch checks it against the certificate it carries.
     */
    static final String PINTEREST_CERTIFICATE_SHA1 = "B6A74DBCB894B0F73D8C485C72EB1247A8F027CA";

    static final String PINTEREST_PACKAGE = "com.pinterest";

    private static final Pattern INSTALLATION_PATH = Pattern.compile(
            "/v1/projects/[A-Za-z0-9_-]+/installations(?:/[A-Za-z0-9_-]+(?:/authTokens:generate)?)?");

    /**
     * How long a request may wait for settings. Firebase's init provider starts its token sync
     * before Application.onCreate hands over the context, so on a slow phone the first
     * Installations request can reach this hook first. Answering stock there sends the patched
     * build's certificate, Firebase refuses the installation, and no push token comes for the whole
     * process. The wait holds only Firebase's own worker thread.
     */
    static long startupWaitMillis = 10_000L;

    /** Placed just before Firebase adds X-Android-Cert, with the connection and the value it computed. */
    public static String certificateHeader(URLConnection connection, String original) {
        HookStatus.invoked(FamilyNames.FIX_PUSH_NOTIFICATIONS);
        try {
            if (!Utils.settingsReady()) {
                if (!Utils.awaitSettingsReady(startupWaitMillis)) {
                    HookStatus.counted(FamilyNames.FIX_PUSH_NOTIFICATIONS, "requests before app start");
                    return original;
                }
                HookStatus.counted(FamilyNames.FIX_PUSH_NOTIFICATIONS, "requests held for app start");
                Logger.printInfo(() -> "Firebase Installations request held until app start");
            }
            if (!PatchFamily.FIX_PUSH_NOTIFICATIONS.inBuild() || !Settings.FIX_PUSH_NOTIFICATIONS.get()
                    || connection == null) return original;
            URL url = connection.getURL();
            if (url == null || !"https".equalsIgnoreCase(url.getProtocol())
                    || !"firebaseinstallations.googleapis.com".equalsIgnoreCase(url.getHost())
                    || (url.getPort() != -1 && url.getPort() != 443) || url.getUserInfo() != null
                    || url.getQuery() != null || url.getRef() != null
                    || !INSTALLATION_PATH.matcher(url.getPath()).matches()) {
                return original;
            }
            String sent = connection.getRequestProperty("X-Android-Package");
            if (!PINTEREST_PACKAGE.equals(sent)) {
                // A copy from Change package name sends its own package, which Pinterest's key
                // doesn't know either. The installation is Pinterest's, so the request names it.
                if (!PatchFamily.CHANGE_PACKAGE_NAME.inBuild() || !OwnAuthorities.isRunningCopy(sent)) return original;
                connection.setRequestProperty("X-Android-Package", PINTEREST_PACKAGE);
                HookStatus.counted(FamilyNames.FIX_PUSH_NOTIFICATIONS, "copy package headers fixed");
            }
            if (PINTEREST_CERTIFICATE_SHA1.equalsIgnoreCase(original)) return original;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FIX_PUSH_NOTIFICATIONS, "certificate header", failure);
            return original;
        }
        HookStatus.counted(FamilyNames.FIX_PUSH_NOTIFICATIONS, "certificate headers fixed");
        return PINTEREST_CERTIFICATE_SHA1;
    }
}
