package com.bytedance.adsdk.zb.sya.sya;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import com.bytedance.adsdk.zb.sya.zb.dy;
import java.util.Collections;
import java.util.List;

/* loaded from: classes2.dex */
public class ul extends ycx {
    private final zb fby;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.ycx.dj f22998ul;

    public ul(com.bytedance.adsdk.zb.jw jwVar, lud ludVar, zb zbVar, com.bytedance.adsdk.zb.ul ulVar) {
        super(jwVar, ludVar);
        this.fby = zbVar;
        com.bytedance.adsdk.zb.ycx.ycx.dj djVar = new com.bytedance.adsdk.zb.ycx.ycx.dj(jwVar, this, new dy("__container", ludVar.xkz(), false), ulVar);
        this.f22998ul = djVar;
        List<com.bytedance.adsdk.zb.ycx.ycx.sya> list = Collections.EMPTY_LIST;
        djVar.ycx(list, list);
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public com.bytedance.adsdk.zb.lud.jc ea() {
        com.bytedance.adsdk.zb.lud.jc jcVarEa = super.ea();
        return jcVarEa != null ? jcVarEa : this.fby.ea();
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public com.bytedance.adsdk.zb.sya.zb.ycx jc() {
        com.bytedance.adsdk.zb.sya.zb.ycx ycxVarJc = super.jc();
        return ycxVarJc != null ? ycxVarJc : this.fby.jc();
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(RectF rectF, Matrix matrix, boolean z11) {
        super.ycx(rectF, matrix, z11);
        this.f22998ul.ycx(rectF, this.ycx, z11);
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        super.zb(canvas, matrix, i5);
        this.f22998ul.ycx(canvas, matrix, i5);
    }
}
