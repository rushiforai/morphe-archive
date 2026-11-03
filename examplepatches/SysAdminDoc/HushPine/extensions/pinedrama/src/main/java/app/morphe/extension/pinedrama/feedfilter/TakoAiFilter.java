/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.pinedrama.feedfilter;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.pinedrama.blockauthor.Reflect;
import app.morphe.extension.pinedrama.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.feed.model.banner.BannerCommonKey;
import com.ss.android.ugc.aweme.feed.model.banner.BannerCommonStruct;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public final class TakoAiFilter {
    private static final int MAX_LOGS = 20;
    private static final AtomicInteger floatingButtonRouteLogCount = new AtomicInteger();
    private static final AtomicInteger boundViewHideLogCount = new AtomicInteger();

    private TakoAiFilter() {}

    public static boolean shouldHideFeedButton() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY,
                "floating button " + (enabled ? "hidden" : "left"));
        logFloatingButtonRoute("feed-tako-state", enabled);
        return enabled;
    }

    public static void hideBoundFeedButtonView(View view) {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY,
                "bound button " + (enabled ? "hidden" : "left"));
        if (!enabled || view == null) return;

        view.setVisibility(View.GONE);
        logBoundViewHide();
    }

    private static final String HOOK_FAMILY = "tako AI";
    private static final AtomicInteger askBarHideLogCount = new AtomicInteger();

    /**
     * The "Ask" strip under a video's caption (issue #6), a second Tako surface the floating
     * button switch never covered. It is a slot component bound per video; asked at the top of
     * that bind, so the strip is neither filled nor shown.
     */
    public static boolean shouldHideAskBar() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "ask bar " + (enabled ? "hidden" : "left"));
        return enabled;
    }

    /** The slot's content view, hidden in place of the bind the guard skipped. */
    public static void hideAskBar(View view) {
        if (view == null) return;
        view.setVisibility(View.GONE);
        int count = askBarHideLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Ask bar hidden");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Ask bar hidden (further logs suppressed)");
        }
    }

    /**
     * The Tako bubble at the bottom right of a feed video (discussion #115), an entrance of its
     * own. Its bind only tells the entrance's view model whether to show, and is asked first, so
     * nothing ever says show.
     */
    public static boolean shouldHideRightBottomEntrance() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "corner bubble " + (enabled ? "hidden" : "left"));
        return enabled;
    }

    /**
     * The same entrance's view, just laid out by its base class. With the switch on it goes GONE
     * and the true answer skips the coroutine that would show it again.
     */
    public static boolean hideRightBottomEntrance(View view) {
        if (!shouldHideRightBottomEntrance()) return false;
        if (view != null) view.setVisibility(View.GONE);
        return true;
    }

    /**
     * The Tako entrance floating over the search page (issue #22), either a lone Ask Tako bubble
     * or a Voice and Ask Tako pill. Asked before PineDrama inflates it, so nothing is built.
     */
    public static boolean shouldHideSearchEntrance() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "search entrance " + (enabled ? "hidden" : "left"));
        return enabled;
    }

    private static final String SEARCH_TABS_READ = "search tabs read";
    private static final String SEARCH_TAB_HIDDEN = "search tab hidden";
    private static final String SEARCH_TAB_LEFT = "search tab left";
    /**
     * The keys an Ask Tako tab would be served under, with any tab whose name says Tako. This
     * filter is the guard for a build that serves it as data, and it logs the keys it meets so an
     * export says what the strip held.
     */
    private static final Set<String> TAKO_TAB_KEYS = Set.of("tako", "ask_tako", "tako_tab", "asktako");

    /**
     * The search results tab strip (Ask Tako, Top, Users, Videos, ...) arrives as a list of
     * dynamic tab infos whose only consumer, the strip's view model, reads it through two getters
     * the patch filters here. With Hide the Tako bubble on the Ask Tako tab is dropped, so the
     * strip is built without it and the other tabs keep their order; with it off, and when the
     * tab is not in the list, the list goes back as it came. Fails open, the way the banners do.
     */
    public static List filterSearchTabs(List tabs) {
        HookStatus.bound(HOOK_FAMILY, SEARCH_TABS_READ);
        if (tabs == null || tabs.isEmpty()) return tabs;
        try {
            noteSearchTabKeys(tabs);
            boolean hide = Settings.HIDE_TAKO_AI.get();
            List kept = null;
            boolean seen = false;
            for (int i = 0; i < tabs.size(); i++) {
                Object tab = tabs.get(i);
                boolean tako = isTakoTab(tab);
                if (tako) seen = true;
                if (tako && hide) {
                    if (kept == null) kept = new ArrayList(tabs.subList(0, i));
                } else if (kept != null) {
                    kept.add(tab);
                }
            }
            if (seen) HookStatus.bound(HOOK_FAMILY, hide ? SEARCH_TAB_HIDDEN : SEARCH_TAB_LEFT);
            return kept == null ? tabs : kept;
        } catch (Throwable failure) {
            // A build whose tab model moved: leave the strip as PineDrama sent it and say so.
            HookStatus.threw(HOOK_FAMILY, "search tabs", failure);
            return tabs;
        }
    }

    static boolean isTakoTab(Object tab) {
        String key = Reflect.string(tab, "getTabKey", "tabKey");
        if (key != null && TAKO_TAB_KEYS.contains(key.trim().toLowerCase(java.util.Locale.ROOT))) return true;
        String name = Reflect.string(tab, "getTabName", "tabName");
        return name != null && name.toLowerCase(java.util.Locale.ROOT).contains("tako");
    }

    /**
     * The keys served: one marker per distinct set (HookStatus keeps one of a name, and honours a
     * clear) and, with diagnostic logging on, a line the export carries.
     */
    private static void noteSearchTabKeys(List tabs) {
        StringBuilder keys = new StringBuilder();
        for (Object tab : tabs) {
            String key = Reflect.string(tab, "getTabKey", "tabKey");
            if (key == null) continue;
            if (keys.length() > 0) keys.append(',');
            keys.append(key);
        }
        String set = keys.toString();
        if (set.isEmpty()) return;
        HookStatus.bound(HOOK_FAMILY, "search tab keys " + set);
        if (BaseSettings.DEBUG.get()) {
            Logger.printInfo(() -> "[Morphe PineDrama TakoAI] Search tabs served: " + set);
        }
    }

    private static final String SEARCH_QUESTIONS_CARD = "search questions card";
    private static final int SEARCH_QUESTIONS_CARD_WRAPPERS = 4;

    /**
     * The "People also ask Tako" card in the search results (47.4.3, an Italian account's "Le
     * persone chiedono anche a Tako" on a landmark search): a Tako header over a list of questions
     * that each open Tako, in a full-width row of its own between the video rows. It is a native
     * card, not a Lynx one, laid out by SearchTakoSugCardAssem, whose view is handed here once it
     * is created. With the switch on the card goes, and so does its row once the row is in the
     * results list. The switch takes effect on restart and a row of this kind holds only these
     * cards, so nothing has to give the row back later.
     */
    public static void hideSearchSugCard(View view) {
        try {
            boolean enabled = Settings.HIDE_TAKO_AI.get();
            HookStatus.bound(HOOK_FAMILY, SEARCH_QUESTIONS_CARD + (enabled ? " hidden" : " left"));
            if (!enabled || view == null) return;
            collapse(view);
            // The view is created before its row joins the list, and a post on a detached view
            // runs when it is attached, which is when the row can be found.
            view.post(() -> {
                try {
                    collapseSearchSugCardRow(view);
                } catch (Throwable failure) {
                    HookStatus.threw(HOOK_FAMILY, SEARCH_QUESTIONS_CARD, failure);
                }
            });
        } catch (Throwable failure) {
            // A build whose card moved: leave it as PineDrama laid it out and say so.
            HookStatus.threw(HOOK_FAMILY, SEARCH_QUESTIONS_CARD, failure);
        }
    }

    /**
     * The card's row in the results list: a RecyclerView lays a row out at its own height whatever
     * its visibility, so the row goes to no height as well.
     */
    static void collapseSearchSugCardRow(View view) {
        View row = searchSugCardRow(view);
        if (row == null) {
            HookStatus.bound(HOOK_FAMILY, SEARCH_QUESTIONS_CARD + " row not found");
            return;
        }
        collapse(row);
        HookStatus.bound(HOOK_FAMILY, SEARCH_QUESTIONS_CARD + " row collapsed");
    }

    /**
     * The view, or the wrapper holding it, whose parent is a RecyclerView (PineDrama's subclasses
     * included), within a few levels. Null when the card sits in no list, or when a wrapper on the
     * way up holds something else visible, since that row is more than the card (the card itself
     * is already gone at no height, which leaves the rest of such a row standing).
     */
    static View searchSugCardRow(View view) {
        View current = view;
        for (int level = 0; level <= SEARCH_QUESTIONS_CARD_WRAPPERS; level++) {
            ViewParent parent = current.getParent();
            if (!(parent instanceof ViewGroup)) return null;
            if (isRecyclerView(parent.getClass())) return current;
            if (!holdsOnly((ViewGroup) parent, current)) return null;
            current = (View) parent;
        }
        return null;
    }

    private static boolean holdsOnly(ViewGroup group, View child) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View other = group.getChildAt(i);
            if (other != child && other.getVisibility() != View.GONE) return false;
        }
        return true;
    }

    private static boolean isRecyclerView(Class<?> type) {
        for (Class<?> current = type; current != null && current != View.class; current = current.getSuperclass()) {
            if ("RecyclerView".equals(current.getSimpleName())) return true;
        }
        return false;
    }

    private static void collapse(View view) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.height = 0;
            view.setLayoutParams(params);
        }
        view.setVisibility(View.GONE);
    }

    private static final String SEARCH_ANSWER_CARD = "search answer card";
    private static final String SEARCH_CARDS_READ = "search cards read";

    /**
     * The search card protocols that draw a Tako AI answer. They live in a plugin PineDrama downloads
     * (df_search_top1) and keep their real names, since PineDrama's own service list loads them by
     * name. The S22 card ("TikTok Tako · AI summary from", 47.4.3) comes from that plugin's
     * ainative/tako package.
     */
    static final Set<String> SEARCH_ANSWER_PROTOCOLS = Set.of(
            "com.ss.android.ugc.aweme.search.pages.result.ainative.protocol.Top1AnswerAINativeCardProtocol",
            "com.ss.android.ugc.aweme.search.pages.result.pov.ui.expand.Top1AnswerExpandCardProtocol",
            "com.ss.android.ugc.aweme.search.pages.result.bot.component.SearchTakoCardProtocol"
    );

    // ConcurrentHashMap.newKeySet() is API 24, and this class loads on API 23 phones too.
    private static final Set<String> seenSearchCardProtocols =
            Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());

    /**
     * The AI answer card at the top of a search's Top tab: a "PineDrama Tako · AI summary from"
     * header, a summary and "See more". Handed here as PineDrama builds the view holder a native
     * search card sits in, with the holder's view and the protocol. The protocol builds the
     * holder's UI and every bind goes through it, so a holder only ever shows its own protocol's
     * cards, and with the switch on an AI answer holder's view goes to no height for good, and
     * back to no height whenever its row is attached again. The switch takes effect on restart, like the questions card. With
     * diagnostic logging on, each protocol seen is logged once, so an export says which card
     * a build drew.
     */
    public static void hideSearchAnswerCard(View view, Object protocol) {
        if (protocol != null) hideSearchAnswerCard(view, protocol.getClass().getName());
    }

    /** The same, with the protocol's class name. */
    static void hideSearchAnswerCard(View view, String name) {
        try {
            if (view == null) return;
            HookStatus.bound(HOOK_FAMILY, SEARCH_CARDS_READ);
            if (BaseSettings.DEBUG.get() && seenSearchCardProtocols.add(name)) {
                Logger.printInfo(() -> "[Morphe PineDrama TakoAI] Search card protocol: " + name);
            }
            if (!SEARCH_ANSWER_PROTOCOLS.contains(name)) return;
            boolean enabled = Settings.HIDE_TAKO_AI.get();
            HookStatus.bound(HOOK_FAMILY, SEARCH_ANSWER_CARD + (enabled ? " hidden" : " left"));
            if (!enabled) return;
            collapseRow(view);
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                @Override
                public void onViewAttachedToWindow(View attached) {
                    try {
                        collapseRow(attached);
                    } catch (Throwable failure) {
                        HookStatus.threw(HOOK_FAMILY, SEARCH_ANSWER_CARD, failure);
                    }
                }

                @Override
                public void onViewDetachedFromWindow(View detached) {}
            });
        } catch (Throwable failure) {
            // A build whose holder moved: leave the card as PineDrama laid it out and say so.
            HookStatus.threw(HOOK_FAMILY, SEARCH_ANSWER_CARD, failure);
        }
    }

    /**
     * A list row at no height. A row inflated without a parent has no layout params yet, and the
     * list would give it wrap-content ones and measure the card, so it gets its own zero height,
     * which the list keeps when it converts them.
     */
    static void collapseRow(View row) {
        if (row.getLayoutParams() == null) {
            row.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0));
        }
        collapse(row);
    }

    /**
     * The commentv2 bridge that hands the Tako service the comments sheet's top bar questions.
     * Its base class serves nine bridges, ads and shop among them, so the guard on that base
     * asks here with the service in hand and only this one is answered. The patch pins the class
     * name against each build, so a rename fails the patch rather than the comparison.
     */
    static final String COMMENT_TOP_BAR_BRIDGE = "BgTakoTopBarServiceImpl";

    /**
     * The Tako bar inside the comments sheet, the "related words" strip above the comment list.
     * Asked through the bridge base's canShow below: a false answer is the business condition the
     * sheet's resolver already treats as "no component".
     */
    public static boolean shouldHideCommentTopBar() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "comment bar " + (enabled ? "hidden" : "left"));
        return enabled;
    }

    /** The bridge base's canShow asks here, answered only for the Tako bridge. */
    public static boolean shouldHideBridgedCommentTopBar(Object service) {
        if (service == null || !COMMENT_TOP_BAR_BRIDGE.equals(service.getClass().getSimpleName())) {
            return false;
        }
        return shouldHideCommentTopBar();
    }

    static final String CAPTION_PANEL_ASKED = "caption panel asked";
    static final String CAPTION_PANEL_SKIPPED = "caption panel skipped";

    /**
     * Issue #162. On some For You videos a tap on the caption, or its "more", opens TikTok's
     * search panel instead of expanding the caption: the caption again, then "Discover more with
     * Tako" and an "Ask Tako" box. The caption handler asks one gate before it hands the tap to
     * that panel, and on a no it expands the caption in place, the same path a video with nothing
     * to search takes. This is the gate's answer on its way to that branch: with the switch on the
     * panel is never asked for; with it off, or while HushPine is paused, PineDrama's answer stands.
     */
    public static boolean allowCaptionSearchPanel(boolean tikTok) {
        HookStatus.bound(HOOK_FAMILY, CAPTION_PANEL_ASKED);
        if (!tikTok || !Settings.HIDE_TAKO_AI.get()) return tikTok;
        HookStatus.bound(HOOK_FAMILY, CAPTION_PANEL_SKIPPED);
        return false;
    }

    static final String SMART_SEARCH_CAPTION_ASKED = "smart search caption asked";
    static final String SMART_SEARCH_CAPTION_DROPPED = "smart search caption dropped";

    /**
     * Issue #162. On a video with smart search info the caption always shows a "more" that leads
     * into the search panel, even when the whole caption fits, so with the panel skipped (see
     * {@link #allowCaptionSearchPanel}) it led nowhere. PineDrama's helper decides that from a flag
     * that says the video has smart search info; this is that flag on its way in. With the switch
     * on it says no, which gives the caption the layout of a video without Tako content: "more"
     * only where the text is cut, and an expand in place. With it off, or while HushPine is
     * paused, the flag is PineDrama's own.
     */
    public static boolean allowSmartSearchCaption(boolean hasSmartSearchInfo) {
        HookStatus.bound(HOOK_FAMILY, SMART_SEARCH_CAPTION_ASKED);
        if (!hasSmartSearchInfo || !Settings.HIDE_TAKO_AI.get()) return hasSmartSearchInfo;
        HookStatus.bound(HOOK_FAMILY, SMART_SEARCH_CAPTION_DROPPED);
        return false;
    }

    /** The component key PineDrama gives the "Ask · topic" banner under a feed video. */
    static final String ASK_BANNER_KEY = "bottom_banner_tako";
    private static final String SEARCH_BANNER_KEY = "bottom_banner_search_rs";
    private static final String BANNERS_READ = "bottom banners read";
    private static final String ASK_BANNER_HIDDEN = "ask banner hidden";
    private static final String ASK_BANNER_LEFT = "ask banner left";
    private static final AtomicInteger askBannerLogCount = new AtomicInteger();

    /**
     * The "Ask · topic" bar under a For You video, issue #6 as its reporter still saw it on
     * 0.40.0. It is not a Tako component. It is one of PineDrama's common bottom banners, keyed
     * {@code bottom_banner_tako} and drawn by the same banner view as the "Search · topic" bar,
     * which is why the four Tako components hooked in 0.39.0 and 0.40.0 never fired for it.
     * Every banner reaches a feed cell through {@code Aweme.getBanners()}, and this is that
     * getter's answer on its way out.
     *
     * <p>Each switch removes only its own banner kind. The search strip is removed before native
     * banner priority and layout reserve its height, so neighboring controls can use that space.
     * The video's banner list is replaced by a copy without the selected kinds,
     * so the next read finds nothing to remove and nothing else reading the old list is
     * disturbed. The video's other banners stay where they were.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List filterBanners(Aweme video, List banners) {
        HookStatus.bound(HOOK_FAMILY, BANNERS_READ);
        if (banners == null) return banners;
        try {
            countBanners(banners);
            if (banners.isEmpty()) return banners;
            boolean hideAsk = Settings.HIDE_TAKO_AI.get();
            boolean hideSearch = Settings.HIDE_BOTTOM_SEARCH_BAR.get();
            if (containsAskBanner(banners)) {
                HookStatus.bound(HOOK_FAMILY, hideAsk ? ASK_BANNER_HIDDEN : ASK_BANNER_LEFT);
            }
            if (!hideAsk && !hideSearch) return banners;

            List kept = null;
            int removedAsk = 0, removedSearch = 0;
            for (int i = 0; i < banners.size(); i++) {
                Object banner = banners.get(i);
                boolean ask = hideAsk && isAskBanner(banner);
                boolean search = hideSearch && isSearchBanner(banner);
                if (ask || search) {
                    if (kept == null) kept = new ArrayList(banners.subList(0, i));
                    if (ask) removedAsk++;
                    else removedSearch++;
                } else if (kept != null) kept.add(banner);
            }
            if (kept == null) return banners;
            if (video != null) video.setBanners(kept);
            if (removedAsk > 0) {
                logAskBannerHidden();
                FeedFilterCounters.removed(BANNER_SOURCE, removedAsk, ASK_BANNER_REASON);
            }
            if (removedSearch > 0) {
                HookStatus.bound("feed bottom search", "search banner removed");
                FeedFilterCounters.removed(BANNER_SOURCE, removedSearch, SEARCH_BANNER_REASON);
            }
            return kept;
        } catch (Throwable failure) {
            // A build whose banner model moved: leave the banners as PineDrama sent them and say so.
            HookStatus.threw(HOOK_FAMILY, "bottom banners", failure);
            return banners;
        }
    }

    /** The export's route for the banners under a video, one list per read of the getter. */
    static final String BANNER_SOURCE = "BottomBanner";
    static final String ASK_BANNER_REASON = "takoAskBanner";
    static final String SEARCH_BANNER_REASON = "searchBanner";
    private static final FeedServedKinds BANNER_KINDS = new FeedServedKinds("Bottom banner");

    /**
     * Counts the banners each read hands out, by kind, whatever the logging switch says, so an
     * export says which banners a phone is served. Issue #6 took two releases to reach this route
     * because nothing could say what the bar under the video was; the next export names it.
     */
    private static void countBanners(List<?> banners) {
        FeedFilterCounters.sawList(BANNER_SOURCE, banners.size());
        for (Object banner : banners) {
            if (!(banner instanceof BannerCommonStruct)) continue;
            BannerCommonKey key = ((BannerCommonStruct) banner).bannerKey;
            String kind = FeedServedKinds.kind(key == null ? null : key.componentKey, null);
            if (kind == null) continue;
            FeedFilterCounters.sawKind(BANNER_SOURCE, kind);
            BANNER_KINDS.note(kind);
        }
    }

    /** Forgets the banner kinds already named, between deterministic runtime tests. */
    static void resetBannerKindsForTests() {
        BANNER_KINDS.resetForTests();
    }

    private static boolean containsAskBanner(List<?> banners) {
        for (Object banner : banners) {
            if (isAskBanner(banner)) return true;
        }
        return false;
    }

    static boolean isAskBanner(Object banner) {
        if (!(banner instanceof BannerCommonStruct)) return false;
        BannerCommonKey key = ((BannerCommonStruct) banner).bannerKey;
        return key != null && ASK_BANNER_KEY.equals(key.componentKey);
    }

    private static boolean isSearchBanner(Object banner) {
        if (!(banner instanceof BannerCommonStruct)) return false;
        BannerCommonKey key = ((BannerCommonStruct) banner).bannerKey;
        return key != null && SEARCH_BANNER_KEY.equals(key.componentKey);
    }

    private static void logAskBannerHidden() {
        int count = askBannerLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Ask banner removed from a video");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Ask banner removed (further logs suppressed)");
        }
    }

    private static void logFloatingButtonRoute(String source, boolean enabled) {
        int count = floatingButtonRouteLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Floating button route hit"
                    + " source=" + source
                    + " enabled=" + enabled);
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Floating button route hit (further logs suppressed)");
        }
    }

    private static void logBoundViewHide() {
        int count = boundViewHideLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Bound feed button view hidden");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe PineDrama TakoAI] Bound feed button view hidden (further logs suppressed)");
        }
    }
}
