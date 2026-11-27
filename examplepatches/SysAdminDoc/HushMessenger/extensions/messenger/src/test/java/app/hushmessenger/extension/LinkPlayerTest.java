package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import java.time.Duration;
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
import static org.robolectric.Shadows.shadowOf;

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

        // #246: the links Messenger's own preview cards carry, read off a phone. TikTok's number is in base 36 behind
        // an "e", and Instagram puts the account in front of the reel.
        assertEquals("https://www.tiktok.com/embed/v2/6718335390845095173",
            embed("https://www.tiktok.com/@scout2015/video/e1f1jf4uutrchx").page);
        assertEquals("https://www.instagram.com/reel/fA9uwTtkSN/embed/",
            embed("https://www.instagram.com/diegoquinteiro/reel/fA9uwTtkSN/").page);
        assertEquals("https://www.instagram.com/p/Cx1y2z3A4b5/embed/", embed("https://www.instagram.com/someone/p/Cx1y2z3A4b5/").page);

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
            "https://www.instagram.com/someone/reels/",
            "https://www.instagram.com/someone/tagged/Cx1y2z3A4b5/",
            "https://www.tiktok.com/@someone/video/ezzzzzzzzzzzzz",
            "https://www.tiktok.com/@someone/video/e0000",
            "https://www.tiktok.com/@someone/video/eabc",
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

    /** The links a TikTok and an Instagram preview card hand over when tapped (#246). */
    private static final String[] CARD_LINKS = {
        "https://www.tiktok.com/@someone/video/7312345678901234567", "https://www.instagram.com/reel/Cx1y2z3A4b5/"};

    @Test public void theSwitchOffLeavesEveryLinkToMessenger() {
        on(false);
        assertFalse(Settings.playVideoLink(activity, Uri.parse("https://youtu.be/dQw4w9WgXcQ")));
        for (String link : CARD_LINKS) assertFalse(link, Settings.playVideoLink(activity, Uri.parse(link)));
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void aTikTokOrInstagramCardsLinkIsTakenWithTheSwitchOn() {
        for (String link : CARD_LINKS) {
            LinkPlayerSheet sheet = open(link);
            assertSame(link, sheet, LinkPlayerSheet.showing);
        }
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
        assertTrue("#191: Invisible buttons lists its buttons with HushMessenger's own", InvisibleButtons.isOwn(sheet.root));
        assertEquals(1, emptied);
        sheet.close();
        assertEquals(2, emptied);
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void theFrameKeepsNothingAndTalksToNoOneButTheEmbed() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        android.webkit.WebSettings settings = sheet.frame.getSettings();
        // #246: TikTok's embed shows only "Server error" with no page storage. The jar empties it with the cookies.
        assertTrue(settings.getDomStorageEnabled());
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

    private static void idleMs(long ms) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));
    }

    /**
     * Plays until the fade timer fires and hands the fade to the buttons' animator, then stops before its first frame.
     * Robolectric runs a whole fade inside the idle that fires it, so the timer's runnable is run by hand here.
     */
    private LinkPlayerSheet fadeUnderWay() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        sheet.onStatus("\"" + LinkPlayerSheet.PLAYING + "\"");
        idleMs(LinkPlayerSheet.FADE_MS - 1);
        assertTrue("The fade is waiting", sheet.fadeWaiting);
        sheet.fade.run();
        assertFalse("The fade has started", sheet.fadeWaiting);
        assertEquals(1f, sheet.buttons.getAlpha(), 0f);
        return sheet;
    }

    /** #246: a tap while the buttons fade out brings them back for good, so Pause stays in reach. */
    @Test public void aTapWhileTheButtonsFadeBringsThemBackForGood() {
        LinkPlayerSheet sheet = fadeUnderWay();
        sheet.showButtons();
        idleMs(LinkPlayerSheet.FADE_ANIMATION_MS * 2);
        assertEquals("Tapped, the buttons stay up", View.VISIBLE, sheet.buttons.getVisibility());
        assertEquals(1f, sheet.buttons.getAlpha(), 0f);
        assertTrue("And they fade again later", sheet.fadeWaiting);
    }

    /** #246: pausing while the buttons fade out leaves them up. */
    @Test public void pausingWhileTheButtonsFadeLeavesThemUp() {
        LinkPlayerSheet sheet = fadeUnderWay();
        sheet.onStatus("\"" + LinkPlayerSheet.PAUSED + "\"");
        idleMs(LinkPlayerSheet.FADE_MS + LinkPlayerSheet.FADE_ANIMATION_MS * 2);
        assertEquals("Paused, the buttons stay up", View.VISIBLE, sheet.buttons.getVisibility());
        assertEquals(1f, sheet.buttons.getAlpha(), 0f);
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

    /** A failed load the way the frame reports it, through the client the window gave it. */
    private static void fails(LinkPlayerSheet sheet, android.webkit.WebView frame, String url, boolean mainFrame) {
        android.webkit.WebResourceRequest request = new android.webkit.WebResourceRequest() {
            @Override public Uri getUrl() {
                return Uri.parse(url);
            }

            @Override public boolean isForMainFrame() {
                return mainFrame;
            }

            @Override public boolean isRedirect() {
                return false;
            }

            @Override public boolean hasGesture() {
                return false;
            }

            @Override public String getMethod() {
                return "GET";
            }

            @Override public java.util.Map<String, String> getRequestHeaders() {
                return java.util.Collections.emptyMap();
            }
        };
        frame.getWebViewClient().onReceivedError(frame, request, null);
    }

    @Test public void somethingThePageFetchesFailingLeavesTheVideoUp() {
        LinkPlayerSheet sheet = open("https://www.instagram.com/reel/Cx1y2z3A4b5/");
        android.webkit.WebView frame = sheet.frame;
        // #246: Instagram's embed went straight to the browser. Its own logging and stream calls fail now and then.
        fails(sheet, frame, "https://www.instagram.com/api/graphql", false);
        fails(sheet, frame, "https://www.instagram.com/reel/Cx1y2z3A4b5/embed/", false);
        fails(sheet, frame, "https://scontent.cdninstagram.com/v/t50/clip.mp4", false);
        assertSame("Only the page itself failing gives the link back", sheet, LinkPlayerSheet.showing);
        assertFalse(sheet.closed);
        fails(sheet, frame, "https://www.instagram.com/reel/Cx1y2z3A4b5/embed/", true);
        assertNull(LinkPlayerSheet.showing);
    }

    @Test public void onYouTubeOnlyTheEmbedFrameFailingMovesItToTheOtherHost() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        android.webkit.WebView frame = sheet.frame;
        fails(sheet, frame, "https://www.youtube-nocookie.com/embed/establish_zw?x=1", false);
        fails(sheet, frame, "https://www.youtube-nocookie.com/youtubei/v1/log_event?alt=json", false);
        assertFalse("The player's own calls failing isn't the host being blocked", sheet.onFallback);
        assertEquals(1, sheet.loads);
        fails(sheet, frame, "https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ?enablejsapi=1&playsinline=1", false);
        assertTrue(sheet.onFallback);
        assertEquals(2, sheet.loads);
        fails(sheet, frame, "https://www.youtube.com/embed/establish_zw", false);
        fails(sheet, frame, "https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ", false);
        assertSame("Neither a call on the ordinary host nor the old frame going is the new frame failing", sheet,
            LinkPlayerSheet.showing);
        fails(sheet, frame, "https://www.youtube.com/embed/dQw4w9WgXcQ?enablejsapi=1", false);
        assertNull(LinkPlayerSheet.showing);
    }

    private static void idle(long millis) {
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(millis));
    }

    /** A finger down and up on [view], the way the screen sends it. Answers whether the view kept the tap. */
    private static boolean tap(View view) {
        long now = android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent down = android.view.MotionEvent.obtain(now, now, android.view.MotionEvent.ACTION_DOWN, 10, 10, 0);
        android.view.MotionEvent up = android.view.MotionEvent.obtain(now, now + 60, android.view.MotionEvent.ACTION_UP, 10, 10, 0);
        boolean kept = view.dispatchTouchEvent(down);
        kept &= view.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
        return kept;
    }

    @Test public void aTapOnTheVideoBringsTheButtonsBackOnceTheyHaveFaded() {
        LinkPlayerSheet sheet = open("https://youtu.be/dQw4w9WgXcQ");
        sheet.onStatus("\"" + LinkPlayerSheet.PLAYING + "\\u0001Me at the zoo\"");
        idle(LinkPlayerSheet.FADE_MS + LinkPlayerSheet.FADE_ANIMATION_MS + 200);
        assertEquals("Playing, the buttons get out of the way", View.INVISIBLE, sheet.buttons.getVisibility());
        // #246: with them gone the frame took every tap, so nothing could pause the video.
        assertTrue("YouTube plays through Hush's buttons, so its frame doesn't get the tap", tap(sheet.frame));
        assertEquals(View.VISIBLE, sheet.buttons.getVisibility());
        assertEquals(1f, sheet.buttons.getAlpha(), 0f);
    }

    @Test public void overTheOtherEmbedsOnlyHushsOwnButtonsTakeATap() {
        LinkPlayerSheet sheet = open("https://www.tiktok.com/@someone/video/7312345678901234567");
        assertFalse("The rest of the video goes to the embed's own buttons", sheet.buttons.isClickable());
        idle(LinkPlayerSheet.FADE_MS + LinkPlayerSheet.FADE_ANIMATION_MS + 200);
        assertEquals(View.INVISIBLE, sheet.buttons.getVisibility());
        tap(sheet.frame);
        assertEquals("A tap on the video brings Open and full screen back", View.VISIBLE, sheet.buttons.getVisibility());
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
