/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Reads the commercial labels Pinterest ships with pins, stories and featured boards. */
public final class Shopping {
    private Shopping() {}

    // These values are present in both supported builds' story_type enum. Editorial idea,
    // recipe and creator stories are deliberately absent.
    private static final Set<String> STORIES = new HashSet<>(Arrays.asList(
            "shopping_spotlight", "search_product_collage_story", "product_category",
            "shop_brand_story", "shop_brand_affinity_story", "board_shop_the_look",
            "board_ideas_shopping_card_compact", "board_shop_your_board_story_type",
            "board_shop_your_board_empty_state_story_type", "related_products_button_footer",
            "related_products_feed_header", "related_products_collage",
            "board_shop_related_products_header", "board_shop_category", "board_shop_saved_products",
            "homefeed_shopping_retargeted_products", "creator_class_products"));

    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_SHOPPING.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_SHOPPING, "switch read", t);
            return false;
        }
    }

    static boolean isShopping(Object item) {
        if (item == null) return false;
        Map<String, Field> fields = ModelFields.of(item.getClass());
        if (ModelFields.isTrue(fields, item, "is_shoppable")) return true;
        if (ModelFields.isTrue(fields, item, "is_sponsored")) return true;
        // A board only carries this metadata when it is a featured placement.
        if (ModelFields.isSet(fields, item, "featured_board_metadata")) return true;
        Object story = ModelFields.read(fields, item, "story_type");
        String name = story instanceof Enum ? ((Enum<?>) story).name()
                : story instanceof String ? (String) story : null;
        return name != null && STORIES.contains(name.toLowerCase(Locale.ROOT));
    }
}
