/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

/** Asks the notification hook about a push the way Facebook's post method hands it over. */
public final class NotificationKindsForTests {
    private NotificationKindsForTests() {
    }

    /** True when a trending video push, typed as Facebook's payload types it, isn't posted. */
    public static boolean blocksTrendingVideo() {
        return NotificationKinds.block("top_trending_video");
    }

    /** True when an "On this day" push isn't posted. */
    public static boolean blocksMemory() {
        return NotificationKinds.block("onthisday");
    }

    /** True when a birthday reminder isn't posted. */
    public static boolean blocksBirthday() {
        return NotificationKinds.block("birthday_reminder");
    }

    /** True when a group highlights digest isn't posted. */
    public static boolean blocksHighlights() {
        return NotificationKinds.block("group_highlights");
    }

    /** True when a People you may know push isn't posted. */
    public static boolean blocksPeopleYouMayKnow() {
        return NotificationKinds.block("pymk_email");
    }

    /** True when a weather push isn't posted. */
    public static boolean blocksNearby() {
        return NotificationKinds.block("weather_nowcast");
    }

    /** Forgets the debug lines already written, as a new Facebook process would start without them. */
    public static void newProcess() {
        NotificationKinds.forgetLog();
    }
}
