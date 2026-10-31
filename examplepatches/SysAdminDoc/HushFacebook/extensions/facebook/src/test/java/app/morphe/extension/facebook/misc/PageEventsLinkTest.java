/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * A Page's Events link goes to the Page, and the Page link the server answers for it gets the Events
 * tab; every other address goes through unchanged (#319).
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PageEventsLinkTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String PAGE = "fb://profile/100064469571787?wtsid=rdr_0KN3Ll7D3YMnZMAlH";

    @Before
    public void forgetPendingTab() {
        // No clock is earlier than this, so a tab left by another test is taken and dropped.
        PageEventsLink.route("fb://profile/1", Long.MIN_VALUE);
    }

    @Test
    public void usernameEventsLinkOpensThePageThenItsEventsTab() {
        assertEquals("https://www.facebook.com/facebook", PageEventsLink.route("https://www.facebook.com/facebook/events", 1_000));
        assertEquals(PAGE + "&" + PageEventsLink.TAB, PageEventsLink.route(PAGE, 4_000));
        // Only the one answer gets the tab.
        assertEquals(PAGE, PageEventsLink.route(PAGE, 5_000));
    }

    @Test
    public void everyEventsAddressShapeOpensThePage() {
        assertEquals("https://m.facebook.com/instagram", PageEventsLink.route("https://m.facebook.com/instagram/events/", 0));
        assertEquals("https://www.facebook.com/instagram", PageEventsLink.route("https://www.facebook.com/instagram/upcoming_hosted_events", 0));
        assertEquals("https://www.facebook.com/instagram", PageEventsLink.route("https://www.facebook.com/instagram/past_hosted_events?ref=page", 0));
        assertEquals("https://facebook.com/meta.page", PageEventsLink.route("https://facebook.com/pg/meta.page/events", 0));
        assertEquals("http://web.facebook.com/instagram", PageEventsLink.route("http://web.facebook.com/instagram/Events", 0));
    }

    @Test
    public void numericIdsGoStraightToTheEventsTab() {
        assertEquals("fb://profile/100064469571787?initial_tab=events",
                PageEventsLink.route("https://m.facebook.com/100064469571787/events", 0));
        assertEquals("fb://profile/4?initial_tab=events", PageEventsLink.route("https://www.facebook.com/profile.php?id=4&sk=events", 0));
        assertEquals("fb://profile/4?initial_tab=events",
                PageEventsLink.route("https://www.facebook.com/profile.php?sk=upcoming_hosted_events&id=4", 0));
        // No username wait was started.
        assertEquals(PAGE, PageEventsLink.route(PAGE, 1));
    }

    @Test
    public void theTabWaitsOnlyALittleWhile() {
        PageEventsLink.route("https://www.facebook.com/facebook/events", 1_000);
        assertEquals(PAGE, PageEventsLink.route(PAGE, 1_000 + PageEventsLink.WINDOW_MILLIS + 1));
    }

    @Test
    public void aPageLinkWithoutAQueryOrWithItsOwnTab() {
        PageEventsLink.route("https://www.facebook.com/facebook/events", 0);
        assertEquals("fb://profile/20531316728?initial_tab=events", PageEventsLink.route("fb://profile/20531316728", 10));
        PageEventsLink.route("https://www.facebook.com/facebook/events", 20);
        assertEquals("fb://profile/20531316728?initial_tab=about", PageEventsLink.route("fb://profile/20531316728?initial_tab=about", 30));
        assertEquals("fb://profile/20531316728", PageEventsLink.route("fb://profile/20531316728", 40));
    }

    @Test
    public void otherAddressesStayAsTheyAre() {
        String[] untouched = {
                "https://www.facebook.com/events/1234567890",
                "https://www.facebook.com/events",
                "https://www.facebook.com/groups/somegroup/events",
                "https://www.facebook.com/facebook",
                "https://www.facebook.com/facebook/photos",
                "https://www.facebook.com/profile.php?id=4",
                "https://www.facebook.com/profile.php?id=4&sk=photos",
                "https://www.facebook.com/profile.php?id=abc&sk=events",
                "https://www.facebook.com/home.php/events",
                "https://www.facebook.com/some-page/events",
                "https://www.instagram.com/facebook/events",
                "https://evilfacebook.com/facebook/events",
                "intent://www.facebook.com/facebook/events",
                "fb://feed/?wtsid=rdr_0KN3Ll7D3YMnZMAlH",
                "fb://page/100064469571787/events_list",
                "",
        };
        for (String url : untouched) assertEquals(url, url, PageEventsLink.route(url, 0));
        assertNull(PageEventsLink.route(null, 0));
        // None of them started a wait for the Page's answer.
        assertEquals(PAGE, PageEventsLink.route(PAGE, 1));
    }

    @Test
    public void theHookRunsOnTheDeviceClock() {
        assertEquals("https://www.facebook.com/facebook", PageEventsLink.route("https://www.facebook.com/facebook/events"));
        assertNull(PageEventsLink.route(null));
    }
}
