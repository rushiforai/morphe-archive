package com.bytedance.sdk.component.adexpress.zb;

import android.content.Context;
import android.view.View;
import com.bytedance.sdk.component.adexpress.zb.jc;

/* loaded from: classes2.dex */
public class zb implements jc {

    /* renamed from: dj, reason: collision with root package name */
    private ry f23737dj;
    private int lud;
    private fby sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx f23738zb;

    public zb(Context context, ry ryVar, boolean z11, com.bytedance.sdk.component.adexpress.dynamic.lud.fby fbyVar, fby fbyVar2, com.bytedance.sdk.component.adexpress.dynamic.lt.ycx ycxVar, com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx ycxVar2) {
        this.ycx = context;
        this.f23737dj = ryVar;
        this.sya = fbyVar2;
        if (ycxVar2 != null) {
            this.f23738zb = ycxVar2;
        } else {
            this.f23738zb = new com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx(context, z11, fbyVar, ryVar, ycxVar);
        }
        this.f23738zb.ycx(this.sya);
        if (fbyVar instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul) {
            this.lud = 3;
        } else {
            this.lud = 2;
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public boolean ycx(final jc.ycx ycxVar) {
        this.f23737dj.lud().ycx(this.lud);
        this.f23738zb.ycx(new ul() { // from class: com.bytedance.sdk.component.adexpress.zb.zb.1
            @Override // com.bytedance.sdk.component.adexpress.zb.ul
            public void ycx(View view, xkz xkzVar) {
                if (ycxVar.sya()) {
                    return;
                }
                zb.this.f23737dj.lud().lud(zb.this.lud);
                zb.this.f23737dj.lud().lt(zb.this.lud);
                zb.this.f23737dj.lud().jw();
                syc sycVarZb = ycxVar.zb();
                if (sycVarZb == null) {
                    return;
                }
                sycVarZb.ycx(zb.this.f23738zb, xkzVar);
                ycxVar.ycx(true);
            }

            @Override // com.bytedance.sdk.component.adexpress.zb.ul
            public void ycx(int i5, String str) {
                zb.this.f23737dj.lud().ycx(zb.this.lud, i5, str, ycxVar.zb(zb.this));
                if (ycxVar.zb(zb.this)) {
                    ycxVar.ycx(zb.this);
                    return;
                }
                syc sycVarZb = ycxVar.zb();
                if (sycVarZb == null) {
                    return;
                }
                sycVarZb.a_(i5);
            }
        });
        return true;
    }

    public com.bytedance.sdk.component.adexpress.dynamic.dj zb() {
        com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx ycxVar = this.f23738zb;
        if (ycxVar != null) {
            return ycxVar.dj();
        }
        return null;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public void ycx() {
        com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx ycxVar = this.f23738zb;
        if (ycxVar != null) {
            ycxVar.zb();
        }
    }
}
