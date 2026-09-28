/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;

import app.morphe.extension.facebook.ads.SearchAdFilterForTests.Module;
import app.morphe.extension.facebook.ads.SearchAdFilterForTests.Role;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The filter first in the search results page's constructor: an ad module doesn't make it into the
 * page, every other module does, in order, and anything it can't read or any failure leaves the
 * page as Facebook built it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SearchAdFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SPONSORED_SEARCH_RESULTS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(SearchAdFilter.ROUTE + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SPONSORED_SEARCH + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndAnAdModuleLeavesThePage() {
        assertTrue("the switch starts off", Settings.HIDE_SPONSORED_SEARCH_RESULTS.get());
        Module person = new Module(Role.ENTITY_USER);
        Module ad = new Module(Role.SEARCH_ADS);
        Module post = new Module(Role.FEED_POSTS);
        List<?> page = SearchAdFilterForTests.withoutAds(Arrays.asList(person, ad, post));
        assertEquals(Arrays.asList(person, post), page);
        assertEquals(SearchAdFilter.ROUTE + ": 1 lists, 3 items, 1 removed. Last reason: SEARCH_ADS. Removed: "
                + "SEARCH_ADS 1. Kinds: ENTITY_USER 1, FEED_POSTS 1, SEARCH_ADS 1", counterLine());
        assertEquals(FamilyNames.SPONSORED_SEARCH + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    /** Every one of the nine ad roles goes, whatever list position it's in. */
    @Test
    public void everyAdRoleGoes() {
        List<Object> page = new ArrayList<>();
        List<Object> organic = new ArrayList<>();
        for (String name : SearchAdFilter.AD_ROLES) {
            page.add(new Module(Role.valueOf(name)));
            Module person = new Module(Role.ENTITY_USER);
            page.add(person);
            organic.add(person);
        }
        assertEquals(organic, SearchAdFilterForTests.withoutAds(page));
        assertTrue(counterLine(), counterLine().contains(" 9 removed"));
    }

    /**
     * Negative control: roles that name advertising or promotion without being an ad module stay.
     * FACEBOOK_ADVERTISING is results about Facebook's ad products, PROMOTED_ENTITY_MEDIA an
     * entity's own media, and neither is in Facebook's own ad set.
     */
    @Test
    public void organicRolesStayEvenWhenTheyNameAdvertising() {
        List<Module> page = new ArrayList<>();
        for (Role role : EnumSet.complementOf(EnumSet.of(Role.SEARCH_ADS, Role.DEPENDENT_SEARCH_ADS,
                Role.LATE_DEPENDENT_SEARCH_ADS, Role.TOP_POSITION_SEARCH_ADS, Role.TOP_POSITION_SHOPPABLE_ADS,
                Role.MARKETPLACE_SEARCH_ADS, Role.MARKETPLACE_BOOSTED_LISTING_SEARCH_ADS,
                Role.SEARCH_ADS_DISCOVERY_HEADER, Role.SEARCH_ADS_FLOATING_SEE_MORE))) {
            page.add(new Module(role));
        }
        assertSame("a page with no ad keeps the very list Facebook built", page, SearchAdFilterForTests.withoutAds(page));
        assertTrue(counterLine(), counterLine().contains(" 0 removed"));
    }

    /** The role names the extension hides are exactly the ones the stand-in enum and the patch list. */
    @Test
    public void theAdRolesAreTheNineTheEnumNames() {
        assertEquals(9, SearchAdFilter.AD_ROLES.length);
        for (String name : SearchAdFilter.AD_ROLES) {
            assertTrue(name, SearchAdFilter.isAdRole(name));
            assertTrue(name, name.contains("ADS"));
        }
        assertFalse(SearchAdFilter.isAdRole("FACEBOOK_ADVERTISING"));
        assertFalse(SearchAdFilter.isAdRole("search_ads"));
        assertFalse(SearchAdFilter.isAdRole(null));
    }

    @Test
    public void offThePageIsFacebooks() {
        Settings.HIDE_SPONSORED_SEARCH_RESULTS.save(false);
        List<Module> page = Arrays.asList(new Module(Role.SEARCH_ADS), new Module(Role.ENTITY_PAGES));
        assertSame(page, SearchAdFilterForTests.withoutAds(page));
        // Still counted, so a report says the hook is reached and what it saw.
        assertEquals(SearchAdFilter.ROUTE + ": 1 lists, 2 items, 0 removed. Kinds: ENTITY_PAGES 1, SEARCH_ADS 1",
                counterLine());
    }

    @Test
    public void pausedThePageIsFacebooks() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        List<Module> page = Arrays.asList(new Module(Role.TOP_POSITION_SEARCH_ADS), new Module(Role.FEED_POSTS));
        assertSame(page, SearchAdFilterForTests.withoutAds(page));
    }

    /** Items that aren't modules, and modules with no role, pass through untouched and are counted by shape. */
    @Test
    public void whatItCantReadStays() {
        Object tree = new Object();
        Module unset = new Module(null);
        Module ad = new Module(Role.SEARCH_ADS);
        List<?> page = SearchAdFilterForTests.withoutAds(Arrays.asList(tree, unset, ad, null));
        assertEquals(Arrays.asList(tree, unset, null), page);
        assertTrue(counterLine(), counterLine().contains("Kinds: not a module 2, SEARCH_ADS 1, no role 1"));
    }

    @Test
    public void aRoleThatIsntAnEnumStays() {
        Module odd = new Module("SEARCH_ADS");
        List<Module> page = Collections.singletonList(odd);
        assertSame(page, SearchAdFilterForTests.withoutAds(page));
        assertTrue(counterLine(), counterLine().contains(SearchAdFilter.NOT_AN_ENUM));
    }

    /** Before the patch fills the stubs in, every item reads as no module and the page stays. */
    @Test
    public void theUnpatchedStubsLeaveThePage() {
        List<Module> page = Collections.singletonList(new Module(Role.SEARCH_ADS));
        assertNull("null keeps Facebook's list", SearchAdFilter.keptResults(page, null));
        assertTrue(counterLine(), counterLine().contains("Kinds: " + SearchAdFilter.NOT_A_MODULE + " 1"));
        assertSame(SearchAdFilter.UNPATCHED, SearchAdFilter.role(new Object()));
    }

    /** The entry the shared page hook calls: null when nothing went, the kept modules otherwise. */
    @Test
    public void thePageHookGetsNullOrTheKeptModules() {
        Module person = new Module(Role.ENTITY_USER);
        Module ad = new Module(Role.TOP_POSITION_SEARCH_ADS);
        assertEquals(Collections.singletonList(person),
                SearchAdFilterForTests.keptResults(Arrays.asList(ad, person), "search_results_loader_initial_task"));
        assertNull(SearchAdFilterForTests.keptResults(Collections.singletonList(person), null));
        assertNull(SearchAdFilterForTests.keptResults(null, null));
    }

    /**
     * The Meta AI tab's own page is left whole, as Hide Meta AI in search leaves it, and counted
     * under its own kind rather than read.
     */
    @Test
    public void theMetaAiTabPageIsLeftWhole() {
        List<Module> page = Arrays.asList(new Module(Role.SEARCH_ADS), new Module(Role.ENTITY_USER));
        assertNull(SearchAdFilterForTests.keptResults(page, SearchAdFilter.META_AI_TAB_PAGE));
        assertEquals(SearchAdFilter.ROUTE + ": 0 lists, 0 items, 0 removed. Kinds: " + SearchAdFilter.META_AI_TAB_KIND + " 1",
                counterLine());
    }

    /** A role stub the patch didn't fill is reported in Hook status, and the module stays. */
    @Test
    public void anUnfilledRoleStubIsReported() {
        SearchAdFilter.Modules half = new SearchAdFilter.Modules() {
            @Override
            public boolean isModule(Object item) {
                return true;
            }

            @Override
            public Object role(Object module) {
                return SearchAdFilter.role(module);
            }
        };
        List<Module> page = Collections.singletonList(new Module(Role.SEARCH_ADS));
        assertSame(page, SearchAdFilter.withoutAds(page, half));
        assertTrue(statusLine(), statusLine().contains("1 missing"));
        assertTrue(statusLine(), statusLine().contains("search module#role"));
    }

    /** A read that throws is recorded, the rest of the page is still judged, and nothing crashes. */
    @Test
    public void aThrowingReadKeepsThatModule() {
        SearchAdFilter.Modules throwing = new SearchAdFilter.Modules() {
            @Override
            public boolean isModule(Object item) {
                if (item instanceof String) throw new IllegalStateException("released tree");
                return item instanceof Module;
            }

            @Override
            public Object role(Object module) {
                return ((Module) module).role;
            }
        };
        Module ad = new Module(Role.SEARCH_ADS);
        List<?> page = SearchAdFilter.withoutAds(Arrays.asList("broken", ad, new Module(Role.FEED_POSTS)), throwing);
        assertEquals(2, page.size());
        assertFalse(page.contains(ad));
        assertTrue(counterLine(), counterLine().contains(SearchAdFilter.READ_FAILED + " 1"));
        assertTrue(statusLine(), statusLine().contains("IllegalStateException"));
    }

    /** A list that fails as it's walked hands Facebook back its own list: the filter fails open. */
    @Test
    public void aFailureMidPageFailsOpen() {
        List<Object> broken = new ArrayList<Object>(Arrays.asList(new Module(Role.SEARCH_ADS), new Module(Role.FEED_POSTS))) {
            @Override
            public Object get(int index) {
                if (index == 1) throw new IndexOutOfBoundsException("changed under the filter");
                return super.get(index);
            }
        };
        assertSame(broken, SearchAdFilterForTests.withoutAds(broken));
        assertTrue(statusLine(), statusLine().contains("IndexOutOfBoundsException"));
    }

    @Test
    public void anEmptyOrMissingPageIsHandedBack() {
        List<Module> empty = Collections.emptyList();
        assertSame(empty, SearchAdFilterForTests.withoutAds(empty));
        assertNull(SearchAdFilterForTests.withoutAds(null));
    }

    @Test
    public void theDebugSummaryNamesRolesInTheOrderTheyCame() {
        assertEquals("FEED_POSTS 2, SEARCH_ADS 1, ENTITY_USER 1",
                SearchAdFilter.summary(Arrays.asList("FEED_POSTS", "SEARCH_ADS", "FEED_POSTS", "ENTITY_USER")));
        assertEquals("", SearchAdFilter.summary(Collections.emptyList()));
    }

    @Test
    public void theProbeDropsAnAd() {
        assertTrue(SearchAdFilterForTests.dropsAnAd());
    }
}
