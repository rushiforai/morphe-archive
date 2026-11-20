package app.template.extension.wemuslim;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

public class ShortcutFilterTest {

    private static final String EGG = "https://activity.wemuapp.com/front/2026dist/smash-egg/index?userId=42&lang=en";
    private static final String REBATES = "https://h5.wemuapp.com/front/ota/gold?userId=42";
    private static final String TRIP = "https://www.trip.com?Allianceid=123&SID=456";

    @Test
    public void matchesThePromotionLinks() {
        for (String link : Arrays.asList(
                EGG,
                REBATES,
                TRIP,
                "https://trip.com/hotels",
                "HTTPS://H5.WEMUAPP.COM/front/ota/flight",
                "https://activity.wemuapp.com:443/x/smash-egg",
                "wemuslim://we.muslim.app/webpages/marketing?url=" + encode(EGG),
                "wemuslim://we.muslim.app/webpages/marketing?url=" + encode(encode(REBATES)),
                "wemuslim://we.muslim.app/web?url=" + TRIP)) {
            assertTrue(link, ShortcutLinks.isPromotion(link));
        }
    }

    @Test
    public void keepsEverythingElse() {
        for (String link : Arrays.asList(
                null,
                "",
                "wemuslim://we.muslim.app/main_static_shortcuts/quran",
                "wemuslim://we.muslim.app/worship/adhan",
                "https://activity.wemuapp.com/front/2026dist/ramadan/index",
                "https://h5.wemuapp.com/front/zakat/index?from=ota",
                "https://h5.wemuapp.com/front/otaother/x",
                "https://mytrip.com/x",
                "https://trip.com.example.org/x",
                "https://example.org/?next=trip.com",
                "https://example.org/smash-egg",
                "https://example.org/%zz%2")) {
            assertFalse(String.valueOf(link), ShortcutLinks.isPromotion(link));
        }
    }

    @Test
    public void describeNeverLeaksTheQuery() {
        assertEquals("https://activity.wemuapp.com/front/2026dist/smash-egg/index", ShortcutLinks.describe(EGG));
        assertEquals("https://www.trip.com", ShortcutLinks.describe(TRIP));
        assertEquals(
                "wemuslim://we.muslim.app/webpages/marketing > h5.wemuapp.com/front/ota/gold",
                ShortcutLinks.describe("wemuslim://we.muslim.app/webpages/marketing?url=" + encode(REBATES)));
        assertEquals("-", ShortcutLinks.describe(null));
        assertFalse(ShortcutLinks.describe("wemuslim://a/b?url=" + encode(EGG)).contains("42"));
    }

    @Test
    public void filtersSingleShortcutsAndFolders() {
        Res quran = new Res(1, "wemuslim://we.muslim.app/main_static_shortcuts/quran");
        Res egg = new Res(2, EGG);
        Res folderRes = new Res(3, "");
        Res trip = new Res(4, TRIP);
        Res rebates = new Res(5, REBATES);
        Res qibla = new Res(6, "wemuslim://we.muslim.app/qibla");
        Res other = new Res(7, "wemuslim://we.muslim.app/tasbih");

        Entry single = new Entry(null, list(quran));
        Entry eggEntry = new Entry(null, list(egg));
        Entry rebatesFolder = new Entry(folderRes, list(trip, rebates));
        Entry mixedFolder = new Entry(folderRes, list(trip, qibla, other));
        Entry shrinkingFolder = new Entry(folderRes, list(rebates, qibla));

        List<?> out = ShortcutFilter.filterDiscover(list(single, eggEntry, rebatesFolder, mixedFolder, shrinkingFolder));

        assertEquals(3, out.size());
        assertSame(single, out.get(0));
        Entry mixed = (Entry) out.get(1);
        assertSame(folderRes, mixed.getFolderResource());
        assertEquals(list(qibla, other), mixed.getResourceList());
        Entry collapsed = (Entry) out.get(2);
        assertNull(collapsed.getFolderResource());
        assertEquals(list(qibla), collapsed.getResourceList());
    }

    @Test
    public void dropsAFolderWhoseOwnLinkIsAPromotion() {
        Entry folder = new Entry(new Res(1, REBATES), list(new Res(2, "wemuslim://x/y")));
        assertEquals(0, ShortcutFilter.filterDiscover(list(folder)).size());
    }

    @Test
    public void returnsTheSameListWhenNothingMatches() {
        List<Object> entries = list(new Entry(null, list(new Res(1, "wemuslim://x/y"))));
        assertSame(entries, ShortcutFilter.filterDiscover(entries));
    }

    @Test
    public void returnsTheListUnchangedOnUnexpectedClasses() {
        List<Object> entries = list("not a shortcut", new Entry(null, list(new Res(2, EGG))));
        assertSame(entries, ShortcutFilter.filterDiscover(entries));
        assertNull(ShortcutFilter.filterDiscover(null));
        List<Object> empty = Collections.emptyList();
        assertSame(empty, ShortcutFilter.filterDiscover(empty));
    }

    private static List<Object> list(Object... items) {
        return new ArrayList<>(Arrays.asList(items));
    }

    private static String encode(String value) {
        try {
            return java.net.URLEncoder.encode(value, "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }

    /** Shape of the app's ResourceUiModel as far as the filter uses it. */
    public static final class Res {
        private final long id;
        private final String jumpUrl;

        Res(long id, String jumpUrl) {
            this.id = id;
            this.jumpUrl = jumpUrl;
        }

        public long getId() {
            return id;
        }

        public int getType() {
            return 2;
        }

        public String getJumpUrl() {
            return jumpUrl;
        }
    }

    /** Shape of the app's DiscoverResourceUiModelWithFolder. */
    public static final class Entry {
        private final Res folderResource;
        private final List<?> resourceList;

        public Entry(Res folderResource, List<?> resourceList) {
            this.folderResource = folderResource;
            this.resourceList = resourceList;
        }

        public Res getFolderResource() {
            return folderResource;
        }

        public List<?> getResourceList() {
            return resourceList;
        }
    }
}
