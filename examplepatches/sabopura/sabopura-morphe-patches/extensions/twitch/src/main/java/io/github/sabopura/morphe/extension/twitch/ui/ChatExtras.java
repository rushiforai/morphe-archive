package io.github.sabopura.morphe.extension.twitch.ui;

import java.util.List;
import java.util.function.IntFunction;

import io.github.sabopura.morphe.extension.twitch.chat.ChatLineHooks;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Settings of the adopted chat patches. */
final class ChatExtras {
    private static final IntFunction<String> PERCENT = value -> value + " %";

    private ChatExtras() {
    }

    static void addTo(List<Catalog.Category> categories) {
        addChat(Catalog.find(categories, "chat"));
        addEmotes(Catalog.find(categories, "emotes"));
        addFilters(Catalog.find(categories, "filters"));
        addHide(Catalog.find(categories, "hide"));
    }

    private static void addChat(Catalog.Category c) {
        c.group(label("エモートと行の大きさ", "Emote, badge and line sizes")).needs(Feature.CHAT_APPEARANCE)
                .note(label("すでに表示された行は、次に描き直したときに反映します。", "Rows already on screen change when they are next drawn."))
                .add(percent("emote_percent", label("エモートの大きさ", "Emote size"), 50, 200))
                .add(percent("badge_percent", label("バッジの大きさ", "Badge size"), 50, 200))
                .add(percent("spacing_percent", label("行間", "Line spacing"), 25, 300));
        c.group(label("コンパクト表示", "Compact chat")).needs(Feature.COMPACT_CHAT)
                .add(new Catalog.SwitchItem("compact_badges", label("バッジを出さない", "Hide badges"), false)
                        .summary(label("Twitch のバッジと追加バッジを行に表示しません", "Leaves Twitch and third-party badges out of chat lines"))
                        .dependsOn("enabled"))
                .add(new Catalog.SwitchItem("compact_emotes", label("エモートを文字で表示", "Show emotes as text"), false)
                        .summary(label("エモートの画像を読み込まず、名前の文字で表示します", "Shows emote names instead and loads no images"))
                        .dependsOn("enabled"));
        c.group(label("初めての発言", "First-time chatters")).needs(Feature.FIRST_TIME_CHATTERS)
                .add(new Catalog.SwitchItem("first_chatters", label("チャンネルで初めての発言を色分け", "Highlight first messages in a channel"), false)
                        .summary(label("Twitch のチャットサーバーが付ける印 (first-msg) で判定します", "Uses the first-msg tag Twitch's chat server adds"))
                        .dependsOn("enabled"));
        if (ChatLineHooks.deletedMessagesPatched()) addDeleted(c);
    }

    private static void addDeleted(Catalog.Category c) {
        c.group(label("削除されたメッセージ", "Deleted messages"))
                .add(new Catalog.ChoiceItem("deleted_style", label("表示方法", "Display"),
                        new String[]{label("タップで表示（スポイラー）", "Tap to reveal (spoiler)"), label("取り消し線で表示", "Strikethrough")},
                        new String[]{"spoiler", "strikethrough"}, "spoiler"))
                .add(new Catalog.SwitchItem("ignore_clear_chat", label("チャットの全消去を無視", "Ignore chat clears"), false)
                        .summary(label("モデレーターがチャットを全消去しても、表示中のメッセージを残します。タイムアウトと BAN は反映します。Twitch の接続を開き直すと反映します",
                                "Keeps messages when a moderator clears the whole chat. Timeouts and bans still apply. Applies after chat reconnects")));
    }

    private static void addEmotes(Catalog.Category c) {
        c.group(label("タップで情報", "Tap for details")).needs(Feature.EMOTE_PREVIEW)
                .add(new Catalog.SwitchItem("emote_preview", label("エモートやバッジをタップして詳細を表示", "Tap an emote or badge for details"), false)
                        .summary(label("大きな画像・名前・提供元・名前のコピーを表示します。7TV・BTTV・FFZ と追加バッジが対象です",
                                "Shows a larger image, its name and source, and Copy name. Works for 7TV, BTTV, FFZ and third-party badges"))
                        .dependsOn("enabled"));
    }

    private static void addFilters(Catalog.Category c) {
        c.group(label("自分宛て", "Mentions")).needs(Feature.CHAT_FILTERS)
                .add(new Catalog.SwitchItem("highlight_mentions", label("自分のログイン名を含むメッセージをハイライト", "Highlight messages that mention you"), false)
                        .summary(label("ログインしているユーザー名が入ったメッセージを、ハイライトの色で表示します",
                                "Uses the highlight colour for messages containing your login name"))
                        .dependsOn("enabled"));
    }

    private static void addHide(Catalog.Category c) {
        c.group(label("チャットの上の通知", "Above chat")).needs(Feature.CHAT_HIDE_HIGHLIGHTS)
                .note(label("オフに戻すと元の表示に戻ります。", "Turning an item off restores it."))
                .add(new Catalog.SwitchItem("hide_gift_banners", label("ギフトのバナーを隠す", "Hide gift banners"), false))
                .add(new Catalog.SwitchItem("hide_gift_leaderboards", label("Bits とギフトのランキングを隠す", "Hide Bits and gift leaderboards"), false)
                        .summary(label("次に開く配信から反映します", "Applies to the next stream")))
                .add(new Catalog.SwitchItem("hide_watch_streaks", label("ウォッチストリークの通知を隠す", "Hide watch-streak pop-ups"), false));
    }

    private static Catalog.Item percent(String key, String title, int min, int max) {
        return new Catalog.SliderItem(key, title, min, max, 100, PERCENT).dependsOn("enabled");
    }
}
