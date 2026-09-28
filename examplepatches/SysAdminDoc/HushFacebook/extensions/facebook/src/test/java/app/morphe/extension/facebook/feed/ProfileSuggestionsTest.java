/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.feed.ProfileSuggestionsForTests.Section;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hook in your profile's People you may know section: the carousel builds nothing while the
 * People you may know switch is on, and builds as Facebook built it with the switch off, while
 * paused, before the settings are ready, and for any section that doesn't carry its name.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProfileSuggestionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for GraphQLFeedStoryCategory: only the constant names matter to the feed guard. */
    enum Category { ORGANIC }

    /** A section of another name, the way Facebook builds every other part of a profile. */
    public static final class HeaderSection extends Section {
        public HeaderSection() {
            super("ProfileHeaderSection");
        }
    }

    /** Something with no getLogTag() at all, which no section is. */
    public static final class NotASection {
    }

    /** A section whose name getter fails. */
    public static final class BrokenSection {
        public String getLogTag() {
            throw new IllegalStateException("no name");
        }
    }

    /** A second class under the carousel's name, so the kept reader has to follow the class. */
    public static final class OtherBuildSection {
        public String getLogTag() {
            return ProfileSuggestions.SECTION;
        }
    }

    @Before
    public void startClean() {
        ProfileSuggestionsForTests.newProcess();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.resetToDefault();
        ProfileSuggestionsForTests.newProcess();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String line(List<String> report, String prefix) {
        for (String line : report) {
            if (line.startsWith(prefix + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndTheCarouselBuildsNothing() {
        assertTrue("the People you may know switch starts off", Settings.HIDE_PEOPLE_YOU_MAY_KNOW.get());
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
    }

    /** One switch for both: the feed's row and the profile's carousel come and go together. */
    @Test
    public void theFeedRowAndTheProfileCarouselGoByTheSameSwitch() {
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
        assertTrue(FeedGuardForTests.hides(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow()));
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(false);
        assertFalse(ProfileSuggestionsForTests.hidesTheCarousel());
        assertFalse(FeedGuardForTests.hides(Category.ORGANIC, TypedFeedUnit.peopleYouMayKnow()));
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(true);
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
    }

    /** The other suggestion switches reach the feed only. */
    @Test
    public void theOtherSuggestionSwitchesLeaveTheCarouselAlone() {
        Settings.HIDE_SUGGESTED_POSTS.save(false);
        Settings.HIDE_SUGGESTED_FOR_YOU.save(false);
        try {
            assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
        } finally {
            Settings.HIDE_SUGGESTED_POSTS.resetToDefault();
            Settings.HIDE_SUGGESTED_FOR_YOU.resetToDefault();
        }
    }

    @Test
    public void pausedTheCarouselComesBack() {
        for (HushfacebookPause.Reason why : HushfacebookPause.Reason.values()) {
            if (why == HushfacebookPause.Reason.NONE) continue;
            PauseForTests.pause(why);
            assertFalse("paused by " + why, ProfileSuggestionsForTests.hidesTheCarousel());
        }
        PauseForTests.resume();
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
    }

    /** Until the settings are ready, the profile is Facebook's. */
    @Test
    public void untilTheSettingsAreReadyTheProfileIsFacebooks() {
        boolean[] hid = {true, true};
        SettingsContextRule.withoutContext(() -> hid[0] = ProfileSuggestionsForTests.hidesTheCarousel());
        SettingsContextRule.beforeThePauseIsDecided(() -> hid[1] = ProfileSuggestionsForTests.hidesTheCarousel());
        assertFalse(hid[0]);
        assertFalse(hid[1]);
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
    }

    /**
     * Only the section that names itself the carousel's way goes. Any other section, nothing at
     * all, or something with no name getter builds as Facebook built it, and the report says what
     * came instead, since the patch hooks that one section and nothing else should ever get here.
     */
    @Test
    public void anyOtherSectionIsLeftAndReported() {
        assertFalse(ProfileSuggestions.hideSection(new HeaderSection()));
        assertFalse(ProfileSuggestions.hideSection(null));
        assertFalse(ProfileSuggestions.hideSection(new NotASection()));
        List<String> missing = HookStatus.missing(FamilyNames.SUGGESTED_POSTS_PROFILE);
        assertEquals(missing.toString(), 3, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains(
                "section named " + ProfileSuggestions.SECTION + "#ProfileHeaderSection"));
        assertTrue(missing.toString(), missing.get(1).contains("section " + ProfileSuggestions.HOOK + "#null"));
        assertTrue(missing.toString(), missing.get(2).contains(
                "method " + NotASection.class.getName() + "#" + ProfileSuggestions.LOG_TAG));
        assertNull("a section that isn't the carousel was counted",
                line(FeedFilterCounters.report(), ProfileSuggestions.ROUTE));
    }

    /** A name getter that fails leaves the section to Facebook and names the hook as one that threw. */
    @Test
    public void aFailingNameGetterLeavesTheSectionAlone() {
        assertFalse(ProfileSuggestions.hideSection(new BrokenSection()));
        List<String> missing = HookStatus.missing(FamilyNames.SUGGESTED_POSTS_PROFILE);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains("'" + ProfileSuggestions.HOOK + "' hook"));
        // A working section after it still goes.
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
    }

    /** The name getter kept from one class isn't used on another. */
    @Test
    public void eachSectionClassIsReadThroughItsOwnGetter() {
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
        assertTrue(ProfileSuggestions.hideSection(new OtherBuildSection()));
        assertFalse(ProfileSuggestions.hideSection(new HeaderSection()));
        assertTrue(ProfileSuggestionsForTests.hidesTheCarousel());
    }

    /** Every time the carousel was built is counted under its section's name, and so is each time it went. */
    @Test
    public void theReportSaysHowOftenTheCarouselWasBuiltAndWent() {
        ProfileSuggestionsForTests.hidesTheCarousel();
        ProfileSuggestionsForTests.hidesTheCarousel();
        Settings.HIDE_PEOPLE_YOU_MAY_KNOW.save(false);
        ProfileSuggestionsForTests.hidesTheCarousel();

        assertEquals(ProfileSuggestions.ROUTE + ": 3 lists, 3 items, 2 removed. Last reason: "
                        + ProfileSuggestions.SECTION + ". Removed: " + ProfileSuggestions.SECTION + " 2. Kinds: "
                        + ProfileSuggestions.SECTION + " 3",
                line(FeedFilterCounters.report(), ProfileSuggestions.ROUTE));
        assertEquals(FamilyNames.SUGGESTED_POSTS_PROFILE + ": invoked 3, 1 found, 0 missing",
                line(HookStatus.report(), FamilyNames.SUGGESTED_POSTS_PROFILE));
        assertEquals("Hide suggested and promoted posts (your profile)", FamilyNames.SUGGESTED_POSTS_PROFILE);
        assertEquals("ProfilePeopleYouMayKnowSection", ProfileSuggestions.SECTION);
    }
}
