/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.privacy;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ShareLinksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void installedHook() {
        PatchFamilyForTests.inBuild(EnumSet.of(PatchFamily.SANITIZE_SHARING_LINKS));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.SHARE_LINK_TAG));
        HookStatus.clear();
    }

    @After public void restore() {
        Settings.SANITIZE_SHARING_LINKS.resetToDefault();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test public void startsOnAndFollowsTheSwitchWithoutARestart() {
        assertTrue(Settings.SANITIZE_SHARING_LINKS.defaultValue);
        assertFalse(Settings.SANITIZE_SHARING_LINKS.rebootApp);
        assertTrue(ShareLinks.dropShareTag());
        assertTrue(ShareLinks.dropShareTag());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("share tag left off 2"));
        Settings.SANITIZE_SHARING_LINKS.save(false);
        assertFalse(ShareLinks.dropShareTag());
        Settings.SANITIZE_SHARING_LINKS.save(true);
        assertTrue(ShareLinks.dropShareTag());
    }

    @Test public void pauseColdStartAndAMissingHookKeepTumblrsLink() {
        for (HushTumblrPause.Reason reason : new HushTumblrPause.Reason[]{
                HushTumblrPause.Reason.SWITCH, HushTumblrPause.Reason.CRASH_LOOP, HushTumblrPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(reason);
            assertFalse(reason.name(), ShareLinks.dropShareTag());
            assertTrue(Settings.SANITIZE_SHARING_LINKS.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(ShareLinks.dropShareTag()));
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertFalse(ShareLinks.dropShareTag());
    }
}
