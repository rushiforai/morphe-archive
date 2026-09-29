/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.reflect.Method;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/** Which links leave Facebook's in-app browser, and where they go. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ExternalBrowserTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restoreSwitch() {
        Settings.OPEN_LINKS_EXTERNALLY.resetToDefault();
    }

    private static Uri unwrap(String url) throws Exception {
        Method unwrap = ExternalBrowser.class.getDeclaredMethod("unwrapLinkShim", Uri.class);
        unwrap.setAccessible(true);
        return (Uri) unwrap.invoke(null, Uri.parse(url));
    }

    @Test
    public void theLinkShimGivesUpItsDestination() throws Exception {
        assertEquals("https://example.org/a?b=1",
                unwrap("https://lm.facebook.com/l.php?u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1&h=AT0x").toString());
    }

    /** The mutation control: a link that is not a shim, or a shim whose u is no web link, stays. */
    @Test
    public void anythingElseIsLeftAsItCame() throws Exception {
        assertEquals("https://example.org/l.php?u=https%3A%2F%2Fother.org",
                unwrap("https://example.org/l.php?u=https%3A%2F%2Fother.org").toString());
        assertEquals("https://m.facebook.com/l.php?u=javascript%3Aalert(1)",
                unwrap("https://m.facebook.com/l.php?u=javascript%3Aalert(1)").toString());
    }

    private static Activity browserWith(String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        return Robolectric.buildActivity(Activity.class, intent).create().get();
    }

    @Test
    public void anOutsideLinkOpensInTheDefaultBrowser() {
        Activity browser = browserWith("https://lm.facebook.com/l.php?u=https%3A%2F%2Fexample.org%2F&h=AT0x");

        assertTrue(ExternalBrowser.redirect(browser, browser.getIntent()));
        Intent started = shadowOf(browser).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://example.org/", started.getDataString());
        assertTrue("the in-app browser closes behind the link", browser.isFinishing());
    }

    /**
     * A URL's scheme is case-insensitive (RFC 3986), and the warning-page check already read it
     * that way. A destination written HTTPS:// stayed in the in-app browser. The link goes out as
     * a browsable VIEW, so only an app that declares it opens web links can take it.
     */
    @Test
    public void anUppercaseSchemeGoesOutAndOnlyToABrowsableApp() {
        Activity browser = browserWith("https://lm.facebook.com/l.php?u=HTTPS%3A%2F%2Fexample.org%2F&h=AT0x");

        assertTrue(ExternalBrowser.redirect(browser, browser.getIntent()));
        Intent started = shadowOf(browser).getNextStartedActivity();
        assertEquals("HTTPS://example.org/", started.getDataString());
        assertTrue(started.hasCategory(Intent.CATEGORY_BROWSABLE));
    }

    /**
     * The shim's u= is decoded once, as the browser would, and fbclid leaves the destination: an
     * escaped percent inside it stays escaped, and every other key stays as Facebook passed it.
     */
    @Test
    public void theDestinationLeavesWithoutFbclidAndIsDecodedOnce() {
        Activity browser = browserWith("https://lm.facebook.com/l.php?u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1"
                + "%26fbclid%3DIwAR0x%26c%3D%2525%23part&h=AT0x");

        assertTrue(ExternalBrowser.redirect(browser, browser.getIntent()));
        assertEquals("https://example.org/a?b=1&c=%25#part", shadowOf(browser).getNextStartedActivity().getDataString());
    }

    @Test
    public void facebooksOwnPagesStayInTheApp() {
        Activity browser = browserWith("https://www.facebook.com/help/1234");

        assertFalse(ExternalBrowser.redirect(browser, browser.getIntent()));
        assertNull(shadowOf(browser).getNextStartedActivity());
    }

    /**
     * Facebook's short links open a Facebook page. Sent out, a browser opened that page on the web,
     * because a re-signed Facebook fails Android's check of the hosts its manifest claims.
     */
    @Test
    public void facebooksShortLinksStayInTheApp() {
        for (String url : new String[]{"https://fb.watch/aBc/", "https://fb.me/xyz", "https://m.me/someone",
                "https://lm.facebook.com/l.php?u=https%3A%2F%2Ffb.watch%2FaBc%2F&h=AT0x"}) {
            Activity browser = browserWith(url);

            assertFalse(url, ExternalBrowser.redirect(browser, browser.getIntent()));
            assertNull(url, shadowOf(browser).getNextStartedActivity());
        }
    }

    /** Only Facebook's own domains carry a link shim, so a short link's "u" is left alone. */
    @Test
    public void aShortLinkIsNeverTakenForAShim() throws Exception {
        assertEquals("https://fb.me/x?u=https%3A%2F%2Fexample.org",
                unwrap("https://fb.me/x?u=https%3A%2F%2Fexample.org").toString());
    }

    /**
     * Every form of the link shim Facebook's own code knows on 577 and 580 gives up its
     * destination: /l.php on facebook.com, its subdomains and fb.me, Messenger's /si/ajax/l/, and
     * the browser's three warning pages.
     */
    @Test
    public void everyShimFormFacebookKnowsGivesUpItsDestination() throws Exception {
        String destination = "u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1";
        for (String shim : new String[]{
                "https://l.facebook.com/l.php?" + destination + "&h=AT0x",
                "https://lm.facebook.com/l.php?" + destination + "&h=AT0x",
                "https://m.facebook.com/l.php?" + destination,
                "https://www.facebook.com/l.php?" + destination,
                "https://facebook.com/l.php?" + destination,
                "https://fb.me/l.php?" + destination,
                "https://www.facebook.com/si/ajax/l/render_redirect/?" + destination,
                "https://lm.facebook.com/flx/warn/?" + destination + "&h=AT0x",
                "https://www.facebook.com/fblynx/warn/?" + destination,
                "https://m.facebook.com/si/linkclick/warn/?" + destination}) {
            assertEquals(shim, "https://example.org/a?b=1", unwrap(shim).toString());
        }
    }

    /** Messenger's older shim keeps its destination in the path, with http:// when it names no scheme. */
    @Test
    public void theOlderShimGivesUpTheDestinationInItsPath() throws Exception {
        assertEquals("http://example.org/a", unwrap("https://www.facebook.com/l/AQDx1;example.org/a").toString());
        assertEquals("https://example.org/a", unwrap("https://l.facebook.com/l/AQDx1/https://example.org/a").toString());
        // Not the path the pattern reads: the link stays, as it does in Facebook.
        assertEquals("https://www.facebook.com/l/", unwrap("https://www.facebook.com/l/").toString());
    }

    /** A shim inside a shim unwraps to the end, as Facebook's own unwrapping does. */
    @Test
    public void aShimInsideAShimUnwrapsToTheEnd() throws Exception {
        String inner = "https://lm.facebook.com/flx/warn/?u=" + Uri.encode("https://example.org/a");
        assertEquals("https://example.org/a",
                unwrap("https://l.facebook.com/l.php?u=" + Uri.encode(inner) + "&h=AT0x").toString());
    }

    /**
     * A Facebook page that merely carries a "u" isn't a shim. Sharing a link, the share dialog and
     * any other page keep their parameters and stay in the app.
     */
    @Test
    public void facebookPagesWithAUAreNotShims() throws Exception {
        for (String page : new String[]{
                "https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fexample.org%2F",
                "https://m.facebook.com/sharer.php?u=https%3A%2F%2Fexample.org%2F",
                "https://www.facebook.com/dialog/share?app_id=1&href=https%3A%2F%2Fexample.org%2F"
                        + "&u=https%3A%2F%2Fexample.org%2F",
                "https://www.facebook.com/profile.php?id=4&u=https%3A%2F%2Fexample.org%2F"}) {
            assertEquals(page, page, unwrap(page).toString());
            Activity browser = browserWith(page);
            assertFalse(page, ExternalBrowser.redirect(browser, browser.getIntent()));
            assertNull(page, shadowOf(browser).getNextStartedActivity());
        }
    }

    /**
     * Messenger's web shim, the one Meta wraps links in chats with, unwraps too, and the link goes
     * out. Facebook's own checks don't name it, and left wrapped the link stayed in the app.
     */
    @Test
    public void messengersWebShimGivesUpItsDestination() throws Exception {
        String shim = "https://l.messenger.com/l.php?u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1&h=AT0x";
        assertEquals("https://example.org/a?b=1", unwrap(shim).toString());
        assertEquals("https://example.org/a?b=1",
                unwrap("https://www.messenger.com/l.php?u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1").toString());

        Activity browser = browserWith(shim);
        assertTrue(ExternalBrowser.redirect(browser, browser.getIntent()));
        assertEquals("https://example.org/a?b=1", shadowOf(browser).getNextStartedActivity().getDataString());
    }

    /** A Messenger page that merely carries a "u" isn't a shim, and stays in the app as it came. */
    @Test
    public void aMessengerPageWithAUIsNotAShim() throws Exception {
        String page = "https://www.messenger.com/t/12345?u=https%3A%2F%2Fexample.org%2F";
        assertEquals(page, unwrap(page).toString());
        Activity browser = browserWith(page);
        assertFalse(ExternalBrowser.redirect(browser, browser.getIntent()));
        assertNull(shadowOf(browser).getNextStartedActivity());
    }

    /**
     * The other shim forms only count on the hosts Facebook's code names them on: the warning pages
     * are the browser's pattern, which asks for https on a subdomain of facebook.com.
     */
    @Test
    public void shimsOnlyCountOnTheHostsFacebookNames() throws Exception {
        for (String link : new String[]{
                "https://l.messenger.com/flx/warn/?u=https%3A%2F%2Fexample.org%2F",
                "https://fb.me/flx/warn/?u=https%3A%2F%2Fexample.org%2F",
                "https://facebook.com/flx/warn/?u=https%3A%2F%2Fexample.org%2F",
                "http://lm.facebook.com/flx/warn/?u=https%3A%2F%2Fexample.org%2F",
                "https://notfacebook.com/l.php?u=https%3A%2F%2Fexample.org%2F"}) {
            assertEquals(link, link, unwrap(link).toString());
        }
    }

    /** Lower-cased in the phone's language, Turkish turned the I of FB.AUDIO into a dotless one. */
    @Test
    public void hostsCompareTheSameInTurkish() {
        java.util.Locale before = java.util.Locale.getDefault();
        java.util.Locale.setDefault(new java.util.Locale("tr", "TR"));
        try {
            Activity browser = browserWith("https://FB.AUDIO/x");

            assertFalse(ExternalBrowser.redirect(browser, browser.getIntent()));
            assertNull(shadowOf(browser).getNextStartedActivity());
        } finally {
            java.util.Locale.setDefault(before);
        }
    }

    @Test
    public void theSwitchKeepsEveryLinkInTheApp() {
        Settings.OPEN_LINKS_EXTERNALLY.save(false);
        Activity browser = browserWith("https://example.org/");

        assertFalse(ExternalBrowser.redirect(browser, browser.getIntent()));
        assertNull(shadowOf(browser).getNextStartedActivity());
    }

    /**
     * Facebook's in-app browser on a phone where no app opens web links. The message quotes the
     * link with its scheme and, the way some Android versions print an intent, without one: the
     * redactor takes out the first, and only leaving the message out keeps the second out too.
     */
    public static final class NoBrowserAround extends Activity {
        @Override
        public void startActivity(Intent intent) {
            throw new ActivityNotFoundException("No Activity found to handle Intent { act=android.intent.action.VIEW "
                    + "dat=https://example.org/private/path host=example.org/private/path flg=0x10000000 }");
        }
    }

    /**
     * A link no browser took stays in the app and says so in the report, by the exception's class
     * alone: its message quotes the intent, and the intent carries the link.
     */
    @Test
    public void aLinkNoBrowserTookReachesTheReportWithoutTheLink() {
        LogBufferManager.clearLogBuffer();
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.org/private/path"));
            Activity browser = Robolectric.buildActivity(NoBrowserAround.class, intent).create().get();

            assertFalse(ExternalBrowser.redirect(browser, browser.getIntent()));
            assertFalse("the in-app browser closed with no link opened elsewhere", browser.isFinishing());

            String report = LogBufferManager.buildExportText();
            assertTrue(report, report.contains(
                    "| ExternalBrowser | ERROR | No external browser took the link (ActivityNotFoundException)"));
            assertTrue(report, report.contains("Open links in external browser: invoked 1, 0 found, 0 missing"));
            assertFalse(report, report.contains("example.org"));
            assertFalse(report, report.contains("private/path"));
        } finally {
            LogBufferManager.clearLogBuffer();
        }
    }
}
