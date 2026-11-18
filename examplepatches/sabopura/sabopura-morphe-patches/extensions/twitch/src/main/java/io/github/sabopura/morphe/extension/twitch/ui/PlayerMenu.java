package io.github.sabopura.morphe.extension.twitch.ui;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import io.github.sabopura.morphe.extension.twitch.ads.AdBlock;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.DanmakuSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.TwitchDanmaku;
import io.github.sabopura.morphe.extension.twitch.original.ChannelProfiles;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.player.VodChapters;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/**
 * Quick controls over the video: danmaku on/off, speed, sleep timer and the most used tools. A
 * bottom sheet in portrait, a side panel in landscape; every control updates in place.
 */
public final class PlayerMenu {
    private static final float[] RATES = {0.25f, 0.5f, 0.75f, 1f, 1.25f, 1.5f, 1.75f, 2f};
    private static WeakReference<PlayerMenu> showing = new WeakReference<>(null);

    private final Context context;
    private final Ui ui = Ui.overVideo();
    private final BackDialog dialog;
    private final Sheet sheet;
    private final LinearLayout panel;
    private final List<Runnable> refreshers = new ArrayList<>();
    private final Runnable tick = new Runnable() {
        @Override
        public void run() {
            if (!dialog.isShowing() || Ui.closeIfGone(dialog, context)) return;
            for (Runnable refresh : refreshers) refresh.run();
            sheet.postDelayed(this, 1000);
        }
    };

