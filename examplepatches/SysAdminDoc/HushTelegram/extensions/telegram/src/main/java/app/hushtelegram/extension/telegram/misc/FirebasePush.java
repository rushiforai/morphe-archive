/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.ActivityManager;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.PowerManager;
import android.os.SystemClock;

import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.function.LongSupplier;
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
    // Independently verified from both pinned official Play and telegram.org APK signing certificates.
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
    /** Telegram's servers have no push key for the app: set up on their side, not on the phone. */
    static final String API_KEY_MISSING = "APP_PUSH_APIKEY_MISSING";
    /** Telegram's token type for a Firebase token. A UnifiedPush address goes out as {@link UnifiedPush#WEB_PUSH}. */
    static final int FIREBASE = 2;
    /** How many sign-ups waiting for a reply, and how many replies, are kept: four accounts on two transports. */
    static final int KEPT = 8;

    /**
     * One sign-up Telegram sent, and its reply once that's in. Kept in memory only, so a restart
     * starts with none, and nothing here is shown or exported as it is.
     */
    static final class SignUp {
        /** Telegram's controller for one account place. Only asked who's signed in there, and compared. */
        final Object place;
        /** The Telegram user ID signed in there as the sign-up went out. 0 or less: it couldn't be read. */
        final long owner;
        final int transport;
        /**
         * Waiting beside a sign-up from another account at the same place on the same transport.
         * Telegram's reply doesn't say which of them it answers, so it's nobody's.
         */
        boolean mixed;
        String answer;
        /** When the reply came, on the clock that only runs forward. */
        long at;
        /** What the account is shown as: 1, 2 and so on as accounts first get a reply, 0 for one that couldn't be read. */
        int account;

        SignUp(Object place, long owner, int transport) {
            this.place = place;
            this.owner = owner;
            this.transport = transport;
        }
    }

    /** Sign-ups waiting for Telegram's reply, oldest first. Its lock guards these three. */
    static final ArrayDeque<SignUp> SENT = new ArrayDeque<>();
    /** Each account's latest reply on each transport, oldest first. */
    static final ArrayList<SignUp> ANSWERED = new ArrayList<>();
    /** How many accounts have been given a number since Telegram started. */
    static int accounts;
    /** Milliseconds that only run forward, so a changed wall clock can't make a reply look newer or older. */
    static LongSupplier clock = SystemClock::elapsedRealtime;

    /** One account's latest reply on one transport, as it leaves this class. Nothing in it says who the account is. */
    public static final class Reply {
        /** 1, 2 and so on, or 0 when the account couldn't be read. */
        public final int account;
        /** Telegram's token type: 2 for Firebase, 10 for a UnifiedPush address. */
        public final int transport;
        /** accepted, refused or "refused NAME CODE". */
        public final String answer;
        /** Milliseconds since the reply came. */
        public final long age;

        private Reply(int account, int transport, String answer, long age) {
            this.account = account;
            this.transport = transport;
            this.answer = answer;
            this.age = age;
        }

        /** The name people know the transport by, or null for a token type nothing here sends. */
        private String transportName() {
            return transport == FIREBASE ? "Firebase" : transport == UnifiedPush.WEB_PUSH ? "UnifiedPush" : null;
        }

        private String shown() {
            String who = account == 0 ? L10n.t("Unknown") : Integer.toString(account);
            String over = transportName() == null ? L10n.t("Unknown") : transportName();
            String what = ACCEPTED.equals(answer) ? L10n.t("Accepted") : REFUSED.equals(answer) ? L10n.t("Refused")
                    : L10n.f("Refused (%1$s)", answer.substring(REFUSED.length() + 1));
            String when = age < 60_000L ? L10n.t("less than a minute ago")
                    : age < 3_600_000L ? L10n.f("%1$s min ago", age / 60_000L) : L10n.f("%1$s h ago", age / 3_600_000L);
            return L10n.f("Telegram's reply to account %1$s on %2$s: %3$s, %4$s", who, over, what, when);
        }

        private String reported() {
            String over = transportName();
            return "push registration answer: account " + (account == 0 ? "unknown" : Integer.toString(account)) + ", "
                    + (over == null ? "unknown" : over.toLowerCase(Locale.ROOT)) + ", " + answer + ", " + age / 1000L + " s ago";
        }
    }

    /** Only scalar local facts leave the native readers. A null or -1 means unreadable. */
    public static final class LocalStatus {
        public final Boolean notificationPermission;
        /** Android's Restricted setting for this app, which keeps it from running in the background, or null when unread. */
        public final Boolean backgroundRestricted;
        /** Whether Android's battery optimization applies to this app, or null when unread. */
        public final Boolean batteryOptimized;
        /** What the UnifiedPush app row says, or null when UnifiedPush isn't in this build. */
        public final String unifiedPush;
        public final Boolean tokenPresent;
        public final int activeAccounts;
        public final int acknowledgedAccounts;
        /** Each account's latest reply on each transport, empty before one arrives, or null when the answer hooks aren't installed. */
        public final List<Reply> pushReplies;
        /** Telegram's Keep-Alive Service and Background Connection both on, or null when unread. */
        public final Boolean ownConnection;
        /** Whether a refused sign-up or UnifiedPush turned them on, rather than the user. */
        public final boolean ownConnectionTurnedOnHere;
        /** Whether UnifiedPush is what turned them on. */
        public final boolean ownConnectionBesideUnifiedPush;

        private LocalStatus(Boolean notificationPermission, Boolean backgroundRestricted, Boolean batteryOptimized,
                            String unifiedPush, Boolean tokenPresent, int activeAccounts, int acknowledgedAccounts,
                            List<Reply> pushReplies, Boolean ownConnection, boolean ownConnectionTurnedOnHere,
                            boolean ownConnectionBesideUnifiedPush) {
            this.notificationPermission = notificationPermission;
            this.backgroundRestricted = backgroundRestricted;
            this.batteryOptimized = batteryOptimized;
            this.unifiedPush = unifiedPush;
            this.tokenPresent = tokenPresent;
            this.activeAccounts = activeAccounts;
            this.acknowledgedAccounts = acknowledgedAccounts;
            this.pushReplies = pushReplies;
            this.ownConnection = ownConnection;
            this.ownConnectionTurnedOnHere = ownConnectionTurnedOnHere;
            this.ownConnectionBesideUnifiedPush = ownConnectionBesideUnifiedPush;
        }

        /**
         * The facts in three parts, each with its own fix: what Android allows on this phone, the push
         * service Telegram signs up with, and what Telegram answered each account.
         */
        public String summary() {
            String phone = L10n.t("On this phone") + "\n" + permissionLine() + "\n" + backgroundLine()
                    // Whole lines, so a language can make the value agree with the setting's name.
                    + "\n" + (batteryOptimized == null ? L10n.t("Battery optimization: Unknown")
                    : batteryOptimized ? L10n.t("Battery optimization: On") : L10n.t("Battery optimization: Off"));
            String push = L10n.t("Push service")
                    + "\n" + L10n.f("Notification ID saved on this phone: %1$s", tokenPresent == null ? L10n.t("Unknown")
                    : tokenPresent ? L10n.t("Yes") : L10n.t("No"));
            if (unifiedPush != null) push += "\n" + L10n.f("UnifiedPush: %1$s", unifiedPush);
            String telegram = L10n.t("Telegram accounts")
                    + "\n" + L10n.f("Signed-in accounts: %1$s", count(activeAccounts))
                    + "\n" + L10n.f("Accounts Telegram confirmed for notifications: %1$s", count(acknowledgedAccounts))
                    + "\n" + replyLines();
            if (refusedWith(API_KEY_MISSING)) {
                telegram += "\n" + L10n.t("APP_PUSH_APIKEY_MISSING means Telegram's servers have no push key set up for "
                        + "this app. That's configured on Telegram's side, so no setting on this phone fixes it.");
            }
            if (pushReplies != null) {
                telegram += "\n" + L10n.f("Keep-Alive Service and Background Connection on: %1$s",
                        ownConnection == null ? L10n.t("Unknown") : ownConnection ? L10n.t("Yes") : L10n.t("No"));
                if (firebaseRefused() && Boolean.FALSE.equals(ownConnection)) {
                    // Telegram's own page, named as Telegram shows it: the Settings row is Notifications,
                    // and the two switches sit under Other. Our own Notifications page is a different one.
                    telegram += "\n" + L10n.t("Without push, turn both on to get messages on time. They're in "
                            + "Telegram's own Settings > Notifications, under Other.");
                }
            }
            return phone + "\n\n" + push + "\n\n" + telegram + "\n\n"
                    + L10n.t("This only shows what's saved on this phone. It doesn't prove notifications will arrive.");
        }

        public String permissionLine() {
            return L10n.f("Notification permission: %1$s", notificationPermission == null ? L10n.t("Unknown")
                    : notificationPermission ? L10n.t("Allowed") : L10n.t("Blocked"));
        }

        public String backgroundLine() {
            return L10n.f("Background use: %1$s", backgroundRestricted == null ? L10n.t("Unknown")
                    : backgroundRestricted ? L10n.t("Restricted") : L10n.t("Allowed"));
        }

        /** Whether Android holds Telegram back in the background, so a link to where that's changed is worth showing. */
        public boolean androidLimitsBackground() {
            return Boolean.TRUE.equals(backgroundRestricted) || Boolean.TRUE.equals(batteryOptimized);
        }

        /** Whether an account's latest reply on either transport was a refusal naming [error]. */
        private boolean refusedWith(String error) {
            if (pushReplies == null) return false;
            for (Reply reply : pushReplies) {
                if (reply.answer.startsWith(REFUSED + " " + error + " ") || reply.answer.equals(REFUSED + " " + error)) return true;
            }
            return false;
        }

        private static String count(int value) { return value < 0 ? L10n.t("Unknown") : Integer.toString(value); }

        /** A line for each reply, or the one line that says there's none to show. */
        private String replyLines() {
            if (pushReplies == null || pushReplies.isEmpty()) {
                return L10n.f("Telegram's reply to notification sign-up: %1$s",
                        pushReplies == null ? L10n.t("Unknown") : L10n.t("No reply since Telegram started"));
            }
            List<String> lines = new ArrayList<>();
            for (Reply reply : pushReplies) lines.add(reply.shown());
            return String.join("\n", lines);
        }

        /** Whether an account's latest Firebase sign-up was turned down. A UnifiedPush reply says nothing about Firebase. */
        private boolean firebaseRefused() {
            for (Reply reply : pushReplies) {
                if (reply.transport == FIREBASE && reply.answer.startsWith(REFUSED)) return true;
            }
            return false;
        }

        private List<String> reportLines() {
            List<String> lines = new ArrayList<>(Arrays.asList("notification permission: " + (notificationPermission == null ? "unknown"
                            : notificationPermission ? "allowed" : "blocked"),
                    "background restricted: " + (backgroundRestricted == null ? "unknown" : backgroundRestricted.toString()),
                    "battery optimized: " + (batteryOptimized == null ? "unknown" : batteryOptimized.toString()),
                    "token present: " + (tokenPresent == null ? "unknown" : tokenPresent.toString()),
                    "active accounts: " + (activeAccounts < 0 ? "unknown" : activeAccounts),
                    "acknowledged accounts: " + (acknowledgedAccounts < 0 ? "unknown" : acknowledgedAccounts)));
            if (pushReplies == null || pushReplies.isEmpty()) {
                lines.add("push registration answer: " + (pushReplies == null ? "unknown" : NO_ANSWER));
            } else {
                for (Reply reply : pushReplies) lines.add(reply.reported());
            }
            lines.add("keep-alive and background connection: " + (ownConnection == null ? "unknown"
                    : ownConnection ? "on" + (ownConnectionBesideUnifiedPush ? " (beside UnifiedPush)"
                            : ownConnectionTurnedOnHere ? " (after a refused sign-up)" : "")
                    : "off"));
            lines.add("local state only; notification delivery is unverified");
            return lines;
        }
    }

    /**
     * Injected in registerForPush just before its account.registerDevice request goes out. Remembers
     * which account asked, so the reply goes to that account whoever holds its place by then. Reads
     * both parameters and changes neither, so it runs whatever the switch and Pause say.
     */
    public static void registerDeviceSent(Object controller, int transport) {
        try {
            SignUp sent = new SignUp(controller, owner(controller), transport);
            synchronized (SENT) {
                if (SENT.size() == KEPT) SENT.removeFirst();
                SENT.addLast(sent);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "push registration request", failure);
        }
    }

    /**
     * Injected in front of Telegram's own boolTrue test in its account.registerDevice callback, which
     * otherwise drops a refusal without a trace. Reads its parameters and changes none. The answer is
     * recorded whatever the switch and Pause say, for the account that asked on the transport it
     * asked on. Only the error's upper-case name and number are kept. {@link OwnConnection} then
     * acts on a Firebase answer that still belongs to a signed-in account, and only while the switch
     * is on and nothing's paused. A UnifiedPush answer says nothing about Firebase.
     */
    public static void registerDeviceAnswer(Object controller, int transport, Object response, Object error) {
        boolean accepted;
        boolean current;
        try {
            String answer = response != null && BOOL_TRUE.equals(response.getClass().getName()) ? ACCEPTED
                    : error == null ? REFUSED : REFUSED + " " + errorName(error);
            accepted = ACCEPTED.equals(answer);
            HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH,
                    accepted ? "push registrations accepted" : "push registrations refused");
            long holder = owner(controller);
            boolean left;
            boolean mixed;
            synchronized (SENT) {
                SignUp reply = sentFrom(controller, transport);
                // Nothing on record for it, so nobody is known to have asked. It's kept under no account.
                if (reply == null) reply = new SignUp(controller, -1, transport);
                mixed = reply.mixed || mixedWith(reply);
                // The account that asked signed out, or another holds its place. The reply is nobody's now.
                left = !mixed && reply.owner > 0 && holder >= 0 && holder != reply.owner;
                if (!mixed && !left) keep(reply, answer);
            }
            if (left) HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "push replies after sign-out");
            if (mixed) HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "push replies with no clear account");
            current = !left && !mixed;
            Logger.printInfo(() -> "Telegram answered the push registration: " + answer);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "push registration answer", failure);
            return;
        }
        if (current && transport == FIREBASE) OwnConnection.answered(accepted);
    }

    /**
     * The Telegram user ID signed in at [controller]'s account place: 0 when it's signed out, -1 when
     * it can't be read. It's only compared here, and never shown, logged or exported.
     */
    private static long owner(Object controller) {
        try {
            Object config = controller.getClass().getMethod("getUserConfig").invoke(controller);
            long user = ((Number) config.getClass().getMethod("getClientUserId").invoke(config)).longValue();
            return user < 0 ? -1 : user;
        } catch (Throwable unreadable) {
            // Native exception messages can contain private data. Unknown is the only result.
            return -1;
        }
    }

    /** Takes the oldest waiting sign-up [controller] sent on [transport], or answers null. Under SENT's lock. */
    private static SignUp sentFrom(Object controller, int transport) {
        for (Iterator<SignUp> waiting = SENT.iterator(); waiting.hasNext(); ) {
            SignUp sent = waiting.next();
            if (sent.place == controller && sent.transport == transport) {
                waiting.remove();
                return sent;
            }
        }
        return null;
    }

    /**
     * Whether a sign-up from another account at [taken]'s place, on its transport, is still
     * waiting. Each one found is marked, since its reply can't be told apart either. Telegram ends
     * a waiting sign-up as its account signs out, so this only comes up if one outlives that. Under
     * SENT's lock.
     */
    private static boolean mixedWith(SignUp taken) {
        boolean mixed = false;
        for (SignUp waiting : SENT) {
            if (waiting.place == taken.place && waiting.transport == taken.transport && waiting.owner != taken.owner) {
                waiting.mixed = true;
                mixed = true;
            }
        }
        return mixed;
    }

    /** Keeps [reply] as its account's latest on its transport, under the number the account already has. Under SENT's lock. */
    private static void keep(SignUp reply, String answer) {
        reply.answer = answer;
        reply.at = clock.getAsLong();
        for (Iterator<SignUp> kept = ANSWERED.iterator(); kept.hasNext(); ) {
            SignUp earlier = kept.next();
            // An account that couldn't be read is only taken for the same one at its own place.
            boolean same = reply.owner > 0 ? earlier.owner == reply.owner : earlier.owner <= 0 && earlier.place == reply.place;
            if (!same) continue;
            reply.account = earlier.account;
            if (earlier.transport == reply.transport) kept.remove();
        }
        if (reply.owner > 0 && reply.account == 0) reply.account = ++accounts;
        if (ANSWERED.size() == KEPT) ANSWERED.remove(0);
        ANSWERED.add(reply);
    }

    /**
     * Each account's latest reply on each transport, in the accounts' order. A reply whose account has
     * since signed out, or given its place to another, is dropped here rather than shown as current.
     */
    static List<Reply> replies() {
        List<SignUp> kept;
        synchronized (SENT) {
            kept = new ArrayList<>(ANSWERED);
        }
        long now = clock.getAsLong();
        List<Reply> replies = new ArrayList<>();
        for (SignUp reply : kept) {
            long holder = reply.owner > 0 ? owner(reply.place) : -1;
            if (holder >= 0 && holder != reply.owner) {
                synchronized (SENT) {
                    ANSWERED.remove(reply);
                }
                continue;
            }
            replies.add(new Reply(reply.account, reply.transport, reply.answer, Math.max(0L, now - reply.at)));
        }
        // Numbered accounts first, then one that couldn't be read. Firebase ahead of UnifiedPush.
        replies.sort((one, other) -> one.account != other.account
                ? Integer.compareUnsigned(one.account - 1, other.account - 1) : Integer.compare(one.transport, other.transport));
        return replies;
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
        // Read, never changed: the page links to App info and leaves the choice to the person.
        Boolean restricted = null;
        try {
            if (context != null) {
                ActivityManager activities = context.getSystemService(ActivityManager.class);
                if (activities != null) restricted = activities.isBackgroundRestricted();
            }
        } catch (Throwable unreadable) { }
        Boolean optimized = null;
        try {
            if (context != null) {
                PowerManager power = context.getSystemService(PowerManager.class);
                if (power != null) optimized = !power.isIgnoringBatteryOptimizations(context.getPackageName());
            }
        } catch (Throwable unreadable) { }
        String unifiedPush = null;
        if (context != null && Utils.settingsReady() && PatchFamily.UNIFIED_PUSH.inBuild()) {
            try {
                unifiedPush = UnifiedPush.status(context, Settings.UNIFIED_PUSH.savedValue());
            } catch (Throwable unreadable) { }
        }
        Boolean token = null;
        int active = -1;
        int acknowledged = -1;
        List<Reply> replies = null;
        Boolean ownConnection = null;
        boolean ownConnectionHere = false;
        boolean ownConnectionBeside = false;
        if (Utils.settingsReady() && PatchFamily.REPAIR_FIREBASE_PUSH.inBuild()
                && PatchFamily.Capability.FIREBASE_LOCAL_STATUS.installed()) {
            try {
                replies = replies();
            } catch (Throwable unreadable) { }
            ownConnection = OwnConnection.bothOn(context);
            ownConnectionHere = OwnConnection.turnedOnHere(context);
            ownConnectionBeside = OwnConnection.turnedOnBesideUnifiedPush(context);
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
        return new LocalStatus(permission, restricted, optimized, unifiedPush, token, active, acknowledged, replies,
                ownConnection, ownConnectionHere, ownConnectionBeside);
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
            if (!"org.telegram.messenger".equals(nativePackage)
                    && !"org.telegram.messenger.web".equals(nativePackage)) return original;
            if (OFFICIAL_CERTIFICATE_SHA1.equalsIgnoreCase(original)) return original;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "certificate header", failure);
            return original;
        }
        HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "certificate headers repaired");
        return OFFICIAL_CERTIFICATE_SHA1;
    }
}
