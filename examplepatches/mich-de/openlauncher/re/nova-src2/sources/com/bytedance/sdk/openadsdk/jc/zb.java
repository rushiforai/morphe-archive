package com.bytedance.sdk.openadsdk.jc;

import android.os.SystemClock;
import android.text.TextUtils;
import b.c9;
import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.lud.ea;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb<T> implements dy<T> {

    /* renamed from: dj, reason: collision with root package name */
    private final tn f26858dj;
    private final dy<T> sya;
    private final long ycx = SystemClock.elapsedRealtime();

    /* renamed from: zb, reason: collision with root package name */
    private final String f26859zb;

    public zb(final tn tnVar, String str, dy<T> dyVar) {
        this.sya = dyVar;
        this.f26858dj = tnVar;
        this.f26859zb = str;
        com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.jc.zb.1
            @Override // com.bytedance.sdk.openadsdk.pmi.dj
            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarH = c9.h("load_img");
                tn tnVar2 = tnVar;
                if (tnVar2 != null) {
                    ycxVarH.sya(tnVar2.xz("-1"));
                    ycxVarH.dj(oby.sya(tnVar.tz()));
                }
                return ycxVarH;
            }
        });
    }

    @Override // com.bytedance.sdk.component.lud.dy
    public void ycx(ea<T> eaVar) {
        dy<T> dyVar = this.sya;
        if (dyVar != null) {
            dyVar.ycx(eaVar);
        }
        if (this.f26858dj != null) {
            final long jElapsedRealtime = SystemClock.elapsedRealtime() - this.ycx;
            final int iUl = eaVar.ul() / 1024;
            final int i5 = eaVar.lt() ? 1 : 0;
            com.bytedance.sdk.openadsdk.dy.dj.ycx("load_image_success", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.jc.zb.2
                @Override // com.bytedance.sdk.openadsdk.dy.zb
                public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("duration", jElapsedRealtime);
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, zb.this.f26859zb);
                    jSONObject.put("preload_size", iUl);
                    jSONObject.put("local_cache", i5);
                    jSONObject.put("image_mode", zb.this.f26858dj.pk());
                    jSONObject.put("use_new_img", 1);
                    return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("load_image_success").ycx(zb.this.f26858dj.tz()).zb(jSONObject.toString());
                }
            });
            com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.jc.zb.3
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarH = c9.h("load_img");
                    if (zb.this.f26858dj != null) {
                        ycxVarH.sya(zb.this.f26858dj.xz("-1"));
                        ycxVarH.dj(oby.sya(zb.this.f26858dj.tz()));
                    }
                    return ycxVarH;
                }
            });
        }
    }

    @Override // com.bytedance.sdk.component.lud.dy
    public void ycx(final int i5, final String str, Throwable th2) {
        dy<T> dyVar = this.sya;
        if (dyVar != null) {
            dyVar.ycx(i5, str, th2);
        }
        tn tnVar = this.f26858dj;
        if (tnVar != null) {
            if (!TextUtils.isEmpty(oby.ycx(tnVar))) {
                final long jElapsedRealtime = SystemClock.elapsedRealtime() - this.ycx;
                com.bytedance.sdk.openadsdk.dy.dj.ycx("load_image_error", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.jc.zb.4
                    @Override // com.bytedance.sdk.openadsdk.dy.zb
                    public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                        JSONObject jSONObject = new JSONObject();
                        jSONObject.put("duration", jElapsedRealtime);
                        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, zb.this.f26859zb);
                        jSONObject.put("error_code", i5);
                        jSONObject.put("error_message", str);
                        jSONObject.put("image_mode", zb.this.f26858dj.pk());
                        jSONObject.put("use_new_img", 1);
                        return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("load_image_error").ycx(zb.this.f26858dj.tz()).zb(jSONObject.toString());
                    }
                });
            }
            com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.jc.zb.5
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarH = c9.h("load_img");
                    if (zb.this.f26858dj != null) {
                        ycxVarH.sya(zb.this.f26858dj.xz("-1"));
                        ycxVarH.dj(oby.sya(zb.this.f26858dj.tz()));
                    }
                    return ycxVarH;
                }
            });
        }
    }
}
