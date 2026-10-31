package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;

import java.io.IOException;
import java.util.*;

/** Lifecycle and media permission tests using synthetic data. */
public final class PolicyTest {
    static int checks;

    static void check(boolean value, String why) {
        checks++;
        if (!value) throw new AssertionError(why);
    }

    interface Task {
        void run() throws Exception;
    }

    static void denied(Task task, String why) throws Exception {
        try {
            task.run();
            throw new AssertionError(why);
        } catch (IOException expected) {
            checks++;
        }
    }

    static final class Fake implements ChannelSponsorship.Gateway, ChannelSponsorship.Clock {
        long now = 100;
        int fetches, views, clicks, reports;
        boolean failView;
        TdApi.SponsoredMessages response =
                new TdApi.SponsoredMessages(new TdApi.SponsoredMessage[] {ad(0)}, 0);
        TdApi.ReportSponsoredResult result = new TdApi.ReportSponsoredResultOk();
        TdApi.ClickChatSponsoredMessage click;
        byte[] option;

        public long millis() {
            return now;
        }

        public TdApi.Object call(TdApi.Function<?> request) {
            if (request instanceof TdApi.GetChatSponsoredMessages) {
                fetches++;
                return response;
            }
            if (request instanceof TdApi.ViewMessages) {
                TdApi.ViewMessages view = (TdApi.ViewMessages) request;
                check(
                        !view.forceRead && view.source instanceof TdApi.MessageSourceChatHistory,
                        "official sponsor view uses history without force-read");
                views++;
                return failView ? new TdApi.Error(500, "synthetic error") : new TdApi.Ok();
            }
            if (request instanceof TdApi.ClickChatSponsoredMessage) {
                clicks++;
                click = (TdApi.ClickChatSponsoredMessage) request;
                return new TdApi.Ok();
            }
            if (request instanceof TdApi.ReportChatSponsoredMessage) {
                reports++;
                option = ((TdApi.ReportChatSponsoredMessage) request).optionId;
                return result;
            }
            throw new AssertionError(request.getClass());
        }
    }

    static TdApi.SponsoredMessage ad(long id) {
        TdApi.SponsoredMessage a = new TdApi.SponsoredMessage();
        a.messageId = id;
        a.title = "Synthetic sponsor";
        a.buttonText = "Open";
        a.canBeReported = true;
        a.sponsor = new TdApi.AdvertisementSponsor();
        a.sponsor.url = "https://example.com/";
        TdApi.MessageText text = new TdApi.MessageText();
        text.text = new TdApi.FormattedText("Test copy", new TdApi.TextEntity[0]);
        a.content = text;
        return a;
    }

    static TdApi.File file(int id) {
        TdApi.File f = new TdApi.File();
        f.id = id;
        return f;
    }

