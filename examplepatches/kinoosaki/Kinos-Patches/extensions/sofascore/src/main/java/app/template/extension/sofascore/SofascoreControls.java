package app.template.extension.sofascore;

import app.template.extension.hevalcontrols.HevalSettings;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Runtime hooks of the Sofascore Heval Controls features (the animation switches are in
 * AnimationSpeed). Every method answers the stock value
 * when its feature is off, unknown (its patch was not applied) or on any error.
 */
@SuppressWarnings("unused")
public final class SofascoreControls {

    // ---------------------------------------------------------------------------------------
    // Modal queue: the one-time dialogs, by the name each modal is created with.
    // ---------------------------------------------------------------------------------------

    /**
     * The feature of the modal named {@code name}, or null. A switch, not a static map: the patches
     * find each modal's descriptor by the <clinit> holding its name, and this class must not be one.
     */
    static String modalFeature(String name) {
        switch (name) {
            case "Rating Info": return "sofascore.disable_rating_prompts";
            case "Match of the Week": return "sofascore.hide_modal_match_of_the_week";
            case "Remove Ads": return "sofascore.hide_modal_remove_ads";
            case "Promotion modal": return "sofascore.hide_modal_promotion";
            case "Weekly Challenge": return "sofascore.hide_modal_weekly_challenge";
            case "Survey": return "sofascore.hide_modal_survey";
            case "Propose Follow Entity": return "sofascore.hide_modal_propose_follow";
            default: return null;
        }
    }

    /**
     * Patched into the modal queue (the eligibility check of the startup modals and the enqueue of
     * the on-demand ones): true drops the modal named {@code name} before it is queued. Consent and
     * subscription modals have no switch and always answer false.
     */
    public static boolean hideModal(String name) {
        if (name == null) return false;
        String feature = modalFeature(name);
        return feature != null && HevalSettings.isEnabled(feature);
    }

    // ---------------------------------------------------------------------------------------
    // Match page tabs (EventViewPagerAdapter$Type constants, by name).
    // ---------------------------------------------------------------------------------------

    /** The feature of the match page tab constant {@code name}, or null (a switch, see modalFeature). */
    static String tabFeature(String name) {
        switch (name) {
            case "AI_INSIGHTS": return "sofascore.hide_ai_insights";
            case "COMMENTARY": return "sofascore.hide_tab_commentary";
            case "CROWDSOURCING": return "sofascore.hide_tab_crowdsourcing";
            case "MEDIA": return "sofascore.hide_tab_media";
            case "GRAPHS": return "sofascore.hide_tab_graphs";
            case "STANDINGS": return "sofascore.hide_tab_standings";
            case "CUP_TREE": return "sofascore.hide_tab_cup_tree";
            case "MATCHES": return "sofascore.hide_tab_matches";
            default: return null;
        }
    }

    /**
     * Patched into the match page's navigateToTab, which would add a missing tab back: true makes
     * it answer "not navigated" for a tab whose switch is on.
     */
    public static boolean isEventTabHidden(Enum<?> tab) {
        if (tab == null) return false;
        String feature = tabFeature(tab.name());
        return feature != null && HevalSettings.isEnabled(feature);
    }

    // ---------------------------------------------------------------------------------------
    // Sports: the sport_order table (sport picker, reorder dialog, feed and favourites lists).
    // ---------------------------------------------------------------------------------------

    private static final String SPORT_PREFIX = "sofascore.hide_sport_";

    /** Sofascore's default sport order (Sports.getEntries), the fallback for the first visible sport. */
    private static final String[] DEFAULT_ORDER = {
        "football", "tennis", "basketball", "ice-hockey", "volleyball", "handball", "esports", "mma",
        "baseball", "cricket", "motorsport", "american-football", "rugby", "badminton", "snooker", "darts",
        "futsal", "minifootball", "table-tennis", "beach-volley", "waterpolo", "cycling", "aussie-rules",
        "floorball", "bandy",
    };

    /** The user's sport order, as last read from the database; null until the first read. */
    private static volatile List<String> lastOrder;

    private static volatile Method sportName;
    private static volatile Method sportOrder;
    private static volatile Method selected;
    private static volatile Constructor<?> rowConstructor;

    static boolean isSportHidden(String slug) {
        return slug != null && HevalSettings.isEnabled(SPORT_PREFIX + slug.replace('-', '_'));
    }

