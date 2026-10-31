package com.tiktok.util;

import android.text.TextUtils;
import com.tiktok.TikTokBusinessSdk;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public class LastSessionUtil {
    private static final String KEY_LAST_SESSION_ID = "last_session_id";
    private static final String KEY_LAST_SESSION_TIME = "last_session_time";
    private static volatile String sLastSessionId;
    private static volatile String sLastSessionTime;
    private static final TTLogger sLogger = new TTLogger("LastSessionUtil", TikTokBusinessSdk.getLogLevel());
    private static volatile TTKeyValueStore sStore;

    static {
        initSPWhenNull();
    }

    public static String getLastSessionID() {
        initSPWhenNull();
        return sLastSessionId;
    }

    public static String getLastSessionTime() {
        initSPWhenNull();
        return sLastSessionTime;
    }

    private static void initSPWhenNull() {
        try {
            if (sStore == null) {
                synchronized (LastSessionUtil.class) {
                    try {
                        if (sStore == null) {
                            sStore = new TTKeyValueStore(TikTokBusinessSdk.getApplicationContext());
                            if (sStore != null) {
                                String str = sStore.get(KEY_LAST_SESSION_ID);
                                String str2 = sStore.get(KEY_LAST_SESSION_TIME);
                                if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
                                    sLastSessionId = str;
                                    sLastSessionTime = str2;
                                }
                                sLogger.info("Last session id: %s, time: %s", sLastSessionId, sLastSessionTime);
                            }
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
        } catch (Throwable unused) {
        }
    }

    public static void inject2RequestParam(JSONObject jSONObject) {
        initSPWhenNull();
        if (jSONObject != null) {
            try {
                String lastSessionID = getLastSessionID();
                String lastSessionTime = getLastSessionTime();
                if (TextUtils.isEmpty(lastSessionID) || TextUtils.isEmpty(lastSessionTime)) {
                    return;
                }
                JSON.putObject(jSONObject, "last_app_session_id", lastSessionID);
                JSON.putObject(jSONObject, "last_app_session_start_time", lastSessionTime);
            } catch (Throwable unused) {
            }
        }
    }

    public static void setLast(String str) {
        initSPWhenNull();
        try {
            if (TextUtils.isEmpty(str)) {
                return;
            }
            TTKeyValueStore tTKeyValueStore = sStore;
            if (tTKeyValueStore != null) {
                tTKeyValueStore.set(KEY_LAST_SESSION_ID, str);
                tTKeyValueStore.set(KEY_LAST_SESSION_TIME, TimeUtil.getISO8601Timestamp());
            }
            sLogger.info("set last session id: %s", str);
        } catch (Throwable unused) {
        }
    }
}
