/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Scoped certificate repair and read-only local notification facts. */
public final class FirebasePush {
    // Independently verified from both pinned official web and beta APK signing certificates.
    private static final String OFFICIAL_CERTIFICATE_SHA1 = "9723E5838612E9C7C08CA2C6573B6026D7A51F8F";
    private static final Pattern INSTALLATION_PATH = Pattern.compile(
            "/v1/projects/[A-Za-z0-9_-]+/installations(?:/[A-Za-z0-9_-]+(?:/authTokens:generate)?)?");

    private FirebasePush() { }

    private static final String BOOL_TRUE = "org.telegram.tgnet.TLRPC$TL_boolTrue";
    // Telegram's error names are upper-case constants such as APP_PUSH_APIKEY_MISSING or FLOOD_WAIT_30.
    private static final Pattern ERROR_NAME = Pattern.compile("[A-Z0-9_]{1,64}");
    static final String ACCEPTED = "accepted";
    static final String REFUSED = "refused";
    static final String NO_ANSWER = "none since start";

    /** Telegram's answer to the last account.registerDevice this process sent, or null before one arrives. */
    static volatile String lastAnswer;

    /** Only scalar local facts leave the native readers. A null or -1 means unreadable. */
    public static final class LocalStatus {
        public final Boolean notificationPermission;
        public final Boolean tokenPresent;
        public final int activeAccounts;
        public final int acknowledgedAccounts;
        /** accepted, refused, "refused NAME CODE", none since start, or null when the answer hook isn't installed. */
        public final String pushAnswer;

        private LocalStatus(Boolean notificationPermission, Boolean tokenPresent, int activeAccounts, int acknowledgedAccounts,
                            String pushAnswer) {
            this.notificationPermission = notificationPermission;
            this.tokenPresent = tokenPresent;
            this.activeAccounts = activeAccounts;
            this.acknowledgedAccounts = acknowledgedAccounts;
            this.pushAnswer = pushAnswer;
        }

        public String summary() {
            return L10n.f("Notification permission: %1$s", notificationPermission == null ? L10n.t("Unknown")
                    : notificationPermission ? L10n.t("Allowed") : L10n.t("Blocked"))
                    + "\n" + L10n.f("Notification ID saved on this phone: %1$s", tokenPresent == null ? L10n.t("Unknown")
                    : tokenPresent ? L10n.t("Yes") : L10n.t("No"))
                    + "\n" + L10n.f("Signed-in accounts: %1$s", count(activeAccounts))
                    + "\n" + L10n.f("Accounts Telegram confirmed for notifications: %1$s", count(acknowledgedAccounts))
                    + "\n" + L10n.f("Telegram's reply to notification sign-up: %1$s", answer())
                    + "\n" + L10n.t("This only shows what's saved on this phone. It doesn't prove notifications will "
                            + "arrive.");
        }

        private static String count(int value) { return value < 0 ? L10n.t("Unknown") : Integer.toString(value); }

        private String answer() {
            if (pushAnswer == null) return L10n.t("Unknown");
            if (NO_ANSWER.equals(pushAnswer)) return L10n.t("No reply since Telegram started");
            if (ACCEPTED.equals(pushAnswer)) return L10n.t("Accepted");
            if (REFUSED.equals(pushAnswer)) return L10n.t("Refused");
            return L10n.f("Refused (%1$s)", pushAnswer.substring(REFUSED.length() + 1));
        }

        private List<String> reportLines() {
            return Arrays.asList("notification permission: " + (notificationPermission == null ? "unknown"
                            : notificationPermission ? "allowed" : "blocked"),
                    "token present: " + (tokenPresent == null ? "unknown" : tokenPresent.toString()),
                    "active accounts: " + (activeAccounts < 0 ? "unknown" : activeAccounts),
                    "acknowledged accounts: " + (acknowledgedAccounts < 0 ? "unknown" : acknowledgedAccounts),
                    "push registration answer: " + (pushAnswer == null ? "unknown" : pushAnswer),
                    "local state only; notification delivery is unverified");
        }
    }

