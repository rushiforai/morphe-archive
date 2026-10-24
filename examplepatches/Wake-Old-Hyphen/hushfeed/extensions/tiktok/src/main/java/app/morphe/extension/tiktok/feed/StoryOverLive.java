/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.feed;

import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Opens a creator's Story from the picture on their profile while they're LIVE (#233).
 *
 * <p>That picture is an AvatarComponentView, which keeps what it shows in a map keyed by an enum
 * (LIVE, STORY and the rest). Its tap asks the map for LIVE first and only then for a story, so a
 * creator who is LIVE never shows their Story from there. The patch calls {@link #openStory}
 * right before that LIVE check. With the switch on, a LIVE creator with a Story gets the Story:
 * the map's STORY entry holds TikTok's own story opener, the View.OnClickListener the picture
 * runs when no LIVE wins, and it's handed the tapped view. The next tap on the same picture is
 * left to TikTok, which opens the LIVE, so the LIVE stays one tap away.
 *
 * <p>The enum and the story state are renamed every build, so both are found by what they hold:
 * the enum constants keep their names, and the state's opener is its one field that is a
 * View.OnClickListener.
 */
public final class StoryOverLive {
    private static final String LIVE = "LIVE";
    private static final String STORY = "STORY";

    /** The picture the last Story opened from, so the next tap there goes to the LIVE. */
    private static WeakReference<View> storyOpenedFrom = new WeakReference<>(null);

    private StoryOverLive() {}

    /**
     * Called by the profile picture's tap ahead of TikTok's LIVE check, with the picture's map
     * and the tapped view. True means the Story opened and TikTok's own handling is skipped.
     */
    public static boolean openStory(Map<?, ?> business, View avatar) {
        try {
            if (!Settings.OPEN_STORY_OVER_LIVE.get() || business == null || avatar == null) {
                return false;
            }
            boolean secondTap = storyOpenedFrom.get() == avatar;
            View.OnClickListener opener = storyOpener(business);
            if (!storyFirst(holds(business, LIVE), opener != null, secondTap)) {
                if (secondTap) storyOpenedFrom = new WeakReference<>(null);
                return false;
            }
            opener.onClick(avatar);
            storyOpenedFrom = new WeakReference<>(avatar);
            return true;
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not open the Story from the profile picture", ex);
            return false;
        }
    }

    /**
     * Whether a tap opens the Story. Only a creator who is LIVE needs it, since TikTok opens the
     * Story itself otherwise, and only when the Story's opener was found. The tap right after a
     * Story opened from the same picture goes to the LIVE.
     */
    static boolean storyFirst(boolean live, boolean story, boolean secondTap) {
        return live && story && !secondTap;
    }

    /** Forgets the picture the last Story opened from. */
    static void reset() {
        storyOpenedFrom = new WeakReference<>(null);
    }

    /** Whether the map has an entry under the enum constant with this name. */
    static boolean holds(Map<?, ?> business, String name) {
        return entryNamed(business, name) != null;
    }

    /** The View.OnClickListener the map's STORY entry holds, or null without one. */
    static View.OnClickListener storyOpener(Map<?, ?> business) throws IllegalAccessException {
        Map.Entry<?, ?> story = entryNamed(business, STORY);
        Object state = story == null ? null : story.getValue();
        if (state == null) return null;
        for (Class<?> type = state.getClass(); type != null && type != Object.class;
                type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                field.setAccessible(true);
                Object value = field.get(state);
                if (value instanceof View.OnClickListener) return (View.OnClickListener) value;
            }
        }
        return null;
    }

    private static Map.Entry<?, ?> entryNamed(Map<?, ?> business, String name) {
        for (Map.Entry<?, ?> entry : business.entrySet()) {
            Object key = entry.getKey();
            if (key instanceof Enum && name.equals(((Enum<?>) key).name())) return entry;
        }
        return null;
    }
}
