package app.zeta.extension.ads;

import android.util.Log;

/**
 * 広告SDKの呼び出しを遮断するヘルパー
 */
public class AdBlockHelper {
    private static final String TAG = "ZetaAdBlock";

    /**
     * 広告ロード呼び出しをブロック
     * @return 常に true (ブロック済み)
     */
    public static boolean shouldBlockAd(String adUnitId) {
        Log.i(TAG, "Blocked ad request for unit: " + adUnitId);
        return true;
    }

    /**
     * リワード広告やインタースティシャル広告の表示をバイパスし、
     * 即時成功コールバックを実行可能にするヘルパー
     */
    public static void bypassRewardAd() {
        Log.i(TAG, "Bypassing reward ad...");
    }
}
