package com.bytedance.sdk.openadsdk.core.jc;

import com.bytedance.sdk.openadsdk.utils.yzp;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class xkz implements com.bytedance.adsdk.ugeno.core.pmi, com.bytedance.sdk.component.adexpress.zb.jw {

    /* renamed from: dj, reason: collision with root package name */
    private final String f25509dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f25510lt;
    private long lud;
    private final com.bytedance.sdk.openadsdk.core.model.tn sya;
    private final com.bytedance.sdk.openadsdk.dj.dj.lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f25511zb;

    public xkz(com.bytedance.sdk.openadsdk.dj.dj.lud ludVar, String str, com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str2, boolean z11) {
        this.ycx = ludVar;
        this.f25511zb = str;
        this.f25509dj = str2;
        this.sya = tnVar;
        this.f25510lt = z11;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void dj() {
        this.ycx.ycx();
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void fby() {
        this.ycx.xkz();
    }

    public void jc() {
        this.ycx.jc();
        this.ycx.ea();
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void jw() {
        this.ycx.zb();
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void lt(int i5) {
        final String str;
        if (i5 == 3) {
            this.ycx.ul("dynamic_render2_success");
            str = "dynamic2_render";
        } else {
            this.ycx.ul("dynamic_render_success");
            str = "dynamic_backup_native_render";
        }
        this.ycx.ycx(true);
        yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("dynamic_success") { // from class: com.bytedance.sdk.openadsdk.core.jc.xkz.1
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.openadsdk.dj.sya.zb(xkz.this.sya, xkz.this.f25511zb, str, (JSONObject) null);
            }
        }, 10);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void lud() {
        this.ycx.zb();
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void sya(int i5) {
        if (i5 == 3) {
            this.ycx.dj("dynamic_sub_analysis2_end");
        } else {
            this.ycx.dj("dynamic_sub_analysis_end");
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void ul(int i5) {
        this.ycx.ycx(i5);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void dj(int i5) {
        if (i5 == 3) {
            this.ycx.dj("dynamic_sub_render2_start");
        } else {
            this.ycx.dj("dynamic_sub_render_start");
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void lud(int i5) {
        if (i5 == 3) {
            this.ycx.dj("dynamic_sub_render2_end");
        } else {
            this.ycx.dj("dynamic_sub_render_end");
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void ul() {
        this.ycx.ry();
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void ycx(boolean z11, int i5) {
        this.ycx.ycx(z11 ? 1 : 0, i5);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void zb(int i5) {
        if (i5 == 3) {
            this.ycx.dj("dynamic_sub_analysis2_start");
        } else {
            this.ycx.dj("dynamic_sub_analysis_start");
        }
    }

    @Override // com.bytedance.adsdk.ugeno.core.pmi
    public void sya() {
        this.ycx.lud("ugen_sub_render_start");
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void ycx(int i5, String str) throws JSONException {
        this.ycx.ycx(i5, str);
        ok.ycx("Web", i5, str, this.f25511zb, this.f25509dj, this.sya);
    }

    @Override // com.bytedance.adsdk.ugeno.core.pmi
    public void zb() {
        this.ycx.lud("ugen_sub_analysis_end");
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void ycx(int i5) {
        this.lud = System.currentTimeMillis();
        if (i5 == 3) {
            this.ycx.sya("dynamic_render2_start");
        } else {
            this.ycx.sya("dynamic_render_start");
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void lt() {
        this.ycx.ycx(true);
        this.ycx.ok();
        yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("native_success") { // from class: com.bytedance.sdk.openadsdk.core.jc.xkz.2
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.openadsdk.dj.sya.zb(xkz.this.sya, xkz.this.f25511zb, "dynamic_backup_render", (JSONObject) null);
            }
        }, 10);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jw
    public void ycx(int i5, int i11, String str, boolean z11) throws JSONException {
        if (!z11) {
            this.ycx.ycx(true);
        }
        if (i5 == 3) {
            this.ycx.zb(i11, "dynamic_render2_error");
        } else {
            this.ycx.zb(i11, "dynamic_render_error");
        }
        ok.ycx("NDR", i11, str, this.f25511zb, this.f25509dj, this.sya);
    }

    @Override // com.bytedance.adsdk.ugeno.core.pmi
    public void ycx() {
        this.ycx.ycx("ugen_render_start", this.f25510lt);
        this.ycx.lud("ugen_sub_analysis_start");
    }

    @Override // com.bytedance.adsdk.ugeno.core.pmi
    public void ycx(com.bytedance.adsdk.ugeno.core.wie wieVar) throws JSONException {
        if (wieVar.ycx() == 0) {
            this.ycx.lud("ugen_sub_render_end");
            this.ycx.lt("ugen_render_success");
        } else {
            this.ycx.sya(wieVar.ycx(), "ugen_render_error");
            ok.ycx("UGen", wieVar.ycx(), wieVar.zb(), this.f25511zb, this.f25509dj, this.sya);
        }
        this.ycx.ycx(true);
    }
}
