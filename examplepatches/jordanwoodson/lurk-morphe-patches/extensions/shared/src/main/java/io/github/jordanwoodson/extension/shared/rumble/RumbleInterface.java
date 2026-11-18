package io.github.jordanwoodson.extension.shared.rumble;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/** Interface settings for Rumble. With a setting off, each hook returns Rumble's own value. */
@SuppressWarnings("unused")
public final class RumbleInterface {
    private static Locale countLocale;
    private static NumberFormat countFormat;

    private RumbleInterface() {
    }

    // ---------------------------------------------------------------------------------------------
    // Show exact counts

    /** Injection point: a count in full, grouped the device locale's way (12,345). */
    public static synchronized String exactCount(long count) {
        Locale locale = Locale.getDefault();
        if (countFormat == null || !locale.equals(countLocale)) {
            countFormat = NumberFormat.getIntegerInstance(locale);
            countLocale = locale;
        }
        return countFormat.format(count);
    }

    // ---------------------------------------------------------------------------------------------
    // Channel action buttons (Hide tipping and Rants, Hide Join and Shop buttons)

    static final String HIDE_TIPPING = "hide_tipping";
    static final String HIDE_JOIN = "hide_join_button";
    static final String HIDE_SHOP = "hide_shop_button";

    /** The last lists handed out, so a composable drawn again with the same list gets the same list back. */
    private static final int REMEMBERED = 8;
    private static final Object[][] BUTTONS = new Object[REMEMBERED][];
    private static int nextButtons;

    /** Whether a switch of an included patch is on. Keys of patches left out count as off here. */
    static boolean on(String key) {
        return Settings.isRegistered(key) && Settings.isEnabled(key);
    }

    /**
     * Injection point: the start of the composable that draws a channel's or video's action buttons, with the
     * list of buttons it may draw and Rumble's Tip, Join and Shop constants. Returns the list without the
     * buttons whose switch is on: the same list while none is, and the same filtered list as last time for the
     * same list, so Compose can still skip the buttons when nothing changed.
     */
    public static List<?> actionButtons(List<?> buttons, Object tip, Object join, Object shop) {
        if (buttons == null || buttons.isEmpty()) return buttons;
        boolean hideTip = tip != null && on(HIDE_TIPPING);
        boolean hideJoin = join != null && on(HIDE_JOIN);
        boolean hideShop = shop != null && on(HIDE_SHOP);
        if (!hideTip && !hideJoin && !hideShop) return buttons;
        int settings = (hideTip ? 1 : 0) | (hideJoin ? 2 : 0) | (hideShop ? 4 : 0);
        synchronized (BUTTONS) {
            for (Object[] remembered : BUTTONS) {
                if (remembered != null && ((WeakReference<?>) remembered[0]).get() == buttons
                        && (Integer) remembered[1] == settings) {
                    return (List<?>) remembered[2];
                }
            }
        }
        List<Object> kept = new ArrayList<>(buttons.size());
        for (Object button : buttons) {
            if ((hideTip && button == tip) || (hideJoin && button == join) || (hideShop && button == shop)) continue;
            kept.add(button);
        }
        List<?> result = kept.size() == buttons.size() ? buttons : Collections.unmodifiableList(kept);
        synchronized (BUTTONS) {
            BUTTONS[nextButtons] = new Object[]{new WeakReference<>(buttons), settings, result};
            nextButtons = (nextButtons + 1) % REMEMBERED;
        }
        return result;
    }

    // ---------------------------------------------------------------------------------------------
    // Video lists (Block ads, Hide premium-only videos, Hide related videos)

    /** RumbleInterface.videos list kinds, as the patch passes them. */
    static final int LIST = 0;
    static final int RELATED = 1;

