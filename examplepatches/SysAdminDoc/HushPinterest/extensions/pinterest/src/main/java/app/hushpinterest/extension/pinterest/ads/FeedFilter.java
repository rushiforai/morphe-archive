/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.util.ArrayList;
import java.util.List;

import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.pinterest.actions.BoardDownloads;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;

/**
 * The one place both list families take items out.
 *
 * <p>Pinterest hands every page of a feed, search, related pins and boards to one of three list
 * holders before anything is drawn. The patch passes the list each holder is built with through
 * {@link #filter}, which drops what Hide ads and Hide AI-labeled pins each say to and hands back the
 * rest in order. With both switches off, or paused, the list goes through untouched.
 *
 * <p>Download board reads what's left, untouched, to keep the pins of a board's own pages. It never
 * throws and never changes the list, so the filtering is the same with it or without it.
 */
public final class FeedFilter {
    private FeedFilter() {}

    /**
     * Injected at the start of each list holder's constructor, on its list parameter. Returns the
     * same list when nothing goes, or a new one without the items that do. Never throws.
     */
    public static List<?> filter(List<?> items) {
        // Each family's patch marks its list capability once the hook is in.
        boolean ads = PatchFamily.Capability.FEED_ADS.installed();
        boolean ai = PatchFamily.Capability.FEED_AI_PINS.installed();
        boolean shopping = PatchFamily.Capability.FEED_SHOPPING.installed();
        if (ads) HookStatus.invoked(FamilyNames.HIDE_ADS);
        if (ai) HookStatus.invoked(FamilyNames.HIDE_AI_PINS);
        if (shopping) HookStatus.invoked(FamilyNames.HIDE_SHOPPING);
        if (items == null || items.isEmpty()) return items;
        ads = ads && Ads.active();
        ai = ai && AiPins.active();
        shopping = shopping && Shopping.active();
        if (!ads && !ai && !shopping) {
            BoardDownloads.record(items);
            return items;
        }
        List<?> shown;
        try {
            List<Object> kept = null;
            int size = items.size();
            for (int i = 0; i < size; i++) {
                Object item = items.get(i);
                String family = ads && Ads.isAd(item) ? FamilyNames.HIDE_ADS
                        : ai && AiPins.isLabeled(item) ? FamilyNames.HIDE_AI_PINS
                        : shopping && Shopping.isShopping(item) ? FamilyNames.HIDE_SHOPPING : null;
                if (family != null) {
                    if (kept == null) kept = new ArrayList<>(items.subList(0, i));
                    HookStatus.counted(family, family.equals(FamilyNames.HIDE_ADS) ? "promoted pin removed"
                            : family.equals(FamilyNames.HIDE_AI_PINS) ? "AI-labeled pin removed" : "shopping placement removed");
                } else if (kept != null) {
                    kept.add(item);
                }
            }
            shown = kept == null ? items : kept;
        } catch (Throwable t) {
            HookStatus.threw(ads ? FamilyNames.HIDE_ADS : ai ? FamilyNames.HIDE_AI_PINS : FamilyNames.HIDE_SHOPPING, "list filter", t);
            return items;
        }
        // Outside the filter's own failure handling: what's kept for a board never decides what's shown.
        BoardDownloads.record(shown);
        return shown;
    }
}
