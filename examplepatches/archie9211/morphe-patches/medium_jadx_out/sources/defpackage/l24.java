package defpackage;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l24 {
    public static final l24 a = new l24();
    public static final n14 b = n14.a;
    public static final w04 c = new w04(n98.g(String.format(g14.ERROR_CLASS.getDebugText(), Arrays.copyOf(new Object[]{"unknown class"}, 1))));
    public static final i24 d = c(k24.CYCLIC_SUPERTYPES, new String[0]);
    public static final i24 e = c(k24.ERROR_PROPERTY_TYPE, new String[0]);
    public static final Set f = qo7.B(new o14());

    public static final s14 a(t14 t14Var, boolean z, String... strArr) {
        t14Var.getClass();
        if (!z) {
            return new s14(t14Var, (String[]) Arrays.copyOf(strArr, strArr.length));
        }
        String[] strArr2 = (String[]) Arrays.copyOf(strArr, strArr.length);
        return new qld(t14Var, (String[]) Arrays.copyOf(strArr2, strArr2.length));
    }

    public static final s14 b(t14 t14Var, String... strArr) {
        t14Var.getClass();
        return a(t14Var, false, (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public static final i24 c(k24 k24Var, String... strArr) {
        k24Var.getClass();
        String[] strArr2 = (String[]) Arrays.copyOf(strArr, strArr.length);
        return e(k24Var, ey3.a, d(k24Var, (String[]) Arrays.copyOf(strArr2, strArr2.length)), (String[]) Arrays.copyOf(strArr2, strArr2.length));
    }

    public static j24 d(k24 k24Var, String... strArr) {
        k24Var.getClass();
        return new j24(k24Var, (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public static i24 e(k24 k24Var, List list, zvd zvdVar, String... strArr) {
        k24Var.getClass();
        return new i24(zvdVar, b(t14.ERROR_TYPE_SCOPE, zvdVar.toString()), k24Var, list, false, (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public static final boolean f(yv2 yv2Var) {
        if (yv2Var != null) {
            return (yv2Var instanceof w04) || (yv2Var.h() instanceof w04) || yv2Var == b;
        }
        return false;
    }
}