    /**
     * Injection point: a list of videos from Rumble's server (Home sections, related videos, search, categories),
     * with its kind. Leaves out Boosted videos (Block ads), premium-only videos you have no access to (Hide
     * premium-only videos), and every related video (Hide related videos). Rumble's own list while none applies.
     */
    public static List<?> videos(List<?> videos, int kind) {
        if (videos == null || videos.isEmpty()) return videos;
        if (kind == RELATED && on("hide_related_videos")) return Collections.emptyList();
        boolean boosted = on("block_ads");
        boolean premiumOnly = on("hide_premium_only");
        if (!boosted && !premiumOnly) return videos;
        try {
            List<Object> kept = null;
            for (int i = 0; i < videos.size(); i++) {
                Object video = videos.get(i);
                boolean drop = video != null && ((boosted && RumbleChat.read(video, "boosted") != null)
                        || (premiumOnly && premiumOnly(video)));
                if (drop && kept == null) {
                    kept = new ArrayList<>(videos.size());
                    for (int j = 0; j < i; j++) kept.add(videos.get(j));
                } else if (!drop && kept != null) {
                    kept.add(video);
                }
            }
            return kept == null ? videos : kept;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return videos;
        }
    }

    /** Whether a Video DTO is premium-only (availability "premium", as Rumble's mapper reads it) and locked. */
    static boolean premiumOnly(Object video) throws ReflectiveOperationException {
        Object availability = RumbleChat.read(video, "availability");
        if (!(availability instanceof String) || !((String) availability).equalsIgnoreCase("premium")) return false;
        return !Boolean.TRUE.equals(RumbleChat.read(video, "hasAccessToPremium"));
    }

    // ---------------------------------------------------------------------------------------------
    // Hide Shorts

    /**
     * Injection point: My Feed's filter pills from Rumble's server (FollowingFeedPillsData.items, whose items keep
     * their "id" field: "all", "today", ..., "shorts"). Leaves out the Shorts pill while Hide Shorts is on;
     * Rumble's own list otherwise.
     */
    public static List<?> feedPills(List<?> pills) {
        if (pills == null || pills.isEmpty() || !on("hide_shorts")) return pills;
        try {
            List<Object> kept = null;
            for (int i = 0; i < pills.size(); i++) {
                Object pill = pills.get(i);
                boolean drop = pill != null && "shorts".equals(RumbleChat.read(pill, "id"));
                if (drop && kept == null) {
                    kept = new ArrayList<>(pills.size());
                    for (int j = 0; j < i; j++) kept.add(pills.get(j));
                } else if (!drop && kept != null) {
                    kept.add(pill);
                }
            }
            return kept == null ? pills : kept;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return pills;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Hide Home sections

    private static volatile Field titleField;

    /**
     * Injection point: the kind of a Home section from the server (HomeSectionDto.kind). "hide" for a row of
     * categories, creators or playlists whose switch is on, or a section whose title is listed.
     */
    public static String homeSectionKind(Object section, String kind) {
        if (kind == null) return null;
        if (("categories".equals(kind) && Settings.isEnabled("home_hide_categories"))
                || ("creators".equals(kind) && Settings.isEnabled("home_hide_creators"))
                || ("playlists".equals(kind) && Settings.isEnabled("home_hide_playlists"))) {
            return "hide";
        }
        String titles = Settings.getText("home_hide_titles");
        if (titles.trim().isEmpty() || section == null) return kind;
        try {
            Field field = titleField;
            if (field == null) {
                field = section.getClass().getDeclaredField("title");
                field.setAccessible(true);
                titleField = field;
            }
            Object title = field.get(section);
            if (!(title instanceof String)) return kind;
            String wanted = ((String) title).trim();
            for (String entry : ChatFilter.entries(titles)) {
                if (entry.equalsIgnoreCase(wanted)) return "hide";
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            return kind;
        }
        return kind;
    }

    // ---------------------------------------------------------------------------------------------
    // AMOLED black

    static final String AMOLED_BLACK = "amoled_black";
    static final String AMOLED_NEAR_BLACK = "amoled_near_black";
    static final long BLACK = 0xFF000000L;
    /** Near-black surfaces: one step above black, the near-black of Kick's AMOLED black. */
    static final long NEAR_BLACK = 0xFF0B0B0CL;

    /**
     * Injection point: Rumble's dark grey for raised surfaces (ARGB, #1B2127) on its way into Compose's
     * Color(Long), where the theme's color set and the palette are built, once per process. Black while
     * AMOLED black is on, near-black with Near-black surfaces, else Rumble's grey.
     */
    public static long amoledSurface(long argb) {
        if (!on(AMOLED_BLACK)) return argb;
        long surface = on(AMOLED_NEAR_BLACK) ? NEAR_BLACK : BLACK;
        Logger.d("amoled black: surfaces " + Long.toHexString(surface));
        return surface;
    }
}
