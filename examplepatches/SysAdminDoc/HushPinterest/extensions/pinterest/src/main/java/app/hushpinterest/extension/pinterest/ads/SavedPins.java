/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Hide pins you've already saved, on Home only: a board's pins are all saved, and search or related
 * pins showing one you have isn't what the switch is about.
 *
 * <p>Home never says a pin is saved on its own. Its request doesn't ask for {@code pinned_to_board},
 * and {@code is_repin} only says someone saved it from somewhere. So {@link #homeFields} adds that
 * field to the list the request is about to send, while something here needs it, and {@link #homePage}
 * takes out what comes back saved, along with pins you own. Save pins you download reads the same field
 * to tell a pin that's already saved from a new one.
 */
public final class SavedPins {
    private SavedPins() {}

    /** The family token a saved pin is taken out under, counted apart in Filter feed's report. */
    static final String SAVED = "saved pin";
    static final String PINNED_TO_BOARD = "pinned_to_board";
    static final String OWNED = "is_owned_by_viewer";

    /** How a request's field list opens the pin's own fields: {@code pin.{id,title},board.{id}}. */
    private static final String PIN_FIELDS = "pin.{";

    /** Rewritten to read the page's own list of items. */
    private static List<?> pageItems(Object page) { return null; }

    /** Whether the switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_SAVED_PINS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "switch read", t);
            return false;
        }
    }

    /**
     * Called with the field list Home's request is about to send. Hands back the same list with
     * {@code pinned_to_board} added while Hide pins you've already saved or Save pins you download is
     * on, and the same list untouched otherwise. Never throws.
     */
    public static String homeFields(String fields) {
        try {
            if (fields == null || !Utils.settingsReady() || !wanted()) return fields;
            return askingSaved(fields);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "home fields", t);
            return fields;
        }
    }

    private static boolean wanted() {
        return PatchFamily.Capability.FEED_SAVED_PINS.installed() && Settings.HIDE_SAVED_PINS.get()
                || PatchFamily.Capability.SAVE_AND_DOWNLOAD.installed() && Settings.SAVE_DOWNLOADED_PINS.get();
    }

    /** [fields] naming the saved field among the pin's own, or as it was when it has none or names it already. */
    static String askingSaved(String fields) {
        int at = fields.startsWith(PIN_FIELDS) ? 0 : fields.indexOf("," + PIN_FIELDS);
        if (at < 0) return fields;
        int open = fields.indexOf('{', at) + 1;
        int close = fields.indexOf('}', open);
        if (close < 0) return fields;
        for (String field : fields.substring(open, close).split(",")) {
            if (field.equals(PINNED_TO_BOARD)) return fields;
        }
        return fields.substring(0, open) + PINNED_TO_BOARD + "," + fields.substring(open);
    }

    /** Called with each page of Home as it arrives, before anything reads it. Never throws. */
    public static void homePage(Object page) {
        try {
            if (!Utils.settingsReady() || !PatchFamily.Capability.FEED_SAVED_PINS.installed()) return;
            HookStatus.invoked(FamilyNames.FILTER_FEED);
            if (page != null && active()) prune(pageItems(page));
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FILTER_FEED, "home page", t);
        }
    }

    /** Takes saved pins out of [items] in place, and out of any module in it, the way the list filter does. */
    static void prune(List<?> items) {
        if (items == null || items.isEmpty()) return;
        ModuleItems.Verdict verdict = item -> isSaved(item) ? SAVED : null;
        boolean debug = FeedFilter.debugLogging();
        List<String[]> removed = new ArrayList<>();
        try {
            for (Iterator<?> each = items.iterator(); each.hasNext();) {
                if (FeedFilter.judge(each.next(), verdict, FamilyNames.FILTER_FEED, debug, removed) != null) each.remove();
            }
        } finally {
            for (String[] entry : removed) HookStatus.counted(entry[0], entry[1]);
        }
    }

    /** True when [item] is a pin that's on one of your boards, or one you own. */
    static boolean isSaved(Object item) {
        if (item == null) return false;
        Map<String, Field> fields = ModelFields.of(item.getClass());
        if (!PinWords.isPin(fields)) return false;
        return ModelFields.read(fields, item, PINNED_TO_BOARD) != null || ModelFields.isTrue(fields, item, OWNED);
    }
}
