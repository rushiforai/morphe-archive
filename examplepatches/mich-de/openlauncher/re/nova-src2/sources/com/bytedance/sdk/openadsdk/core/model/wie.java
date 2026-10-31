package com.bytedance.sdk.openadsdk.core.model;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class wie {
    private ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f25859zb;

    public wie(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("easy_playable");
        if (jSONObjectOptJSONObject != null) {
            this.ycx = new ycx(jSONObjectOptJSONObject.optJSONObject("components"));
        }
        JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("popup");
        if (jSONObjectOptJSONObject2 != null) {
            this.f25859zb = new ycx(jSONObjectOptJSONObject2.optJSONObject("components"));
        }
    }

    public static ycx sya(tn tnVar) {
        wie wieVarNa;
        if (tnVar == null || (wieVarNa = tnVar.na()) == null) {
            return null;
        }
        return wieVarNa.ycx;
    }

    public static boolean ycx(tn tnVar) {
        return ycx(tnVar, false);
    }

    public static ycx zb(tn tnVar) {
        wie wieVarNa;
        if (tnVar == null || (wieVarNa = tnVar.na()) == null) {
            return null;
        }
        return wieVarNa.f25859zb;
    }

    public static class ycx {
        C0068ycx ycx;

        /* renamed from: zb, reason: collision with root package name */
        C0068ycx f25860zb;

        /* renamed from: com.bytedance.sdk.openadsdk.core.model.wie$ycx$ycx, reason: collision with other inner class name */
        public static class C0068ycx {
            String ycx;

            public C0068ycx(JSONObject jSONObject) {
                if (jSONObject == null) {
                    return;
                }
                this.ycx = jSONObject.optString("entry");
            }

            public boolean ycx() {
                return !TextUtils.isEmpty(this.ycx);
            }
        }

        public ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return;
            }
            if (jSONObject.has("vertical")) {
                this.ycx = new C0068ycx(jSONObject.optJSONObject("vertical"));
            }
            if (jSONObject.has("horizontal")) {
                this.f25860zb = new C0068ycx(jSONObject.optJSONObject("horizontal"));
            }
        }

        public boolean ycx() {
            C0068ycx c0068ycx = this.f25860zb;
            if (c0068ycx != null && c0068ycx.ycx()) {
                return true;
            }
            C0068ycx c0068ycx2 = this.ycx;
            return c0068ycx2 != null && c0068ycx2.ycx();
        }

        public String ycx(boolean z11) {
            if (z11) {
                C0068ycx c0068ycx = this.ycx;
                if (c0068ycx != null) {
                    return c0068ycx.ycx;
                }
                return b.f42142b;
            }
            C0068ycx c0068ycx2 = this.f25860zb;
            if (c0068ycx2 != null) {
                return c0068ycx2.ycx;
            }
            return b.f42142b;
        }
    }

    public static boolean ycx(tn tnVar, boolean z11) {
        wie wieVarNa;
        if (tnVar == null || (wieVarNa = tnVar.na()) == null) {
            return false;
        }
        if (z11) {
            ycx ycxVar = wieVarNa.f25859zb;
            return ycxVar != null && ycxVar.ycx();
        }
        ycx ycxVar2 = wieVarNa.ycx;
        return ycxVar2 != null && ycxVar2.ycx();
    }
}
