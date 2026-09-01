package defpackage;

import android.os.Trace;
import com.drew.imaging.avi.hzjl.bPUi;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class q22 implements k22 {
    public final l22 a;
    public final vwa b;
    public final AtomicReference c = new AtomicReference(null);
    public final Object d = new Object();
    public final i78 e;
    public final fgc f;
    public final f78 g;
    public final g78 h;
    public final g78 i;
    public final f78 j;
    public final tj1 k;
    public final tj1 l;
    public final f78 m;
    public f78 n;
    public boolean o;
    public m8c p;
    public l69 q;
    public q22 r;
    public int s;
    public final md5 t;
    public final l3b u;
    public final p65 v;
    public int w;

    public q22(l22 l22Var, vwa vwaVar) {
        this.a = l22Var;
        this.b = vwaVar;
        i78 i78Var = new i78(new g78());
        this.e = i78Var;
        fgc fgcVar = new fgc();
        if (l22Var.d()) {
            fgcVar.k = new k68();
        }
        if (l22Var.f()) {
            fgcVar.f();
        }
        this.f = fgcVar;
        this.g = tp7.q();
        this.h = new g78();
        this.i = new g78();
        this.j = tp7.q();
        tj1 tj1Var = new tj1();
        this.k = tj1Var;
        tj1 tj1Var2 = new tj1();
        this.l = tj1Var2;
        this.m = tp7.q();
        this.n = tp7.q();
        md5 md5Var = new md5(9, l22Var);
        this.t = md5Var;
        this.u = new l3b(0);
        p65 p65Var = new p65(vwaVar, l22Var, hgc.a(fgcVar), i78Var, tj1Var, tj1Var2, md5Var, this);
        l22Var.p(p65Var);
        this.v = p65Var;
    }

    public final void A(b55 b55Var) {
        boolean zI = i();
        q();
        l22 l22Var = this.a;
        if (!zI) {
            l22Var.a(this, b55Var);
            return;
        }
        p65 p65Var = this.v;
        p65Var.z = 0;
        p65Var.y = true;
        l22Var.a(this, b55Var);
        p65Var.t();
    }

    public final void a() {
        this.c.set(null);
        this.k.s.F();
        this.l.s.F();
        i78 i78Var = this.e;
        if (i78Var.a.g()) {
            return;
        }
        l3b l3bVar = this.u;
        try {
            l3bVar.j(i78Var, this.v.A());
            l3bVar.c();
        } finally {
            l3bVar.b();
        }
    }

    public final void b(Object obj, boolean z) {
        Object objG = this.g.g(obj);
        if (objG == null) {
            return;
        }
        boolean z2 = objG instanceof g78;
        g78 g78Var = this.h;
        g78 g78Var2 = this.i;
        f78 f78Var = this.m;
        if (!z2) {
            mwa mwaVar = (mwa) objG;
            if (tp7.z(f78Var, obj, mwaVar) || mwaVar.c(obj) == s76.IGNORED) {
                return;
            }
            if (mwaVar.g == null || z) {
                g78Var.a(mwaVar);
                return;
            } else {
                g78Var2.a(mwaVar);
                return;
            }
        }
        g78 g78Var3 = (g78) objG;
        Object[] objArr = g78Var3.b;
        long[] jArr = g78Var3.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        mwa mwaVar2 = (mwa) objArr[(i << 3) + i3];
                        if (!tp7.z(f78Var, obj, mwaVar2) && mwaVar2.c(obj) != s76.IGNORED) {
                            if (mwaVar2.g == null || z) {
                                g78Var.a(mwaVar2);
                            } else {
                                g78Var2.a(mwaVar2);
                            }
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x0183 A[EDGE_INSN: B:73:0x0183->B:220:0x0122 BREAK  A[LOOP:13: B:63:0x0151->B:74:0x0185]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(java.util.Set r32, boolean r33) {
        /*
            Method dump skipped, instruction units count: 892
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q22.c(java.util.Set, boolean):void");
    }

    public final void d() {
        synchronized (this.d) {
            try {
                e(this.k);
                o();
            } catch (Throwable th) {
                try {
                    if (!this.e.a.g()) {
                        l3b l3bVar = this.u;
                        try {
                            l3bVar.j(this.e, this.v.A());
                            l3bVar.c();
                            l3bVar.b();
                        } catch (Throwable th2) {
                            l3bVar.b();
                            throw th2;
                        }
                    }
                    throw th;
                } catch (Throwable th3) {
                    a();
                    throw th3;
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:75:0x012a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(defpackage.tj1 r34) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 485
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q22.e(tj1):void");
    }

    public final void f() {
        synchronized (this.d) {
            try {
                tj1 tj1Var = this.l;
                tj1Var.getClass();
                if (!tj1Var.s.H()) {
                    e(this.l);
                }
            } catch (Throwable th) {
                try {
                    if (!this.e.a.g()) {
                        l3b l3bVar = this.u;
                        try {
                            l3bVar.j(this.e, this.v.A());
                            l3bVar.c();
                            l3bVar.b();
                        } catch (Throwable th2) {
                            l3bVar.b();
                            throw th2;
                        }
                    }
                    throw th;
                } finally {
                }
            }
        }
    }

    public final void g() {
        l3b l3bVar;
        synchronized (this.d) {
            try {
                this.v.v = null;
                if (!this.e.a.g()) {
                    l3bVar = this.u;
                    try {
                        l3bVar.j(this.e, this.v.A());
                        l3bVar.c();
                        l3bVar.b();
                    } finally {
                    }
                }
            } catch (Throwable th) {
                try {
                    if (!this.e.a.g()) {
                        l3bVar = this.u;
                        try {
                            l3bVar.j(this.e, this.v.A());
                            l3bVar.c();
                            l3bVar.b();
                        } finally {
                        }
                    }
                    throw th;
                } catch (Throwable th2) {
                    a();
                    throw th2;
                }
            }
        }
    }

    public final void h() {
        long j;
        char c;
        long j2;
        long j3;
        long[] jArr;
        long[] jArr2;
        int i;
        int i2;
        long j4;
        char c2;
        long j5;
        long j6;
        int i3;
        boolean zG;
        int i4;
        int i5;
        f78 f78Var = this.j;
        long[] jArr3 = f78Var.a;
        int length = jArr3.length - 2;
        long j7 = 255;
        char c3 = 7;
        long j8 = -9187201950435737472L;
        int i6 = 8;
        if (length >= 0) {
            int i7 = 0;
            while (true) {
                long j9 = jArr3[i7];
                j3 = 128;
                if ((((~j9) << c3) & j9 & j8) != j8) {
                    int i8 = 8 - ((~(i7 - length)) >>> 31);
                    int i9 = 0;
                    while (i9 < i8) {
                        if ((j9 & j7) < 128) {
                            j4 = j7;
                            int i10 = (i7 << 3) + i9;
                            Object obj = f78Var.b[i10];
                            Object obj2 = f78Var.c[i10];
                            c2 = c3;
                            boolean z = obj2 instanceof g78;
                            j5 = j8;
                            f78 f78Var2 = this.g;
                            if (z) {
                                g78 g78Var = (g78) obj2;
                                Object[] objArr = g78Var.b;
                                long[] jArr4 = g78Var.a;
                                int length2 = jArr4.length - 2;
                                if (length2 >= 0) {
                                    int i11 = i6;
                                    j6 = j9;
                                    int i12 = 0;
                                    while (true) {
                                        long j10 = jArr4[i12];
                                        jArr2 = jArr3;
                                        i = length;
                                        if ((((~j10) << c2) & j10 & j5) != j5) {
                                            int i13 = 8 - ((~(i12 - length2)) >>> 31);
                                            int i14 = 0;
                                            while (i14 < i13) {
                                                if ((j10 & j4) < 128) {
                                                    i4 = i14;
                                                    int i15 = (i12 << 3) + i4;
                                                    i5 = i9;
                                                    if (!f78Var2.c((j83) objArr[i15])) {
                                                        g78Var.m(i15);
                                                    }
                                                } else {
                                                    i4 = i14;
                                                    i5 = i9;
                                                }
                                                j10 >>= i11;
                                                i14 = i4 + 1;
                                                i9 = i5;
                                            }
                                            i2 = i9;
                                            if (i13 != i11) {
                                                break;
                                            }
                                        } else {
                                            i2 = i9;
                                        }
                                        if (i12 == length2) {
                                            break;
                                        }
                                        i12++;
                                        jArr3 = jArr2;
                                        length = i;
                                        i9 = i2;
                                        i11 = 8;
                                    }
                                } else {
                                    jArr2 = jArr3;
                                    i = length;
                                    i2 = i9;
                                    j6 = j9;
                                }
                                zG = g78Var.g();
                            } else {
                                jArr2 = jArr3;
                                i = length;
                                i2 = i9;
                                j6 = j9;
                                obj2.getClass();
                                zG = !f78Var2.c((j83) obj2);
                            }
                            if (zG) {
                                f78Var.l(i10);
                            }
                            i3 = 8;
                        } else {
                            jArr2 = jArr3;
                            i = length;
                            i2 = i9;
                            j4 = j7;
                            c2 = c3;
                            j5 = j8;
                            j6 = j9;
                            i3 = i6;
                        }
                        j9 = j6 >> i3;
                        i9 = i2 + 1;
                        i6 = i3;
                        c3 = c2;
                        j7 = j4;
                        j8 = j5;
                        jArr3 = jArr2;
                        length = i;
                    }
                    jArr = jArr3;
                    int i16 = length;
                    j = j7;
                    c = c3;
                    j2 = j8;
                    if (i8 != i6) {
                        break;
                    } else {
                        length = i16;
                    }
                } else {
                    jArr = jArr3;
                    j = j7;
                    c = c3;
                    j2 = j8;
                }
                if (i7 == length) {
                    break;
                }
                i7++;
                c3 = c;
                j7 = j;
                j8 = j2;
                jArr3 = jArr;
                i6 = 8;
            }
        } else {
            j = 255;
            c = 7;
            j2 = -9187201950435737472L;
            j3 = 128;
        }
        g78 g78Var2 = this.i;
        if (!g78Var2.h()) {
            return;
        }
        Object[] objArr2 = g78Var2.b;
        long[] jArr5 = g78Var2.a;
        int length3 = jArr5.length - 2;
        if (length3 < 0) {
            return;
        }
        int i17 = 0;
        while (true) {
            long j11 = jArr5[i17];
            if ((((~j11) << c) & j11 & j2) != j2) {
                int i18 = 8 - ((~(i17 - length3)) >>> 31);
                for (int i19 = 0; i19 < i18; i19++) {
                    if ((j11 & j) < j3) {
                        int i20 = (i17 << 3) + i19;
                        if (((mwa) objArr2[i20]).g == null) {
                            g78Var2.m(i20);
                        }
                    }
                    j11 >>= 8;
                }
                if (i18 != 8) {
                    return;
                }
            }
            if (i17 == length3) {
                return;
            } else {
                i17++;
            }
        }
    }

    public final boolean i() {
        boolean z;
        synchronized (this.d) {
            z = true;
            if (this.w != 1) {
                z = false;
            }
            if (z) {
                this.w = 0;
            }
        }
        return z;
    }

    public final void j(b55 b55Var) {
        try {
            synchronized (this.d) {
                n();
                f78 f78Var = this.n;
                this.n = tp7.q();
                try {
                    p65 p65Var = this.v;
                    m8c m8cVar = this.p;
                    if (!p65Var.e.s.H()) {
                        b22.a("Expected applyChanges() to have been called");
                    }
                    p65Var.P = m8cVar;
                    try {
                        p65Var.n(f78Var, b55Var);
                    } finally {
                        p65Var.P = null;
                    }
                } catch (Throwable th) {
                    this.n = f78Var;
                    throw th;
                }
            }
        } catch (Throwable th2) {
            try {
                if (!this.e.a.g()) {
                    l3b l3bVar = this.u;
                    try {
                        l3bVar.j(this.e, this.v.A());
                        l3bVar.c();
                        l3bVar.b();
                    } catch (Throwable th3) {
                        l3bVar.b();
                        throw th3;
                    }
                }
                throw th2;
            } catch (Throwable th4) {
                a();
                throw th4;
            }
        }
    }

    public final l69 k(boolean z, b55 b55Var) {
        if (this.q != null) {
            xx9.b("A pausable composition is in progress");
        }
        l69 l69Var = new l69(this, this.a, this.v, this.e, b55Var, z, this.b, this.d);
        this.q = l69Var;
        return l69Var;
    }

    public final void l() {
        synchronized (this.d) {
            try {
                if (this.q != null) {
                    xx9.b("Deactivate is not supported while pausable composition is in progress");
                }
                boolean z = this.f.b == 0;
                if (!z || !this.e.a.g()) {
                    Trace.beginSection("Compose:deactivate");
                    try {
                        l3b l3bVar = this.u;
                        try {
                            l3bVar.j(this.e, this.v.A());
                            if (!z) {
                                fgc fgcVar = this.f;
                                l3b l3bVar2 = this.u;
                                igc igcVarP = fgcVar.p();
                                try {
                                    igcVarP.m(igcVarP.t, new hm4(l3bVar2, 8, igcVarP));
                                    igcVarP.e(true);
                                    this.b.l();
                                    l3bVar.d();
                                } catch (Throwable th) {
                                    igcVarP.e(false);
                                    throw th;
                                }
                            }
                            l3bVar.c();
                            l3bVar.b();
                        } catch (Throwable th2) {
                            l3bVar.b();
                            throw th2;
                        }
                    } finally {
                        Trace.endSection();
                    }
                }
                this.g.a();
                this.j.a();
                this.n.a();
                this.k.s.F();
                this.l.s.F();
                p65 p65Var = this.v;
                p65Var.E.clear();
                p65Var.s.clear();
                p65Var.e.s.F();
                p65Var.v = null;
                this.w = 1;
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public final void n() {
        Object obj = n01.l;
        AtomicReference atomicReference = this.c;
        Object andSet = atomicReference.getAndSet(obj);
        if (andSet != null) {
            if (andSet.equals(obj)) {
                b22.b("pending composition has not been applied");
                z72.b();
                return;
            }
            if (andSet instanceof Set) {
                c((Set) andSet, true);
                return;
            }
            if (!(andSet instanceof Object[])) {
                b22.b("corrupt pendingModifications drain: " + atomicReference);
                z72.b();
                return;
            }
            for (Set set : (Set[]) andSet) {
                c(set, true);
            }
        }
    }

    public final void o() {
        AtomicReference atomicReference = this.c;
        Object andSet = atomicReference.getAndSet(null);
        if (g76.L(andSet, n01.l)) {
            return;
        }
        if (andSet instanceof Set) {
            c((Set) andSet, false);
            return;
        }
        if (andSet instanceof Object[]) {
            for (Set set : (Set[]) andSet) {
                c(set, false);
            }
            return;
        }
        if (andSet == null) {
            if (this.q == null) {
                b22.a("calling recordModificationsOf and applyChanges concurrently is not supported");
            }
        } else {
            b22.b("corrupt pendingModifications drain: " + atomicReference);
            z72.b();
        }
    }

    public final void p() {
        ny3 ny3Var = ny3.a;
        AtomicReference atomicReference = this.c;
        Object andSet = atomicReference.getAndSet(ny3Var);
        if (g76.L(andSet, n01.l) || andSet == null) {
            return;
        }
        if (andSet instanceof Set) {
            c((Set) andSet, false);
            return;
        }
        if (!(andSet instanceof Object[])) {
            b22.b("corrupt pendingModifications drain: " + atomicReference);
            z72.b();
            return;
        }
        for (Set set : (Set[]) andSet) {
            c(set, false);
        }
    }

    public final void q() {
        int i = this.w;
        if (i != 0) {
            xx9.b(i != 1 ? i != 2 ? i != 3 ? "" : "The composition is disposed" : "A previous pausable composition for this composition was cancelled. This composition must be disposed." : "The composition should be activated before setting content.");
        }
        if (this.q == null) {
            return;
        }
        xx9.b("A pausable composition is in progress");
    }

    public final void r(ArrayList arrayList) {
        i78 i78Var = this.e;
        p65 p65Var = this.v;
        if (arrayList.size() > 0) {
            ((s48) ((f09) arrayList.get(0)).a).getClass();
            b22.a("Check failed");
        }
        try {
            p65Var.getClass();
            Trace.beginSection("Compose:insertMovableContent");
            try {
                try {
                    p65Var.C(arrayList);
                    p65Var.i();
                } catch (Throwable th) {
                    p65Var.a();
                    throw th;
                }
            } finally {
                Trace.endSection();
            }
        } catch (Throwable th2) {
            try {
                if (!i78Var.a.g()) {
                    l3b l3bVar = this.u;
                    try {
                        l3bVar.j(i78Var, p65Var.A());
                        l3bVar.c();
                        l3bVar.b();
                    } catch (Throwable th3) {
                        l3bVar.b();
                        throw th3;
                    }
                }
                throw th2;
            } catch (Throwable th4) {
                a();
                throw th4;
            }
        }
    }

    public final s76 s(mwa mwaVar, Object obj) {
        q22 q22Var;
        int i = mwaVar.b;
        if ((i & 2) != 0) {
            mwaVar.b = i | 4;
        }
        k65 k65Var = mwaVar.c;
        if (k65Var == null || !k65Var.a()) {
            return s76.IGNORED;
        }
        fgc fgcVar = this.f;
        fgcVar.getClass();
        k65 k65Var2 = mwaVar.c;
        if (k65Var2 != null && fgcVar.q(n01.R(k65Var2))) {
            if (mwaVar.d == null) {
                return s76.IGNORED;
            }
            s76 s76VarT = t(mwaVar, k65Var, obj);
            if (s76VarT != s76.IGNORED) {
                this.t.c();
            }
            return s76VarT;
        }
        synchronized (this.d) {
            q22Var = this.r;
        }
        if (q22Var != null) {
            p65 p65Var = q22Var.v;
            if (p65Var.F && p65Var.e0(mwaVar, obj)) {
                return s76.IMMINENT;
            }
        }
        return s76.IGNORED;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00c9 A[Catch: all -> 0x0044, EDGE_INSN: B:79:0x00c9->B:64:0x00c9 BREAK  A[LOOP:0: B:48:0x008a->B:60:0x00c1], EDGE_INSN: B:80:0x00c9->B:64:0x00c9 BREAK  A[LOOP:0: B:48:0x008a->B:60:0x00c1], TRY_LEAVE, TryCatch #0 {all -> 0x0044, blocks: (B:4:0x0009, B:6:0x000e, B:8:0x0016, B:10:0x001d, B:14:0x0027, B:16:0x0031, B:13:0x0022, B:25:0x0049, B:27:0x004f, B:32:0x005a, B:36:0x0060, B:37:0x0068, B:40:0x006e, B:41:0x0074, B:43:0x007a, B:45:0x007e, B:48:0x008a, B:50:0x009a, B:52:0x00a6, B:54:0x00af, B:57:0x00b9, B:60:0x00c1, B:61:0x00c4, B:64:0x00c9), top: B:77:0x0009 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.s76 t(defpackage.mwa r20, defpackage.k65 r21, java.lang.Object r22) {
        /*
            Method dump skipped, instruction units count: 235
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q22.t(mwa, k65, java.lang.Object):s76");
    }

    public final void u(Object obj) {
        Object objG = this.g.g(obj);
        if (objG == null) {
            return;
        }
        boolean z = objG instanceof g78;
        f78 f78Var = this.m;
        if (!z) {
            mwa mwaVar = (mwa) objG;
            if (mwaVar.c(obj) == s76.IMMINENT) {
                tp7.o(f78Var, obj, mwaVar);
                return;
            }
            return;
        }
        g78 g78Var = (g78) objG;
        Object[] objArr = g78Var.b;
        long[] jArr = g78Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        mwa mwaVar2 = (mwa) objArr[(i << 3) + i3];
                        if (mwaVar2.c(obj) == s76.IMMINENT) {
                            tp7.o(f78Var, obj, mwaVar2);
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0052, code lost:
    
        return true;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean v(java.util.Set r18) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            boolean r2 = r1 instanceof defpackage.jqb
            f78 r3 = r0.j
            f78 r0 = r0.g
            r4 = 0
            r5 = 1
            if (r2 == 0) goto L5e
            jqb r1 = (defpackage.jqb) r1
            g78 r1 = r1.a
            java.lang.Object[] r2 = r1.b
            long[] r1 = r1.a
            int r6 = r1.length
            int r6 = r6 + (-2)
            if (r6 < 0) goto L7b
            r7 = r4
        L1c:
            r8 = r1[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L59
            int r10 = r7 - r6
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = r4
        L36:
            if (r12 >= r10) goto L57
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L53
            int r13 = r7 << 3
            int r13 = r13 + r12
            r13 = r2[r13]
            boolean r14 = r0.c(r13)
            if (r14 != 0) goto L52
            boolean r13 = r3.c(r13)
            if (r13 == 0) goto L53
        L52:
            return r5
        L53:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L36
        L57:
            if (r10 != r11) goto L7b
        L59:
            if (r7 == r6) goto L7b
            int r7 = r7 + 1
            goto L1c
        L5e:
            java.lang.Iterable r1 = (java.lang.Iterable) r1
            java.util.Iterator r1 = r1.iterator()
        L64:
            boolean r2 = r1.hasNext()
            if (r2 == 0) goto L7b
            java.lang.Object r2 = r1.next()
            boolean r6 = r0.c(r2)
            if (r6 != 0) goto L7a
            boolean r2 = r3.c(r2)
            if (r2 == 0) goto L64
        L7a:
            return r5
        L7b:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q22.v(java.util.Set):boolean");
    }

    public final boolean w() {
        synchronized (this.d) {
            l69 l69Var = this.q;
            boolean z = false;
            if (l69Var != null && (l69Var.h.get() != n69.Recomposing || l69Var.i != to7.j())) {
                AtomicReference atomicReference = l69Var.h;
                n69 n69Var = n69.ApplyPending;
                n69 n69Var2 = n69.RecomposePending;
                while (!atomicReference.compareAndSet(n69Var, n69Var2) && atomicReference.get() == n69Var) {
                }
                ((j68) l69Var.l.b).a(9);
                return false;
            }
            n();
            try {
                f78 f78Var = this.n;
                this.n = tp7.q();
                try {
                    p65 p65Var = this.v;
                    m8c m8cVar = this.p;
                    qv8 qv8Var = p65Var.e.s;
                    if (!qv8Var.H()) {
                        b22.a("Expected applyChanges() to have been called");
                    }
                    if (f78Var.e > 0 || !p65Var.s.isEmpty()) {
                        p65Var.P = m8cVar;
                        try {
                            p65Var.n(f78Var, null);
                            p65Var.P = null;
                            z = !qv8Var.H();
                        } catch (Throwable th) {
                            p65Var.P = null;
                            throw th;
                        }
                    }
                    if (!z) {
                        o();
                    }
                    return z;
                } catch (Throwable th2) {
                    this.n = f78Var;
                    throw th2;
                }
            } catch (Throwable th3) {
                try {
                    if (!this.e.a.g()) {
                        l3b l3bVar = this.u;
                        try {
                            l3bVar.j(this.e, this.v.A());
                            l3bVar.c();
                            l3bVar.b();
                        } catch (Throwable th4) {
                            l3bVar.b();
                            throw th4;
                        }
                    }
                    throw th3;
                } catch (Throwable th5) {
                    a();
                    throw th5;
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void x(jqb jqbVar) {
        Object obj;
        while (true) {
            Object obj2 = this.c.get();
            if (obj2 == null || obj2.equals(n01.l)) {
                obj = jqbVar;
            } else if (obj2 instanceof Set) {
                obj = new Set[]{obj2, jqbVar};
            } else {
                if (!(obj2 instanceof Object[])) {
                    lg8.w("corrupt pendingModifications: ", this.c);
                    return;
                }
                Set[] setArr = (Set[]) obj2;
                int length = setArr.length;
                Object[] objArrCopyOf = Arrays.copyOf(setArr, length + 1);
                objArrCopyOf[length] = jqbVar;
                obj = objArrCopyOf;
            }
            AtomicReference atomicReference = this.c;
            while (!atomicReference.compareAndSet(obj2, obj)) {
                if (atomicReference.get() != obj2) {
                    break;
                }
            }
            if (obj2 == null) {
                synchronized (this.d) {
                    o();
                }
                return;
            }
            return;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void y(java.lang.Object r21) {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q22.y(java.lang.Object):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0057  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void z(java.lang.Object r15) {
        /*
            r14 = this;
            java.lang.Object r0 = r14.d
            monitor-enter(r0)
            r14.u(r15)     // Catch: java.lang.Throwable -> L4f
            f78 r1 = r14.j     // Catch: java.lang.Throwable -> L4f
            java.lang.Object r15 = r1.g(r15)     // Catch: java.lang.Throwable -> L4f
            if (r15 == 0) goto L61
            boolean r1 = r15 instanceof defpackage.g78     // Catch: java.lang.Throwable -> L4f
            if (r1 == 0) goto L5c
            g78 r15 = (defpackage.g78) r15     // Catch: java.lang.Throwable -> L4f
            java.lang.Object[] r1 = r15.b     // Catch: java.lang.Throwable -> L4f
            long[] r15 = r15.a     // Catch: java.lang.Throwable -> L4f
            int r2 = r15.length     // Catch: java.lang.Throwable -> L4f
            int r2 = r2 + (-2)
            if (r2 < 0) goto L61
            r3 = 0
            r4 = r3
        L1f:
            r5 = r15[r4]     // Catch: java.lang.Throwable -> L4f
            long r7 = ~r5     // Catch: java.lang.Throwable -> L4f
            r9 = 7
            long r7 = r7 << r9
            long r7 = r7 & r5
            r9 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r7 = r7 & r9
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L57
            int r7 = r4 - r2
            int r7 = ~r7     // Catch: java.lang.Throwable -> L4f
            int r7 = r7 >>> 31
            r8 = 8
            int r7 = 8 - r7
            r9 = r3
        L39:
            if (r9 >= r7) goto L55
            r10 = 255(0xff, double:1.26E-321)
            long r10 = r10 & r5
            r12 = 128(0x80, double:6.3E-322)
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 >= 0) goto L51
            int r10 = r4 << 3
            int r10 = r10 + r9
            r10 = r1[r10]     // Catch: java.lang.Throwable -> L4f
            j83 r10 = (defpackage.j83) r10     // Catch: java.lang.Throwable -> L4f
            r14.u(r10)     // Catch: java.lang.Throwable -> L4f
            goto L51
        L4f:
            r14 = move-exception
            goto L63
        L51:
            long r5 = r5 >> r8
            int r9 = r9 + 1
            goto L39
        L55:
            if (r7 != r8) goto L61
        L57:
            if (r4 == r2) goto L61
            int r4 = r4 + 1
            goto L1f
        L5c:
            j83 r15 = (defpackage.j83) r15     // Catch: java.lang.Throwable -> L4f
            r14.u(r15)     // Catch: java.lang.Throwable -> L4f
        L61:
            monitor-exit(r0)
            return
        L63:
            monitor-exit(r0)
            throw r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.q22.z(java.lang.Object):void");
    }

    public final void m() {
        synchronized (this.d) {
            try {
                if (this.v.F) {
                    xx9.b("Composition is disposed while composing. If dispose is triggered by a call in @Composable function, consider wrapping it with SideEffect block.");
                }
                if (this.w != 3) {
                    this.w = 3;
                    tj1 tj1Var = this.v.L;
                    if (tj1Var != null) {
                        e(tj1Var);
                    }
                    boolean z = this.f.b == 0;
                    if (!z || !this.e.a.g()) {
                        l3b l3bVar = this.u;
                        try {
                            l3bVar.j(this.e, this.v.A());
                            if (!z) {
                                fgc fgcVar = this.f;
                                l3b l3bVar2 = this.u;
                                igc igcVarP = fgcVar.p();
                                try {
                                    igcVarP.m(igcVarP.t, new k6c(25, l3bVar2));
                                    igcVarP.G();
                                    igcVarP.e(true);
                                    this.b.b();
                                    this.b.l();
                                    l3bVar.d();
                                } catch (Throwable th) {
                                    igcVarP.e(false);
                                    throw th;
                                }
                            }
                            l3bVar.c();
                            l3bVar.b();
                        } catch (Throwable th2) {
                            l3bVar.b();
                            throw th2;
                        }
                    }
                    p65 p65Var = this.v;
                    p65Var.getClass();
                    Trace.beginSection(bPUi.ChGpHfhYbsVnPqH);
                    try {
                        p65Var.b.u(p65Var);
                        p65Var.E.clear();
                        p65Var.s.clear();
                        p65Var.e.s.F();
                        p65Var.v = null;
                        p65Var.a.b();
                        Trace.endSection();
                    } catch (Throwable th3) {
                        Trace.endSection();
                        throw th3;
                    }
                }
            } catch (Throwable th4) {
                throw th4;
            }
        }
        this.a.v(this);
    }
}
