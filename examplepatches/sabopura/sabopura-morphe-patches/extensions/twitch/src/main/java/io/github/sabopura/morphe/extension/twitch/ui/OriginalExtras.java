package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

import java.util.List;
import java.util.function.IntFunction;

import io.github.sabopura.morphe.extension.twitch.original.ChannelProfiles;
import io.github.sabopura.morphe.extension.twitch.original.ChatTts;
import io.github.sabopura.morphe.extension.twitch.original.HypeMeter;
import io.github.sabopura.morphe.extension.twitch.original.PlayerWatch;
import io.github.sabopura.morphe.extension.twitch.original.QuickPhrases;
import io.github.sabopura.morphe.extension.twitch.original.RaidHold;
import io.github.sabopura.morphe.extension.twitch.original.Stats;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Settings of the patches original to this bundle. */
final class OriginalExtras {
    private OriginalExtras() {
    }

    static void addTo(List<Catalog.Category> categories) {
        addVoice(Catalog.find(categories, "voice"));
        addPlayback(Catalog.find(categories, "playback"));
        addControls(Catalog.find(categories, "controls"));
    }

    /** Lifetime totals, shown on the About page. */
    static Catalog.Group stats(Catalog.Category about) {
        return new Catalog.Group(about, label("このパッチの記録", "What this patch has done")).add(new StatsItem());
    }

    private static void addVoice(Catalog.Category c) {
        c.group(label("チャットの読み上げ", "Read chat aloud")).needs(Feature.CHAT_TTS)
                .note(label("端末の読み上げ機能を使います。通信は発生しません。", "Uses the device's text-to-speech. Nothing is sent anywhere."))
                .add(new TtsSwitch().summary(label("広告を隠している間は読みません", "Stays quiet while an ad is covered")))
                .add(new Catalog.ChoiceItem(ChatTts.KEY_WHEN, label("読み上げるとき", "When to read"),
                        new String[]{label("常に", "Always"), label("アプリが裏にあるときだけ", "Only while the app is in the background")},
                        new String[]{ChatTts.WHEN_ALWAYS, ChatTts.WHEN_BACKGROUND}, ChatTts.WHEN_ALWAYS)
                        .dependsOn(ChatTts.KEY_ENABLED))
                .add(new Catalog.SwitchItem(ChatTts.KEY_NAMES, label("送信者の名前も読む", "Also read the sender's name"), false)
                        .dependsOn(ChatTts.KEY_ENABLED))
                .add(new Catalog.SwitchItem(ChatTts.KEY_EMOTES, label("エモートの名前も読む", "Also read emote names"), false)
                        .summary(label("オフのときは、エモートだけの発言は読みません", "While off, a message of emotes alone is not read"))
                        .dependsOn(ChatTts.KEY_ENABLED))
                .add(new Catalog.ChoiceItem(ChatTts.KEY_LANGUAGE, label("声の言語", "Voice language"),
                        new String[]{label("発言に合わせる（自動）", "Match each message"), label("端末の言語", "Device language"),
                                label("日本語", "Japanese"), label("英語", "English")},
                        new String[]{ChatTts.LANGUAGE_AUTO, ChatTts.LANGUAGE_DEVICE, ChatTts.LANGUAGE_JAPANESE, ChatTts.LANGUAGE_ENGLISH},
                        ChatTts.LANGUAGE_AUTO)
                        .summary(label("自動では、かなや漢字のある発言を日本語の声で、英字の発言を英語の声で読みます。端末に声が入っていない言語は、今の声のまま読みます",
                                "Automatic reads messages with kana or kanji in a Japanese voice. Messages in Latin letters get an English voice when the device's own language is not written in them. A language the device has no voice for is read in the current voice."))
                        .dependsOn(ChatTts.KEY_ENABLED))
                .add(new Catalog.SliderItem(ChatTts.KEY_SPEED, label("速さ", "Speed"), 50, 200, 100, percent())
                        .dependsOn(ChatTts.KEY_ENABLED))
                .add(new Catalog.SliderItem(ChatTts.KEY_PITCH, label("高さ", "Pitch"), 50, 200, 100, percent())
                        .dependsOn(ChatTts.KEY_ENABLED))
                .add(new Catalog.ActionItem(label("声を試す", "Try the voice"), env -> ChatTts.test())
                        .summary(label("今の速さと高さで短い文を読み上げます", "Speaks a short sentence at the current speed and pitch")));
        c.group(label("定型文", "Quick phrases")).needs(Feature.QUICK_PHRASES)
                .note(label("タップすると入力欄に入れます。自動で送信はしません。次にチャットを開くと反映します。",
                        "A tap types into the chat box and never sends. Applies the next time chat opens."))
                .add(new Catalog.SwitchItem(QuickPhrases.KEY_ENABLED, label("定型文の列を表示", "Show the phrase row"), false))
                .add(new PhrasesItem());
    }

