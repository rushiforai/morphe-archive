package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;

import java.util.List;

import io.github.sabopura.morphe.extension.twitch.app.AmoledBlack;
import io.github.sabopura.morphe.extension.twitch.app.Analytics;
import io.github.sabopura.morphe.extension.twitch.app.AppHooks;
import io.github.sabopura.morphe.extension.twitch.app.AutoDrops;
import io.github.sabopura.morphe.extension.twitch.app.CrashGuard;
import io.github.sabopura.morphe.extension.twitch.app.ForceLandscape;
import io.github.sabopura.morphe.extension.twitch.app.LatencyBadge;
import io.github.sabopura.morphe.extension.twitch.app.VideoQuality;
import io.github.sabopura.morphe.extension.twitch.points.AutoClaimPoints;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Settings of the adopted app-wide patches. */
final class AppExtras {
    private AppExtras() {
    }

    static void addTo(List<Catalog.Category> categories) {
        if (CrashGuard.paused()) categories.add(0, paused());
        addPlayback(Catalog.find(categories, "playback"));
        addControls(Catalog.find(categories, "controls"));
        addHome(Catalog.find(categories, "home"));
        addHide(Catalog.find(categories, "hide"));
        addAccount(Catalog.find(categories, "account"));
    }

    private static Catalog.Category paused() {
        Catalog.Category c = new Catalog.Category("safety", label("安全のための一時停止", "Paused for safety"),
                label("パッチの機能が止まっています", "Patch features are stopped"));
        c.group(label("一時停止", "Paused"))
                .note(label("起動直後のクラッシュが3回続いたため、すべてのパッチ機能を止めています。保存した設定は変更していません。",
                        "The app crashed right after launch three times in a row, so every patch feature is stopped. Your saved settings have not changed."))
                .add(new Catalog.ActionItem(label("パッチの機能を再度有効にする", "Turn patch features back on"), env -> {
                    Context context = env.context();
                    CrashGuard.resumeAndRestart(context);
                }).summary(label("アプリを再起動します", "Restarts the app")));
        return c;
    }

    private static void addPlayback(Catalog.Category c) {
        c.group(label("画質の既定値", "Default quality")).needs(Feature.DEFAULT_QUALITY)
                .note(label("プレイヤーで画質を選んだことがあれば、その選択が優先されます。", "A quality you already saved in the player still wins."))
                .add(qualityChoice(VideoQuality.KEY, label("既定の画質", "Default quality")))
                .add(qualityChoice(VideoQuality.KEY_METERED, label("モバイル回線での画質", "Quality on metered networks"))
                        .summary(label("モバイルデータや従量制Wi-Fiのときだけ、これより高い画質では始めません",
                                "Only applies on mobile data or metered Wi-Fi, and only when lower than the default")));
        c.group(label("遅延と裏での再生", "Latency and background play")).needs(Feature.NORMAL_LATENCY, Feature.BACKGROUND_AUDIO)
                .add(new Catalog.SwitchItem(AppHooks.KEY_NORMAL_LATENCY, label("低遅延モードをオフにする", "Turn off low-latency mode"), false)
                        .summary(label("配信者との遅延は数秒増えますが、回線が弱いときに止まりにくくなります。次に開く配信から反映します",
                                "A few more seconds behind the broadcaster, fewer rebuffers on a weak connection. Applies to the next stream."))
                        .needs(Feature.NORMAL_LATENCY))
                .add(new Catalog.ChoiceItem(AppHooks.KEY_BACKGROUND_AUDIO, label("バックグラウンド再生の既定値", "Default background audio"),
                        new String[]{label("Twitch の既定（しない）", "Twitch default (never)"),
                                label("常に再生", "Always"), label("ヘッドホンとスピーカーで再生", "With headphones or a speaker")},
                        new String[]{"", "always", "headphones_speaker"}, "")
                        .summary(label("Twitch の設定で選んだことがあれば、その選択が優先されます", "A choice saved in Twitch's own settings still wins"))
                        .needs(Feature.BACKGROUND_AUDIO));
    }

