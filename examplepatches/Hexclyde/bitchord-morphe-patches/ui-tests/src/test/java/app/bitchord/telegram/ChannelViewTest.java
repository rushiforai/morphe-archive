package app.bitchord.telegram;

import static org.junit.Assert.*;

import android.graphics.*;
import android.view.*;
import android.widget.*;

import org.drinkless.tdlib.TdApi;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.*;

import java.util.*;
import java.util.concurrent.TimeUnit;

/** Channel View tests with synthetic TDLib replies. */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 35, qualifiers = "w393dp-h852dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ChannelViewTest {
    ActivityController<TelegramActivity> controller;
    TelegramActivity activity;
    TelegramBridge bridge;
    int fetches, views, clicks, opened, closed, reports;
    List<Long> viewed = new ArrayList<>();
    TdApi.SponsoredMessage sponsor;
    TdApi.SponsoredMessages ads;

    @Before
    public void start() throws Exception {
        Shadows.shadowOf(RuntimeEnvironment.getApplication())
                .grantPermissions("android.permission.HIDE_OVERLAY_WINDOWS");
        TelegramBridge.instance = null;
        controller = Robolectric.buildActivity(TelegramActivity.class).setup().visible();
        activity = controller.get();
        bridge = activity.bridge;
        bridge.auth = new TdApi.AuthorizationStateReady();
        bridge.selected.add(-100L);
        sponsor = new TdApi.SponsoredMessage();
        sponsor.messageId = 99;
        sponsor.title = "Synthetic sponsor";
        sponsor.buttonText = "Open sponsor";
        sponsor.canBeReported = true;
        sponsor.additionalInfo = "Test additional information";
        sponsor.sponsor = new TdApi.AdvertisementSponsor();
        sponsor.sponsor.url = "https://example.com/test";
        sponsor.sponsor.info = "Synthetic disclosure";
        TdApi.MessageText copy = new TdApi.MessageText();
        copy.text = new TdApi.FormattedText("Synthetic sponsored copy", new TdApi.TextEntity[0]);
        sponsor.content = copy;
        ads = new TdApi.SponsoredMessages(new TdApi.SponsoredMessage[] {sponsor}, 0);
        bridge.backend =
                request -> {
                    if (request instanceof TdApi.GetChat) {
                        TdApi.Chat c = new TdApi.Chat();
                        c.id = -100;
                        c.title = "Studio Notes (test)";
                        c.type = new TdApi.ChatTypeSupergroup(1, true);
                        return c;
                    }
                    if (request instanceof TdApi.OpenChat) {
                        opened++;
                        return new TdApi.Ok();
                    }
                    if (request instanceof TdApi.CloseChat) {
                        closed++;
                        return new TdApi.Ok();
                    }
                    if (request instanceof TdApi.GetChatHistory) {
                        TdApi.Message m = new TdApi.Message();
                        m.id = 1;
                        m.chatId = -100;
                        m.canBeSaved = true;
                        m.date = 1700000000;
                        TdApi.MessageText text = new TdApi.MessageText();
                        text.text =
                                new TdApi.FormattedText(
                                        "Original recording notes", new TdApi.TextEntity[0]);
                        m.content = text;
                        return new TdApi.Messages(1, new TdApi.Message[] {m});
                    }
                    if (request instanceof TdApi.GetChatSponsoredMessages) {
                        fetches++;
                        return ads;
                    }
                    if (request instanceof TdApi.ViewMessages) {
                        TdApi.ViewMessages v = (TdApi.ViewMessages) request;
                        assertFalse(v.forceRead);
                        for (long id : v.messageIds) viewed.add(id);
                        views++;
                        return new TdApi.Ok();
                    }
                    if (request instanceof TdApi.ClickChatSponsoredMessage) {
                        clicks++;
                        return new TdApi.Ok();
                    }
                    if (request instanceof TdApi.ReportChatSponsoredMessage) {
                        reports++;
                        return new TdApi.ReportSponsoredResultPremiumRequired();
                    }
                    throw new AssertionError(request.getClass());
                };
    }

    @After
    public void stop() {
        if (activity != null) {
            activity.handler.removeCallbacksAndMessages(null);
            controller.pause().stop().destroy();
            bridge.work.shutdownNow();
            TelegramBridge.instance = null;
        }
    }

    void drain() throws Exception {
        for (int i = 0; i < 5; i++) {
            bridge.work.submit(() -> {}).get(10, TimeUnit.SECONDS);
            Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        }
    }

    ChannelView open() throws Exception {
        activity.reopenChannel(-100);
        drain();
        assertNotNull(activity.channelView);
        return activity.channelView;
    }

    TextView text(View view, String value) {
        if (view instanceof TextView && ((TextView) view).getText().toString().equals(value))
            return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = text(group.getChildAt(i), value);
                if (found != null) return found;
            }
        }
        return null;
    }

    void draw() {
        View root = activity.getWindow().getDecorView();
        root.measure(
                View.MeasureSpec.makeMeasureSpec(393, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(852, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 393, 852);
        root.draw(new Canvas(Bitmap.createBitmap(393, 852, Bitmap.Config.ARGB_8888)));
    }

    @Test
    public void fetchRendersOfficialCardWithoutInventingViewsOrClicks() throws Exception {
        ChannelView view = open();
        assertEquals(1, fetches);
        assertEquals(0, views);
        assertEquals(0, clicks);
        assertNotNull(text(view, "Sponsored"));
        assertNotNull(text(view, "Synthetic sponsor"));
        assertNotNull(text(view, "Synthetic sponsored copy"));
        assertNotNull(text(view, "Test additional information"));
        assertNotNull(text(view, "Open sponsor"));
        view.loadSponsors();
        drain();
        assertEquals("cached fetch reused", 1, fetches);
        assertEquals(0, views);
        assertEquals(0, clicks);
        view.sponsorMenu(sponsor);
        android.app.AlertDialog dialog =
                org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(dialog);
        assertTrue(
                (dialog.getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE)
                        != 0);
        dialog.dismiss();
        view.report(sponsor, new byte[0]);
        drain();
        assertEquals(1, reports);
        assertNotNull(
                "Premium-required keeps sponsor visible", text(view, "Synthetic sponsored copy"));
        org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog().dismiss();
    }

    @Test
    public void channelAsPlaylistOrDownload() throws Exception {
        activity.chooseCollection();
        drain();
        android.app.AlertDialog chats =
                org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        assertEquals("Playlists and downloads", Shadows.shadowOf(chats).getTitle().toString());
        Shadows.shadowOf(chats).clickOnItem(0);
        drain();
        android.app.AlertDialog actions =
                org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        assertEquals(
                "Save as playlist (newest 1,000 of 223,776 songs)",
                actions.getListView().getAdapter().getItem(0).toString());
        assertEquals(
                "Download all (newest 1,000 of 223,776 songs, 31.4 GB)",
                actions.getListView().getAdapter().getItem(1).toString());
        assertTrue(
                (actions.getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE)
                        != 0);
        Shadows.shadowOf(actions).clickOnItem(0);
        drain();
        String title = Shadows.shadowOf(actions).getTitle().toString();
        assertEquals(java.util.List.of("playlist " + title), bridge.collections);

        activity.chooseCollection();
        drain();
        Shadows.shadowOf(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog())
                .clickOnItem(0);
        drain();
        Shadows.shadowOf(org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog())
                .clickOnItem(1);
        android.app.AlertDialog confirm =
                org.robolectric.shadows.ShadowAlertDialog.getLatestAlertDialog();
        assertEquals(1, bridge.collections.size());
        assertTrue(
                Shadows.shadowOf(confirm)
                        .getMessage()
                        .toString()
                        .startsWith("Newest 1,000 of 223,776 songs from "));
        confirm.getButton(android.app.AlertDialog.BUTTON_POSITIVE).performClick();
        drain();
        assertEquals("download " + title, bridge.collections.get(1));
    }

    @Test
    public void impressionsRequireForegroundFocusDrawAndFullText() throws Exception {
        ChannelView view = open();
        controller.windowFocusChanged(true);
        draw();
        activity.scroll.fullScroll(View.FOCUS_DOWN);
        draw();
        view.drawn = false;
        view.checkVisible();
        drain();
        assertFalse(viewed.contains(99L));
        view.drawn = true;
        view.foreground = false;
        view.checkVisible();
        drain();
        assertFalse(viewed.contains(99L));
        view.foreground = true;
        controller.windowFocusChanged(false);
        view.checkVisible();
        drain();
        assertFalse(viewed.contains(99L));
        controller.windowFocusChanged(true);
        view.checkVisible();
        drain();
        assertTrue("whole visible sponsored copy acknowledged", viewed.contains(99L));
        int before = views;
        view.checkVisible();
        drain();
        assertEquals("acknowledged view not repeated", before, views);
    }

    @Test
    public void channelNavigationAndAccountChangeStopOldView() throws Exception {
        ChannelView view = open();
        assertTrue(opened > 0);
        controller.pause();
        assertFalse(view.foreground);
        assertTrue(closed > 0);
        view.checkVisible();
        drain();
        assertEquals(0, views);
        controller.resume();
        drain();
        assertTrue(view.foreground);
        bridge.generation++;
        assertFalse(view.valid());
        view.checkVisible();
        drain();
        assertEquals(0, views);
        activity.onBackPressed();
        assertNull(activity.channelView);
        assertEquals(0, activity.channelId);
    }

    @Test
    public void recommendedAndServerEmptyResponsesArePreserved() throws Exception {
        sponsor.isRecommended = true;
        ChannelView view = open();
        assertNotNull(text(view, "Recommended"));
        assertNull(text(view, "Sponsored"));
        ads = new TdApi.SponsoredMessages(new TdApi.SponsoredMessage[0], 0);
        bridge.sponsorship.clear(++bridge.generation);
        activity.reopenChannel(-100);
        drain();
        assertNotNull(
                text(
                        activity.channelView,
                        "Telegram returned no sponsored messages for this view."));
        assertEquals(0, views);
        assertEquals(0, clicks);
    }

    @Test
    public void protectionOrDeletionUpdatesDiscardStaleChannelContents() throws Exception {
        ChannelView view = open();
        assertNotNull(text(view, "Original recording notes"));
        bridge.mediaRevision++;
        view.checkVisible();
        drain();
        assertNull(text(view, "Original recording notes"));
        assertNull(text(view, "Synthetic sponsored copy"));
        assertNotNull(
                text(
                        view,
                        "Channel content or permissions changed. Reopen to refresh before"
                                + " reading."));
        assertFalse(view.foreground);
        assertEquals(0, views);
    }
}
