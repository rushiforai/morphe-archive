package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.List;

/* loaded from: classes3.dex */
public final class x implements s2 {

    /* renamed from: a, reason: collision with root package name */
    public final w f30942a;

    /* renamed from: b, reason: collision with root package name */
    public int f30943b;

    /* renamed from: c, reason: collision with root package name */
    public int f30944c;

    /* renamed from: d, reason: collision with root package name */
    public int f30945d = 0;

    public x(w wVar) {
        Charset charset = l1.f30847a;
        if (wVar == null) {
            throw new NullPointerException("input");
        }
        this.f30942a = wVar;
        wVar.f30931d = this;
    }

    public static void c(int i5) throws n1 {
        if ((i5 & 3) != 0) {
            throw new n1("Failed to parse the message.");
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object a(Class cls, h0 h0Var) throws m1 {
        b(3);
        return c(p2.f30870c.a(cls), h0Var);
    }

    public final void b(int i5) throws m1 {
        if ((this.f30943b & 7) == i5) {
            return;
        }
        int i11 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int d() throws m1 {
        b(0);
        return this.f30942a.k();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int e() {
        return this.f30943b;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long f() throws m1 {
        b(0);
        return this.f30942a.v();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long g() throws m1 {
        b(1);
        return this.f30942a.i();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final double h() throws m1 {
        b(1);
        return this.f30942a.f();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final boolean i() {
        int i5;
        if (this.f30942a.c() || (i5 = this.f30943b) == this.f30944c) {
            return false;
        }
        return this.f30942a.e(i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int j() throws m1 {
        b(0);
        return this.f30942a.p();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final float k() throws m1 {
        b(5);
        return this.f30942a.j();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long l() throws m1 {
        b(0);
        return this.f30942a.q();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int m() throws m1 {
        b(5);
        return this.f30942a.n();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final String n() throws m1 {
        b(2);
        return this.f30942a.r();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long o() throws m1 {
        b(0);
        return this.f30942a.l();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final String p() throws m1 {
        b(2);
        return this.f30942a.s();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int q() throws m1 {
        b(5);
        return this.f30942a.h();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final boolean r() throws m1 {
        b(0);
        return this.f30942a.d();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int s() {
        int i5 = this.f30945d;
        if (i5 != 0) {
            this.f30943b = i5;
            this.f30945d = 0;
        } else {
            this.f30943b = this.f30942a.t();
        }
        int i11 = this.f30943b;
        return (i11 == 0 || i11 == this.f30944c) ? LayoutNode.NotPlacedPlaceOrder : i11 >>> 3;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long t() throws m1 {
        b(1);
        return this.f30942a.o();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void e(List list) throws n1 {
        int iT;
        int iT2;
        if (!(list instanceof a1)) {
            int i5 = this.f30943b & 7;
            if (i5 == 2) {
                int iU = this.f30942a.u();
                c(iU);
                int iB = this.f30942a.b() + iU;
                do {
                    list.add(Integer.valueOf(this.f30942a.h()));
                } while (this.f30942a.b() < iB);
                return;
            }
            if (i5 != 5) {
                int i11 = n1.f30859a;
                throw new m1();
            }
            do {
                list.add(Integer.valueOf(this.f30942a.h()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        a1 a1Var = (a1) list;
        int i12 = this.f30943b & 7;
        if (i12 == 2) {
            int iU2 = this.f30942a.u();
            c(iU2);
            int iB2 = this.f30942a.b() + iU2;
            do {
                a1Var.c(this.f30942a.h());
            } while (this.f30942a.b() < iB2);
            return;
        }
        if (i12 != 5) {
            int i13 = n1.f30859a;
            throw new m1();
        }
        do {
            a1Var.c(this.f30942a.h());
            if (this.f30942a.c()) {
                return;
            } else {
                iT2 = this.f30942a.t();
            }
        } while (iT2 == this.f30943b);
        this.f30945d = iT2;
    }

    public static void d(int i5) throws n1 {
        if ((i5 & 7) != 0) {
            throw new n1("Failed to parse the message.");
        }
    }

    public final Object c(t2 t2Var, h0 h0Var) {
        int i5 = this.f30944c;
        this.f30944c = ((this.f30943b >>> 3) << 3) | 4;
        try {
            Object objA = t2Var.a();
            t2Var.a(objA, this, h0Var);
            t2Var.c(objA);
            if (this.f30943b == this.f30944c) {
                return objA;
            }
            throw new n1("Failed to parse the message.");
        } finally {
            this.f30944c = i5;
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void f(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 2) {
                int iU = this.f30942a.u();
                c(iU);
                int iB = this.f30942a.b() + iU;
                do {
                    a1Var.c(this.f30942a.n());
                } while (this.f30942a.b() < iB);
                return;
            }
            if (i5 == 5) {
                do {
                    a1Var.c(this.f30942a.n());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 2) {
            int iU2 = this.f30942a.u();
            c(iU2);
            int iB2 = this.f30942a.b() + iU2;
            do {
                list.add(Integer.valueOf(this.f30942a.n()));
            } while (this.f30942a.b() < iB2);
            return;
        }
        if (i12 == 5) {
            do {
                list.add(Integer.valueOf(this.f30942a.n()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void g(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    u1Var.a(this.f30942a.q());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    u1Var.a(this.f30942a.q());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Long.valueOf(this.f30942a.q()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Long.valueOf(this.f30942a.q()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void h(List list) throws m1 {
        int iT;
        if ((this.f30943b & 7) == 2) {
            do {
                b(2);
                list.add(this.f30942a.e());
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        int i5 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void i(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    a1Var.c(this.f30942a.u());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    a1Var.c(this.f30942a.u());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Integer.valueOf(this.f30942a.u()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Integer.valueOf(this.f30942a.u()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void j(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof d0) {
            d0 d0Var = (d0) list;
            int i5 = this.f30943b & 7;
            if (i5 == 1) {
                do {
                    d0Var.a(this.f30942a.f());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iU = this.f30942a.u();
                d(iU);
                int iB = this.f30942a.b() + iU;
                do {
                    d0Var.a(this.f30942a.f());
                } while (this.f30942a.b() < iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 1) {
            do {
                list.add(Double.valueOf(this.f30942a.f()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iU2 = this.f30942a.u();
            d(iU2);
            int iB2 = this.f30942a.b() + iU2;
            do {
                list.add(Double.valueOf(this.f30942a.f()));
            } while (this.f30942a.b() < iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void k(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    u1Var.a(this.f30942a.l());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    u1Var.a(this.f30942a.l());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Long.valueOf(this.f30942a.l()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Long.valueOf(this.f30942a.l()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void l(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof j) {
            j jVar = (j) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    jVar.a(this.f30942a.d());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    jVar.a(this.f30942a.d());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Boolean.valueOf(this.f30942a.d()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Boolean.valueOf(this.f30942a.d()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void m(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 1) {
                do {
                    u1Var.a(this.f30942a.o());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iU = this.f30942a.u();
                d(iU);
                int iB = this.f30942a.b() + iU;
                do {
                    u1Var.a(this.f30942a.o());
                } while (this.f30942a.b() < iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 1) {
            do {
                list.add(Long.valueOf(this.f30942a.o()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iU2 = this.f30942a.u();
            d(iU2);
            int iB2 = this.f30942a.b() + iU2;
            do {
                list.add(Long.valueOf(this.f30942a.o()));
            } while (this.f30942a.b() < iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void n(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 1) {
                do {
                    u1Var.a(this.f30942a.i());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iU = this.f30942a.u();
                d(iU);
                int iB = this.f30942a.b() + iU;
                do {
                    u1Var.a(this.f30942a.i());
                } while (this.f30942a.b() < iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 1) {
            do {
                list.add(Long.valueOf(this.f30942a.i()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iU2 = this.f30942a.u();
            d(iU2);
            int iB2 = this.f30942a.b() + iU2;
            do {
                list.add(Long.valueOf(this.f30942a.i()));
            } while (this.f30942a.b() < iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void o(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    a1Var.c(this.f30942a.k());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    a1Var.c(this.f30942a.k());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Integer.valueOf(this.f30942a.k()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Integer.valueOf(this.f30942a.k()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void p(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    a1Var.c(this.f30942a.g());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    a1Var.c(this.f30942a.g());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Integer.valueOf(this.f30942a.g()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Integer.valueOf(this.f30942a.g()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void q(List list) throws m1 {
        a(list, false);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object a(t2 t2Var, h0 h0Var) throws m1 {
        b(3);
        return c(t2Var, h0Var);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object b(Class cls, h0 h0Var) throws m1 {
        b(2);
        return d(p2.f30870c.a(cls), h0Var);
    }

    public final Object d(t2 t2Var, h0 h0Var) throws n1 {
        int iU = this.f30942a.u();
        w wVar = this.f30942a;
        if (wVar.f30928a < wVar.f30929b) {
            int iD = wVar.d(iU);
            Object objA = t2Var.a();
            this.f30942a.f30928a++;
            t2Var.a(objA, this, h0Var);
            t2Var.c(objA);
            this.f30942a.a(0);
            r5.f30928a--;
            this.f30942a.c(iD);
            return objA;
        }
        throw new n1("Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit.");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final s a() throws m1 {
        b(2);
        return this.f30942a.e();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void a(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    u1Var.a(this.f30942a.v());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    u1Var.a(this.f30942a.v());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Long.valueOf(this.f30942a.v()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Long.valueOf(this.f30942a.v()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object b(t2 t2Var, h0 h0Var) throws m1 {
        b(2);
        return d(t2Var, h0Var);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int b() throws m1 {
        b(0);
        return this.f30942a.g();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void b(List list) throws m1 {
        a(list, true);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void b(List list, t2 t2Var, h0 h0Var) throws m1 {
        int iT;
        int i5 = this.f30943b;
        if ((i5 & 7) == 2) {
            do {
                list.add(d(t2Var, h0Var));
                if (this.f30942a.c() || this.f30945d != 0) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == i5);
            this.f30945d = iT;
            return;
        }
        int i11 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int c() throws m1 {
        b(0);
        return this.f30942a.u();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void c(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i5 = this.f30943b & 7;
            if (i5 == 0) {
                do {
                    a1Var.c(this.f30942a.p());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            if (i5 == 2) {
                int iB = this.f30942a.b() + this.f30942a.u();
                do {
                    a1Var.c(this.f30942a.p());
                } while (this.f30942a.b() < iB);
                a(iB);
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 0) {
            do {
                list.add(Integer.valueOf(this.f30942a.p()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        if (i12 == 2) {
            int iB2 = this.f30942a.b() + this.f30942a.u();
            do {
                list.add(Integer.valueOf(this.f30942a.p()));
            } while (this.f30942a.b() < iB2);
            a(iB2);
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void d(List list) throws n1 {
        int iT;
        int iT2;
        if (list instanceof q0) {
            q0 q0Var = (q0) list;
            int i5 = this.f30943b & 7;
            if (i5 == 2) {
                int iU = this.f30942a.u();
                c(iU);
                int iB = this.f30942a.b() + iU;
                do {
                    q0Var.a(this.f30942a.j());
                } while (this.f30942a.b() < iB);
                return;
            }
            if (i5 == 5) {
                do {
                    q0Var.a(this.f30942a.j());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            int i11 = n1.f30859a;
            throw new m1();
        }
        int i12 = this.f30943b & 7;
        if (i12 == 2) {
            int iU2 = this.f30942a.u();
            c(iU2);
            int iB2 = this.f30942a.b() + iU2;
            do {
                list.add(Float.valueOf(this.f30942a.j()));
            } while (this.f30942a.b() < iB2);
            return;
        }
        if (i12 == 5) {
            do {
                list.add(Float.valueOf(this.f30942a.j()));
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        int i13 = n1.f30859a;
        throw new m1();
    }

    public final void a(List list, boolean z11) throws m1 {
        String strR;
        int iT;
        int iT2;
        if ((this.f30943b & 7) == 2) {
            if ((list instanceof q1) && !z11) {
                q1 q1Var = (q1) list;
                do {
                    b(2);
                    q1Var.a(this.f30942a.e());
                    if (this.f30942a.c()) {
                        return;
                    } else {
                        iT2 = this.f30942a.t();
                    }
                } while (iT2 == this.f30943b);
                this.f30945d = iT2;
                return;
            }
            do {
                if (z11) {
                    b(2);
                    strR = this.f30942a.s();
                } else {
                    b(2);
                    strR = this.f30942a.r();
                }
                list.add(strR);
                if (this.f30942a.c()) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == this.f30943b);
            this.f30945d = iT;
            return;
        }
        int i5 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void a(List list, t2 t2Var, h0 h0Var) throws m1 {
        int iT;
        int i5 = this.f30943b;
        if ((i5 & 7) == 3) {
            do {
                list.add(c(t2Var, h0Var));
                if (this.f30942a.c() || this.f30945d != 0) {
                    return;
                } else {
                    iT = this.f30942a.t();
                }
            } while (iT == i5);
            this.f30945d = iT;
            return;
        }
        int i11 = n1.f30859a;
        throw new m1();
    }

    public final void a(int i5) throws n1 {
        if (this.f30942a.b() != i5) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }
}
