package com.bytedance.sdk.openadsdk.component.lud;

import h6.c1;
import java.util.Comparator;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    public static final Comparator<zb> ycx = new Comparator<zb>() { // from class: com.bytedance.sdk.openadsdk.component.lud.zb.1
        @Override // java.util.Comparator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public int compare(zb zbVar, zb zbVar2) {
            return zbVar.lud() != zbVar2.lud() ? Long.compare(zbVar2.lud(), zbVar.lud()) : Long.compare(zbVar2.sya(), zbVar.sya());
        }
    };

    /* renamed from: dj, reason: collision with root package name */
    private final long f24838dj;

    /* renamed from: lt, reason: collision with root package name */
    private final long f24839lt;
    private final long lud;
    private final String sya;

    /* renamed from: ul, reason: collision with root package name */
    private final String f24840ul;

    /* renamed from: zb, reason: collision with root package name */
    private final String f24841zb;

    public zb(String str, String str2, long j11, long j12, long j13, String str3) {
        this.f24841zb = str;
        this.sya = str2;
        this.f24838dj = j11;
        this.lud = j12;
        this.f24839lt = j13;
        this.f24840ul = str3;
    }

    public static zb ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        try {
            return new zb(jSONObject.optString("rit"), jSONObject.optString("material"), jSONObject.optLong("expire_time"), jSONObject.optLong("create_time"), jSONObject.optLong("price"), jSONObject.optString("req_id"));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/JkyIRP2w==", "b9oMhROTecKOa9N+jRKoLXXrOg==", "XfwimCmvZsk=", 54);
            return null;
        }
    }

    public long dj() {
        return this.lud;
    }

    public String lt() {
        return this.f24840ul;
    }

    public long lud() {
        return this.f24839lt;
    }

    public long sya() {
        return this.f24838dj;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("AdCache{mRit=");
        sb2.append(this.f24841zb);
        sb2.append(", mExpireTime=");
        sb2.append(this.f24838dj);
        sb2.append(", mCreateTime=");
        sb2.append(this.lud);
        sb2.append(", mPrice=");
        sb2.append(this.f24839lt);
        sb2.append(", mReqId='");
        return c1.t(sb2, this.f24840ul, AbstractJsonLexerKt.END_OBJ);
    }

    public String zb() {
        return this.sya;
    }

    public JSONObject ycx() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.putOpt("rit", this.f24841zb);
            jSONObject.putOpt("material", this.sya);
            jSONObject.putOpt("expire_time", Long.valueOf(this.f24838dj));
            jSONObject.putOpt("create_time", Long.valueOf(this.lud));
            jSONObject.putOpt("price", Long.valueOf(this.f24839lt));
            jSONObject.putOpt("req_id", this.f24840ul);
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/JkyIRP2w==", "b9oMhROTecKOa9N+jRKoLXXrOg==", "T+EHhgyy", 69);
            return jSONObject;
        }
    }
}
