/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.ads.ProfileAdFilterForTests.SponsoredData;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hook first in the timeline story component's render method: a story that carries sponsored
 * data isn't drawn while the switch is on, and every other row, the profile's own posts first of
 * all, is drawn as Facebook would.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProfileAdFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SPONSORED_PROFILE_POSTS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(ProfileAdFilter.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SPONSORED_PROFILE_POSTS + ":")) return line;
        }
        return null;
    }

    /** A story Facebook delivered as an ad on a profile: a real one would have been tagged sponsored. */
    private static final class SponsoredStory extends GraphQLStory {
    }

    @Test
    public void theSwitchStartsOnAndASponsoredStoryIsntDrawn() {
        assertTrue("the switch starts off", Settings.HIDE_SPONSORED_PROFILE_POSTS.get());
        assertTrue(ProfileAdFilter.hide(new GraphQLStory(), ProfileAdFilterForTests.reads(new SponsoredData())));
        assertEquals(ProfileAdFilter.ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: sponsored_data. Removed: "
                + "sponsored_data 1. Kinds: sponsored story 1", counterLine());
        assertEquals(FamilyNames.SPONSORED_PROFILE_POSTS + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    /** Negative control: the profile's own post, a story with no sponsored data, is drawn. */
    @Test
    public void aStoryWithNoSponsoredDataIsDrawn() {
        assertFalse(ProfileAdFilter.hide(new GraphQLStory(), ProfileAdFilterForTests.reads(null)));
        assertEquals(ProfileAdFilter.ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: story 1", counterLine());
    }

    /** A subclass of the story model counts as a story, the way the real one is found by its kept name. */
    @Test
    public void aStorySubclassIsAStory() {
        assertTrue(ProfileAdFilter.isStory(new SponsoredStory()));
        assertTrue(ProfileAdFilter.hide(new SponsoredStory(), ProfileAdFilterForTests.reads(new SponsoredData())));
    }

    /**
     * Another timeline unit never reaches the accessor, which casts to GraphQLStory, and is drawn.
     * It counts under what it is.
     */
    @Test
    public void aUnitThatIsntAStoryNeverReachesTheAccessor() {
        ProfileAdFilter.Reader refuses = story -> {
            throw new AssertionError("the accessor was asked about " + story);
        };
        assertFalse(ProfileAdFilter.hide(new Object(), refuses));
        assertFalse(ProfileAdFilter.hide(null, refuses));
        assertEquals(ProfileAdFilter.ROUTE + ": 2 lists, 2 items, 0 removed. Kinds: other unit 2", counterLine());
    }

    @Test
    public void offTheRowIsDrawn() {
        Settings.HIDE_SPONSORED_PROFILE_POSTS.save(false);
        assertFalse(ProfileAdFilter.hide(new GraphQLStory(), ProfileAdFilterForTests.reads(new SponsoredData())));
        assertEquals(ProfileAdFilter.ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: sponsored story 1", counterLine());
    }

    @Test
    public void pausedTheRowIsDrawn() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(ProfileAdFilterForTests.hidesASponsoredStory());
    }

    /** Before the patch fills the stub in, a story reads as not patched, is reported, and is drawn. */
    @Test
    public void theUnpatchedStubLeavesTheRow() {
        assertSame(ProfileAdFilter.UNPATCHED, ProfileAdFilter.sponsoredData(new GraphQLStory()));
        assertFalse(ProfileAdFilter.hide(new GraphQLStory()));
        assertTrue(counterLine(), counterLine().contains("Kinds: " + ProfileAdFilter.NOT_PATCHED + " 1"));
        assertTrue(statusLine(), statusLine().contains("1 missing"));
    }

    /** An accessor that throws is recorded and the row is drawn: the hook fails open. */
    @Test
    public void aThrowingAccessorDrawsTheRow() {
        ProfileAdFilter.Reader throwing = story -> {
            throw new IllegalStateException("released tree");
        };
        assertFalse(ProfileAdFilter.hide(new GraphQLStory(), throwing));
        assertTrue(counterLine(), counterLine().contains(ProfileAdFilter.READ_FAILED + " 1"));
        assertTrue(statusLine(), statusLine().contains("IllegalStateException"));
    }

    @Test
    public void theProbeHidesASponsoredStory() {
        assertTrue(ProfileAdFilterForTests.hidesASponsoredStory());
    }
}
