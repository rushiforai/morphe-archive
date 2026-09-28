/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.notifications;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.navigation.MarketplaceOnly;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BooleanSetting;

/**
 * What the Block promotional notifications patch asks before Facebook posts a push notification.
 *
 * <p>Every push Facebook shows in the notification shade carries a type, the {@code type} field of
 * its payload, which Facebook keeps as {@code SystemTrayNotification.mType}. Facebook reads it by
 * cutting it at the first colon and matching the rest, ignoring case, against the constant names of
 * its kept {@code NotificationType} enum: {@code BIRTHDAY_REMINDER}, {@code ONTHISDAY},
 * {@code TOP_TRENDING_VIDEO} and 470 more on 577 and 580. The patch hands that type to
 * {@link #block} first thing in the one method that goes on to post the notification, and a yes
 * returns before anything is posted.
 *
 * <p>Only the kinds in {@link #KINDS} can go, each under one of six switches, and every switch
 * starts off. Messages, friend requests, comments, mentions, calls and login alerts are none of
 * them. The type is matched by Facebook's own constant names, never by a title or a line of text,
 * so it works in any language. It fails open: an unknown or unreadable type, a switch that's off, a
 * pause, settings that aren't ready, or any failure in here posts the notification as Facebook would.
 */
public final class NotificationKinds {
    /** One switch's worth of notification kinds. The setting is looked up only once settings are ready. */
    enum Group {
        TRENDING_VIDEOS("Trending videos"),
        MEMORIES("Memories"),
        BIRTHDAYS("Birthdays"),
        HIGHLIGHTS("Highlights"),
        PEOPLE_YOU_MAY_KNOW("People you may know"),
        NEARBY("Nearby and weather");

        /** What a blocked notification of this group is counted under. */
        final String counted;

        Group(String counted) {
            this.counted = counted;
        }

        /** The switch that blocks this group. Loads Settings, so only after {@link Utils#settingsReady}. */
        BooleanSetting setting() {
            switch (this) {
                case TRENDING_VIDEOS:
                    return Settings.BLOCK_TRENDING_VIDEO_NOTIFICATIONS;
                case MEMORIES:
                    return Settings.BLOCK_MEMORY_NOTIFICATIONS;
                case BIRTHDAYS:
                    return Settings.BLOCK_BIRTHDAY_NOTIFICATIONS;
                case HIGHLIGHTS:
                    return Settings.BLOCK_HIGHLIGHT_NOTIFICATIONS;
                case PEOPLE_YOU_MAY_KNOW:
                    return Settings.BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS;
                case NEARBY:
                default:
                    return Settings.BLOCK_NEARBY_NOTIFICATIONS;
            }
        }
    }

    /**
     * The notification kinds a switch can block, by Facebook's constant name, and the switch's
     * group. Every name is a constant of NotificationType on both builds the bundle declares; the
     * patch's fixture test reads them from this class's dex and holds them to that.
     */
    static final Map<String, Group> KINDS;

    static {
        Map<String, Group> kinds = new LinkedHashMap<>();
        // "Trending" pushes and reels Facebook picked for you.
        kinds.put("TOP_TRENDING_VIDEO", Group.TRENDING_VIDEOS);
        kinds.put("PERSONALIZED_REELS", Group.TRENDING_VIDEOS);
        // "On this day" memories.
        kinds.put("ONTHISDAY", Group.MEMORIES);
        // A friend's birthday is today.
        kinds.put("BIRTHDAY_REMINDER", Group.BIRTHDAYS);
        // Digests of what happened in groups, pages and creators you follow.
        kinds.put("GROUP_HIGHLIGHTS", Group.HIGHLIGHTS);
        kinds.put("GROUP_NF_HIGHLIGHTS", Group.HIGHLIGHTS);
        kinds.put("PAGE_HIGHLIGHTS", Group.HIGHLIGHTS);
        kinds.put("CREATOR_HIGHLIGHTS", Group.HIGHLIGHTS);
        // Friend suggestions, not friend requests.
        kinds.put("PYMK_EMAIL", Group.PEOPLE_YOU_MAY_KNOW);
        // Places near you and the weather.
        kinds.put("PLACE_FEED_NEARBY", Group.NEARBY);
        kinds.put("NEAR_SAVED_PLACE", Group.NEARBY);
        kinds.put("WEATHER_NOWCAST", Group.NEARBY);
        KINDS = Collections.unmodifiableMap(kinds);
    }

