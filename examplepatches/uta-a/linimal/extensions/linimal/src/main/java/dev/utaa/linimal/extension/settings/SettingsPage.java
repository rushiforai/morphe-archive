package dev.utaa.linimal.extension.settings;

/**
 * Linimal 設定画面で表示するページを表します。
 */
public enum SettingsPage {
    ROOT,
    ADS,
    AGENT_I,
    HIDE,
    READ_RECEIPT,
    THEME,
    GENERAL;

    /**
     * 保存時に使用する安定したページ識別子を返します。
     */
    public String getId() {
        return name();
    }

    /**
     * 保存されたページ識別子をページへ変換します。未知の値は null です。
     */
    static SettingsPage fromId(String id) {
        if (id == null) {
            return null;
        }

        for (SettingsPage page : values()) {
            if (page.getId().equals(id)) {
                return page;
            }
        }
        return null;
    }
}
