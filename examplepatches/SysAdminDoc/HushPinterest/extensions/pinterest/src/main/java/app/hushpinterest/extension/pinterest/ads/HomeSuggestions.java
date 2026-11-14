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

/**
 * Hide Home suggestions: the rows Pinterest puts between pins on Home to point you at more of
 * its ideas, told apart by what the model itself carries.
 *
 * <p>"More ideas for your board" is a card of its own kind: a board's id, name and header text with
 * a strip of images and their colors, and no story type. No pin and no story has that set of
 * fields. "Inspired by your interests" is a story, known by its story type. Pins, boards you
 * follow and everything else stay.
 */
public final class HomeSuggestions {
    private HomeSuggestions() {}

    /** The removal's own name, counted under Filter feed like a muted pin. */
    static final String SUGGESTION = "Home suggestion";

    /** The fields only the "More ideas for your board" card carries together. */
    private static final String[] BOARD_IDEAS_CARD = {"board_id", "board_name", "header_text", "image_dominant_color_rgb"};

    // Story types of Home's own idea rows, as the String a story carries or the typed enum's
    // constant name. A board's own "More ideas" tab and search keep theirs.
    static final Set<String> STORIES = new HashSet<>(Arrays.asList(
            "homefeed_more_ideas_feed_story", "homefeed_more_ideas_header"));

    /** Whether the switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_HOME_SUGGESTIONS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "switch read", t);
            return false;
        }
    }

    /** True when [item] is one of Home's suggestion rows. */
    static boolean isSuggestion(Object item) {
        if (item == null) return false;
        Map<String, Field> fields = ModelFields.of(item.getClass());
        if (isBoardIdeasCard(fields)) return true;
        Object story = ModelFields.read(fields, item, Ads.STORY_TYPE);
        String name = story instanceof Enum ? ((Enum<?>) story).name()
                : story instanceof String ? (String) story : null;
        return name != null && STORIES.contains(name.toLowerCase(Locale.ROOT));
    }

    /** The board ideas card's class: every one of its fields, and no story type. */
    static boolean isBoardIdeasCard(Map<String, Field> fields) {
        if (fields.containsKey(Ads.STORY_TYPE)) return false;
        for (String json : BOARD_IDEAS_CARD) {
            if (!fields.containsKey(json)) return false;
        }
        return true;
    }
}
