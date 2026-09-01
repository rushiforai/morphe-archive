package defpackage;

import android.graphics.Path;
import android.graphics.PointF;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a4c extends rn0 {
    public final s3c h;
    public final Path i;
    public ArrayList j;

    public a4c(List list) {
        super(list);
        this.h = new s3c();
        this.i = new Path();
    }

    @Override // defpackage.rn0
    public final Object e(uk6 uk6Var, float f) {
        int i;
        s3c s3cVar;
        float f2;
        boolean z;
        s3c s3cVar2 = (s3c) uk6Var.b;
        s3c s3cVar3 = (s3c) uk6Var.c;
        if (s3cVar3 == null) {
            s3cVar3 = s3cVar2;
        }
        s3c s3cVar4 = this.h;
        ArrayList arrayList = s3cVar4.a;
        if (s3cVar4.b == null) {
            s3cVar4.b = new PointF();
        }
        boolean z2 = s3cVar2.c;
        ArrayList arrayList2 = s3cVar2.a;
        boolean z3 = true;
        s3cVar4.c = z2 || s3cVar3.c;
        int size = arrayList2.size();
        ArrayList arrayList3 = s3cVar3.a;
        if (size != arrayList3.size()) {
            h87.a("Curves must have the same number of control points. Shape 1: " + arrayList2.size() + "\tShape 2: " + arrayList3.size());
        }
        int iMin = Math.min(arrayList2.size(), arrayList3.size());
        if (arrayList.size() < iMin) {
            for (int size2 = arrayList.size(); size2 < iMin; size2++) {
                arrayList.add(new qj2());
            }
        } else if (arrayList.size() > iMin) {
            for (int size3 = arrayList.size() - 1; size3 >= iMin; size3--) {
                arrayList.remove(arrayList.size() - 1);
            }
        }
        PointF pointF = s3cVar2.b;
        PointF pointF2 = s3cVar3.b;
        float fE = a18.e(pointF.x, pointF2.x, f);
        float fE2 = a18.e(pointF.y, pointF2.y, f);
        PointF pointF3 = s3cVar4.b;
        if (pointF3 == null) {
            pointF3 = new PointF();
            s3cVar4.b = pointF3;
        }
        pointF3.set(fE, fE2);
        int size4 = arrayList.size() - 1;
        while (size4 >= 0) {
            qj2 qj2Var = (qj2) arrayList2.get(size4);
            qj2 qj2Var2 = (qj2) arrayList3.get(size4);
            PointF pointF4 = qj2Var.a;
            PointF pointF5 = qj2Var.b;
            PointF pointF6 = qj2Var.c;
            PointF pointF7 = qj2Var2.a;
            PointF pointF8 = qj2Var2.b;
            PointF pointF9 = qj2Var2.c;
            ((qj2) arrayList.get(size4)).a.set(a18.e(pointF4.x, pointF7.x, f), a18.e(pointF4.y, pointF7.y, f));
            ((qj2) arrayList.get(size4)).b.set(a18.e(pointF5.x, pointF8.x, f), a18.e(pointF5.y, pointF8.y, f));
            ((qj2) arrayList.get(size4)).c.set(a18.e(pointF6.x, pointF9.x, f), a18.e(pointF6.y, pointF9.y, f));
            size4--;
            z3 = z3;
        }
        boolean z4 = z3;
        ArrayList arrayList4 = this.j;
        if (arrayList4 != null) {
            int size5 = arrayList4.size() - 1;
            while (true) {
                ArrayList arrayList5 = s3cVar4.a;
                if (size5 < 0) {
                    break;
                }
                emb embVar = (emb) this.j.get(size5);
                embVar.getClass();
                if (arrayList5.size() > 2) {
                    float fFloatValue = ((Float) embVar.b.d()).floatValue();
                    if (fFloatValue != 0.0f) {
                        boolean z5 = s3cVar4.c;
                        int size6 = arrayList5.size() - 1;
                        int i2 = 0;
                        while (size6 >= 0) {
                            qj2 qj2Var3 = (qj2) arrayList5.get(size6);
                            qj2 qj2Var4 = (qj2) arrayList5.get(emb.d(size6 - 1, arrayList5.size()));
                            PointF pointF10 = (size6 != 0 || z5) ? qj2Var4.c : s3cVar4.b;
                            i2 = (((size6 != 0 || z5) ? qj2Var4.b : pointF10).equals(pointF10) && qj2Var3.a.equals(pointF10) && !((s3cVar4.c || (size6 != 0 && size6 != arrayList5.size() + (-1))) ? false : z4)) ? i2 + 2 : i2 + 1;
                            size6--;
                        }
                        s3c s3cVar5 = embVar.c;
                        if (s3cVar5 == null || s3cVar5.a.size() != i2) {
                            ArrayList arrayList6 = new ArrayList(i2);
                            for (int i3 = 0; i3 < i2; i3++) {
                                arrayList6.add(new qj2());
                            }
                            i = 0;
                            embVar.c = new s3c(new PointF(0.0f, 0.0f), false, arrayList6);
                        } else {
                            i = 0;
                        }
                        s3c s3cVar6 = embVar.c;
                        s3cVar6.c = z5;
                        PointF pointF11 = s3cVar4.b;
                        float f3 = pointF11.x;
                        float f4 = pointF11.y;
                        PointF pointF12 = s3cVar6.b;
                        if (pointF12 == null) {
                            pointF12 = new PointF();
                            s3cVar6.b = pointF12;
                        }
                        pointF12.set(f3, f4);
                        ArrayList arrayList7 = s3cVar6.a;
                        boolean z6 = s3cVar4.c;
                        int i4 = i;
                        int i5 = i4;
                        while (i4 < arrayList5.size()) {
                            qj2 qj2Var5 = (qj2) arrayList5.get(i4);
                            qj2 qj2Var6 = (qj2) arrayList5.get(emb.d(i4 - 1, arrayList5.size()));
                            qj2 qj2Var7 = (qj2) arrayList5.get(emb.d(i4 - 2, arrayList5.size()));
                            PointF pointF13 = (i4 != 0 || z6) ? qj2Var6.c : s3cVar4.b;
                            PointF pointF14 = (i4 != 0 || z6) ? qj2Var6.b : pointF13;
                            PointF pointF15 = qj2Var5.a;
                            PointF pointF16 = qj2Var7.c;
                            int i6 = size5;
                            PointF pointF17 = qj2Var5.c;
                            ArrayList arrayList8 = arrayList5;
                            boolean z7 = (s3cVar4.c || !(i4 == 0 || i4 == arrayList8.size() + (-1))) ? false : z4;
                            if (pointF14.equals(pointF13) && pointF15.equals(pointF13) && !z7) {
                                float f5 = pointF13.x;
                                float f6 = f5 - pointF16.x;
                                float f7 = pointF13.y;
                                float f8 = f7 - pointF16.y;
                                float f9 = pointF17.x - f5;
                                float f10 = pointF17.y - f7;
                                s3cVar = s3cVar4;
                                f2 = fFloatValue;
                                float fHypot = (float) Math.hypot(f6, f8);
                                float fHypot2 = (float) Math.hypot(f9, f10);
                                float fMin = Math.min(f2 / fHypot, 0.5f);
                                float fMin2 = Math.min(f2 / fHypot2, 0.5f);
                                float f11 = pointF13.x;
                                float fE3 = lv8.e(pointF16.x, f11, fMin, f11);
                                float f12 = pointF13.y;
                                float fE4 = lv8.e(pointF16.y, f12, fMin, f12);
                                float fE5 = lv8.e(pointF17.x, f11, fMin2, f11);
                                float fE6 = lv8.e(pointF17.y, f12, fMin2, f12);
                                float f13 = fE3 - ((fE3 - f11) * 0.5519f);
                                float f14 = fE4 - ((fE4 - f12) * 0.5519f);
                                float f15 = fE5 - ((fE5 - f11) * 0.5519f);
                                float f16 = fE6 - ((fE6 - f12) * 0.5519f);
                                qj2 qj2Var8 = (qj2) arrayList7.get(emb.d(i5 - 1, arrayList7.size()));
                                qj2 qj2Var9 = (qj2) arrayList7.get(i5);
                                z = z6;
                                qj2Var8.b.set(fE3, fE4);
                                qj2Var8.c.set(fE3, fE4);
                                if (i4 == 0) {
                                    PointF pointF18 = s3cVar6.b;
                                    if (pointF18 == null) {
                                        pointF18 = new PointF();
                                        s3cVar6.b = pointF18;
                                    }
                                    pointF18.set(fE3, fE4);
                                }
                                qj2Var9.a.set(f13, f14);
                                qj2 qj2Var10 = (qj2) arrayList7.get(i5 + 1);
                                qj2Var9.b.set(f15, f16);
                                qj2Var9.c.set(fE5, fE6);
                                qj2Var10.a.set(fE5, fE6);
                                i5 += 2;
                            } else {
                                s3cVar = s3cVar4;
                                f2 = fFloatValue;
                                z = z6;
                                qj2 qj2Var11 = (qj2) arrayList7.get(emb.d(i5 - 1, arrayList7.size()));
                                qj2 qj2Var12 = (qj2) arrayList7.get(i5);
                                PointF pointF19 = qj2Var6.b;
                                qj2Var11.b.set(pointF19.x, pointF19.y);
                                PointF pointF20 = qj2Var6.c;
                                qj2Var11.c.set(pointF20.x, pointF20.y);
                                PointF pointF21 = qj2Var5.a;
                                qj2Var12.a.set(pointF21.x, pointF21.y);
                                i5++;
                            }
                            i4++;
                            size5 = i6;
                            arrayList5 = arrayList8;
                            s3cVar4 = s3cVar;
                            fFloatValue = f2;
                            z6 = z;
                        }
                        s3cVar4 = s3cVar6;
                    }
                }
                size5--;
            }
        }
        Path path = this.i;
        path.reset();
        PointF pointF22 = s3cVar4.b;
        ArrayList arrayList9 = s3cVar4.a;
        path.moveTo(pointF22.x, pointF22.y);
        PointF pointF23 = a18.a;
        pointF23.set(pointF22.x, pointF22.y);
        for (int i7 = 0; i7 < arrayList9.size(); i7++) {
            qj2 qj2Var13 = (qj2) arrayList9.get(i7);
            PointF pointF24 = qj2Var13.a;
            PointF pointF25 = qj2Var13.b;
            PointF pointF26 = qj2Var13.c;
            if (pointF24.equals(pointF23) && pointF25.equals(pointF26)) {
                path.lineTo(pointF26.x, pointF26.y);
            } else {
                path.cubicTo(pointF24.x, pointF24.y, pointF25.x, pointF25.y, pointF26.x, pointF26.y);
            }
            pointF23.set(pointF26.x, pointF26.y);
        }
        if (s3cVar4.c) {
            path.close();
        }
        return path;
    }

    @Override // defpackage.rn0
    public final boolean h() {
        ArrayList arrayList = this.j;
        return (arrayList == null || arrayList.isEmpty()) ? false : true;
    }
}
