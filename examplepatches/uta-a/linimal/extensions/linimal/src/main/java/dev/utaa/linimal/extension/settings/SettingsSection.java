package dev.utaa.linimal.extension.settings;

import dev.utaa.linimal.extension.i18n.LinimalText;

/**
 * 設定ページ内の小見出しを表します。
 *
 * <p>表示文字列をここに集約し、{@link LinimalSettingsActivity} には見出しの文言を持たせません。
 * 小見出しを持たないページの項目は section を持ちません。</p>
 */
public enum SettingsSection {
    /** Agent i・LINE AI ページ。各画面の上部にある入口です。 */
    AGENT_I_SCREEN_HEADERS("各画面の上部"),
    /** Agent i・LINE AI ページ。トーク内にある入口です。 */
    AGENT_I_CHAT("トーク"),
    /** Agent i・LINE AI ページ。LINE の設定画面にある入口です。 */
    AGENT_I_SETTINGS("設定"),

    /** 表示を消すページ。下部タブの項目です。 */
    HIDE_BOTTOM_TABS("下部タブ"),
    /** 表示を消すページ。トーク一覧の上部にある項目です。 */
    HIDE_CHAT_LIST_HEADER("トーク一覧の上部"),
    /** 表示を消すページ。トークの ＋ メニューの項目です。 */
    HIDE_CHAT_PLUS_MENU("トークの ＋ メニュー"),
    /** 表示を消すページ。ホーム画面の項目です。 */
    HIDE_HOME("ホーム");

    private final String title;

    SettingsSection(String title) {
        this.title = title;
    }

    /** 小見出しとして表示する文言です。 */
    public String getTitle() {
        return LinimalText.t(title);
    }
}
