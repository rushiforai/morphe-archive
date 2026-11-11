package e.e.a;

/**
 * Restore the canonical account watch-history endpoint when a tab was saved
 * from an Activity without an Intent data URI. This is deliberately limited
 * to the account-history type: other list URLs must never be rewritten.
 */
public final class TabHistory127 {
    public static final String ACCOUNT_HISTORY =
            "https://nvapi.nicovideo.jp/v2/users/me/watch/history?selectContentType=long&limit=100";

    private TabHistory127() { }

    public static String url(int type, String savedUrl) {
        if (type == 4 && (savedUrl == null || savedUrl.trim().isEmpty()))
            return ACCOUNT_HISTORY;
        return savedUrl;
    }
}
