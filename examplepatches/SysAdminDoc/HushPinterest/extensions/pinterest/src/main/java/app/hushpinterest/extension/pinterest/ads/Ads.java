/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import android.view.View;

import java.lang.reflect.Field;
import java.util.Map;

import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;

/**
 * Hide ads: promoted pins leave the lists Pinterest shows, and the views that only ever hold an ad
 * stay folded away.
 *
 * <p>A promoted pin is told apart by what Pinterest's server sends with it, read by JSON name
 * ({@link ModelFields}). A pin can be an ad with every flag false and only its ad payload set, so the
 * payload counts on its own. Fields that describe a pin rather than mark it as paid
 * ({@code promoter}, {@code sponsorship}, {@code is_eligible_for_*}, {@code has_been_promoted}) are
 * left out: an ordinary pin can carry them.
 */
public final class Ads {
    private Ads() {}

    /** Flags that are true only on a paid placement. */
    static final String[] AD_FLAGS = {
            "is_promoted",
            "is_promoted_pin",
            "is_promoted_carousel_pin",
            "is_promoted_video",
            "is_third_party_ad",
            "is_active_ad",
            "is_cpc_ad",
            "is_downstream_promotion",
            "promoted_is_lead_ad",
            "promoted_is_catalog_carousel_ad",
            "promoted_is_max_video",
            "promoted_is_quiz",
            "promoted_is_showcase",
    };

    /** Text fields that only an ad fills in. */
    static final String[] AD_TEXT = {
            "pin_promotion_id",
            "ad_destination_url",
            "promoted_android_deep_link",
    };

    /** The ad payload: present only on an ad, whatever its flags say. */
    static final String AD_PAYLOAD = "ad_data";

    /** A feed module whose whole content is a shopping placement. */
    static final String STORY_TYPE = "story_type";
    static final String SHOPPING_SPOTLIGHT = "shopping_spotlight";

    /** Whether the switch is on and the settings can be read; never throws. */
    static boolean active() {
        try {
            return Utils.settingsReady() && Settings.HIDE_ADS.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "switch read", t);
            return false;
        }
    }

    /** True when [item] is a paid placement by what the server sent with it. */
    static boolean isAd(Object item) {
        if (item == null) return false;
        Map<String, Field> fields = ModelFields.of(item.getClass());
        if (fields.isEmpty()) return false;
        for (String flag : AD_FLAGS) {
            if (ModelFields.isTrue(fields, item, flag)) return true;
        }
        for (String text : AD_TEXT) {
            if (ModelFields.hasText(fields, item, text)) return true;
        }
        if (ModelFields.isSet(fields, item, AD_PAYLOAD)) return true;
        return SHOPPING_SPOTLIGHT.equals(ModelFields.read(fields, item, STORY_TYPE));
    }

    /**
     * Injected at the start of Pinterest's launch step that starts Google's mobile ads SDK. True
     * returns before it asks for consent or starts the SDK, so Pinterest's own "started" check keeps
     * every Google ad load idle. Never throws.
     */
    public static boolean skipGoogleAds() {
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        if (!active()) return false;
        HookStatus.counted(FamilyNames.HIDE_ADS, "Google ad SDK start skipped");
        return true;
    }

    /**
     * Injected at the start of {@code setVisibility} in each view Pinterest only builds for an ad.
     * Returns GONE while the switch is on, so the view stays folded away however often Pinterest
     * shows it again, and the visibility Pinterest asked for otherwise. Never throws.
     */
    public static int adViewVisibility(int requested) {
        HookStatus.invoked(FamilyNames.HIDE_ADS);
        try {
            if (!active()) return requested;
            if (requested != View.GONE) HookStatus.counted(FamilyNames.HIDE_ADS, "ad view kept folded away");
            return View.GONE;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "ad view", t);
            return requested;
        }
    }

    /**
     * Injected at the start of {@code onMeasure} in the same views, once for each dimension. While
     * the switch is on the view is measured at exactly zero, so a parent that lays out a hidden
     * child anyway leaves no gap. Never throws.
     */
    public static int adViewMeasureSpec(int spec) {
        try {
            return active() ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : spec;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_ADS, "ad view size", t);
            return spec;
        }
    }
}
