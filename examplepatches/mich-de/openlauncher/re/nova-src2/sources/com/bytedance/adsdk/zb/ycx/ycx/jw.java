package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.LongSparseArray;

/* loaded from: classes2.dex */
public class jw extends ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final String f23177dj;

    /* renamed from: ea, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<com.bytedance.adsdk.zb.sya.zb.dj, com.bytedance.adsdk.zb.sya.zb.dj> f23178ea;
    private final RectF fby;

    /* renamed from: jc, reason: collision with root package name */
    private final int f23179jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.zb.ul f23180jw;

    /* renamed from: lt, reason: collision with root package name */
    private final LongSparseArray<LinearGradient> f23181lt;
    private final boolean lud;

    /* renamed from: ok, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> f23182ok;

    /* renamed from: ry, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> f23183ry;

    /* renamed from: ul, reason: collision with root package name */
    private final LongSparseArray<RadialGradient> f23184ul;
    private com.bytedance.adsdk.zb.ycx.zb.wie xkz;

    public jw(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.lt ltVar) {
        super(jwVar, ycxVar, ltVar.fby().ycx(), ltVar.jw().ycx(), ltVar.ok(), ltVar.dj(), ltVar.ul(), ltVar.jc(), ltVar.ea());
        this.f23181lt = new LongSparseArray<>();
        this.f23184ul = new LongSparseArray<>();
        this.fby = new RectF();
        this.f23177dj = ltVar.ycx();
        this.f23180jw = ltVar.zb();
        this.lud = ltVar.ry();
        this.f23179jc = (int) (jwVar.hf().lud() / 32.0f);
        com.bytedance.adsdk.zb.ycx.zb.ycx<com.bytedance.adsdk.zb.sya.zb.dj, com.bytedance.adsdk.zb.sya.zb.dj> ycxVarYcx = ltVar.sya().ycx();
        this.f23178ea = ycxVarYcx;
        ycxVarYcx.ycx(this);
        ycxVar.ycx(ycxVarYcx);
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx2 = ltVar.lud().ycx();
        this.f23182ok = ycxVarYcx2;
        ycxVarYcx2.ycx(this);
        ycxVar.ycx(ycxVarYcx2);
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx3 = ltVar.lt().ycx();
        this.f23183ry = ycxVarYcx3;
        ycxVarYcx3.ycx(this);
        ycxVar.ycx(ycxVarYcx3);
    }

    private int dj() {
        int iRound = Math.round(this.f23182ok.fby() * this.f23179jc);
        int iRound2 = Math.round(this.f23183ry.fby() * this.f23179jc);
        int iRound3 = Math.round(this.f23178ea.fby() * this.f23179jc);
        int i5 = iRound != 0 ? iRound * 527 : 17;
        if (iRound2 != 0) {
            i5 = i5 * 31 * iRound2;
        }
        return iRound3 != 0 ? i5 * 31 * iRound3 : i5;
    }

    private RadialGradient sya() {
        long jDj = dj();
        RadialGradient radialGradient = this.f23184ul.get(jDj);
        if (radialGradient != null) {
            return radialGradient;
        }
        PointF pointFUl = this.f23182ok.ul();
        PointF pointFUl2 = this.f23183ry.ul();
        com.bytedance.adsdk.zb.sya.zb.dj djVarUl = this.f23178ea.ul();
        int[] iArrYcx = ycx(djVarUl.zb());
        float[] fArrYcx = djVarUl.ycx();
        RadialGradient radialGradient2 = new RadialGradient(pointFUl.x, pointFUl.y, (float) Math.hypot(pointFUl2.x - r7, pointFUl2.y - r8), iArrYcx, fArrYcx, Shader.TileMode.CLAMP);
        this.f23184ul.put(jDj, radialGradient2);
        return radialGradient2;
    }

    private LinearGradient zb() {
        long jDj = dj();
        LinearGradient linearGradient = this.f23181lt.get(jDj);
        if (linearGradient != null) {
            return linearGradient;
        }
        PointF pointFUl = this.f23182ok.ul();
        PointF pointFUl2 = this.f23183ry.ul();
        com.bytedance.adsdk.zb.sya.zb.dj djVarUl = this.f23178ea.ul();
        LinearGradient linearGradient2 = new LinearGradient(pointFUl.x, pointFUl.y, pointFUl2.x, pointFUl2.y, ycx(djVarUl.zb()), djVarUl.ycx(), Shader.TileMode.CLAMP);
        this.f23181lt.put(jDj, linearGradient2);
        return linearGradient2;
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ycx, com.bytedance.adsdk.zb.ycx.ycx.lud
    public void ycx(Canvas canvas, Matrix matrix, int i5) {
        if (this.lud) {
            return;
        }
        ycx(this.fby, matrix, false);
        Shader shaderZb = this.f23180jw == com.bytedance.adsdk.zb.sya.zb.ul.LINEAR ? zb() : sya();
        shaderZb.setLocalMatrix(matrix);
        this.f23236zb.setShader(shaderZb);
        super.ycx(canvas, matrix, i5);
    }

    private int[] ycx(int[] iArr) {
        if (this.xkz == null) {
            return iArr;
        }
        throw null;
    }
}
