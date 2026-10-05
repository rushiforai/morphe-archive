/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * The list filter both feed patches share, against stand-in models whose fields carry their JSON
 * names the way Pinterest's obfuscated Gson annotation does: an annotation with a String value().
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class FeedFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    @interface Json {
        String value();
    }

    /** Shaped like Pinterest's pin: boxed flags, a promotion id, an ad payload and the AI labels. */
    static final class Pin {
        @Json("id") String id;
        @Json("is_promoted") Boolean promoted;
        @Json("is_third_party_ad") Boolean thirdParty;
        @Json("pin_promotion_id") String promotionId;
        @Json("ad_data") Object adData;
        @Json("ai_disclosures") List<Integer> aiDisclosures;

        Pin(String id) {
            this.id = id;
        }

        @Override public String toString() {
            return id;
        }
    }

    /** A feed story, which is an ad when Pinterest says it's a shopping spotlight. */
    static final class Story {
        @Json("id") String id;
        @Json("story_type") String storyType;

        Story(String id, String storyType) {
            this.id = id;
            this.storyType = storyType;
        }

        @Override public String toString() {
            return id;
        }
    }

    private final Pin plain = new Pin("plain");
    private final Pin promoted = new Pin("promoted");
    private final Pin thirdParty = new Pin("thirdParty");
    private final Pin promotionId = new Pin("promotionId");
    private final Pin adData = new Pin("adData");
    private final Pin labeled = new Pin("labeled");
    private final Pin emptyLabels = new Pin("emptyLabels");
    private final Story spotlight = new Story("spotlight", "shopping_spotlight");
    private final Story ideas = new Story("ideas", "ideas_for_you");

    @Before
    public void shapeTheModels() {
        promoted.promoted = true;
        thirdParty.thirdParty = true;
        promotionId.promotionId = "123";
        adData.adData = new Object();
        labeled.aiDisclosures = Arrays.asList(1);
        emptyLabels.aiDisclosures = Collections.emptyList();
        plain.promoted = false;
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_ADS, PatchFamily.Capability.FEED_AI_PINS));
    }

    @After
    public void restore() {
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        Settings.HIDE_ADS.resetToDefault();
        Settings.HIDE_AI_PINS.resetToDefault();
        ModelFields.clearForTests();
        HookStatus.clear();
    }

    private List<Object> page() {
        return new ArrayList<>(Arrays.asList(plain, promoted, labeled, thirdParty, promotionId, emptyLabels, adData,
                spotlight, ideas));
    }

    @Test
    public void hideAdsAloneTakesEveryKindOfAdAndKeepsTheOrder() {
        Settings.HIDE_AI_PINS.save(false);
        List<?> kept = FeedFilter.filter(page());
        assertEquals("[plain, labeled, emptyLabels, ideas]", kept.toString());
        assertTrue(String.join("\n", HookStatus.report()), String.join("\n", HookStatus.report()).contains("promoted pin removed"));
    }

    @Test
    public void bothSwitchesTakeTheLabeledPinsToo() {
        Settings.HIDE_AI_PINS.save(true);
        assertEquals("[plain, emptyLabels, ideas]", FeedFilter.filter(page()).toString());
    }

    @Test
    public void aiAloneLeavesTheAds() {
        Settings.HIDE_ADS.save(false);
        Settings.HIDE_AI_PINS.save(true);
        assertEquals("[plain, promoted, thirdParty, promotionId, emptyLabels, adData, spotlight, ideas]",
                FeedFilter.filter(page()).toString());
    }

    @Test
    public void aListWithNothingToTakeComesBackAsItself() {
        List<Object> clean = new ArrayList<>(Arrays.asList(plain, ideas, emptyLabels));
        assertSame(clean, FeedFilter.filter(clean));
        List<Object> empty = new ArrayList<>();
        assertSame(empty, FeedFilter.filter(empty));
        assertNull(FeedFilter.filter(null));
    }

    @Test
    public void pauseLeavesEveryItem() {
        Settings.HIDE_AI_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        List<Object> page = page();
        assertSame(page, FeedFilter.filter(page));
    }

    @Test
    public void aCapabilityThisBuildLacksIsNeverApplied() {
        Settings.HIDE_AI_PINS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.FEED_AI_PINS));
        assertEquals("[plain, promoted, thirdParty, promotionId, emptyLabels, adData, spotlight, ideas]",
                FeedFilter.filter(page()).toString());
    }

    @Test
    public void itemsOfOtherShapesStay() {
        List<Object> mixed = new ArrayList<>(Arrays.asList("a string", 42, plain, promoted));
        assertEquals("[a string, 42, plain]", FeedFilter.filter(mixed).toString());
    }

    @Test
    public void anAdOnlyViewStaysGoneAndSizelessWhileTheSwitchIsOn() {
        assertEquals(View.GONE, Ads.adViewVisibility(View.VISIBLE));
        assertEquals(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY),
                Ads.adViewMeasureSpec(View.MeasureSpec.makeMeasureSpec(300, View.MeasureSpec.AT_MOST)));

        Settings.HIDE_ADS.save(false);
        assertEquals(View.VISIBLE, Ads.adViewVisibility(View.VISIBLE));
        int spec = View.MeasureSpec.makeMeasureSpec(300, View.MeasureSpec.AT_MOST);
        assertEquals(spec, Ads.adViewMeasureSpec(spec));

        Settings.HIDE_ADS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(View.INVISIBLE, Ads.adViewVisibility(View.INVISIBLE));
        assertEquals(spec, Ads.adViewMeasureSpec(spec));
    }
}
