/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

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

import java.util.Arrays;
import java.util.Collections;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DraftPreviewsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Settings.DISABLE_DRAFT_PREVIEWS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.DISABLE_DRAFT_PREVIEWS);
        Settings.DISABLE_DRAFT_PREVIEWS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultSoEveryDraftStillFetchesItsPreview() {
        assertFalse(Settings.DISABLE_DRAFT_PREVIEWS.get());
        assertStock();
        assertEquals(Collections.singletonList("Disable draft link previews: invoked 5, 0 found, 0 missing"),
                HookStatus.report());
    }

    @Test public void switchedOnEachSurfaceSkipsAndCountsItsPreview() {
        Settings.DISABLE_DRAFT_PREVIEWS.save(true);
        assertTrue(DraftPreviews.skipBotSharePreview());
        assertTrue(DraftPreviews.skipChatPreview());
        assertTrue(DraftPreviews.skipPollPreview());
        assertTrue(DraftPreviews.skipSharePreview());
        assertTrue(DraftPreviews.skipStoryLinkPreview());
        assertEquals(Arrays.asList("Disable draft link previews: invoked 5, 0 found, 0 missing. Counted: "
                        + "bot share preview skipped 1, chat draft preview skipped 1, poll link preview skipped 1, "
                        + "share comment preview skipped 1, story link preview skipped 1"),
                HookStatus.report());
    }

    @Test public void switchedOffAgainEveryDraftFetchesItsPreview() {
        Settings.DISABLE_DRAFT_PREVIEWS.save(true);
        assertTrue(DraftPreviews.skipChatPreview());
        Settings.DISABLE_DRAFT_PREVIEWS.save(false);
        HookStatus.clear();
        assertStock();
        assertNoSkips();
    }

    @Test public void everyPauseReasonFetchesDraftPreviewsAndResumeRestoresTheSkip() {
        Settings.DISABLE_DRAFT_PREVIEWS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            assertNoSkips();
            PauseForTests.resume();
        }
        assertTrue(DraftPreviews.skipChatPreview());
    }

    @Test public void unavailableSettingsFetchDraftPreviews() {
        Settings.DISABLE_DRAFT_PREVIEWS.save(true);
        SettingsContextRule.withoutContext(this::assertStock);
        assertNoSkips();
    }

    @Test public void unreadableSettingFailsOpenAndReportsItsStateFailure() {
        Settings.DISABLE_DRAFT_PREVIEWS.save(true);
        SettingReadsForTests.breakReads(Settings.DISABLE_DRAFT_PREVIEWS);
        assertStock();
        assertEquals(Collections.singletonList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.DISABLE_DRAFT_PREVIEWS));
        assertNoSkips();
    }

    private void assertStock() {
        assertFalse(DraftPreviews.skipChatPreview());
        assertFalse(DraftPreviews.skipSharePreview());
        assertFalse(DraftPreviews.skipPollPreview());
        assertFalse(DraftPreviews.skipStoryLinkPreview());
        assertFalse(DraftPreviews.skipBotSharePreview());
    }

    private void assertNoSkips() {
        assertFalse(HookStatus.report().stream().anyMatch(row -> row.contains("Counted:")));
    }
}
