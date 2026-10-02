/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;

/** What Show if a profile follows you puts beside a profile's name. */
@RunWith(RobolectricTestRunner.class)
public class FriendshipStatusTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        Settings.SHOW_FRIENDSHIP_STATUS.resetToDefault();
    }

    @Test
    public void eachAnswerHasItsLabel() {
        assertEquals("Follows you", FriendshipStatus.text(true));
        assertEquals("Doesn't follow you", FriendshipStatus.text(false));
    }

    /** Before Instagram has checked, nothing is said either way. */
    @Test
    public void anUnknownAnswerHasNoLabel() {
        assertNull(FriendshipStatus.text(null));
    }

    @Test
    public void theLabelGoesAfterThePronouns() {
        assertEquals("she/her" + FriendshipStatus.SEPARATOR + "Follows you",
                FriendshipStatus.joined("she/her", "Follows you").toString());
        assertEquals("Follows you", FriendshipStatus.joined("", "Follows you").toString());
        assertEquals("Follows you", FriendshipStatus.joined(null, "Follows you").toString());
    }

    /** Unpatched, the stubs know no user, so there's no label even with the switch on. */
    @Test
    public void withoutTheProfilesUserThereIsNoLabel() {
        assertNull(FriendshipStatus.label(new Object()));
    }

    /** Unpatched, no ID is known, so nobody counts as the account signed in. */
    @Test
    public void withoutIdsNobodyIsTheViewer() {
        assertFalse(FriendshipStatus.isViewer(new Object(), new Object()));
    }

    @Test
    public void withTheSwitchOffThereIsNoLabel() {
        Settings.SHOW_FRIENDSHIP_STATUS.save(false);
        assertNull(FriendshipStatus.label(new Object()));
    }

    /** The hooks run inside Instagram's binder, so nothing they're handed may make them throw. */
    @Test
    public void theHooksNeverThrow() {
        FriendshipStatus.besidePronouns(null, null);
        FriendshipStatus.inPlaceOfPronouns(null, null);
        FriendshipStatus.besidePronouns(new Object(), new Object());
        FriendshipStatus.inPlaceOfPronouns(new Object(), new Object());
    }
}