    /**
     * "SELECT * FROM sport_order ORDER BY sportOrder ASC" (List of DbSportOrder): drops the hidden
     * sports. When the selected sport is hidden, the first visible row is returned as selected.
     * Never returns an empty list (the app would seed the table again): with every sport hidden the
     * list stays as it is.
     */
    public static List<Object> filterSportOrders(List<Object> rows) {
        if (rows == null || rows.isEmpty()) return rows;
        try {
            Class<?> type = rows.get(0).getClass();
            Method name = sportName;
            if (name == null || name.getDeclaringClass() != type) {
                name = type.getMethod("getSportName");
                sportOrder = type.getMethod("getSportOrder");
                selected = type.getMethod("isSelected");
                rowConstructor = type.getConstructor(String.class, int.class, boolean.class);
                sportName = name;
            }
            List<String> order = new ArrayList<>(rows.size());
            List<Object> visible = new ArrayList<>(rows.size());
            boolean selectionHidden = false;
            for (Object row : rows) {
                String slug = (String) name.invoke(row);
                order.add(slug);
                if (isSportHidden(slug)) {
                    if ((Boolean) selected.invoke(row)) selectionHidden = true;
                } else {
                    visible.add(row);
                }
            }
            lastOrder = order;
            if (visible.isEmpty() || visible.size() == rows.size()) return rows;
            if (selectionHidden) {
                Object first = visible.get(0);
                visible.set(0, rowConstructor.newInstance(name.invoke(first), sportOrder.invoke(first), true));
            }
            return visible;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(SPORT_PREFIX + "list", failure);
            return rows;
        }
    }

    /** "SELECT sportName FROM sport_order ORDER BY sportOrder ASC": drops the hidden sports, never all. */
    public static List<String> filterSportNames(List<String> names) {
        if (names == null || names.isEmpty()) return names;
        try {
            lastOrder = new ArrayList<>(names);
            List<String> visible = new ArrayList<>(names.size());
            for (String slug : names) {
                if (!isSportHidden(slug)) visible.add(slug);
            }
            return visible.isEmpty() || visible.size() == names.size() ? names : visible;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(SPORT_PREFIX + "list", failure);
            return names;
        }
    }

