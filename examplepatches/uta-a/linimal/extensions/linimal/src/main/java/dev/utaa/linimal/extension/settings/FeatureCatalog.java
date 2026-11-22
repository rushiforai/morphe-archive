package dev.utaa.linimal.extension.settings;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.utaa.linimal.extension.config.LinimalFeature;
import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * 設定画面に並べる機能の定義です。
 *
 * <p>各項目は {@link LinimalFeature} が持つ build-time の feature ID と対応づけます。
 * patch-status に ID がない機能は、設定画面に表示しません。このクラスは Android API に
 * 依存しないため、表示対象の判断を local JVM test で検証できます。</p>
 */
public final class FeatureCatalog {
    public static final class Entry {
        private final LinimalFeature feature;
        private final SettingsPage page;
        private final SettingsSection section;
        private final String title;
        private final String summary;
        private final LinimalFeature blockedBy;
        private final String blockedSummary;

        Entry(
                LinimalFeature feature,
                SettingsPage page,
                String title,
                String summary) {
            this(feature, page, null, title, summary);
        }

        Entry(
                LinimalFeature feature,
                SettingsPage page,
                SettingsSection section,
                String title,
                String summary) {
            this(feature, page, section, title, summary, null, null);
        }

        private Entry(
                LinimalFeature feature,
                SettingsPage page,
                SettingsSection section,
                String title,
                String summary,
                LinimalFeature blockedBy,
                String blockedSummary) {
            this.feature = feature;
            this.page = page;
            this.section = section;
            this.title = title;
            this.summary = summary;
            this.blockedBy = blockedBy;
            this.blockedSummary = blockedSummary;
        }

        /** {@code blocker} が ON の間は操作できない項目にします。保存値は書き換えません。 */
        Entry blockedBy(LinimalFeature blocker, String reason) {
            return new Entry(feature, page, section, title, summary, blocker, reason);
        }

        public LinimalFeature getFeature() {
            return feature;
        }

        /** patch-status の feature ID。存在しない機能は設定画面に出しません。 */
        public String getFeatureId() {
            return feature.getFeatureId();
        }

        /** この機能を表示する設定ページです。 */
        public SettingsPage getPage() {
            return page;
        }

        /** ページ内の小見出しです。小見出しを持たないページでは null です。 */
        public SettingsSection getSection() {
            return section;
        }

        /** 表示言語に訳したタイトルです。 */
        public String getTitle() {
            return LinimalText.t(title);
        }

        /** 表示言語に訳した説明です。 */
        public String getSummary() {
            return LinimalText.t(summary);
        }

        /** ON の間この項目を操作できなくする機能。制約がなければ null です。 */
        public LinimalFeature getBlockedBy() {
            return blockedBy;
        }

        /** 操作できない理由として説明に足す文。制約がなければ null です。 */
        public String getBlockedSummary() {
            return blockedSummary == null ? null : LinimalText.t(blockedSummary);
        }

        /**
         * 制約元の機能が利用可能で、かつ ON のときだけ操作できなくします。制約元が適用されていない・
         * 設定を読めない場合は止めず、この項目だけで判断します。
         */
        public boolean isBlocked(boolean blockerAvailable, boolean blockerEnabled) {
            return blockedBy != null && blockerAvailable && blockerEnabled;
        }
    }

    /**
     * 一つの小見出しと、その下に並べる項目です。
     *
     * <p>表示できる項目がない小見出しは Group 自体が作られないため、見出しだけが残りません。</p>
     */
    public static final class Group {
        private final SettingsSection section;
        private final List<Entry> entries;

        Group(SettingsSection section, List<Entry> entries) {
            this.section = section;
            this.entries = Collections.unmodifiableList(new ArrayList<>(entries));
        }

        /** 小見出し。見出しを描画しない場合は null です。 */
        public SettingsSection getSection() {
            return section;
        }

        public List<Entry> getEntries() {
            return entries;
        }
    }

    private static final String PREVIEW_DISABLED_SUMMARY =
            "「プレビューを使わない」が ON の間は変更できません。";

