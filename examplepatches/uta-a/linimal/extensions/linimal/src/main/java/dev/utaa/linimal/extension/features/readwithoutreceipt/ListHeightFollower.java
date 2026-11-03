package dev.utaa.linimal.extension.features.readwithoutreceipt;

/**
 * 一覧が縮んだ量を、見えていた下端を維持するためのスクロール量へ変換します。
 *
 * <p>LINE は最新メッセージが見えている場合しか一覧を追従させません。既読なし閲覧では未読の位置で
 * 開くことがあり、キーボードを出すと表示中のメッセージが隠れるため、この間だけ補います。
 * 広がるときは RecyclerView が下の行を表示するので、スクロールしません。</p>
 */
final class ListHeightFollower {
    private static final int UNKNOWN = -1;

    private int lastHeight = UNKNOWN;

    /** 高さを観測し、下へ送る量を返します。初回と未レイアウトの観測では 0 を返します。 */
    int onHeight(int height) {
        if (height <= 0) {
            return 0;
        }
        int previous = lastHeight;
        lastHeight = height;
        return previous == UNKNOWN ? 0 : Math.max(0, previous - height);
    }

    void reset() {
        lastHeight = UNKNOWN;
    }
}
