/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/** The two page filters that take server-inlined ads out of Reels. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelsAdFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for the obfuscated ad item base class; the patch passes its binary name. */
    public static class AdBase {
    }

    public static final class VideoAd extends AdBase {
    }

    public static final class Reel {
    }

    /** A section wrapper: the screen reads the list it holds. */
    public static final class Section {
        List<Object> items;

        Section(List<Object> items) {
            this.items = items;
        }
    }

    private static final String AD = AdBase.class.getName();

    /** A Reels item the way the stand-in reader sees one: an ordinary reel around the story it holds. */
    public static final class StoryReel {
        final GraphQLStory story;

        StoryReel(GraphQLStory story) {
            this.story = story;
        }
    }

    /** A story Facebook delivered as an ad: the stand-in reader finds sponsored data on it. */
    public static final class SponsoredStory extends GraphQLStory {
    }

    /** Reads the stand-in items the way the stubs the patch fills in read Facebook's. */
    private static final ReelsAdFilter.Items ITEMS = new ReelsAdFilter.Items() {
        @Override
        public boolean isItem(Object item) {
            return item instanceof StoryReel;
        }

        @Override
        public Object story(Object item) {
            return ((StoryReel) item).story;
        }

        @Override
        public Object sponsoredData(Object story) {
            return story instanceof SponsoredStory ? new Object() : null;
        }
    };

    private static String counterLine(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ":")) return line;
        }
        return null;
    }

    @After
    public void restoreSwitch() {
        Settings.HIDE_SPONSORED_REELS.resetToDefault();
        FeedFilterCounters.clear();
    }

    @Test
    public void aPageLosesItsAdsAndKeepsItsReels() {
        Reel first = new Reel();
        Reel second = new Reel();
        Collection<?> kept = ReelsAdFilter.withoutAds(Arrays.asList(first, new VideoAd(), second), AD);

        assertEquals(Arrays.asList(first, second), new ArrayList<>(kept));
    }

    /** The mutation control: a page with no ad comes back as the very same object. */
    @Test
    public void aPageWithoutAdsIsHandedBackUntouched() {
        List<Object> page = Collections.unmodifiableList(Arrays.asList(new Reel(), new Reel()));

        assertSame(page, ReelsAdFilter.withoutAds(page, AD));
    }

    @Test
    public void aSectionLosesItsAdsAndAnEmptiedSectionGoes() {
        Reel reel = new Reel();
        Section mixed = new Section(new ArrayList<>(Arrays.asList(reel, new VideoAd())));
        Section adsOnly = new Section(Collections.unmodifiableList(Collections.singletonList(new VideoAd())));

        List<?> kept = ReelsAdFilter.withoutAdSections(Arrays.asList(mixed, adsOnly), AD);

        assertEquals(1, kept.size());
        assertSame(mixed, kept.get(0));
        assertEquals(Collections.singletonList(reel), mixed.items);
        assertTrue("an immutable list is replaced rather than edited", adsOnly.items.isEmpty());
    }

    /**
     * Facebook builds an ad's own item only when the unit's ad details pass a check, and a unit that
     * fails it can come as an ordinary reel around the ad's story (issues #47 and #35). The story's
     * sponsored data gives it away, at both levels, and the report counts it apart.
     */
    @Test
    public void anOrdinaryReelAroundASponsoredStoryComesOffAtBothLevels() {
        StoryReel first = new StoryReel(new GraphQLStory());
        StoryReel second = new StoryReel(new GraphQLStory());
        Collection<?> kept = ReelsAdFilter.withoutAds(Arrays.asList(first, new StoryReel(new SponsoredStory()), second),
                AD, ITEMS);
        assertEquals(Arrays.asList(first, second), new ArrayList<>(kept));

        Section section = new Section(new ArrayList<>(Arrays.asList(first, new StoryReel(new SponsoredStory()))));
        assertSame(section, ReelsAdFilter.withoutAdSections(Collections.singletonList(section), AD, ITEMS).get(0));
        assertEquals(Collections.singletonList(first), section.items);

        assertEquals(ReelsAdFilter.PAGES_ROUTE + ": 1 lists, 3 items, 1 removed. Last reason: sponsored story. "
                + "Removed: sponsored story 1. Kinds: story 2, sponsored story 1", counterLine(ReelsAdFilter.PAGES_ROUTE));
        assertEquals(ReelsAdFilter.SECTIONS_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: sponsored story in a section. "
                + "Removed: sponsored story in a section 1. Kinds: sponsored story 1, story 1",
                counterLine(ReelsAdFilter.SECTIONS_ROUTE));
    }

    /**
     * The mutation control for the story rule: a reel whose story has no sponsored data, a reel with
     * no story and something that isn't an item all stay, and the page comes back as the same object.
     */
    @Test
    public void reelsWithoutSponsoredDataStay() {
        List<Object> page = Collections.unmodifiableList(Arrays.asList(
                new StoryReel(new GraphQLStory()), new StoryReel(null), new Reel()));

        assertSame(page, ReelsAdFilter.withoutAds(page, AD, ITEMS));
        assertEquals(ReelsAdFilter.PAGES_ROUTE + ": 1 lists, 3 items, 0 removed. Kinds: no story 1, not a reel item 1, story 1",
                counterLine(ReelsAdFilter.PAGES_ROUTE));
    }

    @Test
    public void theSwitchKeepsAReelAroundASponsoredStory() {
        Settings.HIDE_SPONSORED_REELS.save(false);
        List<Object> page = Arrays.asList(new StoryReel(new GraphQLStory()), new StoryReel(new SponsoredStory()));
        Section section = new Section(new ArrayList<>(page));
        List<Object> sections = Collections.singletonList(section);

        assertSame(page, ReelsAdFilter.withoutAds(page, AD, ITEMS));
        assertSame(sections, ReelsAdFilter.withoutAdSections(sections, AD, ITEMS));
        assertEquals(page, section.items);
    }

    /**
     * Until the patch fills the stubs in, every reel stays: the item check answers no, and a reader
     * whose story getter or sponsored data accessor isn't filled in is named in Hook status.
     */
    @Test
    public void unfilledStubsKeepTheReelsAndSaySo() {
        HookStatus.clear();
        try {
            List<Object> page = Collections.singletonList(new StoryReel(new SponsoredStory()));
            assertSame(page, ReelsAdFilter.withoutAds(page, AD));
            assertEquals("the unfilled item check named something missing", "[]",
                    HookStatus.missing("Hide sponsored reels").toString());

            ReelsAdFilter.Items noStory = new ReelsAdFilter.Items() {
                @Override
                public boolean isItem(Object item) {
                    return true;
                }

                @Override
                public Object story(Object item) {
                    return ReelsAdFilter.UNPATCHED;
                }

                @Override
                public Object sponsoredData(Object story) {
                    return new Object();
                }
            };
            ReelsAdFilter.Items noData = new ReelsAdFilter.Items() {
                @Override
                public boolean isItem(Object item) {
                    return true;
                }

                @Override
                public Object story(Object item) {
                    return ((StoryReel) item).story;
                }

                @Override
                public Object sponsoredData(Object story) {
                    return ReelsAdFilter.UNPATCHED;
                }
            };
            assertSame(page, ReelsAdFilter.withoutAds(page, AD, noStory));
            assertSame(page, ReelsAdFilter.withoutAds(page, AD, noData));

            String missing = HookStatus.missing("Hide sponsored reels").toString();
            assertTrue(missing, missing.contains("method reel item#story"));
            assertTrue(missing, missing.contains("method GraphQLStory#sponsored_data"));
        } finally {
            HookStatus.clear();
        }
    }

    /** A story the reader can't get keeps its reel, and the report says which read threw. */
    @Test
    public void aStoryThatCantBeReadKeepsItsReel() {
        HookStatus.clear();
        try {
            ReelsAdFilter.Items failing = new ReelsAdFilter.Items() {
                @Override
                public boolean isItem(Object item) {
                    return true;
                }

                @Override
                public Object story(Object item) {
                    throw new IllegalStateException("story read under the filter");
                }

                @Override
                public Object sponsoredData(Object story) {
                    return new Object();
                }
            };
            List<Object> page = Collections.singletonList(new StoryReel(new SponsoredStory()));

            assertSame(page, ReelsAdFilter.withoutAds(page, AD, failing));
            String missing = HookStatus.missing("Hide sponsored reels").toString();
            assertTrue(missing, missing.contains("a working 'item story' hook (it threw java.lang.IllegalStateException)"));
        } finally {
            HookStatus.clear();
        }
    }

    @Test
    public void theSwitchLetsThePageThroughAsSent() {
        Settings.HIDE_SPONSORED_REELS.save(false);
        List<Object> page = Arrays.asList(new Reel(), new VideoAd());

        assertSame(page, ReelsAdFilter.withoutAds(page, AD));
    }

    /**
     * Both levels report what they were handed and what they took out, switched on or off, so a
     * diagnostic report says whether the hook ran without debug logging having been on.
     */
    @Test
    public void bothLevelsCountWhatTheySawAndWhatTheyDropped() {
        FeedFilterCounters.clear();
        ReelsAdFilter.withoutAds(Arrays.asList(new Reel(), new VideoAd(), new Reel()), AD);
        ReelsAdFilter.withoutAdSections(Collections.singletonList(
                new Section(new ArrayList<>(Arrays.asList(new Reel(), new VideoAd())))), AD);
        Settings.HIDE_SPONSORED_REELS.save(false);
        ReelsAdFilter.withoutAds(Arrays.asList(new Reel(), new VideoAd()), AD);

        String report = String.join("\n", FeedFilterCounters.report());
        assertTrue(report, report.contains(ReelsAdFilter.PAGES_ROUTE + ": 2 lists, 5 items, 1 removed"));
        assertTrue(report, report.contains(ReelsAdFilter.SECTIONS_ROUTE + ": 1 lists, 1 items, 1 removed"));
    }

    /**
     * The ad pool's vends ask before handing an ad out. On, each ask is held to no ad and counted;
     * off, the pool works as Facebook wrote it. A report from a 581 phone (#47) showed the page
     * filter dropping an ad the pool had already handed out and logged.
     */
    @Test
    public void theAdPoolIsHeldToNoAdOnlyWhileTheSwitchIsOn() {
        HookStatus.clear();
        try {
            assertTrue(ReelsAdFilter.holdPoolAd());
            assertTrue(ReelsAdFilter.holdPoolAd());
            Settings.HIDE_SPONSORED_REELS.save(false);
            assertFalse(ReelsAdFilter.holdPoolAd());

            String line = null;
            for (String candidate : HookStatus.report()) {
                if (candidate.startsWith("Hide sponsored reels:")) line = candidate;
            }
            assertNotNull(String.join("\n", HookStatus.report()), line);
            assertTrue(line, line.contains("invoked 3"));
            assertTrue(line, line.contains(ReelsAdFilter.POOL_HELD + " 2"));
        } finally {
            HookStatus.clear();
        }
    }

    /** A page whose iteration fails, the way a list changed on another thread would. */
    private static List<Object> failingPage() {
        return new AbstractList<Object>() {
            @Override
            public Object get(int index) {
                throw new java.util.ConcurrentModificationException("changed under the filter");
            }

            @Override
            public int size() {
                return 2;
            }
        };
    }

    /**
     * A page the filter can't walk goes to Facebook as it came, and the report says which level
     * threw. Before, the exception went on into Facebook's Reels page insert.
     */
    @Test
    public void aPageTheFilterCantWalkPassesThroughAndReachesTheReport() {
        HookStatus.clear();
        try {
            List<Object> page = failingPage();
            assertSame(page, ReelsAdFilter.withoutAds(page, AD));
            assertSame(page, ReelsAdFilter.withoutAdSections(page, AD));
            String missing = HookStatus.missing("Hide sponsored reels").toString();
            assertTrue(missing, missing.contains("a working 'page filter' hook (it threw java.util.ConcurrentModificationException)"));
            assertTrue(missing, missing.contains("a working 'section page' hook (it threw java.util.ConcurrentModificationException)"));
        } finally {
            HookStatus.clear();
        }
    }

    /** A section wrapper with no list in it at all, so the filter can't see its items. */
    public static final class Opaque {
        Object item = new VideoAd();
    }

    /** A section whose list fails when read, the way one Facebook swapped under the filter can. */
    public static final class Unreadable {
        List<Object> items = new AbstractList<Object>() {
            @Override
            public Object get(int index) {
                throw new IllegalStateException("read under the filter");
            }

            @Override
            public int size() {
                return 1;
            }
        };
    }

    /**
     * A section the filter can't read leaves the page as Facebook sent it, and says so in the
     * report: the ads in it reach the screen, and nothing else would tell anyone why.
     */
    @Test
    public void aSectionTheFilterCantReadReachesTheReport() {
        LogBufferManager.clearLogBuffer();
        try {
            List<Object> page = Arrays.asList(new Opaque(), new Unreadable());
            assertSame(page, ReelsAdFilter.withoutAdSections(page, AD));

            String report = LogBufferManager.buildExportText();
            assertTrue(report, report.contains("Hide sponsored reels: invoked 1, 0 found, 2 missing. First missing: "
                    + "item list " + Opaque.class.getName() + "#List field"));
            assertTrue(report, report.contains(
                    "The 'section filter' hook for Hide sponsored reels threw java.lang.IllegalStateException"));
            assertTrue(report, report.contains("| ReelsAdFilter | ERROR | could not filter a section"));
            assertTrue(HookStatus.missing("Hide sponsored reels").toString(), HookStatus.missing("Hide sponsored reels")
                    .contains("a working 'section filter' hook (it threw java.lang.IllegalStateException)"));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
    }
}
