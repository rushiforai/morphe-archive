/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.RectF;
import android.view.View;

import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Chat list avatars at a size the person picks. A chat row works out its avatar's square once per
 * layout, and the online dot, the story ring, the unread mark and the archive's pull animation all
 * read that square when they draw. With the switch on, the square shrinks or grows around its own
 * center, so all of them follow, and the avatar's corner radius is scaled with it so a round
 * picture stays round. The row's height and its text don't move.
 */
public final class ChatListAvatar {
    private ChatListAvatar() {}

    /** The sizes a person can pick, as a percent of Telegram's. */
    public static final int[] CHOICES = {70, 80, 90, 110, 120};
    /** The size picked until the person picks another. */
    public static final int DEFAULT = 80;

    /**
     * Each avatar's radius before we scaled it and the radius we set, so a second layout without
     * Telegram setting the radius again scales from Telegram's value instead of from ours.
     * Main thread only, like the chat rows.
     */
    private static final Map<Object, int[]> RADII = new WeakHashMap<>();

    /**
     * Every chat row that has laid itself out, with the square it draws its avatar in and a copy of
     * Telegram's own square from its last layout, so a change to the switch or the size can redo
     * the square without a layout. Main thread only, like the chat rows.
     */
    private static final Map<Object, RectF[]> CELLS = new WeakHashMap<>();

    /**
     * Injected in the chat row's layout right after it sets the avatar's square.
     *
     * @param rect the square, in the row's pixels, changed in place
     * @param cell the chat row
     */
    public static void resize(RectF rect, Object cell) {
        if (rect == null) return;
        if (cell != null) remember(cell, rect);
        apply(rect, cell);
    }

    private static void remember(Object cell, RectF rect) {
        RectF[] squares = CELLS.get(cell);
        if (squares == null || squares[0] != rect) {
            CELLS.put(cell, new RectF[] {rect, new RectF(rect)});
        } else {
            squares[1].set(rect);
        }
    }

    private static void apply(RectF rect, Object cell) {
        boolean on = on();
        if (!on && RADII.isEmpty()) return;
        try {
            int percent = on ? percent(Settings.CHAT_LIST_AVATAR_SIZE.get()) : 100;
            Object image = cell == null ? null : telegram.avatarOf(cell);
            if (image != null) rescaleRadius(image, percent);
            if (percent == 100) return;
            scale(rect, percent);
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, "avatar resized");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "chat list avatar", failure);
        }
    }

    /**
     * Redoes every chat row's avatar square from Telegram's own and redraws the row, so a change to
     * the switch or the size shows now. A chat row skips its layout when nothing it shows has
     * changed, even when asked, so the rows already on screen kept the old size until Telegram
     * restarted (#89). The row draws its avatar, story ring, online dot and unread mark from that
     * square every time, so redoing the square is enough. Main thread only.
     */
    public static void resizeAll() {
        for (Map.Entry<Object, RectF[]> row : new ArrayList<>(CELLS.entrySet())) {
            RectF[] squares = row.getValue();
            squares[0].set(squares[1]);
            apply(squares[0], row.getKey());
            if (row.getKey() instanceof View) ((View) row.getKey()).invalidate();
        }
    }

    /** Shrinks or grows [rect] to [percent] of its size around its center. */
    static void scale(RectF rect, int percent) {
        float halfWidth = rect.width() * percent / 200f;
        float halfHeight = rect.height() * percent / 200f;
        float x = rect.centerX();
        float y = rect.centerY();
        rect.set(x - halfWidth, y - halfHeight, x + halfWidth, y + halfHeight);
    }

    private static void rescaleRadius(Object image, int percent) {
        int[] corners = telegram.radii(image);
        if (corners == null || corners.length != 4) return;
        int current = corners[0];
        for (int corner : corners) {
            if (corner != current) return;
        }
        int[] plan = radiusPlan(current, RADII.get(image), percent);
        if (plan[1] != current) telegram.setRadius(image, plan[1]);
        if (percent == 100) {
            RADII.remove(image);
        } else {
            RADII.put(image, plan);
        }
    }

    /**
     * Telegram's radius and the one to set, from the avatar's [current] radius and what we did
     * last time ([memo], null when nothing). A current radius that is still ours means Telegram
     * hasn't set its own since, so the old base stays; anything else is Telegram's new value.
     */
    static int[] radiusPlan(int current, int[] memo, int percent) {
        int base = memo != null && memo[1] == current ? memo[0] : current;
        int wanted = percent == 100 ? base : Math.round(base * percent / 100f);
        return new int[] {base, wanted};
    }

    /** A saved size if it is one of the choices, otherwise the default. */
    public static int percent(int saved) {
        for (int choice : CHOICES) {
            if (choice == saved) return saved;
        }
        return DEFAULT;
    }

    static boolean on() {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        try {
            return Utils.settingsReady() && Settings.CHAT_LIST_AVATAR.get()
                    && PatchFamily.Capability.CHAT_LIST_AVATAR.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "chat list avatar switch", failure);
            return false;
        }
    }

    /** What this needs from Telegram. */
    interface Telegram {
        Object avatarOf(Object cell);
        int[] radii(Object image);
        void setRadius(Object image, int radius);
    }

    static Telegram telegram = new Stubs();

    private static final class Stubs implements Telegram {
        @Override public Object avatarOf(Object cell) { return ChatListAvatar.avatarOf(cell); }
        @Override public int[] radii(Object image) { return ChatListAvatar.radii(image); }
        @Override public void setRadius(Object image, int radius) { ChatListAvatar.setRadius(image, radius); }
    }

    /** Forgets every remembered radius and row. For tests. */
    static void forget() {
        RADII.clear();
        CELLS.clear();
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** The chat row's avatar ImageReceiver. */
    public static Object avatarOf(Object cell) { return null; }

    /** The ImageReceiver's four corner radii, in pixels. */
    public static int[] radii(Object image) { return null; }

    /** Gives the ImageReceiver one corner radius for all four corners. */
    public static void setRadius(Object image, int radius) {}
}