    /**
     * Injected in front of Telegram's own boolTrue test in its account.registerDevice callback, which
     * otherwise drops a refusal without a trace. Reads both parameters and changes neither, so it runs
     * whatever the switch and Pause say. Only the error's upper-case name and number are kept.
     */
    public static void registerDeviceAnswer(Object response, Object error) {
        try {
            String answer = response != null && BOOL_TRUE.equals(response.getClass().getName()) ? ACCEPTED
                    : error == null ? REFUSED : REFUSED + " " + errorName(error);
            lastAnswer = answer;
            HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH,
                    ACCEPTED.equals(answer) ? "push registrations accepted" : "push registrations refused");
            Logger.printInfo(() -> "Telegram answered the push registration: " + answer);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "push registration answer", failure);
        }
    }

    /** TL_error's public text and code fields. Text that isn't an upper-case error name never leaves. */
    static String errorName(Object error) {
        String name = "unreadable";
        String code = "";
        try {
            Object text = error.getClass().getField("text").get(error);
            if (text instanceof String && ERROR_NAME.matcher((String) text).matches()) name = (String) text;
        } catch (Throwable unreadable) { }
        try {
            code = " " + error.getClass().getField("code").getInt(error);
        } catch (Throwable unreadable) { }
        return name + code;
    }

    /** Independent of the repair switch and Pause. Never loads configs or asks for registration. */
    public static LocalStatus localStatus(Context context) {
        Boolean permission = null;
        try {
            if (context != null) {
                NotificationManager manager = context.getSystemService(NotificationManager.class);
                if (manager != null) permission = manager.areNotificationsEnabled()
                        && (Build.VERSION.SDK_INT < 33 || context.checkSelfPermission("android.permission.POST_NOTIFICATIONS")
                        == PackageManager.PERMISSION_GRANTED);
            }
        } catch (Throwable unreadable) {
            // Native exception messages can contain private data. Unknown is the only exported result.
        }
        Boolean token = null;
        int active = -1;
        int acknowledged = -1;
        String answer = null;
        if (Utils.settingsReady() && PatchFamily.REPAIR_FIREBASE_PUSH.inBuild()
                && PatchFamily.Capability.FIREBASE_LOCAL_STATUS.installed()) {
            String last = lastAnswer;
            answer = last == null ? NO_ANSWER : last;
            try {
                int presence = nativeTokenPresence();
                if (presence == 0 || presence == 1) token = presence == 1;
            } catch (Throwable unreadable) { }
            try {
                int counts = nativeAccountCounts();
                int activeCount = counts & 0xff;
                int acknowledgedCount = counts >>> 8;
                if (counts >= 0 && activeCount <= 4 && acknowledgedCount <= activeCount) {
                    active = activeCount;
                    acknowledged = acknowledgedCount;
                }
            } catch (Throwable unreadable) { }
        }
        return new LocalStatus(permission, token, active, acknowledged, answer);
    }

    /** Replaced only after the patch verifies the retained native fields and their local readers. */
    private static int nativeTokenPresence() { return -1; }
    private static int nativeAccountCounts() { return -1; }

    public static List<String> localReportLines() {
        return PatchFamily.REPAIR_FIREBASE_PUSH.inBuild() ? localStatus(Utils.getContext()).reportLines()
                : Collections.emptyList();
    }

    /**
     * How long a request may wait for settings. Firebase's init provider starts FCM's eager token
     * sync before Application.onCreate hands over the context, so on a slow phone the first
     * Installations request reaches this hook first. Answering stock there sent the re-signed
     * certificate, Firebase refused the installation, and no push token came for the whole
     * process. The wait holds only Firebase's own worker thread.
     */
    static long startupWaitMillis = 10_000L;

    /** Injected just before Firebase adds X-Android-Cert. Does not connect or mutate the connection. */
    public static String certificateHeader(URLConnection connection, String original) {
        HookStatus.invoked(FamilyNames.REPAIR_FIREBASE_PUSH);
        try {
            if (!Utils.settingsReady()) {
                if (!Utils.awaitSettingsReady(startupWaitMillis)) {
                    HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "requests before app start");
                    return original;
                }
                HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "requests held for app start");
                Logger.printInfo(() -> "Firebase Installations request held until app start");
            }
            if (!Settings.REPAIR_FIREBASE_PUSH.get() || connection == null) return original;
            URL url = connection.getURL();
            if (url == null || !"https".equalsIgnoreCase(url.getProtocol())
                    || !"firebaseinstallations.googleapis.com".equalsIgnoreCase(url.getHost())
                    || (url.getPort() != -1 && url.getPort() != 443) || url.getUserInfo() != null
                    || url.getQuery() != null || url.getRef() != null
                    || !INSTALLATION_PATH.matcher(url.getPath()).matches()) {
                return original;
            }
            String nativePackage = connection.getRequestProperty("X-Android-Package");
            if (!"org.telegram.messenger.web".equals(nativePackage)
                    && !"org.telegram.messenger.beta".equals(nativePackage)) return original;
            if (OFFICIAL_CERTIFICATE_SHA1.equalsIgnoreCase(original)) return original;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "certificate header", failure);
            return original;
        }
        HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "certificate headers repaired");
        return OFFICIAL_CERTIFICATE_SHA1;
    }
}
