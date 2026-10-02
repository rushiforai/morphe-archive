/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.feed;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Start Home on Following" patch.
 *
 * <p>Instagram has a feed picker at the top of Home that offers For you, Following and Favorites,
 * shows the picked feed's name and remembers the pick. Two server flags turn it on: one has the
 * pick remembered, read on 449 by Home, the picker and the feed request among others, and one puts
 * For you in the picker and the name at the top. The patch passes every read of both through
 * {@link #flag}, which answers yes while the switch is on, and the remembered pick through
 * {@link #saved}, which answers Following while there's none yet.
 *
 * <p>A second switch keeps Home to accounts you follow: {@link #saved} answers Following in place
 * of a remembered For you, and {@link #limitPicker} takes For you out of the picker's list before
 * Instagram freezes it.
 */
public final class FollowingFeed {
    /** The name Instagram 449 saves for the Following feed, its feed type constant's. */
    static final String FOLLOWING = "FOLLOWING";

    /**
     * The picker's feeds that aren't only accounts you follow: For you, and the plain Home feed
     * the picker shows in its place when For you is off.
     */
    static final Set<String> FOR_YOU = new HashSet<>(Arrays.asList("BLENDED", "BLENDED_FOR_YOU"));

    private static volatile boolean loggedFlag;
    private static volatile boolean loggedDefault;
    private static volatile boolean loggedLimit;
    private static volatile boolean loggedPicker;

    /** The feed type field of a picker item's class, looked up once. */
    private static volatile Field feedField;

    private FollowingFeed() {
    }

    /**
     * Injected right after each read of the feed picker's flags, with Instagram's answer as an int
     * (non-zero is yes). Answers true while the switch is on, and Instagram's answer otherwise, or
     * when anything goes wrong. Never throws, and never waits for the settings: before they're
     * ready Instagram's answer stands.
     */
    public static boolean flag(int enabled) {
        try {
            HookStatus.invoked(FamilyNames.FOLLOWING_FEED);
            if (!Utils.settingsReady() || !Settings.START_ON_FOLLOWING.get()) return enabled != 0;
            if (!loggedFlag) {
                loggedFlag = true;
                Logger.printDebug(() -> "Following feed: feed picker flags answered on");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLLOWING_FEED, "feed flag", failure);
            return enabled != 0;
        }
    }

    /**
     * Injected where Instagram hands back the feed you last picked, with that feed's name. Answers
     * Following when there's no name and the switch is on, and in place of For you while the second
     * switch is on too. Otherwise, or when anything goes wrong, answers the name. Never throws.
     */
    public static String saved(String name) {
        boolean picked = name != null && !name.isEmpty();
        if (picked && !FOR_YOU.contains(name)) return name;
        try {
            HookStatus.invoked(FamilyNames.FOLLOWING_FEED);
            if (!Utils.settingsReady() || !Settings.START_ON_FOLLOWING.get()) return name;
            if (picked) {
                if (!Settings.ONLY_FOLLOWING.get()) return name;
                if (!loggedLimit) {
                    loggedLimit = true;
                    Logger.printDebug(() -> "Following feed: For you was picked, Home stays on Following");
                }
                return FOLLOWING;
            }
            if (!loggedDefault) {
                loggedDefault = true;
                Logger.printDebug(() -> "Following feed: no feed picked yet, starting on Following");
            }
            return FOLLOWING;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLLOWING_FEED, "saved feed", failure);
            return name;
        }
    }

    /**
     * Injected just before Instagram freezes the list of feeds Home's picker offers. While both
     * switches are on, takes For you out of it, unless that would leave the picker empty. Leaves
     * the list as it was otherwise, or when anything goes wrong. Never throws.
     */
    public static void limitPicker(List<?> feeds) {
        try {
            HookStatus.invoked(FamilyNames.FOLLOWING_FEED);
            if (feeds == null || !Utils.settingsReady() || !Settings.START_ON_FOLLOWING.get()
                    || !Settings.ONLY_FOLLOWING.get()) return;
            int others = 0;
            for (Object feed : feeds) {
                if (!FOR_YOU.contains(feedName(feed))) others++;
            }
            if (others == 0 || others == feeds.size()) return;
            for (int at = feeds.size() - 1; at >= 0; at--) {
                if (FOR_YOU.contains(feedName(feeds.get(at)))) feeds.remove(at);
            }
            if (!loggedPicker) {
                loggedPicker = true;
                Logger.printDebug(() -> "Following feed: For you taken out of the feed picker");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FOLLOWING_FEED, "feed picker", failure);
        }
    }

    /**
     * The name of the feed a picker item stands for: its one field holding an enum constant.
     * Null when the item has no such field.
     */
    static String feedName(Object item) throws IllegalAccessException {
        if (item == null) return null;
        Field field = feedField;
        if (field == null || field.getDeclaringClass() != item.getClass()) {
            field = null;
            for (Field candidate : item.getClass().getDeclaredFields()) {
                if (!candidate.getType().isEnum()) continue;
                if (field != null) return null;
                field = candidate;
            }
            if (field == null) return null;
            field.setAccessible(true);
            feedField = field;
        }
        Object feed = field.get(item);
        return feed instanceof Enum ? ((Enum<?>) feed).name() : null;
    }
}
