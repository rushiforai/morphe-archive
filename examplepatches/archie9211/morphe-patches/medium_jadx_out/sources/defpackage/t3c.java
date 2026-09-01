package defpackage;

import android.graphics.PointF;
import java.util.ArrayList;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t3c implements mqe {
    public static final t3c a = new t3c();
    public static final hx4 b = hx4.d1("c", "v", "i", "o");

    @Override // defpackage.mqe
    public final Object L0(id6 id6Var, float f) {
        if (id6Var.I() == ed6.BEGIN_ARRAY) {
            id6Var.f();
        }
        id6Var.m();
        ArrayList arrayListC = null;
        ArrayList arrayListC2 = null;
        ArrayList arrayListC3 = null;
        boolean zNextBoolean = false;
        while (id6Var.hasNext()) {
            int iN = id6Var.N(b);
            if (iN == 0) {
                zNextBoolean = id6Var.nextBoolean();
            } else if (iN == 1) {
                arrayListC = wd6.c(id6Var, f);
            } else if (iN == 2) {
                arrayListC2 = wd6.c(id6Var, f);
            } else if (iN != 3) {
                id6Var.Q();
                id6Var.v();
            } else {
                arrayListC3 = wd6.c(id6Var, f);
            }
        }
        id6Var.B();
        if (id6Var.I() == ed6.END_ARRAY) {
            id6Var.p();
        }
        if (arrayListC == null || arrayListC2 == null || arrayListC3 == null) {
            ay0.e("Shape data was missing information.");
            return null;
        }
        if (arrayListC.isEmpty()) {
            return new s3c(new PointF(), false, Collections.EMPTY_LIST);
        }
        int size = arrayListC.size();
        PointF pointF = (PointF) arrayListC.get(0);
        ArrayList arrayList = new ArrayList(size);
        for (int i = 1; i < size; i++) {
            PointF pointF2 = (PointF) arrayListC.get(i);
            int i2 = i - 1;
            arrayList.add(new qj2(a18.a((PointF) arrayListC.get(i2), (PointF) arrayListC3.get(i2)), a18.a(pointF2, (PointF) arrayListC2.get(i)), pointF2));
        }
        if (zNextBoolean) {
            PointF pointF3 = (PointF) arrayListC.get(0);
            int i3 = size - 1;
            arrayList.add(new qj2(a18.a((PointF) arrayListC.get(i3), (PointF) arrayListC3.get(i3)), a18.a(pointF3, (PointF) arrayListC2.get(0)), pointF3));
        }
        return new s3c(pointF, zNextBoolean, arrayList);
    }
}
