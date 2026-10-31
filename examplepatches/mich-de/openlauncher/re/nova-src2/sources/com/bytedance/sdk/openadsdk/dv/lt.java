package com.bytedance.sdk.openadsdk.dv;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public interface lt {
    Handler dj();

    boolean fby();

    JSONObject lt();

    String lud();

    String sya();

    Map<String, String> ul();

    HandlerThread ycx(String str, int i5);

    ExecutorService ycx();

    JSONObject ycx(JSONObject jSONObject);

    Context zb();
}
