package com.tiktok.util;

import org.json.JSONObject;

/* loaded from: classes4.dex */
public class NetworkTimeout {
    private static final int DEF_CONFIG_TIME = 2000;
    private static final int DEF_EVENT_TIME = 10000;
    public static volatile int sConfigTime = 2000;
    public static volatile int sEventTime = 10000;

    public static void updateConfig(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        sConfigTime = JSON.getInt(jSONObject, "network_timeout_config_interval", 2000);
        sEventTime = JSON.getInt(jSONObject, "network_timeout_event_interval", DEF_EVENT_TIME);
    }
}
