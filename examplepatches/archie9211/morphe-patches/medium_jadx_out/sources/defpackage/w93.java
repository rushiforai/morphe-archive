package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w93 {
    public static final Set b = qo7.B(xm6.CLASS);
    public static final Set c = k80.S0(new xm6[]{xm6.FILE_FACADE, xm6.MULTIFILE_CLASS_PART});
    public static final zz7 d;
    public static final zz7 e;
    public i93 a;

    static {
        new zz7(new int[]{1, 1, 2}, false);
        d = new zz7(new int[]{1, 1, 11}, false);
        e = new zz7(new int[]{1, 1, 13}, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.ea3 a(defpackage.wx8 r14, defpackage.h1b r15) {
        /*
            r13 = this;
            java.lang.String r2 = "Could not read data from "
            r15.getClass()
            ym6 r0 = r15.b
            java.lang.Object r3 = r0.e
            r8 = r3
            zz7 r8 = (defpackage.zz7) r8
            java.lang.Object r3 = r0.f
            java.lang.String[] r3 = (java.lang.String[]) r3
            if (r3 != 0) goto L16
            java.io.Serializable r3 = r0.g
            java.lang.String[] r3 = (java.lang.String[]) r3
        L16:
            r4 = 0
            if (r3 == 0) goto L26
            java.lang.Object r5 = r0.d
            xm6 r5 = (defpackage.xm6) r5
            java.util.Set r6 = defpackage.w93.c
            boolean r5 = r6.contains(r5)
            if (r5 == 0) goto L26
            goto L27
        L26:
            r3 = r4
        L27:
            if (r3 != 0) goto L2a
            goto L5d
        L2a:
            java.io.Serializable r0 = r0.h
            java.lang.String[] r0 = (java.lang.String[]) r0
            if (r0 != 0) goto L31
            goto L5d
        L31:
            f09 r0 = defpackage.hg6.h(r3, r0)     // Catch: java.lang.Throwable -> L36 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L38
            goto L5b
        L36:
            r0 = move-exception
            goto L47
        L38:
            r0 = move-exception
            java.lang.IllegalStateException r3 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L36
            java.lang.String r5 = r15.a()     // Catch: java.lang.Throwable -> L36
            java.lang.String r2 = r2.concat(r5)     // Catch: java.lang.Throwable -> L36
            r3.<init>(r2, r0)     // Catch: java.lang.Throwable -> L36
            throw r3     // Catch: java.lang.Throwable -> L36
        L47:
            i93 r2 = r13.c()
            no3 r2 = r2.c
            r2.getClass()
            zz7 r2 = r13.e()
            boolean r2 = r8.b(r2)
            if (r2 != 0) goto L9f
            r0 = r4
        L5b:
            if (r0 != 0) goto L5e
        L5d:
            return r4
        L5e:
            java.lang.Object r2 = r0.a
            r3 = r2
            lf6 r3 = (defpackage.lf6) r3
            java.lang.Object r0 = r0.b
            r2 = r0
            e6a r2 = (defpackage.e6a) r2
            nf6 r0 = new nf6
            r13.d(r15)
            boolean r4 = r13.f(r15)
            t93 r5 = r13.b(r15)
            r1 = r15
            r0.<init>(r1, r2, r3, r4, r5)
            ea3 r4 = new ea3
            i93 r10 = r13.c()
            java.lang.StringBuilder r13 = new java.lang.StringBuilder
            java.lang.String r1 = "scope for "
            r13.<init>(r1)
            r13.append(r0)
            java.lang.String r1 = " in "
            r13.append(r1)
            r13.append(r14)
            java.lang.String r11 = r13.toString()
            qk0 r12 = defpackage.qk0.g
            r5 = r14
            r9 = r0
            r6 = r2
            r7 = r3
            r4.<init>(r5, r6, r7, r8, r9, r10, r11, r12)
            return r4
        L9f:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w93.a(wx8, h1b):ea3");
    }

    public final t93 b(h1b h1bVar) {
        c().c.getClass();
        int i = h1bVar.b.c;
        return ((i & 16) == 0 || (i & 32) != 0) ? t93.STABLE : t93.UNSTABLE;
    }

    public final i93 c() {
        i93 i93Var = this.a;
        if (i93Var != null) {
            return i93Var;
        }
        g76.g0("components");
        throw null;
    }

    public final l06 d(h1b h1bVar) {
        c().c.getClass();
        ym6 ym6Var = h1bVar.b;
        zz7 zz7Var = (zz7) ym6Var.e;
        if (((zz7) ym6Var.e).b(e())) {
            return null;
        }
        zz7 zz7Var2 = zz7.g;
        zz7 zz7VarE = e();
        zz7 zz7VarE2 = e();
        boolean z = zz7Var.f;
        zz7VarE2.getClass();
        zz7 zz7Var3 = z ? zz7Var2 : zz7.h;
        int i = zz7Var3.b;
        int i2 = zz7VarE2.b;
        return new l06(zz7Var, zz7Var2, zz7VarE, (i <= i2 && (i < i2 || zz7Var3.c <= zz7VarE2.c)) ? zz7VarE2 : zz7Var3, h1bVar.a());
    }

    public final zz7 e() {
        c().c.getClass();
        return zz7.g;
    }

    public final boolean f(h1b h1bVar) {
        c().c.getClass();
        c().c.getClass();
        ym6 ym6Var = h1bVar.b;
        return (ym6Var.c & 2) != 0 && ((zz7) ym6Var.e).equals(d);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.an1 g(defpackage.h1b r8) {
        /*
            r7 = this;
            java.lang.String r0 = "Could not read data from "
            ym6 r1 = r8.b
            java.lang.Object r2 = r1.e
            zz7 r2 = (defpackage.zz7) r2
            java.lang.Object r3 = r1.f
            java.lang.String[] r3 = (java.lang.String[]) r3
            if (r3 != 0) goto L12
            java.io.Serializable r3 = r1.g
            java.lang.String[] r3 = (java.lang.String[]) r3
        L12:
            r4 = 0
            if (r3 == 0) goto L22
            java.lang.Object r5 = r1.d
            xm6 r5 = (defpackage.xm6) r5
            java.util.Set r6 = defpackage.w93.b
            boolean r5 = r6.contains(r5)
            if (r5 == 0) goto L22
            goto L23
        L22:
            r3 = r4
        L23:
            if (r3 != 0) goto L26
            goto L59
        L26:
            java.io.Serializable r1 = r1.h
            java.lang.String[] r1 = (java.lang.String[]) r1
            if (r1 != 0) goto L2d
            goto L59
        L2d:
            f09 r0 = defpackage.hg6.f(r3, r1)     // Catch: java.lang.Throwable -> L32 kotlin.reflect.jvm.internal.impl.protobuf.InvalidProtocolBufferException -> L34
            goto L57
        L32:
            r0 = move-exception
            goto L43
        L34:
            r1 = move-exception
            java.lang.IllegalStateException r3 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> L32
            java.lang.String r5 = r8.a()     // Catch: java.lang.Throwable -> L32
            java.lang.String r0 = r0.concat(r5)     // Catch: java.lang.Throwable -> L32
            r3.<init>(r0, r1)     // Catch: java.lang.Throwable -> L32
            throw r3     // Catch: java.lang.Throwable -> L32
        L43:
            i93 r1 = r7.c()
            no3 r1 = r1.c
            r1.getClass()
            zz7 r1 = r7.e()
            boolean r1 = r2.b(r1)
            if (r1 != 0) goto L7d
            r0 = r4
        L57:
            if (r0 != 0) goto L5a
        L59:
            return r4
        L5a:
            java.lang.Object r1 = r0.a
            lf6 r1 = (defpackage.lf6) r1
            java.lang.Object r0 = r0.b
            k5a r0 = (defpackage.k5a) r0
            hn6 r3 = new hn6
            r7.d(r8)
            tx9 r4 = new tx9
            boolean r5 = r7.f(r8)
            r4.<init>(r5)
            t93 r7 = r7.b(r8)
            r3.<init>(r8, r4, r7)
            an1 r7 = new an1
            r7.<init>(r1, r0, r2, r3)
            return r7
        L7d:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w93.g(h1b):an1");
    }
}
