package com.bytedance.sdk.openadsdk.sya;

import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.tn;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    private static volatile zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final tn<com.bytedance.sdk.openadsdk.dj.ycx> f27026zb = pmi.sya();

    private zb() {
    }

    public static zb ycx() {
        if (ycx == null) {
            synchronized (zb.class) {
                try {
                    if (ycx == null) {
                        ycx = new zb();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public void ycx(String str, List<FilterWord> list, String str2) {
        ycx(str, list, null, null, str2);
    }

    public void ycx(String str, List<FilterWord> list, JSONObject jSONObject, String str2, String str3) {
        this.f27026zb.ycx(str, list, jSONObject, str2, str3);
    }
}
