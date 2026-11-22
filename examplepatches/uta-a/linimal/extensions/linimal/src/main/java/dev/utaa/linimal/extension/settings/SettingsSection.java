package dev.utaa.linimal.extension.settings;

import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * 設定ページ内の小見出しを表します。
 *
 * <p>表示文字列をここに集約し、{@link LinimalSettingsActivity} には見出しの文言を持たせません。
 * 小見出しを持たないページの項目は section を持ちません。</p>
 */
public enum SettingsSection {
    /** 広告ページ。広告の表示です。 */
    ADS_ADS("広告"),
    /** 広告ページ。LINE Premium の案内です。 */
    ADS_PREMIUM("Premium の案内"),
    /** AI 機能ページ。各画面の上部にある入口です。 */
    AGENT_I_SCREEN_HEADERS("画面の上部"),
    /** AI 機能ページ。トーク内にある入口です。 */
    AGENT_I_CHAT("トーク"),
    /** AI 機能ページ。LINE の設定画面にある入口です。 */
    AGENT_I_SETTINGS("設定"),
    /** 表示項目ページ。下部タブの項目です。 */
    HIDE_BOTTOM_TABS("下部タブ"),
    /** 表示項目ページ。トーク一覧の上部にある項目です。 */
    HIDE_CHAT_LIST_HEADER("トーク一覧"),
    /** 表示項目ページ。トークの ＋ メニューの項目です。 */
    HIDE_CHAT_PLUS_MENU("＋メニュー"),
    /** 表示項目ページ。ホーム画面の項目です。 */
    HIDE_HOME("ホーム"),
    /** 既読者ページ。自分が送ったメッセージへの表示です。 */
    READ_RECEIPT_READERS_OWN("自分のメッセージ"),
    /** 既読者ページ。相手が送ったメッセージへの表示です。 */
    READ_RECEIPT_READERS_OTHERS("相手のメッセージ"),
    /** 既読者ページ。一覧を開く操作です。 */
    READ_RECEIPT_READERS_OPEN("一覧の開き方"),
    /** 既読者ページ。既読情報の取得方法です。 */
    READ_RECEIPT_READERS_DATA("同期"),
    /** トークページ。長押しで開くプレビューです。 */
    CHAT_PREVIEW("プレビュー"),
    /** トークページ。リンクの開き方です。 */
    CHAT_LINKS("リンク");

    private final String title;

    SettingsSection(String title) {
        this.title = title;
    }

    /** 小見出しとして表示する文言です。 */
    public String getTitle() {
        return LinimalText.t(title);
    }
}
