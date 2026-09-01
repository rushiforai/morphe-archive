package defpackage;

import android.graphics.Color;
import android.graphics.PointF;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wd6 {
    public static final hx4 a = hx4.d1("x", "y");

    public static int a(id6 id6Var) {
        id6Var.f();
        int iNextDouble = (int) (id6Var.nextDouble() * 255.0d);
        int iNextDouble2 = (int) (id6Var.nextDouble() * 255.0d);
        int iNextDouble3 = (int) (id6Var.nextDouble() * 255.0d);
        while (id6Var.hasNext()) {
            id6Var.v();
        }
        id6Var.p();
        return Color.argb(255, iNextDouble, iNextDouble2, iNextDouble3);
    }

    public static PointF b(id6 id6Var, float f) {
        int i = vd6.a[id6Var.I().ordinal()];
        if (i == 1) {
            float fNextDouble = (float) id6Var.nextDouble();
            float fNextDouble2 = (float) id6Var.nextDouble();
            while (id6Var.hasNext()) {
                id6Var.v();
            }
            return new PointF(fNextDouble * f, fNextDouble2 * f);
        }
        if (i == 2) {
            id6Var.f();
            float fNextDouble3 = (float) id6Var.nextDouble();
            float fNextDouble4 = (float) id6Var.nextDouble();
            while (id6Var.I() != ed6.END_ARRAY) {
                id6Var.v();
            }
            id6Var.p();
            return new PointF(fNextDouble3 * f, fNextDouble4 * f);
        }
        if (i != 3) {
            z72.d("Unknown point starts with ", id6Var.I());
            return null;
        }
        id6Var.m();
        float fD = 0.0f;
        float fD2 = 0.0f;
        while (id6Var.hasNext()) {
            int iN = id6Var.N(a);
            if (iN == 0) {
                fD = d(id6Var);
            } else if (iN != 1) {
                id6Var.Q();
                id6Var.v();
            } else {
                fD2 = d(id6Var);
            }
        }
        id6Var.B();
        return new PointF(fD * f, fD2 * f);
    }

    public static ArrayList c(id6 id6Var, float f) {
        ArrayList arrayList = new ArrayList();
        id6Var.f();
        while (id6Var.I() == ed6.BEGIN_ARRAY) {
            id6Var.f();
            arrayList.add(b(id6Var, f));
            id6Var.p();
        }
        id6Var.p();
        return arrayList;
    }

    public static float d(id6 id6Var) {
        ed6 ed6VarI = id6Var.I();
        int i = vd6.a[ed6VarI.ordinal()];
        if (i == 1) {
            return (float) id6Var.nextDouble();
        }
        if (i != 2) {
            ik4.h("Unknown value for token of type ", ed6VarI);
            return 0.0f;
        }
        id6Var.f();
        float fNextDouble = (float) id6Var.nextDouble();
        while (id6Var.hasNext()) {
            id6Var.v();
        }
        id6Var.p();
        return fNextDouble;
    }
}
