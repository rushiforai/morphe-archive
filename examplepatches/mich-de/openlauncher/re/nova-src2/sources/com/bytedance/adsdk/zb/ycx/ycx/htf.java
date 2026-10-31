package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;

/* loaded from: classes2.dex */
public class htf extends ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.sya.ycx f23174dj;
    private com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> fby;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23175lt;
    private final String lud;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> f23176ul;

    public htf(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.pmi pmiVar) {
        super(jwVar, ycxVar, pmiVar.ul().ycx(), pmiVar.fby().ycx(), pmiVar.jw(), pmiVar.sya(), pmiVar.dj(), pmiVar.lud(), pmiVar.lt());
        this.f23174dj = ycxVar;
        this.lud = pmiVar.ycx();
        this.f23175lt = pmiVar.jc();
        com.bytedance.adsdk.zb.ycx.zb.ycx<Integer, Integer> ycxVarYcx = pmiVar.zb().ycx();
        this.f23176ul = ycxVarYcx;
        ycxVarYcx.ycx(this);
        ycxVar.ycx(ycxVarYcx);
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        if (this.f23175lt) {
            return;
        }
        this.f23236zb.setColor(((com.bytedance.adsdk.zb.ycx.zb.zb) this.f23176ul).jw());
        com.bytedance.adsdk.zb.ycx.zb.ycx<ColorFilter, ColorFilter> ycxVar = this.fby;
        if (ycxVar != null) {
            this.f23236zb.setColorFilter(ycxVar.ul());
        }
        super.ycx(canvas, matrix, i5);
    }
}
