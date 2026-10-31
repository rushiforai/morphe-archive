package com.bytedance.sdk.openadsdk.core.jc;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.ok;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.utils.dc;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc extends com.bytedance.sdk.openadsdk.core.sya.zb {
    public jc(Context context, com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str, int i5) {
        super(context, tnVar, str, i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x003b  */
    @Override // com.bytedance.sdk.openadsdk.core.sya.zb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.sdk.openadsdk.core.model.ok ycx(float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, long j11, long j12, View view, String str, float f15, int i5, float f16, int i11, JSONObject jSONObject, JSONObject jSONObject2) {
        float fZb;
        float fZb2;
        long j13;
        long j14;
        int[] iArrYcx = dc.ycx(view);
        if (iArrYcx == null || iArrYcx.length != 2) {
            fZb = f13;
            fZb2 = f14;
        } else {
            int i12 = iArrYcx[0];
            int i13 = iArrYcx[1];
            if (this.f26171uh == 0) {
                f11 = (dc.zb(((com.bytedance.sdk.openadsdk.core.sya.zb) this).f26163dj, f11) + i12) - 0.5f;
                f12 = (dc.zb(((com.bytedance.sdk.openadsdk.core.sya.zb) this).f26163dj, f12) + i13) - 0.5f;
                fZb = (dc.zb(((com.bytedance.sdk.openadsdk.core.sya.zb) this).f26163dj, f13) + i12) - 0.5f;
                fZb2 = (dc.zb(((com.bytedance.sdk.openadsdk.core.sya.zb) this).f26163dj, f14) + i13) - 0.5f;
            }
        }
        com.bytedance.sdk.openadsdk.core.model.dy dyVar = ((com.bytedance.sdk.openadsdk.core.sya.zb) this).lud;
        if (dyVar != null) {
            j13 = dyVar.lud;
            j14 = dyVar.f25621lt;
        } else {
            j13 = j11;
            j14 = j12;
        }
        this.f26171uh = 0;
        return new ok.ycx().lt(f11).lud(f12).dj(fZb).sya(fZb2).zb(j13).ycx(j14).ycx(iArrYcx).zb(dc.sya(view)).dj(this.f26153hf).lud(this.tru).lt(this.bhi).zb(com.bytedance.sdk.openadsdk.core.jc.zb().ycx() ? 1 : 2).ycx(sparseArray).ycx(str).ycx(i11).ycx(jSONObject).zb(jSONObject2).ycx();
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.dy dyVar) {
        ((com.bytedance.sdk.openadsdk.core.sya.zb) this).lud = dyVar;
    }
}
