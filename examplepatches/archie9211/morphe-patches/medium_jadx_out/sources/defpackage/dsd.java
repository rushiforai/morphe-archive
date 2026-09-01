package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dsd {
    public final b2 a;
    public final dsd b;
    public final String c;
    public final k49 d;
    public final k49 e;
    public final i49 f = new i49(0);
    public final i49 g = new i49(Long.MIN_VALUE);
    public final k49 h;
    public final ejc i;
    public final ejc j;
    public final k49 k;
    public final j83 l;

    public dsd(b2 b2Var, dsd dsdVar, String str) {
        this.a = b2Var;
        this.b = dsdVar;
        this.c = str;
        this.d = qo7.u(b2Var.o0());
        this.e = qo7.u(new asd(b2Var.o0(), b2Var.o0()));
        Boolean bool = Boolean.FALSE;
        this.h = qo7.u(bool);
        this.i = new ejc();
        this.j = new ejc();
        this.k = qo7.u(bool);
        this.l = bjc.b(new urd(this, 1));
        b2Var.u0(this);
    }

    public final void a(Object obj, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1493585151);
        if ((i & 6) == 0) {
            i2 = ((i & 8) == 0 ? p65Var.f(obj) : p65Var.h(obj) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(this) ? 32 : 16;
        }
        int i3 = 0;
        if (!p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.S();
        } else if (g()) {
            p65Var.Y(467722849);
            p65Var.p(false);
        } else {
            p65Var.Y(466062241);
            p(obj);
            int i4 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = i4 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = bjc.b(new urd(this, i3));
                p65Var.j0(objM);
            }
            if (((Boolean) ((upc) objM).getValue()).booleanValue()) {
                p65Var.Y(466470356);
                Object objM2 = p65Var.M();
                if (objM2 == uobVar) {
                    objM2 = kyd.M(p65Var);
                    p65Var.j0(objM2);
                }
                sb2 sb2Var = (sb2) objM2;
                boolean zH = p65Var.h(sb2Var) | (i4 == 32);
                Object objM3 = p65Var.M();
                if (zH || objM3 == uobVar) {
                    objM3 = new vrd(sb2Var, i3, this);
                    p65Var.j0(objM3);
                }
                kyd.i(sb2Var, this, (x45) objM3, p65Var);
                p65Var.p(false);
            } else {
                p65Var.Y(467712929);
                p65Var.p(false);
            }
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(this, obj, i, 10);
        }
    }

    public final long b() {
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        long jMax = 0;
        for (int i = 0; i < size; i++) {
            jMax = Math.max(jMax, ((bsd) ejcVar.get(i)).l.g());
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            jMax = Math.max(jMax, ((dsd) ejcVar2.get(i2)).b());
        }
        return jMax;
    }

    public final void c() {
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            bsd bsdVar = (bsd) ejcVar.get(i);
            bsdVar.f = null;
            bsdVar.e = null;
            bsdVar.i = false;
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            ((dsd) ejcVar2.get(i2)).c();
        }
    }

    public final boolean d() {
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            if (((bsd) ejcVar.get(i)).e != null) {
                return true;
            }
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            if (((dsd) ejcVar2.get(i2)).d()) {
                return true;
            }
        }
        return false;
    }

    public final long e() {
        dsd dsdVar = this.b;
        return dsdVar != null ? dsdVar.e() : this.f.g();
    }

    public final zrd f() {
        return (zrd) this.e.getValue();
    }

    public final boolean g() {
        return ((Boolean) this.k.getValue()).booleanValue();
    }

    public final void h(long j, boolean z) {
        i49 i49Var = this.g;
        long jG = i49Var.g();
        b2 b2Var = this.a;
        if (jG == Long.MIN_VALUE) {
            i49Var.h(j);
            ((k49) b2Var.b).setValue(Boolean.TRUE);
        } else if (!((Boolean) ((k49) b2Var.b).getValue()).booleanValue()) {
            ((k49) b2Var.b).setValue(Boolean.TRUE);
        }
        this.h.setValue(Boolean.FALSE);
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        boolean z2 = true;
        for (int i = 0; i < size; i++) {
            bsd bsdVar = (bsd) ejcVar.get(i);
            k49 k49Var = bsdVar.g;
            k49 k49Var2 = bsdVar.g;
            if (!((Boolean) k49Var.getValue()).booleanValue()) {
                long jC = z ? bsdVar.c().c() : j;
                bsdVar.e(bsdVar.c().g(jC));
                bsdVar.k = bsdVar.c().e(jC);
                sfd sfdVarC = bsdVar.c();
                sfdVarC.getClass();
                if (lv8.a(sfdVarC, jC)) {
                    k49Var2.setValue(Boolean.TRUE);
                }
            }
            if (!((Boolean) k49Var2.getValue()).booleanValue()) {
                z2 = false;
            }
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            dsd dsdVar = (dsd) ejcVar2.get(i2);
            k49 k49Var3 = dsdVar.d;
            b2 b2Var2 = dsdVar.a;
            if (!g76.L(k49Var3.getValue(), b2Var2.o0())) {
                dsdVar.h(j, z);
            }
            if (!g76.L(dsdVar.d.getValue(), b2Var2.o0())) {
                z2 = false;
            }
        }
        if (z2) {
            i();
        }
    }

    public final void i() {
        this.g.h(Long.MIN_VALUE);
        b2 b2Var = this.a;
        if (b2Var instanceof m78) {
            ((m78) b2Var).t0(this.d.getValue());
        }
        n(0L);
        ((k49) b2Var.b).setValue(Boolean.FALSE);
        ejc ejcVar = this.j;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            ((dsd) ejcVar.get(i)).i();
        }
    }

    public final void j(float f) {
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            bsd bsdVar = (bsd) ejcVar.get(i);
            bsdVar.getClass();
            if (f == -4.0f || f == -5.0f) {
                sfd sfdVar = bsdVar.f;
                if (sfdVar != null) {
                    bsdVar.c().a(sfdVar.c);
                    bsdVar.e = null;
                    bsdVar.f = null;
                }
                Object obj = f == -4.0f ? bsdVar.c().d : bsdVar.c().c;
                bsdVar.c().a(obj);
                bsdVar.c().i(obj);
                bsdVar.e(obj);
                bsdVar.l.h(bsdVar.c().c());
            } else {
                bsdVar.h.h(f);
            }
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            ((dsd) ejcVar2.get(i2)).j(f);
        }
    }

    public final void k(Object obj, Object obj2) {
        this.g.h(Long.MIN_VALUE);
        b2 b2Var = this.a;
        ((k49) b2Var.b).setValue(Boolean.FALSE);
        boolean zG = g();
        k49 k49Var = this.d;
        if (!zG || !g76.L(b2Var.o0(), obj) || !g76.L(k49Var.getValue(), obj2)) {
            if (!g76.L(b2Var.o0(), obj) && (b2Var instanceof m78)) {
                ((m78) b2Var).t0(obj);
            }
            k49Var.setValue(obj2);
            this.k.setValue(Boolean.TRUE);
            this.e.setValue(new asd(obj, obj2));
        }
        ejc ejcVar = this.j;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            dsd dsdVar = (dsd) ejcVar.get(i);
            dsdVar.getClass();
            if (dsdVar.g()) {
                dsdVar.k(dsdVar.a.o0(), dsdVar.d.getValue());
            }
        }
        ejc ejcVar2 = this.i;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            ((bsd) ejcVar2.get(i2)).d(0L);
        }
    }

    public final void l(long j) {
        i49 i49Var = this.g;
        if (i49Var.g() == Long.MIN_VALUE) {
            i49Var.h(j);
        }
        n(j);
        this.h.setValue(Boolean.FALSE);
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            ((bsd) ejcVar.get(i)).d(j);
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            dsd dsdVar = (dsd) ejcVar2.get(i2);
            if (!g76.L(dsdVar.d.getValue(), dsdVar.a.o0())) {
                dsdVar.l(j);
            }
        }
    }

    public final void m(awb awbVar) {
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            bsd bsdVar = (bsd) ejcVar.get(i);
            k49 k49Var = bsdVar.j;
            if (!g76.L(bsdVar.c().c, bsdVar.c().d)) {
                bsdVar.f = bsdVar.c();
                bsdVar.e = awbVar;
            }
            bsdVar.d.setValue(new sfd(bsdVar.n, bsdVar.a, k49Var.getValue(), k49Var.getValue(), bsdVar.k.c()));
            bsdVar.l.h(bsdVar.c().c());
            bsdVar.i = true;
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            ((dsd) ejcVar2.get(i2)).m(awbVar);
        }
    }

    public final void n(long j) {
        if (this.b == null) {
            this.f.h(j);
        }
    }

    public final void o() {
        sfd sfdVar;
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            bsd bsdVar = (bsd) ejcVar.get(i);
            awb awbVar = bsdVar.e;
            if (awbVar != null && (sfdVar = bsdVar.f) != null) {
                long jX0 = nk7.x0(awbVar.g * ((double) awbVar.d));
                Object objG = sfdVar.g(jX0);
                if (bsdVar.i) {
                    bsdVar.c().i(objG);
                }
                bsdVar.c().a(objG);
                bsdVar.l.h(bsdVar.c().c());
                if (bsdVar.h.g() == -2.0f || bsdVar.i) {
                    bsdVar.e(objG);
                } else {
                    bsdVar.d(bsdVar.o.e());
                }
                if (jX0 >= awbVar.g) {
                    bsdVar.e = null;
                    bsdVar.f = null;
                } else {
                    awbVar.c = false;
                }
            }
        }
        ejc ejcVar2 = this.j;
        int size2 = ejcVar2.size();
        for (int i2 = 0; i2 < size2; i2++) {
            ((dsd) ejcVar2.get(i2)).o();
        }
    }

    public final void p(Object obj) {
        k49 k49Var = this.d;
        if (g76.L(k49Var.getValue(), obj)) {
            return;
        }
        this.e.setValue(new asd(k49Var.getValue(), obj));
        b2 b2Var = this.a;
        if (!g76.L(b2Var.o0(), k49Var.getValue())) {
            b2Var.t0(k49Var.getValue());
        }
        k49Var.setValue(obj);
        if (this.g.g() == Long.MIN_VALUE) {
            this.h.setValue(Boolean.TRUE);
        }
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        for (int i = 0; i < size; i++) {
            ((bsd) ejcVar.get(i)).h.h(-2.0f);
        }
    }

    public final String toString() {
        ejc ejcVar = this.i;
        int size = ejcVar.size();
        String str = "Transition animation values: ";
        for (int i = 0; i < size; i++) {
            str = str + ((bsd) ejcVar.get(i)) + ", ";
        }
        return str;
    }
}
