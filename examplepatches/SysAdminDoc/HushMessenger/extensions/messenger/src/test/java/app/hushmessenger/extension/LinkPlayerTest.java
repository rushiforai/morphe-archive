package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.view.View;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class LinkPlayerTest {
    private Activity activity;
    private int emptied;
    private final LinkPlayerSheet.Jar realJar = LinkPlayerSheet.cookies;

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        emptied = 0;
        LinkPlayerSheet.cookies = () -> emptied++;
    }

    @After public void restore() {
        LinkPlayerSheet showing = LinkPlayerSheet.showing;
        if (showing != null) showing.close();
        LinkPlayerSheet.cookies = realJar;
    }

    private static void on(boolean play) {
        Settings.preferences.edit().putBoolean(LinkPlayer.KEY, play).commit();
    }

    private static LinkPlayer.Embed embed(String link) {
        return LinkPlayer.embedFor(Uri.parse(link));
    }

    // ---- which links are a video page ----

    @Test public void everyShapeOfAYouTubeVideoLinkIsOne() {
        String[] links = {
            "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
            "https://m.youtube.com/watch?v=dQw4w9WgXcQ&t=30s",
            "https://youtu.be/dQw4w9WgXcQ",
            "https://youtu.be/dQw4w9WgXcQ?si=abc",
            "https://www.youtube.com/shorts/dQw4w9WgXcQ",
            "https://www.youtube.com/live/dQw4w9WgXcQ",
            "https://music.youtube.com/watch?v=dQw4w9WgXcQ",
        };
        for (String link : links) {
            LinkPlayer.Embed found = embed(link);
            assertNotNull(link, found);
            assertEquals(link, LinkPlayer.YOUTUBE, found.platform);
            assertTrue(link, found.page.startsWith(LinkPlayer.YOUTUBE_HOST + "/embed/dQw4w9WgXcQ?"));
            assertTrue(link, found.fallbackPage.startsWith(LinkPlayer.YOUTUBE_FALLBACK_HOST + "/embed/dQw4w9WgXcQ?"));
            assertTrue(link, found.ownControls);
        }
    }

    @Test public void theOtherThreePlatformsGetTheirOwnEmbed() {
        LinkPlayer.Embed tiktok = embed("https://www.tiktok.com/@someone/video/7312345678901234567");
        assertEquals(LinkPlayer.TIKTOK, tiktok.platform);
        assertEquals("https://www.tiktok.com/embed/v2/7312345678901234567", tiktok.page);
        assertFalse(tiktok.ownControls);
        assertNull("Only YouTube has a second host to try", tiktok.fallbackPage);

        assertEquals("https://www.instagram.com/reel/Cx1y2z3A4b5/embed/", embed("https://www.instagram.com/reel/Cx1y2z3A4b5/").page);
        assertEquals("https://www.instagram.com/reel/Cx1y2z3A4b5/embed/", embed("https://www.instagram.com/reels/Cx1y2z3A4b5/").page);
        assertEquals("https://www.instagram.com/p/Cx1y2z3A4b5/embed/", embed("https://instagram.com/p/Cx1y2z3A4b5/?igsh=xyz").page);
        assertEquals(LinkPlayer.INSTAGRAM, embed("https://www.instagram.com/tv/Cx1y2z3A4b5/").platform);

        LinkPlayer.Embed watch = embed("https://www.facebook.com/watch?v=1234567890");
        assertEquals(LinkPlayer.FACEBOOK, watch.platform);
        assertTrue(watch.page.startsWith("https://www.facebook.com/plugins/video.php?href="));
        assertTrue(watch.page.endsWith("&show_text=false&autoplay=true"));
        assertNotNull(embed("https://www.facebook.com/reel/1234567890"));
        assertNotNull(embed("https://www.facebook.com/somepage/videos/1234567890"));
        assertNotNull(embed("https://www.facebook.com/share/v/aBcDeFg123/"));
    }

    @Test public void aLinkThatIsNotAVideoPageIsLeftAlone() {
        String[] links = {
            // The same hosts, on a page that isn't one video.
            "https://www.youtube.com/@someone",
            "https://www.youtube.com/playlist?list=PLabcdefghijklmnop",
            "https://www.youtube.com/watch?v=tooshort",
            "https://www.tiktok.com/@someone",
            "https://www.instagram.com/someone/",
            "https://www.instagram.com/stories/someone/1234567890/",
            "https://www.facebook.com/someone",
            "https://www.facebook.com/stories/1234567890/",
            // The shortened ones, which only the server can resolve.
            "https://vm.tiktok.com/ZMabc123/",
            "https://vt.tiktok.com/ZSabc123/",
            "https://fb.watch/aBcDeFg123/",
            // Somewhere else entirely, and a link that isn't the web at all.
            "https://example.com/watch?v=dQw4w9WgXcQ",
            "https://notyoutube.com/watch?v=dQw4w9WgXcQ",
            "mailto:someone@example.com",
            "fb-messenger://user/1234",
        };
        for (String link : links) assertNull(link, embed(link));
        assertNull(LinkPlayer.embedFor(null));
    }

    @Test public void aHostIsReadWithoutThePartThatOnlySaysWhichSizeOfTheSiteItIs() {
        assertEquals("youtube.com", LinkPlayer.host(Uri.parse("https://M.YouTube.com/watch?v=dQw4w9WgXcQ")));
        assertEquals("youtube.com", LinkPlayer.host(Uri.parse("https://web.youtube.com/")));
        assertEquals("", LinkPlayer.host(Uri.parse("mailto:someone@example.com")));
    }

    // ---- the switch in front of it ----

    @Test public void theSwitchOffLeavesEveryLinkToMessenger() {
        on(false);
        assertFalse(Settings.playVideoLink(activity, Uri.parse("https://youtu.be/dQw4w9WgXcQ")));
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void pausedOrInSafeModeNoLinkIsTaken() {
        on(true);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.playVideoLink(activity, Uri.parse("https://youtu.be/dQw4w9WgXcQ")));
        Settings.preferences.edit().putBoolean("paused", false).putBoolean("safe_mode", true).commit();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        assertTrue(CrashGuard.isSafeMode());
        assertFalse(Settings.playVideoLink(activity, Uri.parse("https://youtu.be/dQw4w9WgXcQ")));
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void withTheSwitchOnOnlyAVideoPageIsTaken() {
        on(true);
        assertFalse(Settings.playVideoLink(activity, Uri.parse("https://example.com/")));
        assertNull(LinkPlayerSheet.showing);
        assertTrue(Settings.playVideoLink(activity, Uri.parse("https://youtu.be/dQw4w9WgXcQ")));
        assertNotNull(LinkPlayerSheet.showing);
    }

    @Test public void withNoScreenToHangAWindowOnTheLinkFallsThrough() {
        on(true);
        assertFalse(Settings.playVideoLink(null, Uri.parse("https://youtu.be/dQw4w9WgXcQ")));
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void offTheMainThreadTheLinkFallsThrough() throws Exception {
        on(true);
        AtomicBoolean played = new AtomicBoolean(true);
        Thread other = new Thread(() -> played.set(Settings.playVideoLink(activity, Uri.parse("https://youtu.be/dQw4w9WgXcQ"))));
        other.start();
        other.join();
        assertFalse(played.get());
        assertNull(LinkPlayerSheet.showing);
    }

    // ---- the window itself ----

    private LinkPlayerSheet open(String link) {
        on(true);
        assertTrue(Settings.playVideoLink(activity, Uri.parse(link)));
        LinkPlayerSheet sheet = LinkPlayerSheet.showing;
        assertNotNull(sheet);
        return sheet;
    }

    @Test public void theJarIsEmptiedWhenTheWindowOpensAndAgainWhenItCloses() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        assertEquals(1, emptied);
        sheet.close();
        assertEquals(2, emptied);
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void theFrameKeepsNothingAndTalksToNoOneButTheEmbed() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        android.webkit.WebSettings settings = sheet.frame.getSettings();
        assertFalse(settings.getDomStorageEnabled());
        assertFalse(settings.getAllowFileAccess());
        assertFalse(settings.getAllowContentAccess());
        assertEquals(android.webkit.WebSettings.LOAD_NO_CACHE, settings.getCacheMode());
        assertTrue("The embeds are scripts", settings.getJavaScriptEnabled());
    }

    @Test public void theButtonsFadeWhileItPlaysAndStayUpWhenItDoesNot() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        sheet.onStatus("\"" + LinkPlayerSheet.PLAYING + "\\u0001Never Gonna Give You Up\"");
        assertEquals(LinkPlayerSheet.PLAYING, sheet.state);
        assertTrue("Playing, the buttons get out of the way", sheet.fadeWaiting);
        assertEquals("Never Gonna Give You Up", sheet.videoTitle);
        assertEquals("Never Gonna Give You Up", sheet.title.getText().toString());

        sheet.onStatus("\"" + LinkPlayerSheet.PAUSED + "\\u0001Never Gonna Give You Up\"");
        assertFalse("Paused, the buttons are the point", sheet.fadeWaiting);
        assertEquals(View.VISIBLE, sheet.buttons.getVisibility());

        sheet.onStatus("\"" + LinkPlayerSheet.ENDED + "\\u0001Never Gonna Give You Up\"");
        assertFalse("Finished, Play again stays on screen", sheet.fadeWaiting);
    }

    @Test public void anAnswerTheFrameCouldNotGiveChangesNothing() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        int before = sheet.state;
        for (String answer : new String[] {null, "null", "\"\"", "\"not a state\"", "\"\\u0001a title\""}) {
            sheet.onStatus(answer);
            assertEquals(String.valueOf(answer), before, sheet.state);
        }
    }

    @Test public void fullScreenDoesNotStartTheVideoOver() {
        LinkPlayerSheet sheet = open("https://www.tiktok.com/@someone/video/7312345678901234567");
        assertEquals(1, sheet.loads);
        sheet.setFullScreen(true);
        assertTrue(sheet.fullScreen);
        assertEquals("The page stays put", 1, sheet.loads);
        assertEquals(View.GONE, sheet.title.getVisibility());
        sheet.setFullScreen(false);
        assertFalse(sheet.fullScreen);
        assertEquals(1, sheet.loads);
        assertEquals(View.VISIBLE, sheet.title.getVisibility());
    }

    @Test public void aFrameThatWontLoadTriesTheOtherHostOnceThenHandsTheLinkOn() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        sheet.loadFailed();
        assertTrue("The privacy host can be blocked on the phone itself", sheet.onFallback);
        assertEquals(2, sheet.loads);
        assertNotNull(LinkPlayerSheet.showing);
        sheet.loadFailed();
        assertNull("A second failure gives the link back rather than leaving a blank window", LinkPlayerSheet.showing);
    }

    @Test public void aPlatformWithNoSecondHostHandsTheLinkOnAtOnce() {
        LinkPlayerSheet sheet = open("https://www.instagram.com/reel/Cx1y2z3A4b5/");
        sheet.loadFailed();
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void asecondTapReplacesTheWindowRatherThanStackingOne() {
        LinkPlayerSheet first = open("https://youtu.be/dQw4w9WgXcQ");
        LinkPlayerSheet second = open("https://www.tiktok.com/@someone/video/7312345678901234567");
        assertNotSame(first, second);
        assertTrue(first.closed);
        assertSame(second, LinkPlayerSheet.showing);
    }

    @Test public void whatThePlayerLoadsForItselfIsNotATapGoingSomewhere() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        assertTrue(sheet.onEmbedHost(Uri.parse("https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ")));
        assertFalse(sheet.onEmbedHost(Uri.parse("https://www.youtube.com/watch?v=dQw4w9WgXcQ")));
        assertFalse(sheet.onEmbedHost(Uri.parse("https://example.com/")));
        // Once the privacy host has failed, the ordinary one is the player and the privacy one is somewhere else.
        sheet.loadFailed();
        assertTrue(sheet.onEmbedHost(Uri.parse("https://www.youtube.com/embed/dQw4w9WgXcQ")));
    }

    @Test public void theYouTubeWrapperDrivesTheEmbedWithoutLoadingAnyoneElsesScript() {
        String page = LinkPlayerSheet.youtubeDocument(embed("https://youtu.be/dQw4w9WgXcQ").page);
        assertFalse("No script of YouTube's is fetched", page.contains("iframe_api"));
        assertTrue(page.contains("postMessage"));
        assertTrue(page.contains("hushStatus"));
        assertTrue(page.contains("playVideo"));
        assertTrue(page.contains("pauseVideo"));
    }
}
