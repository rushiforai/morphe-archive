package defpackage;

import android.content.Context;
import com.medium.android.graphql.type.LayoutType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x19 implements lfc {
    public final boolean b;
    public final ps5 c;
    public final nv0 d;
    public final ps5 e;

    public x19(Context context, LayoutType layoutType, Integer num, Integer num2, boolean z) {
        context.getClass();
        boolean z2 = z || layoutType == LayoutType.FULL_WIDTH;
        ps5 ps5Var = new ps5(num, 21, num2);
        nv0 nv0Var = new nv0(z, layoutType, context);
        ps5 ps5Var2 = new ps5(num, 22, context);
        this.b = z2;
        this.c = ps5Var;
        this.d = nv0Var;
        this.e = ps5Var2;
    }

    public final cfc a() {
        int iMin;
        boolean z = this.b;
        nv0 nv0Var = this.d;
        if (z) {
            iMin = ((Number) nv0Var.invoke()).intValue();
        } else {
            int iIntValue = ((Number) this.e.invoke()).intValue();
            int iIntValue2 = ((Number) nv0Var.invoke()).intValue();
            iMin = iIntValue == 0 ? iIntValue2 : Math.min(iIntValue, iIntValue2);
        }
        Float f = (Float) this.c.invoke();
        Integer numValueOf = f != null ? Integer.valueOf(nk7.w0(iMin * f.floatValue())) : null;
        return new cfc(vv2.a0(iMin), numValueOf != null ? vv2.a0(numValueOf.intValue()) : ve3.a);
    }

    @Override // defpackage.lfc
    public final Object f(p92 p92Var) {
        return a();
    }
}
