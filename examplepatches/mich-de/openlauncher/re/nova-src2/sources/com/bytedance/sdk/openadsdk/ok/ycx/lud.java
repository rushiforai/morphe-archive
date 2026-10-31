package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud extends com.bytedance.sdk.component.ycx.pmi<JSONObject, JSONObject> {
    public static final HashSet<String> ycx = new HashSet<>(Arrays.asList("getTemplateInfo", "initRenderFinish", "requestPauseVideo", "videoFrameChanged"));

    /* renamed from: zb, reason: collision with root package name */
    private final kgy f26927zb;

    public lud(kgy kgyVar) {
        this.f26927zb = kgyVar;
    }

    private void dj() {
        kgy kgyVar = this.f26927zb;
        if (kgyVar != null) {
            kgyVar.jw();
        }
    }

    private String sya() {
        kgy kgyVar = this.f26927zb;
        return kgyVar != null ? kgyVar.lud(false) : b.f42142b;
    }

    private void zb(JSONObject jSONObject) {
        kgy kgyVar;
        if (jSONObject == null || (kgyVar = this.f26927zb) == null) {
            return;
        }
        kgyVar.lud(jSONObject);
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx(ycx, new lud(kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        str.getClass();
        switch (str) {
            case "initRenderFinish":
                dj();
                break;
            case "videoFrameChanged":
                zb(jSONObject);
                break;
            case "requestPauseVideo":
                ycx(jSONObject);
                break;
        }
        return null;
    }

    private void ycx(JSONObject jSONObject) {
        kgy kgyVar;
        if (jSONObject == null || (kgyVar = this.f26927zb) == null) {
            return;
        }
        kgyVar.dj(jSONObject);
    }
}
