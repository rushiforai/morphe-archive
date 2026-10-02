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
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.Arrays;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Runtime guards with only the patch-written, opaque avatar scope replaced for this sandbox. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = StoriesTest.AvatarScope.class,
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class StoriesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Object dialogAvatar = new DialogAvatar(false);

    @Before public void setUp() {
        Settings.HIDE_STORIES.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_STORIES);
        Settings.HIDE_STORIES.resetToDefault();
        HookStatus.clear();
    }

    @Test public void enabledByDefaultAndAllFiveGuardsCountTheirOwnSuppression() {
        assertTrue(Settings.HIDE_STORIES.get());
        assertTrue(Stories.skipStoryRequests());
        assertTrue(Stories.hideStoryBar());
        assertFalse(Stories.showStoryCamera(true));
        assertTrue(Stories.hideAvatarStories(dialogAvatar));
        assertTrue(Stories.hideAvatarStoryTouches(dialogAvatar));
        assertEquals(Arrays.asList("Hide Stories: invoked 5, 0 found, 0 missing. Counted: "
                        + "story list load suppressed 1, story bar hidden 1, story camera hidden 1, "
                        + "avatar story ring hidden 1, avatar story touch skipped 1"), HookStatus.report());
    }

    @Test public void disabledLeavesEveryStockDecisionAlone() {
        Settings.HIDE_STORIES.save(false);
        assertStock();
        assertNoSuppression();
    }

    @Test public void everyPauseReasonLeavesEveryStockDecisionAlone() {
        Settings.HIDE_STORIES.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStock();
            assertNoSuppression();
            PauseForTests.resume();
        }
        assertTrue(Stories.hideStoryBar());
    }

    @Test public void beforeSettingsAreReadyEveryGuardFailsOpen() {
        Settings.HIDE_STORIES.save(true);
        SettingsContextRule.withoutContext(this::assertStock);
        assertNoSuppression();
    }

    @Test public void shareToStoryAndOtherAvatarKindsKeepTheirRingsAndTouches() {
        Settings.HIDE_STORIES.save(true);
        for (Object other : new Object[]{null, new Object(), new DialogAvatar(true)}) {
            assertFalse(Stories.hideAvatarStories(other));
            assertFalse(Stories.hideAvatarStoryTouches(other));
        }
        assertFalse(Stories.showStoryCamera(false));
        assertNoSuppression();
    }

    @Test public void unreadableSwitchFailsOpenAndReportsTheFailure() {
        Settings.HIDE_STORIES.save(true);
        SettingReadsForTests.breakReads(Settings.HIDE_STORIES);
        assertStock();
        assertEquals(Arrays.asList("a working 'switch read' hook (it threw java.lang.NullPointerException)"),
                HookStatus.missing(FamilyNames.HIDE_STORIES));
        assertNoSuppression();
    }

    @Test public void avatarScopeFailureFailsOpenWithoutLosingOtherTargets() {
        Settings.HIDE_STORIES.save(true);
        assertFalse(Stories.hideAvatarStories(new BrokenAvatar()));
        assertFalse(Stories.hideAvatarStoryTouches(new BrokenAvatar()));
        assertEquals(Arrays.asList("a working 'avatar scope' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.HIDE_STORIES));
        assertNoSuppression();
        assertTrue(Stories.skipStoryRequests());
    }

    private void assertStock() {
        assertFalse(Stories.skipStoryRequests());
        assertFalse(Stories.hideStoryBar());
        assertTrue(Stories.showStoryCamera(true));
        assertFalse(Stories.showStoryCamera(false));
        assertFalse(Stories.hideAvatarStories(dialogAvatar));
        assertFalse(Stories.hideAvatarStoryTouches(dialogAvatar));
    }

    private void assertNoSuppression() {
        assertFalse(HookStatus.report().stream().anyMatch(row -> row.contains("Counted:")));
    }

    private static final class DialogAvatar {
        final boolean shareToStory;
        DialogAvatar(boolean shareToStory) { this.shareToStory = shareToStory; }
    }

    private static final class BrokenAvatar {}

    @Implements(value = Stories.class, isInAndroidSdk = false)
    public static class AvatarScope {
        @Implementation protected static boolean isDialogAvatar(Object params) {
            if (params instanceof BrokenAvatar) throw new IllegalStateException("missing params owner");
            return params instanceof DialogAvatar && !((DialogAvatar) params).shareToStory;
        }
    }
}
