package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
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
 * Send to car's status, from its Settings row (0.1.6): what the app can check itself (MicroG-RE, its
 * battery whitelist, Maps' push registration, the network), the name phone Maps should list for this car
 * with the time Maps last built its vehicle upload (a try to send it; whether the upload got through is
 * not known), and the last trip received; then what the user has to check (BYD's Disable Autostart, the
 * phone's account and car entry), which no app can read. "Restart" restarts the app after a confirmation:
 * Maps registers for push and sends the vehicle info about 20 s after a start. Nothing here changes a
 * setting; nothing is sent anywhere. The checks run off the main thread; the Settings row shows the last
 * result while it is recent.
 */
final class SendToCarStatus {
    private static final String TAG = "MorpheSendToCar";
    private static final String PREFERENCES = "morphe_send_to_car";
    private static final String KEY_TRIP_AT = "trip_at", KEY_TRIP_TYPE = "trip_type", KEY_TRIP_RESULT = "trip_result";
    /** A trip's results as stored: opened, Maps did not open it, or the link (with its detail) failed. */
    static final String OPENED = "opened", MAPS_FAILED = "maps_failed", LINK_FAILED = "link:";
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
        } catch (RuntimeException error) {
            snapshot.tripAt = 0;
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

    static String statusText(Snapshot snapshot, boolean thai) {
        if (snapshot == null || snapshot.checkFailed) return thai ? "แตะเพื่อเช็ค" : "Tap to check";
        int problems = problems(snapshot);
        if (problems == 0) return thai ? "ไม่พบปัญหา" : "No problems found";
        return thai ? "ต้องแก้ " + problems + " ข้อ" : problems + " to fix";
    }

    private static boolean isAbsent(String networkType) {
        return "none".equals(networkType) || "blocked".equals(networkType);
    }

    /** The dialog's lines: the app's checks, the car name, the last trip, then the user's checks. */
    static List<String> lines(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        List<String> lines = new ArrayList<>();
        String ok = thai ? "ผ่าน · " : "OK · ", fix = thai ? "ต้องแก้ · " : "Fix · ", unknown = "? · ";
        if (s.checkFailed) {
            lines.add(unknown + (thai ? "เช็คไม่สำเร็จ ลองเปิดใหม่อีกครั้ง" : "The check failed. Open this again."));
            addOwnChecks(lines, thai);
            return lines;
        }
        if (!s.switchedOn) {
            String place = thai ? s.switchPlaceThai : s.switchPlaceEnglish;
            lines.add(fix + (thai ? "Send to car ปิดอยู่ เปิดได้ที่สวิตช์ใน " : "Send to car is switched off. Its switch is in ")
                    + (place == null ? (thai ? "หน้ารายงานปัญหา" : "the report screen") : place) + (thai ? "" : "."));
        }
        if (!s.microgInstalled) {
            lines.add(fix + (thai ? "ยังไม่ได้ติดตั้ง MicroG RE" : "MicroG RE is not installed"));
        } else {
            lines.add(ok + "MicroG RE " + (s.microgVersion == null ? "" : s.microgVersion).trim());
            if (s.microgExempt == null) {
                lines.add(unknown + (thai ? "อ่าน whitelist แบตของ MicroG RE ไม่ได้" : "MicroG RE's battery whitelist unreadable"));
            } else if (s.microgExempt) {
                lines.add(ok + (thai ? "MicroG RE อยู่ใน whitelist แบต" : "MicroG RE is on the battery whitelist"));
            } else {
                lines.add(fix + (thai ? "MicroG RE ยังไม่อยู่ใน whitelist แบต สั่งครั้งเดียวผ่าน ADB:"
                        : "MicroG RE is not on the battery whitelist. Run once over ADB:") + "\n" + WHITELIST_COMMAND);
            }
        }
        if (s.tokens < 0) {
            lines.add(unknown + (thai ? "อ่านการลงทะเบียน push ไม่ได้" : "Push registration unreadable"));
        } else if (s.tokens == 0) {
            lines.add(fix + (thai ? "Maps ยังไม่ได้ลงทะเบียน push ให้เปิด Cloud messaging และ Device registration ใน MicroG RE"
                    + " อนุญาต Maps แล้วกดเริ่มใหม่"
                    : "Maps is not registered for push. In MicroG RE, turn on Cloud messaging and Device registration,"
                    + " allow Maps, then tap Restart."));
        } else {
            lines.add(ok + (thai ? "ลงทะเบียน push แล้ว" : "Registered for push")
                    + (s.tokenAgeS < 0 ? "" : thai ? " (ล่าสุดเมื่อ " + age(s.tokenAgeS, true) + "ที่แล้ว)"
                    : " (last renewed " + age(s.tokenAgeS, false) + " ago)"));
        }
        if (s.networkType == null) {
            lines.add(unknown + (thai ? "อ่านเครือข่ายไม่ได้" : "Network unreadable"));
        } else if ("blocked".equals(s.networkType)) {
            lines.add(fix + (thai ? "Android กันแอปนี้ไม่ให้ใช้เน็ต (จำกัดแบตหรือการทำงานเบื้องหลัง)"
                    : "Android keeps this app off the network (battery or background restriction)"));
        } else if ("none".equals(s.networkType)) {
            lines.add(fix + (thai ? "ไม่มีเครือข่าย" : "No network"));
        } else if (s.networkValidated) {
            lines.add(ok + (thai ? "เครือข่าย " + networkName(s.networkType, true) + " ใช้อินเทอร์เน็ตได้"
                    : "Network: " + networkName(s.networkType, false) + " with internet"));
        } else {
            lines.add(fix + (thai ? "เครือข่าย " + networkName(s.networkType, true) + " แต่ใช้อินเทอร์เน็ตไม่ได้"
                    : "Network: " + networkName(s.networkType, false) + " without internet"));
        }
        lines.add(carNameLine(s, thai, nowMs, zone));
        lines.add(tripLine(s, thai, nowMs, zone));
        addOwnChecks(lines, thai);
        return lines;
    }

    private static void addOwnChecks(List<String> lines, boolean thai) {
        lines.add(thai ? "เช็คเอง:" : "Check yourself:");
        lines.add(thai ? "• BYD Disable Autostart: ต้องปิดทั้ง Maps และ MicroG RE โดย BYD จะเปิดกลับทุกครั้งที่ลงหรืออัปเดตแอป"
                : "• BYD Disable Autostart: Maps and MicroG RE must be OFF. BYD turns them back on after each install or update.");
        lines.add(thai ? "• มือถือ: ใช้บัญชี Google เดียวกัน และในหน้าเส้นทางให้เลือกรถชื่อด้านบน"
                : "• Phone: the same Google account, and in Directions pick the car name above.");
        lines.add(thai ? "กดเริ่มใหม่ แอปจะลองส่งชื่อรถและลงทะเบียน push ใหม่ภายในราว 20 วินาที"
                : "Restart makes the app send the car name and register for push again within about 20 s.");
    }

    static String carNameLine(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        String name = s.carName == null ? "Vehicle 1" : s.carName;
        StringBuilder line = new StringBuilder(thai ? "ในมือถือ รถคันนี้ควรชื่อ \"" + name + "\"" : "Your phone should list this car as \"" + name + "\"");
        if (s.mapsName) line.append(thai ? " (ชื่อของ Maps)" : " (Maps' name)");
        if (s.uploadAt <= 0) {
            line.append(thai ? " Maps ยังไม่ได้ลองส่งชื่อขึ้น เปิด Maps ค้างไว้สัก 1 นาที หรือกดเริ่มใหม่"
                    : ". Maps has not tried to send it yet: keep Maps open for a minute or tap Restart.");
        } else if (s.uploadName != null && !s.uploadName.equals(name)) {
            line.append(thai ? " Maps ลองส่ง \"" + s.uploadName + "\" ล่าสุดเมื่อ " + clock(s.uploadAt, nowMs, zone, true) + " ชื่อใหม่จะส่งหลังเริ่มใหม่"
                    : ". Maps last tried to send \"" + s.uploadName + "\" at " + clock(s.uploadAt, nowMs, zone, false)
                    + "; the new name goes up after a restart.");
        } else {
            line.append(thai ? " Maps ลองส่งชื่อนี้ล่าสุดเมื่อ " + clock(s.uploadAt, nowMs, zone, true)
                    : ". Maps last tried to send it at " + clock(s.uploadAt, nowMs, zone, false) + ".");
        }
        return line.toString();
    }

    static String tripLine(Snapshot s, boolean thai, long nowMs, TimeZone zone) {
        if (s.tripAt <= 0) return thai ? "ยังไม่เคยได้รับทริปจากมือถือ" : "No trip received from the phone yet.";
        String result = s.tripResult == null ? "" : s.tripResult;
        String outcome;
        if (result.equals(OPENED)) outcome = thai ? "เปิดแล้ว" : "opened";
        else if (result.equals(MAPS_FAILED)) outcome = thai ? "Maps เปิดไม่ได้" : "Maps did not open it";
        else if (result.startsWith(LINK_FAILED)) outcome = linkProblem(result.substring(LINK_FAILED.length()).trim(), thai);
        else outcome = thai ? "ไม่ทราบผล" : "result unknown";
        return thai
                ? "ทริปล่าสุดที่ได้รับ: " + clock(s.tripAt, nowMs, zone, true) + " (" + tripType(s.tripType, true) + ") " + outcome
                : "Last trip received: " + clock(s.tripAt, nowMs, zone, false) + " (" + tripType(s.tripType, false) + "), " + outcome + ".";
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

    static String tripType(String type, boolean thai) {
        if (type == null) return thai ? "ลิงก์" : "link";
        switch (type) {
            case "NOTIFICATION_TAP": return thai ? "กดจาก notification" : "notification tap";
            case "FIRST_SHOW_ACTIVITY_IN_FOREGROUND": return thai ? "Maps อยู่หน้าจอ" : "Maps on screen";
            case "FIRST_SHOW_ACTIVITY_IN_BACKGROUND": return thai ? "Maps อยู่เบื้องหลัง" : "Maps in the background";
            case "FIRST_SHOW_ON_ACTIVITY_RESUME": return thai ? "ตอนเปิด Maps ขึ้นมา" : "when Maps came on screen";
            case "FIRST_SHOW_AFTER_RESTART": return thai ? "หลังเริ่มแอปใหม่" : "after a restart";
            case "RESHOW": return thai ? "แสดงซ้ำ" : "shown again";
            default: return thai ? "ลิงก์" : "link";
        }
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
                    .setMessage(thai ? "เริ่มแอปใหม่ตอนนี้ไหม การนำทางที่กำลังทำงานจะหยุด"
                            : "Restart the app now? Active navigation stops.")
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
