package com.bytedance.sdk.component.adexpress.zb;

import android.content.Context;
import android.view.View;
import com.bytedance.sdk.component.adexpress.zb.jc;

/* loaded from: classes2.dex */
public class lt implements jc {
    private ry sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f23691zb;

    public lt(Context context, ry ryVar, ycx ycxVar) {
        this.ycx = context;
        this.f23691zb = ycxVar;
        this.sya = ryVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public void ycx() {
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc
    public boolean ycx(final jc.ycx ycxVar) {
        this.sya.lud().ul(0);
        this.f23691zb.ycx(new ul() { // from class: com.bytedance.sdk.component.adexpress.zb.lt.1
            @Override // com.bytedance.sdk.component.adexpress.zb.ul
            public void ycx(View view, xkz xkzVar) {
                if (ycxVar.sya()) {
                    return;
                }
                syc sycVarZb = ycxVar.zb();
                if (sycVarZb != null) {
                    sycVarZb.ycx(lt.this.f23691zb, xkzVar);
                }
                ycxVar.ycx(true);
            }

            @Override // com.bytedance.sdk.component.adexpress.zb.ul
            public void ycx(int i5, String str) {
                syc sycVarZb = ycxVar.zb();
                if (sycVarZb != null) {
                    sycVarZb.a_(i5);
                }
            }
        });
        return true;
    }

    public void ycx(sya syaVar) {
        this.f23691zb.ycx(syaVar);
    }
}
