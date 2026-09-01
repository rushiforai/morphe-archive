package defpackage;

import android.os.Trace;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class es4 extends q28 implements u22, fp6, ln8, t28 {
    public final boolean o;
    public final b55 p;
    public boolean q;
    public boolean r;
    public final int s;

    public es4(int i, b55 b55Var, int i2) {
        i = (i2 & 1) != 0 ? 1 : i;
        boolean z = (i2 & 2) == 0;
        b55Var = (i2 & 4) != 0 ? null : b55Var;
        this.o = z;
        this.p = b55Var;
        this.s = i;
    }

    @Override // defpackage.q28
    public final void A0() {
        int i = ds4.b[N0().ordinal()];
        if (i == 1 || i == 2) {
            or4 or4Var = (or4) ((mn) flb.w0(this)).getFocusOwner();
            or4Var.b(8, true, false);
            if (this.o) {
                or4Var.a.F();
            }
            or4Var.d.a();
            return;
        }
        if (i != 3) {
            if (i == 4) {
                return;
            }
            ygf.a();
            return;
        }
        lr4 focusOwner = ((mn) flb.w0(this)).getFocusOwner();
        es4 es4VarM = rx0.M(this);
        if (es4VarM == null || !es4VarM.o) {
            return;
        }
        or4 or4Var2 = (or4) focusOwner;
        or4Var2.a.F();
        or4Var2.d.a();
    }

    @Override // defpackage.q28
    public final void C0() {
        if (N0().isFocused()) {
            ((or4) ((mn) flb.w0(this)).getFocusOwner()).b(8, true, true);
        }
    }

    public final boolean I0(int i) {
        int i2 = ds4.a[k50.f0(this, i).ordinal()];
        if (i2 == 1) {
            return k50.g0(this);
        }
        if (i2 == 2) {
            return true;
        }
        if (i2 == 3 || i2 == 4) {
            return false;
        }
        ygf.a();
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v11, types: [q28] */
    /* JADX WARN: Type inference failed for: r3v12, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v13 */
    /* JADX WARN: Type inference failed for: r3v14 */
    /* JADX WARN: Type inference failed for: r3v15 */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v18 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r3v8, types: [q28] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7, types: [o78] */
    /* JADX WARN: Type inference failed for: r6v5 */
    public final void J0(zr4 zr4Var, zr4 zr4Var2) {
        hj0 hj0Var;
        b55 b55Var;
        or4 or4Var = (or4) ((mn) flb.w0(this)).getFocusOwner();
        es4 es4VarF = or4Var.f();
        if (!g76.L(zr4Var, zr4Var2) && (b55Var = this.p) != null) {
            b55Var.invoke(zr4Var, zr4Var2);
        }
        q28 q28Var = this.a;
        if (!q28Var.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var2 = this.a;
        aq6 aq6VarV0 = flb.v0(this);
        while (aq6VarV0 != null) {
            if ((((q28) aq6VarV0.F.g).d & FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE) != 0) {
                while (q28Var2 != null) {
                    int i = q28Var2.c;
                    if ((i & FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE) != 0) {
                        if (q28Var2 != q28Var && (i & 1024) != 0) {
                            return;
                        }
                        if ((i & 4096) != 0) {
                            ?? Q0 = q28Var2;
                            ?? o78Var = 0;
                            while (Q0 != 0) {
                                if (Q0 instanceof cr4) {
                                    cr4 cr4Var = (cr4) Q0;
                                    if (es4VarF == or4Var.f()) {
                                        cr4Var.F(zr4Var2);
                                    }
                                } else if ((Q0.c & 4096) != 0 && (Q0 instanceof b43)) {
                                    q28 q28Var3 = ((b43) Q0).p;
                                    int i2 = 0;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                    while (q28Var3 != null) {
                                        if ((q28Var3.c & 4096) != 0) {
                                            i2++;
                                            o78Var = o78Var;
                                            if (i2 == 1) {
                                                Q0 = q28Var3;
                                            } else {
                                                if (o78Var == 0) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var.b(q28Var3);
                                            }
                                        }
                                        q28Var3 = q28Var3.f;
                                        Q0 = Q0;
                                        o78Var = o78Var;
                                    }
                                    if (i2 == 1) {
                                    }
                                }
                                Q0 = flb.q0(o78Var);
                            }
                        }
                    }
                    q28Var2 = q28Var2.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var2 = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11, types: [q28] */
    /* JADX WARN: Type inference failed for: r6v12, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14 */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v17 */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r6v7 */
    /* JADX WARN: Type inference failed for: r6v8, types: [q28] */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v2 */
    /* JADX WARN: Type inference failed for: r7v3 */
    /* JADX WARN: Type inference failed for: r7v4, types: [o78] */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7, types: [o78] */
    /* JADX WARN: Type inference failed for: r8v4 */
    public final qr4 K0() {
        boolean z;
        hj0 hj0Var;
        qr4 qr4Var = new qr4();
        qr4Var.a = true;
        sr4 sr4Var = sr4.b;
        qr4Var.b = sr4Var;
        qr4Var.c = sr4Var;
        qr4Var.d = sr4Var;
        qr4Var.e = sr4Var;
        qr4Var.f = sr4Var;
        qr4Var.g = sr4Var;
        qr4Var.h = sr4Var;
        qr4Var.i = sr4Var;
        qr4Var.j = zu2.q;
        qr4Var.k = zu2.r;
        qr4Var.l = hpe.e;
        int i = this.s;
        if (i == 1) {
            z = true;
        } else if (i == 0) {
            z = !(((u26) ((w26) ((v26) bo.K(this, z22.m))).a.getValue()).a == 1);
        } else {
            if (i != 2) {
                ygf.f("Unknown Focusability");
                return null;
            }
            z = false;
        }
        qr4Var.a = z;
        q28 q28Var = this.a;
        if (!q28Var.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var2 = this.a;
        aq6 aq6VarV0 = flb.v0(this);
        loop0: while (aq6VarV0 != null) {
            if ((((q28) aq6VarV0.F.g).d & 3072) != 0) {
                while (q28Var2 != null) {
                    int i2 = q28Var2.c;
                    if ((i2 & 3072) != 0) {
                        if (q28Var2 != q28Var && (i2 & 1024) != 0) {
                            break loop0;
                        }
                        if ((i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
                            ?? o78Var = 0;
                            ?? Q0 = q28Var2;
                            while (Q0 != 0) {
                                if (Q0 instanceof rr4) {
                                    ((rr4) Q0).C(qr4Var);
                                } else if ((Q0.c & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 && (Q0 instanceof b43)) {
                                    q28 q28Var3 = ((b43) Q0).p;
                                    int i3 = 0;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                    while (q28Var3 != null) {
                                        if ((q28Var3.c & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
                                            i3++;
                                            o78Var = o78Var;
                                            if (i3 == 1) {
                                                Q0 = q28Var3;
                                            } else {
                                                if (o78Var == 0) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var.b(q28Var3);
                                            }
                                        }
                                        q28Var3 = q28Var3.f;
                                        Q0 = Q0;
                                        o78Var = o78Var;
                                    }
                                    if (i3 == 1) {
                                    }
                                }
                                Q0 = flb.q0(o78Var);
                            }
                        }
                    }
                    q28Var2 = q28Var2.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var2 = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
        return qr4Var;
    }

    public final zwa L0(hp6 hp6Var) {
        zwa zwaVar = K0().l;
        return zwaVar != hpe.e ? hp6Var == null ? zwaVar : zwaVar.i(hp6Var.G(flb.u0(this), 0L)) : hp6Var != null ? hp6Var.H(flb.u0(this), false) : lk7.l(0L, nk7.C0(flb.u0(this).c));
    }

    public final gt6 M0() {
        hj0 hj0Var;
        Object obj;
        if (!this.a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var = this.a.e;
        aq6 aq6VarV0 = flb.v0(this);
        while (true) {
            if (aq6VarV0 == null) {
                break;
            }
            if ((((q28) aq6VarV0.F.g).d & 8388640) != 0) {
                while (q28Var != null) {
                    int i = q28Var.c;
                    if ((i & 8388640) != 0) {
                        if ((8388608 & i) != 0) {
                            if (!(q28Var instanceof gt6)) {
                                if (q28Var instanceof b43) {
                                    q28Var = null;
                                    for (q28 q28Var2 = ((b43) q28Var).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                        if (q28Var2 instanceof gt6) {
                                            q28Var = q28Var2;
                                        }
                                    }
                                } else {
                                    q28Var = null;
                                }
                            }
                            gt6 gt6Var = (gt6) q28Var;
                            if (gt6Var != null) {
                                return gt6Var;
                            }
                        } else if ((i & 32) != 0) {
                            if (q28Var instanceof t28) {
                                obj = q28Var;
                            } else if (q28Var instanceof b43) {
                                obj = null;
                                for (q28 q28Var3 = ((b43) q28Var).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                    if (q28Var3 instanceof t28) {
                                        obj = q28Var3;
                                    }
                                }
                            } else {
                                obj = null;
                            }
                            t28 t28Var = (t28) obj;
                            if (t28Var != null) {
                                t28Var.T();
                            }
                        }
                    }
                    q28Var = q28Var.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
        return null;
    }

    public final zr4 N0() {
        hj0 hj0Var;
        if (!this.n) {
            return zr4.Inactive;
        }
        es4 es4VarF = ((or4) ((mn) flb.w0(this)).getFocusOwner()).f();
        if (es4VarF == null) {
            return zr4.Inactive;
        }
        if (this == es4VarF) {
            return zr4.Active;
        }
        if (es4VarF.n) {
            if (!es4VarF.a.n) {
                b26.b("visitAncestors called on an unattached node");
            }
            q28 q28Var = es4VarF.a.e;
            aq6 aq6VarV0 = flb.v0(es4VarF);
            while (aq6VarV0 != null) {
                if ((((q28) aq6VarV0.F.g).d & 1024) != 0) {
                    while (q28Var != null) {
                        if ((q28Var.c & 1024) != 0) {
                            q28 q28VarQ0 = q28Var;
                            o78 o78Var = null;
                            while (q28VarQ0 != null) {
                                if (q28VarQ0 instanceof es4) {
                                    if (this == ((es4) q28VarQ0)) {
                                        return zr4.ActiveParent;
                                    }
                                } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                    int i = 0;
                                    for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                        if ((q28Var2.c & 1024) != 0) {
                                            i++;
                                            if (i == 1) {
                                                q28VarQ0 = q28Var2;
                                            } else {
                                                if (o78Var == null) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (q28VarQ0 != null) {
                                                    o78Var.b(q28VarQ0);
                                                    q28VarQ0 = null;
                                                }
                                                o78Var.b(q28Var2);
                                            }
                                        }
                                    }
                                    if (i == 1) {
                                    }
                                }
                                q28VarQ0 = flb.q0(o78Var);
                            }
                        }
                        q28Var = q28Var.e;
                    }
                }
                aq6VarV0 = aq6VarV0.v();
                q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
            }
        }
        return zr4.Inactive;
    }

    public final void O0() {
        int i = ds4.b[N0().ordinal()];
        if (i != 1 && i != 2) {
            if (i == 3 || i == 4) {
                return;
            }
            ygf.a();
            return;
        }
        rya ryaVar = new rya();
        mo7.T(this, new cn(ryaVar, 13, this));
        Object obj = ryaVar.a;
        if (obj == null) {
            g76.g0("focusProperties");
            throw null;
        }
        if (((pr4) obj).b()) {
            return;
        }
        ((or4) ((mn) flb.w0(this)).getFocusOwner()).b(8, true, true);
    }

    public final boolean P0(int i) {
        Trace.beginSection("FocusTransactions:requestFocus");
        try {
            return K0().a ? I0(i) : gr7.k(this, i, new in(i, 4));
        } finally {
            Trace.endSection();
        }
    }

    @Override // defpackage.t28
    public final /* synthetic */ uob T() {
        return uob.c;
    }

    @Override // defpackage.ln8
    public final void d0() {
        O0();
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.fp6
    public final void l(hp6 hp6Var) {
    }

    @Override // defpackage.fl7
    public final void p(long j) {
    }
}
