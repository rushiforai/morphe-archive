/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.util.Locale;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Hide Refine your search: the lists of suggested searches Pinterest puts between search results
 * under a "Refine your search" heading, each search a row with a picture.
 *
 * <p>Each list is a story of its own on the results page, known by its story type. The type comes
 * from the server, so it isn't in the app's code: a report's page lines named it on results for
 * "living room ideas" on Pinterest 14.45.0, where every "Refine your search" list on the page
 * carried it (#48). The "Shop similar" lists, a story type of their own, stay.
 */
public final class RefineSearch {
    private RefineSearch() {}

    /** The removal's own name, counted under Filter feed like a Home suggestion. */
    static final String REFINE = "Refine your search";

    /** The story type of a "Refine your search" list, as the String a story carries or a typed enum's constant name. */
    static final String STORY = "related_searches_organic";

    /** Whether the switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_REFINE_SEARCH.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "switch read", t);
            return false;
        }
    }

    /** True when [item] is a "Refine your search" list. */
    static boolean isRefine(Object item) {
        if (item == null) return false;
        Object story = ModelFields.read(ModelFields.of(item.getClass()), item, Ads.STORY_TYPE);
        String name = story instanceof Enum ? ((Enum<?>) story).name()
                : story instanceof String ? (String) story : null;
        return name != null && STORY.equals(name.toLowerCase(Locale.ROOT));
    }
}
