package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea extends com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject> {
    private final kgy ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f26924zb;

    public ea(kgy kgyVar, String str) {
        this.ycx = kgyVar;
        this.f26924zb = str;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx("endcardDynamicCreatives", new ea(kgyVar, "endcardDynamicCreatives"));
        sycVar.ycx("multiOpenCovert", new ea(kgyVar, "multiOpenCovert"));
        sycVar.ycx("skipToNextAd", new ea(kgyVar, "skipToNextAd"));
        sycVar.ycx("speedVideoOrTimer", new ea(kgyVar, "speedVideoOrTimer"));
        sycVar.ycx("openPlayable", new ea(kgyVar, "openPlayable"));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        if ("endcardDynamicCreatives".equals(this.f26924zb)) {
            return this.ycx.ea(jSONObject);
        }
        if ("multiOpenCovert".equals(this.f26924zb)) {
            this.ycx.ok(jSONObject);
            return null;
        }
        if ("skipToNextAd".equals(this.f26924zb)) {
            this.ycx.ycx(jSONObject, this.f26924zb);
            return null;
        }
        if ("speedVideoOrTimer".equals(this.f26924zb)) {
            return this.ycx.jc(jSONObject);
        }
        if ("openPlayable".equals(this.f26924zb)) {
            return this.ycx.jw(jSONObject);
        }
        return null;
    }
}
