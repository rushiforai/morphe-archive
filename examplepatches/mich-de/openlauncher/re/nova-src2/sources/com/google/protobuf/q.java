package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import com.google.protobuf.InvalidProtocolBufferException;
import java.util.List;

/* loaded from: classes3.dex */
public final class q implements a2 {

    /* renamed from: a, reason: collision with root package name */
    public final p f34939a;

    /* renamed from: b, reason: collision with root package name */
    public int f34940b;

    /* renamed from: c, reason: collision with root package name */
    public int f34941c;

    /* renamed from: d, reason: collision with root package name */
    public int f34942d = 0;

    public q(p pVar) {
        a1.a(pVar, "input");
        this.f34939a = pVar;
        pVar.f34938b = this;
    }

    public static void Z(int i5) throws InvalidProtocolBufferException {
        if ((i5 & 3) != 0) {
            throw InvalidProtocolBufferException.f();
        }
    }

    public static q a(p pVar) {
        q qVar = pVar.f34938b;
        return qVar != null ? qVar : new q(pVar);
    }

    public static void a0(int i5) throws InvalidProtocolBufferException {
        if ((i5 & 7) != 0) {
            throw InvalidProtocolBufferException.f();
        }
    }

    public final long A() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.u();
    }

    public final void B(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof f1;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Long.valueOf(pVar.u()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Long.valueOf(pVar.u()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        f1 f1Var = (f1) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                f1Var.d(pVar.u());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            f1Var.d(pVar.u());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0060, code lost:
    
        r10.put(r4, r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0063, code lost:
    
        r1.j(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0066, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void C(j1 j1Var, mg.l lVar, y yVar) throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(2);
        p pVar = this.f34939a;
        int iK = pVar.k(pVar.F());
        lVar.getClass();
        Object obj = lVar.f76311d;
        Object objP = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        Object objP2 = obj;
        while (true) {
            try {
                int iB = b();
                if (iB == Integer.MAX_VALUE || pVar.g()) {
                    break;
                }
                if (iB == 1) {
                    objP = p((t2) lVar.f76309b, null, null);
                } else if (iB != 2) {
                    try {
                        if (!Y()) {
                            throw new InvalidProtocolBufferException("Unable to parse map entry.");
                        }
                    } catch (InvalidProtocolBufferException.InvalidWireTypeException unused) {
                        if (!Y()) {
                            throw new InvalidProtocolBufferException("Unable to parse map entry.");
                        }
                    }
                } else {
                    objP2 = p((t2) lVar.f76310c, obj.getClass(), yVar);
                }
            } catch (Throwable th2) {
                pVar.j(iK);
                throw th2;
            }
        }
    }

    public final Object D(Class cls, y yVar) throws InvalidProtocolBufferException {
        X(2);
        b2 b2VarA = x1.f35001c.a(cls);
        Object objD = b2VarA.d();
        g(objD, b2VarA, yVar);
        b2VarA.b(objD);
        return objD;
    }

    public final void E(z0 z0Var, b2 b2Var, y yVar) throws InvalidProtocolBufferException {
        int iE;
        int i5 = this.f34940b;
        if ((i5 & 7) != 2) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            Object objD = b2Var.d();
            g(objD, b2Var, yVar);
            b2Var.b(objD);
            z0Var.add(objD);
            p pVar = this.f34939a;
            if (pVar.g() || this.f34942d != 0) {
                return;
            } else {
                iE = pVar.E();
            }
        } while (iE == i5);
        this.f34942d = iE;
    }

    public final int F() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(5);
        return this.f34939a.y();
    }

    public final void G(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof o0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 2) {
                int iF = pVar.F();
                Z(iF);
                int iF2 = pVar.f() + iF;
                do {
                    list.add(Integer.valueOf(pVar.y()));
                } while (pVar.f() < iF2);
                return;
            }
            if (i5 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            do {
                list.add(Integer.valueOf(pVar.y()));
                if (pVar.g()) {
                    return;
                } else {
                    iE = pVar.E();
                }
            } while (iE == this.f34940b);
            this.f34942d = iE;
            return;
        }
        o0 o0Var = (o0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 2) {
            int iF3 = pVar.F();
            Z(iF3);
            int iF4 = pVar.f() + iF3;
            do {
                o0Var.d(pVar.y());
            } while (pVar.f() < iF4);
            return;
        }
        if (i11 != 5) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            o0Var.d(pVar.y());
            if (pVar.g()) {
                return;
            } else {
                iE2 = pVar.E();
            }
        } while (iE2 == this.f34940b);
        this.f34942d = iE2;
    }

    public final long H() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(1);
        return this.f34939a.z();
    }

    public final void I(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof f1;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 1) {
                do {
                    list.add(Long.valueOf(pVar.z()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.F();
            a0(iF);
            int iF2 = pVar.f() + iF;
            do {
                list.add(Long.valueOf(pVar.z()));
            } while (pVar.f() < iF2);
            return;
        }
        f1 f1Var = (f1) list;
        int i11 = this.f34940b & 7;
        if (i11 == 1) {
            do {
                f1Var.d(pVar.z());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF3 = pVar.F();
        a0(iF3);
        int iF4 = pVar.f() + iF3;
        do {
            f1Var.d(pVar.z());
        } while (pVar.f() < iF4);
    }

    public final int J() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.A();
    }

    public final void K(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof o0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Integer.valueOf(pVar.A()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Integer.valueOf(pVar.A()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        o0 o0Var = (o0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                o0Var.d(pVar.A());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            o0Var.d(pVar.A());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    public final long L() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.B();
    }

    public final void M(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof f1;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Long.valueOf(pVar.B()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Long.valueOf(pVar.B()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        f1 f1Var = (f1) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                f1Var.d(pVar.B());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            f1Var.d(pVar.B());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    public final String N() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(2);
        return this.f34939a.C();
    }

    public final void O(z0 z0Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        P(z0Var, false);
    }

    public final void P(List list, boolean z11) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iE;
        int iE2;
        if ((this.f34940b & 7) != 2) {
            throw InvalidProtocolBufferException.c();
        }
        boolean z12 = list instanceof c1;
        p pVar = this.f34939a;
        if (!z12 || z11) {
            do {
                list.add(z11 ? R() : N());
                if (pVar.g()) {
                    return;
                } else {
                    iE = pVar.E();
                }
            } while (iE == this.f34940b);
            this.f34942d = iE;
            return;
        }
        c1 c1Var = (c1) list;
        do {
            j();
            c1Var.f0();
            if (pVar.g()) {
                return;
            } else {
                iE2 = pVar.E();
            }
        } while (iE2 == this.f34940b);
        this.f34942d = iE2;
    }

    public final void Q(z0 z0Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        P(z0Var, true);
    }

    public final String R() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(2);
        return this.f34939a.D();
    }

    public final int S() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.F();
    }

    public final void T(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof o0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Integer.valueOf(pVar.F()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Integer.valueOf(pVar.F()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        o0 o0Var = (o0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                o0Var.d(pVar.F());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            o0Var.d(pVar.F());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    public final long U() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.G();
    }

    public final void V(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof f1;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Long.valueOf(pVar.G()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Long.valueOf(pVar.G()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        f1 f1Var = (f1) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                f1Var.d(pVar.G());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            f1Var.d(pVar.G());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    public final void W(int i5) throws InvalidProtocolBufferException {
        if (this.f34939a.f() != i5) {
            throw InvalidProtocolBufferException.g();
        }
    }

    public final void X(int i5) throws InvalidProtocolBufferException.InvalidWireTypeException {
        if ((this.f34940b & 7) != i5) {
            throw InvalidProtocolBufferException.c();
        }
    }

    public final boolean Y() {
        int i5;
        p pVar = this.f34939a;
        if (pVar.g() || (i5 = this.f34940b) == this.f34941c) {
            return false;
        }
        return pVar.H(i5);
    }

    public final int b() {
        int i5 = this.f34942d;
        if (i5 != 0) {
            this.f34940b = i5;
            this.f34942d = 0;
        } else {
            this.f34940b = this.f34939a.E();
        }
        int i11 = this.f34940b;
        return (i11 == 0 || i11 == this.f34941c) ? LayoutNode.NotPlacedPlaceOrder : i11 >>> 3;
    }

    public final int c() {
        return this.f34940b;
    }

    public final void d(Object obj, b2 b2Var, y yVar) throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(3);
        e(obj, b2Var, yVar);
    }

    public final void e(Object obj, b2 b2Var, y yVar) {
        int i5 = this.f34941c;
        this.f34941c = ((this.f34940b >>> 3) << 3) | 4;
        try {
            b2Var.f(obj, this, yVar);
            if (this.f34940b == this.f34941c) {
            } else {
                throw InvalidProtocolBufferException.f();
            }
        } finally {
            this.f34941c = i5;
        }
    }

    public final void f(Object obj, b2 b2Var, y yVar) throws InvalidProtocolBufferException {
        X(2);
        g(obj, b2Var, yVar);
    }

    public final void g(Object obj, b2 b2Var, y yVar) throws InvalidProtocolBufferException {
        p pVar = this.f34939a;
        int iF = pVar.F();
        if (pVar.f34937a >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iK = pVar.k(iF);
        pVar.f34937a++;
        b2Var.f(obj, this, yVar);
        pVar.a(0);
        pVar.f34937a--;
        pVar.j(iK);
    }

    public final boolean h() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.l();
    }

    public final void i(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof h;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Boolean.valueOf(pVar.l()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Boolean.valueOf(pVar.l()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        h hVar = (h) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                hVar.d(pVar.l());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            hVar.d(pVar.l());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    public final l j() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(2);
        return this.f34939a.m();
    }

    public final void k(z0 z0Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iE;
        if ((this.f34940b & 7) != 2) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            z0Var.add(j());
            p pVar = this.f34939a;
            if (pVar.g()) {
                return;
            } else {
                iE = pVar.E();
            }
        } while (iE == this.f34940b);
        this.f34942d = iE;
    }

    public final double l() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(1);
        return this.f34939a.n();
    }

    public final void m(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof u;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 1) {
                do {
                    list.add(Double.valueOf(pVar.n()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.F();
            a0(iF);
            int iF2 = pVar.f() + iF;
            do {
                list.add(Double.valueOf(pVar.n()));
            } while (pVar.f() < iF2);
            return;
        }
        u uVar = (u) list;
        int i11 = this.f34940b & 7;
        if (i11 == 1) {
            do {
                uVar.d(pVar.n());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF3 = pVar.F();
        a0(iF3);
        int iF4 = pVar.f() + iF3;
        do {
            uVar.d(pVar.n());
        } while (pVar.f() < iF4);
    }

    public final int n() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.o();
    }

    public final void o(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof o0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Integer.valueOf(pVar.o()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Integer.valueOf(pVar.o()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        o0 o0Var = (o0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                o0Var.d(pVar.o());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            o0Var.d(pVar.o());
        } while (pVar.f() < iF2);
        W(iF2);
    }

    public final Object p(t2 t2Var, Class cls, y yVar) {
        switch (t2Var.ordinal()) {
            case 0:
                return Double.valueOf(l());
            case 1:
                return Float.valueOf(u());
            case 2:
                return Long.valueOf(A());
            case 3:
                return Long.valueOf(U());
            case 4:
                return Integer.valueOf(y());
            case 5:
                return Long.valueOf(s());
            case 6:
                return Integer.valueOf(q());
            case 7:
                return Boolean.valueOf(h());
            case 8:
                return R();
            case 9:
            default:
                throw new IllegalArgumentException("unsupported field type.");
            case 10:
                return D(cls, yVar);
            case 11:
                return j();
            case 12:
                return Integer.valueOf(S());
            case 13:
                return Integer.valueOf(n());
            case 14:
                return Integer.valueOf(F());
            case 15:
                return Long.valueOf(H());
            case 16:
                return Integer.valueOf(J());
            case 17:
                return Long.valueOf(L());
        }
    }

    public final int q() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(5);
        return this.f34939a.p();
    }

    public final void r(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof o0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 2) {
                int iF = pVar.F();
                Z(iF);
                int iF2 = pVar.f() + iF;
                do {
                    list.add(Integer.valueOf(pVar.p()));
                } while (pVar.f() < iF2);
                return;
            }
            if (i5 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            do {
                list.add(Integer.valueOf(pVar.p()));
                if (pVar.g()) {
                    return;
                } else {
                    iE = pVar.E();
                }
            } while (iE == this.f34940b);
            this.f34942d = iE;
            return;
        }
        o0 o0Var = (o0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 2) {
            int iF3 = pVar.F();
            Z(iF3);
            int iF4 = pVar.f() + iF3;
            do {
                o0Var.d(pVar.p());
            } while (pVar.f() < iF4);
            return;
        }
        if (i11 != 5) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            o0Var.d(pVar.p());
            if (pVar.g()) {
                return;
            } else {
                iE2 = pVar.E();
            }
        } while (iE2 == this.f34940b);
        this.f34942d = iE2;
    }

    public final long s() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(1);
        return this.f34939a.q();
    }

    public final void t(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof f1;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 1) {
                do {
                    list.add(Long.valueOf(pVar.q()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.F();
            a0(iF);
            int iF2 = pVar.f() + iF;
            do {
                list.add(Long.valueOf(pVar.q()));
            } while (pVar.f() < iF2);
            return;
        }
        f1 f1Var = (f1) list;
        int i11 = this.f34940b & 7;
        if (i11 == 1) {
            do {
                f1Var.d(pVar.q());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF3 = pVar.F();
        a0(iF3);
        int iF4 = pVar.f() + iF3;
        do {
            f1Var.d(pVar.q());
        } while (pVar.f() < iF4);
    }

    public final float u() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(5);
        return this.f34939a.r();
    }

    public final void v(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof d0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 2) {
                int iF = pVar.F();
                Z(iF);
                int iF2 = pVar.f() + iF;
                do {
                    list.add(Float.valueOf(pVar.r()));
                } while (pVar.f() < iF2);
                return;
            }
            if (i5 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            do {
                list.add(Float.valueOf(pVar.r()));
                if (pVar.g()) {
                    return;
                } else {
                    iE = pVar.E();
                }
            } while (iE == this.f34940b);
            this.f34942d = iE;
            return;
        }
        d0 d0Var = (d0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 2) {
            int iF3 = pVar.F();
            Z(iF3);
            int iF4 = pVar.f() + iF3;
            do {
                d0Var.d(pVar.r());
            } while (pVar.f() < iF4);
            return;
        }
        if (i11 != 5) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            d0Var.d(pVar.r());
            if (pVar.g()) {
                return;
            } else {
                iE2 = pVar.E();
            }
        } while (iE2 == this.f34940b);
        this.f34942d = iE2;
    }

    public final Object w(Class cls, y yVar) throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(3);
        b2 b2VarA = x1.f35001c.a(cls);
        Object objD = b2VarA.d();
        e(objD, b2VarA, yVar);
        b2VarA.b(objD);
        return objD;
    }

    public final void x(z0 z0Var, b2 b2Var, y yVar) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iE;
        int i5 = this.f34940b;
        if ((i5 & 7) != 3) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            Object objD = b2Var.d();
            e(objD, b2Var, yVar);
            b2Var.b(objD);
            z0Var.add(objD);
            p pVar = this.f34939a;
            if (pVar.g() || this.f34942d != 0) {
                return;
            } else {
                iE = pVar.E();
            }
        } while (iE == i5);
        this.f34942d = iE;
    }

    public final int y() throws InvalidProtocolBufferException.InvalidWireTypeException {
        X(0);
        return this.f34939a.t();
    }

    public final void z(List list) throws InvalidProtocolBufferException {
        int iE;
        int iE2;
        boolean z11 = list instanceof o0;
        p pVar = this.f34939a;
        if (!z11) {
            int i5 = this.f34940b & 7;
            if (i5 == 0) {
                do {
                    list.add(Integer.valueOf(pVar.t()));
                    if (pVar.g()) {
                        return;
                    } else {
                        iE = pVar.E();
                    }
                } while (iE == this.f34940b);
                this.f34942d = iE;
                return;
            }
            if (i5 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iF = pVar.f() + pVar.F();
            do {
                list.add(Integer.valueOf(pVar.t()));
            } while (pVar.f() < iF);
            W(iF);
            return;
        }
        o0 o0Var = (o0) list;
        int i11 = this.f34940b & 7;
        if (i11 == 0) {
            do {
                o0Var.d(pVar.t());
                if (pVar.g()) {
                    return;
                } else {
                    iE2 = pVar.E();
                }
            } while (iE2 == this.f34940b);
            this.f34942d = iE2;
            return;
        }
        if (i11 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iF2 = pVar.f() + pVar.F();
        do {
            o0Var.d(pVar.t());
        } while (pVar.f() < iF2);
        W(iF2);
    }
}
