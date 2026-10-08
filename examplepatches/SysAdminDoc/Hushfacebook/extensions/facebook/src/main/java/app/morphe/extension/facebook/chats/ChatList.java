/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.chats;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Clean up Facebook's chat list patch asks while Facebook's own Chats builds its list.
 *
 * <p>Two hooks, one per switch. {@link #notesTiles} sits where the state behind the row of notes and
 * active friends above the chats stores its tiles, and hands back no tiles while Hide the notes and active now row
 * is on. {@link #hidesPromotion} sits first in the show question of each promotion banner at the
 * top of Chats, and answers yes while Hide chat list promotions is on, which the patch turns into
 * a no for Facebook. Both fail open: with the switch off, a pause, settings that aren't ready or
 * any failure in here, Facebook gets exactly what it would have built.
 */
public final class ChatList {
    /** The diagnostic counter routes: each time Chats built the piece, and what was taken out. */
    static final String NOTES_ROUTE = "Chat notes tray";
    static final String PROMOTIONS_ROUTE = "Chat list promotions";

    /** What a hidden piece is counted under. */
    static final String NOTES_HIDDEN = "Hide the notes and active now row";
    static final String PROMOTIONS_HIDDEN = "Hide chat list promotions";

    private ChatList() {
    }

    /**
     * Injection point, right before the tile state stores its list. The tiles Facebook built, or
     * an empty list while the notes switch is on. Never throws.
     */
    @Nullable
    public static List<?> notesTiles(@Nullable List<?> tiles) {
        try {
            HookStatus.invoked(FamilyNames.CHAT_LIST);
            if (tiles == null || tiles.isEmpty()) return tiles;
            FeedFilterCounters.sawList(NOTES_ROUTE, tiles.size());
            if (!Utils.settingsReady() || !Settings.HIDE_CHAT_NOTES_TRAY.get()) return tiles;
            FeedFilterCounters.removed(NOTES_ROUTE, tiles.size(), NOTES_HIDDEN);
            return Collections.emptyList();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_LIST, "notes tray tiles", failure);
            return tiles;
        }
    }

    /**
     * Injection point, first thing in a promotion banner's show question. True answers no for
     * Facebook, so the banner isn't shown. Never throws.
     */
    public static boolean hidesPromotion() {
        try {
            HookStatus.invoked(FamilyNames.CHAT_LIST);
            FeedFilterCounters.sawList(PROMOTIONS_ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.HIDE_CHAT_PROMOTIONS.get()) return false;
            FeedFilterCounters.removed(PROMOTIONS_ROUTE, 1, PROMOTIONS_HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_LIST, "promotion banner", failure);
            return false;
        }
    }
}
