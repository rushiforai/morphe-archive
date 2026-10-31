package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import java.util.Arrays;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok extends com.bytedance.sdk.component.ycx.pmi<JSONObject, JSONObject> {
    public static final HashSet<String> ycx = new HashSet<>(Arrays.asList("endcardDynamicCreatives", "multiOpenCovert", "speedVideoOrTimer", "openPlayable", "skipToNextAd"));

    /* renamed from: zb, reason: collision with root package name */
    private final kgy f26928zb;

    public ok(kgy kgyVar) {
        this.f26928zb = kgyVar;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx(ycx, new ok(kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        if ("endcardDynamicCreatives".equals(str)) {
            return this.f26928zb.ea(jSONObject);
        }
        if ("multiOpenCovert".equals(str)) {
            this.f26928zb.ok(jSONObject);
            return null;
        }
        if ("skipToNextAd".equals(str)) {
            this.f26928zb.ycx(jSONObject, str);
            return null;
        }
        if ("speedVideoOrTimer".equals(str)) {
            return this.f26928zb.jc(jSONObject);
        }
        if ("openPlayable".equals(str)) {
            return this.f26928zb.jw(jSONObject);
        }
        return null;
    }
}