    private static void addControls(Catalog.Category c) {
        c.group(label("プレイヤーの表示", "On the player"))
                .needs(Feature.FORCE_LANDSCAPE, Feature.LATENCY_BADGE, Feature.OFFICIAL_STATS)
                .add(new Catalog.SwitchItem(ForceLandscape.KEY, label("開いたら横画面にする", "Open in landscape"), false)
                        .summary(label("配信や動画をプレイヤーで開くと横向きにし、閉じると元に戻します。ホームのプレビューでは回転しません",
                                "Rotates when a stream or video opens in the full player and back when it closes. Home previews do not rotate."))
                        .needs(Feature.FORCE_LANDSCAPE))
                .add(new Catalog.SwitchItem(LatencyBadge.KEY, label("遅延バッジを表示", "Show the latency badge"), false)
                        .summary(label("ライブ配信の遅延をプレイヤーに表示します（5秒・10秒で色が変わります）。タップすると再読み込みします。次に開く画面から反映します",
                                "Shows how far a live stream is behind on the player, changing colour at 5 and 10 seconds. Tap it to reload. Applies to newly opened screens."))
                        .needs(Feature.LATENCY_BADGE))
                .add(new Catalog.SwitchItem(AppHooks.KEY_OFFICIAL_STATS, label("公式の統計パネルを表示", "Show the official stats panel"), false)
                        .summary(label("Twitch のスタッフ用統計ボタンをプレイヤーに出します。次に開く画面から反映します",
                                "Adds Twitch's staff-only stats button to the player. Applies to newly opened screens."))
                        .needs(Feature.OFFICIAL_STATS));
    }

    /** Startup comes first on the page: it is the first thing the app does. */
    private static void addHome(Catalog.Category c) {
        Catalog.Group startup = new Catalog.Group(c, label("起動", "Startup"))
                .needs(Feature.STARTUP_TAB, Feature.FIX_STUCK_START, Feature.DISABLE_UPDATE_PROMPTS)
                .add(new Catalog.ChoiceItem(AppHooks.KEY_STARTUP_TAB, label("起動時に開く画面", "Start screen"),
                        new String[]{label("ホーム（Twitch の既定）", "Home (Twitch default)"), label("ブラウズ", "Browse"),
                                label("フォロー中", "Following"), label("アクティビティ", "Activity")},
                        new String[]{"", "browse", "following", "activity"}, "")
                        .summary(label("リンクや通知から開いたときは、その画面が優先されます", "Links and notifications still open what they point to"))
                        .needs(Feature.STARTUP_TAB))
                .add(new Catalog.SwitchItem(AppHooks.KEY_FIX_STUCK_START, label("起動画面の固まりを解消", "Fix stuck start screen"), true)
                        .summary(label("起動画面が5秒進まないときに、Twitch の次の画面へ進めます", "Moves past the start screen if it is still waiting after 5 seconds"))
                        .needs(Feature.FIX_STUCK_START))
                .add(new Catalog.SwitchItem(AppHooks.KEY_UPDATE_PROMPTS, label("更新の案内を出さない", "No update prompts"), false)
                        .summary(label("パッチ版は Play ストアから更新できないため、更新の案内を隠します",
                                "A patched app cannot update from the Play Store, so its update prompts are hidden"))
                        .needs(Feature.DISABLE_UPDATE_PROMPTS));
        c.groups.add(0, startup);
    }

    private static void addHide(Catalog.Category c) {
        Catalog.Group theme = new Catalog.Group(c, label("テーマと宣伝", "Theme and promotions"))
                .needs(Feature.AMOLED_BLACK, Feature.HIDE_UPSELLS)
                .add(new Catalog.SwitchItem(AmoledBlack.KEY, label("有機EL向けの黒", "AMOLED black"), false)
                        .summary(label("ダークテーマの灰色を黒にします。Compose で描かれる画面（設定の一部やエモート選択など）とポップアップは灰色のままです。再起動後に反映します",
                                "Turns the dark theme's greys black. Screens drawn with Compose (parts of settings, the emote picker) and pop-up sheets stay grey. Applies after a restart."))
                        .needs(Feature.AMOLED_BLACK))
                .add(new Catalog.SwitchItem(AppHooks.KEY_HIDE_UPSELLS, label("宣伝を隠す", "Hide upsells"), false)
                        .summary(label("割引バナーと Turbo の案内を隠します。サブスクのボタンは下の「配信の下のボタン」で隠せます",
                                "Hides discount banners and Turbo offers. Hide the Subscribe button under Buttons under the stream below."))
                        .needs(Feature.HIDE_UPSELLS));
        c.groups.add(0, theme);
    }

