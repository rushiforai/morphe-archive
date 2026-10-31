package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import com.bytedance.sdk.openadsdk.dv.zb;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {
    public static final fby ycx = new fby();

    /* renamed from: zb, reason: collision with root package name */
    private static final zb.ycx<fby> f26743zb = new zb.ycx<fby>() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.fby.1
        @Override // com.bytedance.sdk.openadsdk.dv.zb.ycx
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public fby zb(String str) {
            return new fby(str);
        }
    };

    /* renamed from: dj, reason: collision with root package name */
    private final ycx f26744dj;
    private final ycx lud;
    private final ycx sya;

    public fby(String str) {
        ycx ycxVar = new ycx(1, 50);
        this.sya = ycxVar;
        ycx ycxVar2 = new ycx(1, 50);
        this.f26744dj = ycxVar2;
        ycx ycxVar3 = new ycx(3, 50);
        this.lud = ycxVar3;
        try {
            JSONObject jSONObject = new JSONObject(str);
            ycxVar.ycx(jSONObject.optJSONObject("al_hi"));
            ycxVar2.ycx(jSONObject.optJSONObject("al_no"));
            ycxVar3.ycx(jSONObject.optJSONObject("st_no"));
        } catch (JSONException unused) {
        }
    }

    private static fby dj() {
        return (fby) com.bytedance.sdk.openadsdk.dv.lud.ycx("olog_config", ycx, f26743zb);
    }

    public static com.bytedance.sdk.component.lt.ycx.dj.zb.ycx sya() {
        return dj().lud.ycx();
    }

    public static com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycx() {
        return dj().sya.ycx();
    }

    public static com.bytedance.sdk.component.lt.ycx.dj.zb.ycx zb() {
        return dj().f26744dj.ycx();
    }

    public static class ycx {
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public int f26745zb;

        public ycx(int i5, int i11) {
            this.ycx = i5;
            this.f26745zb = i11;
        }

        public String toString() {
            return super.toString();
        }

        public void ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return;
            }
            this.ycx = jSONObject.optInt("m_c_c", this.ycx);
            this.f26745zb = jSONObject.optInt("b_u_m_c", this.f26745zb);
        }

        public com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycx() {
            return com.bytedance.sdk.component.lt.ycx.dj.zb.ycx.ycx(this.ycx, this.f26745zb);
        }
    }

    private fby() {
        this.sya = new ycx(1, 50);
        this.f26744dj = new ycx(1, 50);
        this.lud = new ycx(3, 50);
    }
}
