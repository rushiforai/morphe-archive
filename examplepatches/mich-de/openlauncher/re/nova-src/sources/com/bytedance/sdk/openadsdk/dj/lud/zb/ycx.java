package com.bytedance.sdk.openadsdk.dj.lud.zb;

import com.bytedance.sdk.openadsdk.core.model.tn;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private JSONObject f26560dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f26561lt = false;
    private sya lud;
    private JSONObject sya;
    private tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f26562zb;

    public ycx(tn tnVar, String str, JSONObject jSONObject, JSONObject jSONObject2) {
        this.ycx = tnVar;
        this.f26562zb = str;
        this.sya = jSONObject;
        this.f26560dj = jSONObject2;
    }

    public JSONObject dj() {
        if (this.f26560dj == null) {
            this.f26560dj = new JSONObject();
        }
        return this.f26560dj;
    }

    public boolean lt() {
        return this.f26561lt;
    }

    public sya lud() {
        return this.lud;
    }

    public JSONObject sya() {
        if (this.sya == null) {
            this.sya = new JSONObject();
        }
        return this.sya;
    }

    public void ul() {
        sya syaVar = this.lud;
        if (syaVar != null) {
            syaVar.ycx(this);
        }
    }

    public tn ycx() {
        return this.ycx;
    }

    public String zb() {
        return this.f26562zb;
    }

    public void ycx(sya syaVar) {
        this.lud = syaVar;
    }

    public void ycx(boolean z11) {
        this.f26561lt = z11;
    }
}
