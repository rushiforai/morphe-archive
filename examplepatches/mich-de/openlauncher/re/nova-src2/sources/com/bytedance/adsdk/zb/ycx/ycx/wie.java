package com.bytedance.adsdk.zb.ycx.ycx;

import a2.c;
import android.graphics.PointF;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class wie implements uh, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.adsdk.zb.sya.zb.xkz f23216dj;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> sya;
    private final com.bytedance.adsdk.zb.jw ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f23217zb;

    public wie(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.ry ryVar) {
        this.ycx = jwVar;
        this.f23217zb = ryVar.ycx();
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = ryVar.zb().ycx();
        this.sya = ycxVarYcx;
        ycxVar.ycx(ycxVarYcx);
        ycxVarYcx.ycx(this);
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
    }

    public com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> zb() {
        return this.sya;
    }

    private com.bytedance.adsdk.zb.sya.zb.xkz zb(com.bytedance.adsdk.zb.sya.zb.xkz xkzVar) {
        List<com.bytedance.adsdk.zb.sya.ycx> listSya = xkzVar.sya();
        boolean zZb = xkzVar.zb();
        int size = listSya.size() - 1;
        int i5 = 0;
        while (size >= 0) {
            com.bytedance.adsdk.zb.sya.ycx ycxVar = listSya.get(size);
            com.bytedance.adsdk.zb.sya.ycx ycxVar2 = listSya.get(ycx(size - 1, listSya.size()));
            PointF pointFSya = (size != 0 || zZb) ? ycxVar2.sya() : xkzVar.ycx();
            i5 = (((size != 0 || zZb) ? ycxVar2.zb() : pointFSya).equals(pointFSya) && ycxVar.ycx().equals(pointFSya) && !(!xkzVar.zb() && size == 0 && size == listSya.size() - 1)) ? i5 + 2 : i5 + 1;
            size--;
        }
        com.bytedance.adsdk.zb.sya.zb.xkz xkzVar2 = this.f23216dj;
        if (xkzVar2 == null || xkzVar2.sya().size() != i5) {
            ArrayList arrayList = new ArrayList(i5);
            for (int i11 = 0; i11 < i5; i11++) {
                arrayList.add(new com.bytedance.adsdk.zb.sya.ycx());
            }
            this.f23216dj = new com.bytedance.adsdk.zb.sya.zb.xkz(new PointF(0.0f, 0.0f), false, arrayList);
        }
        this.f23216dj.ycx(zZb);
        return this.f23216dj;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.ycx.invalidateSelf();
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00a1  */
    @Override // com.bytedance.adsdk.zb.ycx.ycx.uh
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.adsdk.zb.sya.zb.xkz ycx(com.bytedance.adsdk.zb.sya.zb.xkz xkzVar) {
        boolean z11;
        List<com.bytedance.adsdk.zb.sya.ycx> list;
        List<com.bytedance.adsdk.zb.sya.ycx> listSya = xkzVar.sya();
        if (listSya.size() > 2) {
            float fFloatValue = this.sya.ul().floatValue();
            if (fFloatValue != 0.0f) {
                com.bytedance.adsdk.zb.sya.zb.xkz xkzVarZb = zb(xkzVar);
                xkzVarZb.ycx(xkzVar.ycx().x, xkzVar.ycx().y);
                List<com.bytedance.adsdk.zb.sya.ycx> listSya2 = xkzVarZb.sya();
                boolean zZb = xkzVar.zb();
                int i5 = 0;
                int i11 = 0;
                while (i5 < listSya.size()) {
                    com.bytedance.adsdk.zb.sya.ycx ycxVar = listSya.get(i5);
                    com.bytedance.adsdk.zb.sya.ycx ycxVar2 = listSya.get(ycx(i5 - 1, listSya.size()));
                    com.bytedance.adsdk.zb.sya.ycx ycxVar3 = listSya.get(ycx(i5 - 2, listSya.size()));
                    PointF pointFSya = (i5 != 0 || zZb) ? ycxVar2.sya() : xkzVar.ycx();
                    PointF pointFZb = (i5 != 0 || zZb) ? ycxVar2.zb() : pointFSya;
                    PointF pointFYcx = ycxVar.ycx();
                    PointF pointFSya2 = ycxVar3.sya();
                    PointF pointFSya3 = ycxVar.sya();
                    if (xkzVar.zb() || i5 != 0) {
                        z11 = false;
                    } else {
                        z11 = true;
                        if (i5 != listSya.size() - 1) {
                        }
                    }
                    if (pointFZb.equals(pointFSya) && pointFYcx.equals(pointFSya) && !z11) {
                        float f11 = pointFSya.x;
                        float f12 = f11 - pointFSya2.x;
                        float f13 = pointFSya.y;
                        float f14 = f13 - pointFSya2.y;
                        float f15 = pointFSya3.x - f11;
                        float f16 = pointFSya3.y - f13;
                        list = listSya;
                        float fHypot = (float) Math.hypot(f12, f14);
                        float fHypot2 = (float) Math.hypot(f15, f16);
                        float fMin = Math.min(fFloatValue / fHypot, 0.5f);
                        float fMin2 = Math.min(fFloatValue / fHypot2, 0.5f);
                        float f17 = pointFSya.x;
                        float fA = c.a(pointFSya2.x, f17, fMin, f17);
                        float f18 = pointFSya.y;
                        float fA2 = c.a(pointFSya2.y, f18, fMin, f18);
                        float fA3 = c.a(pointFSya3.x, f17, fMin2, f17);
                        float fA4 = c.a(pointFSya3.y, f18, fMin2, f18);
                        float f19 = fA - ((fA - f17) * 0.5519f);
                        float f21 = fA2 - ((fA2 - f18) * 0.5519f);
                        float f22 = fA3 - ((fA3 - f17) * 0.5519f);
                        float f23 = fA4 - ((fA4 - f18) * 0.5519f);
                        com.bytedance.adsdk.zb.sya.ycx ycxVar4 = listSya2.get(ycx(i11 - 1, listSya2.size()));
                        com.bytedance.adsdk.zb.sya.ycx ycxVar5 = listSya2.get(i11);
                        ycxVar4.zb(fA, fA2);
                        ycxVar4.sya(fA, fA2);
                        if (i5 == 0) {
                            xkzVarZb.ycx(fA, fA2);
                        }
                        ycxVar5.ycx(f19, f21);
                        com.bytedance.adsdk.zb.sya.ycx ycxVar6 = listSya2.get(i11 + 1);
                        ycxVar5.zb(f22, f23);
                        ycxVar5.sya(fA3, fA4);
                        ycxVar6.ycx(fA3, fA4);
                        i11 += 2;
                    } else {
                        list = listSya;
                        com.bytedance.adsdk.zb.sya.ycx ycxVar7 = listSya2.get(ycx(i11 - 1, listSya2.size()));
                        com.bytedance.adsdk.zb.sya.ycx ycxVar8 = listSya2.get(i11);
                        ycxVar7.zb(ycxVar2.zb().x, ycxVar2.zb().y);
                        ycxVar7.sya(ycxVar2.sya().x, ycxVar2.sya().y);
                        ycxVar8.ycx(ycxVar.ycx().x, ycxVar.ycx().y);
                        i11++;
                    }
                    i5++;
                    listSya = list;
                }
                return xkzVarZb;
            }
        }
        return xkzVar;
    }

    private static int zb(int i5, int i11) {
        int i12 = i5 / i11;
        return ((i5 ^ i11) >= 0 || i11 * i12 == i5) ? i12 : i12 - 1;
    }

    private static int ycx(int i5, int i11) {
        return i5 - (zb(i5, i11) * i11);
    }
}
