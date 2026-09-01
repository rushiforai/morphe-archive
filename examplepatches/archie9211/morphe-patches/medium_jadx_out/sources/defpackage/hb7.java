package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hb7 extends fb7 implements tk7 {
    public final eh8 o;
    public LinkedHashMap q;
    public al7 s;
    public final t68 t;
    public long p = 0;
    public final ib7 r = new ib7(this);

    public hb7(eh8 eh8Var) {
        this.o = eh8Var;
        t68 t68Var = om8.a;
        this.t = new t68();
    }

    @Override // defpackage.fb7
    public final void C0() {
        X(this.p, 0.0f, null);
    }

    public void D0() {
        w0().d();
    }

    public final void E0(long j) {
        if (!k46.b(this.p, j)) {
            this.p = j;
            eh8 eh8Var = this.o;
            mb7 mb7Var = eh8Var.o.G.q;
            if (mb7Var != null) {
                mb7Var.o0();
            }
            fb7.A0(eh8Var);
        }
        if (this.k) {
            return;
        }
        o0(w0());
    }

    public final long F0(hb7 hb7Var, boolean z) {
        long jD = 0;
        while (!this.equals(hb7Var)) {
            if (!this.i || !z) {
                jD = k46.d(jD, this.p);
            }
            eh8 eh8Var = this.o.q;
            eh8Var.getClass();
            this = eh8Var.M0();
            this.getClass();
        }
        return jD;
    }

    public final void G0(al7 al7Var) {
        LinkedHashMap linkedHashMap;
        if (al7Var != null) {
            d0((((long) al7Var.a()) & 4294967295L) | (((long) al7Var.b()) << 32));
        } else {
            d0(0L);
        }
        if (!g76.L(this.s, al7Var) && al7Var != null && ((((linkedHashMap = this.q) != null && !linkedHashMap.isEmpty()) || !al7Var.c().isEmpty()) && !g76.L(al7Var.c(), this.q))) {
            mb7 mb7Var = this.o.o.G.q;
            mb7Var.getClass();
            mb7Var.s.f();
            LinkedHashMap linkedHashMap2 = this.q;
            if (linkedHashMap2 == null) {
                linkedHashMap2 = new LinkedHashMap();
                this.q = linkedHashMap2;
            }
            linkedHashMap2.clear();
            linkedHashMap2.putAll(al7Var.c());
        }
        this.s = al7Var;
    }

    @Override // defpackage.m73
    public final float U() {
        return this.o.U();
    }

    @Override // defpackage.fb7, defpackage.y66
    public final boolean W() {
        return true;
    }

    @Override // defpackage.t99
    public final void X(long j, float f, x45 x45Var) {
        E0(j);
        if (this.j) {
            return;
        }
        D0();
    }

    @Override // defpackage.m73
    public final float b() {
        return this.o.b();
    }

    @Override // defpackage.y66
    public final ip6 getLayoutDirection() {
        return this.o.o.z;
    }

    @Override // defpackage.fb7
    public final fb7 r0() {
        eh8 eh8Var = this.o.p;
        if (eh8Var != null) {
            return eh8Var.M0();
        }
        return null;
    }

    @Override // defpackage.fb7
    public final hp6 s0() {
        return this.r;
    }

    @Override // defpackage.fb7
    public final boolean u0() {
        return this.s != null;
    }

    @Override // defpackage.fb7
    public final aq6 v0() {
        return this.o.o;
    }

    @Override // defpackage.t99, defpackage.tk7
    public final Object w() {
        return this.o.w();
    }

    @Override // defpackage.fb7
    public final al7 w0() {
        al7 al7Var = this.s;
        if (al7Var != null) {
            return al7Var;
        }
        throw lv8.v("LookaheadDelegate has not been measured yet when measureResult is requested.");
    }

    @Override // defpackage.fb7
    public final fb7 x0() {
        eh8 eh8Var = this.o.q;
        if (eh8Var != null) {
            return eh8Var.M0();
        }
        return null;
    }

    @Override // defpackage.fb7
    public final long y0() {
        return this.p;
    }
}