    private PlayerMenu(Context context) {
        Text.use(context);
        this.context = context;
        panel = new LinearLayout(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        int pad = Ui.dp(context, 20);
        panel.setPadding(pad, Ui.dp(context, 4), pad, Ui.dp(context, 20));
        sheet = new Sheet(context, ui, panel, this::finished);
        dialog = Sheet.host(context, sheet);
        dialog.setOnDismissListener(d -> {
            sheet.removeCallbacks(tick);
            showing = new WeakReference<>(null);
        });
        fill();
    }

    public static void show(Context context) {
        PlayerMenu open = showing.get();
        if (open != null && open.dialog.isShowing()) return;
        PlayerTools.initialize(context);
        PlayerMenu menu = new PlayerMenu(context);
        showing = new WeakReference<>(menu);
        Ui.show(menu.dialog, context);
        Notice.prefer(menu.sheet);
        menu.tick.run();
    }

    private void finished() {
        if (dialog.isShowing()) dialog.dismiss();
    }

    private void close(Runnable then) {
        finished();
        then.run();
    }

    // ---- content ----

    private void fill() {
        addHeader();
        MenuLayout layout = MenuLayout.parse(ChatSettings.preferences(context).getString(MenuLayout.KEY, null));
        for (String id : layout.order) {
            if (layout.hidden.contains(id) || !available(id)) continue;
            switch (id) {
                case MenuLayout.ADS:
                    addAds();
                    break;
                case MenuLayout.DANMAKU:
                    addDanmaku();
                    break;
                case MenuLayout.SPEED:
                    addSpeed();
                    break;
                case MenuLayout.SLEEP:
                    addSleep();
                    break;
                case MenuLayout.CONTROLS:
                    addPlaybackTiles();
                    break;
                case MenuLayout.CHANNEL:
                    addChannelProfile();
                    break;
                default:
                    addChatTiles();
                    break;
            }
        }
    }

    private static boolean available(String id) {
        switch (id) {
            case MenuLayout.ADS:
                return Features.ads();
            case MenuLayout.DANMAKU:
                return Features.danmaku();
            case MenuLayout.SPEED:
                return Features.has(Feature.PLAY_SPEED);
            case MenuLayout.SLEEP:
                return Features.has(Feature.PLAY_SLEEP);
            case MenuLayout.CONTROLS:
                return Features.any(Feature.PLAY_SEEK, Feature.PLAY_TOOLS, Feature.VOD_CHAPTERS, Feature.VOD_OFFSET);
            case MenuLayout.CHANNEL:
                return Features.has(Feature.CHANNEL_PROFILES);
            default:
                return Features.has(Feature.CHAT_HISTORY);
        }
    }

    /** How many sections these patches give the menu; arranging needs at least two. */
    static int sectionCount() {
        int count = 0;
        for (String id : MenuLayout.parse(null).order) if (available(id)) count++;
        return count;
    }

    private static String sectionName(String id) {
        switch (id) {
            case MenuLayout.ADS:
                return label("広告ブロック", "Ad blocking");
            case MenuLayout.DANMAKU:
                return label("弾幕", "Danmaku");
            case MenuLayout.SPEED:
                return label("再生速度", "Playback speed");
            case MenuLayout.SLEEP:
                return label("スリープタイマー", "Sleep timer");
            case MenuLayout.CONTROLS:
                return label("操作", "Controls");
            case MenuLayout.CHANNEL:
                return label("このチャンネルの設定", "This channel");
            default:
                return label("チャット", "Chat");
        }
    }

    private void addHeader() {
        LinearLayout header = new LinearLayout(context);
        header.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = ui.text(context, label("プレイヤーメニュー", "Player menu"), 20, ui.text, true);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        TextView settings = ui.button(context, label("設定", "Settings"), false,
                () -> close(() -> SettingsScreen.show(context)));
        settings.setCompoundDrawablesRelativeWithIntrinsicBounds(
                Icons.drawable(context, Icons.Kind.SETTINGS, ui.accent, 18), null, null, null);
        settings.setCompoundDrawablePadding(Ui.dp(context, 6));
        settings.setContentDescription(label("パッチの設定を開く", "Open the patch settings"));
        header.addView(settings, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        panel.addView(header, Ui.matchWidth());
    }

    private TextView section(String text) {
        TextView label = ui.sectionLabel(context, text);
        label.setPadding(0, Ui.dp(context, 20), 0, Ui.dp(context, 8));
        panel.addView(label);
        return label;
    }

    private LinearLayout menuCard() {
        LinearLayout card = ui.card(context);
        card.setBackground(Ui.rounded(context, 0x14FFFFFF, 16));
        return card;
    }

    private void addAds() {
        section(sectionName(MenuLayout.ADS));
        SharedPreferences prefs = AdBlock.preferences(context);
        Runnable[] refreshNow = new Runnable[1];
        Ui.Row row = ui.switchRowParts(context, label("広告をブロック", "Block ads"), "",
                prefs.getBoolean(AdBlock.KEY_ENABLED, true), checked -> {
                    prefs.edit().putBoolean(AdBlock.KEY_ENABLED, checked).apply();
                    refreshNow[0].run();
                });
        RollingCounter counter = new RollingCounter(context, ui.text, stoppedAds());
        LinearLayout.LayoutParams counterLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        counterLp.leftMargin = Ui.dp(context, 8);
        ((LinearLayout) row.view).addView(counter, 1, counterLp);
        LinearLayout card = menuCard();
        card.addView(row.view, Ui.matchWidth());
        panel.addView(card, Ui.matchWidth());
        Runnable refresh = () -> {
            boolean on = prefs.getBoolean(AdBlock.KEY_ENABLED, true);
            row.setSummary(on ? label("この起動中に止めた広告", "Ads stopped since the app started")
                    : label("オフ", "Off"));
            counter.setVisibility(on ? View.VISIBLE : View.GONE);
            counter.setValue(stoppedAds());
        };
        refreshNow[0] = refresh;
        refresh.run();
        refreshers.add(refresh);
    }

    private static int stoppedAds() {
        return AdBlock.count(AdBlock.REQUESTS, true) + AdBlock.count(AdBlock.REPLACED, true)
                + AdBlock.count(AdBlock.COVERED, true);
    }

    private void addDanmaku() {
        section(sectionName(MenuLayout.DANMAKU));
        Ui.Row toggle = ui.switchRowParts(context, label("弾幕を表示", "Show danmaku"), "",
                DanmakuSettings.get(context).enabled, checked -> {
                    DanmakuSettings.setEnabled(context, checked);
                    TwitchDanmaku.settingsChanged();
                });
        LinearLayout card = menuCard();
        card.addView(toggle.view, Ui.matchWidth());
        card.addView(ui.linkRow(context, label("弾幕の設定", "Danmaku settings"),
                label("大きさ・速さ・範囲・NGワード", "Size · Speed · Area · Blocked words"), null,
                () -> close(() -> SettingsScreen.show(context, Catalog.DANMAKU))), Ui.matchWidth());
        panel.addView(card, Ui.matchWidth());
        Runnable refresh = () -> {
            DanmakuSettings settings = DanmakuSettings.get(context);
            toggle.toggle.setChecked(settings.enabled, true);
            toggle.setSummary(settings.enabled
                    ? label("文字 " + settings.fontSizeSp + "・不透明度 " + settings.opacityPercent + "%・"
                            + settings.durationSeconds + " 秒で横断",
                    "Size " + settings.fontSizeSp + " · " + settings.opacityPercent + "% opacity · "
                            + settings.durationSeconds + " s across")
                    : label("オフ", "Off"));
        };
        refresh.run();
        refreshers.add(refresh);
    }

    private void addSpeed() {
        TextView heading = section(sectionName(MenuLayout.SPEED));
        String[] names = new String[RATES.length];
        for (int i = 0; i < RATES.length; i++) names[i] = format(RATES[i]);
        JellyTabs chips = new JellyTabs(context, ui, names, rateIndex(PlayerTools.playbackRate()), i -> applySpeed(RATES[i]));
        HorizontalScrollView strip = new HorizontalScrollView(context);
        strip.setHorizontalScrollBarEnabled(false);
        strip.setHorizontalFadingEdgeEnabled(true);
        strip.setFadingEdgeLength(Ui.dp(context, 28));
        strip.setClipChildren(false);
        strip.setClipToPadding(false);
        strip.addView(chips);
        panel.addView(strip, Ui.matchWidth());
        TapeSlider fine = new TapeSlider(context, ui, 1f, this::applySpeed);
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.topMargin = Ui.dp(context, 4);
        panel.addView(fine, lp);
        TextView note = note("");
        Runnable refresh = () -> {
            float rate = PlayerTools.playbackRate();
            boolean active = !Float.isNaN(rate);
            heading.setText(sectionName(MenuLayout.SPEED) + (active ? "  ·  " + format(rate) : ""));
            chips.setEnabled(active);
            chips.setAlpha(active ? 1f : .4f);
            for (int i = 0; i < RATES.length; i++) chips.chip(i).setEnabled(active);
            chips.select(rateIndex(rate), false);
            android.content.res.Configuration config = context.getResources().getConfiguration();
            fine.setVisibility(active && Layouts.tapeFits(config.screenWidthDp, config.screenHeightDp)
                    ? View.VISIBLE : View.GONE);
            if (active) fine.setValue(rate);
            if (!active) {
                note.setText(label("再生中の動画がないため変更できません", "No active video"));
                note.setVisibility(View.VISIBLE);
            } else if (Boolean.TRUE.equals(PlayerTools.live())) {
                long delay = PlayerTools.liveDelay();
                String behind = String.format(Locale.ROOT, "%.1f", delay / 1000f);
                String late = delay <= 0 ? "" : label("（今の遅れ " + behind + " 秒）", " (now " + behind + " s behind)");
                note.setText(label("ライブ配信は最新の位置より先へ進めません。1× より速くすると、遅れを取り戻したあと自動で 1× に戻ります" + late,
                        "A live stream cannot run ahead of the broadcast. Faster than 1× makes up the delay, then returns to 1×" + late + "."));
                note.setVisibility(View.VISIBLE);
            } else {
                note.setVisibility(View.GONE);
            }
        };
        refresh.run();
        refreshers.add(refresh);
    }

    private static int rateIndex(float rate) {
        for (int i = 0; i < RATES.length; i++) if (Math.abs(RATES[i] - rate) < .01f) return i;
        return -1;
    }

    private void applySpeed(float value) {
        PlayerTools.run(context, () -> {
            int result = PlayerTools.speed(value);
            if (result == PlayerTools.SPEED_AT_LIVE_EDGE)
                Notice.show(context, label("配信の最新の位置を再生中のため、これより速くできません",
                        "Already at the live edge, so it cannot play faster"));
            else if (result == PlayerTools.SPEED_CATCHING_UP)
                Notice.show(context, label("遅れを取り戻したら 1× に戻ります", "Returns to 1× once caught up"));
        });
        for (Runnable refresh : refreshers) refresh.run();
    }

    /** The dial folds away behind its row: the sheet has to stay short enough to show the video. */
    private void addSleep() {
        section(sectionName(MenuLayout.SLEEP));
        LinearLayout section = menuCard();
        section.setLayoutTransition(new LayoutTransition());
        Runnable[] refreshNow = new Runnable[1];
        LinearLayout fold = new LinearLayout(context);
        fold.setOrientation(LinearLayout.VERTICAL);
        fold.setVisibility(PlayerTools.sleepRemaining() > 0 || PlayerTools.sleepsAtEnd() ? View.VISIBLE : View.GONE);
        LinearLayout body = new LinearLayout(context);
        body.setGravity(Gravity.CENTER_VERTICAL);
        body.setPadding(Ui.dp(context, 8), 0, Ui.dp(context, 12), Ui.dp(context, 12));
        SegmentDial dial = new SegmentDial(context, ui, PlayerTools.sleepRemaining(), minutes -> {
            PlayerTools.setSleepMinutes(minutes);
            refreshNow[0].run();
        });
        body.addView(dial, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        LinearLayout buttons = new LinearLayout(context);
        buttons.setOrientation(LinearLayout.VERTICAL);
        buttons.addView(ui.button(context, "+5", false, () -> {
            int minutes = Math.min(120, (int) Math.ceil(PlayerTools.sleepRemaining() / 60000.0) + 5);
            PlayerTools.setSleepMinutes(minutes);
            dial.sweepTo(minutes);
            refreshNow[0].run();
        }), Ui.matchWidth());
        LinearLayout.LayoutParams offLp = Ui.matchWidth();
        offLp.topMargin = Ui.dp(context, 4);
        buttons.addView(ui.button(context, label("オフ", "Off"), false, () -> {
            PlayerTools.setSleepMinutes(0);
            dial.sweepTo(0);
            refreshNow[0].run();
        }), offLp);
        body.addView(buttons, new LinearLayout.LayoutParams(Ui.dp(context, 96), ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView atEnd = ui.chip(context, label("この動画が終わったら", "When this video ends"), false, () -> {
            if (PlayerTools.sleepsAtEnd()) PlayerTools.setSleepMinutes(0);
            else if (PlayerTools.sleepAtEnd()) dial.sweepTo(0);
            refreshNow[0].run();
        });
        LinearLayout.LayoutParams atEndLp = Ui.matchWidth();
        atEndLp.setMargins(Ui.dp(context, 12), Ui.dp(context, 4), Ui.dp(context, 12), Ui.dp(context, 4));
        // Above the dial: one tap, seen without scrolling.
        fold.addView(atEnd, atEndLp);
        fold.addView(body, Ui.matchWidth());
        Ui.Row row = ui.linkRowParts(context, label("残り時間で一時停止", "Pause after a set time"), null, "", () -> {
            boolean showing = fold.getVisibility() == View.VISIBLE;
            fold.setVisibility(showing ? View.GONE : View.VISIBLE);
            // The dial opens below the fold of a short sheet; bring all of it into view.
            if (!showing) fold.post(() -> fold.requestRectangleOnScreen(new Rect(0, 0, fold.getWidth(), fold.getHeight())));
        });
        section.addView(row.view, Ui.matchWidth());
        section.addView(fold, Ui.matchWidth());
        panel.addView(section, Ui.matchWidth());
        Runnable refresh = () -> {
            long remaining = PlayerTools.sleepRemaining();
            boolean untilEnd = PlayerTools.sleepsAtEnd();
            dial.update(remaining);
            // A live stream has no end to wait for, and a video that is over has passed it.
            atEnd.setVisibility(untilEnd || PlayerTools.endAhead() ? View.VISIBLE : View.GONE);
            atEnd.setSelected(untilEnd);
            dial.idleLabel(untilEnd ? label("終わり", "End") : label("オフ", "Off"));
            if (untilEnd) {
                row.value.setText(label("動画の終わりまで", "Until video ends"));
            } else if (remaining <= 0) {
                row.value.setText(label("オフ", "Off"));
            } else {
                long seconds = (remaining + 999) / 1000;
                row.value.setText(String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60));
            }
            row.value.setVisibility(View.VISIBLE);
        };
        refreshNow[0] = refresh;
        refresh.run();
        refreshers.add(refresh);
    }

    private void addPlaybackTiles() {
        section(sectionName(MenuLayout.CONTROLS));
        if (Features.has(Feature.PLAY_TOOLS)) addViewingTiles();
        ViewGroup[] holder = new ViewGroup[1];
        String[] signature = new String[1];
        Runnable refresh = () -> {
            String now = PlayerTools.live() + "/" + PlayerTools.vodId();
            if (now.equals(signature[0])) return;
            signature[0] = now;
            ViewGroup grid = ui.grid(context, playbackTiles().toArray(new View[0]));
            if (holder[0] == null) {
                LinearLayout.LayoutParams lp = Ui.matchWidth();
                panel.addView(grid, lp);
            } else {
                int index = panel.indexOfChild(holder[0]);
                panel.removeView(holder[0]);
                panel.addView(grid, index, Ui.matchWidth());
            }
            holder[0] = grid;
            grid.setVisibility(grid.getChildCount() == 0 ? View.GONE : View.VISIBLE);
        };
        refresh.run();
        refreshers.add(refresh);
    }

    /** Mute shows its state, which a stream changing under the open menu (a raid) also ends. */
    private void addViewingTiles() {
        View[] mute = new View[1];
        Runnable refresh = () -> {
            boolean muted = PlayerTools.muted();
            if (mute[0].isSelected() == muted) return;
            mute[0].setSelected(muted);
            ui.retile(mute[0], muted ? Icons.Kind.MUTED : Icons.Kind.VOLUME,
                    muted ? label("消音を解除", "Unmute") : label("消音", "Mute"));
        };
        mute[0] = ui.tile(context, Icons.Kind.VOLUME, label("消音", "Mute"), () -> {
            PlayerTools.run(context, () -> {
                boolean on = !PlayerTools.muted();
                PlayerTools.mute(on);
                if (on) Notice.show(context, label("消音しました。別の配信や動画を開くと元に戻ります",
                        "Muted until you open another stream or video"));
            });
            refresh.run();
        });
        View lock = ui.tile(context, Icons.Kind.LOCK, label("画面ロック", "Lock touches"),
                () -> close(() -> TouchLock.lock(context)));
        LinearLayout.LayoutParams lp = Ui.matchWidth();
        lp.bottomMargin = Ui.dp(context, 8);
        panel.addView(ui.grid(context, mute[0], lock), lp);
        refresh.run();
        refreshers.add(refresh);
    }

    private List<View> playbackTiles() {
        SharedPreferences prefs = ChatSettings.preferences(context);
        int back = prefs.getInt("rewind_seek", PlayerTools.DEFAULT_REWIND_SEEK);
        int forward = prefs.getInt("forward_seek", PlayerTools.DEFAULT_FORWARD_SEEK);
        List<View> tiles = new ArrayList<>();
        // A live stream has no timeline to move along.
        if (Features.has(Feature.PLAY_SEEK) && !Boolean.TRUE.equals(PlayerTools.live())) {
            tiles.add(ui.tile(context, Icons.Kind.REWIND, label(back + "秒戻る", "Back " + back + " s"),
                    () -> PlayerTools.relativeSeek(context, false)));
            tiles.add(ui.tile(context, Icons.Kind.FORWARD, label(forward + "秒進む", "Forward " + forward + " s"),
                    () -> PlayerTools.relativeSeek(context, true)));
        }
        if (Features.has(Feature.PLAY_TOOLS)) {
            tiles.add(ui.tile(context, Icons.Kind.RELOAD, label("再読み込み", "Reload"), () -> close(() -> PlayerTools.reload(context))));
            tiles.add(ui.tile(context, Icons.Kind.CHART, label("再生統計", "Statistics"), () -> PlayerTools.stats(context)));
        }
        if (!PlayerTools.vodId().isEmpty()) {
            if (Features.has(Feature.VOD_CHAPTERS))
                tiles.add(ui.tile(context, Icons.Kind.LIST, label("チャプター", "Chapters"), () -> VodChapters.show(context)));
            if (Features.has(Feature.VOD_OFFSET))
                tiles.add(ui.tile(context, Icons.Kind.CLOCK, label("チャット同期", "Chat offset"), () -> PlayerTools.sync(context)));
        }
        return tiles;
    }

    /** The volume row only exists for a remembered channel, since nothing is kept otherwise. */
    private void addChannelProfile() {
        section(sectionName(MenuLayout.CHANNEL));
        LinearLayout card = menuCard();
        View[] volume = new View[1];
        Ui.Row row = ui.switchRowParts(context, label("このチャンネルの設定を覚える", "Remember this channel's settings"),
                "", ChannelProfiles.remembered(), checked -> {
                    ChannelProfiles.setRemembered(context, checked);
                    volume[0].setVisibility(checked ? View.VISIBLE : View.GONE);
                });
        card.addView(row.view, Ui.matchWidth());
        volume[0] = ui.sliderRow(context, label("このチャンネルの音量", "Volume on this channel"),
                label("端末の音量に対する割合です", "A share of the device volume"), 0, 100,
                ChannelProfiles.volumePercent(), v -> v + " %", ChannelProfiles::setVolumePercent);
        volume[0].setVisibility(ChannelProfiles.remembered() ? View.VISIBLE : View.GONE);
        card.addView(volume[0], Ui.matchWidth());
        panel.addView(card, Ui.matchWidth());
        Runnable refresh = () -> {
            String login = ChannelProfiles.currentLogin();
            row.view.setEnabled(!login.isEmpty());
            row.toggle.setEnabled(!login.isEmpty());
            row.setSummary(login.isEmpty() ? label("チャットを開くと使えます", "Available once chat is open")
                    : label(login + "・音量と弾幕、VOD の速度、チャットの文字サイズ",
                    login + " · volume, danmaku, VOD speed, chat text size"));
        };
        refresh.run();
        refreshers.add(refresh);
    }

    private void addChatTiles() {
        section(sectionName(MenuLayout.CHAT));
        panel.addView(ui.grid(context,
                ui.tile(context, Icons.Kind.CHAT, label("過去チャット", "Recent chat"), () -> HistorySheet.show(context, true, ui)),
                ui.tile(context, Icons.Kind.SEARCH, label("履歴を検索", "Search history"), () -> HistorySheet.show(context, false, ui)),
                ui.tile(context, Icons.Kind.PERSON, label("ユーザー検索", "Find user"), () -> UserSearchSheet.show(context, ui))),
                Ui.matchWidth());
    }

    private TextView note(String text) {
        TextView note = ui.text(context, text, 12, ui.secondary, false);
        note.setPadding(Ui.dp(context, 2), Ui.dp(context, 8), 0, 0);
        panel.addView(note);
        return note;
    }

    private static String format(float rate) {
        String text = rate == (int) rate ? String.valueOf((int) rate)
                : String.format(Locale.ROOT, "%.2f", rate).replaceAll("0$", "");
        return text + "×";
    }

    // ---- layout editor ----

    /** Settings entry: drag to reorder the sections, switch to show or hide one. */
    static void editLayout(Catalog.Env env) {
        Context context = env.context();
        Ui ui = env.ui();
        SharedPreferences prefs = env.prefs(Catalog.Store.CHAT);
        MenuLayout layout = MenuLayout.parse(prefs.getString(MenuLayout.KEY, null));
        List<ArrangeList.Row> rows = new ArrayList<>();
        for (String id : layout.order)
            if (available(id)) rows.add(new ArrangeList.Row(id, sectionName(id), !layout.hidden.contains(id)));
        ArrangeList list = new ArrangeList(context, ui, rows, ordered -> {
            MenuLayout saved = MenuLayout.parse(prefs.getString(MenuLayout.KEY, null));
            saved.order.clear();
            for (ArrangeList.Row row : ordered) {
                saved.order.add(row.id);
                if (row.visible) saved.hidden.remove(row.id);
                else saved.hidden.add(row.id);
            }
            for (String id : layout.order) if (!saved.order.contains(id)) saved.order.add(id);
            prefs.edit().putString(MenuLayout.KEY, saved.serialize()).apply();
            env.changed(Catalog.Store.CHAT);
        });
        Ui.show(ui.modal(context, label("メニューの順番と表示", "Menu order and visibility"),
                label("行を押さえたまま上下に動かして並べ替えます", "Hold a row and move it up or down to reorder"), list,
                label("閉じる", "Close"), (Runnable) null, null), context);
    }
}
