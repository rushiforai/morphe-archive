package defpackage;

import android.content.Context;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w6c {
    public final n79 a;
    public final m14 b;
    public final Context c;
    public final String d;
    public final w5d e;
    public final Set f;

    public w6c(Context context, String str, Set set, n79 n79Var, m14 m14Var) {
        set.getClass();
        ma2 ma2Var = new ma2(2, context, str);
        this.a = n79Var;
        this.b = m14Var;
        this.c = context;
        this.d = str;
        this.e = new w5d(ma2Var);
        this.f = set == y6c.a ? null : bu1.p1(set);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.Object r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.v6c
            if (r0 == 0) goto L13
            r0 = r6
            v6c r0 = (defpackage.v6c) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            v6c r0 = new v6c
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            w6c r4 = r0.b
            defpackage.br7.v(r6)
            goto L40
        L29:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L30:
            defpackage.br7.v(r6)
            r0.b = r4
            r0.e = r3
            n79 r6 = r4.a
            java.lang.Object r6 = r6.invoke(r5, r0)
            if (r6 != r1) goto L40
            return r1
        L40:
            java.lang.Boolean r6 = (java.lang.Boolean) r6
            boolean r5 = r6.booleanValue()
            if (r5 != 0) goto L4b
            java.lang.Boolean r4 = java.lang.Boolean.FALSE
            return r4
        L4b:
            java.util.Set r5 = r4.f
            w5d r4 = r4.e
            r6 = 0
            if (r5 != 0) goto L68
            java.lang.Object r4 = r4.getValue()
            android.content.SharedPreferences r4 = (android.content.SharedPreferences) r4
            java.util.Map r4 = r4.getAll()
            r4.getClass()
            boolean r4 = r4.isEmpty()
            if (r4 != 0) goto L66
            goto L94
        L66:
            r3 = r6
            goto L94
        L68:
            java.lang.Iterable r5 = (java.lang.Iterable) r5
            java.lang.Object r4 = r4.getValue()
            android.content.SharedPreferences r4 = (android.content.SharedPreferences) r4
            boolean r0 = r5 instanceof java.util.Collection
            if (r0 == 0) goto L7e
            r0 = r5
            java.util.Collection r0 = (java.util.Collection) r0
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto L7e
            goto L66
        L7e:
            java.util.Iterator r5 = r5.iterator()
        L82:
            boolean r0 = r5.hasNext()
            if (r0 == 0) goto L66
            java.lang.Object r0 = r5.next()
            java.lang.String r0 = (java.lang.String) r0
            boolean r0 = r4.contains(r0)
            if (r0 == 0) goto L82
        L94:
            java.lang.Boolean r4 = java.lang.Boolean.valueOf(r3)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w6c.a(java.lang.Object, p92):java.lang.Object");
    }
}
