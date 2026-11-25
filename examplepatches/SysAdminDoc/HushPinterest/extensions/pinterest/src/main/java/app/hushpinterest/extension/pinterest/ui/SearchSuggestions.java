/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import org.json.JSONObject;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;

/**
 * The colored suggested searches under the search bar on search results (#48). Pinterest sends the
 * row under the search bar as a list of modules (the filter button, Less AI and the colored chips)
 * and turns each module's JSON into its model in one loop. The hook sees each module's JSON first
 * and can skip it, so a skipped chip leaves no gap in the row.
 */
public final class SearchSuggestions {
    private SearchSuggestions() {}

    /**
     * Injected in the loop that reads the row's modules, with one module's JSON object before
     * Pinterest reads it. True skips the module. Off or paused, every module goes through.
     */
    public static boolean drop(Object module) {
        try {
            if (module == null) return false;
            boolean on = UiHooks.enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_SUGGESTIONS);
            boolean debug = Utils.settingsReady() && BaseSettings.DEBUG.get();
            if (!on && !debug) return false;
            JSONObject json = new JSONObject(String.valueOf(module));
            boolean suggestion = isSuggestedSearch(json);
            if (debug) Logger.printDebug(() -> "Search bar module " + summary(json) + (suggestion ? ", a suggested search" : ""));
            if (!on || !suggestion) return false;
            HookStatus.counted(FamilyNames.HIDE_SEARCH_HISTORY, "suggested search hidden");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SEARCH_HISTORY, "suggested search", failure);
            return false;
        }
    }

    /**
     * A colored chip that searches for something else: its action carries a search query and its
     * display a background color. The filter button and Less AI carry neither.
     */
    static boolean isSuggestedSearch(JSONObject module) {
        JSONObject action = module.optJSONObject("action");
        JSONObject display = module.optJSONObject("display");
        if (action == null || display == null) return false;
        return !action.optString("search_query").isEmpty() && !display.optString("background_color_hex").isEmpty();
    }

    /** What the debug log says about a module: its types, its action's keys and what it shows. */
    static String summary(JSONObject module) {
        JSONObject action = module.optJSONObject("action");
        JSONObject display = module.optJSONObject("display");
        StringBuilder out = new StringBuilder();
        out.append("module_type=").append(module.opt("module_type"));
        out.append(" type=").append(module.opt("type"));
        if (action != null) {
            out.append(" action.type=").append(action.opt("type"));
            out.append(" action keys=").append(keys(action));
        }
        if (display != null) {
            out.append(" text=\"").append(display.optString("display_text")).append('"');
            out.append(" color=").append(display.optString("background_color_hex"));
        }
        return out.toString();
    }

    private static String keys(JSONObject json) {
        StringBuilder out = new StringBuilder("[");
        java.util.Iterator<String> names = json.keys();
        while (names.hasNext()) {
            out.append(names.next());
            if (names.hasNext()) out.append(',');
        }
        return out.append(']').toString();
    }
}
