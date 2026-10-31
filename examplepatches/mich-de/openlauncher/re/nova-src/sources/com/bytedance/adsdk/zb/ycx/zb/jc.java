package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PointF;
import java.util.List;

/* loaded from: classes2.dex */
public class jc extends ul<PointF> {

    /* renamed from: dj, reason: collision with root package name */
    private final PointF f23249dj;

    /* renamed from: lt, reason: collision with root package name */
    private final PathMeasure f23250lt;
    private final float[] lud;

    /* renamed from: ul, reason: collision with root package name */
    private jw f23251ul;

    public jc(List<? extends com.bytedance.adsdk.zb.ul.ycx<PointF>> list) {
        super(list);
        this.f23249dj = new PointF();
        this.lud = new float[2];
        this.f23250lt = new PathMeasure();
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public PointF ycx(com.bytedance.adsdk.zb.ul.ycx<PointF> ycxVar, float f11) {
        jw jwVar = (jw) ycxVar;
        Path pathZb = jwVar.zb();
        if (pathZb == null) {
            return ycxVar.ycx;
        }
        if (this.sya != null) {
            jwVar.f23137ul.getClass();
            dj();
            fby();
            throw null;
        }
        if (this.f23251ul != jwVar) {
            this.f23250lt.setPath(pathZb, false);
            this.f23251ul = jwVar;
        }
        PathMeasure pathMeasure = this.f23250lt;
        pathMeasure.getPosTan(pathMeasure.getLength() * f11, this.lud, null);
        PointF pointF = this.f23249dj;
        float[] fArr = this.lud;
        pointF.set(fArr[0], fArr[1]);
        return this.f23249dj;
    }
}
