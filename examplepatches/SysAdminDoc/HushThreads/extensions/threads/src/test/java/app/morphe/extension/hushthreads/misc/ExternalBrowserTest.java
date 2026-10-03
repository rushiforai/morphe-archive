/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 0afb0e33 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.net.Uri;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Collections;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;

/** Which links leave Threads for the phone's browser, and what they look like when they do. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ExternalBrowserTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Activity feed;

    @Before
    public void openFeed() {
        HookStatus.clear();
        feed = Robolectric.buildActivity(Activity.class).create().get();
    }

    @After
    public void restore() {
        Settings.OPEN_LINKS_EXTERNALLY.resetToDefault();
        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(false);
        HookStatus.clear();
    }

    private static String unwrap(String url) {
        return ExternalBrowser.unwrapLinkShim(Uri.parse(url)).toString();
    }

    private Intent opened() {
        return shadowOf(feed).getNextStartedActivity();
    }

    @Test
    public void threadsClickTrackerGivesUpItsDestination() {
        assertEquals("https://example.org/a?b=1",
                unwrap("https://l.threads.com/?u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1&e=AT0x"));
        assertEquals("https://example.org/", unwrap("https://l.threads.net/?u=https%3A%2F%2Fexample.org%2F"));
        assertEquals("https://example.org/", unwrap("https://L.Instagram.com/anything?u=https%3A%2F%2Fexample.org%2F"));
        assertEquals("https://example.org/", unwrap("https://www.threads.com/linkshim/?u=https%3A%2F%2Fexample.org%2F"));
        assertEquals("https://example.org/", unwrap("https://help.instagram.com/linkshim?u=https%3A%2F%2Fexample.org%2F"));
        assertEquals("https://example.org/", unwrap("https://lm.facebook.com/l.php?u=https%3A%2F%2Fexample.org%2F&h=AT0x"));
    }

    @Test
    public void aTrackerInsideATrackerUnwrapsToTheEnd() {
        String inner = Uri.encode("https://l.instagram.com/?u=" + Uri.encode("https://example.org/deep"));
        assertEquals("https://example.org/deep", unwrap("https://l.threads.com/?u=" + inner));
    }

    /** The mutation control: anything that isn't one of Threads' trackers stays as it came. */
    @Test
    public void anythingElseIsLeftAsItCame() {
        for (String url : new String[]{
                // Not a tracker host, only one that looks like it.
                "https://l.threads.com.example.org/?u=https%3A%2F%2Fother.org",
                "https://example.org/linkshim?u=https%3A%2F%2Fother.org",
                "https://example.org/l.php?u=https%3A%2F%2Fother.org",
                // Threads reads /linkshim only over https.
                "http://www.threads.com/linkshim?u=https%3A%2F%2Fother.org",
                // Meta's intranet, which Threads' own check turns away.
                "https://our.intern.facebook.com/l.php?u=https%3A%2F%2Fother.org",
                // A tracker whose u isn't an absolute web link.
                "https://l.threads.com/?u=javascript%3Aalert(1)",
                "https://l.threads.com/?u=intent%3A%2F%2Fx%23Intent%3Bend",
                "https://l.threads.com/?u=%2Frelative",
                "https://l.threads.com/?e=AT0x",
        }) {
            assertEquals(url, unwrap(url));
        }
    }

    @Test
    public void anOutsideLinkOpensInTheDefaultBrowserWithoutTheTracker() {
        assertTrue(ExternalBrowser.open(feed, "https://l.threads.com/?u=https%3A%2F%2Fexample.org%2Fa%3Fb%3D1"
                + "%26fbclid%3DIwAR0x%26c%3D%2525%23part&e=AT0x"));

        Intent started = opened();
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertTrue("only an app that opens web links takes it", started.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertEquals("u= is decoded once and fbclid goes, every other key stays",
                "https://example.org/a?b=1&c=%25#part", started.getDataString());
        assertNull("no component, so Android picks the browser or the site's own app", started.getComponent());
        assertEquals("an activity's link joins its task as any app's link does", 0,
                started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK);
        assertEquals(Collections.singletonList("Open links in browser: invoked 1, 0 found, 0 missing. "
                + "Counted: links sent to the browser 1"), HookStatus.report());
    }

    @Test
    public void aLinkThatWasntWrappedGoesOutToo() {
        assertTrue(ExternalBrowser.open(feed, "HTTPS://Example.org/page"));
        assertEquals("the scheme goes out in lower case, the only case a browser's filter matches",
                "https://Example.org/page", opened().getDataString());
    }

    @Test
    public void withoutAnActivityTheBrowserGetsATaskOfItsOwn() {
        Application app = RuntimeEnvironment.getApplication();
        assertTrue(ExternalBrowser.open(app, "https://example.org/"));
        Intent started = shadowOf(app).getNextStartedActivity();
        assertEquals("https://example.org/", started.getDataString());
        assertTrue((started.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    /** Sign-in, challenges and the Accounts Center need Threads' own browser and its session. */
    @Test
    public void metaPagesStayInThreads() {
        for (String url : new String[]{
                "https://www.threads.com/@zuck",
                "https://help.threads.com/articles/1",
                "https://www.instagram.com/accounts/login/",
                "https://accountscenter.meta.com/",
                "https://www.facebook.com/privacy/genai",
                "https://THREADS.NET/",
                "https://m.me/someone",
                "https://fb.watch/abc/",
                // A tracker around a Meta page stays a Meta page.
                "https://l.threads.com/?u=https%3A%2F%2Fwww.instagram.com%2Fchallenge%2F",
                // A tracker with nothing to unwrap is Threads' own host.
                "https://l.threads.com/?e=AT0x",
        }) {
            assertFalse(url, ExternalBrowser.open(feed, url));
            assertNull(url, opened());
        }
    }

    /** The dot keeps a lookalike from passing as a Meta host, so its link goes out. */
    @Test
    public void aLookalikeHostIsNoMetaHost() {
        assertTrue(ExternalBrowser.open(feed, "https://notthreads.com/"));
        assertTrue(ExternalBrowser.open(feed, "https://threads.com.example.org/"));
    }

    @Test
    public void linksThatArentWebLinksStayWithThreads() {
        for (String url : new String[]{
                "barcelona://user?username=zuck",
                "mailto:someone@example.org",
                "intent://example.org#Intent;scheme=https;end",
                "javascript:alert(1)",
                "file:///sdcard/a.html",
                "",
        }) {
            assertFalse(url, ExternalBrowser.open(feed, url));
            assertNull(url, opened());
        }
        assertFalse(ExternalBrowser.open(feed, null));
        assertFalse(ExternalBrowser.open(null, "https://example.org/"));
    }

    @Test
    public void theSwitchOffLeavesEveryLinkToThreads() {
        Settings.OPEN_LINKS_EXTERNALLY.save(false);
        assertFalse(ExternalBrowser.open(feed, "https://example.org/"));
        assertNull(opened());

        Settings.OPEN_LINKS_EXTERNALLY.save(true);
        assertTrue(ExternalBrowser.open(feed, "https://example.org/"));
    }

    /** A phone with nothing that opens web links keeps the link in Threads' browser. */
    @Test
    public void withNoBrowserTheLinkStaysInThreads() {
        shadowOf(RuntimeEnvironment.getApplication()).checkActivities(true);

        assertFalse(ExternalBrowser.open(feed, "https://example.org/private-path"));
        assertNull(opened());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("links nothing else could open 1"));
        assertFalse("the report never carries the link", report.contains("private-path"));
    }
}
