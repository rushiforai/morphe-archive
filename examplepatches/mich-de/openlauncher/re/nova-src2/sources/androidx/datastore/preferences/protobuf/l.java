package androidx.datastore.preferences.protobuf;

import androidx.compose.ui.node.LayoutNode;
import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final a5.l1 f14347a;

    /* renamed from: b, reason: collision with root package name */
    public int f14348b;

    /* renamed from: c, reason: collision with root package name */
    public int f14349c;

    /* renamed from: d, reason: collision with root package name */
    public int f14350d = 0;

    public l(a5.l1 l1Var) {
        Charset charset = b0.f14278a;
        this.f14347a = l1Var;
        l1Var.f317b = this;
    }

    public static void y(int i5) throws InvalidProtocolBufferException {
        if ((i5 & 3) != 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
    }

    public static void z(int i5) throws InvalidProtocolBufferException {
        if ((i5 & 7) != 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
    }

    public final int a() {
        int i5 = this.f14350d;
        if (i5 != 0) {
            this.f14348b = i5;
            this.f14350d = 0;
        } else {
            this.f14348b = this.f14347a.z();
        }
        int i11 = this.f14348b;
        return (i11 == 0 || i11 == this.f14349c) ? LayoutNode.NotPlacedPlaceOrder : i11 >>> 3;
    }

    public final void b(Object obj, z0 z0Var, p pVar) {
        int i5 = this.f14349c;
        this.f14349c = ((this.f14348b >>> 3) << 3) | 4;
        try {
            z0Var.f(obj, this, pVar);
            if (this.f14348b == this.f14349c) {
            } else {
                throw new InvalidProtocolBufferException("Failed to parse the message.");
            }
        } finally {
            this.f14349c = i5;
        }
    }

    public final void c(Object obj, z0 z0Var, p pVar) throws InvalidProtocolBufferException {
        a5.l1 l1Var = this.f14347a;
        int iA = l1Var.A();
        if (l1Var.f316a >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i5 = l1Var.i(iA);
        l1Var.f316a++;
        z0Var.f(obj, this, pVar);
        l1Var.a(0);
        l1Var.f316a--;
        l1Var.h(i5);
    }

    public final void d(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Boolean.valueOf(l1Var.j()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Boolean.valueOf(l1Var.j()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final h e() throws InvalidProtocolBufferException.InvalidWireTypeException {
        w(2);
        return this.f14347a.k();
    }

    public final void f(a0 a0Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iZ;
        if ((this.f14348b & 7) != 2) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            a0Var.add(e());
            a5.l1 l1Var = this.f14347a;
            if (l1Var.c()) {
                return;
            } else {
                iZ = l1Var.z();
            }
        } while (iZ == this.f14348b);
        this.f14350d = iZ;
    }

    public final void g(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 1) {
            do {
                a0Var.add(Double.valueOf(l1Var.l()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iA = l1Var.A();
        z(iA);
        int iB = l1Var.b() + iA;
        do {
            a0Var.add(Double.valueOf(l1Var.l()));
        } while (l1Var.b() < iB);
    }

    public final void h(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Integer.valueOf(l1Var.m()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Integer.valueOf(l1Var.m()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final Object i(v1 v1Var, Class cls, p pVar) throws InvalidProtocolBufferException {
        int iOrdinal = v1Var.ordinal();
        a5.l1 l1Var = this.f14347a;
        switch (iOrdinal) {
            case 0:
                w(1);
                return Double.valueOf(l1Var.l());
            case 1:
                w(5);
                return Float.valueOf(l1Var.p());
            case 2:
                w(0);
                return Long.valueOf(l1Var.r());
            case 3:
                w(0);
                return Long.valueOf(l1Var.B());
            case 4:
                w(0);
                return Integer.valueOf(l1Var.q());
            case 5:
                w(1);
                return Long.valueOf(l1Var.o());
            case 6:
                w(5);
                return Integer.valueOf(l1Var.n());
            case 7:
                w(0);
                return Boolean.valueOf(l1Var.j());
            case 8:
                w(2);
                return l1Var.y();
            case 9:
            default:
                throw new IllegalArgumentException("unsupported field type.");
            case 10:
                w(2);
                z0 z0VarA = w0.f14415c.a(cls);
                y yVarD = z0VarA.d();
                c(yVarD, z0VarA, pVar);
                z0VarA.b(yVarD);
                return yVarD;
            case 11:
                return e();
            case 12:
                w(0);
                return Integer.valueOf(l1Var.A());
            case 13:
                w(0);
                return Integer.valueOf(l1Var.m());
            case 14:
                w(5);
                return Integer.valueOf(l1Var.s());
            case 15:
                w(1);
                return Long.valueOf(l1Var.t());
            case 16:
                w(0);
                return Integer.valueOf(l1Var.v());
            case 17:
                w(0);
                return Long.valueOf(l1Var.w());
        }
    }

    public final void j(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 2) {
            int iA = l1Var.A();
            y(iA);
            int iB = l1Var.b() + iA;
            do {
                a0Var.add(Integer.valueOf(l1Var.n()));
            } while (l1Var.b() < iB);
            return;
        }
        if (i5 != 5) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            a0Var.add(Integer.valueOf(l1Var.n()));
            if (l1Var.c()) {
                return;
            } else {
                iZ = l1Var.z();
            }
        } while (iZ == this.f14348b);
        this.f14350d = iZ;
    }

    public final void k(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 1) {
            do {
                a0Var.add(Long.valueOf(l1Var.o()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iA = l1Var.A();
        z(iA);
        int iB = l1Var.b() + iA;
        do {
            a0Var.add(Long.valueOf(l1Var.o()));
        } while (l1Var.b() < iB);
    }

    public final void l(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 2) {
            int iA = l1Var.A();
            y(iA);
            int iB = l1Var.b() + iA;
            do {
                a0Var.add(Float.valueOf(l1Var.p()));
            } while (l1Var.b() < iB);
            return;
        }
        if (i5 != 5) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            a0Var.add(Float.valueOf(l1Var.p()));
            if (l1Var.c()) {
                return;
            } else {
                iZ = l1Var.z();
            }
        } while (iZ == this.f14348b);
        this.f14350d = iZ;
    }

    public final void m(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Integer.valueOf(l1Var.q()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Integer.valueOf(l1Var.q()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final void n(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Long.valueOf(l1Var.r()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Long.valueOf(l1Var.r()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final void o(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 2) {
            int iA = l1Var.A();
            y(iA);
            int iB = l1Var.b() + iA;
            do {
                a0Var.add(Integer.valueOf(l1Var.s()));
            } while (l1Var.b() < iB);
            return;
        }
        if (i5 != 5) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            a0Var.add(Integer.valueOf(l1Var.s()));
            if (l1Var.c()) {
                return;
            } else {
                iZ = l1Var.z();
            }
        } while (iZ == this.f14348b);
        this.f14350d = iZ;
    }

    public final void p(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 1) {
            do {
                a0Var.add(Long.valueOf(l1Var.t()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iA = l1Var.A();
        z(iA);
        int iB = l1Var.b() + iA;
        do {
            a0Var.add(Long.valueOf(l1Var.t()));
        } while (l1Var.b() < iB);
    }

    public final void q(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Integer.valueOf(l1Var.v()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Integer.valueOf(l1Var.v()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final void r(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Long.valueOf(l1Var.w()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Long.valueOf(l1Var.w()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final void s(a0 a0Var, boolean z11) throws InvalidProtocolBufferException.InvalidWireTypeException {
        String strX;
        int iZ;
        if ((this.f14348b & 7) != 2) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            a5.l1 l1Var = this.f14347a;
            if (z11) {
                w(2);
                strX = l1Var.y();
            } else {
                w(2);
                strX = l1Var.x();
            }
            a0Var.add(strX);
            if (l1Var.c()) {
                return;
            } else {
                iZ = l1Var.z();
            }
        } while (iZ == this.f14348b);
        this.f14350d = iZ;
    }

    public final void t(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Integer.valueOf(l1Var.A()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Integer.valueOf(l1Var.A()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final void u(a0 a0Var) throws InvalidProtocolBufferException {
        int iZ;
        int i5 = this.f14348b & 7;
        a5.l1 l1Var = this.f14347a;
        if (i5 == 0) {
            do {
                a0Var.add(Long.valueOf(l1Var.B()));
                if (l1Var.c()) {
                    return;
                } else {
                    iZ = l1Var.z();
                }
            } while (iZ == this.f14348b);
            this.f14350d = iZ;
            return;
        }
        if (i5 != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = l1Var.b() + l1Var.A();
        do {
            a0Var.add(Long.valueOf(l1Var.B()));
        } while (l1Var.b() < iB);
        v(iB);
    }

    public final void v(int i5) throws InvalidProtocolBufferException {
        if (this.f14347a.b() != i5) {
            throw InvalidProtocolBufferException.e();
        }
    }

    public final void w(int i5) throws InvalidProtocolBufferException.InvalidWireTypeException {
        if ((this.f14348b & 7) != i5) {
            throw InvalidProtocolBufferException.b();
        }
    }

    public final boolean x() {
        int i5;
        a5.l1 l1Var = this.f14347a;
        if (l1Var.c() || (i5 = this.f14348b) == this.f14349c) {
            return false;
        }
        return l1Var.C(i5);
    }
}