    public static void main(String[] args) throws Exception {
        Fake f = new Fake();
        ChannelSponsorship policy = new ChannelSponsorship(f, f);
        ChannelSponsorship.Snapshot a = policy.load(10, 1);
        check(a.messages().get(0).messageId == 0, "zero is a valid server sponsor id");
        check(
                f.fetches == 1 && f.views == 0 && f.clicks == 0,
                "fetch never fabricates an impression or click");
        check(policy.load(10, 1) == a && f.fetches == 1, "same channel uses cached result");
        policy.viewed(a, 0);
        policy.viewed(a, 0);
        check(f.views == 1, "only one acknowledged impression per result");
        policy.clicked(a, 0, true, false);
        check(f.click.isMediaClick && !f.click.fromFullscreen, "media click flags");
        policy.clicked(a, 0, false, true);
        check(!f.click.isMediaClick && f.click.fromFullscreen, "fullscreen button flags");
        policy.clicked(a, 0, true, true);
        check(f.click.isMediaClick && f.click.fromFullscreen, "fullscreen media flags");
        f.now += ChannelSponsorship.CACHE_MILLIS - 1;
        check(!policy.expired(a, 1) && policy.load(10, 1) == a, "cache lasts five minutes");
        f.now++;
        check(policy.expired(a, 1), "result expires at five minutes");
        denied(() -> policy.viewed(a, 0), "expired view rejected");
        ChannelSponsorship.Snapshot b = policy.load(10, 1);
        check(b != a && f.fetches == 2, "expired channel re-fetched");
        f.failView = true;
        denied(() -> policy.viewed(b, 0), "failed impression not acknowledged");
        f.failView = false;
        policy.viewed(b, 0);
        check(f.views == 3, "failed impression remains retryable");
        policy.clear(2);
        denied(() -> policy.clicked(b, 0, false, false), "old account click rejected");
        check(policy.expired(b, 1), "account change invalidates snapshots");
        f.response = new TdApi.SponsoredMessages(new TdApi.SponsoredMessage[0], 0);
        ChannelSponsorship.Snapshot empty = policy.load(10, 2);
        check(policy.load(10, 2) == empty, "empty results are cached too");
        f.response = new TdApi.SponsoredMessages(new TdApi.SponsoredMessage[] {ad(9), ad(8)}, 3);
        ChannelSponsorship.Snapshot r = policy.load(11, 2);
        check(
                r.messagesBetween == 3 && r.messages().size() == 2,
                "server placement and ordering preserved");
        f.result =
                new TdApi.ReportSponsoredResultOptionRequired(
                        "Select reason",
                        new TdApi.ReportOption[] {
                            new TdApi.ReportOption(new byte[] {7}, "Test option")
                        });
        check(
                policy.report(r, 9, null) == f.result
                        && f.option.length == 0
                        && r.messages().size() == 2,
                "initial report requests server choices with empty option");
        f.result = new TdApi.ReportSponsoredResultPremiumRequired();
        policy.report(r, 9, new byte[] {7});
        check(
                f.option[0] == 7 && r.messages().size() == 2,
                "Premium-required does not hide ads locally");
        f.result = new TdApi.ReportSponsoredResultOk();
        policy.report(r, 9, new byte[] {7});
        check(r.messages().size() == 1, "acknowledged report removes only that message");
        denied(() -> policy.clicked(r, 9, false, false), "removed sponsor cannot be clicked");
        f.result = new TdApi.ReportSponsoredResultAdsHidden();
        policy.report(r, 8, new byte[0]);
        check(policy.expired(r, 2), "server AdsHidden invalidates all cached ads");
        TdApi.SponsoredMessage noReport = ad(2);
        noReport.canBeReported = false;
        f.response = new TdApi.SponsoredMessages(new TdApi.SponsoredMessage[] {noReport}, 0);
        ChannelSponsorship.Snapshot n = policy.load(12, 2);
        denied(() -> policy.report(n, 2, null), "nonreportable sponsor rejected");
        for (String host :
                new String[] {
                    "t.me",
                    "telegram.org",
                    "api.telegram.org",
                    "TELEGRA.PH",
                    "telegra.ph",
                    "fragment.com",
                    "telesco.pe",
                    "graph.org"
                }) check(ChannelSponsorship.telegramHost(host), "official domain " + host);
        for (String host :
                new String[] {
                    "t.me.evil.test",
                    "eviltelegram.org",
                    "telegram.com",
                    "evilfragment.com",
                    "example.com"
                })
            check(!ChannelSponsorship.telegramHost(host), "external confirmation required " + host);
        for (String link :
                new String[] {
                    "javascript:alert(1)",
                    "file:///data/private",
                    "https://user@t.me/test",
                    "intent://test",
                    "https:///missing"
                }) denied(() -> ChannelSponsorship.destination(link), "unsafe URL rejected");
        check(
                ChannelSponsorship.destination("https://example.com/path?q=1")
                        .getHost()
                        .equals("example.com"),
                "safe external URL accepted for UI confirmation");
        check(
                MediaPolicy.wholeView(true, true, true, true, 1, 100, 50, 100, 50),
                "whole drawn text is eligible");
        check(
                !MediaPolicy.wholeView(false, true, true, true, 1, 100, 50, 100, 50),
                "background not visible");
        check(
                !MediaPolicy.wholeView(true, false, true, true, 1, 100, 50, 100, 50),
                "unfocused window not visible");
        check(
                !MediaPolicy.wholeView(true, true, false, true, 1, 100, 50, 100, 50),
                "hidden text not visible");
        check(
                !MediaPolicy.wholeView(true, true, true, false, 1, 100, 50, 100, 50),
                "undrawn text not visible");
        check(
                !MediaPolicy.wholeView(true, true, true, true, .9f, 100, 50, 100, 50),
                "faded text not visible");
        check(
                !MediaPolicy.wholeView(true, true, true, true, 1, 100, 50, 99, 50),
                "horizontally clipped text not visible");
        check(
                !MediaPolicy.wholeView(true, true, true, true, 1, 100, 50, 100, 49),
                "vertically clipped text not visible");
        check(
                !MediaPolicy.wholeView(true, true, true, true, 1, 0, 0, 0, 0),
                "zero-size text not visible");
        TdApi.Message m = TestMessages.audio(10, 20, "Test");
        check(MediaPolicy.savable(m), "ordinary savable audio allowed");
        m.canBeSaved = false;
        check(
                !MediaPolicy.savable(m) && TrackMetadata.from(m) == null,
                "protected audio not exposed to player");
        m.canBeSaved = true;
        m.selfDestructIn = 5;
        check(!MediaPolicy.savable(m), "self-destruct timer rejected");
        m.selfDestructIn = 0;
        m.selfDestructType = new TdApi.MessageSelfDestructTypeImmediately();
        check(!MediaPolicy.savable(m), "view-once audio rejected");
        check(!MediaPolicy.savable(null), "missing message denied");
        TdApi.Chat chat = new TdApi.Chat();
        chat.type = new TdApi.ChatTypeSupergroup(1, true);
        check(MediaPolicy.chatAllowed(chat), "ordinary channel allowed");
        check(MediaPolicy.communityAllowed(chat, false), "channel can be a community channel");
        chat.type = new TdApi.ChatTypeSupergroup(1, false);
        check(MediaPolicy.communityAllowed(chat, false), "group can be a community channel");
        chat.type = new TdApi.ChatTypeBasicGroup(1);
        check(MediaPolicy.communityAllowed(chat, false), "basic group can be a community channel");
        chat.type = new TdApi.ChatTypePrivate(1);
        check(MediaPolicy.chatAllowed(chat), "chat with a person allowed as a music chat");
        check(
                !MediaPolicy.communityAllowed(chat, false),
                "chat with a person isn't a community channel");
        check(MediaPolicy.communityAllowed(chat, true), "bot can be a community channel");
        chat.type = new TdApi.ChatTypeSupergroup(1, true);
        chat.hasProtectedContent = true;
        check(!MediaPolicy.chatAllowed(chat), "protected channel denied");
        chat.hasProtectedContent = false;
        chat.type = new TdApi.ChatTypeSecret();
        check(!MediaPolicy.chatAllowed(chat), "secret chat denied");
        TdApi.Photo photo = new TdApi.Photo();
        TdApi.PhotoSize small = new TdApi.PhotoSize();
        small.width = 10;
        small.height = 10;
        small.photo = file(1);
        TdApi.PhotoSize large = new TdApi.PhotoSize();
        large.width = 100;
        large.height = 100;
        large.photo = file(2);
        photo.sizes = new TdApi.PhotoSize[] {small, large};
        check(ChannelContent.photo(photo).id == 2, "largest sponsor photo selected");
        TdApi.SponsoredMessage media = ad(99);
        TdApi.MessagePhoto content = new TdApi.MessagePhoto();
        content.photo = photo;
        media.content = content;
        media.sponsor.photo = photo;
        check(
                ChannelContent.files(media).size() == 1
                        && ChannelContent.files(media).get(0).id == 2,
                "media and avatar deduplicated by exact file id");
        TdApi.MessageVideo video = new TdApi.MessageVideo();
        video.video = new TdApi.Video();
        video.video.video = file(3);
        check(ChannelContent.media(video).kind.equals("video"), "typed sponsored video supported");
        TdApi.MessageAnimation animation = new TdApi.MessageAnimation();
        animation.animation = new TdApi.Animation();
        animation.animation.animation = file(4);
        animation.animation.mimeType = "video/mp4";
        check(
                ChannelContent.media(animation).kind.equals("animation-video"),
                "MP4 animation supported");
        animation.animation.mimeType = "image/gif";
        check(
                ChannelContent.media(animation).kind.equals("animation-image"),
                "GIF animation supported");
        denied(
                () -> ChannelContent.media(new TdApi.MessageUnsupported()),
                "unknown media produces explicit display failure");
        check(
                "-100_20".equals(PlaybackPolicy.track("src:telegram-native::-100_20")),
                "canonical Telegram playback identity recognized");
        for (String id :
                new String[] {
                    "youtube-id",
                    "src:other::-100_20",
                    "src:telegram-native::0_20",
                    "src:telegram-native::-0100_20",
                    "src:telegram-native::-100_020",
                    "src:telegram-native::-100_0",
                    "src:telegram-native::1_99999999999999999999"
                })
            check(PlaybackPolicy.track(id) == null, "unrelated/malformed player identity ignored");
        System.out.println(
                "PASS: "
                        + checks
                        + " sponsored-message lifecycle, links, visibility and protected-content"
                        + " checks.");
    }
}
