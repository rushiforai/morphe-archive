package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ya8 extends va8 implements Iterable, th6 {
    public static final /* synthetic */ int h = 0;
    public final jl1 g;

    public ya8(cb8 cb8Var) {
        super(cb8Var);
        this.g = new jl1(this);
    }

    @Override // defpackage.va8
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof ya8) || !super.equals(obj)) {
            return false;
        }
        jl1 jl1Var = this.g;
        int iE = ((xkc) jl1Var.e).e();
        jl1 jl1Var2 = ((ya8) obj).g;
        if (iE != ((xkc) jl1Var2.e).e() || jl1Var.c != jl1Var2.c) {
            return false;
        }
        for (va8 va8Var : (j52) szb.F0(new h1(2, (xkc) jl1Var.e))) {
            if (!va8Var.equals(s42.L((xkc) jl1Var2.e, va8Var.b.c))) {
                return false;
            }
        }
        return true;
    }

    @Override // defpackage.va8
    public final int hashCode() {
        jl1 jl1Var = this.g;
        int iC = jl1Var.c;
        xkc xkcVar = (xkc) jl1Var.e;
        int iE = xkcVar.e();
        for (int i = 0; i < iE; i++) {
            iC = (((iC * 31) + xkcVar.c(i)) * 31) + ((va8) xkcVar.g(i)).hashCode();
        }
        return iC;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        jl1 jl1Var = this.g;
        jl1Var.getClass();
        return new ab8(jl1Var);
    }

    @Override // defpackage.va8
    public final ua8 r(ku3 ku3Var) {
        ua8 ua8VarR = super.r(ku3Var);
        jl1 jl1Var = this.g;
        jl1Var.getClass();
        return jl1Var.F(ua8VarR, ku3Var, false, (ya8) jl1Var.d);
    }

    @Override // defpackage.va8
    public final void s(Context context, AttributeSet attributeSet) {
        String strValueOf;
        context.getClass();
        super.s(context, attributeSet);
        TypedArray typedArrayObtainAttributes = context.getResources().obtainAttributes(attributeSet, csa.d);
        typedArrayObtainAttributes.getClass();
        int resourceId = typedArrayObtainAttributes.getResourceId(0, 0);
        jl1 jl1Var = this.g;
        jl1Var.M(resourceId);
        int i = jl1Var.c;
        if (i <= 16777215) {
            strValueOf = String.valueOf(i);
        } else {
            try {
                strValueOf = context.getResources().getResourceName(i);
                strValueOf.getClass();
            } catch (Resources.NotFoundException unused) {
                strValueOf = String.valueOf(i);
            }
        }
        jl1Var.b = strValueOf;
        typedArrayObtainAttributes.recycle();
    }

    @Override // defpackage.va8
    public final String toString() {
        StringBuilder sb = new StringBuilder(super.toString());
        jl1 jl1Var = this.g;
        String str = (String) jl1Var.f;
        jl1Var.getClass();
        va8 va8VarT = (str == null || muc.b0(str)) ? null : jl1Var.t(str, true);
        if (va8VarT == null) {
            va8VarT = jl1Var.s(jl1Var.c);
        }
        sb.append(" startDestination=");
        if (va8VarT == null) {
            String str2 = (String) jl1Var.f;
            if (str2 != null) {
                sb.append(str2);
            } else {
                String str3 = (String) jl1Var.b;
                if (str3 != null) {
                    sb.append(str3);
                } else {
                    sb.append("0x" + Integer.toHexString(jl1Var.c));
                }
            }
        } else {
            sb.append("{");
            sb.append(va8VarT.toString());
            sb.append("}");
        }
        return sb.toString();
    }

    public final ua8 v(ku3 ku3Var, va8 va8Var) {
        return this.g.F(super.r(ku3Var), ku3Var, true, va8Var);
    }

    public final ua8 w(String str, boolean z, va8 va8Var) {
        ua8 ua8VarW;
        jl1 jl1Var = this.g;
        jl1Var.getClass();
        ya8 ya8Var = (ya8) jl1Var.d;
        ua8 ua8VarA = ya8Var.b.a(str);
        ArrayList arrayList = new ArrayList();
        Iterator it2 = ya8Var.iterator();
        while (true) {
            ab8 ab8Var = (ab8) it2;
            ua8VarW = null;
            if (!ab8Var.hasNext()) {
                break;
            }
            va8 va8Var2 = (va8) ab8Var.next();
            if (!g76.L(va8Var2, va8Var)) {
                if (va8Var2 instanceof ya8) {
                    ua8VarW = ((ya8) va8Var2).w(str, false, ya8Var);
                } else {
                    va8Var2.getClass();
                    ua8VarW = va8Var2.b.a(str);
                }
            }
            if (ua8VarW != null) {
                arrayList.add(ua8VarW);
            }
        }
        ua8 ua8Var = (ua8) bu1.J0(arrayList);
        ya8 ya8Var2 = ya8Var.c;
        if (ya8Var2 != null && z && !ya8Var2.equals(va8Var)) {
            ua8VarW = ya8Var2.w(str, true, ya8Var);
        }
        return (ua8) bu1.J0(k80.s0(new ua8[]{ua8VarA, ua8Var, ua8VarW}));
    }
}
