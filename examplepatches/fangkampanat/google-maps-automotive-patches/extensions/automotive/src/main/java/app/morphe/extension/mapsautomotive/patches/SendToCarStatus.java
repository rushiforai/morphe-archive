package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Process;
import android.os.SystemClock;
import android.view.View;

import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import app.morphe.extension.shared.Utils;

/**
 * Send to car's status, from its Settings row (0.1.6): the verdict first, with what the app found wrong
 * among the things it can check itself (MicroG-RE, its battery whitelist, Maps' push registration, the
 * network); the name phone Maps should list for this car (and what Maps last tried to send while that is
 * another name; whether an upload got through is not known), the last trip received (or one waiting in a
 * notification) and, from 0.1.7, the last push from Google with how late it came (SendToCarPush); what the user has
 * to check (BYD's Disable Autostart, the phone's account and car entry), which no app can read; then the
 * checks that passed, in one line. "Restart" restarts the app after a confirmation:
 * Maps registers for push and sends the vehicle info about 20 s after a start. Nothing here changes a
 * setting; nothing is sent anywhere. The checks run off the main thread; the Settings row shows the last
 * result while it is recent.
 */
final class SendToCarStatus {
    private static final String TAG = "MorpheSendToCar";
    static final String PREFERENCES = "morphe_send_to_car";
    private static final String KEY_TRIP_AT = "trip_at", KEY_TRIP_TYPE = "trip_type", KEY_TRIP_RESULT = "trip_result";
    /** When a sent trip last reached Maps' screen (its link expansion started), whatever came of it. */
    private static final String KEY_TRIP_SEEN_AT = "trip_seen_at";
    /**
     * A trip's results as stored: opened, Maps did not open it, the link (with its detail) failed, or Maps' screen
     * closed before the link was expanded.
     */
    static final String OPENED = "opened", MAPS_FAILED = "maps_failed", LINK_FAILED = "link:", SCREEN_CLOSED = "screen_closed";
    /**
     * A trip push later than the last trip by more than 5 s and under a day old: in a notification it waits for a tap;
     * one Maps started its screen for that has not reached the screen within 60 s did not open.
     */
    private static final long PENDING_AFTER_MS = 5_000, PENDING_FOR_MS = 24 * 3_600_000L, OPEN_WITHIN_MS = 60_000;
    static final String MICROG = "app.revanced.android.gms";
    static final String WHITELIST_COMMAND = "adb shell dumpsys deviceidle whitelist +" + MICROG;
    /** One check 30 s after a start; a new check after 1 min; the row shows a check for 10 min. */
    private static final long REFRESH_AFTER_START_MS = 30_000, REFRESH_MS = 60_000, SHOWN_MS = 10 * 60_000;
    private static volatile Snapshot cached;
    /** When [cached] was read (SystemClock.elapsedRealtime); [stale] asks the next Settings visit for a new check. */
    private static volatile long cachedAt;
    private static volatile boolean stale, refreshing;
    /**
     * Main thread: the dialog on screen, and when a tap started opening one, so a second tap opens no
     * second dialog. A dialog Android removed with its activity no longer counts; an opening that never
     * finished counts for 10 s.
     */
    private static WeakReference<AlertDialog> openDialog;
    private static WeakReference<Activity> openHost;
    private static long openingSince;
    private static final long OPENING_MS = 10_000;

    private SendToCarStatus() {
    }

    /** What the dialog shows. Plain fields, so the texts can be checked off the device. */
    static final class Snapshot {
        /** The checks threw: nothing below is known. */
        boolean checkFailed;
        boolean switchedOn = true;
        /** Where the feature switches are (the report screen's name), Thai and English. */
        String switchPlaceThai, switchPlaceEnglish;
        /** MicroG-RE's version name, null when it is not installed. */
        String microgVersion;
        boolean microgInstalled;
        /** Null: unreadable. */
        Boolean microgExempt;
        /** -1: unreadable. */
        long tokens = -1, tokenAgeS = -1;
        /** Null: unreadable. */
        String networkType;
        boolean networkValidated;
        /** The name phone Maps should list (the one chosen, else Maps' own), and whether it is Maps' own. */
        String carName;
        boolean mapsName;
        /** The last vehicle upload Maps built, 0 when none was seen. */
        long uploadAt;
        String uploadName;
        /** The last sent trip that reached Maps, 0 when none. */
        long tripAt;
        String tripType, tripResult;
        /** The last push from Google, 0 when none was seen; how late it was in seconds, -1 unknown. */
        long pushAt, pushDelayS = -1;
        /** The last trip push Maps' Send to car handler took, 0 when none; how Maps took it (SendToCarPush), or null. */
        long tripPushAt;
        String tripPushShown;
        /**
         * When a sent trip last reached Maps' screen, 0 when never; when this process started and when its last
         * MapsActivity was created (wall clock), 0 unknown.
         */
        long tripSeenAt, processStartAt, screenAt;
    }

