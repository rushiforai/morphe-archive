/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.feedfilter;

import android.view.View;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;
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
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Ask bar hidden");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Ask bar hidden (further logs suppressed)");
        }
    }

    /**
     * The Tako entrance floating over the search page (issue #22), either a lone Ask Tako bubble
     * or a Voice and Ask Tako pill. Asked before TikTok inflates it, so nothing is built.
     */
    public static boolean shouldHideSearchEntrance() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "search entrance " + (enabled ? "hidden" : "left"));
        return enabled;
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
     * Asked from the Tako service's own canShow: a false answer is the business condition the
     * sheet's resolver already treats as "no component".
     */
    public static boolean shouldHideCommentTopBar() {
        boolean enabled = Settings.HIDE_TAKO_AI.get();
        HookStatus.bound(HOOK_FAMILY, "comment bar " + (enabled ? "hidden" : "left"));
        return enabled;
    }

    /** The same question from the shared bridge base, answered only for the Tako bridge. */
    public static boolean shouldHideBridgedCommentTopBar(Object service) {
        if (service == null || !COMMENT_TOP_BAR_BRIDGE.equals(service.getClass().getSimpleName())) {
            return false;
        }
        return shouldHideCommentTopBar();
    }

    /** The component key TikTok gives the "Ask · topic" banner under a feed video. */
    static final String ASK_BANNER_KEY = "bottom_banner_tako";
    private static final String SEARCH_BANNER_KEY = "bottom_banner_search_rs";
    private static final String BANNERS_READ = "bottom banners read";
    private static final String ASK_BANNER_HIDDEN = "ask banner hidden";
    private static final String ASK_BANNER_LEFT = "ask banner left";
    private static final AtomicInteger askBannerLogCount = new AtomicInteger();

    /**
     * The "Ask · topic" bar under a For You video, issue #6 as its reporter still saw it on
     * 0.40.0. It is not a Tako component. It is one of TikTok's common bottom banners, keyed
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
        if (banners == null || banners.isEmpty()) return banners;
        try {
            noteBannerKinds(banners);
            boolean hideAsk = Settings.HIDE_TAKO_AI.get();
            boolean hideSearch = Settings.HIDE_BOTTOM_SEARCH_BAR.get();
            if (containsAskBanner(banners)) {
                HookStatus.bound(HOOK_FAMILY, hideAsk ? ASK_BANNER_HIDDEN : ASK_BANNER_LEFT);
            }
            if (!hideAsk && !hideSearch) return banners;

            List kept = null;
            boolean removedAsk = false, removedSearch = false;
            for (int i = 0; i < banners.size(); i++) {
                Object banner = banners.get(i);
                boolean ask = hideAsk && isAskBanner(banner);
                boolean search = hideSearch && isSearchBanner(banner);
                if (ask || search) {
                    if (kept == null) kept = new ArrayList(banners.subList(0, i));
                    removedAsk |= ask;
                    removedSearch |= search;
                } else if (kept != null) kept.add(banner);
            }
            if (kept == null) return banners;
            if (video != null) video.setBanners(kept);
            if (removedAsk) logAskBannerHidden();
            if (removedSearch) HookStatus.bound("feed bottom search", "search banner removed");
            return kept;
        } catch (Throwable failure) {
            // A build whose banner model moved: leave the banners as TikTok sent them and say so.
            HookStatus.threw(HOOK_FAMILY, "bottom banners", failure);
            return banners;
        }
    }

    private static final int MAX_BANNER_KINDS = 32;
    private static final Set<String> BANNER_KINDS_SEEN =
            Collections.newSetFromMap(new ConcurrentHashMap<>());

    /**
     * Names each kind of bottom banner once, with diagnostic logging on, so an export says which
     * banners a phone is served. Issue #6 took two releases to reach this route because nothing
     * could say what the bar under the video was; the next export names it.
     */
    private static void noteBannerKinds(List<?> banners) {
        for (Object banner : banners) {
            if (!(banner instanceof BannerCommonStruct)) continue;
            BannerCommonKey key = ((BannerCommonStruct) banner).bannerKey;
            String kind = key == null ? null : key.componentKey;
            if (kind == null || BANNER_KINDS_SEEN.contains(kind)
                    || BANNER_KINDS_SEEN.size() >= MAX_BANNER_KINDS) continue;
            if (BANNER_KINDS_SEEN.add(kind) && BaseSettings.DEBUG.get()) {
                Logger.printInfo(() -> "[Morphe TikTok TakoAI] Bottom banner served: " + kind);
            }
        }
    }

    /** Forgets the banner kinds already named, between deterministic runtime tests. */
    static void resetBannerKindsForTests() {
        BANNER_KINDS_SEEN.clear();
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
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Ask banner removed from a video");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Ask banner removed (further logs suppressed)");
        }
    }

    private static void logFloatingButtonRoute(String source, boolean enabled) {
        int count = floatingButtonRouteLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Floating button route hit"
                    + " source=" + source
                    + " enabled=" + enabled);
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Floating button route hit (further logs suppressed)");
        }
    }

    private static void logBoundViewHide() {
        int count = boundViewHideLogCount.getAndIncrement();
        if (count < MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Bound feed button view hidden");
        } else if (count == MAX_LOGS) {
            Logger.printDebug(() -> "[Morphe TikTok TakoAI] Bound feed button view hidden (further logs suppressed)");
        }
    }
}
