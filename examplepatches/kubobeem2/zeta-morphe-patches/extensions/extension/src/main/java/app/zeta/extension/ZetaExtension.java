package app.zeta.extension;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import app.zeta.extension.hermes.HermesMemoryManager;
import app.zeta.extension.tps.TpsMonitor;
import app.zeta.extension.ui.FloatingOverlay;

/**
 * Zeta Morphe Extension メインフック
 * アプリの起動時 (Activity.onCreate / onResume) に注入され、
 * Hermes Memory、LLM t/s モニター、フローティングHUDを初期化・接続します。
 */
public class ZetaExtension {
    private static final String TAG = "ZetaExtension";
    private static boolean initialized = false;

    /**
     * Activity.onCreate 直後に呼ばれる初期化メソッド
     */
    public static void init(Activity activity) {
        if (activity == null) return;
        try {
            Context context = activity.getApplicationContext();

            if (!initialized) {
                Log.i(TAG, "Initializing Zeta Morphe Extension...");
                HermesMemoryManager.getInstance().init(context);
                TpsMonitor.getInstance().init();
                initialized = true;
            }

            // UIオーバーレイを現在のアクティビティにアタッチ
            activity.runOnUiThread(() -> {
                try {
                    FloatingOverlay.getInstance().attach(activity);
                } catch (Throwable t) {
                    Log.e(TAG, "Failed to attach FloatingOverlay: " + t.getMessage(), t);
                }
            });

        } catch (Throwable t) {
            Log.e(TAG, "Failed to initialize ZetaExtension: " + t.getMessage(), t);
        }
    }

    /**
     * Context のみ渡されるエントリポイント
     */
    public static void init(Context context) {
        if (context == null) return;
        try {
            if (!initialized) {
                Log.i(TAG, "Initializing Zeta Morphe Extension (Context only)...");
                HermesMemoryManager.getInstance().init(context);
                TpsMonitor.getInstance().init();
                initialized = true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to init context: " + t.getMessage(), t);
        }
    }
}
