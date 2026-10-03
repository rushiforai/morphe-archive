/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.Collections;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/** What the link cleaner takes out of a link, and everything it leaves exactly as it was. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LinkCleanerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void clearCounts() {
        HookStatus.clear();
    }

    @After
    public void restore() {
        ThrowingSettingsRead.fail = false;
        Settings.SANITIZE_SHARING_LINKS.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void sharedLinkOutcomesCountOnlyActualChangesWithoutKeepingUrls() {
        String original = "https://example.org/a?fbclid=private-marker#top";
        assertEquals("https://example.org/a#top", LinkCleaner.sanitizeShared(original));
        assertEquals("https://example.org/a#top", LinkCleaner.sanitizeShared("https://example.org/a#top"));
        assertNull(LinkCleaner.sanitizeShared(null));
        String invalid = "intent://x?fbclid=private-marker#Intent;end";
        assertSame(invalid, LinkCleaner.sanitizeShared(invalid));
        assertEquals(Collections.singletonList("Sanitize sharing links: invoked 4, 0 found, 0 missing. "
                + "Counted: shared links changed 1"), HookStatus.report());
    }

    @Test
    public void disabledNotReadyAndPausedSharesDoNotAddChangeOutcomes() throws Exception {
        String original = "https://example.org/a?fbclid=private-marker";
        Settings.SANITIZE_SHARING_LINKS.save(false);
        assertSame(original, LinkCleaner.sanitizeShared(original));
        Settings.SANITIZE_SHARING_LINKS.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(original, LinkCleaner.sanitizeShared(original)));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertSame(original, LinkCleaner.sanitizeShared(original));
        } finally {
            pause.invoke(null, false);
        }
        assertEquals(Collections.singletonList("Sanitize sharing links: invoked 3, 0 found, 0 missing"),
                HookStatus.report());
    }

    @Test
    public void aShortLinkBecomesThePostsOwnLink() {
        assertEquals("https://www.threads.com/@threads/post/Dd9gVqImmyx",
                LinkCleaner.postLink("https://www.threads.com/share/BAXudaEdTE/", "threads", "Dd9gVqImmyx"));
        // Without the closing slash, on threads.net, keeping what followed the path but its tracking keys.
        assertEquals("https://threads.net/@a.b_c/post/C-8_x#top", LinkCleaner.ownLink("https://threads.net/share/x1/#top", "a.b_c", "C-8_x"));
        assertEquals("http://WWW.Threads.com/@u/post/C?keep=1",
                LinkCleaner.ownLink("http://WWW.Threads.com/share/abc?xmt=AQ&keep=1&igsh=z", "u", "C"));
        assertEquals(Collections.singletonList("Sanitize sharing links: invoked 1, 0 found, 0 missing. "
                + "Counted: short links replaced 1"), HookStatus.report());
    }

    @Test
    public void anythingButAShortThreadsLinkStaysAsItCame() {
        String[] kept = {
                "https://www.threads.com/@threads/post/Dd9gVqImmyx",
                "https://www.threads.com/share/",
                "https://www.threads.com/share/a/b",
                "https://www.threads.com/sharex/abc/",
                "https://www.instagram.com/share/abc/",
                "https://evil.example/share/abc/",
                "https://www.threads.com.evil.example/share/abc/",
                "https://user@www.threads.com/share/abc/",
                "https://www.threads.com:8443/share/abc/",
                "intent://www.threads.com/share/abc/#Intent;end",
                "https://www.threads.com?next=/share/abc/",
                "https://www.threads.com#/share/abc/",
                "not a link",
        };
        for (String url : kept) {
            assertSame(url, LinkCleaner.ownLink(url, "threads", "Dd9gVqImmyx"));
            assertSame(url, LinkCleaner.postLink(url, "threads", "Dd9gVqImmyx"));
        }
        assertNull(LinkCleaner.ownLink(null, "threads", "C"));
        assertNull(LinkCleaner.postLink(null, "threads", "C"));
        assertEquals(Collections.singletonList("Sanitize sharing links: invoked 14, 0 found, 0 missing"), HookStatus.report());
    }

    @Test
    public void aMissingOrOddAuthorOrCodeKeepsTheShortLink() {
        String link = "https://www.threads.com/share/BAXudaEdTE/";
        String[][] pairs = {
                {null, "C"}, {"threads", null}, {"", "C"}, {"threads", ""}, {"a/b", "C"}, {"a?b", "C"}, {"a b", "C"},
                {"abcdefghijabcdefghijabcdefghij1", "C"}, {"threads", "C/../x"}, {"threads", "C#x"}, {"threads", "C?x"},
        };
        for (String[] pair : pairs) assertSame(pair[0] + " " + pair[1], link, LinkCleaner.ownLink(link, pair[0], pair[1]));
        // The hook hands over whatever the author's name read gave, so anything but a String is no name.
        assertSame(link, LinkCleaner.postLink(link, new Object(), "C"));
        assertSame(link, LinkCleaner.postLink(link, null, "C"));
        assertEquals(Collections.singletonList("Sanitize sharing links: invoked 2, 0 found, 0 missing. "
                + "Counted: short links kept, no author or code 2"), HookStatus.report());
    }

    @Test
    public void disabledNotReadyAndPausedSharesKeepTheShortLink() throws Exception {
        String link = "https://www.threads.com/share/BAXudaEdTE/";
        Settings.SANITIZE_SHARING_LINKS.save(false);
        assertSame(link, LinkCleaner.postLink(link, "threads", "C"));
        Settings.SANITIZE_SHARING_LINKS.save(true);
        SettingsContextRule.withoutContext(() -> assertSame(link, LinkCleaner.postLink(link, "threads", "C")));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            assertSame(link, LinkCleaner.postLink(link, "threads", "C"));
        } finally {
            pause.invoke(null, false);
        }
        assertEquals(Collections.singletonList("Sanitize sharing links: invoked 3, 0 found, 0 missing"),
                HookStatus.report());
    }

    @Test
    @Config(shadows = ThrowingSettingsRead.class, instrumentedPackages = "app.morphe.extension.shared")
    public void aSettingsReadFailureKeepsTheShortLink() {
        String link = "https://www.threads.com/share/BAXudaEdTE/";
        try {
            ThrowingSettingsRead.fail = true;
            assertSame(link, LinkCleaner.postLink(link, "threads", "C"));
        } finally {
            ThrowingSettingsRead.fail = false;
        }
        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("switch read") && !report.contains("short links") && !report.contains("BAXudaEdTE"));
    }

    @Test
    @Config(shadows = ThrowingSettingsRead.class, instrumentedPackages = "app.morphe.extension.shared")
    public void aSettingsReadFailureKeepsTheLinkAndAddsNoChangeOutcome() {
        String original = "https://example.org/a?fbclid=private-marker";
        try {
            ThrowingSettingsRead.fail = true;
            assertSame(original, LinkCleaner.sanitizeShared(original));
        } finally {
            ThrowingSettingsRead.fail = false;
        }
        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("switch read"));
        assertTrue(report, !report.contains("shared links changed"));
        assertTrue(report, !report.contains("private-marker") && !report.contains("https://"));
    }

    @Test
    public void aPostKeptForAShareComesBackForThatShareOnly() {
        Object send = new Object();
        Object story = new Object();
        Object sendPost = new Object();
        Object storyPost = new Object();
        LinkCleaner.rememberPost(send, sendPost);
        LinkCleaner.rememberPost(story, storyPost);
        assertSame(sendPost, LinkCleaner.rememberedPost(send));
        assertSame(storyPost, LinkCleaner.rememberedPost(story));
        assertNull(LinkCleaner.rememberedPost(new Object()));
        assertNull(LinkCleaner.rememberedPost(null));
        // Quick sends pass their emptied post field again when they resume: that keeps the post.
        LinkCleaner.rememberPost(send, null);
        assertSame(sendPost, LinkCleaner.rememberedPost(send));
        LinkCleaner.rememberPost(null, sendPost);
        assertEquals(Collections.emptyList(), HookStatus.report());
    }

    @Test
    public void aShareThatEndsLetsGoOfItsPost() throws Exception {
        Object coroutine = new Object();
        java.lang.ref.WeakReference<Object> gone = new java.lang.ref.WeakReference<>(coroutine);
        LinkCleaner.rememberPost(coroutine, new Object());
        coroutine = null;
        for (int i = 0; i < 50 && gone.get() != null; i++) {
            System.gc();
            Thread.sleep(10);
        }
        assertNull("the kept post held its coroutine", gone.get());
    }

    @Test
    public void nothingIsKeptWhileOffNotReadyOrPaused() throws Exception {
        Object coroutine = new Object();
        Settings.SANITIZE_SHARING_LINKS.save(false);
        LinkCleaner.rememberPost(coroutine, new Object());
        assertNull(LinkCleaner.rememberedPost(coroutine));
        Settings.SANITIZE_SHARING_LINKS.save(true);
        SettingsContextRule.withoutContext(() -> LinkCleaner.rememberPost(coroutine, new Object()));
        assertNull(LinkCleaner.rememberedPost(coroutine));
        java.lang.reflect.Method pause = Setting.class.getDeclaredMethod("setPausedForProcess", boolean.class);
        pause.setAccessible(true);
        try {
            pause.invoke(null, true);
            LinkCleaner.rememberPost(coroutine, new Object());
        } finally {
            pause.invoke(null, false);
        }
        assertNull(LinkCleaner.rememberedPost(coroutine));
        assertEquals(Collections.emptyList(), HookStatus.report());
    }

    @Test
    @Config(shadows = ThrowingSettingsRead.class, instrumentedPackages = "app.morphe.extension.shared")
    public void aSettingsReadFailureKeepsNoPost() {
        Object coroutine = new Object();
        try {
            ThrowingSettingsRead.fail = true;
            LinkCleaner.rememberPost(coroutine, new Object());
        } finally {
            ThrowingSettingsRead.fail = false;
        }
        assertNull(LinkCleaner.rememberedPost(coroutine));
        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("post kept for a share"));
    }

    @Implements(Utils.class)
    public static class ThrowingSettingsRead {
        static boolean fail;

        @Implementation
        protected static boolean settingsReady() {
            if (fail) throw new IllegalStateException("settings unavailable");
            return true;
        }
    }

    private static void cleansTo(String expected, String url) {
        assertEquals(url, expected, LinkCleaner.clean(url));
        // Idempotent: a cleaned link has nothing left to take out.
        assertEquals("cleaning twice changed " + expected, expected, LinkCleaner.clean(expected));
    }

    private static void untouched(String url) {
        assertSame(url + " was rewritten", url, LinkCleaner.clean(url));
    }

    /** The link Threads hands out when a post is shared, with the two tags it adds. */
    @Test
    public void aSharedPostLinkLosesXmtAndSlof() {
        cleansTo("https://www.threads.com/@zuck/post/C8abc", "https://www.threads.com/@zuck/post/C8abc?xmt=AQGz&slof=1");
        cleansTo("https://www.threads.com/@zuck/post/C8abc", "https://www.threads.com/@zuck/post/C8abc?slof=1&xmt=AQGz");
        cleansTo("https://www.threads.com/@zuck", "https://www.threads.com/@zuck?xmt=AQGz");
        cleansTo("https://www.threads.net/@zuck/post/C8abc", "https://www.threads.net/@zuck/post/C8abc?xmt=AQGz&slof=1");
        cleansTo("https://threads.net/@zuck/post/C8abc", "https://threads.net/@zuck/post/C8abc?xmt=AQGz");
        cleansTo("https://www.instagram.com/p/C8abc/", "https://www.instagram.com/p/C8abc/?xmt=AQGz&slof=1");
    }

    /** Instagram's share tags ride along on links Threads hands out, to Meta's hosts and others. */
    @Test
    public void instagramsShareTagsGoFromMetaLinks() {
        cleansTo("https://www.threads.com/@zuck/post/C8abc", "https://www.threads.com/@zuck/post/C8abc?igsh=MXR0bmZ4");
        cleansTo("https://www.threads.net/@zuck/post/C8abc", "https://www.threads.net/@zuck/post/C8abc?igshid=MzRlODBi");
        cleansTo("https://www.instagram.com/reel/C8abc/", "https://www.instagram.com/reel/C8abc/?igsh=MXR0bmZ4&igsi=1");
        cleansTo("https://www.threads.com/@zuck/post/C8abc",
                "https://www.threads.com/@zuck/post/C8abc?xmt=AQGz&igsh=MXR0bmZ4&slof=1&igshid=MzRlODBi&igsi=1");
    }

    @Test
    public void fbclidAndInstagramsTagsGoFromAnyLink() {
        cleansTo("https://example.org/a?b=1#top", "https://example.org/a?b=1&fbclid=IwAR0x#top");
        cleansTo("https://example.org/a?b=1", "https://example.org/a?fbclid=IwAR0x&b=1");
        cleansTo("https://example.org/", "https://example.org/?fbclid=IwAR0x");
        cleansTo("https://example.org/#top", "https://example.org/?fbclid=IwAR0x#top");
        cleansTo("https://example.org/", "https://example.org/?fbclid");
        cleansTo("https://example.org/", "https://example.org/?fbclid=");
        cleansTo("https://example.org/a?b=1", "https://example.org/a?igsh=MXR0&b=1&igshid=MzRl&igsi=2");
        cleansTo("https://www.threads.com/@zuck", "https://www.threads.com/@zuck?fbclid=IwAR0x");
    }

    /** xmt and slof are Threads' own labels: on someone else's site they can mean anything. */
    @Test
    public void threadsOwnTagsStayOnOtherSites() {
        untouched("https://example.org/?xmt=AQGz&slof=1");
        untouched("https://news.example/story?slof=2");
        cleansTo("https://example.org/?xmt=AQGz", "https://example.org/?xmt=AQGz&fbclid=1");
    }

    /** The other pairs keep their order, a key given twice keeps both, and values keep their encoding. */
    @Test
    public void everythingElseInTheQueryStaysAsWritten() {
        cleansTo("https://example.org/?a=1&a=2&b=%20c+d&e", "https://example.org/?a=1&a=2&fbclid=x&b=%20c+d&e");
        cleansTo("https://example.org/?a=1&&b=3", "https://example.org/?a=1&&fbclid=2&b=3");
        cleansTo("https://example.org/?q=%2525", "https://example.org/?q=%2525&fbclid=1");
        cleansTo("https://www.threads.com/search?q=%23morphe&a=1", "https://www.threads.com/search?q=%23morphe&xmt=AQGz&a=1");
        untouched("https://example.org/?a=1&b=2");
        untouched("https://example.org/?fbclidx=1&xfbclid=2&FBCLID=3");
        untouched("https://www.threads.com/?xmtx=1&slofs=2&XMT=3&igshidx=4&xigsh=5");
    }

    @Test
    public void anEncodedKeyIsStillTheKey() {
        cleansTo("https://example.org/?a=1", "https://example.org/?%66bclid=x&a=1");
        cleansTo("https://www.threads.com/@zuck/post/C8abc?a=1", "https://www.threads.com/@zuck/post/C8abc?%78mt=AQGz&a=1");
        cleansTo("https://www.threads.com/@zuck/post/C8abc", "https://www.threads.com/@zuck/post/C8abc?sl%6Ff=1");
    }

    /** What picks the post, profile, search or media a link opens is never taken. */
    @Test
    public void aKeyThatPicksWhatOpensStays() {
        untouched("https://www.threads.com/@zuck/post/C8abc");
        untouched("https://www.threads.com/search?q=morphe&serp_type=default");
        untouched("https://www.instagram.com/p/C8abc/?img_index=2");
        untouched("https://l.threads.com/?u=https%3A%2F%2Fexample.org%2F&e=AT0x");
    }

    @Test
    public void onlyMetasRealHostsCount() {
        untouched("https://threads.com.example.org/?xmt=AQGz");
        untouched("https://notthreads.com/?xmt=AQGz");
        untouched("https://threads.network/?slof=1");
        untouched("https://myinstagram.com/?xmt=AQGz");
        cleansTo("HTTPS://WWW.THREADS.COM/x", "HTTPS://WWW.THREADS.COM/x?xmt=AQGz");
        cleansTo("https://user@www.threads.com:443/x", "https://user@www.threads.com:443/x?xmt=AQGz");
        cleansTo("https://www.threads.net./x", "https://www.threads.net./x?slof=1");
        // A lookalike host in another script is someone else's, whatever it looks like.
        String lookalike = "https://thre" + (char) 0x0430 + "ds.com/x?xmt=AQGz";
        untouched(lookalike);
    }

    /** A host and a query in other scripts are left in the characters they came in. */
    @Test
    public void unicodeHostsAndValuesSurvive() {
        String host = "https://b" + (char) 0x00FC + "cher.example/";
        cleansTo(host + "?q=" + (char) 0x00FC, host + "?q=" + (char) 0x00FC + "&fbclid=1");
    }

    @Test
    public void theFragmentIsNeverTheQuery() {
        untouched("https://example.org/a#x?fbclid=1");
        untouched("https://www.threads.com/@zuck#x?xmt=AQGz");
        cleansTo("https://example.org/a?b=1#x?fbclid=1", "https://example.org/a?b=1&fbclid=2#x?fbclid=1");
    }

    /** Anything that isn't a web link, or can't be read, goes out as it came. */
    @Test
    public void whatItCantReadItLeavesAlone() {
        assertNull(LinkCleaner.clean(null));
        untouched("");
        untouched("not a link?fbclid=1");
        untouched("mailto:someone@example.org?fbclid=1");
        untouched("intent://x?fbclid=1#Intent;end");
        untouched("barcelona://user?username=zuck&xmt=AQGz");
        untouched("https://example.org/no-query");
        cleansTo("https://example.org/?%zz=1", "https://example.org/?%zz=1&fbclid=2");
        cleansTo("https://[2001:db8::1]:8443/?a=1", "https://[2001:db8::1]:8443/?a=1&fbclid=2");
    }
}