    private static void addPlayback(Catalog.Category c) {
        c.group(label("自動で再読み込み", "Automatic reload")).needs(Feature.AUTO_RECOVER)
                .add(new Catalog.SwitchItem(PlayerWatch.KEY_RECOVER, label("固まった再生を読み込み直す", "Reload when playback stalls"), false)
                        .summary(label("回線があるのにプレイヤーがずっと読み込み中のとき、再読み込みします（1 配信につき最大 3 回）。一時停止中・キャスト中・広告のカバー中は行いません",
                                "When the player keeps buffering although the network is up, reloads it, up to 3 times per stream. Not while paused, casting or covering an ad.")))
                .add(new Catalog.SliderItem(PlayerWatch.KEY_THRESHOLD, label("待つ時間", "Wait before reloading"), 5, 30, 10,
                        value -> value + label(" 秒", " s")).dependsOn(PlayerWatch.KEY_RECOVER));
        c.group(label("レイド", "Raids")).needs(Feature.RAID_HOLD)
                .add(new Catalog.SwitchItem(RaidHold.KEY, label("レイドで移動しない", "Stay when a raid happens"), false)
                        .summary(label("別のチャンネルへ移動する代わりに、移動できるピルを出します。無視すると今のチャンネルに残ります",
                                "Instead of moving you to another channel, shows a pill to go there. Ignore it to stay.")));
        c.group(label("チャンネルごとの設定", "Per-channel settings")).needs(Feature.CHANNEL_PROFILES)
                .note(label("プレイヤーメニューの「このチャンネルの設定を覚える」を押すまで、何も記録しません。",
                        "Nothing is remembered until you press Remember this channel in the player menu."))
                .add(new Catalog.SwitchItem(ChannelProfiles.KEY_APPLY, label("覚えた設定を適用", "Apply remembered settings"), true))
                .add(new Catalog.ActionItem(label("覚えたチャンネルを管理", "Manage remembered channels"), OriginalExtras::manageProfiles)
                        .summary(label("チャンネルを選ぶと忘れます", "Pick a channel to forget it")));
    }

    private static void addControls(Catalog.Category c) {
        c.group(label("チャットの勢い", "Chat speed")).needs(Feature.HYPE_METER)
                .add(new Catalog.SwitchItem(HypeMeter.KEY, label("勢いグラフを表示", "Show the chat-speed graph"), false)
                        .summary(label("プレイヤーの隅に、チャットの速さの小さなグラフを出します。急に増えると短く知らせます",
                                "A small graph of chat speed in the player's corner, with a short notice when it spikes")));
    }

    private static IntFunction<String> percent() {
        return value -> value + " %";
    }

    private static void manageProfiles(Catalog.Env env) {
        Context context = env.context();
        List<String> names = ChannelProfiles.names();
        if (names.isEmpty()) {
            Notice.show(context, label("覚えたチャンネルはありません", "No channels remembered yet"));
            return;
        }
        env.ui().choose(context, label("忘れるチャンネルを選ぶ", "Choose a channel to forget"),
                names.toArray(new String[0]), -1, picked -> {
                    ChannelProfiles.forget(names.get(picked));
                    Notice.show(context, label(names.get(picked) + " を忘れました", "Forgot " + names.get(picked)));
                });
    }

    /** The on/off switch; off stops the voice right away instead of at the next message. */
    private static final class TtsSwitch extends Catalog.Item {
        TtsSwitch() {
            super(label("チャットを読み上げる", "Read chat aloud"));
            key = ChatTts.KEY_ENABLED;
        }

        @Override
        View build(Catalog.Env env) {
            SharedPreferences prefs = env.prefs(store);
            return env.ui().switchRow(env.context(), title, summary, prefs.getBoolean(key, false), checked -> {
                prefs.edit().putBoolean(key, checked).apply();
                env.changed(store);
                ChatTts.settingsChanged();
            });
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return prefs.getBoolean(key, false);
        }

