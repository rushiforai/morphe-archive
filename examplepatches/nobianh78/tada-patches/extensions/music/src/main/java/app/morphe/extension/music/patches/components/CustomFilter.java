/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.music.patches.components;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.patches.components.BaseCustomFilter;

/**
 * YT Music entry point for the shared custom filter. See {@link BaseCustomFilter} for the
 * expression syntax reference.
 */
@SuppressWarnings("unused")
public final class CustomFilter extends BaseCustomFilter {

    public CustomFilter() {
        super(
                Settings.CUSTOM_FILTER,
                Settings.CUSTOM_FILTER_STRINGS,
                "tada_custom_filter_toast_invalid_syntax"
        );
    }
}