    private static final List<Entry> ENTRIES = Collections.unmodifiableList(Arrays.asList(
            new Entry(LinimalFeature.SMART_CHANNEL_ADS, SettingsPage.ADS,
                    SettingsSection.ADS_ADS,
                    "トーク一覧の広告を非表示",
                    "トーク一覧の上部（Smart Channel）に出る広告を消します。"),
            new Entry(LinimalFeature.HOME_TOP_AD, SettingsPage.ADS,
                    SettingsSection.ADS_ADS,
                    "ホームの広告を非表示",
                    "ホームの広告枠とフィード内の広告を消します。"),
            new Entry(LinimalFeature.SQUARE_ADS, SettingsPage.ADS,
                    SettingsSection.ADS_ADS,
                    "オープンチャットの広告を非表示",
                    "トーク、スレッド、ノートの広告を消します。"),
            new Entry(LinimalFeature.PREMIUM, SettingsPage.ADS,
                    SettingsSection.ADS_PREMIUM,
                    "送信取消時の案内を非表示",
                    "送信を取り消したときに出る LINE Premium の案内を消します。"),
            new Entry(LinimalFeature.PREMIUM_SETTINGS_ROW, SettingsPage.ADS,
                    SettingsSection.ADS_PREMIUM,
                    "設定の Premium を非表示",
                    "LINE の設定画面にある LINE Premium の行を消します。"),

            new Entry(LinimalFeature.AGENT_I_HOME_HEADER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SCREEN_HEADERS,
                    "ホームの Agent i を非表示",
                    "ホーム上部の Agent i の入口を消します。"),
            new Entry(LinimalFeature.AGENT_I_WALLET_HEADER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SCREEN_HEADERS,
                    "ウォレットの Agent i を非表示",
                    "ウォレット上部の Agent i の入口を消します。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SCREEN_HEADERS,
                    "検索欄の Agent i を非表示",
                    "トーク一覧の検索欄にある Agent i の入口を消します。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_INFORMATION, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "チャット情報の Agent i を非表示",
                    "チャット情報画面にある Agent i の入口を消します。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_COMPOSER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "入力欄の Agent i を非表示",
                    "メッセージ入力欄にある Agent i の入口を消します。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_PLUS_MENU, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "＋メニューの Agent i を非表示",
                    "＋メニュー上部の「トークルームのAgent iを表示」を消します。"),
            new Entry(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "長押しメニューの LINE AI を非表示",
                    "メッセージの長押しメニューと、画像の横にある LINE AI ボタンを消します。"),
            new Entry(LinimalFeature.LINE_AI_GALLERY_VIEWER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "写真・動画画面の LINE AI を非表示",
                    "写真・動画を表示する画面の LINE AI の入口を消します。"),
            new Entry(LinimalFeature.AGENT_I_SETTINGS, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SETTINGS,
                    "設定画面の Agent i を非表示",
                    "LINE の設定画面にある Agent i の入口を消します。"),

            new Entry(LinimalFeature.SHOPPING, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "ショッピングを非表示",
                    "下部タブから外します。"),
            new Entry(LinimalFeature.NEWS, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "ニュースを非表示",
                    "下部タブから外します。"),
            new Entry(LinimalFeature.WALLET, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "ウォレットを非表示",
                    "下部タブから外します。"),
            new Entry(LinimalFeature.MINI, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "アプリを非表示",
                    "下部タブから外します。"),
            new Entry(LinimalFeature.CHAT_LIST_HEADER_AI_FRIENDS, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_LIST_HEADER,
                    "AI Friends を非表示",
                    "トーク一覧の上部にあるアイコンを消します。"),
            new Entry(LinimalFeature.CHAT_LIST_HEADER_CALENDAR, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_LIST_HEADER,
                    "カレンダーを非表示",
                    "トーク一覧の上部にあるアイコンを消します。"),
            new Entry(LinimalFeature.CHAT_LIST_HEADER_OPEN_CHAT, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_LIST_HEADER,
                    "オープンチャットを非表示",
                    "トーク一覧の上部にあるアイコンを消します。"),
            new Entry(LinimalFeature.CHAT_CALENDAR, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_PLUS_MENU,
                    "カレンダーを非表示",
                    "トークの ＋ メニューから外します。"),
            new Entry(LinimalFeature.CHAT_LINE_GIFT, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_PLUS_MENU,
                    "LINE ギフトを非表示",
                    "トークの ＋ メニューから外します。"),
            new Entry(LinimalFeature.CHAT_LINE_PAY, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_PLUS_MENU,
                    "LINE Pay を非表示",
                    "トークの ＋ メニューから外します。"),
            new Entry(LinimalFeature.HOME_RECOMMENDATIONS, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "おすすめを非表示",
                    "ホームのおすすめ枠を消します。"),
            new Entry(LinimalFeature.HOME_TRENDING, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "話題を非表示",
                    "ホームの話題・トレンド枠を消します。"),
            new Entry(LinimalFeature.HOME_FEED_POST_CARDS, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "投稿カードを非表示",
                    "ホーム下部の投稿カードを消します。"),
            new Entry(LinimalFeature.HOME_FEATURED_COLLECTIONS, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "特集を非表示",
                    "ホームの特集枠（動画の一覧）を消します。"),
            new Entry(LinimalFeature.HOME_FEED_LIVE, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "ライブ配信を非表示",
                    "ホームのフィードにあるライブ配信のカードを消します。"),
            new Entry(LinimalFeature.HOME_RECENT_HISTORY, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "最近使ったサービスを非表示",
                    "ホーム上部の最近使ったサービスの枠を消します。"),

            new Entry(LinimalFeature.READ_WITHOUT_RECEIPT, SettingsPage.READ_RECEIPT,
                    "既読をつけずに読む",
                    "トーク一覧の長押しメニューに追加します。開いたトークは未読のままです。"),
            new Entry(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, SettingsPage.READ_RECEIPT,
                    "通知から既読をつけずに開く",
                    "通知から開いたトークを未読のままにします。"),

            new Entry(LinimalFeature.READ_RECEIPT_READERS_ICONS, SettingsPage.READ_RECEIPT_READERS,
                    SettingsSection.READ_RECEIPT_READERS_OWN,
                    "既読者のアイコンを表示",
                    "グループで、自分のメッセージの「既読」の横に読んだ人のアイコンを並べます。"),
            new Entry(LinimalFeature.READ_RECEIPT_READERS_OTHERS_COUNT, SettingsPage.READ_RECEIPT_READERS,
                    SettingsSection.READ_RECEIPT_READERS_OTHERS,
                    "既読数を表示",
                    "相手のメッセージの時刻の上に、読んだ人数（送信者と自分を除く）を「既読 N」で表示します。"),
            new Entry(LinimalFeature.READ_RECEIPT_READERS_OTHERS_ICONS, SettingsPage.READ_RECEIPT_READERS,
                    SettingsSection.READ_RECEIPT_READERS_OTHERS,
                    "既読者のアイコンを表示",
                    "相手のメッセージの時刻の上に、読んだ人のアイコンを並べます。"),
            new Entry(LinimalFeature.READ_RECEIPT_READERS_TAP, SettingsPage.READ_RECEIPT_READERS,
                    SettingsSection.READ_RECEIPT_READERS_OPEN,
                    "タップで一覧を開く",
                    "「既読」や既読数・アイコンをタップすると、読んだ人と未読の人の一覧を開きます。"),
            new Entry(LinimalFeature.READ_RECEIPT_READERS_MENU, SettingsPage.READ_RECEIPT_READERS,
                    SettingsSection.READ_RECEIPT_READERS_OPEN,
                    "長押しメニューに追加",
                    "メッセージの長押しメニューに「既読者」を追加します。相手のメッセージにも使えます。"),
            new Entry(LinimalFeature.READ_RECEIPT_READERS_SERVER_SYNC, SettingsPage.READ_RECEIPT_READERS,
                    SettingsSection.READ_RECEIPT_READERS_DATA,
                    "開くたびにサーバーと同期",
                    "一覧を開くたびに、LINE の同期処理で既読の記録を取り直します。他人のメッセージの既読数かアイコンが ON なら、トークを開いたときにも同期します。OFF のときは端末の記録だけを使い、通信しません。"),

            new Entry(LinimalFeature.PREVIEW_DISABLE, SettingsPage.TALK,
                    SettingsSection.CHAT_PREVIEW,
                    "プレビューを使わない",
                    "トーク一覧の長押しで、プレビューではなく従来のメニューを開きます。"),
            new Entry(LinimalFeature.PREVIEW_SCROLL, SettingsPage.TALK,
                    SettingsSection.CHAT_PREVIEW,
                    "プレビューをスクロール可能にする",
                    "長押しで開くプレビューをスクロールできるようにします。")
                    .blockedBy(LinimalFeature.PREVIEW_DISABLE, PREVIEW_DISABLED_SUMMARY),
            new Entry(LinimalFeature.PREMIUM_PREVIEW_PROMOTION, SettingsPage.TALK,
                    SettingsSection.CHAT_PREVIEW,
                    "プレビューの Premium 案内を非表示",
                    "プレビューにある LINE Premium の案内とメニューの行を消します。")
                    .blockedBy(LinimalFeature.PREVIEW_DISABLE, PREVIEW_DISABLED_SUMMARY),
            new Entry(LinimalFeature.EXTERNAL_BROWSER, SettingsPage.TALK,
                    SettingsSection.CHAT_LINKS,
                    "リンクを外部ブラウザで開く",
                    "トークやリッチメニューの http/https リンクを端末のブラウザで開きます。LINE のログインや決済は元のまま開きます。"),

            new Entry(LinimalFeature.AMOLED_THEME, SettingsPage.THEME,
                    "ダークモードを真っ黒にする",
                    "ダークモードのとき、背景と下部タブを黒にします。カード、吹き出し、着せかえの色は変わりません。"),
            new Entry(LinimalFeature.OFFICIAL_FONTS, SettingsPage.THEME,
                    "LINE のフォント設定を有効にする",
                    "再署名した LINE でも、LINE の設定でフォントを選べるようにします。使えるフォントは LINE の契約によります。"),
            new Entry(LinimalFeature.CUSTOM_FONT, SettingsPage.THEME,
                    "カスタムフォントを使う",
                    "「フォントファイルを選択」で取り込んだフォントを使います。LINE の設定のフォントより優先します。"),

            new Entry(LinimalFeature.PUSH_NOTIFICATIONS, SettingsPage.NOTIFICATIONS,
                    "閉じている間も通知を受け取る",
                    "通知の登録で Google に送る署名情報を公式 LINE のものにします。OFF にすると、閉じている間は通知が届かないことがあります。"),
            new Entry(LinimalFeature.GOOGLE_DRIVE_BACKUP, SettingsPage.NOTIFICATIONS,
                    "MicroG-RE で Google ログイン",
                    "Google ログインと Google ドライブのバックアップを MicroG-RE 経由で行います。MicroG-RE に LINE と同じ Google アカウントを追加してください。MicroG-RE がないときは通知で案内します。")));

