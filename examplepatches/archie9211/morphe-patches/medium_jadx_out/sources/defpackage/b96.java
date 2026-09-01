package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class b96 {
    public static final g93 a;
    public static final g93 b;
    public static final g93 c;
    public static final HashMap d;

    static {
        sa6 sa6Var = sa6.d;
        g93 g93Var = new g93(sa6Var, 9);
        a = g93Var;
        ua6 ua6Var = ua6.d;
        g93 g93Var2 = new g93(ua6Var, 10);
        b = g93Var2;
        ta6 ta6Var = ta6.d;
        g93 g93Var3 = new g93(ta6Var, 11);
        c = g93Var3;
        HashMap map = new HashMap();
        d = map;
        map.put(sa6Var, g93Var);
        map.put(ua6Var, g93Var2);
        map.put(ta6Var, g93Var3);
    }

    public static /* synthetic */ void a(int i) {
        String str = (i == 5 || i == 6) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 5 || i == 6) ? 2 : 3];
        switch (i) {
            case 1:
                objArr[0] = "from";
                break;
            case 2:
                objArr[0] = "first";
                break;
            case 3:
                objArr[0] = "second";
                break;
            case 4:
                objArr[0] = "visibility";
                break;
            case 5:
            case 6:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/load/java/JavaDescriptorVisibilities";
                break;
            default:
                objArr[0] = "what";
                break;
        }
        if (i == 5 || i == 6) {
            objArr[1] = "toDescriptorVisibility";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/JavaDescriptorVisibilities";
        }
        if (i == 2 || i == 3) {
            objArr[2] = "areInSamePackage";
        } else if (i == 4) {
            objArr[2] = "toDescriptorVisibility";
        } else if (i != 5 && i != 6) {
            objArr[2] = "isVisibleForProtectedAndPackage";
        }
        String str2 = String.format(str, objArr);
        if (i != 5 && i != 6) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public static boolean b(dw2 dw2Var, yv2 yv2Var) {
        if (dw2Var == null) {
            a(2);
            throw null;
        }
        if (yv2Var == null) {
            a(3);
            throw null;
        }
        wx8 wx8Var = (wx8) d93.i(dw2Var, wx8.class, false);
        wx8 wx8Var2 = (wx8) d93.i(yv2Var, wx8.class, false);
        return (wx8Var2 == null || wx8Var == null || !((xx8) wx8Var).f.equals(((xx8) wx8Var2).f)) ? false : true;
    }

    public static boolean c(iwa iwaVar, dw2 dw2Var, yv2 yv2Var) {
        dw2 dw2VarS;
        if (yv2Var == null) {
            a(1);
            throw null;
        }
        if (dw2Var instanceof f41) {
            dw2VarS = d93.s((f41) dw2Var);
        } else {
            int i = d93.a;
            dw2VarS = dw2Var;
        }
        if (b(dw2VarS, yv2Var)) {
            return true;
        }
        return h93.c.a(iwaVar, dw2Var, yv2Var);
    }
}