    // Reading the state.

    static Snapshot compute(Context context) {
        Snapshot snapshot = new Snapshot();
        snapshot.switchedOn = SafeMode.on(context, SafeMode.SEND_TO_CAR);
        snapshot.switchPlaceThai = ReportPatch.reportPlace(context, true);
        snapshot.switchPlaceEnglish = ReportPatch.reportPlace(context, false);
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(MICROG, 0);
            snapshot.microgInstalled = true;
            snapshot.microgVersion = info.versionName;
        } catch (PackageManager.NameNotFoundException | RuntimeException error) {
            snapshot.microgInstalled = false;
        }
        if (snapshot.microgInstalled) {
            Object exempt = ReportDiagnostics.batteryOptimizationExempt(context, MICROG);
            snapshot.microgExempt = exempt instanceof Boolean ? (Boolean) exempt : null;
        }
        long[] tokens = ReportDiagnostics.pushTokens(context);
        if (tokens != null) {
            snapshot.tokens = tokens[0];
            snapshot.tokenAgeS = tokens[1];
        }
        ReportDiagnostics.NetworkState network = ReportDiagnostics.readNetwork(context);
        if (network != null) {
            snapshot.networkType = network.type;
            snapshot.networkValidated = network.validated;
        }
        // With Send to car switched off, Maps sends its own name.
        String stored = snapshot.switchedOn ? CarName.storedName(context) : null;
        snapshot.mapsName = stored == null;
        snapshot.carName = stored != null ? stored : CarName.mapsName(context);
        snapshot.uploadAt = CarName.uploadAt(context);
        snapshot.uploadName = CarName.uploadName(context);
        try {
            SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            snapshot.tripAt = preferences.getLong(KEY_TRIP_AT, 0);
            snapshot.tripType = preferences.getString(KEY_TRIP_TYPE, null);
            snapshot.tripResult = preferences.getString(KEY_TRIP_RESULT, null);
            snapshot.pushAt = preferences.getLong(SendToCarPush.KEY_PUSH_AT, 0);
            snapshot.pushDelayS = preferences.getLong(SendToCarPush.KEY_PUSH_DELAY_S, -1);
            snapshot.tripPushAt = preferences.getLong(SendToCarPush.KEY_TRIP_PUSH_AT, 0);
            snapshot.tripPushShown = preferences.getString(SendToCarPush.KEY_TRIP_PUSH_SHOWN, null);
            snapshot.tripSeenAt = preferences.getLong(KEY_TRIP_SEEN_AT, 0);
            snapshot.processStartAt = System.currentTimeMillis() - (SystemClock.elapsedRealtime() - Process.getStartElapsedRealtime());
            snapshot.screenAt = SendToCarPush.mapsCreatedAt();
        } catch (RuntimeException error) {
            snapshot.tripAt = 0;
            snapshot.pushAt = 0;
            snapshot.tripPushAt = 0;
        }
        return snapshot;
    }

    /** From SendToCarLinks: a sent trip reached Maps' intent processor, with how Maps opened it and the result. */
    static void recordTrip(Context context, String type, String result) {
        try {
            if (context == null) return;
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                    .putLong(KEY_TRIP_AT, System.currentTimeMillis())
                    .putString(KEY_TRIP_TYPE, type)
                    .putString(KEY_TRIP_RESULT, result)
                    .apply();
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "trip not recorded", error);
        }
        // The next Settings visit asks for a new check.
        stale = true;
    }

    /** From SendToCarLinks: a sent trip reached Maps' screen (its link is being expanded). */
    static void recordTripSeen(Context context) {
        try {
            if (context == null) return;
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE).edit()
                    .putLong(KEY_TRIP_SEEN_AT, System.currentTimeMillis()).apply();
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "trip not recorded", error);
        }
    }

    /** From the main process's start: one check about 30 s later, after Maps' first vehicle upload. */
    static void refreshAfterStart(Context context) {
        try {
            if (!SafeMode.included(SafeMode.SEND_TO_CAR)) return;
            Utils.runOnMainThreadDelayed(() -> refresh(context), REFRESH_AFTER_START_MS);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "status check not scheduled", error);
        }
    }

    /** One check at a time, off the main thread; the result is kept for the Settings row. */
    private static void refresh(Context context) {
        if (refreshing) return;
        refreshing = true;
        try {
            Utils.runOnBackgroundThread(() -> {
                try {
                    remember(compute(context));
                } catch (Throwable error) {
                    ReportLog.w(TAG, "status check failed", error);
                } finally {
                    refreshing = false;
                }
            });
        } catch (RuntimeException error) {
            refreshing = false;
            ReportLog.w(TAG, "status check not started", error);
        }
    }

    /**
     * The Settings row's status, before the car name: the last check while it is under 10 minutes old,
     * else "tap to check". A check older than a minute starts a new one for the next visit.
     */
    static String rowStatus(Context context, boolean thai) {
        Snapshot snapshot = cached;
        boolean old = stale;
        long age = SystemClock.elapsedRealtime() - cachedAt;
        if (snapshot == null || old || age > REFRESH_MS) refresh(context);
        return statusText(!old && age <= SHOWN_MS ? snapshot : null, thai);
    }

    private static void remember(Snapshot snapshot) {
        cachedAt = SystemClock.elapsedRealtime();
        cached = snapshot;
        stale = false;
    }

    // Texts. Plain Java from here on, so they can be checked off the device.

    /** The number of problems the app can see itself; the user's own checks are not counted. */
    static int problems(Snapshot snapshot) {
        if (snapshot.checkFailed) return 0;
        int problems = 0;
        if (!snapshot.microgInstalled) problems++;
        else if (Boolean.FALSE.equals(snapshot.microgExempt)) problems++;
        if (snapshot.tokens == 0) problems++;
        if (snapshot.networkType != null && (isAbsent(snapshot.networkType) || !snapshot.networkValidated)) problems++;
        return problems;
    }

    /** The number of checks the app could not read (the dialog's "?" lines). */
    static int unknowns(Snapshot snapshot) {
        if (snapshot.checkFailed) return 0;
        int unknowns = 0;
        if (snapshot.microgInstalled && snapshot.microgExempt == null) unknowns++;
        if (snapshot.tokens < 0) unknowns++;
        if (snapshot.networkType == null) unknowns++;
        return unknowns;
    }

    /** The row's status, as the dialog's verdict: what to fix, else what could not be read, else no problem. */
    static String statusText(Snapshot snapshot, boolean thai) {
        if (snapshot == null || snapshot.checkFailed) return thai ? "แตะเพื่อเช็ค" : "Tap to check";
        int problems = problems(snapshot);
        if (problems > 0) return thai ? "ต้องแก้ " + problems + " ข้อ" : problems + " to fix";
        int unknowns = unknowns(snapshot);
        if (unknowns > 0) return thai ? "เช็คไม่ได้ " + unknowns + " ข้อ" : unknowns + " could not be checked";
        return thai ? "ไม่พบปัญหา" : "No problems found";
    }

    private static boolean isAbsent(String networkType) {
        return "none".equals(networkType) || "blocked".equals(networkType);
    }

    /**
     * The dialog's text, one group per entry (the dialog puts an empty line between groups): the verdict with what
     * to fix or what could not be read, the car name and the last trip (with the verdict when nothing is wrong),
     * the user's own checks, then what passed in one line.
     */
    static List<String> lines(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        List<String> lines = new ArrayList<>();
        if (s.checkFailed) {
            lines.add(thai ? "เช็คไม่สำเร็จ ลองเปิดใหม่อีกครั้ง" : "The check failed. Open this again.");
            lines.add(ownChecks(thai));
            return lines;
        }
        List<String> fixes = new ArrayList<>(), unknown = new ArrayList<>(), passed = new ArrayList<>();
        if (!s.switchedOn) {
            String place = thai ? s.switchPlaceThai : s.switchPlaceEnglish;
            fixes.add((thai ? "Send to car ปิดอยู่ เปิดได้ที่สวิตช์ใน " : "Send to car is switched off. Its switch is in ")
                    + (place == null ? (thai ? "หน้ารายงานปัญหา" : "the report screen") : place) + (thai ? "" : "."));
        }
        if (!s.microgInstalled) {
            fixes.add(thai ? "ยังไม่ได้ติดตั้ง MicroG-RE" : "MicroG-RE is not installed");
        } else {
            passed.add(("MicroG-RE " + (s.microgVersion == null ? "" : s.microgVersion)).trim());
            if (s.microgExempt == null) {
                unknown.add(thai ? "อ่าน whitelist แบตของ MicroG-RE ไม่ได้" : "MicroG-RE's battery whitelist unreadable");
            } else if (s.microgExempt) {
                passed.add(thai ? "whitelist แบต" : "battery whitelist");
            } else {
                fixes.add((thai ? "MicroG-RE ยังไม่อยู่ใน whitelist แบต สั่งครั้งเดียวผ่าน ADB:"
                        : "MicroG-RE is not on the battery whitelist. Run once over ADB:") + "\n  " + WHITELIST_COMMAND);
            }
        }
        if (s.tokens < 0) {
            unknown.add(thai ? "อ่านการลงทะเบียน push ไม่ได้" : "Push registration unreadable");
        } else if (s.tokens == 0) {
            fixes.add(thai ? "Maps ยังไม่ได้ลงทะเบียน push ให้เปิด Cloud messaging และ Device registration ใน MicroG-RE"
                    + " อนุญาต Maps แล้วกดเริ่มใหม่"
                    : "Maps is not registered for push. In MicroG-RE, turn on Cloud messaging and Device registration,"
                    + " allow Maps, then tap Restart.");
        } else {
            passed.add("push" + (s.tokenAgeS < 0 ? "" : " (" + age(s.tokenAgeS, thai) + ")"));
        }
        if (s.networkType == null) {
            unknown.add(thai ? "อ่านเครือข่ายไม่ได้" : "Network unreadable");
        } else if ("blocked".equals(s.networkType)) {
            fixes.add(thai ? "Android กันแอปนี้ไม่ให้ใช้เน็ต (จำกัดแบตหรือการทำงานเบื้องหลัง)"
                    : "Android keeps this app off the network (battery or background restriction)");
        } else if ("none".equals(s.networkType)) {
            fixes.add(thai ? "ไม่มีเครือข่าย" : "No network");
        } else if (s.networkValidated) {
            passed.add(networkName(s.networkType, thai));
        } else {
            fixes.add(thai ? "เครือข่าย " + networkName(s.networkType, true) + " แต่ใช้อินเทอร์เน็ตไม่ได้"
                    : "Network: " + networkName(s.networkType, false) + " without internet");
        }
        // The verdict first; with nothing to fix or to read again, the car name and the trip come right under it.
        StringBuilder top = new StringBuilder();
        if (!fixes.isEmpty()) top.append(thai ? "ต้องแก้ " + fixes.size() + " ข้อ" : fixes.size() + " to fix");
        else if (!unknown.isEmpty()) top.append(thai ? "เช็คไม่ได้ " + unknown.size() + " ข้อ" : unknown.size() + " could not be checked");
        else top.append(thai ? "ไม่พบปัญหาจากที่แอปเช็คได้" : "No problems in what the app can check");
        for (String fix : fixes) top.append("\n• ").append(fix);
        for (String item : unknown) top.append("\n? ").append(item);
        String car = carNameLine(s, thai, nowMs, zone) + "\n" + tripLine(s, thai, nowMs, zone);
        String push = pushLine(s, thai, nowMs, zone);
        if (push != null) car += "\n" + push;
        if (fixes.isEmpty() && unknown.isEmpty()) {
            lines.add(top + "\n" + car);
        } else {
            lines.add(top.toString());
            lines.add(car);
        }
        lines.add(ownChecks(thai));
        if (!passed.isEmpty()) {
            StringBuilder ok = new StringBuilder(thai ? "ผ่าน: " : "OK: ");
            for (int i = 0; i < passed.size(); i++) ok.append(i == 0 ? "" : " · ").append(passed.get(i));
            lines.add(ok.toString());
        }
        return lines;
    }

    // What no app can read: BYD's Disable Autostart, and the phone's account and car entry.
    private static String ownChecks(boolean thai) {
        return thai
                ? "ถ้าทริปมาไม่ถึง เช็คเอง:"
                + "\n• BYD Disable Autostart: ปิดทั้ง Maps และ MicroG-RE (BYD เปิดกลับทุกครั้งที่ลงหรืออัปเดตแอป)"
                + "\n• มือถือ: บัญชี Google เดียวกัน และเลือกรถชื่อด้านบนในหน้าเส้นทาง"
                : "If trips do not arrive, check yourself:"
                + "\n• BYD Disable Autostart: Maps and MicroG-RE OFF (BYD turns them back on after each install or update)"
                + "\n• Phone: the same Google account, and in Directions pick the car name above";
    }

    /** The name phone Maps should list; what Maps last tried to send only while that is not this name. */
    static String carNameLine(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        String name = s.carName == null ? "Vehicle 1" : s.carName;
        StringBuilder line = new StringBuilder(thai ? "ชื่อรถในมือถือ: \"" + name + "\"" : "Car name on the phone: \"" + name + "\"");
        if (s.mapsName) line.append(thai ? " (ชื่อของ Maps)" : " (Maps' name)");
        if (s.uploadAt <= 0) {
            line.append(thai ? " · Maps ยังไม่ได้ลองส่งชื่อขึ้น เปิด Maps ค้างไว้สัก 1 นาที หรือกดเริ่มใหม่"
                    : ". Maps has not tried to send it yet: keep Maps open for a minute or tap Restart.");
        } else if (s.uploadName != null && !s.uploadName.equals(name)) {
            line.append(thai ? " · Maps ลองส่ง \"" + s.uploadName + "\" ล่าสุดเมื่อ " + clock(s.uploadAt, nowMs, zone, true) + " ชื่อใหม่จะส่งหลังเริ่มใหม่"
                    : ". Maps last tried to send \"" + s.uploadName + "\" at " + clock(s.uploadAt, nowMs, zone, false)
                    + "; the new name goes up after a restart.");
        }
        return line.toString();
    }

    /**
     * The last trip that reached Maps and how it went; how Maps opened it stays in the report's log. A newer trip push,
     * within a day, comes first: one Maps only posted as a notification waits for a tap; one Maps started its screen
     * for that has not opened within 30 s did not open (Android may block a screen started from the background, and
     * Maps then counts the trip as shown until it restarts).
     */
    static String tripLine(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        if (waitsInNotification(s, nowMs)) {
            return thai ? "ทริปล่าสุด: " + clock(s.tripPushAt, nowMs, zone, true) + " รออยู่ใน notification แตะเพื่อเปิด หรือเปิด Maps ขึ้นมา"
                    : "Last trip: " + clock(s.tripPushAt, nowMs, zone, false) + ", waiting in a notification: tap it or bring Maps to the front";
        }
        if (didNotOpen(s, nowMs)) {
            // Maps shows a saved trip again when its screen opens in a new process; once that has had 60 s and did
            // not, only a new send helps.
            boolean restarted = s.processStartAt > s.tripPushAt && s.screenAt > 0 && nowMs - s.screenAt >= OPEN_WITHIN_MS;
            return thai ? "ทริปล่าสุด: " + clock(s.tripPushAt, nowMs, zone, true) + " มาถึงแต่ไม่ขึ้น "
                    + (restarted ? "ส่งใหม่จากมือถือ" : "กดเริ่มใหม่เพื่อเปิด")
                    : "Last trip: " + clock(s.tripPushAt, nowMs, zone, false) + ", arrived but did not open: "
                    + (restarted ? "send it again from the phone" : "tap Restart to show it");
        }
        if (s.tripAt <= 0) return thai ? "ทริปล่าสุด: ยังไม่เคยได้รับ" : "Last trip: none received yet";
        String result = s.tripResult == null ? "" : s.tripResult;
        String outcome;
        if (result.equals(OPENED)) outcome = thai ? "เปิดแล้ว" : "opened";
        else if (result.equals(MAPS_FAILED)) outcome = thai ? "Maps เปิดไม่ได้" : "Maps did not open it";
        else if (result.equals(SCREEN_CLOSED)) outcome = thai ? "ไม่ได้เปิดเพราะปิดหน้า Maps ไปก่อน" : "not opened, Maps' screen closed first";
        else if (result.startsWith(LINK_FAILED)) outcome = linkProblem(result.substring(LINK_FAILED.length()).trim(), thai);
        else outcome = thai ? "ไม่ทราบผล" : "result unknown";
        return thai ? "ทริปล่าสุด: " + clock(s.tripAt, nowMs, zone, true) + " " + outcome
                : "Last trip: " + clock(s.tripAt, nowMs, zone, false) + ", " + outcome;
    }

    /** A trip push Maps only posted as a notification, later than the last trip that reached Maps, within a day. */
    static boolean waitsInNotification(Snapshot s, long nowMs) {
        return newerTripPush(s, nowMs) && SendToCarPush.SHOWN_NOTIFICATION.equals(s.tripPushShown);
    }

    /**
     * A trip push Maps started its screen for, later than the last trip that reached Maps, and no sent trip reached
     * Maps' screen since it, 60 s on.
     */
    static boolean didNotOpen(Snapshot s, long nowMs) {
        return newerTripPush(s, nowMs) && SendToCarPush.SHOWN_NOW.equals(s.tripPushShown) && s.tripSeenAt < s.tripPushAt
                && nowMs - s.tripPushAt >= OPEN_WITHIN_MS;
    }

    private static boolean newerTripPush(Snapshot s, long nowMs) {
        return s.tripPushAt > 0 && s.tripPushAt > s.tripAt + PENDING_AFTER_MS && nowMs - s.tripPushAt < PENDING_FOR_MS;
    }

    /**
     * The last push from Google and how long after its sending it came, null when none was seen. It tells a push that
     * came late (a push connection that had died, or a car that was off) from one that never came.
     */
    static String pushLine(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        if (s.pushAt <= 0) return null;
        String at = clock(s.pushAt, nowMs, zone, thai);
        if (s.pushDelayS < 0) return thai ? "push ล่าสุดจาก Google: " + at : "Last push from Google: " + at;
        if (s.pushDelayS < 60) {
            return thai ? "push ล่าสุดจาก Google: " + at + " มาถึงภายใน 1 นาที" : "Last push from Google: " + at + ", within a minute of sending";
        }
        return thai ? "push ล่าสุดจาก Google: " + at + " มาถึงหลังส่ง " + age(s.pushDelayS, true)
                : "Last push from Google: " + at + ", " + age(s.pushDelayS, false) + " after sending";
    }

    /** A failed link in plain words, the technical detail in brackets. */
    static String linkProblem(String detail, boolean thai) {
        String reason;
        if (detail.contains("UnknownHost") || detail.contains("Connect") || detail.contains("Timeout") || detail.contains("SSL")) {
            reason = thai ? "เปิดไม่ได้เพราะเน็ตใช้ไม่ได้" : "not opened, no internet";
        } else if (detail.contains("to another site")) {
            reason = thai ? "เปิดไม่ได้เพราะลิงก์พาไปที่อื่น" : "not opened, the link led elsewhere";
        } else if (detail.contains("404")) {
            reason = thai ? "เปิดไม่ได้เพราะลิงก์ยังไม่พร้อม" : "not opened, the link was not ready";
        } else {
            reason = thai ? "เปิดลิงก์ไม่ได้" : "the link did not open";
        }
        return detail.isEmpty() ? reason : reason + " (" + detail + ")";
    }

    static String networkName(String type, boolean thai) {
        switch (type) {
            case "wifi": return "Wi-Fi";
            case "cellular": return thai ? "เน็ตมือถือ" : "mobile data";
            case "ethernet": return "Ethernet";
            case "bluetooth": return "Bluetooth";
            case "vpn": return "VPN";
            default: return thai ? "อื่น" : "other";
        }
    }

    /** "5 min", "3 h", "2 days" (Thai: "5 นาที", "3 ชม.", "2 วัน"). */
    static String age(long seconds, boolean thai) {
        long minutes = Math.max(0, seconds) / 60;
        if (minutes < 120) return thai ? minutes + " นาที" : minutes + " min";
        long hours = minutes / 60;
        if (hours < 48) return thai ? hours + " ชม." : hours + " h";
        long days = hours / 24;
        return thai ? days + " วัน" : days + " days";
    }

    /** "13:36" today, else "8 Nov 13:36" (Thai month names on a Thai system), in the head unit's time zone. */
    static String clock(long millis, long nowMs, TimeZone zone, boolean thai) {
        Locale locale = thai ? new Locale("th", "TH") : Locale.UK;
        SimpleDateFormat day = new SimpleDateFormat("yyyyMMdd", Locale.ROOT);
        day.setTimeZone(zone);
        boolean today = day.format(new Date(millis)).equals(day.format(new Date(nowMs)));
        SimpleDateFormat format = new SimpleDateFormat(today ? "HH:mm" : "d MMM HH:mm", locale);
        format.setTimeZone(zone);
        return format.format(new Date(millis));
    }

    // The dialog.

    /** The Settings row's action: the checks off the main thread, then the dialog on the activity. */
    static void show(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the Send to car status: " + context);
            return;
        }
        // A dialog removed with its activity keeps isShowing(), so its activity must still be alive too.
        AlertDialog open = openDialog == null ? null : openDialog.get();
        Activity owner = openHost == null ? null : openHost.get();
        if (open != null && open.isShowing() && owner != null && !owner.isFinishing() && !owner.isDestroyed()) return;
        long now = SystemClock.elapsedRealtime();
        if (openingSince != 0 && now - openingSince < OPENING_MS) return;
        openingSince = now;
        Activity host = activity;
        try {
            Utils.runOnBackgroundThread(() -> {
                // Opening the status also asks MicroG-RE to check its push connection (SendToCarPush).
                SendToCarPush.nudge(host.getApplicationContext(), "status");
                Snapshot snapshot;
                try {
                    snapshot = compute(host);
                    remember(snapshot);
                } catch (Throwable error) {
                    ReportLog.w(TAG, "status check failed", error);
                    snapshot = new Snapshot();
                    snapshot.checkFailed = true;
                }
                Snapshot shown = snapshot;
                Utils.runOnMainThread(() -> showDialog(host, container, shown));
            });
        } catch (RuntimeException error) {
            openingSince = 0;
            ReportLog.w(TAG, "Send to car status not started", error);
        }
    }

    private static void showDialog(Activity host, View container, Snapshot snapshot) {
        openingSince = 0;
        try {
            if (host.isFinishing() || host.isDestroyed()) return;
            boolean thai = UiDensityPatch.isThai(host);
            StringBuilder message = new StringBuilder();
            for (String line : lines(snapshot, thai, System.currentTimeMillis(), TimeZone.getDefault())) {
                if (message.length() > 0) message.append("\n\n");
                message.append(line);
            }
            AlertDialog dialog = new AlertDialog.Builder(host)
                    .setTitle(CarName.getSettingsTitle(host))
                    .setMessage(message)
                    .setPositiveButton(thai ? "ปิด" : "Close", null)
                    .setNegativeButton(thai ? "ชื่อรถ" : "Car name", (shown, which) -> CarName.showEditor(host, container))
                    .setNeutralButton(thai ? "เริ่มใหม่…" : "Restart…", (shown, which) -> confirmRestart(host))
                    .create();
            dialog.show();
            openDialog = new WeakReference<>(dialog);
            openHost = new WeakReference<>(host);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "Send to car status not shown", error);
        }
    }

    private static void confirmRestart(Activity host) {
        try {
            if (host.isFinishing() || host.isDestroyed()) return;
            boolean thai = UiDensityPatch.isThai(host);
            new AlertDialog.Builder(host)
                    .setTitle(CarName.getSettingsTitle(host))
                    .setMessage(thai ? "เริ่มแอปใหม่ตอนนี้ไหม แอปจะส่งชื่อรถและลงทะเบียน push ใหม่ในราว 20 วินาที การนำทางที่กำลังทำงานจะหยุด"
                            : "Restart the app now? It sends the car name and registers for push again within about 20 s."
                            + " Active navigation stops.")
                    .setPositiveButton(thai ? "เริ่มใหม่" : "Restart", (dialog, which) -> {
                        ReportLog.i(TAG, "restarting for Send to car");
                        Utils.restartApp(host);
                    })
                    .setNegativeButton(thai ? "ยกเลิก" : "Cancel", null)
                    .show();
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "restart not offered", error);
        }
    }
}
