package dev.hyzor.extension.chesscom.premium;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import dev.hyzor.extension.chesscom.Features;
import dev.hyzor.extension.chesscom.Utils;

/**
 * Each hook returns what a Premium member's app already gets (no offer, no icon, no Upgrade row),
 * so nothing is unlocked: the server still decides what an account may play.
 */
public final class Premium {
    private static Method premium;
    private static Method canPlay;

    private Premium() {}

    private static boolean enabled() {
        return Features.hidePremiumPatched() && Features.isEnabled(Features.HIDE_PREMIUM);
    }

    /** The fixed "Try Premium" banner: draw it only while premium content is shown. */
    public static boolean hideBanner() {
        return enabled();
    }

    /** Home card and More banner: the offer a Premium member gets, which is none. */
    public static Object offer(Object offer) {
        return enabled() ? null : offer;
    }

    /** The redesigned Home's toolbar: no diamond. */
    public static boolean showDiamond(boolean show) {
        return show && !enabled();
    }

    /** The More tab's rows without Membership. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List moreItems(List items) {
        if (items == null || !enabled()) return items;
        List kept = new ArrayList(items.size());
        for (Object item : items) {
            if (!String.valueOf(item).startsWith("MoreMenuItemUiModel(key=MEMBERSHIP,")) kept.add(item);
        }
        return kept.size() == items.size() ? items : kept;
    }

    /**
     * Bot personalities as the server sent them, minus those that are Premium bots and that this
     * account may not play. Bots locked for other reasons (event rewards) stay.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List playableBots(List personalities) {
        if (personalities == null || !enabled()) return personalities;
        List kept = new ArrayList(personalities.size());
        for (Object personality : personalities) {
            if (!premiumLocked(personality)) kept.add(personality);
        }
        return kept.size() == personalities.size() ? personalities : kept;
    }

    /** Adds a bot group to the list unless filtering left it without bots. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void addBotGroup(Collection groups, Object group, List bots) {
        if (enabled() && bots != null && bots.isEmpty()) return;
        groups.add(group);
    }

    /**
     * A mutable copy of a settings row list with the Upgrade row filtered, or null for null. The
     * return type is ArrayList because the settings adapter keeps its combined rows in an
     * ArrayList field: writing a plain List there fails the DEX verifier and opening Settings
     * crashes. ArrayList is assignable to both that field and the List fields.
     */
    @SuppressWarnings("rawtypes")
    public static ArrayList copyFilteredSettingsRows(List rows) {
        if (rows == null) return null;
        ArrayList copy = new ArrayList(rows);
        filterSettingsRows(copy);
        return copy;
    }

    public static void filterSettingsRows(List rows) {
        if (rows == null || !enabled()) return;
        int upgrade = Utils.resourceId("upgrade", "string");
        if (upgrade == 0) return;
        // Rows print as "SettingsMenuItem(id=..., drawableResId=..., stringResId=...)".
        String marker = "stringResId=" + upgrade + ")";
        Iterator iterator = rows.iterator();
        while (iterator.hasNext()) {
            if (String.valueOf(iterator.next()).endsWith(marker)) iterator.remove();
        }
    }

    private static boolean premiumLocked(Object personality) {
        try {
            if (premium == null) {
                premium = personality.getClass().getMethod("getPremium");
                canPlay = personality.getClass().getMethod("getCan_play");
            }
            return Boolean.TRUE.equals(premium.invoke(personality))
                && Boolean.FALSE.equals(canPlay.invoke(personality));
        } catch (Throwable throwable) {
            Utils.logError("bot access", throwable);
            return false;
        }
    }
}
