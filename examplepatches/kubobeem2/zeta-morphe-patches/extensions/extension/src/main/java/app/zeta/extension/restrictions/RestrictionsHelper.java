package app.zeta.extension.restrictions;

import android.util.Log;

/**
 * クライアント側の文字数制限やUI制約を解除するヘルパー
 */
public class RestrictionsHelper {
    private static final String TAG = "ZetaRestrictions";

    /**
     * 最大入力文字数の制限を拡張 (例: 10,000文字)
     */
    public static int getUnlockedMaxLength(int originalMaxLength) {
        Log.d(TAG, "Unlocked max length from " + originalMaxLength + " to 10000");
        return 10000;
    }

    /**
     * クールダウン・待機時間のバイパス判定
     */
    public static boolean shouldBypassCooldown() {
        return true;
    }
}
