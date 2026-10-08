/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import java.util.function.IntSupplier;

/**
 * Asks the notification hook about a push the way Facebook's post method hands it over. Each push
 * arrives at 11 PM, inside the quiet hours a phone starts with, so a run that turns every switch on,
 * Quiet hours included, gets the same answer whatever the test machine's clock says.
 */
public final class NotificationKindsForTests {
    /** An hour inside the default quiet hours, 10 PM to 7 AM. */
    private static final int NIGHT = 23;

    private NotificationKindsForTests() {
    }

    /** The hook's answer for a push typed [type], asked at 11 PM. Never reads a setting itself. */
    private static boolean atNight(String type) {
        IntSupplier clock = NotificationKinds.hourOfDay;
        NotificationKinds.hourOfDay = () -> NIGHT;
        try {
            return NotificationKinds.block(type);
        } finally {
            NotificationKinds.hourOfDay = clock;
        }
    }

    /** True when a trending video push, typed as Facebook's payload types it, isn't posted. */
    public static boolean blocksTrendingVideo() {
        return atNight("top_trending_video");
    }

    /** True when an "On this day" push isn't posted. */
    public static boolean blocksMemory() {
        return atNight("onthisday");
    }

    /** True when a birthday reminder isn't posted. */
    public static boolean blocksBirthday() {
        return atNight("birthday_reminder");
    }

    /** True when a group highlights digest isn't posted. */
    public static boolean blocksHighlights() {
        return atNight("group_highlights");
    }

    /** True when a People you may know push isn't posted. */
    public static boolean blocksPeopleYouMayKnow() {
        return atNight("pymk_email");
    }

    /** True when a weather push isn't posted. */
    public static boolean blocksNearby() {
        return atNight("weather_nowcast");
    }

    /** True when a push about new activity in a group isn't posted. */
    public static boolean blocksGroupActivity() {
        return atNight("group_activity");
    }

    /** True when an event invite isn't posted. */
    public static boolean blocksEventInvite() {
        return atNight("event_invite");
    }

    /** True when a push that someone is live isn't posted. */
    public static boolean blocksLiveVideo() {
        return atNight("live_video");
    }

    /** True when a push about a reaction to your post isn't posted. */
    public static boolean blocksReaction() {
        return atNight("feedback_reaction_generic");
    }

    /** Forgets the debug lines already written, as a new Facebook process would start without them. */
    public static void newProcess() {
        NotificationKinds.forgetLog();
    }
}
