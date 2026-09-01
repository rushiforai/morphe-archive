package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;
import java.io.EOFException;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mg3 implements AutoCloseable {
    public static final x2b r = new x2b("[a-z0-9_-]{1,120}");
    public final g59 a;
    public final long b;
    public final g59 c;
    public final g59 d;
    public final g59 e;
    public final LinkedHashMap f;
    public final k92 g;
    public final Object h;
    public long i;
    public int j;
    public xua k;
    public boolean l;
    public boolean m;
    public boolean n;
    public boolean o;
    public boolean p;
    public final jg3 q;

    public mg3(long j, ch4 ch4Var, g59 g59Var) {
        this.a = g59Var;
        this.b = j;
        if (j <= 0) {
            ay0.e("maxSize <= 0");
            throw null;
        }
        this.c = g59Var.e("journal");
        this.d = g59Var.e("journal.tmp");
        this.e = g59Var.e("journal.bkp");
        this.f = new LinkedHashMap(0, 0.75f, true);
        m2d m2dVarH = qq7.h();
        kb2.b.getClass();
        r13 r13Var = xg3.a;
        this.g = o7f.c(flb.p0(m2dVarH, vz2.c.H0(1)));
        this.h = new Object();
        this.q = new jg3(ch4Var);
    }

    public static void T(String str) {
        if (r.c(str)) {
            return;
        }
        ywb.g(wgd.t('\"', "keys must match regex [a-z0-9_-]{1,120}: \"", str));
    }

    public final void B() {
        synchronized (this.h) {
            try {
                if (this.m) {
                    return;
                }
                this.q.D(this.d);
                if (this.q.L(this.e)) {
                    boolean zL = this.q.L(this.c);
                    jg3 jg3Var = this.q;
                    g59 g59Var = this.e;
                    if (zL) {
                        jg3Var.D(g59Var);
                    } else {
                        jg3Var.m(g59Var, this.c);
                    }
                }
                if (this.q.L(this.c)) {
                    try {
                        L();
                        I();
                        this.m = true;
                        return;
                    } catch (IOException unused) {
                        try {
                            close();
                            vv2.E(this.q, this.a);
                            this.n = false;
                            U();
                            this.m = true;
                        } catch (Throwable th) {
                            this.n = false;
                            throw th;
                        }
                    }
                }
                U();
                this.m = true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void D() {
        vx0.c0(this.g, null, null, new z8(this, null, 19), 3);
    }

    public final void I() {
        Iterator it2 = this.f.values().iterator();
        long j = 0;
        while (it2.hasNext()) {
            dg3 dg3Var = (dg3) it2.next();
            int i = 0;
            if (dg3Var.g == null) {
                while (i < 2) {
                    j += dg3Var.b[i];
                    i++;
                }
            } else {
                dg3Var.g = null;
                while (i < 2) {
                    g59 g59Var = (g59) dg3Var.c.get(i);
                    jg3 jg3Var = this.q;
                    jg3Var.I(g59Var);
                    jg3Var.I((g59) dg3Var.d.get(i));
                    i++;
                }
                it2.remove();
            }
        }
        this.i = j;
    }

    public final void N(String str) throws IOException {
        String strSubstring;
        int iY = muc.Y(str, ' ', 0, 6);
        if (iY == -1) {
            ik4.g("unexpected journal line: ".concat(str));
            return;
        }
        int i = iY + 1;
        int iY2 = muc.Y(str, ' ', i, 4);
        LinkedHashMap linkedHashMap = this.f;
        if (iY2 == -1) {
            strSubstring = str.substring(i);
            if (iY == 6 && tuc.N(str, "REMOVE", false)) {
                linkedHashMap.remove(strSubstring);
                return;
            }
        } else {
            strSubstring = str.substring(i, iY2);
        }
        Object dg3Var = linkedHashMap.get(strSubstring);
        if (dg3Var == null) {
            dg3Var = new dg3(this, strSubstring);
            linkedHashMap.put(strSubstring, dg3Var);
        }
        dg3 dg3Var2 = (dg3) dg3Var;
        if (iY2 == -1 || iY != 5 || !tuc.N(str, "CLEAN", false)) {
            if (iY2 == -1 && iY == 5 && tuc.N(str, "DIRTY", false)) {
                dg3Var2.g = new zf3(this, dg3Var2);
                return;
            } else {
                if (iY2 == -1 && iY == 4 && tuc.N(str, "READ", false)) {
                    return;
                }
                ik4.g("unexpected journal line: ".concat(str));
                return;
            }
        }
        List listO0 = muc.o0(str.substring(iY2 + 1), new char[]{' '});
        dg3Var2.e = true;
        dg3Var2.g = null;
        if (listO0.size() != 2) {
            ywb.o("unexpected journal line: ", listO0);
            return;
        }
        try {
            int size = listO0.size();
            for (int i2 = 0; i2 < size; i2++) {
                dg3Var2.b[i2] = Long.parseLong((String) listO0.get(i2));
            }
        } catch (NumberFormatException unused) {
            ywb.o("unexpected journal line: ", listO0);
        }
    }

    public final void Q(dg3 dg3Var) {
        xua xuaVar;
        int i = dg3Var.h;
        String str = dg3Var.a;
        if (i > 0 && (xuaVar = this.k) != null) {
            xuaVar.Y("DIRTY");
            xuaVar.writeByte(32);
            xuaVar.Y(str);
            xuaVar.writeByte(10);
            xuaVar.flush();
        }
        if (dg3Var.h > 0 || dg3Var.g != null) {
            dg3Var.f = true;
            return;
        }
        for (int i2 = 0; i2 < 2; i2++) {
            this.q.I((g59) dg3Var.c.get(i2));
            long j = this.i;
            long[] jArr = dg3Var.b;
            this.i = j - jArr[i2];
            jArr[i2] = 0;
        }
        this.j++;
        xua xuaVar2 = this.k;
        if (xuaVar2 != null) {
            xuaVar2.Y("REMOVE");
            xuaVar2.writeByte(32);
            xuaVar2.Y(str);
            xuaVar2.writeByte(10);
            xuaVar2.flush();
        }
        this.f.remove(str);
        if (this.j >= 2000) {
            D();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0022, code lost:
    
        Q(r1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void R() {
        /*
            r4 = this;
        L0:
            long r0 = r4.i
            long r2 = r4.b
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 <= 0) goto L27
            java.util.LinkedHashMap r0 = r4.f
            java.util.Collection r0 = r0.values()
            java.util.Iterator r0 = r0.iterator()
        L12:
            boolean r1 = r0.hasNext()
            if (r1 == 0) goto L26
            java.lang.Object r1 = r0.next()
            dg3 r1 = (defpackage.dg3) r1
            boolean r2 = r1.f
            if (r2 != 0) goto L12
            r4.Q(r1)
            goto L0
        L26:
            return
        L27:
            r0 = 0
            r4.o = r0
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mg3.R():void");
    }

    public final void U() {
        Throwable th;
        synchronized (this.h) {
            try {
                xua xuaVar = this.k;
                if (xuaVar != null) {
                    xuaVar.close();
                }
                xua xuaVarH = wo7.h(this.q.U(this.d, false));
                try {
                    xuaVarH.Y("libcore.io.DiskLruCache");
                    xuaVarH.writeByte(10);
                    xuaVarH.Y("1");
                    xuaVarH.writeByte(10);
                    xuaVarH.y0(3L);
                    xuaVarH.writeByte(10);
                    xuaVarH.y0(2L);
                    xuaVarH.writeByte(10);
                    xuaVarH.writeByte(10);
                    for (dg3 dg3Var : this.f.values()) {
                        if (dg3Var.g != null) {
                            xuaVarH.Y("DIRTY");
                            xuaVarH.writeByte(32);
                            xuaVarH.Y(dg3Var.a);
                            xuaVarH.writeByte(10);
                        } else {
                            xuaVarH.Y("CLEAN");
                            xuaVarH.writeByte(32);
                            xuaVarH.Y(dg3Var.a);
                            for (long j : dg3Var.b) {
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
                boolean zL = this.q.L(this.c);
                jg3 jg3Var = this.q;
                if (zL) {
                    jg3Var.m(this.c, this.e);
                    this.q.m(this.d, this.c);
                    this.q.D(this.e);
                } else {
                    jg3Var.m(this.d, this.c);
                }
                this.k = new xua(new w33(this.q.f(this.c), new s0(23, this), 1));
                this.j = 0;
                this.l = false;
                this.p = false;
            } catch (Throwable th5) {
                throw th5;
            }
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        synchronized (this.h) {
            try {
                if (this.m && !this.n) {
                    for (dg3 dg3Var : (dg3[]) this.f.values().toArray(new dg3[0])) {
                        zf3 zf3Var = dg3Var.g;
                        if (zf3Var != null) {
                            dg3 dg3Var2 = (dg3) zf3Var.d;
                            if (g76.L(dg3Var2.g, zf3Var)) {
                                dg3Var2.f = true;
                            }
                        }
                    }
                    R();
                    o7f.m(this.g, null);
                    xua xuaVar = this.k;
                    xuaVar.getClass();
                    xuaVar.close();
                    this.k = null;
                    this.n = true;
                    return;
                }
                this.n = true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x0111 A[Catch: all -> 0x0037, TRY_LEAVE, TryCatch #0 {, blocks: (B:4:0x0003, B:8:0x0013, B:12:0x001a, B:14:0x0022, B:16:0x0032, B:24:0x0040, B:27:0x005a, B:29:0x0069, B:31:0x0079, B:33:0x0080, B:28:0x005e, B:37:0x00a0, B:39:0x00a7, B:42:0x00ac, B:44:0x00bd, B:47:0x00c2, B:52:0x00fd, B:54:0x0108, B:58:0x0111, B:48:0x00da, B:50:0x00ef, B:51:0x00fa, B:36:0x0090, B:61:0x0116, B:62:0x011d), top: B:65:0x0003 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(defpackage.zf3 r11, boolean r12) {
        /*
            Method dump skipped, instruction units count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mg3.f(zf3, boolean):void");
    }

    public final zf3 m(String str) {
        synchronized (this.h) {
            if (this.n) {
                throw new IllegalStateException("cache is closed");
            }
            T(str);
            B();
            dg3 dg3Var = (dg3) this.f.get(str);
            if ((dg3Var != null ? dg3Var.g : null) != null) {
                return null;
            }
            if (dg3Var != null && dg3Var.h != 0) {
                return null;
            }
            if (!this.o && !this.p) {
                xua xuaVar = this.k;
                xuaVar.getClass();
                xuaVar.Y("DIRTY");
                xuaVar.writeByte(32);
                xuaVar.Y(str);
                xuaVar.writeByte(10);
                xuaVar.flush();
                if (this.l) {
                    return null;
                }
                if (dg3Var == null) {
                    dg3Var = new dg3(this, str);
                    this.f.put(str, dg3Var);
                }
                zf3 zf3Var = new zf3(this, dg3Var);
                dg3Var.g = zf3Var;
                return zf3Var;
            }
            D();
            return null;
        }
    }

    public final gg3 p(String str) {
        gg3 gg3VarA;
        synchronized (this.h) {
            if (this.n) {
                throw new IllegalStateException("cache is closed");
            }
            T(str);
            B();
            dg3 dg3Var = (dg3) this.f.get(str);
            if (dg3Var != null && (gg3VarA = dg3Var.a()) != null) {
                boolean z = true;
                this.j++;
                xua xuaVar = this.k;
                xuaVar.getClass();
                xuaVar.Y("READ");
                xuaVar.writeByte(32);
                xuaVar.Y(str);
                xuaVar.writeByte(10);
                xuaVar.flush();
                if (this.j < 2000) {
                    z = false;
                }
                if (z) {
                    D();
                }
                return gg3VarA;
            }
            return null;
        }
    }

    public final void L() throws Throwable {
        String str = KLTXZbnQvj.nfvluyWImKs;
        jg3 jg3Var = this.q;
        ch4 ch4Var = jg3Var.c;
        g59 g59Var = this.c;
        yua yuaVarI = wo7.i(ch4Var.g0(g59Var));
        try {
            String strI = yuaVarI.I(Long.MAX_VALUE);
            String strI2 = yuaVarI.I(Long.MAX_VALUE);
            String strI3 = yuaVarI.I(Long.MAX_VALUE);
            String strI4 = yuaVarI.I(Long.MAX_VALUE);
            String strI5 = yuaVarI.I(Long.MAX_VALUE);
            if (!"libcore.io.DiskLruCache".equals(strI) || !"1".equals(strI2) || !g76.L(String.valueOf(3), strI3) || !g76.L(String.valueOf(2), strI4) || strI5.length() > 0) {
                throw new IOException("unexpected journal header: [" + strI + str + strI2 + str + strI3 + str + strI4 + str + strI5 + ']');
            }
            int i = 0;
            while (true) {
                try {
                    N(yuaVarI.I(Long.MAX_VALUE));
                    i++;
                } catch (EOFException unused) {
                    this.j = i - this.f.size();
                    if (yuaVarI.H()) {
                        this.k = new xua(new w33(jg3Var.f(g59Var), new s0(23, this), 1));
                    } else {
                        U();
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
}
