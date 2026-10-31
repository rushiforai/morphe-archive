package com.bytedance.sdk.openadsdk.pmi;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.syc;
import org.json.JSONObject;

/* loaded from: classes2.dex */
class lud implements dj {

    /* renamed from: dj, reason: collision with root package name */
    private int f26966dj;
    private int lud;
    private int sya;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private dj f26967zb;

    public lud(dj djVar, int i5, int i11, int i12) {
        this.ycx = Integer.MIN_VALUE;
        this.f26967zb = djVar;
        this.sya = i5;
        this.f26966dj = i11;
        this.lud = i12;
        Context contextYcx = ycx.ycx();
        if (contextYcx != null) {
            this.ycx = pmi.sya(contextYcx);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.pmi.dj
    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
        com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarYcx = this.f26967zb.ycx();
        ycxVarYcx.ycx(BuildConfig.VERSION_NAME);
        ycxVarYcx.ycx(this.sya);
        ycxVarYcx.zb(this.f26966dj);
        ycxVarYcx.sya(this.lud);
        ycxVarYcx.lt(jc.zb().ul());
        ycxVarYcx.dj(syc.dj());
        String strSya = ycxVarYcx.sya();
        if (this.ycx != Integer.MIN_VALUE && ("get_ad".equals(strSya) || "dislike".equals(strSya) || "settings_fetch".equals(strSya) || "reward".equals(strSya) || "strategy_fetch".equals(strSya))) {
            try {
                String strRy = ycxVarYcx.ry();
                JSONObject jSONObject = TextUtils.isEmpty(strRy) ? new JSONObject() : new JSONObject(strRy);
                jSONObject.put("nt", this.ycx);
                ycxVarYcx.ul(jSONObject.toString());
                return ycxVarYcx;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EeriFP4T8=", "duEjnBeze+qPTtJRqxSuLUnvOZoRi3vGkFrSTw==", "XOsjkBG9fciSZ9hZiR0=", 68);
            }
        }
        return ycxVarYcx;
    }
}