    private FeatureCatalog() {
    }

    public static List<Entry> entries() {
        return ENTRIES;
    }

    /**
     * 指定ページに属し、かつ patch-status に記録された feature ID を持つ項目だけを返します。
     * ROOT は設定項目を直接持たないため空です。
     */
    public static List<Entry> installedEntriesForPage(
            SettingsPage page, List<String> installedFeatureIds) {
        if (page == null || page == SettingsPage.ROOT) {
            return Collections.emptyList();
        }
        List<Entry> installed = new ArrayList<>();
        if (installedFeatureIds == null) {
            return installed;
        }
        for (Entry entry : ENTRIES) {
            if (entry.getPage() == page && installedFeatureIds.contains(entry.getFeatureId())) {
                installed.add(entry);
            }
        }
        return installed;
    }

    /**
     * 指定ページの表示可能な項目を、小見出し単位にまとめて返します。
     *
     * <p>項目が一つも残らなかった小見出しは Group を作らないため、見出しだけが残りません。
     * 小見出しを持たないページは、section が null の Group を一つだけ返します。</p>
     */
    public static List<Group> installedGroupsForPage(
            SettingsPage page, List<String> installedFeatureIds) {
        List<Group> groups = new ArrayList<>();
        List<Entry> pending = new ArrayList<>();
        SettingsSection pendingSection = null;
        for (Entry entry : installedEntriesForPage(page, installedFeatureIds)) {
            if (!pending.isEmpty() && entry.getSection() != pendingSection) {
                groups.add(new Group(pendingSection, pending));
                pending = new ArrayList<>();
            }
            pendingSection = entry.getSection();
            pending.add(entry);
        }
        if (!pending.isEmpty()) {
            groups.add(new Group(pendingSection, pending));
        }
        return groups;
    }
}
