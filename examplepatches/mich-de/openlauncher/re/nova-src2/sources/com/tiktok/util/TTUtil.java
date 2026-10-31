package com.tiktok.util;

import android.content.Context;
import android.os.Looper;
import android.text.TextUtils;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.TikTokBusinessSdk;
import com.tiktok.appevents.TTCrashHandler;
import com.tiktok.appevents.edp.Sensig;
import java.util.Arrays;
import java.util.UUID;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class TTUtil {
    private static final TTLogger logger = new TTLogger("TTUtil", TikTokBusinessSdk.getLogLevel());

    public static void checkThread(String str) {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            TTCrashHandler.handleCrash(str, new IllegalStateException("Current method should be called in a non-main thread"), 2);
        }
    }

    public static JSONObject getMetaException(Throwable th2, Long l9, int i5) {
        JSONObject metaWithTS = getMetaWithTS(l9);
        try {
            JSON.putObject(metaWithTS, "ex_sdk_version", SystemInfoUtil.getSDKVersion());
        } catch (Throwable unused) {
        }
        if (th2 == null) {
            JSON.putBoolean(metaWithTS, "success", true);
            return metaWithTS;
        }
        while (th2.getCause() != null && th2.getCause() != th2) {
            th2 = th2.getCause();
        }
        JSON.putObject(metaWithTS, "ex_class", th2.getStackTrace()[0].getClassName());
        JSON.putObject(metaWithTS, "ex_method", th2.getStackTrace()[0].getMethodName());
        JSON.putObject(metaWithTS, "ex_args", th2.getStackTrace()[0].getFileName() + " " + th2.getStackTrace()[0].getLineNumber());
        JSON.putObject(metaWithTS, "ex_msg", th2.getMessage());
        JSON.putInt(metaWithTS, "ex_type", i5);
        String[] strArr = new String[15];
        for (int i11 = 0; i11 < 15; i11++) {
            if (th2.getStackTrace()[i11] != null) {
                strArr[i11] = th2.getStackTrace()[i11].toString();
            }
        }
        JSON.putObject(metaWithTS, "ex_stack", Arrays.toString(strArr));
        JSON.putBoolean(metaWithTS, "success", false);
        return metaWithTS;
    }

    public static JSONObject getMetaWithTS(Long l9) {
        if (l9 == null) {
            l9 = Long.valueOf(System.currentTimeMillis());
        }
        JSONObject jSONObjectBuild = JSON.build();
        JSON.putLong(jSONObjectBuild, "ts", l9.longValue());
        return jSONObjectBuild;
    }

    public static JSONObject getMonitorException(Throwable th2, Long l9, int i5) {
        JSONObject jSONObjectBuild = JSON.build();
        try {
            JSON.putObject(jSONObjectBuild, TTConst.TRACK_TYPE, "exception");
            JSON.putObject(jSONObjectBuild, PendingUpgradeStore.KEY_NAME, "exception");
            JSON.putObject(jSONObjectBuild, "meta", getMetaException(th2, l9, i5));
            JSON.putObject(jSONObjectBuild, "extra", null);
        } catch (Throwable unused) {
        }
        return jSONObjectBuild;
    }

    public static String getOrGenAnoId(Context context, boolean z11) {
        try {
            TTKeyValueStore tTKeyValueStore = new TTKeyValueStore(context);
            String str = tTKeyValueStore.get(TTConst.TTSDK_APP_ANONYMOUS_ID);
            if (!TextUtils.isEmpty(str) && !z11) {
                return str;
            }
            String string = UUID.randomUUID().toString();
            tTKeyValueStore.set(TTConst.TTSDK_APP_ANONYMOUS_ID, string);
            logger.info("AnonymousId reset to " + string, new Object[0]);
            return string;
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static Sensig getSensigInfo(Context context) {
        try {
            TTKeyValueStore tTKeyValueStore = new TTKeyValueStore(context);
            return new Sensig(tTKeyValueStore.getInt(TTConst.TTSDK_APP_SENSIG_VERSION), tTKeyValueStore.get(TTConst.TTSDK_APP_SENSIG_LIST));
        } catch (Throwable unused) {
            return null;
        }
    }

    public static void setSensigInfo(Context context, Sensig sensig) {
        if (sensig == null) {
            return;
        }
        try {
            TTKeyValueStore tTKeyValueStore = new TTKeyValueStore(context);
            tTKeyValueStore.set(TTConst.TTSDK_APP_SENSIG_VERSION, Integer.valueOf(sensig.version));
            tTKeyValueStore.set(TTConst.TTSDK_APP_SENSIG_LIST, sensig.regexList);
        } catch (Throwable unused) {
        }
    }
}
