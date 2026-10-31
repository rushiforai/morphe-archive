package com.bytedance.sdk.openadsdk.core.fby.ycx;

import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.component.adexpress.zb.ea;
import com.bytedance.sdk.openadsdk.core.model.dy;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class ycx extends sya implements com.bytedance.sdk.component.adexpress.dynamic.lt.ycx {
    protected WeakReference<View> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ea f25371zb;

    @Override // com.bytedance.sdk.component.adexpress.dynamic.lt.ycx
    public void ycx(ea eaVar) {
        this.f25371zb = eaVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.lt.ycx
    public void ycx(View view) {
        this.ycx = new WeakReference<>(view);
    }

    @Override // com.bytedance.sdk.openadsdk.core.sya.sya
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        ycx(view, ((Integer) view.getTag()).intValue(), f11, f12, f13, f14, sparseArray);
    }

    private void ycx(View view, int i5, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray) {
        if (this.f25371zb != null) {
            String strValueOf = b.f42142b;
            try {
                int i11 = com.bytedance.sdk.component.adexpress.dynamic.ycx.thx;
                if (view.getTag(i11) != null) {
                    strValueOf = String.valueOf(view.getTag(i11));
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6jSbArFgxM5axVKYHqMnVw==", "f/cjlA61auSMQ9RWoBizPF7gKIc=", "c+8jkQ+5Td6OS9pUjzKsIVjlCIMGsn0=", 69);
            }
            this.f25371zb.ycx(view, i5, new dy.ycx().dj(f11).sya(f12).zb(f13).ycx(f14).zb(this.f26152dv).ycx(this.oty).ycx(sparseArray).ycx(this.rmf).ycx(strValueOf).ycx());
        }
    }
}
