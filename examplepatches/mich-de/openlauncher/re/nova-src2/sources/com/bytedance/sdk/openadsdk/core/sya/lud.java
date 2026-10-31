package com.bytedance.sdk.openadsdk.core.sya;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.sya.sya;

/* loaded from: classes2.dex */
public abstract class lud extends ycx {
    public lud(Context context, tn tnVar, String str, int i5) {
        super(context, tnVar, str, i5);
    }

    public abstract void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12, boolean z11);

    @Override // com.bytedance.sdk.openadsdk.core.sya.ycx, com.bytedance.sdk.openadsdk.core.sya.zb, com.bytedance.sdk.openadsdk.core.sya.sya
    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
        if (ycx(view, z11)) {
            ycx(view, f11, f12, f13, f14, sparseArray, this.bhi, this.f26153hf, this.tru, z11);
        }
        super.ycx(view, f11, f12, f13, f14, sparseArray, z11);
    }
}
