/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import java.lang.reflect.Field;
import java.util.Map;

import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;

/**
 * Hide AI-labeled pins: pins that Pinterest itself labels as made or changed with AI leave the lists
 * Pinterest shows.
 *
 * <p>The label comes from the pin's {@code ai_disclosures} list. Pinterest 14.25 knows two entries,
 * 1 for "AI modified" and 2 for a synthetic performer, and shows its label for either; every entry
 * in that list is an AI disclosure, so any entry counts. An AI image Pinterest hasn't labeled
 * carries nothing to go by, and stays.
 */
public final class AiPins {
    private AiPins() {}

    static final String AI_DISCLOSURES = "ai_disclosures";

    /** Whether the switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_AI_PINS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_AI_PINS, "switch read", t);
            return false;
        }
    }

    /** True when Pinterest labels [item] as made or changed with AI. */
    static boolean isLabeled(Object item) {
        if (item == null) return false;
        Map<String, Field> fields = ModelFields.of(item.getClass());
        return !fields.isEmpty() && ModelFields.hasEntries(fields, item, AI_DISCLOSURES);
    }
}
