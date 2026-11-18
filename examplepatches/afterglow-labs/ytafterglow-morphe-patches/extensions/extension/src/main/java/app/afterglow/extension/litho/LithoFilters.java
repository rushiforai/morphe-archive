package app.afterglow.extension.litho;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Supplier;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.litho.filters.AdsFilter;
import app.afterglow.extension.litho.filters.CommentsHeaderFilter;
import app.afterglow.extension.litho.filters.ContinueWatchingFilter;
import app.afterglow.extension.litho.filters.PlayerActionButtonsFilter;
import app.afterglow.extension.litho.filters.PlayerOverlayFilter;
import app.afterglow.extension.litho.filters.ShortsActionBarFilter;
import app.afterglow.extension.litho.filters.ShortsFeedFilter;
import app.afterglow.extension.litho.filters.ShortsOverlayFilter;
import app.afterglow.extension.litho.filters.SubbarFilter;

/**
 * Every Afterglow Litho filter, in one place, each with the tweak it belongs to.
 *
 * <p>A filter is registered only when its tweak was selected in Morphe
 * ({@link InstalledTweaks}), so an unselected tweak changes nothing, not even
 * settings that default to on such as {@code noAds}. A registered filter then
 * follows its iOS preference keys at runtime, as the iOS tweak does. Every key
 * a filter uses must belong to that filter's tweak in {@code tools/tweaks.json}.
 *
 * <p>To add a filter, write a {@link LithoFilter} subclass and add one
 * {@code add("tweak-id", MyFilter::new)} line below. The list is explicit on
 * purpose: a filter class that registered itself from its own static
 * initializer would never be loaded.
 */
public final class LithoFilters {
    private static final List<LithoFilter> FILTERS = new ArrayList<>();

    static {
        add("shorts-layout", ShortsActionBarFilter::new);
        add("shorts-layout", ShortsOverlayFilter::new);
        add("shorts", ShortsFeedFilter::new);
        add("player-buttons-menus", PlayerActionButtonsFilter::new);
        add("player-overlay", PlayerOverlayFilter::new);
        add("watch-page", ContinueWatchingFilter::new);
        add("comments-header", CommentsHeaderFilter::new);
        add("navigation-bar", SubbarFilter::new);
        add("remove-ads", AdsFilter::new);
    }

    private LithoFilters() {}

    /**
     * Creates a filter if its tweak is installed; one that fails to load is
     * logged and skipped, the others still work.
     */
    private static void add(String tweak, Supplier<? extends LithoFilter> factory) {
        try {
            if (!InstalledTweaks.has(tweak)) return;
            FILTERS.add(factory.get());
        } catch (Throwable error) {
            Afterglow.error("LithoFilters: a filter of tweak " + tweak + " failed to load", error);
        }
    }

    static List<LithoFilter> all() {
        return Collections.unmodifiableList(FILTERS);
    }
}
