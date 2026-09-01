package defpackage;

import j$.util.DesugarCollections;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ServiceConfigurationError;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class h93 {
    public static final g93 a;
    public static final g93 b;
    public static final g93 c;
    public static final g93 d;
    public static final g93 e;
    public static final g93 f;
    public static final g93 g;
    public static final g93 h;
    public static final g93 i;
    public static final g93 j;
    public static final dq1 k;
    public static final fa4 l;
    public static final rz5 m;
    public static final d38 n;
    public static final HashMap o;

    static {
        iwe iweVar = iwe.d;
        g93 g93Var = new g93(iweVar, 0);
        a = g93Var;
        jwe jweVar = jwe.d;
        g93 g93Var2 = new g93(jweVar, 1);
        b = g93Var2;
        kwe kweVar = kwe.d;
        g93 g93Var3 = new g93(kweVar, 2);
        c = g93Var3;
        fwe fweVar = fwe.d;
        g93 g93Var4 = new g93(fweVar, 3);
        d = g93Var4;
        lwe lweVar = lwe.d;
        g93 g93Var5 = new g93(lweVar, 4);
        e = g93Var5;
        hwe hweVar = hwe.d;
        g93 g93Var6 = new g93(hweVar, 5);
        f = g93Var6;
        ewe eweVar = ewe.d;
        g93 g93Var7 = new g93(eweVar, 6);
        g = g93Var7;
        gwe gweVar = gwe.d;
        g93 g93Var8 = new g93(gweVar, 7);
        h = g93Var8;
        mwe mweVar = mwe.d;
        g93 g93Var9 = new g93(mweVar, 8);
        i = g93Var9;
        DesugarCollections.unmodifiableSet(k80.S0(new g93[]{g93Var, g93Var2, g93Var4, g93Var6}));
        HashMap map = new HashMap(6);
        map.put(g93Var2, 0);
        map.put(g93Var, 0);
        map.put(g93Var4, 1);
        map.put(g93Var3, 1);
        map.put(g93Var5, 2);
        DesugarCollections.unmodifiableMap(map);
        j = g93Var5;
        int i2 = 16;
        k = new dq1(i2);
        l = new fa4(i2);
        m = new rz5(i2);
        try {
            Iterator it2 = Arrays.asList(new d38[0]).iterator();
            n = it2.hasNext() ? (d38) it2.next() : d38.a;
            HashMap map2 = new HashMap();
            o = map2;
            map2.put(iweVar, g93Var);
            map2.put(jweVar, g93Var2);
            map2.put(kweVar, g93Var3);
            map2.put(fweVar, g93Var4);
            map2.put(lweVar, g93Var5);
            map2.put(hweVar, g93Var6);
            map2.put(eweVar, g93Var7);
            map2.put(gweVar, g93Var8);
            map2.put(mweVar, g93Var9);
        } catch (Throwable th) {
            throw new ServiceConfigurationError(th.getMessage(), th);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void a(int r8) {
        /*
            r0 = 16
            if (r8 == r0) goto L7
            java.lang.String r1 = "Argument for @NotNull parameter '%s' of %s.%s must not be null"
            goto L9
        L7:
            java.lang.String r1 = "@NotNull method %s.%s must not return null"
        L9:
            r2 = 3
            r3 = 2
            if (r8 == r0) goto Lf
            r4 = r2
            goto L10
        Lf:
            r4 = r3
        L10:
            java.lang.Object[] r4 = new java.lang.Object[r4]
            java.lang.String r5 = "kotlin/reflect/jvm/internal/impl/descriptors/DescriptorVisibilities"
            r6 = 1
            r7 = 0
            if (r8 == r6) goto L3a
            if (r8 == r2) goto L3a
            r2 = 5
            if (r8 == r2) goto L3a
            r2 = 7
            if (r8 == r2) goto L3a
            switch(r8) {
                case 9: goto L3a;
                case 10: goto L35;
                case 11: goto L30;
                case 12: goto L35;
                case 13: goto L30;
                case 14: goto L2b;
                case 15: goto L2b;
                case 16: goto L28;
                default: goto L23;
            }
        L23:
            java.lang.String r2 = "what"
            r4[r7] = r2
            goto L3e
        L28:
            r4[r7] = r5
            goto L3e
        L2b:
            java.lang.String r2 = "visibility"
            r4[r7] = r2
            goto L3e
        L30:
            java.lang.String r2 = "second"
            r4[r7] = r2
            goto L3e
        L35:
            java.lang.String r2 = "first"
            r4[r7] = r2
            goto L3e
        L3a:
            java.lang.String r2 = "from"
            r4[r7] = r2
        L3e:
            java.lang.String r2 = "toDescriptorVisibility"
            if (r8 == r0) goto L45
            r4[r6] = r5
            goto L47
        L45:
            r4[r6] = r2
        L47:
            switch(r8) {
                case 2: goto L70;
                case 3: goto L70;
                case 4: goto L6b;
                case 5: goto L6b;
                case 6: goto L66;
                case 7: goto L66;
                case 8: goto L61;
                case 9: goto L61;
                case 10: goto L5c;
                case 11: goto L5c;
                case 12: goto L57;
                case 13: goto L57;
                case 14: goto L52;
                case 15: goto L4f;
                case 16: goto L74;
                default: goto L4a;
            }
        L4a:
            java.lang.String r2 = "isVisible"
            r4[r3] = r2
            goto L74
        L4f:
            r4[r3] = r2
            goto L74
        L52:
            java.lang.String r2 = "isPrivate"
            r4[r3] = r2
            goto L74
        L57:
            java.lang.String r2 = "compare"
            r4[r3] = r2
            goto L74
        L5c:
            java.lang.String r2 = "compareLocal"
            r4[r3] = r2
            goto L74
        L61:
            java.lang.String r2 = "findInvisibleMember"
            r4[r3] = r2
            goto L74
        L66:
            java.lang.String r2 = "inSameFile"
            r4[r3] = r2
            goto L74
        L6b:
            java.lang.String r2 = "isVisibleWithAnyReceiver"
            r4[r3] = r2
            goto L74
        L70:
            java.lang.String r2 = "isVisibleIgnoringReceiver"
            r4[r3] = r2
        L74:
            java.lang.String r1 = java.lang.String.format(r1, r4)
            if (r8 == r0) goto L80
            java.lang.IllegalArgumentException r8 = new java.lang.IllegalArgumentException
            r8.<init>(r1)
            goto L85
        L80:
            java.lang.IllegalStateException r8 = new java.lang.IllegalStateException
            r8.<init>(r1)
        L85:
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h93.a(int):void");
    }

    public static Integer b(g93 g93Var, g93 g93Var2) {
        if (g93Var == null) {
            a(12);
            throw null;
        }
        l6 l6Var = g93Var.a;
        if (g93Var2 == null) {
            a(13);
            throw null;
        }
        l6 l6Var2 = g93Var2.a;
        Integer numA = l6Var.a(l6Var2);
        if (numA != null) {
            return numA;
        }
        Integer numA2 = l6Var2.a(l6Var);
        if (numA2 != null) {
            return Integer.valueOf(-numA2.intValue());
        }
        return null;
    }

    public static dw2 c(iwa iwaVar, f41 f41Var, yv2 yv2Var) {
        dw2 dw2VarC;
        if (f41Var == null) {
            a(8);
            throw null;
        }
        if (yv2Var == null) {
            a(9);
            throw null;
        }
        for (dw2 dw2Var = (dw2) f41Var.x0(); dw2Var != null && dw2Var.getVisibility() != f; dw2Var = (dw2) d93.i(dw2Var, dw2.class, true)) {
            if (!dw2Var.getVisibility().a(iwaVar, dw2Var, yv2Var)) {
                return dw2Var;
            }
        }
        if (!(f41Var instanceof rvd) || (dw2VarC = c(iwaVar, ((rvd) f41Var).G, yv2Var)) == null) {
            return null;
        }
        return dw2VarC;
    }

    public static boolean d(yv2 yv2Var, yv2 yv2Var2) {
        if (yv2Var2 != null) {
            no3 no3VarF = d93.f(yv2Var2);
            return no3VarF != no3.h && no3VarF == d93.f(yv2Var);
        }
        a(7);
        throw null;
    }

    public static boolean e(g93 g93Var) {
        if (g93Var != null) {
            return g93Var == a || g93Var == b;
        }
        a(14);
        throw null;
    }

    public static g93 f(l6 l6Var) {
        if (l6Var == null) {
            a(15);
            throw null;
        }
        g93 g93Var = (g93) o.get(l6Var);
        if (g93Var != null) {
            return g93Var;
        }
        ik4.h("Inapplicable visibility: ", l6Var);
        return null;
    }
}
