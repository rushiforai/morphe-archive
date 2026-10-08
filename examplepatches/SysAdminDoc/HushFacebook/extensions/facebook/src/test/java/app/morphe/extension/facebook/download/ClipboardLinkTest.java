/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;

import com.facebook.video.engine.api.VideoDataSource;

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
import org.robolectric.shadows.ShadowActivity;

import java.lang.ref.WeakReference;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Offer to download copied links: coming back to Facebook with a reel or video link copied offers
 * Download once for that link. Off, with Download feed and Watch videos off, or paused, the
 * clipboard is never read.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ClipboardLinkTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final List<PostDetails> saved = Collections.synchronizedList(new ArrayList<>());
    private ActivityController<Activity> controller;
    private ClipboardLink.Redirects phone;
    private Activity activity;

    /** A player source whose fields carry the names the recorder is told. */
    static final class Source extends VideoDataSource {
        final String hd = "https://video.xx.fbcdn.net/v/hd.mp4";
        final String manifest = null;
    }

    /** Player params holding one source, as Facebook's do. */
    static final class Params {
        final String videoId;
        final VideoDataSource source = new Source();

        Params(String videoId) {
            this.videoId = videoId;
        }
    }

    @Before
    public void setUp() {
        Settings.CLIPBOARD_DOWNLOAD.save(true);
        Settings.DOWNLOAD_VIDEOS.save(true);
        HookStatus.clear();
        ClipboardLink.forgetClipForTests();
        phone = ClipboardLink.redirects;
        // Every Meta name answers a private address, so a save that starts is refused before a
        // socket opens.
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });
        MediaDownload.detailsForTests = saved::add;
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
    }

    @After
    public void tearDown() throws InterruptedException {
        AlertDialog offer = ClipboardLink.shownDialog();
        if (offer != null) offer.dismiss();
        ClipboardLink.onPaused(activity);
        controller.pause().stop().destroy();
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (MediaDownload.savesInFlight() > 0) {
            assertTrue("a save never finished", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
        ClipboardLink.redirects = phone;
        MediaDownload.policyForTests = null;
        MediaDownload.detailsForTests = null;
        PauseForTests.resume();
        Settings.CLIPBOARD_DOWNLOAD.resetToDefault();
        Settings.DOWNLOAD_VIDEOS.resetToDefault();
        Settings.DOWNLOAD_ACTION.resetToDefault();
        HookStatus.clear();
    }

    private void copy(String text) {
        activity.getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("copied", text));
        ClipboardLink.forgetClipForTests();
    }

    /** Resumes the screen and gives it focus, as Android does just after. Answers the offer shown. */
    private AlertDialog resume() {
        ClipboardLink.onResumed(activity);
        ClipboardLink.FocusWait wait = ClipboardLink.focusWait();
        if (wait != null) wait.onWindowFocusChanged(true);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        return ClipboardLink.shownDialog();
    }

    @Test
    public void readsReelAndVideoLinksAndNothingElse() {
        ClipboardLink.Found reel = ClipboardLink.find("Look at this https://www.facebook.com/reel/1234567890123/?mibextid=abc.");
        assertNotNull(reel);
        assertEquals("1234567890123", reel.videoId);
        assertTrue(reel.reel);
        assertEquals("https://www.facebook.com/reel/1234567890123", reel.canonical());

        assertEquals("55667788", ClipboardLink.find("https://m.facebook.com/watch/?v=55667788&ref=share").videoId);
        assertEquals("55667789", ClipboardLink.find("facebook.com/watch?v=55667789").videoId);
        assertEquals("55667790", ClipboardLink.find("https://www.facebook.com/SomePage/videos/55667790/").videoId);
        assertEquals("55667791", ClipboardLink.find("https://www.facebook.com/SomePage/videos/a-title/55667791").videoId);
        assertEquals("55667792", ClipboardLink.find("https://www.facebook.com/video.php?v=55667792").videoId);
        assertFalse(ClipboardLink.find("https://www.facebook.com/watch/?v=55667788").reel);

        ClipboardLink.Found share = ClipboardLink.find("(https://www.facebook.com/share/r/1AbCdEfGh/)");
        assertNotNull(share);
        assertNull("a share link names no video until it's read", share.videoId);
        assertTrue(share.reel);
        assertNull(ClipboardLink.find("https://fb.watch/aBcD12/").videoId);

        assertNull("a profile isn't a video", ClipboardLink.find("https://www.facebook.com/zuck"));
        assertNull("a post isn't a video", ClipboardLink.find("https://www.facebook.com/share/p/1AbCdEfGh/"));
        assertNull("another site isn't Facebook", ClipboardLink.find("https://notfacebook.com/reel/1234567890123"));
        assertNull("a bare fb.watch names nothing", ClipboardLink.find("https://fb.watch/"));
        assertNull(ClipboardLink.find("just some words"));
        assertNull(ClipboardLink.find(null));
    }

    @Test
    public void aShortLinkIsReadOffWhereItRedirects() {
        Map<String, String> web = new HashMap<>();
        web.put("https://fb.watch/aBcD12/", "https://www.facebook.com/watch/?v=11223344&ref=sharing");
        web.put("https://www.facebook.com/share/r/1AbCdEfGh/", "/reel/99887766/?mibextid=x");
        web.put("https://www.facebook.com/share/v/2XyZ/", "https://www.facebook.com/login.php?next=https%3A%2F%2Fwww.facebook.com%2Freel%2F44556677%2F");
        web.put("https://www.facebook.com/share/v/3XyZ/", "https://evil.example/reel/12345678");
        ClipboardLink.redirects = web::get;

        assertEquals("11223344", ClipboardLink.resolve(ClipboardLink.find("https://fb.watch/aBcD12/")).videoId);
        ClipboardLink.Found reel = ClipboardLink.resolve(ClipboardLink.find("https://www.facebook.com/share/r/1AbCdEfGh/"));
        assertEquals("99887766", reel.videoId);
        assertTrue(reel.reel);
        assertEquals("a sign-in page's next address is read", "44556677",
                ClipboardLink.resolve(ClipboardLink.find("https://www.facebook.com/share/v/2XyZ/")).videoId);
        assertNull("a redirect off Facebook is never followed",
                ClipboardLink.resolve(ClipboardLink.find("https://www.facebook.com/share/v/3XyZ/")));
        assertNull("no redirect, no video", ClipboardLink.resolve(ClipboardLink.find("https://fb.watch/zzz/")));
        assertEquals("an http short link is asked over https", "11223344",
                ClipboardLink.resolve(ClipboardLink.find("http://fb.watch/aBcD12/")).videoId);
    }

    @Test
    public void aResumeOffersACopiedLinkOnce() {
        copy("https://www.facebook.com/reel/31415926535/");
        int before = ClipboardLink.READS.get();
        AlertDialog offer = resume();
        assertNotNull("no offer", offer);
        assertEquals(before + 1, ClipboardLink.READS.get());
        assertTrue(String.join(" | ", HookStatus.report()).contains("link offered"));
        offer.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(ClipboardLink.shownDialog());

        // Declined, the same link is never offered again, nor the same video in another link.
        copy("https://www.facebook.com/reel/31415926535/");
        assertNull("offered twice", resume());
        copy("https://m.facebook.com/reel/31415926535?s=1");
        assertNull("the same reel offered twice", resume());
        copy("https://www.facebook.com/reel/27182818284/");
        assertNotNull("a new link wasn't offered", resume());
    }

    @Test
    public void offWithoutTheMenuItemOrPausedTheClipboardIsNeverRead() {
        copy("https://www.facebook.com/reel/16180339887/");
        int before = ClipboardLink.READS.get();

        Settings.CLIPBOARD_DOWNLOAD.save(false);
        assertNull(resume());
        assertNull("a wait was set with the switch off", ClipboardLink.focusWait());
        Settings.CLIPBOARD_DOWNLOAD.save(true);
        Settings.DOWNLOAD_VIDEOS.save(false);
        assertNull(resume());
        Settings.DOWNLOAD_VIDEOS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull(resume());
        assertEquals("the clipboard was read", before, ClipboardLink.READS.get());

        PauseForTests.resume();
        assertNotNull("the control: running, it's offered", resume());
    }

    @Test
    public void aPausedScreenNeverReadsTheClipboard() {
        copy("https://www.facebook.com/reel/14142135623/");
        int before = ClipboardLink.READS.get();
        ClipboardLink.onResumed(activity);
        ClipboardLink.FocusWait wait = ClipboardLink.focusWait();
        ClipboardLink.onPaused(activity);
        assertNull("the wait outlived the pause", ClipboardLink.focusWait());
        // Focus that comes after the pause finds the wait cancelled.
        if (wait != null) {
            wait.onWindowFocusChanged(true);
            assertEquals("read after the screen paused", before, ClipboardLink.READS.get());
        }
    }

    @Test
    public void downloadOpensTheVideoAndSavesItOnceItsPlayerIsRecorded() {
        String id = "17320508075";
        ClipboardLink.Found found = ClipboardLink.find("https://www.facebook.com/reel/" + id);
        Context application = RuntimeEnvironment.getApplication();
        ClipboardLink.download(application, new WeakReference<>(activity), found);

        ShadowActivity screen = Shadows.shadowOf(activity);
        Intent opened = screen.getNextStartedActivity();
        assertNotNull("the video didn't open", opened);
        assertEquals(ClipboardLink.URI_HANDLER, opened.getComponent().getClassName());
        assertEquals("https://www.facebook.com/reel/" + id, String.valueOf(opened.getData()));
        assertEquals(id, ClipboardLink.waitingFor());

        // Another video's player changes nothing; this one's starts the save.
        PlayerSources.rememberVideo(new Params("17320508999"), "videoId", "hd", "manifest");
        assertEquals(id, ClipboardLink.waitingFor());
        PlayerSources.rememberVideo(new Params(id), "videoId", "hd", "manifest");
        assertNull(ClipboardLink.waitingFor());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1, saved.size());
        assertEquals(id, saved.get(0).videoId);

        // A video whose player is recorded already saves straight away, opening nothing.
        ClipboardLink.download(application, new WeakReference<>(activity), found);
        assertNull("opened a video it could save", screen.getNextStartedActivity());
        assertEquals(2, saved.size());
    }

    @Test
    public void sendingLinksSendsTheCopiedVideosOwnLink() {
        Settings.DOWNLOAD_ACTION.save(SendLink.Action.SEND);
        ClipboardLink.Found found = ClipboardLink.find("https://m.facebook.com/watch/?v=26457513110&ref=share");
        ClipboardLink.download(RuntimeEnvironment.getApplication(), new WeakReference<>(activity), found);
        Intent chooser = Shadows.shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
        assertNotNull("nothing was sent", chooser);
        Intent send = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
        assertEquals("https://www.facebook.com/watch/?v=26457513110", send.getStringExtra(Intent.EXTRA_TEXT));
        assertTrue(saved.isEmpty());
    }
}
