/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.share;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Looper;

import java.io.IOException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowClipboardManager;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en")
public class ShortLinkExpanderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String SHORT = "https://vt.tiktok.com/ZS123/";
    private static final String OTHER = "https://vt.tiktok.com/ZS9/";
    private static final String SITE_SHORT = "https://www.tiktok.com/t/ZT8abc/";
    private static final String VIDEO = "https://www.tiktok.com/@nasa/video/7312345678901234567";
    private static final String PHOTO = "https://www.tiktok.com/@nasa/photo/7312345678901234999";

    private final Map<String, String> landings = new HashMap<>();
    private final AtomicInteger opens = new AtomicInteger();
    private Executor oldOpener;
    private Context context;
    private ClipboardManager clipboard;

    /** Counts each open, and lands where {@link #landings} says. */
    private final ShortLinkExpander.Resolver resolver = url -> {
        opens.incrementAndGet();
        return landings.get(url);
    };

    @Before public void setUp() {
        oldOpener = ShortLinkExpander.opener;
        ShortLinkExpander.opener = Runnable::run;
        context = RuntimeEnvironment.getApplication();
        clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        landings.put(SHORT, VIDEO + "?_r=1&u_code=abc");
        landings.put(OTHER, PHOTO + "?_r=1");
    }

    @After public void tearDown() {
        ShortLinkExpander.opener = oldOpener;
        Settings.EXPAND_SHORT_SHARE_LINKS.resetToDefault();
        ShortLinkExpander.forgetForTests();
    }

    @Test public void aShortLinkLeadsToTheVideo() {
        Map<String, String> landed = new HashMap<>();
        landed.put(SHORT, VIDEO + "?_r=1&u_code=abc");
        landed.put("https://vm.tiktok.com/ZM456/", "https://m.tiktok.com/@nasa/video/7312345678901234567");
        landed.put(OTHER, PHOTO);
        assertEquals(VIDEO + "?_r=1&u_code=abc", ShortLinkExpander.expand(SHORT, landed::get));
        assertEquals("https://m.tiktok.com/@nasa/video/7312345678901234567",
                ShortLinkExpander.expand("https://vm.tiktok.com/ZM456/", landed::get));
        assertEquals(PHOTO, ShortLinkExpander.expand(OTHER, landed::get));
        assertNull("a full link isn't opened", ShortLinkExpander.expand(VIDEO, url -> {
            throw new AssertionError("opened " + url);
        }));
    }

    @Test public void onlyAVideoOrPhotoPageOnTikToksOwnSiteIsTaken() {
        Map<String, String> landed = new HashMap<>();
        for (String page : new String[]{
                "https://example.com/@nasa/video/1",
                "http://www.tiktok.com/@nasa/video/1",
                SHORT,
                "https://m.tiktok.com/v/7312345678901234567.html",
                "https://www.tiktok.com/",
                "https://www.tiktok.com/login?redirect_url=x",
                "https://www.tiktok.com/@nasa",
                "https://www.tiktok.com/@nasa/video/",
                "https://www.tiktok.com.example.com/@nasa/video/1",
        }) {
            landed.put(SHORT, page);
            assertNull(page, ShortLinkExpander.expand(SHORT, landed::get));
        }
        landed.clear();
        assertNull("nothing came back", ShortLinkExpander.expand(SHORT, landed::get));
        assertNull("the open failed", ShortLinkExpander.expand(SHORT, url -> {
            throw new IOException("offline");
        }));

        assertTrue(ShortLinkExpander.isShort(SHORT));
        assertTrue(ShortLinkExpander.isShort("https://vm.tiktok.com/ZM456/?share=1"));
        assertFalse(ShortLinkExpander.isShort(VIDEO));
        assertFalse(ShortLinkExpander.isShort("http://vt.tiktok.com/ZS123/"));
        assertFalse(ShortLinkExpander.isShort("https://vt.tiktok.com.example.com/ZS123/"));
    }

    @Test public void theSitesOwnShortLinkIsShortToo() {
        assertTrue(ShortLinkExpander.isShort(SITE_SHORT));
        assertTrue(ShortLinkExpander.isShort("https://tiktok.com/t/ZT8abc"));
        assertTrue(ShortLinkExpander.isShort("https://m.tiktok.com/t/ZT8abc/?_r=1"));
        for (String link : new String[]{
                "http://www.tiktok.com/t/ZT8abc/",
                "https://example.com/t/ZT8abc/",
                "https://www.tiktok.com.example.com/t/ZT8abc/",
                "https://www.tiktok.com/t/",
                "https://www.tiktok.com/t/ZT8abc/more",
                "https://www.tiktok.com/tag/ZT8abc",
                "https://www.tiktok.com/@nasa/t/ZT8abc/",
        }) {
            assertFalse(link, ShortLinkExpander.isShort(link));
        }

        landings.put(SITE_SHORT, VIDEO + "?_r=1");
        ShortLinkExpander.watch(context, SITE_SHORT, SITE_SHORT, ShortLinkExpander.clipStamp(context), resolver);
        copy(SITE_SHORT);
        idle();
        assertEquals(1, opens.get());
        assertEquals(VIDEO, text());
    }

    @Test public void aLinkTikTokMakesShortAfterTheRewriteIsSwappedWhenCopied() {
        String full = VIDEO + "?u_code=abc&share_link_id=x";
        assertFalse("off by default", ShortLinkExpander.wantsShortened(full));
        Settings.EXPAND_SHORT_SHARE_LINKS.save(true);
        assertTrue(ShortLinkExpander.wantsShortened(full));
        assertTrue(ShortLinkExpander.wantsShortened(PHOTO + "?_r=1"));
        assertFalse("PineDrama shares a link without a query as it is", ShortLinkExpander.wantsShortened(VIDEO));
        assertFalse(ShortLinkExpander.wantsShortened(SHORT + "?share=1"));
        assertFalse(ShortLinkExpander.wantsShortened("https://www.tiktok.com/@nasa?lang=en"));
        assertFalse(ShortLinkExpander.wantsShortened("https://example.com/@nasa/video/1?a=1"));
        assertFalse(ShortLinkExpander.wantsShortened(null));

        landings.put(SITE_SHORT, VIDEO + "?_r=1");
        copy("hello");
        // Every channel's link starts the one wait again.
        ShortLinkExpander.watchShortened(context, ShortLinkExpander.clipStamp(context), resolver);
        ShortLinkExpander.watchShortened(context, ShortLinkExpander.clipStamp(context), resolver);
        idle();
        copy("not a link");
        idle();
        assertEquals(0, opens.get());
        assertEquals("not a link", text());

        copy("Look: " + SITE_SHORT);
        idle();
        assertEquals(1, opens.get());
        assertEquals("Look: " + VIDEO, text());
        assertEquals("Full link copied", ShadowToast.getTextOfLatestToast());
        assertFalse(ShortLinkExpander.watchingShortenedForTests());
    }

    @Test public void aShortLinkCopiedBeforeTheSheetIsNeverRead() {
        copy(SHORT);
        ShortLinkExpander.watchShortened(context, ShortLinkExpander.clipStamp(context), resolver);
        idle();
        assertEquals(SHORT, text());
        assertEquals(0, opens.get());

        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ShortLinkExpander.WATCH_MS + 1));
        copy(OTHER);
        idle();
        assertEquals("the wait ended", OTHER, text());
        assertEquals(0, opens.get());
    }

    @Test public void theRewriteWaitsForTheShortLinkOnlyWhileTheLinkKeepsItsQuery() {
        String full = VIDEO + "?u_code=abc&share_link_id=x";
        Settings.EXPAND_SHORT_SHARE_LINKS.save(true);
        BaseSettings.SANITIZE_SHARING_LINKS.save(false);
        try {
            assertEquals(full, ShareUrlSanitizer.rewriteShareUrl(full));
            idle();
            assertTrue("Clean up shared links off: PineDrama shortens it", ShortLinkExpander.watchingShortenedForTests());
            ShortLinkExpander.forgetForTests();

            BaseSettings.SANITIZE_SHARING_LINKS.save(true);
            assertEquals(VIDEO, ShareUrlSanitizer.rewriteShareUrl(full));
            idle();
            assertFalse("no query left to shorten", ShortLinkExpander.watchingShortenedForTests());
        } finally {
            BaseSettings.SANITIZE_SHARING_LINKS.resetToDefault();
        }
    }

    @Test public void onlyTheSwitchStartsIt() {
        assertFalse(ShortLinkExpander.wants(SHORT));
        Settings.EXPAND_SHORT_SHARE_LINKS.save(true);
        assertTrue(ShortLinkExpander.wants(SHORT));
        assertFalse(ShortLinkExpander.wants(VIDEO));
        assertFalse(ShortLinkExpander.wants(null));
    }

    @Test public void nothingIsOpenedUntilTheLinkIsCopiedAndThenOnlyTheClipboardChanges() {
        copy("hello");
        long before = ShortLinkExpander.clipStamp(context);
        // The sheet makes its link once per channel as it opens: one wait, and no open yet.
        for (int channel = 0; channel < 4; channel++) {
            ShortLinkExpander.watch(context, SHORT, SHORT, before, resolver);
        }
        idle();
        assertEquals(0, opens.get());
        assertEquals("hello", text());

        copy("Look: " + SHORT);
        idle();
        assertEquals(1, opens.get());
        assertEquals("Look: " + VIDEO, text());
        assertEquals("Full link copied", ShadowToast.getTextOfLatestToast());

        // One swap per link made: copying it again later stays as copied.
        copy(SHORT);
        idle();
        assertEquals(SHORT, text());
        assertEquals(1, opens.get());
    }

    @Test public void aCopyThatCameBeforeTheWaitIsSwappedAtOnce() {
        long before = ShortLinkExpander.clipStamp(context);
        copy(SHORT);
        ShortLinkExpander.watch(context, SHORT, SHORT, before, resolver);
        idle();
        assertEquals(VIDEO, text());
        assertEquals(1, opens.get());

        // A link opened before is swapped from memory.
        long again = ShortLinkExpander.clipStamp(context);
        copy(SHORT);
        idle();
        ShortLinkExpander.watch(context, SHORT, SHORT, again, resolver);
        idle();
        assertEquals(VIDEO, text());
        assertEquals(1, opens.get());
    }

    @Test public void theClipThatWasThereWhenTheLinkWasMadeIsNeverRead() {
        // The same link copied earlier, before this sheet made it.
        copy(SHORT);
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        idle();
        assertEquals(SHORT, text());
        assertEquals(0, opens.get());
    }

    @Test public void aLinkNeverCopiedIsNeverOpenedAndTheWaitEnds() {
        copy("hello");
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ShortLinkExpander.WATCH_MS + 1));
        copy(SHORT);
        idle();
        assertEquals(SHORT, text());
        assertEquals(0, opens.get());
    }

    @Test public void aLinkSentToAnotherAppEndsTheWait() {
        ActivityController<Activity> tiktok = Robolectric.buildActivity(Activity.class).setup();
        copy("hello");
        ShortLinkExpander.watchShortened(context, ShortLinkExpander.clipStamp(context), resolver);
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        idle();
        // Android's share sheet takes the front, and its own Copy puts the link there.
        tiktok.pause();
        copy(SHORT);
        idle();
        tiktok.resume();
        idle();
        assertEquals(SHORT, text());
        assertEquals(0, opens.get());
        assertFalse(ShortLinkExpander.watchingShortenedForTests());

        // PineDrama's own Copy link on the next share still gets the full link.
        ShortLinkExpander.watch(context, OTHER, OTHER, ShortLinkExpander.clipStamp(context), resolver);
        copy(OTHER);
        idle();
        assertEquals(1, opens.get());
        assertEquals(PHOTO, text());
    }

    /**
     * Android's clipboard manager keeps its own listeners and takes off only those, where
     * Robolectric's keeps one list for every manager.
     */
    @Implements(ClipboardManager.class)
    public static class ClipboardWithItsOwnListeners extends ShadowClipboardManager {
        private final List<ClipboardManager.OnPrimaryClipChangedListener> listeners = new ArrayList<>();

        @Implementation @Override
        protected void addPrimaryClipChangedListener(ClipboardManager.OnPrimaryClipChangedListener listener) {
            listeners.add(listener);
        }

        @Implementation @Override
        protected void removePrimaryClipChangedListener(ClipboardManager.OnPrimaryClipChangedListener listener) {
            listeners.remove(listener);
        }

        @Implementation @Override
        protected void setPrimaryClip(ClipData clip) {
            super.setPrimaryClip(clip);
            for (ClipboardManager.OnPrimaryClipChangedListener listener : new ArrayList<>(listeners)) {
                listener.onPrimaryClipChanged();
            }
        }
    }

    @Config(shadows = ClipboardWithItsOwnListeners.class)
    @Test public void aWaitFromANewerContextEndsToo() {
        ActivityController<Activity> tiktok = Robolectric.buildActivity(Activity.class).setup();
        // HushPine's language set: each new MainActivity hands out a context of its own, with a
        // clipboard manager of its own.
        Context relocalized = context.createConfigurationContext(context.getResources().getConfiguration());
        ClipboardManager itsClipboard = (ClipboardManager) relocalized.getSystemService(Context.CLIPBOARD_SERVICE);
        assertNotSame(clipboard, itsClipboard);
        copy("hello");
        ShortLinkExpander.watch(context, OTHER, OTHER, ShortLinkExpander.clipStamp(context), resolver);
        ShortLinkExpander.watchShortened(relocalized, ShortLinkExpander.clipStamp(relocalized), resolver);
        idle();
        tiktok.pause();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
        itsClipboard.setPrimaryClip(ClipData.newPlainText("link", SHORT));
        idle();
        tiktok.resume();
        idle();
        assertEquals(SHORT, text());
        assertEquals(0, opens.get());

        // The same waits with PineDrama in front still work through each manager.
        ShortLinkExpander.watchShortened(relocalized, ShortLinkExpander.clipStamp(relocalized), resolver);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
        itsClipboard.setPrimaryClip(ClipData.newPlainText("link", OTHER));
        idle();
        assertEquals(1, opens.get());
        assertEquals(PHOTO, text());
    }

    @Test public void aLinkThatCouldntBeOpenedIsLeftForAWhile() {
        landings.put(SHORT, "https://www.tiktok.com/login");
        for (int copy = 0; copy < 2; copy++) {
            ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
            copy(SHORT);
            idle();
            assertEquals(SHORT, text());
        }
        assertEquals("a failed link was opened again at once", 1, opens.get());

        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ShortLinkExpander.RETRY_AFTER_MS + 1));
        landings.put(SHORT, VIDEO);
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        copy(SHORT);
        idle();
        assertEquals(2, opens.get());
        assertEquals(VIDEO, text());
    }

    @Test public void aFailedLinkIsLeftAloneWhileOthersAreOpened() {
        landings.put(SHORT, "https://www.tiktok.com/login");
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        copy(SHORT);
        idle();
        assertEquals(1, opens.get());

        ShortLinkExpander.watch(context, OTHER, OTHER, ShortLinkExpander.clipStamp(context), resolver);
        copy(OTHER);
        idle();
        assertEquals(2, opens.get());
        assertEquals(PHOTO, text());

        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        copy(SHORT);
        idle();
        assertEquals("opening another link made the failed one fair game again", 2, opens.get());
        assertEquals(SHORT, text());
    }

    @Test public void aLinkWhoseThreadCouldntStartIsTriedOnTheNextCopy() {
        ShortLinkExpander.opener = task -> {
            throw new RejectedExecutionException("no thread");
        };
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        copy(SHORT);
        idle();
        assertEquals(0, opens.get());
        assertEquals(SHORT, text());

        ShortLinkExpander.opener = Runnable::run;
        ShortLinkExpander.watch(context, SHORT, SHORT, ShortLinkExpander.clipStamp(context), resolver);
        copy(SHORT);
        idle();
        assertEquals(1, opens.get());
        assertEquals(VIDEO, text());
    }

    /** Puts {@code text} on the clipboard a moment later, so its clip carries a stamp of its own. */
    private void copy(String text) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1));
        clipboard.setPrimaryClip(ClipData.newPlainText("link", text));
    }

    private String text() {
        return clipboard.getPrimaryClip().getItemAt(0).getText().toString();
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }
}
