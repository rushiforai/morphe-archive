package com.bytedance.sdk.openadsdk.core.jc;

import android.content.Context;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class ul extends com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final Runnable f25504dj;
    private final com.bytedance.sdk.component.fby.zb.sya sya;
    private final com.bytedance.sdk.component.adexpress.zb.ry ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.ul f25505zb;

    public ul(Context context, boolean z11, com.bytedance.sdk.component.adexpress.dynamic.lud.fby fbyVar, com.bytedance.sdk.component.adexpress.zb.ry ryVar, com.bytedance.sdk.component.adexpress.dynamic.lt.ycx ycxVar) {
        super(context, z11, fbyVar, ryVar, ycxVar);
        this.sya = new com.bytedance.sdk.component.fby.zb.sya("dynamic_render_template") { // from class: com.bytedance.sdk.openadsdk.core.jc.ul.1
            @Override // java.lang.Runnable
            public void run() {
                ul.this.ycx.sya();
                com.bytedance.sdk.openadsdk.core.syc.sya().post(ul.this.f25504dj);
            }
        };
        this.f25504dj = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.ul.2
            @Override // java.lang.Runnable
            public void run() {
                if (ul.this.f25505zb != null) {
                    ul ulVar = ul.this;
                    ul.super.ycx(ulVar.f25505zb);
                }
            }
        };
        this.ycx = ryVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx
    public void zb() {
        super.zb();
        com.bytedance.sdk.openadsdk.core.syc.sya().removeCallbacks(this.f25504dj);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx, com.bytedance.sdk.component.adexpress.zb.dj
    public void ycx(com.bytedance.sdk.component.adexpress.zb.ul ulVar) {
        this.f25505zb = ulVar;
        yzp.sya((Runnable) this.sya);
    }
}