        @Override
        Boolean on(SharedPreferences prefs) {
            return prefs.getBoolean(key, false);
        }
    }

    /** The phrases, one per line; an untouched list keeps the built-in defaults. */
    private static final class PhrasesItem extends Catalog.Item {
        PhrasesItem() {
            super(label("定型文の編集", "Edit phrases"));
            key = QuickPhrases.KEY_LINES;
            summary(label("1行に1つ", "One per line"));
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return !QuickPhrases.DEFAULT_LINES.equals(prefs.getString(key, QuickPhrases.DEFAULT_LINES));
        }

        @Override
        View build(Catalog.Env env) {
            SharedPreferences prefs = env.prefs(store);
            String shown = String.valueOf(QuickPhrases.phrases(prefs).length);
            return env.ui().linkRow(env.context(), title, summary, shown,
                    () -> env.ui().editLines(env.context(), title, summary,
                            prefs.getString(key, QuickPhrases.DEFAULT_LINES), text -> {
                                prefs.edit().putString(key, text).apply();
                                env.changed(store);
                                env.rebuild();
                            }));
        }
    }

    /** Lifetime totals at the top of the tools; reset is the only write. */
    private static final class StatsItem extends Catalog.Item {
        private static final String RESET_KEY = "reset:stats";

        StatsItem() {
            super(label("このパッチの記録", "What this patch has done"));
        }

        @Override
        View build(Catalog.Env env) {
            Context context = env.context();
            Ui ui = env.ui();
            LinearLayout column = new LinearLayout(context);
            column.setOrientation(LinearLayout.VERTICAL);
            countRow(column, ui, context, label("止めた広告の要求", "Ad requests stopped"), Stats.value(Stats.STOPPED));
            countRow(column, ui, context, label("差し替えた広告", "Ads replaced"), Stats.value(Stats.REPLACED));
            countRow(column, ui, context, label("隠した広告", "Ads covered"), Stats.value(Stats.COVERED));
            countRow(column, ui, context, label("受け取ったポイントボーナス", "Channel point bonuses claimed"),
                    Stats.value(Stats.POINTS));
            addWatched(column, ui, context);
            column.addView(ui.confirmRow(context, label("記録をリセット", "Reset the totals"), null,
                    label("リセット", "Reset"), label("リセットしました", "Reset done"), env.pending(RESET_KEY),
                    () -> {
                        long[] before = Stats.reset();
                        env.beginUndo(RESET_KEY, () -> {
                            Stats.restore(before);
                            env.rebuild();
                        });
                        env.rebuild();
                    },
                    () -> {
                        ConfirmPill.Pending pending = env.pending(RESET_KEY);
                        env.clearPending();
                        if (pending != null) pending.undo.run();
                    },
                    env::clearPending), Ui.matchWidth());
            return column;
        }

        private static void addWatched(LinearLayout column, Ui ui, Context context) {
            LinearLayout row = new LinearLayout(context);
            row.setGravity(Gravity.CENTER_VERTICAL);
            int pad = Ui.dp(context, 16);
            row.setPadding(pad, Ui.dp(context, 8), pad, Ui.dp(context, 8));
            row.addView(ui.text(context, label("プレイヤーで見た時間", "Time watched on the player"), 15, ui.secondary, false),
                    new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            long watched = Stats.value(Stats.WATCHED_MS);
            row.addView(ui.text(context, Stats.watchedNumber(watched) + (Stats.watchedInHours(watched)
                    ? label(" 時間", " h") : label(" 分", " min")), 17, ui.text, true));
            column.addView(row, Ui.matchWidth());
        }

    }

    /**
     * A total's name with its number rolling up at the row's end; the ad blocking page lists this run's
     * counts the same way.
     */
    static void countRow(LinearLayout column, Ui ui, Context context, String title, long value) {
        LinearLayout row = new LinearLayout(context);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int pad = Ui.dp(context, 16);
        row.setPadding(pad, Ui.dp(context, 8), pad, Ui.dp(context, 8));
        row.addView(ui.text(context, title, 15, ui.secondary, false),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        int shown = (int) Math.max(0, Math.min(Integer.MAX_VALUE, value));
        RollingCounter counter = new RollingCounter(context, ui.text, 0);
        row.addView(counter, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        counter.post(() -> counter.setValue(shown));
        column.addView(row, Ui.matchWidth());
    }
}
