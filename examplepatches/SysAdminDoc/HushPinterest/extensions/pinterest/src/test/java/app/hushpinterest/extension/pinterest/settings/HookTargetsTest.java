/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Collections;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.pinterest.ads.HookTargets;
import app.hushpinterest.extension.pinterest.ads.HookTargetsForTests;
import app.hushpinterest.extension.shared.SettingsContextRule;

/**
 * The Hide ads row and the report against what the patch recorded for each list holder and ad-only
 * view: a build with every target whole reads as complete, and one missing a holder, a constructor
 * or a view says which, by name.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HookTargetsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String COMPLETE = "Removes promoted pins.";
    private static final String NOT_COVERED = "; no hook of its own: Shopping ideas groups inside search results, "
            + "shopping wrappers under related pins";

    @Before
    public void everyHideAdsCapability() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FEED_ADS,
                PatchFamily.Capability.AD_VIEWS, PatchFamily.Capability.GOOGLE_ADS, PatchFamily.Capability.META_ADS);
    }

    @After
    public void restore() {
        HookTargetsForTests.recorded(null);
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
    }

    private static void record(String lists, String views) {
        Map<PatchFamily.Capability, String> recorded = new EnumMap<>(PatchFamily.Capability.class);
        recorded.put(PatchFamily.Capability.FEED_ADS, lists);
        recorded.put(PatchFamily.Capability.AD_VIEWS, views);
        HookTargetsForTests.recorded(recorded);
    }

    private static List<String> report() {
        return PatchFamily.reportLines(EnumSet.of(PatchFamily.HIDE_ADS), false);
    }

    @Test
    public void everyTargetWholeReadsAsFullCoverage() {
        record("feedList=2/2;pagedResponse=1/1;modelList=1/1",
                "TextAdView=2/2;LegacyPromotedCloseupActionButtonModule=2/2;"
                        + "PromotedPinCloseupFloatingActionBarModule=2/2;BoardSponsoredCuratorView=2/2");
        assertEquals(COMPLETE, PatchFamily.HIDE_ADS.coverageSummary(COMPLETE));
        List<String> report = report();
        assertTrue(report.toString(), report.contains("Hide ads coverage: promoted pins in lists, ad-only views, Google ad SDK start, Meta ad SDK"));
        assertTrue(report.toString(), report.contains("Hide ads targets for promoted pins in lists: feedList 2 of 2, "
                + "pagedResponse 1 of 1, modelList 1 of 1" + NOT_COVERED));
        assertTrue(report.toString(), report.contains("Hide ads targets for ad-only views: TextAdView 2 of 2, "
                + "LegacyPromotedCloseupActionButtonModule 2 of 2, PromotedPinCloseupFloatingActionBarModule 2 of 2, "
                + "BoardSponsoredCuratorView 2 of 2"));
    }

    @Test
    public void aPartialBuildNamesEachHolderConstructorAndViewItLacks() {
        record("feedList=1/2;pagedResponse=0/1;modelList=1/1",
                "TextAdView=2/2;LegacyPromotedCloseupActionButtonModule=0/2;"
                        + "PromotedPinCloseupFloatingActionBarModule=1/2;BoardSponsoredCuratorView=0/2");
        String summary = PatchFamily.HIDE_ADS.coverageSummary(COMPLETE);
        assertTrue(summary, summary.startsWith("This build handles "));
        String[] halves = summary.split("It's missing the parts for ");
        assertEquals(summary, 2, halves.length);
        for (String handled : new String[]{"promoted pins in feed pages (1 of 2 parts)", "promoted pins in bookmarked lists",
                "text ads", "floating ad bars on pin closeups (1 of 2 parts)", "Google ad SDK start", "Meta ad SDK"}) {
            assertTrue(summary, halves[0].contains(handled));
        }
        for (String missing : new String[]{"promoted pins in paged results", "ad buttons on pin closeups", "sponsor credits on boards"}) {
            assertTrue(summary, halves[1].contains(missing));
            assertFalse(summary, halves[0].contains(missing));
        }
        assertFalse("a part-covered capability isn't named as if whole", summary.contains("promoted pins in lists"));

        List<String> report = report();
        assertTrue(report.toString(), report.contains(
                "Hide ads coverage: promoted pins in lists (partial), ad-only views (partial), Google ad SDK start, Meta ad SDK"));
        assertTrue(report.toString(), report.contains("Hide ads targets for promoted pins in lists: feedList 1 of 2 partial, "
                + "pagedResponse 0 of 1 missing, modelList 1 of 1" + NOT_COVERED));
        assertTrue(report.toString(), report.contains("Hide ads targets for ad-only views: TextAdView 2 of 2, "
                + "LegacyPromotedCloseupActionButtonModule 0 of 2 missing, PromotedPinCloseupFloatingActionBarModule 1 of 2 partial, "
                + "BoardSponsoredCuratorView 0 of 2 missing"));
    }

    @Test
    public void aCapabilityTheBuildLacksStillReadsAsMissing() {
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.FEED_ADS, PatchFamily.Capability.GOOGLE_ADS,
                PatchFamily.Capability.META_ADS);
        record("feedList=2/2;pagedResponse=1/1;modelList=1/1", "TextAdView=0/2");
        String summary = PatchFamily.HIDE_ADS.coverageSummary(COMPLETE);
        assertTrue(summary, summary.endsWith("It's missing the parts for ad-only views."));
        assertFalse("no targets line for a capability that isn't in", report().stream().anyMatch(line -> line.contains("targets for ad-only views")));
    }

    @Test
    public void anUnreadableRecordIsLeftOutAndNoRecordFallsBackToTheFlags() {
        record("feedList=x/2;=1/1;modelList=2/1;pagedResponse=1/1;garbage", "");
        List<HookTargets.Target> lists = HookTargets.of(PatchFamily.Capability.FEED_ADS);
        assertEquals(1, lists.size());
        assertEquals("pagedResponse", lists.get(0).id);
        assertEquals(Collections.emptyList(), HookTargets.of(PatchFamily.Capability.AD_VIEWS));
        assertEquals(Collections.emptyList(), HookTargets.of(PatchFamily.Capability.GOOGLE_ADS));
        assertEquals(COMPLETE, PatchFamily.HIDE_ADS.coverageSummary(COMPLETE));
        assertTrue(report().toString(), report().contains("Hide ads targets for ad-only views: not recorded"));
    }
}
