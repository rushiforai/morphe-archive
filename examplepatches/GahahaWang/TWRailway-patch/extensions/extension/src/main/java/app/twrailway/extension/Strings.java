package app.twrailway.extension;

/** Texts of the patch settings page. The app is Traditional Chinese only for its users. */
final class Strings {
    static final String TITLE = "修補設定";
    static final String SUBTITLE = "TWRailway Patches";

    static final String SECTION_ADS = "廣告與彈窗";
    static final String SECTION_DISPLAY = "顯示";
    static final String SECTION_SEARCH_HISTORY = "搜尋歷史";

    static final String HIDE_ADS = "隱藏廣告";
    static final String HIDE_ADS_SUMMARY = "不載入橫幅、插頁、原生與開啟應用程式廣告，並移除底部廣告空白。已載入的廣告在重新啟動後才會消失。";
    static final String HIDE_REVIEW_PROMPT = "隱藏評分彈窗";
    static final String HIDE_REVIEW_PROMPT_SUMMARY = "不再跳出「喜歡這個App嗎？」請你評分的彈窗。重新啟動 App 後生效。";
    static final String HIDE_UPGRADE_BUTTON = "隱藏付費推廣按鈕";
    static final String HIDE_UPGRADE_BUTTON_SUMMARY = "台鐵與高鐵搜尋頁不再顯示「付費移除廣告」之類的訂閱按鈕。重新啟動 App 後生效。";
    static final String HIDE_PROMOTIONS = "隱藏付費推廣彈窗";
    static final String HIDE_PROMOTIONS_SUMMARY = "不再跳出訂閱優惠、節日特價與「解鎖新功能：桌面小工具」之類的推廣彈窗，介面和付費版一樣乾淨。只隱藏推廣，不會解鎖付費功能。重新啟動 App 後生效。";
    static final String FIX_RECENT_APPS_TITLE = "修正最近使用的 App 標題";
    static final String FIX_RECENT_APPS_TITLE_SUMMARY = "最近使用的 App 畫面顯示「火車時刻表」，而不是 app.titleTra。";
    static final String EXPAND_SEARCH_HISTORY = "展開搜尋歷史";
    static final String EXPAND_SEARCH_HISTORY_SUMMARY = "搜尋頁的「最近搜尋」顯示下方設定的筆數。關閉時恢復 App 原本的行為（3 筆）。重新啟動 App 後生效。";
    static final String SEARCH_HISTORY_LIMIT = "顯示筆數：%d 筆";
    static final String SEARCH_HISTORY_LIMIT_SUMMARY = "App 最多保存 20 筆搜尋歷史。";
    static final String FIX_SEARCH_HISTORY_COUNT = "修正搜尋歷史計數";
    static final String FIX_SEARCH_HISTORY_COUNT_SUMMARY = "「搜尋歷史」旁的計數顯示實際的顯示筆數（例如 (5/20)），並移除「升級」字樣。關閉時恢復 App 原本的「(3/3) 升級」。重新啟動 App 後生效。";

    static final String NOT_APPLIED = "修補時未套用這個 patch。";
    static final String RESTART_NOTE = "標示「重新啟動 App 後生效」的設定，需要重新啟動 App 才會套用。";
    static final String RESTART = "重新啟動 App";
    static final String CLOSE = "關閉";

    private Strings() {
    }
}
