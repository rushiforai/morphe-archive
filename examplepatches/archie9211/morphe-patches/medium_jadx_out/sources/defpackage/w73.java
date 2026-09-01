package defpackage;

import android.os.Trace;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class w73 {
    public final /* synthetic */ int a;
    public boolean b;
    public boolean c;
    public final Object d;
    public final Object e;
    public final Object f;
    public final Object g;
    public Object h;
    public Object i;

    public w73(tu2 tu2Var, vw3 vw3Var, xi1 xi1Var) {
        int i;
        f42 f42Var;
        Object d59Var;
        this.a = 3;
        dlb dlbVar = tu2Var.g;
        u2d u2dVar = tu2Var.c;
        bnb bnbVar = tu2Var.p;
        String str = tu2Var.b;
        this.d = tu2Var;
        this.e = vw3Var;
        Object obj = tu2Var.e;
        this.f = obj == null ? ey3.a : obj;
        v2d v2dVarY = null;
        if (bnbVar != null) {
            this.h = null;
            if (bnbVar.W()) {
                d59Var = new d59(new s26(this, bnbVar), str == null ? ":memory:" : str, xi1Var);
            } else {
                if (str == null) {
                    f42Var = new f42(new s26(this, bnbVar));
                } else {
                    s26 s26Var = new s26(this, bnbVar);
                    dlbVar.getClass();
                    int[] iArr = yn0.a;
                    int i2 = iArr[dlbVar.ordinal()];
                    if (i2 == 1) {
                        i = 1;
                    } else {
                        if (i2 != 2) {
                            lg8.y("Can't get max number of reader for journal mode '", dlbVar);
                            throw null;
                        }
                        i = 4;
                    }
                    int i3 = iArr[dlbVar.ordinal()];
                    if (i3 != 1 && i3 != 2) {
                        lg8.y("Can't get max number of writers for journal mode '", dlbVar);
                        throw null;
                    }
                    f42Var = new f42(s26Var, str, i);
                }
                d59Var = f42Var;
            }
            this.g = d59Var;
        } else {
            if (u2dVar == null) {
                ay0.e("SQLiteManager was constructed with both null driver and open helper factory!");
                throw null;
            }
            v2dVarY = u2dVar.y(new zdc(tu2Var.a, str, new ad(this, vw3Var.a), false, false));
            this.h = v2dVarY;
            this.g = new d59(new wjc(v2dVarY), str == null ? ":memory:" : str, xi1Var);
        }
        boolean z = dlbVar == dlb.WRITE_AHEAD_LOGGING;
        if (v2dVarY != null) {
            v2dVarY.setWriteAheadLoggingEnabled(z);
        }
    }

    public static void e(anb anbVar) {
        gnb gnbVarB0 = anbVar.B0("PRAGMA busy_timeout");
        try {
            gnbVarB0.w0();
            long j = gnbVarB0.getLong(0);
            xz5.F(gnbVarB0, null);
            if (j < 3000) {
                qk7.q(anbVar, "PRAGMA busy_timeout = 3000");
            }
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                xz5.F(gnbVarB0, th);
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean h(defpackage.aq6 r5, defpackage.f72 r6) {
        /*
            aq6 r0 = r5.h
            eq6 r1 = r5.G
            r2 = 0
            if (r0 != 0) goto L8
            return r2
        L8:
            if (r6 == 0) goto L1a
            if (r0 == 0) goto L18
            mb7 r0 = r1.q
            r0.getClass()
            long r3 = r6.a
            boolean r6 = r0.v0(r3)
            goto L2f
        L18:
            r6 = r2
            goto L2f
        L1a:
            mb7 r6 = r1.q
            if (r6 == 0) goto L21
            f72 r1 = r6.n
            goto L22
        L21:
            r1 = 0
        L22:
            if (r1 == 0) goto L18
            if (r0 == 0) goto L18
            r6.getClass()
            long r0 = r1.a
            boolean r6 = r6.v0(r0)
        L2f:
            aq6 r0 = r5.v()
            if (r6 == 0) goto L57
            if (r0 == 0) goto L57
            aq6 r1 = r0.h
            r3 = 3
            if (r1 != 0) goto L40
            defpackage.aq6.V(r0, r2, r3)
            return r6
        L40:
            yp6 r1 = r5.s()
            yp6 r4 = defpackage.yp6.InMeasureBlock
            if (r1 != r4) goto L4c
            defpackage.aq6.T(r0, r2, r3)
            return r6
        L4c:
            yp6 r5 = r5.s()
            yp6 r1 = defpackage.yp6.InLayoutBlock
            if (r5 != r1) goto L57
            r0.S(r2)
        L57:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w73.h(aq6, f72):boolean");
    }

    public static boolean i(aq6 aq6Var, f72 f72Var) {
        boolean zV0;
        if (f72Var != null) {
            if (aq6Var.C == yp6.NotUsed) {
                aq6Var.e();
            }
            zV0 = aq6Var.G.p.v0(f72Var.a);
        } else {
            yk7 yk7Var = aq6Var.G.p;
            f72 f72Var2 = yk7Var.j ? new f72(yk7Var.d) : null;
            if (f72Var2 != null) {
                if (aq6Var.C == yp6.NotUsed) {
                    aq6Var.e();
                }
                zV0 = aq6Var.G.p.v0(f72Var2.a);
            } else {
                aq6Var.getClass();
                zV0 = false;
            }
        }
        aq6 aq6VarV = aq6Var.v();
        if (zV0 && aq6VarV != null) {
            if (aq6Var.r() == yp6.InMeasureBlock) {
                aq6.V(aq6VarV, false, 3);
                return zV0;
            }
            if (aq6Var.r() == yp6.InLayoutBlock) {
                aq6VarV.U(false);
            }
        }
        return zV0;
    }

    public static boolean o(aq6 aq6Var) {
        mb7 mb7Var;
        bq6 bq6Var;
        if (aq6Var.G.e) {
            return (aq6Var.s() == yp6.NotUsed && ((mb7Var = aq6Var.G.q) == null || (bq6Var = mb7Var.s) == null || !bq6Var.e())) ? false : true;
        }
        return false;
    }

    public static boolean p(aq6 aq6Var) {
        if (!aq6Var.q()) {
            return false;
        }
        do {
            if (aq6Var.r() == yp6.NotUsed && !aq6Var.G.p.y.e()) {
                aq6 aq6VarV = aq6Var.v();
                if ((aq6VarV != null ? aq6VarV.G.d : null) != wp6.Measuring) {
                    return false;
                }
            }
            aq6Var = aq6Var.v();
            if (aq6Var == null) {
                return false;
            }
        } while (!aq6Var.I());
        return true;
    }

    public static boolean q(aq6 aq6Var) {
        mb7 mb7Var;
        bq6 bq6Var;
        eq6 eq6Var = aq6Var.G;
        return aq6Var.I() || eq6Var.p.u || p(aq6Var) || g76.L(aq6Var.J(), Boolean.TRUE) || o(aq6Var) || eq6Var.p.y.e() || !((mb7Var = eq6Var.q) == null || (bq6Var = mb7Var.s) == null || !bq6Var.e());
    }

    public boolean A(aq6 aq6Var, boolean z) {
        f72 f72Var;
        boolean zI = false;
        if (!aq6Var.Q && q(aq6Var)) {
            if (aq6Var == ((aq6) this.d)) {
                f72Var = (f72) this.i;
                f72Var.getClass();
            } else {
                f72Var = null;
            }
            if (z) {
                if (aq6Var.G.e) {
                    zI = h(aq6Var, f72Var);
                }
            } else if (aq6Var.q()) {
                zI = i(aq6Var, f72Var);
            }
            j();
        }
        return zI;
    }

    public void B(aq6 aq6Var) {
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if (aq6Var2.r() == yp6.InMeasureBlock || aq6Var2.G.p.y.e()) {
                if (dm2.L(aq6Var2)) {
                    C(aq6Var2, true);
                } else {
                    B(aq6Var2);
                }
            }
        }
    }

    public void C(aq6 aq6Var, boolean z) {
        f72 f72Var;
        if (aq6Var.Q) {
            return;
        }
        if (aq6Var == ((aq6) this.d)) {
            f72Var = (f72) this.i;
            f72Var.getClass();
        } else {
            f72Var = null;
        }
        if (z) {
            h(aq6Var, f72Var);
        } else {
            i(aq6Var, f72Var);
        }
    }

    public boolean D(aq6 aq6Var, boolean z) {
        int i = vk7.a[aq6Var.G.d.ordinal()];
        if (i != 1 && i != 2) {
            if (i == 3 || i == 4) {
                ((o78) this.h).b(new uk7(aq6Var, false, z));
            } else {
                if (i != 5) {
                    ygf.a();
                    return false;
                }
                if (!aq6Var.q() || z) {
                    aq6Var.G.p.v = true;
                    if (!aq6Var.Q && (aq6Var.I() || p(aq6Var))) {
                        aq6 aq6VarV = aq6Var.v();
                        if (aq6VarV == null || !aq6VarV.q()) {
                            ((m50) this.e).e(aq6Var, q76.Measurement);
                        }
                        if (!this.c) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    public void E(anb anbVar) {
        qk7.q(anbVar, "CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
        qk7.q(anbVar, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, '" + ((String) ((vw3) this.e).b) + "')");
    }

    public void F(long j) {
        aq6 aq6Var = (aq6) this.d;
        f72 f72Var = (f72) this.i;
        if (f72Var == null ? false : f72.b(f72Var.a, j)) {
            return;
        }
        if (this.b) {
            b26.a("updateRootConstraints called while measuring");
        }
        this.i = new f72(j);
        aq6 aq6Var2 = aq6Var.h;
        eq6 eq6Var = aq6Var.G;
        if (aq6Var2 != null) {
            eq6Var.e = true;
        }
        eq6Var.p.v = true;
        ((m50) this.e).e(aq6Var, aq6Var2 != null ? q76.LookaheadMeasurement : q76.Measurement);
    }

    public void a(y73 y73Var, int i, ArrayList arrayList, tmb tmbVar) {
        m3f m3fVar = y73Var.d;
        tmb tmbVar2 = m3fVar.c;
        y73 y73Var2 = m3fVar.i;
        y73 y73Var3 = m3fVar.h;
        if (tmbVar2 == null) {
            c72 c72Var = (c72) this.d;
            if (m3fVar == c72Var.d || m3fVar == c72Var.e) {
                return;
            }
            if (tmbVar == null) {
                tmbVar = new tmb();
                tmbVar.a = null;
                tmbVar.b = new ArrayList();
                tmbVar.a = m3fVar;
                arrayList.add(tmbVar);
            }
            m3fVar.c = tmbVar;
            tmbVar.b.add(m3fVar);
            for (t73 t73Var : y73Var3.k) {
                if (t73Var instanceof y73) {
                    a((y73) t73Var, i, arrayList, tmbVar);
                }
            }
            for (t73 t73Var2 : y73Var2.k) {
                if (t73Var2 instanceof y73) {
                    a((y73) t73Var2, i, arrayList, tmbVar);
                }
            }
            if (i == 1 && (m3fVar instanceof bte)) {
                for (t73 t73Var3 : ((bte) m3fVar).k.k) {
                    if (t73Var3 instanceof y73) {
                        a((y73) t73Var3, i, arrayList, tmbVar);
                    }
                }
            }
            Iterator it2 = y73Var3.l.iterator();
            while (it2.hasNext()) {
                a((y73) it2.next(), i, arrayList, tmbVar);
            }
            Iterator it3 = y73Var2.l.iterator();
            while (it3.hasNext()) {
                a((y73) it3.next(), i, arrayList, tmbVar);
            }
            if (i == 1 && (m3fVar instanceof bte)) {
                Iterator it4 = ((bte) m3fVar).k.l.iterator();
                while (it4.hasNext()) {
                    a((y73) it4.next(), i, arrayList, tmbVar);
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:135:0x0295  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ce A[PHI: r1 r21
      0x00ce: PHI (r1v17 a72) = (r1v15 a72), (r1v63 a72) binds: [B:71:0x00dc, B:64:0x00cb] A[DONT_GENERATE, DONT_INLINE]
      0x00ce: PHI (r21v1 a72) = (r21v0 a72), (r21v3 a72) binds: [B:71:0x00dc, B:64:0x00cb] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00d2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void b(defpackage.c72 r24) {
        /*
            Method dump skipped, instruction units count: 830
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w73.b(c72):void");
    }

    public void c() {
        c72 c72Var = (c72) this.d;
        ArrayList arrayList = (ArrayList) this.g;
        ArrayList<m3f> arrayList2 = (ArrayList) this.f;
        arrayList2.clear();
        c72 c72Var2 = (c72) this.e;
        c72Var2.d.f();
        c72Var2.e.f();
        arrayList2.add(c72Var2.d);
        arrayList2.add(c72Var2.e);
        HashSet hashSet = null;
        for (b72 b72Var : c72Var2.r0) {
            if (b72Var instanceof sh5) {
                th5 th5Var = new th5(b72Var);
                b72Var.d.f();
                b72Var.e.f();
                th5Var.f = ((sh5) b72Var).v0;
                arrayList2.add(th5Var);
            } else {
                if (b72Var.y()) {
                    if (b72Var.b == null) {
                        b72Var.b = new rj1(b72Var, 0);
                    }
                    if (hashSet == null) {
                        hashSet = new HashSet();
                    }
                    hashSet.add(b72Var.b);
                } else {
                    arrayList2.add(b72Var.d);
                }
                if (b72Var.z()) {
                    if (b72Var.c == null) {
                        b72Var.c = new rj1(b72Var, 1);
                    }
                    if (hashSet == null) {
                        hashSet = new HashSet();
                    }
                    hashSet.add(b72Var.c);
                } else {
                    arrayList2.add(b72Var.e);
                }
                if (b72Var instanceof jj5) {
                    arrayList2.add(new ij5(b72Var));
                }
            }
        }
        if (hashSet != null) {
            arrayList2.addAll(hashSet);
        }
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            ((m3f) it2.next()).f();
        }
        for (m3f m3fVar : arrayList2) {
            if (m3fVar.b != c72Var2) {
                m3fVar.d();
            }
        }
        arrayList.clear();
        l(c72Var.d, 0, arrayList);
        l(c72Var.e, 1, arrayList);
        this.b = false;
    }

    public int d(c72 c72Var, int i) {
        ArrayList arrayList;
        int i2;
        long jMax;
        float f;
        c72 c72Var2 = c72Var;
        ArrayList arrayList2 = (ArrayList) this.g;
        int size = arrayList2.size();
        long j = 0;
        int i3 = 0;
        long jMax2 = 0;
        while (i3 < size) {
            m3f m3fVar = ((tmb) arrayList2.get(i3)).a;
            if (!(m3fVar instanceof rj1) ? !(i != 0 ? (m3fVar instanceof bte) : (m3fVar instanceof pr5)) : ((rj1) m3fVar).f != i) {
                y73 y73Var = (i == 0 ? c72Var2.d : c72Var2.e).h;
                y73 y73Var2 = (i == 0 ? c72Var2.d : c72Var2.e).i;
                y73 y73Var3 = m3fVar.h;
                y73 y73Var4 = m3fVar.i;
                boolean zContains = y73Var3.l.contains(y73Var);
                boolean zContains2 = y73Var4.l.contains(y73Var2);
                long j2 = m3fVar.j();
                if (zContains && zContains2) {
                    long jB = tmb.b(y73Var3, j);
                    arrayList = arrayList2;
                    long jA = tmb.a(y73Var4, j);
                    long j3 = jB - j2;
                    int i4 = y73Var4.f;
                    i2 = i3;
                    if (j3 >= (-i4)) {
                        j3 += (long) i4;
                    }
                    long j4 = y73Var3.f;
                    long j5 = ((-jA) - j2) - j4;
                    if (j5 >= j4) {
                        j5 -= j4;
                    }
                    b72 b72Var = m3fVar.b;
                    if (i == 0) {
                        f = b72Var.f0;
                    } else if (i == 1) {
                        f = b72Var.g0;
                    } else {
                        b72Var.getClass();
                        f = -1.0f;
                    }
                    float f2 = f > 0.0f ? (long) ((j3 / (1.0f - f)) + (j5 / f)) : 0L;
                    jMax = (((long) y73Var3.f) + ((((long) ((f2 * f) + 0.5f)) + j2) + ((long) lv8.e(1.0f, f, f2, 0.5f)))) - ((long) y73Var4.f);
                } else {
                    arrayList = arrayList2;
                    i2 = i3;
                    jMax = zContains ? Math.max(tmb.b(y73Var3, y73Var3.f), ((long) y73Var3.f) + j2) : zContains2 ? Math.max(-tmb.a(y73Var4, y73Var4.f), ((long) (-y73Var4.f)) + j2) : (m3fVar.j() + ((long) y73Var3.f)) - ((long) y73Var4.f);
                }
            } else {
                arrayList = arrayList2;
                jMax = j;
                i2 = i3;
            }
            jMax2 = Math.max(jMax2, jMax);
            i3 = i2 + 1;
            arrayList2 = arrayList;
            c72Var2 = c72Var;
            j = 0;
        }
        return (int) jMax2;
    }

    public void f(anb anbVar) throws Throwable {
        Object ajbVar;
        vw3 vw3Var = (vw3) this.e;
        e(anbVar);
        tu2 tu2Var = (tu2) this.d;
        dlb dlbVar = tu2Var.g;
        dlb dlbVar2 = dlb.WRITE_AHEAD_LOGGING;
        if (dlbVar == dlbVar2) {
            qk7.q(anbVar, "PRAGMA journal_mode = WAL");
        } else {
            qk7.q(anbVar, "PRAGMA journal_mode = TRUNCATE");
        }
        if (tu2Var.g == dlbVar2) {
            qk7.q(anbVar, "PRAGMA synchronous = NORMAL");
        } else {
            qk7.q(anbVar, "PRAGMA synchronous = FULL");
        }
        gnb gnbVarB0 = anbVar.B0("PRAGMA user_version");
        try {
            gnbVarB0.w0();
            int i = (int) gnbVarB0.getLong(0);
            xz5.F(gnbVarB0, null);
            int i2 = vw3Var.a;
            int i3 = vw3Var.a;
            if (i != i2) {
                qk7.q(anbVar, "BEGIN EXCLUSIVE TRANSACTION");
                try {
                    if (i == 0) {
                        w(anbVar);
                    } else {
                        x(anbVar, i, i3);
                    }
                    qk7.q(anbVar, "PRAGMA user_version = " + i3);
                    ajbVar = c1e.a;
                } catch (Throwable th) {
                    ajbVar = new ajb(th);
                }
                if (!(ajbVar instanceof ajb)) {
                    qk7.q(anbVar, "END TRANSACTION");
                }
                Throwable thB = bjb.b(ajbVar);
                if (thB != null) {
                    qk7.q(anbVar, "ROLLBACK TRANSACTION");
                    throw thB;
                }
            }
            y(anbVar);
        } finally {
        }
    }

    public void g(boolean z) {
        gg5 gg5Var = (gg5) this.f;
        o78 o78Var = (o78) gg5Var.b;
        if (z) {
            aq6 aq6Var = (aq6) this.d;
            if (aq6Var.P > 0) {
                o78Var.i();
                o78Var.b(aq6Var);
                aq6Var.O = true;
            }
        }
        if (o78Var.c != 0) {
            Trace.beginSection("Compose:onPositionedCallbacks");
            try {
                gg5Var.x();
            } finally {
                Trace.endSection();
            }
        }
    }

    public void j() {
        o78 o78Var = (o78) this.h;
        int i = o78Var.c;
        if (i != 0) {
            Object[] objArr = o78Var.a;
            for (int i2 = 0; i2 < i; i2++) {
                uk7 uk7Var = (uk7) objArr[i2];
                if (uk7Var.a.H()) {
                    boolean z = uk7Var.b;
                    aq6 aq6Var = uk7Var.a;
                    boolean z2 = uk7Var.c;
                    if (z) {
                        aq6.T(aq6Var, z2, 2);
                    } else {
                        aq6.V(aq6Var, z2, 2);
                    }
                }
            }
            o78Var.i();
        }
    }

    public void k(aq6 aq6Var) {
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if (g76.L(aq6Var2.J(), Boolean.TRUE) && !aq6Var2.Q) {
                if (((m50) this.e).t(aq6Var2)) {
                    aq6Var2.K();
                }
                k(aq6Var2);
            }
        }
    }

    public void l(m3f m3fVar, int i, ArrayList arrayList) {
        y73 y73Var = m3fVar.h;
        y73 y73Var2 = m3fVar.i;
        for (t73 t73Var : y73Var.k) {
            if (t73Var instanceof y73) {
                a((y73) t73Var, i, arrayList, null);
            } else if (t73Var instanceof m3f) {
                a(((m3f) t73Var).h, i, arrayList, null);
            }
        }
        for (t73 t73Var2 : y73Var2.k) {
            if (t73Var2 instanceof y73) {
                a((y73) t73Var2, i, arrayList, null);
            } else if (t73Var2 instanceof m3f) {
                a(((m3f) t73Var2).i, i, arrayList, null);
            }
        }
        if (i == 1) {
            for (t73 t73Var3 : ((bte) m3fVar).k.k) {
                if (t73Var3 instanceof y73) {
                    a((y73) t73Var3, i, arrayList, null);
                }
            }
        }
    }

    public void m(aq6 aq6Var, boolean z) {
        if (!this.b) {
            b26.b("forceMeasureTheSubtree should be executed during the measureAndLayout pass");
        }
        if (z ? aq6Var.G.e : aq6Var.q()) {
            b26.a("node not yet measured");
        }
        n(aq6Var, z);
    }

    public void n(aq6 aq6Var, boolean z) {
        mb7 mb7Var;
        bq6 bq6Var;
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var2 = (aq6) objArr[i2];
            if ((!z && (aq6Var2.r() == yp6.InMeasureBlock || aq6Var2.G.p.y.e())) || (z && (aq6Var2.s() == yp6.InMeasureBlock || ((mb7Var = aq6Var2.G.q) != null && (bq6Var = mb7Var.s) != null && bq6Var.e())))) {
                boolean zL = dm2.L(aq6Var2);
                eq6 eq6Var = aq6Var2.G;
                if (zL && !z) {
                    if (eq6Var.e && ((m50) this.e).t(aq6Var2)) {
                        A(aq6Var2, true);
                    } else {
                        m(aq6Var2, true);
                    }
                }
                if (z ? eq6Var.e : aq6Var2.q()) {
                    A(aq6Var2, z);
                }
                if (!(z ? eq6Var.e : aq6Var2.q())) {
                    n(aq6Var2, z);
                }
            }
        }
        if (z ? aq6Var.G.e : aq6Var.q()) {
            A(aq6Var, z);
        }
    }

    public void r(b72 b72Var, a72 a72Var, int i, a72 a72Var2, int i2) {
        qo0 qo0Var = (qo0) this.i;
        qo0Var.a = a72Var;
        qo0Var.b = a72Var2;
        qo0Var.c = i;
        qo0Var.d = i2;
        ((ro0) this.h).b(b72Var, qo0Var);
        b72Var.S(qo0Var.e);
        b72Var.N(qo0Var.f);
        b72Var.F = qo0Var.h;
        b72Var.J(qo0Var.g);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v1 */
    /* JADX WARN: Type inference failed for: r12v11 */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v13 */
    /* JADX WARN: Type inference failed for: r12v2, types: [q28] */
    /* JADX WARN: Type inference failed for: r12v3, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r12v4 */
    /* JADX WARN: Type inference failed for: r12v5 */
    /* JADX WARN: Type inference failed for: r12v6 */
    /* JADX WARN: Type inference failed for: r12v7 */
    /* JADX WARN: Type inference failed for: r12v8 */
    /* JADX WARN: Type inference failed for: r12v9, types: [q28] */
    /* JADX WARN: Type inference failed for: r13v0 */
    /* JADX WARN: Type inference failed for: r13v1 */
    /* JADX WARN: Type inference failed for: r13v10 */
    /* JADX WARN: Type inference failed for: r13v11 */
    /* JADX WARN: Type inference failed for: r13v12 */
    /* JADX WARN: Type inference failed for: r13v2 */
    /* JADX WARN: Type inference failed for: r13v3 */
    /* JADX WARN: Type inference failed for: r13v4, types: [o78] */
    /* JADX WARN: Type inference failed for: r13v6 */
    /* JADX WARN: Type inference failed for: r13v7, types: [o78] */
    /* JADX WARN: Type inference failed for: r13v8 */
    /* JADX WARN: Type inference failed for: r13v9 */
    /* JADX WARN: Type inference failed for: r14v4 */
    /* JADX WARN: Type inference failed for: r15v0 */
    /* JADX WARN: Type inference failed for: r15v1, types: [int] */
    /* JADX WARN: Type inference failed for: r15v2 */
    /* JADX WARN: Type inference failed for: r15v3, types: [int] */
    /* JADX WARN: Type inference failed for: r15v4 */
    public boolean s(bn bnVar) {
        boolean z;
        ?? Q0;
        boolean z2;
        aq6 aq6Var;
        boolean z3;
        boolean zA;
        m50 m50Var = (m50) this.e;
        rz2 rz2Var = (rz2) m50Var.b;
        aq6 aq6Var2 = (aq6) this.d;
        if (!aq6Var2.H()) {
            b26.a("performMeasureAndLayout called with unattached root");
        }
        if (!aq6Var2.I()) {
            b26.a("performMeasureAndLayout called with unplaced root");
        }
        if (this.b) {
            b26.a("performMeasureAndLayout called during measure layout");
        }
        boolean z4 = false;
        if (((f72) this.i) != null) {
            this.b = true;
            this.c = true;
            try {
                if (m50Var.G()) {
                    z = false;
                    while (true) {
                        rz2 rz2Var2 = (rz2) m50Var.d;
                        hkc hkcVar = (hkc) rz2Var2.b;
                        rz2 rz2Var3 = (rz2) m50Var.c;
                        hkc hkcVar2 = (hkc) rz2Var3.b;
                        if (!((hkc) rz2Var.b).isEmpty()) {
                            aq6Var = (aq6) ((hkc) rz2Var.b).first();
                            rz2Var.P(aq6Var);
                            z3 = aq6Var.h != null;
                            z2 = false;
                        } else if (!hkcVar2.isEmpty()) {
                            aq6Var = (aq6) hkcVar2.first();
                            rz2Var3.P(aq6Var);
                            z3 = aq6Var.h != null;
                            z2 = true;
                        } else {
                            if (hkcVar.isEmpty()) {
                                break;
                            }
                            aq6 aq6Var3 = (aq6) hkcVar.first();
                            rz2Var2.P(aq6Var3);
                            z2 = true;
                            aq6Var = aq6Var3;
                            z3 = false;
                        }
                        if (z2) {
                            zA = z(aq6Var, z3);
                        } else {
                            zA = A(aq6Var, z3);
                            if (aq6Var.G.f) {
                                m50Var.e(aq6Var, q76.LookaheadPlacement);
                            }
                            if (aq6Var.p()) {
                                m50Var.e(aq6Var, q76.Placement);
                            }
                        }
                        if (aq6Var == aq6Var2 && zA) {
                            z = true;
                        }
                    }
                    if (bnVar != null) {
                        bnVar.invoke();
                    }
                } else {
                    z = false;
                }
            } finally {
            }
        } else {
            z = false;
        }
        o78 o78Var = (o78) this.g;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        int i2 = 0;
        while (i2 < i) {
            hj0 hj0Var = ((aq6) objArr[i2]).F;
            l26 l26Var = (l26) hj0Var.d;
            boolean zG = fh8.g(4194304);
            q28 q28Var = l26Var.S;
            if (zG || (q28Var = q28Var.e) != null) {
                tjb tjbVar = eh8.N;
                q28 q28VarQ0 = l26Var.Q0(zG);
                while (q28VarQ0 != null && (q28VarQ0.d & 4194304) != 0) {
                    if ((q28VarQ0.c & 4194304) != 0) {
                        ?? r12 = q28VarQ0;
                        ?? o78Var2 = 0;
                        while (r12 != 0) {
                            if (r12 instanceof fp6) {
                                ((fp6) r12).l((l26) hj0Var.d);
                            } else {
                                if ((r12.c & 4194304) != 0 && (r12 instanceof b43)) {
                                    q28 q28Var2 = ((b43) r12).p;
                                    ?? r15 = z4;
                                    Q0 = r12;
                                    o78Var2 = o78Var2;
                                    while (q28Var2 != null) {
                                        if ((q28Var2.c & 4194304) != 0) {
                                            r15++;
                                            o78Var2 = o78Var2;
                                            if (r15 == 1) {
                                                Q0 = q28Var2;
                                            } else {
                                                if (o78Var2 == 0) {
                                                    o78Var2 = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var2.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var2.b(q28Var2);
                                            }
                                        }
                                        q28Var2 = q28Var2.f;
                                        Q0 = Q0;
                                        o78Var2 = o78Var2;
                                        r15 = r15;
                                    }
                                    if (r15 == 1) {
                                    }
                                }
                                z4 = false;
                                r12 = Q0;
                                o78Var2 = o78Var2;
                            }
                            Q0 = flb.q0(o78Var2);
                            z4 = false;
                            r12 = Q0;
                            o78Var2 = o78Var2;
                        }
                    }
                    if (q28VarQ0 != q28Var) {
                        q28VarQ0 = q28VarQ0.f;
                        z4 = false;
                    }
                }
            }
            i2++;
            z4 = false;
        }
        o78Var.i();
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v2, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v5, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v6, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    /* JADX WARN: Type inference failed for: r9v6 */
    public void t(aq6 aq6Var, long j) {
        aq6 aq6Var2 = (aq6) this.d;
        boolean z = aq6Var.Q;
        eq6 eq6Var = aq6Var.G;
        if (z) {
            return;
        }
        if (aq6Var == aq6Var2) {
            b26.a("measureAndLayout called on root");
        }
        if (!aq6Var2.H()) {
            b26.a("performMeasureAndLayout called with unattached root");
        }
        if (!aq6Var2.I()) {
            b26.a("performMeasureAndLayout called with unplaced root");
        }
        if (this.b) {
            b26.a("performMeasureAndLayout called during measure layout");
        }
        if (((f72) this.i) != null) {
            this.b = true;
            this.c = false;
            try {
                m50 m50Var = (m50) this.e;
                ((rz2) m50Var.b).P(aq6Var);
                ((rz2) m50Var.c).P(aq6Var);
                ((rz2) m50Var.d).P(aq6Var);
                if (h(aq6Var, new f72(j)) || eq6Var.f) {
                    if (g76.L(aq6Var.J(), Boolean.TRUE)) {
                        aq6Var.K();
                    }
                }
                k(aq6Var);
                if (aq6Var.C == yp6.NotUsed) {
                    aq6Var.e();
                }
                boolean zV0 = eq6Var.p.v0(j);
                aq6 aq6VarV = aq6Var.v();
                if (zV0 && aq6VarV != null) {
                    if (aq6Var.r() == yp6.InMeasureBlock) {
                        aq6.V(aq6VarV, false, 3);
                    } else if (aq6Var.r() == yp6.InLayoutBlock) {
                        aq6VarV.U(false);
                    }
                }
                if (aq6Var.p() && aq6Var.I()) {
                    aq6Var.R();
                    gg5 gg5Var = (gg5) this.f;
                    if (aq6Var.P > 0) {
                        ((o78) gg5Var.b).b(aq6Var);
                        aq6Var.O = true;
                    }
                }
                j();
            } finally {
            }
        }
        o78 o78Var = (o78) this.g;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            hj0 hj0Var = ((aq6) objArr[i2]).F;
            l26 l26Var = (l26) hj0Var.d;
            boolean zG = fh8.g(4194304);
            q28 q28Var = l26Var.S;
            if (zG || (q28Var = q28Var.e) != null) {
                tjb tjbVar = eh8.N;
                for (q28 q28VarQ0 = l26Var.Q0(zG); q28VarQ0 != null && (q28VarQ0.d & 4194304) != 0; q28VarQ0 = q28VarQ0.f) {
                    if ((q28VarQ0.c & 4194304) != 0) {
                        ?? Q0 = q28VarQ0;
                        ?? o78Var2 = 0;
                        while (Q0 != 0) {
                            if (Q0 instanceof fp6) {
                                ((fp6) Q0).l((l26) hj0Var.d);
                            } else if ((Q0.c & 4194304) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var2 = ((b43) Q0).p;
                                int i3 = 0;
                                Q0 = Q0;
                                o78Var2 = o78Var2;
                                while (q28Var2 != null) {
                                    if ((q28Var2.c & 4194304) != 0) {
                                        i3++;
                                        o78Var2 = o78Var2;
                                        if (i3 == 1) {
                                            Q0 = q28Var2;
                                        } else {
                                            if (o78Var2 == 0) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (Q0 != 0) {
                                                o78Var2.b(Q0);
                                                Q0 = 0;
                                            }
                                            o78Var2.b(q28Var2);
                                        }
                                    }
                                    q28Var2 = q28Var2.f;
                                    Q0 = Q0;
                                    o78Var2 = o78Var2;
                                }
                                if (i3 == 1) {
                                }
                            }
                            Q0 = flb.q0(o78Var2);
                        }
                    }
                    if (q28VarQ0 != q28Var) {
                    }
                }
            }
        }
        o78Var.i();
    }

    public String toString() {
        switch (this.a) {
            case 1:
                Map map = (Map) this.i;
                Long l = (Long) this.h;
                Long l2 = (Long) this.g;
                Long l3 = (Long) this.f;
                Long l4 = (Long) this.e;
                ArrayList arrayList = new ArrayList();
                if (this.b) {
                    arrayList.add("isRegularFile");
                }
                if (this.c) {
                    arrayList.add("isDirectory");
                }
                if (l4 != null) {
                    arrayList.add("byteCount=" + l4.longValue());
                }
                if (l3 != null) {
                    arrayList.add("createdAt=" + l3.longValue());
                }
                if (l2 != null) {
                    arrayList.add("lastModifiedAt=" + l2.longValue());
                }
                if (l != null) {
                    arrayList.add("lastAccessedAt=" + l.longValue());
                }
                if (!map.isEmpty()) {
                    arrayList.add("extras=" + map);
                }
                return bu1.F0(arrayList, ", ", "FileMetadata(", ")", null, 56);
            default:
                return super.toString();
        }
    }

    public void u() {
        aq6 aq6Var = (aq6) this.d;
        m50 m50Var = (m50) this.e;
        if (m50Var.G()) {
            if (!aq6Var.H()) {
                b26.a("performMeasureAndLayout called with unattached root");
            }
            if (!aq6Var.I()) {
                b26.a("performMeasureAndLayout called with unplaced root");
            }
            if (this.b) {
                b26.a("performMeasureAndLayout called during measure layout");
            }
            if (((f72) this.i) != null) {
                this.b = true;
                this.c = false;
                try {
                    if ((((hkc) ((rz2) m50Var.d).b).isEmpty() || ((hkc) ((rz2) m50Var.b).b).isEmpty()) ? false : true) {
                        if (aq6Var.h != null) {
                            C(aq6Var, true);
                        } else {
                            B(aq6Var);
                        }
                    }
                    C(aq6Var, false);
                } catch (Throwable th) {
                    try {
                        throw th;
                    } finally {
                        this.b = false;
                        this.c = false;
                    }
                }
            }
        }
    }

    public void v() {
        w73 w73Var;
        ko0 ko0Var;
        for (b72 b72Var : ((c72) this.d).r0) {
            if (!b72Var.a) {
                a72[] a72VarArr = b72Var.U;
                boolean z = false;
                a72 a72Var = a72VarArr[0];
                a72 a72Var2 = a72VarArr[1];
                int i = b72Var.s;
                int i2 = b72Var.t;
                a72 a72Var3 = a72.WRAP_CONTENT;
                boolean z2 = a72Var == a72Var3 || (a72Var == a72.MATCH_CONSTRAINT && i == 1);
                if (a72Var2 == a72Var3 || (a72Var2 == a72.MATCH_CONSTRAINT && i2 == 1)) {
                    z = true;
                }
                ye3 ye3Var = b72Var.d.e;
                boolean z3 = ye3Var.j;
                ye3 ye3Var2 = b72Var.e.e;
                boolean z4 = ye3Var2.j;
                if (z3 && z4) {
                    a72 a72Var4 = a72.FIXED;
                    w73Var = this;
                    w73Var.r(b72Var, a72Var4, ye3Var.g, a72Var4, ye3Var2.g);
                    b72Var.a = true;
                } else if (z3 && z) {
                    w73Var = this;
                    w73Var.r(b72Var, a72.FIXED, ye3Var.g, a72Var3, ye3Var2.g);
                    a72 a72Var5 = a72.MATCH_CONSTRAINT;
                    bte bteVar = b72Var.e;
                    if (a72Var2 == a72Var5) {
                        bteVar.e.m = b72Var.l();
                    } else {
                        bteVar.e.d(b72Var.l());
                        b72Var.a = true;
                    }
                } else {
                    w73Var = this;
                    if (z4 && z2) {
                        w73Var.r(b72Var, a72Var3, ye3Var.g, a72.FIXED, ye3Var2.g);
                        a72 a72Var6 = a72.MATCH_CONSTRAINT;
                        pr5 pr5Var = b72Var.d;
                        if (a72Var == a72Var6) {
                            pr5Var.e.m = b72Var.r();
                        } else {
                            pr5Var.e.d(b72Var.r());
                            b72Var.a = true;
                        }
                    }
                }
                if (b72Var.a && (ko0Var = b72Var.e.l) != null) {
                    ko0Var.d(b72Var.c0);
                }
                this = w73Var;
            }
        }
    }

    public void w(anb anbVar) {
        vw3 vw3Var = (vw3) this.e;
        anbVar.getClass();
        gnb gnbVarB0 = anbVar.B0("SELECT count(*) FROM sqlite_master WHERE name != 'android_metadata'");
        try {
            boolean z = false;
            if (gnbVarB0.w0()) {
                if (gnbVarB0.getLong(0) == 0) {
                    z = true;
                }
            }
            xz5.F(gnbVarB0, null);
            vw3Var.a(anbVar);
            if (!z) {
                hlb hlbVarV = vw3Var.v(anbVar);
                if (!hlbVarV.c) {
                    lg8.w("Pre-packaged database has an invalid schema: ", hlbVarV.b);
                    return;
                }
            }
            E(anbVar);
            vw3Var.r(anbVar);
            Iterator it2 = ((List) this.f).iterator();
            while (it2.hasNext()) {
                ((clb) it2.next()).getClass();
                if (anbVar instanceof t2d) {
                    ((t2d) anbVar).a.getClass();
                }
            }
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x00a3 A[EDGE_INSN: B:127:0x00a3->B:39:0x00a3 BREAK  A[LOOP:4: B:9:0x0028->B:131:?], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00df  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void x(defpackage.anb r17, int r18, int r19) {
        /*
            Method dump skipped, instruction units count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w73.x(anb, int, int):void");
    }

    public boolean z(aq6 aq6Var, boolean z) {
        f72 f72Var;
        aq6 aq6VarV;
        aq6 aq6Var2 = (aq6) this.d;
        boolean z2 = aq6Var.Q;
        eq6 eq6Var = aq6Var.G;
        if (!z2 && q(aq6Var)) {
            if (aq6Var == aq6Var2) {
                f72Var = (f72) this.i;
                f72Var.getClass();
            } else {
                f72Var = null;
            }
            if (z) {
                zH = eq6Var.e ? h(aq6Var, f72Var) : false;
                if ((zH || eq6Var.f) && g76.L(aq6Var.J(), Boolean.TRUE)) {
                    aq6Var.K();
                }
            } else {
                boolean zI = aq6Var.q() ? i(aq6Var, f72Var) : false;
                if (aq6Var.p() && (aq6Var == aq6Var2 || ((aq6VarV = aq6Var.v()) != null && aq6VarV.I() && eq6Var.p.u))) {
                    if (aq6Var == aq6Var2) {
                        if (aq6Var.C == yp6.NotUsed) {
                            aq6Var.f();
                        }
                        aq6 aq6VarV2 = aq6Var.v();
                        s99.j(aq6VarV2 != null ? ((l26) aq6VarV2.F.d).l : ((mn) dq6.a(aq6Var)).getPlacementScope(), eq6Var.p, 0, 0);
                    } else {
                        aq6Var.R();
                    }
                    gg5 gg5Var = (gg5) this.f;
                    if (aq6Var.P > 0) {
                        ((o78) gg5Var.b).b(aq6Var);
                        aq6Var.O = true;
                    }
                }
                zH = zI;
            }
            j();
        }
        return zH;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0026  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void y(defpackage.anb r11) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 259
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w73.y(anb):void");
    }

    public w73(tu2 tu2Var, eb8 eb8Var, xi1 xi1Var) {
        this.a = 3;
        this.d = tu2Var;
        this.e = new xkb("", -1, "");
        List list = tu2Var.e;
        ey3 ey3Var = ey3.a;
        this.f = list == null ? ey3Var : list;
        bu1.R0(list == null ? ey3Var : list, new ykb(new eb8(23, this)));
        dlb dlbVar = tu2Var.g;
        Executor executor = tu2Var.h;
        Executor executor2 = tu2Var.i;
        dlbVar.getClass();
        executor.getClass();
        executor2.getClass();
        ((elb) eb8Var.b).getClass();
        throw new ei8(0);
    }

    public w73(aq6 aq6Var) {
        this.a = 2;
        this.d = aq6Var;
        this.e = new m50(26);
        this.f = new gg5(21);
        this.g = new o78(new aq6[16]);
        this.h = new o78(new uk7[16]);
    }

    public w73(c72 c72Var) {
        this.a = 0;
        this.b = true;
        this.c = true;
        this.f = new ArrayList();
        new ArrayList();
        this.h = null;
        this.i = new qo0();
        this.g = new ArrayList();
        this.d = c72Var;
        this.e = c72Var;
    }

    public w73(boolean z, boolean z2, g59 g59Var, Long l, Long l2, Long l3, Long l4, Map map) {
        this.a = 1;
        map.getClass();
        this.b = z;
        this.c = z2;
        this.d = g59Var;
        this.e = l;
        this.f = l2;
        this.g = l3;
        this.h = l4;
        this.i = ei7.W(map);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w73(boolean z, boolean z2, g59 g59Var, Long l, Long l2, Long l3, Long l4) {
        this(z, z2, g59Var, l, l2, l3, l4, fy3.a);
        this.a = 1;
    }
}
