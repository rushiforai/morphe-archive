package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import java.util.Arrays;
import java.util.HashSet;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class xkz extends com.bytedance.sdk.component.ycx.pmi<JSONObject, JSONObject> {
    private static final HashSet<String> ycx = new HashSet<>(Arrays.asList("popupShow", "popupDismiss", "changeCountdownStatus", "getCurrentCountdownStatus", "popupRenderDidFinish"));

    /* renamed from: zb, reason: collision with root package name */
    private final kgy f26938zb;

    public xkz(kgy kgyVar) {
        this.f26938zb = kgyVar;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx(ycx, new xkz(kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        str.getClass();
        switch (str) {
            case "popupDismiss":
                this.f26938zb.pmi();
                break;
            case "popupShow":
                this.f26938zb.wie();
                break;
            case "popupRenderDidFinish":
                this.f26938zb.htf();
                break;
            case "changeCountdownStatus":
                this.f26938zb.ry(jSONObject);
                break;
        }
        return null;
    }
}
