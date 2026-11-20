package app.richyss.extension;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.util.Log;

import org.json.JSONObject;

/**
 * Entry point called from Discord's Application.onCreate() by the Richyss Bridge
 * patch. It prepares the bridge storage and records the client version so Richyss
 * can report exactly which Discord build is patched.
 */
public final class BridgeInit {
    private static final String TAG = "RichyssBridge";

    private BridgeInit() {
    }

    public static void initialize(Context context) {
        if (context == null) {
            return;
        }
        try {
            BridgeStore store = BridgeStore.forContext(context);
            JSONObject meta = new JSONObject();
            meta.put("bridgeVersion", BridgeProtocol.VERSION);
            meta.put("protocol", BridgeProtocol.PROTOCOL);
            meta.put("discordVersion", versionName(context));
            meta.put("initializedAt", System.currentTimeMillis());
            store.writeMeta(meta);
            store.purgeExpired();
            Log.i(TAG, "Bridge ready (v" + BridgeProtocol.VERSION + ")");
        } catch (Exception e) {
            // A failure here must never prevent Discord from starting.
            Log.w(TAG, "Bridge initialisation failed", e);
        }
    }

    private static String versionName(Context context) {
        try {
            PackageInfo info = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0);
            return info.versionName == null ? "" : info.versionName;
        } catch (Exception e) {
            return "";
        }
    }
}
