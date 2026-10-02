/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.share;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** When Hide the Repost button answers that a post can't be reposted. */
@RunWith(RobolectricTestRunner.class)
public class RepostButtonTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.HIDE_REPOST_BUTTON.resetToDefault();
    }

    /** Once the patch is picked, its switch starts on, so every post reads as one that can't be reposted. */
    @Test
    public void withTheSwitchOnNothingCanBeReposted() {
        assertTrue(RepostButton.hide());
        assertSame(Boolean.FALSE, RepostButton.eligible(Boolean.TRUE));
        assertSame(Boolean.FALSE, RepostButton.eligible(null));
    }

    @Test
    public void withTheSwitchOffTheTreeAnswersAsItDid() {
        Settings.HIDE_REPOST_BUTTON.save(false);
        assertFalse(RepostButton.hide());
        assertSame(Boolean.TRUE, RepostButton.eligible(Boolean.TRUE));
        assertSame(Boolean.FALSE, RepostButton.eligible(Boolean.FALSE));
        assertNull(RepostButton.eligible(null));
    }
}
