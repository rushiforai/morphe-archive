package dev.utaa.linimal.extension.settings;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.utaa.linimal.extension.config.LinimalFeature;

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
            this.feature = feature;
            this.page = page;
            this.section = section;
            this.title = title;
            this.summary = summary;
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

        public String getTitle() {
            return title;
        }

        public String getSummary() {
            return summary;
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

    private static final List<Entry> ENTRIES = Collections.unmodifiableList(Arrays.asList(
            new Entry(LinimalFeature.SMART_CHANNEL_ADS, SettingsPage.ADS,
                    "Smart Channel の広告を表示しない",
                    "チャット一覧の Smart Channel にある広告を表示しません。"),
            new Entry(LinimalFeature.HOME_TOP_AD, SettingsPage.ADS,
                    "ホーム内の広告を表示しない",
                    "ホーム画面内にある Performance Ad とフィード広告を表示しません。"),

            new Entry(LinimalFeature.AGENT_I_HOME_HEADER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SCREEN_HEADERS,
                    "ホーム上部の Agent i を表示しない",
                    "ホーム画面上部にある Agent i の入口を表示しません。"),
            new Entry(LinimalFeature.AGENT_I_WALLET_HEADER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SCREEN_HEADERS,
                    "ウォレット上部の Agent i を表示しない",
                    "ウォレット画面上部にある Agent i の入口を表示しません。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SCREEN_HEADERS,
                    "トーク一覧の検索欄の Agent i を表示しない",
                    "トーク一覧上部の検索欄にある Agent i の入口を表示しません。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_INFORMATION, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "チャット情報の Agent i を表示しない",
                    "チャット情報画面にある Agent i の入口を表示しません。"),
            new Entry(LinimalFeature.AGENT_I_CHAT_COMPOSER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "チャット入力欄の Agent i を表示しない",
                    "チャット入力欄にある Agent i の入口を表示しません。"),
            new Entry(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "メッセージ長押しメニューの LINE AI を表示しない",
                    "メッセージの長押しメニューにある画像編集用の LINE AI と、画像メッセージ横の LINE AI ボタンを表示しません。"),
            new Entry(LinimalFeature.LINE_AI_GALLERY_VIEWER, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_CHAT,
                    "写真・動画表示画面の LINE AI を表示しない",
                    "チャットの写真・動画表示画面にある LINE AI の入口を表示しません。"),
            new Entry(LinimalFeature.AGENT_I_SETTINGS, SettingsPage.AGENT_I,
                    SettingsSection.AGENT_I_SETTINGS,
                    "設定画面の Agent i を表示しない",
                    "LINE の設定画面にある Agent i の入口を表示しません。"),

            new Entry(LinimalFeature.VOOM, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "VOOM を表示しない",
                    "下部タブから VOOM を取り除きます。"),
            new Entry(LinimalFeature.SHOPPING, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "ショッピングを表示しない",
                    "下部タブからショッピングを取り除きます。"),
            new Entry(LinimalFeature.NEWS, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "ニュースを表示しない",
                    "下部タブからニュースを取り除きます。"),
            new Entry(LinimalFeature.WALLET, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "ウォレットを表示しない",
                    "下部タブからウォレットを取り除きます。"),
            new Entry(LinimalFeature.MINI, SettingsPage.HIDE,
                    SettingsSection.HIDE_BOTTOM_TABS,
                    "アプリを表示しない",
                    "下部タブからアプリを取り除きます。"),
            new Entry(LinimalFeature.CHAT_LIST_HEADER_AI_FRIENDS, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_LIST_HEADER,
                    "AI Friends を表示しない",
                    "トーク一覧の上部にある AI Friends のアイコンを表示しません。"),
            new Entry(LinimalFeature.CHAT_LIST_HEADER_CALENDAR, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_LIST_HEADER,
                    "カレンダーを表示しない",
                    "トーク一覧の上部にあるカレンダーのアイコンを表示しません。"),
            new Entry(LinimalFeature.CHAT_LIST_HEADER_OPEN_CHAT, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_LIST_HEADER,
                    "オープンチャットを表示しない",
                    "トーク一覧の上部にあるオープンチャットのアイコンを表示しません。"),
            new Entry(LinimalFeature.CHAT_CALENDAR, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_PLUS_MENU,
                    "カレンダーを表示しない",
                    "チャットの + メニューからカレンダーを取り除きます。"),
            new Entry(LinimalFeature.CHAT_LINE_GIFT, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_PLUS_MENU,
                    "LINE ギフトを表示しない",
                    "チャットの + メニューから LINE ギフトを取り除きます。"),
            new Entry(LinimalFeature.CHAT_LINE_PAY, SettingsPage.HIDE,
                    SettingsSection.HIDE_CHAT_PLUS_MENU,
                    "LINE Pay を表示しない",
                    "チャットの + メニューから LINE Pay を取り除きます。"),
            new Entry(LinimalFeature.HOME_RECOMMENDATIONS, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "おすすめを表示しない",
                    "ホームのおすすめ枠を表示しません。"),
            new Entry(LinimalFeature.HOME_TRENDING, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "話題を表示しない",
                    "ホームの話題・トレンド枠を表示しません。"),
            new Entry(LinimalFeature.HOME_FEED_POST_CARDS, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "ホームの投稿カードを表示しない",
                    "ホーム下部にある投稿カードを表示しません。"),
            new Entry(LinimalFeature.HOME_FEATURED_COLLECTIONS, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "特集枠を表示しない",
                    "ホームの特集枠にある動画のグリッドを表示しません。"),
            new Entry(LinimalFeature.HOME_RECENT_HISTORY, SettingsPage.HIDE,
                    SettingsSection.HIDE_HOME,
                    "最近の履歴を表示しない",
                    "ホーム上部にある最近使用したサービスの枠を表示しません。"),

            new Entry(LinimalFeature.READ_WITHOUT_RECEIPT, SettingsPage.READ_RECEIPT,
                    "既読をつけずに読むをメニューに追加",
                    "トーク一覧の長押しメニューに追加します。そこから開いたトークは未読を維持し、"
                            + "上部に案内を表示します。送信後の既読は下の設定で選べます。"),
            new Entry(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT, SettingsPage.READ_RECEIPT,
                    "通知から既読をつけずに開く",
                    "メッセージ通知から開いたトークは未読を維持し、上部に案内を表示します。送信後の既読は下の設定で選べます。"),

            new Entry(LinimalFeature.PREMIUM, SettingsPage.GENERAL,
                    "Premium の案内を表示しない",
                    "送信取消時に出る LINE Premium の案内を表示しません。"),
            new Entry(LinimalFeature.PREMIUM_SETTINGS_ROW, SettingsPage.GENERAL,
                    "設定のプレミアムを表示しない",
                    "LINE の設定画面にある LINE Premium の行を表示しません。"),
            new Entry(LinimalFeature.PREMIUM_PREVIEW_PROMOTION, SettingsPage.GENERAL,
                    "プレビューの Premium の案内を表示しない",
                    "トーク一覧の長押しで開くスクロールプレビューにある LINE Premium の案内とメニューの行を表示しません。"),
            new Entry(LinimalFeature.PREVIEW_SCROLL, SettingsPage.GENERAL,
                    "プレビューをスクロール可能にする",
                    "トーク一覧の長押しで開くプレビューをスクロール可能にします。プレビュー自体の提供や Premium の契約状態は変わりません。"),
            new Entry(LinimalFeature.EXTERNAL_BROWSER, SettingsPage.GENERAL,
                    "リンクを外部ブラウザで開く",
                    "通常の http/https のみ外部ブラウザへ渡します。ログインや決済は元のまま開きます。"),
            new Entry(LinimalFeature.PUSH_NOTIFICATIONS, SettingsPage.GENERAL,
                    "アプリを閉じていても通知を受け取る",
                    "通知の登録時に Google へ送る署名情報を公式 LINE のものに置き換えます。"
                            + "OFF にすると、アプリを閉じている間は通知が届かないことがあります。"),
            new Entry(LinimalFeature.GOOGLE_DRIVE_BACKUP, SettingsPage.GENERAL,
                    "MicroG-RE で Google ログインとバックアップを行う",
                    "Google アカウントでのログインと、Google ドライブへのバックアップ・復元の認証を MicroG-RE 経由で行います。"
                            + "MicroG-RE を導入し、LINE と同じ Google アカウントを MicroG-RE に追加してください。"
                            + "MicroG-RE がないときは導入を案内する通知を出します。")));

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
