/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hxreborn.extension.internetspeedmeter;

import android.content.Context;

@SuppressWarnings("unused")
public final class AdPreference {

    private AdPreference() {

    }

    public static void markAdsEnabled(Context context) {
        AppResources.preferences(context).edit().putBoolean("ads_enabled", true).apply();
    }

}