    /** The diagnostic counter route: every notification asked about by kind, and the ones blocked. */
    static final String ROUTE = "Notification kinds";

    /** The Hook status name of what the hook reads: the push's type. */
    static final String TYPE_FIELD = "SystemTrayNotification#mType";

    /** What a type that isn't a constant name is counted under. Its text is never logged. */
    static final String UNREADABLE = "unreadable";

    /** What a notification with no type at all is counted under. */
    static final String NO_TYPE = "none";

    /**
     * What a type naming one of Facebook's constants looks like, in either case. A type that doesn't
     * is never matched or logged. ASCII only: upper-casing a dotless i would make an I of it.
     */
    private static final Pattern CONSTANT_NAME = Pattern.compile("[A-Za-z0-9_]{1,80}");

    /** Distinct debug lines kept, so a phone that gets many notifications doesn't fill the log. */
    private static final int MAX_LOGGED = 64;

    /** The debug lines already written this process: kind and answer. */
    private static final Set<String> LOGGED = ConcurrentHashMap.newKeySet();

    private NotificationKinds() {
    }

    /**
     * Injection point, first thing in the method that posts a push notification, with the push's
     * type as its payload carried it. True drops the notification. Never throws.
     */
    public static boolean block(@Nullable String type) {
        try {
            HookStatus.invoked(FamilyNames.PROMO_NOTIFICATIONS);
            // A type came through, so the patch read the push where the anchors said it would.
            if (type != null) HookStatus.bound(FamilyNames.PROMO_NOTIFICATIONS, TYPE_FIELD);
            String kind = kindOf(type);
            FeedFilterCounters.sawList(ROUTE, 1);
            FeedFilterCounters.sawKind(ROUTE, kind == null ? (type == null ? NO_TYPE : UNREADABLE) : kind);
            if (kind == null) return false;
            Group group = KINDS.get(kind);
            // Ready first: Settings loads every switch, and it can't before the context is set.
            // Digests and nearby-place alerts can be useful to someone buying or selling. The
            // mode only quiets entertainment, memories, birthdays and friend suggestions.
            boolean block = group != null && Utils.settingsReady() && (group.setting().get()
                    || (group != Group.HIGHLIGHTS && group != Group.NEARBY && MarketplaceOnly.quietNotifications()));
            if (block) FeedFilterCounters.removed(ROUTE, 1, group.counted);
            log(kind, block);
            return block;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROMO_NOTIFICATIONS, TYPE_FIELD, failure);
            return false;
        }
    }

    /**
     * The constant name [type] stands for, the way Facebook reads it: the part before the first
     * colon, in upper case. Null for no type, and for one that isn't made of a constant name's
     * letters, digits and underscores, which no constant can match.
     */
    @Nullable
    static String kindOf(@Nullable String type) {
        if (type == null) return null;
        int colon = type.indexOf(':');
        String head = colon >= 0 ? type.substring(0, colon) : type;
        return CONSTANT_NAME.matcher(head).matches() ? head.toUpperCase(Locale.ROOT) : null;
    }

    /** The switch that blocks [kind], or null for every kind that always posts. Loads Settings. */
    @Nullable
    static BooleanSetting switchFor(String kind) {
        Group group = KINDS.get(kind);
        return group == null ? null : group.setting();
    }

    /** One debug line per kind and answer, so the phone check can see what Facebook sent. */
    private static void log(String kind, boolean blocked) {
        String line = kind + (blocked ? " blocked" : " posted");
        if (LOGGED.size() >= MAX_LOGGED || !LOGGED.add(line)) return;
        Logger.printDebug(() -> FamilyNames.PROMO_NOTIFICATIONS + ": " + line);
    }

    /** Forgets which debug lines were written, as a new Facebook process would. For tests. */
    static void forgetLog() {
        LOGGED.clear();
    }
}
