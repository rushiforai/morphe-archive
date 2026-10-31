package com.bytedance.sdk.openadsdk.core.xkz;

import com.bytedance.sdk.openadsdk.core.xkz.sya.ycx;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb extends sya {

    /* renamed from: ea, reason: collision with root package name */
    private long f26490ea;

    /* renamed from: jc, reason: collision with root package name */
    private long f26491jc;

    public zb(int i5, int i11, long j11, long j12, ycx.EnumC0091ycx enumC0091ycx, ycx.zb zbVar, String str, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list2, String str2) {
        super(i5, i11, enumC0091ycx, zbVar, str, list, list2, str2);
        this.f26491jc = j11;
        this.f26490ea = j12;
        this.f26438jw = "icon_click";
    }

    public static zb ycx(JSONObject jSONObject) {
        sya syaVarZb = sya.zb(jSONObject);
        if (syaVarZb == null) {
            return null;
        }
        return new zb(syaVarZb.ycx, syaVarZb.f26442zb, jSONObject.optLong("offset", -1L), jSONObject.optLong("duration", -1L), syaVarZb.sya, syaVarZb.f26435dj, syaVarZb.lud, syaVarZb.f26439lt, syaVarZb.f26441ul, syaVarZb.fby);
    }
}
