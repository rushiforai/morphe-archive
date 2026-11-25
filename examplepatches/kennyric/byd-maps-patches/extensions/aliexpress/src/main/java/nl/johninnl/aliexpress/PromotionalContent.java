/*
 * Copyright (C) 2026 johninnl
 * SPDX-License-Identifier: GPL-3.0-only
 */
package nl.johninnl.aliexpress;

import android.view.View;
import android.view.MenuItem;
import android.content.res.Resources;
import java.util.Map;
import java.util.List;
import android.content.Context;

@SuppressWarnings("unused")
public final class PromotionalContent {
    private PromotionalContent() { }

    public static void filterComponentsIfEnabled(List<?> floors) {
        if (!PatchSettings.removePromotionsAndGames() || floors == null) {
            return;
        }
        for (int index = floors.size() - 1; index >= 0; index--) {
            Object floor = floors.get(index);
            if (ContentFilter.promotionalTemplate(componentName(floor))
                    || ContentFilter.removePromotionalComponent(componentData(floor))) {
                floors.remove(index);
            }
        }
    }

    // Bound to the checked native wrapper/interface methods by the bytecode patch.
    private static Map<?, ?> componentData(Object floor) {
        return null;
    }

    private static String componentName(Object floor) {
        return null;
    }

    public static void sanitizeAccountHeaderIfEnabled(Object floor) {
        if (PatchSettings.removePromotionsAndGames()
                && ContentFilter.sanitizeAccountHeader(componentData(floor), componentName(floor))) {
            useNativeAccountHeader(floor);
        }
    }

    private static void useNativeAccountHeader(Object floor) {
    }

    public static void sanitizePriceBannerIfEnabled(Map<?, ?> fields) {
        if (PatchSettings.removePromotionsAndGames()) ContentFilter.sanitizePriceBanner(fields);
    }

    public static boolean shouldHideCampaignTab(MenuItem item) {
        Context context = PatchSettings.applicationContext();
        if (!PatchSettings.removePromotionsAndGames() || context == null || item == null) {
            return false;
        }
        try {
            return "navigation_choice".equals(context.getResources().getResourceEntryName(item.getItemId()));
        } catch (Resources.NotFoundException ex) {
            return false;
        }
    }

    public static boolean isPromotionalFloorIfEnabled(String floorName) {
        return PatchSettings.removePromotionsAndGames() && ContentFilter.promotionalTemplate(floorName);
    }

    public static void applyCampaignTabPolicy(Object decorator) {
        if (PatchSettings.removePromotionsAndGames()) markCampaignTabHidden(decorator);
    }

    private static void markCampaignTabHidden(Object decorator) {
    }

    public static boolean retainRegistrationPromotion(boolean nativeEligible) {
        return nativeEligible && !PatchSettings.removePromotionsAndGames();
    }

    public static boolean hideEntryIfEnabled(View view) {
        if (!PatchSettings.removePromotionsAndGames()) {
            return false;
        }
        view.setVisibility(View.GONE);
        return true;
    }
}