    /**
     * The selected sport ("PREF_HOME_SPORT_V2" and "SELECT sportName FROM sport_order WHERE
     * isSelected = 1"): a hidden one is replaced by the first visible sport in the user's order.
     */
    public static String visibleSport(String slug) {
        try {
            if (slug == null || !isSportHidden(slug)) return slug;
            List<String> order = lastOrder;
            if (order != null) {
                for (String candidate : order) {
                    if (!isSportHidden(candidate)) return candidate;
                }
            }
            for (String candidate : DEFAULT_ORDER) {
                if (!isSportHidden(candidate)) return candidate;
            }
            return slug;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(SPORT_PREFIX + "list", failure);
            return slug;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Promo sections: Firebase Remote Config booleans that switch promotional sections on.
    // ---------------------------------------------------------------------------------------

    /** The feature of the remote config key {@code key}, or null (a switch, see modalFeature). */
    static String promoSectionFeature(String key) {
        switch (key) {
            case "should_show_world_cup": return "sofascore.hide_promo_world_cup";
            case "should_show_sofa_season_2025": return "sofascore.hide_promo_sofa_season";
            case "show_referral": return "sofascore.hide_promo_referral";
            case "fantasy_is_available": return "sofascore.hide_promo_fantasy";
            case "show_pick_dream_team_banner": return "sofascore.hide_promo_dream_team";
            case "nba_banner": return "sofascore.hide_promo_nba";
            case "promotion_sfl": return "sofascore.hide_promo_sfl";
            case "promotion_utr": return "sofascore.hide_promo_utr";
            case "promotion_sevilla_and_marseille": return "sofascore.hide_promo_sevilla_marseille";
            case "in_app_message": return "sofascore.hide_promo_in_app_messages";
            default: return null;
        }
    }

    /**
     * Patched into Remote Config's getBoolean: true makes the key {@code key} read as false
     * (section off) while its switch is on.
     */
    public static boolean hidePromoSection(String key) {
        if (key == null) return false;
        String feature = promoSectionFeature(key);
        return feature != null && HevalSettings.isEnabled(feature);
    }

    // ---------------------------------------------------------------------------------------
    // Match chat: the "Chat" button (an ExtendedFloatingActionButton with the id
    // floating_action_button) on match, league, team and stage pages.
    // ---------------------------------------------------------------------------------------

    static final String HIDE_MATCH_CHAT = "sofascore.hide_match_chat";

    private static int chatButtonId;

    /** The chat buttons already kept hidden, so each gets one guard. */
    private static final java.util.Map<android.view.View, Boolean> GUARDED = new java.util.WeakHashMap<>();

    private static boolean isChatButton(android.view.View view) {
        if (chatButtonId == 0) {
            android.content.Context context = view.getContext();
            int id = context.getResources().getIdentifier("floating_action_button", "id", context.getPackageName());
            chatButtonId = id != 0 ? id : -1;
        }
        return chatButtonId != -1 && view.getId() == chatButtonId;
    }

    /**
     * Patched in at the start of the chat button helper (which shows the button and sets its click
     * listener) and of the button's show/hide/extend/shrink motion: true makes the caller return at
     * once. While the switch is on, the chat button is set GONE and a pre-draw guard keeps it GONE
     * against the pages that also set its visibility directly. Other buttons and the switch off:
     * false (stock).
     */
    public static boolean hideChatButton(android.view.View view) {
        try {
            if (view == null || !HevalSettings.isEnabled(HIDE_MATCH_CHAT) || !isChatButton(view)) return false;
            view.setVisibility(android.view.View.GONE);
            synchronized (GUARDED) {
                if (GUARDED.put(view, Boolean.TRUE) == null) {
                    final java.lang.ref.WeakReference<android.view.View> ref = new java.lang.ref.WeakReference<>(view);
                    view.getViewTreeObserver().addOnPreDrawListener(new android.view.ViewTreeObserver.OnPreDrawListener() {
                        @Override
                        public boolean onPreDraw() {
                            android.view.View button = ref.get();
                            if (button == null || button.getVisibility() == android.view.View.GONE) return true;
                            button.setVisibility(android.view.View.GONE);
                            return false;
                        }
                    });
                }
            }
            return true;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(HIDE_MATCH_CHAT, failure);
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Main tabs: the bottom bar of the main screen (its tab enum constants, by name).
    // ---------------------------------------------------------------------------------------

    /** The feature of the main tab constant {@code name}, or null (a switch, see modalFeature). */
    static String mainTabFeature(String name) {
        switch (name) {
            case "FAVORITES": return "sofascore.hide_main_tab_favorites";
            case "FEED": return "sofascore.hide_main_tab_feed";
            case "FANTASY": return "sofascore.hide_main_tab_fantasy";
            case "FEATURED_TOURNAMENT":
            case "WORLD_CUP": return "sofascore.hide_main_tab_featured";
            default: return null;
        }
    }

    /**
     * Patched in before the main tab list is returned: drops the tabs whose switch is on. The sport
     * tab has no switch, so the list never ends up empty. Opening a dropped tab (a notification or
     * link) finds no page for it and stays on the current tab.
     */
    public static java.util.ArrayList<Object> filterMainTabs(java.util.ArrayList<Object> tabs) {
        if (tabs == null) return null;
        try {
            java.util.Iterator<Object> iterator = tabs.iterator();
            while (iterator.hasNext()) {
                Object tab = iterator.next();
                if (!(tab instanceof Enum)) continue;
                String feature = mainTabFeature(((Enum<?>) tab).name());
                if (feature != null && tabs.size() > 1 && HevalSettings.isEnabled(feature)) iterator.remove();
            }
        } catch (Throwable failure) {
            HevalSettings.reportFailure("sofascore.hide_main_tab", failure);
        }
        return tabs;
    }

    // ---------------------------------------------------------------------------------------
    // Widgets: the periodic refresh work.
    // ---------------------------------------------------------------------------------------

    /** One hour, the widget refresh interval while "Slower widget refresh" is on. */
    private static final long SLOW_WIDGET_REFRESH_MILLIS = 60L * 60L * 1000L;

    /**
     * Patched in after the widget refresh work's repeat interval (30 minutes in 26.10.19) is
     * loaded: answers one hour while the switch is on (never shorter than the app's own value),
     * the app's value otherwise.
     */
    public static long widgetRefreshInterval(long interval) {
        if (!HevalSettings.isEnabled("sofascore.slower_widget_refresh")) return interval;
        return Math.max(interval, SLOW_WIDGET_REFRESH_MILLIS);
    }

    private SofascoreControls() { }
}