    private static void addAccount(Catalog.Category c) {
        c.group(label("自動で受け取る", "Automatic claims")).needs(Feature.AUTO_POINTS, Feature.AUTO_DROPS)
                .add(new Catalog.SwitchItem(AutoClaimPoints.KEY, label("ポイントのボーナスを自動で受け取る", "Auto-claim channel point bonuses"), true)
                        .summary(label("視聴中に出るボーナスの宝箱を代わりに受け取ります。送信内容はタップしたときと同じです",
                                "Claims the bonus chest that appears while you watch. Sends the same request as tapping it."))
                        .needs(Feature.AUTO_POINTS))
                .add(new Catalog.SwitchItem(AutoDrops.KEY, label("Drops を自動で受け取る", "Auto-claim Drops"), false)
                        .summary(label("配信の Drops 通知が受け取り可能になったときに、受け取るボタンを代わりに押します。送信内容はタップしたときと同じです",
                                "Presses the Claim button when a channel's drops notification shows a claimable drop. Sends the same request as tapping it."))
                        .needs(Feature.AUTO_DROPS));
        c.group(label("アカウント", "Account")).needs(Feature.WATCH_SIGNED_OUT)
                .add(new Catalog.SwitchItem(AppHooks.KEY_WATCH_SIGNED_OUT, label("ログインせずに見る", "Watch without signing in"), true)
                        .summary(label("ログアウト中に、ログイン画面の代わりに Twitch のログアウト状態の画面を開きます。ログイン中の動作は変わりません。再起動後に反映します",
                                "While signed out, opens Twitch's signed-out mode instead of the login screen. Signed-in use is unchanged. Applies after a restart."))
                        .needs(Feature.WATCH_SIGNED_OUT));
        c.group(label("プライバシー", "Privacy")).needs(Feature.DISABLE_ANALYTICS, Feature.CLEAN_SHARE_LINKS)
                .add(new Catalog.SwitchItem(Analytics.KEY, label("解析を止める", "Disable analytics"), false)
                        .summary(label("利用状況の送信と Crashlytics・Sentry・Nielsen・Sprig・comScore を止めます。Drops や配信者の統計に使う視聴イベントは送ります。再起動後に反映します",
                                "Stops usage events, Crashlytics, Sentry, Nielsen, Sprig and comScore. Events that count your view for Drops and streamers' stats are still sent. Applies after a restart."))
                        .needs(Feature.DISABLE_ANALYTICS))
                .add(new Catalog.SwitchItem(AppHooks.KEY_CLEAN_SHARE_LINKS, label("共有リンクの追跡情報を消す", "Clean share links"), false)
                        .summary(label("共有やコピーをする twitch.tv のリンクから、追跡用の項目だけを取り除きます。再生位置などは残します",
                                "Removes only known tracking parameters from twitch.tv links you share or copy. Timestamps and the rest stay."))
                        .needs(Feature.CLEAN_SHARE_LINKS));
    }

    private static Catalog.ChoiceItem qualityChoice(String key, String title) {
        List<String> values = VideoQuality.CHOICES;
        String[] labels = new String[values.size()];
        for (int i = 0; i < labels.length; i++) {
            String value = values.get(i);
            labels[i] = value.equals(VideoQuality.AUTO) ? label("Twitch の既定（自動）", "Twitch default (auto)")
                    : value.equals(VideoQuality.SOURCE) ? label("ソース", "Source") : value;
        }
        return new Catalog.ChoiceItem(key, title, labels, values.toArray(new String[0]), VideoQuality.AUTO);
    }
}
