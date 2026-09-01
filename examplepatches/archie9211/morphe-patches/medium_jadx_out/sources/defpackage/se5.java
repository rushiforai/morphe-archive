package defpackage;

import android.graphics.PointF;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class se5 extends vk6 {
    public final /* synthetic */ int h;
    public final Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public se5(List list, int i) {
        super(list);
        this.h = i;
        switch (i) {
            case 1:
                super(list);
                this.i = new PointF();
                break;
            case 2:
                super(list);
                this.i = new gqb(1.0f, 1.0f);
                break;
            default:
                int iMax = 0;
                for (int i2 = 0; i2 < list.size(); i2++) {
                    re5 re5Var = (re5) ((uk6) list.get(i2)).b;
                    if (re5Var != null) {
                        iMax = Math.max(iMax, re5Var.b.length);
                    }
                }
                this.i = new re5(new float[iMax], new int[iMax]);
                break;
        }
    }

    @Override // defpackage.rn0
    public final Object e(uk6 uk6Var, float f) {
        Object obj;
        int i = this.h;
        Object obj2 = this.i;
        switch (i) {
            case 0:
                re5 re5Var = (re5) obj2;
                re5 re5Var2 = (re5) uk6Var.b;
                re5 re5Var3 = (re5) uk6Var.c;
                int[] iArr = re5Var.b;
                float[] fArr = re5Var.a;
                boolean zEquals = re5Var2.equals(re5Var3);
                int[] iArr2 = re5Var2.b;
                if (zEquals || f <= 0.0f) {
                    re5Var.a(re5Var2);
                } else if (f >= 1.0f) {
                    re5Var.a(re5Var3);
                } else {
                    int length = iArr2.length;
                    int[] iArr3 = re5Var3.b;
                    if (length != iArr3.length) {
                        StringBuilder sb = new StringBuilder("Cannot interpolate between gradients. Lengths vary (");
                        sb.append(iArr2.length);
                        sb.append(" vs ");
                        ay0.e(ho2.H(sb, iArr3.length, ")"));
                        return null;
                    }
                    for (int i2 = 0; i2 < iArr2.length; i2++) {
                        fArr[i2] = a18.e(re5Var2.a[i2], re5Var3.a[i2], f);
                        iArr[i2] = g01.O(f, iArr2[i2], iArr3[i2]);
                    }
                    for (int length2 = iArr2.length; length2 < fArr.length; length2++) {
                        fArr[length2] = fArr[iArr2.length - 1];
                        iArr[length2] = iArr[iArr2.length - 1];
                    }
                }
                return re5Var;
            case 1:
                return i(uk6Var, f, f);
            default:
                gqb gqbVar = (gqb) obj2;
                Object obj3 = uk6Var.b;
                if (obj3 == null || (obj = uk6Var.c) == null) {
                    ygf.f("Missing values for keyframe.");
                    return null;
                }
                gqb gqbVar2 = (gqb) obj3;
                gqb gqbVar3 = (gqb) obj;
                float fE = a18.e(gqbVar2.a, gqbVar3.a, f);
                float fE2 = a18.e(gqbVar2.b, gqbVar3.b, f);
                gqbVar.a = fE;
                gqbVar.b = fE2;
                return gqbVar;
        }
    }

    @Override // defpackage.rn0
    public /* bridge */ /* synthetic */ Object f(uk6 uk6Var, float f, float f2, float f3) {
        switch (this.h) {
            case 1:
                return i(uk6Var, f2, f3);
            default:
                return super.f(uk6Var, f, f2, f3);
        }
    }

    public PointF i(uk6 uk6Var, float f, float f2) {
        Object obj;
        PointF pointF = (PointF) this.i;
        Object obj2 = uk6Var.b;
        if (obj2 == null || (obj = uk6Var.c) == null) {
            ygf.f("Missing values for keyframe.");
            return null;
        }
        PointF pointF2 = (PointF) obj2;
        PointF pointF3 = (PointF) obj;
        float f3 = pointF2.x;
        float fE = lv8.e(pointF3.x, f3, f, f3);
        float f4 = pointF2.y;
        pointF.set(fE, lv8.e(pointF3.y, f4, f2, f4));
        return pointF;
    }
}
