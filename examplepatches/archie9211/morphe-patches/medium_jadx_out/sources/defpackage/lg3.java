package defpackage;

import java.io.Closeable;
import java.io.EOFException;
import java.io.Flushable;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lg3 implements Closeable, Flushable {
    public static final x2b t = new x2b("[a-z0-9_-]{1,120}");
    public static final String u = "CLEAN";
    public static final String v = "DIRTY";
    public static final String w = "REMOVE";
    public static final String x = "READ";
    public final g59 a;
    public final ig3 b;
    public final g59 d;
    public final g59 e;
    public final g59 f;
    public long g;
    public xua h;
    public int j;
    public boolean k;
    public boolean l;
    public boolean m;
    public boolean n;
    public boolean o;
    public boolean p;
    public long q;
    public final bgd r;
    public final long c = 4194304;
    public final LinkedHashMap i = new LinkedHashMap(0, 0.75f, true);
    public final hg3 s = new hg3(0, this, ka1.v(new StringBuilder(), ggf.b, " Cache"));

    public lg3(ch4 ch4Var, g59 g59Var, cgd cgdVar) {
        this.a = g59Var;
        this.b = new ig3(ch4Var);
        this.r = cgdVar.d();
        this.d = g59Var.e("journal");
        this.e = g59Var.e("journal.tmp");
        this.f = g59Var.e("journal.bkp");
    }

    public static void g0(String str) {
        if (t.c(str)) {
            return;
        }
        ywb.g(wgd.t('\"', "keys must match regex [a-z0-9_-]{1,120}: \"", str));
    }

    public final synchronized fg3 B(String str) {
        str.getClass();
        D();
        f();
        g0(str);
        cg3 cg3Var = (cg3) this.i.get(str);
        if (cg3Var == null) {
            return null;
        }
        fg3 fg3VarA = cg3Var.a();
        if (fg3VarA == null) {
            return null;
        }
        this.j++;
        xua xuaVar = this.h;
        xuaVar.getClass();
        xuaVar.Y(x);
        xuaVar.writeByte(32);
        xuaVar.Y(str);
        xuaVar.writeByte(10);
        if (I()) {
            this.r.d(this.s, 0L);
        }
        return fg3VarA;
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0066 A[Catch: all -> 0x0027, TRY_ENTER, TryCatch #3 {all -> 0x0027, blocks: (B:4:0x0003, B:8:0x000b, B:10:0x0015, B:13:0x0023, B:16:0x002a, B:17:0x002f, B:38:0x006c, B:40:0x0078, B:50:0x00bb, B:44:0x0083, B:46:0x00b4, B:48:0x00b8, B:49:0x00ba, B:37:0x0066, B:53:0x00c2, B:28:0x0055, B:25:0x0050, B:45:0x00aa, B:19:0x0041), top: B:61:0x0003, inners: #1, #2, #4, #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00c2 A[Catch: all -> 0x0027, TRY_ENTER, TryCatch #3 {all -> 0x0027, blocks: (B:4:0x0003, B:8:0x000b, B:10:0x0015, B:13:0x0023, B:16:0x002a, B:17:0x002f, B:38:0x006c, B:40:0x0078, B:50:0x00bb, B:44:0x0083, B:46:0x00b4, B:48:0x00b8, B:49:0x00ba, B:37:0x0066, B:53:0x00c2, B:28:0x0055, B:25:0x0050, B:45:0x00aa, B:19:0x0041), top: B:61:0x0003, inners: #1, #2, #4, #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0078 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized void D() {
        /*
            r7 = this;
            java.lang.String r0 = "DiskLruCache "
            monitor-enter(r7)
            java.util.TimeZone r1 = defpackage.ggf.a     // Catch: java.lang.Throwable -> L27
            boolean r1 = r7.m     // Catch: java.lang.Throwable -> L27
            if (r1 == 0) goto Lb
            monitor-exit(r7)
            return
        Lb:
            ig3 r1 = r7.b     // Catch: java.lang.Throwable -> L27
            g59 r2 = r7.f     // Catch: java.lang.Throwable -> L27
            boolean r1 = r1.L(r2)     // Catch: java.lang.Throwable -> L27
            if (r1 == 0) goto L2f
            ig3 r1 = r7.b     // Catch: java.lang.Throwable -> L27
            g59 r2 = r7.d     // Catch: java.lang.Throwable -> L27
            boolean r1 = r1.L(r2)     // Catch: java.lang.Throwable -> L27
            ig3 r2 = r7.b
            g59 r3 = r7.f
            if (r1 == 0) goto L2a
            r2.I(r3)     // Catch: java.lang.Throwable -> L27
            goto L2f
        L27:
            r0 = move-exception
            goto Lc3
        L2a:
            g59 r1 = r7.d     // Catch: java.lang.Throwable -> L27
            r2.m(r3, r1)     // Catch: java.lang.Throwable -> L27
        L2f:
            ig3 r1 = r7.b     // Catch: java.lang.Throwable -> L27
            g59 r2 = r7.f     // Catch: java.lang.Throwable -> L27
            byte[] r3 = defpackage.egf.a     // Catch: java.lang.Throwable -> L27
            r1.getClass()     // Catch: java.lang.Throwable -> L27
            r2.getClass()     // Catch: java.lang.Throwable -> L27
            r3 = 0
            bfc r4 = r1.U(r2, r3)     // Catch: java.lang.Throwable -> L27
            r5 = 1
            ch4 r6 = r1.c     // Catch: java.lang.Throwable -> L4d java.io.IOException -> L59
            r6.D(r2)     // Catch: java.lang.Throwable -> L4d java.io.IOException -> L59
            if (r4 == 0) goto L4b
            r4.close()     // Catch: java.lang.Throwable -> L4b
        L4b:
            r1 = r5
            goto L6c
        L4d:
            r6 = move-exception
            if (r4 == 0) goto L64
            r4.close()     // Catch: java.lang.Throwable -> L54
            goto L64
        L54:
            r4 = move-exception
            defpackage.kyd.D(r6, r4)     // Catch: java.lang.Throwable -> L27
            goto L64
        L59:
            if (r4 == 0) goto L62
            r4.close()     // Catch: java.lang.Throwable -> L5f
            goto L62
        L5f:
            r4 = move-exception
        L60:
            r6 = r4
            goto L64
        L62:
            r4 = 0
            goto L60
        L64:
            if (r6 != 0) goto Lc2
            ch4 r1 = r1.c     // Catch: java.lang.Throwable -> L27
            r1.D(r2)     // Catch: java.lang.Throwable -> L27
            r1 = r3
        L6c:
            r7.l = r1     // Catch: java.lang.Throwable -> L27
            ig3 r1 = r7.b     // Catch: java.lang.Throwable -> L27
            g59 r2 = r7.d     // Catch: java.lang.Throwable -> L27
            boolean r1 = r1.L(r2)     // Catch: java.lang.Throwable -> L27
            if (r1 == 0) goto Lbb
            r7.N()     // Catch: java.lang.Throwable -> L27 java.io.IOException -> L82
            r7.L()     // Catch: java.lang.Throwable -> L27 java.io.IOException -> L82
            r7.m = r5     // Catch: java.lang.Throwable -> L27 java.io.IOException -> L82
            monitor-exit(r7)
            return
        L82:
            r1 = move-exception
            ea9 r2 = defpackage.ea9.a     // Catch: java.lang.Throwable -> L27
            ea9 r2 = defpackage.ea9.a     // Catch: java.lang.Throwable -> L27
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L27
            r4.<init>(r0)     // Catch: java.lang.Throwable -> L27
            g59 r0 = r7.a     // Catch: java.lang.Throwable -> L27
            r4.append(r0)     // Catch: java.lang.Throwable -> L27
            java.lang.String r0 = " is corrupt: "
            r4.append(r0)     // Catch: java.lang.Throwable -> L27
            java.lang.String r0 = r1.getMessage()     // Catch: java.lang.Throwable -> L27
            r4.append(r0)     // Catch: java.lang.Throwable -> L27
            java.lang.String r0 = ", removing"
            r4.append(r0)     // Catch: java.lang.Throwable -> L27
            java.lang.String r0 = r4.toString()     // Catch: java.lang.Throwable -> L27
            r4 = 5
            r2.i(r4, r0, r1)     // Catch: java.lang.Throwable -> L27
            r7.close()     // Catch: java.lang.Throwable -> Lb7
            ig3 r0 = r7.b     // Catch: java.lang.Throwable -> Lb7
            g59 r1 = r7.a     // Catch: java.lang.Throwable -> Lb7
            defpackage.egf.c(r0, r1)     // Catch: java.lang.Throwable -> Lb7
            r7.n = r3     // Catch: java.lang.Throwable -> L27
            goto Lbb
        Lb7:
            r0 = move-exception
            r7.n = r3     // Catch: java.lang.Throwable -> L27
            throw r0     // Catch: java.lang.Throwable -> L27
        Lbb:
            r7.R()     // Catch: java.lang.Throwable -> L27
            r7.m = r5     // Catch: java.lang.Throwable -> L27
            monitor-exit(r7)
            return
        Lc2:
            throw r6     // Catch: java.lang.Throwable -> L27
        Lc3:
            monitor-exit(r7)     // Catch: java.lang.Throwable -> L27
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lg3.D():void");
    }

    public final boolean I() {
        int i = this.j;
        return i >= 2000 && i >= this.i.size();
    }

    public final void L() {
        g59 g59Var = this.e;
        ig3 ig3Var = this.b;
        egf.d(ig3Var, g59Var);
        Iterator it2 = this.i.values().iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            next.getClass();
            cg3 cg3Var = (cg3) next;
            int i = 0;
            if (cg3Var.g == null) {
                while (i < 2) {
                    this.g += cg3Var.b[i];
                    i++;
                }
            } else {
                cg3Var.g = null;
                while (i < 2) {
                    egf.d(ig3Var, (g59) cg3Var.c.get(i));
                    egf.d(ig3Var, (g59) cg3Var.d.get(i));
                    i++;
                }
                it2.remove();
            }
        }
    }

    public final void N() throws Throwable {
        ig3 ig3Var = this.b;
        g59 g59Var = this.d;
        yua yuaVarI = wo7.i(ig3Var.g0(g59Var));
        try {
            String strI = yuaVarI.I(Long.MAX_VALUE);
            String strI2 = yuaVarI.I(Long.MAX_VALUE);
            String strI3 = yuaVarI.I(Long.MAX_VALUE);
            String strI4 = yuaVarI.I(Long.MAX_VALUE);
            String strI5 = yuaVarI.I(Long.MAX_VALUE);
            if (!"libcore.io.DiskLruCache".equals(strI) || !"1".equals(strI2) || !g76.L(String.valueOf(201105), strI3) || !g76.L(String.valueOf(2), strI4) || strI5.length() > 0) {
                throw new IOException("unexpected journal header: [" + strI + ", " + strI2 + ", " + strI4 + ", " + strI5 + ']');
            }
            int i = 0;
            while (true) {
                try {
                    Q(yuaVarI.I(Long.MAX_VALUE));
                    i++;
                } catch (EOFException unused) {
                    this.j = i - this.i.size();
                    if (yuaVarI.H()) {
                        xua xuaVar = this.h;
                        if (xuaVar != null) {
                            egf.b(xuaVar);
                        }
                        ig3Var.getClass();
                        g59Var.getClass();
                        this.h = new xua(new aa4(ig3Var.f(g59Var), new s0(22, this)));
                    } else {
                        R();
                    }
                    try {
                        yuaVarI.close();
                        th = null;
                    } catch (Throwable th) {
                        th = th;
                    }
                }
            }
        } catch (Throwable th2) {
            th = th2;
            try {
                yuaVarI.close();
            } catch (Throwable th3) {
                kyd.D(th, th3);
            }
        }
        if (th != null) {
            throw th;
        }
    }

    public final void Q(String str) throws IOException {
        String strSubstring;
        int iY = muc.Y(str, ' ', 0, 6);
        if (iY == -1) {
            ik4.g("unexpected journal line: ".concat(str));
            return;
        }
        int i = iY + 1;
        int iY2 = muc.Y(str, ' ', i, 4);
        LinkedHashMap linkedHashMap = this.i;
        if (iY2 == -1) {
            strSubstring = str.substring(i);
            String str2 = w;
            if (iY == str2.length() && tuc.N(str, str2, false)) {
                linkedHashMap.remove(strSubstring);
                return;
            }
        } else {
            strSubstring = str.substring(i, iY2);
        }
        cg3 cg3Var = (cg3) linkedHashMap.get(strSubstring);
        if (cg3Var == null) {
            cg3Var = new cg3(this, strSubstring);
            linkedHashMap.put(strSubstring, cg3Var);
        }
        if (iY2 != -1) {
            String str3 = u;
            if (iY == str3.length() && tuc.N(str, str3, false)) {
                List listO0 = muc.o0(str.substring(iY2 + 1), new char[]{' '});
                cg3Var.e = true;
                cg3Var.g = null;
                int size = listO0.size();
                cg3Var.j.getClass();
                if (size != 2) {
                    ywb.o("unexpected journal line: ", listO0);
                    return;
                }
                try {
                    int size2 = listO0.size();
                    for (int i2 = 0; i2 < size2; i2++) {
                        cg3Var.b[i2] = Long.parseLong((String) listO0.get(i2));
                    }
                    return;
                } catch (NumberFormatException unused) {
                    ywb.o("unexpected journal line: ", listO0);
                    return;
                }
            }
        }
        if (iY2 == -1) {
            String str4 = v;
            if (iY == str4.length() && tuc.N(str, str4, false)) {
                cg3Var.g = new zf3(this, cg3Var);
                return;
            }
        }
        if (iY2 == -1) {
            String str5 = x;
            if (iY == str5.length() && tuc.N(str, str5, false)) {
                return;
            }
        }
        ik4.g("unexpected journal line: ".concat(str));
    }

    public final synchronized void R() {
        Throwable th;
        try {
            xua xuaVar = this.h;
            if (xuaVar != null) {
                xuaVar.close();
            }
            xua xuaVarH = wo7.h(this.b.U(this.e, false));
            try {
                xuaVarH.Y("libcore.io.DiskLruCache");
                xuaVarH.writeByte(10);
                xuaVarH.Y("1");
                xuaVarH.writeByte(10);
                xuaVarH.y0(201105L);
                xuaVarH.writeByte(10);
                xuaVarH.y0(2L);
                xuaVarH.writeByte(10);
                xuaVarH.writeByte(10);
                for (Object obj : this.i.values()) {
                    obj.getClass();
                    cg3 cg3Var = (cg3) obj;
                    if (cg3Var.g != null) {
                        xuaVarH.Y(v);
                        xuaVarH.writeByte(32);
                        xuaVarH.Y(cg3Var.a);
                        xuaVarH.writeByte(10);
                    } else {
                        xuaVarH.Y(u);
                        xuaVarH.writeByte(32);
                        xuaVarH.Y(cg3Var.a);
                        for (long j : cg3Var.b) {
                            xuaVarH.writeByte(32);
                            xuaVarH.y0(j);
                        }
                        xuaVarH.writeByte(10);
                    }
                }
                try {
                    xuaVarH.close();
                    th = null;
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                try {
                    xuaVarH.close();
                } catch (Throwable th4) {
                    kyd.D(th3, th4);
                }
                th = th3;
            }
            if (th != null) {
                throw th;
            }
            boolean zL = this.b.L(this.d);
            ig3 ig3Var = this.b;
            if (zL) {
                ig3Var.m(this.d, this.f);
                this.b.m(this.e, this.d);
                egf.d(this.b, this.f);
            } else {
                ig3Var.m(this.e, this.d);
            }
            xua xuaVar2 = this.h;
            if (xuaVar2 != null) {
                egf.b(xuaVar2);
            }
            ig3 ig3Var2 = this.b;
            g59 g59Var = this.d;
            ig3Var2.getClass();
            g59Var.getClass();
            this.h = new xua(new aa4(ig3Var2.f(g59Var), new s0(22, this)));
            this.k = false;
            this.p = false;
        } catch (Throwable th5) {
            throw th5;
        }
    }

    public final void T(cg3 cg3Var) {
        xua xuaVar;
        String str = cg3Var.a;
        if (!this.l) {
            if (cg3Var.h > 0 && (xuaVar = this.h) != null) {
                xuaVar.Y(v);
                xuaVar.writeByte(32);
                xuaVar.Y(str);
                xuaVar.writeByte(10);
                xuaVar.flush();
            }
            if (cg3Var.h > 0 || cg3Var.g != null) {
                cg3Var.f = true;
                return;
            }
        }
        zf3 zf3Var = cg3Var.g;
        if (zf3Var != null) {
            zf3Var.e();
        }
        for (int i = 0; i < 2; i++) {
            egf.d(this.b, (g59) cg3Var.c.get(i));
            long j = this.g;
            long[] jArr = cg3Var.b;
            this.g = j - jArr[i];
            jArr[i] = 0;
        }
        this.j++;
        xua xuaVar2 = this.h;
        if (xuaVar2 != null) {
            xuaVar2.Y(w);
            xuaVar2.writeByte(32);
            xuaVar2.Y(str);
            xuaVar2.writeByte(10);
        }
        this.i.remove(str);
        if (I()) {
            this.r.d(this.s, 0L);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0025, code lost:
    
        T(r1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void U() {
        /*
            r4 = this;
        L0:
            long r0 = r4.g
            long r2 = r4.c
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 <= 0) goto L2a
            java.util.LinkedHashMap r0 = r4.i
            java.util.Collection r0 = r0.values()
            java.util.Iterator r0 = r0.iterator()
        L12:
            boolean r1 = r0.hasNext()
            if (r1 == 0) goto L29
            java.lang.Object r1 = r0.next()
            r1.getClass()
            cg3 r1 = (defpackage.cg3) r1
            boolean r2 = r1.f
            if (r2 != 0) goto L12
            r4.T(r1)
            goto L0
        L29:
            return
        L2a:
            r0 = 0
            r4.o = r0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lg3.U():void");
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        try {
            if (this.m && !this.n) {
                Collection collectionValues = this.i.values();
                collectionValues.getClass();
                for (cg3 cg3Var : (cg3[]) collectionValues.toArray(new cg3[0])) {
                    cg3Var.getClass();
                    zf3 zf3Var = cg3Var.g;
                    if (zf3Var != null) {
                        zf3Var.e();
                    }
                }
                U();
                xua xuaVar = this.h;
                if (xuaVar != null) {
                    egf.b(xuaVar);
                }
                this.h = null;
                this.n = true;
                return;
            }
            this.n = true;
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void f() {
        if (this.n) {
            throw new IllegalStateException("cache is closed");
        }
    }

    @Override // java.io.Flushable
    public final synchronized void flush() {
        if (this.m) {
            f();
            U();
            xua xuaVar = this.h;
            xuaVar.getClass();
            xuaVar.flush();
        }
    }

    public final synchronized void m(zf3 zf3Var, boolean z) {
        cg3 cg3Var = (cg3) zf3Var.d;
        if (!g76.L(cg3Var.g, zf3Var)) {
            throw new IllegalStateException("Check failed.");
        }
        if (z && !cg3Var.e) {
            for (int i = 0; i < 2; i++) {
                boolean[] zArr = (boolean[]) zf3Var.b;
                zArr.getClass();
                if (!zArr[i]) {
                    zf3Var.a();
                    throw new IllegalStateException("Newly created entry didn't create value for index " + i);
                }
                if (!this.b.L((g59) cg3Var.d.get(i))) {
                    zf3Var.a();
                    return;
                }
            }
        }
        for (int i2 = 0; i2 < 2; i2++) {
            g59 g59Var = (g59) cg3Var.d.get(i2);
            if (!z || cg3Var.f) {
                egf.d(this.b, g59Var);
            } else if (this.b.L(g59Var)) {
                g59 g59Var2 = (g59) cg3Var.c.get(i2);
                this.b.m(g59Var, g59Var2);
                long j = cg3Var.b[i2];
                Long l = (Long) this.b.Q(g59Var2).e;
                long jLongValue = l != null ? l.longValue() : 0L;
                cg3Var.b[i2] = jLongValue;
                this.g = (this.g - j) + jLongValue;
            }
        }
        cg3Var.g = null;
        if (cg3Var.f) {
            T(cg3Var);
            return;
        }
        this.j++;
        xua xuaVar = this.h;
        xuaVar.getClass();
        if (cg3Var.e || z) {
            cg3Var.e = true;
            xuaVar.Y(u);
            xuaVar.writeByte(32);
            xuaVar.Y(cg3Var.a);
            for (long j2 : cg3Var.b) {
                xuaVar.writeByte(32);
                xuaVar.y0(j2);
            }
            xuaVar.writeByte(10);
            if (z) {
                long j3 = this.q;
                this.q = 1 + j3;
                cg3Var.i = j3;
            }
        } else {
            this.i.remove(cg3Var.a);
            xuaVar.Y(w);
            xuaVar.writeByte(32);
            xuaVar.Y(cg3Var.a);
            xuaVar.writeByte(10);
        }
        xuaVar.flush();
        if (this.g > this.c || I()) {
            this.r.d(this.s, 0L);
        }
    }

    public final synchronized zf3 p(long j, String str) {
        str.getClass();
        D();
        f();
        g0(str);
        cg3 cg3Var = (cg3) this.i.get(str);
        if (j != -1 && (cg3Var == null || cg3Var.i != j)) {
            return null;
        }
        if ((cg3Var != null ? cg3Var.g : null) != null) {
            return null;
        }
        if (cg3Var != null && cg3Var.h != 0) {
            return null;
        }
        if (!this.o && !this.p) {
            xua xuaVar = this.h;
            xuaVar.getClass();
            xuaVar.Y(v);
            xuaVar.writeByte(32);
            xuaVar.Y(str);
            xuaVar.writeByte(10);
            xuaVar.flush();
            if (this.k) {
                return null;
            }
            if (cg3Var == null) {
                cg3Var = new cg3(this, str);
                this.i.put(str, cg3Var);
            }
            zf3 zf3Var = new zf3(this, cg3Var);
            cg3Var.g = zf3Var;
            return zf3Var;
        }
        this.r.d(this.s, 0L);
        return null;
    }
}
