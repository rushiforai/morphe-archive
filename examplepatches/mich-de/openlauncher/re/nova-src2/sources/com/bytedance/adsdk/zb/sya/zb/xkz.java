package com.bytedance.adsdk.zb.sya.zb;

import a2.c;
import android.graphics.PointF;
import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public class xkz {
    private boolean sya;
    private final List<com.bytedance.adsdk.zb.sya.ycx> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private PointF f23099zb;

    public xkz(PointF pointF, boolean z11, List<com.bytedance.adsdk.zb.sya.ycx> list) {
        this.f23099zb = pointF;
        this.sya = z11;
        this.ycx = new ArrayList(list);
    }

    public List<com.bytedance.adsdk.zb.sya.ycx> sya() {
        return this.ycx;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("ShapeData{numCurves=");
        sb2.append(this.ycx.size());
        sb2.append("closed=");
        return c.p(sb2, this.sya, AbstractJsonLexerKt.END_OBJ);
    }

    public void ycx(float f11, float f12) {
        if (this.f23099zb == null) {
            this.f23099zb = new PointF();
        }
        this.f23099zb.set(f11, f12);
    }

    public boolean zb() {
        return this.sya;
    }

    public PointF ycx() {
        return this.f23099zb;
    }

    public xkz() {
        this.ycx = new ArrayList();
    }

    public void ycx(boolean z11) {
        this.sya = z11;
    }

    public void ycx(xkz xkzVar, xkz xkzVar2, float f11) {
        if (this.f23099zb == null) {
            this.f23099zb = new PointF();
        }
        this.sya = xkzVar.zb() || xkzVar2.zb();
        if (xkzVar.sya().size() != xkzVar2.sya().size()) {
            xkzVar.sya().size();
            xkzVar2.sya().size();
        }
        int iMin = Math.min(xkzVar.sya().size(), xkzVar2.sya().size());
        if (this.ycx.size() < iMin) {
            for (int size = this.ycx.size(); size < iMin; size++) {
                this.ycx.add(new com.bytedance.adsdk.zb.sya.ycx());
            }
        } else if (this.ycx.size() > iMin) {
            for (int size2 = this.ycx.size() - 1; size2 >= iMin; size2--) {
                List<com.bytedance.adsdk.zb.sya.ycx> list = this.ycx;
                list.remove(list.size() - 1);
            }
        }
        PointF pointFYcx = xkzVar.ycx();
        PointF pointFYcx2 = xkzVar2.ycx();
        ycx(com.bytedance.adsdk.zb.lt.lud.ycx(pointFYcx.x, pointFYcx2.x, f11), com.bytedance.adsdk.zb.lt.lud.ycx(pointFYcx.y, pointFYcx2.y, f11));
        for (int size3 = this.ycx.size() - 1; size3 >= 0; size3--) {
            com.bytedance.adsdk.zb.sya.ycx ycxVar = xkzVar.sya().get(size3);
            com.bytedance.adsdk.zb.sya.ycx ycxVar2 = xkzVar2.sya().get(size3);
            PointF pointFYcx3 = ycxVar.ycx();
            PointF pointFZb = ycxVar.zb();
            PointF pointFSya = ycxVar.sya();
            PointF pointFYcx4 = ycxVar2.ycx();
            PointF pointFZb2 = ycxVar2.zb();
            PointF pointFSya2 = ycxVar2.sya();
            this.ycx.get(size3).ycx(com.bytedance.adsdk.zb.lt.lud.ycx(pointFYcx3.x, pointFYcx4.x, f11), com.bytedance.adsdk.zb.lt.lud.ycx(pointFYcx3.y, pointFYcx4.y, f11));
            this.ycx.get(size3).zb(com.bytedance.adsdk.zb.lt.lud.ycx(pointFZb.x, pointFZb2.x, f11), com.bytedance.adsdk.zb.lt.lud.ycx(pointFZb.y, pointFZb2.y, f11));
            this.ycx.get(size3).sya(com.bytedance.adsdk.zb.lt.lud.ycx(pointFSya.x, pointFSya2.x, f11), com.bytedance.adsdk.zb.lt.lud.ycx(pointFSya.y, pointFSya2.y, f11));
        }
    }
}
