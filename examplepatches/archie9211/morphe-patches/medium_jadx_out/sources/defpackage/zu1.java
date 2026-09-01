package defpackage;

import android.graphics.PointF;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zu1 extends vk6 {
    public final /* synthetic */ int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zu1(List list, int i) {
        super(list);
        this.h = i;
    }

    public static float j(uk6 uk6Var, float f) {
        Object obj = uk6Var.b;
        if (obj == null || uk6Var.c == null) {
            ygf.f("Missing values for keyframe.");
            return 0.0f;
        }
        float fFloatValue = uk6Var.i;
        if (fFloatValue == -3987645.8f) {
            fFloatValue = ((Float) obj).floatValue();
            uk6Var.i = fFloatValue;
        }
        float fFloatValue2 = uk6Var.j;
        if (fFloatValue2 == -3987645.8f) {
            fFloatValue2 = ((Float) uk6Var.c).floatValue();
            uk6Var.j = fFloatValue2;
        }
        return a18.e(fFloatValue, fFloatValue2, f);
    }

    @Override // defpackage.rn0
    public final Object e(uk6 uk6Var, float f) {
        int iIntValue;
        Object obj;
        switch (this.h) {
            case 0:
                return Integer.valueOf(k(uk6Var, f));
            case 1:
                return Float.valueOf(j(uk6Var, f));
            case 2:
                Object obj2 = uk6Var.b;
                if (obj2 == null) {
                    ygf.f("Missing values for keyframe.");
                    return null;
                }
                Object obj3 = uk6Var.c;
                if (obj3 == null) {
                    iIntValue = uk6Var.k;
                    if (iIntValue == 784923401) {
                        iIntValue = ((Integer) obj2).intValue();
                        uk6Var.k = iIntValue;
                    }
                } else {
                    int i = uk6Var.l;
                    if (i == 784923401) {
                        iIntValue = ((Integer) obj3).intValue();
                        uk6Var.l = iIntValue;
                    } else {
                        iIntValue = i;
                    }
                }
                int iIntValue2 = uk6Var.k;
                if (iIntValue2 == 784923401) {
                    iIntValue2 = ((Integer) obj2).intValue();
                    uk6Var.k = iIntValue2;
                }
                PointF pointF = a18.a;
                return Integer.valueOf((int) ((f * (iIntValue - iIntValue2)) + iIntValue2));
            default:
                return (f != 1.0f || (obj = uk6Var.c) == null) ? (qi3) uk6Var.b : (qi3) obj;
        }
    }

    public float i() {
        t90 t90Var = xn6.a;
        return j(this.c.d(), b());
    }

    public int k(uk6 uk6Var, float f) {
        if (uk6Var.b != null && uk6Var.c != null) {
            return g01.O(a18.b(f, 0.0f, 1.0f), ((Integer) uk6Var.b).intValue(), ((Integer) uk6Var.c).intValue());
        }
        ygf.f("Missing values for keyframe.");
        return 0;
    }
}
