package androidx.datastore.preferences.protobuf;

import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import defpackage.ay0;
import defpackage.crb;
import defpackage.d21;
import defpackage.l6f;
import defpackage.r74;
import defpackage.u56;
import defpackage.u7a;
import defpackage.up1;
import defpackage.w7a;
import defpackage.wp1;
import defpackage.x56;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d {
    public final up1 a;
    public int b;
    public int c;
    public int d = 0;

    public d(up1 up1Var) {
        Charset charset = x56.a;
        this.a = up1Var;
        up1Var.c = this;
    }

    public final int a() {
        int iY = this.d;
        if (iY != 0) {
            this.b = iY;
            this.d = 0;
        } else {
            iY = this.a.y();
            this.b = iY;
        }
        if (iY == 0 || iY == this.c) {
            return Integer.MAX_VALUE;
        }
        return iY >>> 3;
    }

    public final void b(Object obj, crb crbVar, r74 r74Var) {
        int i = this.c;
        this.c = ((this.b >>> 3) << 3) | 4;
        try {
            crbVar.e(obj, this, r74Var);
            if (this.b == this.c) {
            } else {
                throw new InvalidProtocolBufferException("Failed to parse the message.");
            }
        } finally {
            this.c = i;
        }
    }

    public final void c(Object obj, crb crbVar, r74 r74Var) throws InvalidProtocolBufferException {
        up1 up1Var = this.a;
        int iZ = up1Var.z();
        if (up1Var.b >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i = up1Var.i(iZ);
        up1Var.b++;
        crbVar.e(obj, this, r74Var);
        up1Var.a(0);
        up1Var.b--;
        up1Var.h(i);
    }

    public final void d(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Boolean.valueOf(up1Var.j()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Boolean.valueOf(up1Var.j()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final d21 e() throws InvalidProtocolBufferException.InvalidWireTypeException {
        w(2);
        return this.a.k();
    }

    public final void f(u56 u56Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iY;
        if ((this.b & 7) != 2) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            ((w7a) u56Var).add(e());
            up1 up1Var = this.a;
            if (up1Var.c()) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == this.b);
        this.d = iY;
    }

    public final void g(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 1) {
            do {
                ((w7a) u56Var).add(Double.valueOf(up1Var.l()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iZ = up1Var.z();
        if ((iZ & 7) != 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
        int iB = up1Var.b() + iZ;
        do {
            ((w7a) u56Var).add(Double.valueOf(up1Var.l()));
        } while (up1Var.b() < iB);
    }

    public final void h(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Integer.valueOf(up1Var.m()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Integer.valueOf(up1Var.m()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final Object i(l6f l6fVar, Class cls, r74 r74Var) throws InvalidProtocolBufferException {
        int i = wp1.a[l6fVar.ordinal()];
        up1 up1Var = this.a;
        switch (i) {
            case 1:
                w(0);
                return Boolean.valueOf(up1Var.j());
            case 2:
                return e();
            case 3:
                w(1);
                return Double.valueOf(up1Var.l());
            case 4:
                w(0);
                return Integer.valueOf(up1Var.m());
            case 5:
                w(5);
                return Integer.valueOf(up1Var.n());
            case 6:
                w(1);
                return Long.valueOf(up1Var.o());
            case 7:
                w(5);
                return Float.valueOf(up1Var.p());
            case 8:
                w(0);
                return Integer.valueOf(up1Var.q());
            case 9:
                w(0);
                return Long.valueOf(up1Var.r());
            case 10:
                w(2);
                crb crbVarA = u7a.c.a(cls);
                e eVarD = crbVarA.d();
                c(eVarD, crbVarA, r74Var);
                crbVarA.b(eVarD);
                return eVarD;
            case 11:
                w(5);
                return Integer.valueOf(up1Var.s());
            case 12:
                w(1);
                return Long.valueOf(up1Var.t());
            case 13:
                w(0);
                return Integer.valueOf(up1Var.u());
            case 14:
                w(0);
                return Long.valueOf(up1Var.v());
            case 15:
                w(2);
                return up1Var.x();
            case 16:
                w(0);
                return Integer.valueOf(up1Var.z());
            case 17:
                w(0);
                return Long.valueOf(up1Var.A());
            default:
                ay0.e("unsupported field type.");
                return null;
        }
    }

    public final void j(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 2) {
            int iZ = up1Var.z();
            if ((iZ & 3) != 0) {
                throw new InvalidProtocolBufferException("Failed to parse the message.");
            }
            int iB = up1Var.b() + iZ;
            do {
                ((w7a) u56Var).add(Integer.valueOf(up1Var.n()));
            } while (up1Var.b() < iB);
            return;
        }
        if (i != 5) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            ((w7a) u56Var).add(Integer.valueOf(up1Var.n()));
            if (up1Var.c()) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == this.b);
        this.d = iY;
    }

    public final void k(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 1) {
            do {
                ((w7a) u56Var).add(Long.valueOf(up1Var.o()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iZ = up1Var.z();
        if ((iZ & 7) != 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
        int iB = up1Var.b() + iZ;
        do {
            ((w7a) u56Var).add(Long.valueOf(up1Var.o()));
        } while (up1Var.b() < iB);
    }

    public final void l(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 2) {
            int iZ = up1Var.z();
            if ((iZ & 3) != 0) {
                throw new InvalidProtocolBufferException("Failed to parse the message.");
            }
            int iB = up1Var.b() + iZ;
            do {
                ((w7a) u56Var).add(Float.valueOf(up1Var.p()));
            } while (up1Var.b() < iB);
            return;
        }
        if (i != 5) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            ((w7a) u56Var).add(Float.valueOf(up1Var.p()));
            if (up1Var.c()) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == this.b);
        this.d = iY;
    }

    public final void m(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Integer.valueOf(up1Var.q()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Integer.valueOf(up1Var.q()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final void n(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Long.valueOf(up1Var.r()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Long.valueOf(up1Var.r()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final void o(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 2) {
            int iZ = up1Var.z();
            if ((iZ & 3) != 0) {
                throw new InvalidProtocolBufferException("Failed to parse the message.");
            }
            int iB = up1Var.b() + iZ;
            do {
                ((w7a) u56Var).add(Integer.valueOf(up1Var.s()));
            } while (up1Var.b() < iB);
            return;
        }
        if (i != 5) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            ((w7a) u56Var).add(Integer.valueOf(up1Var.s()));
            if (up1Var.c()) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == this.b);
        this.d = iY;
    }

    public final void p(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 1) {
            do {
                ((w7a) u56Var).add(Long.valueOf(up1Var.t()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iZ = up1Var.z();
        if ((iZ & 7) != 0) {
            throw new InvalidProtocolBufferException("Failed to parse the message.");
        }
        int iB = up1Var.b() + iZ;
        do {
            ((w7a) u56Var).add(Long.valueOf(up1Var.t()));
        } while (up1Var.b() < iB);
    }

    public final void q(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Integer.valueOf(up1Var.u()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Integer.valueOf(up1Var.u()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final void r(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Long.valueOf(up1Var.v()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Long.valueOf(up1Var.v()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final void s(u56 u56Var, boolean z) throws InvalidProtocolBufferException.InvalidWireTypeException {
        String strW;
        int iY;
        if ((this.b & 7) != 2) {
            throw InvalidProtocolBufferException.b();
        }
        do {
            up1 up1Var = this.a;
            if (z) {
                w(2);
                strW = up1Var.x();
            } else {
                w(2);
                strW = up1Var.w();
            }
            ((w7a) u56Var).add(strW);
            if (up1Var.c()) {
                return;
            } else {
                iY = up1Var.y();
            }
        } while (iY == this.b);
        this.d = iY;
    }

    public final void t(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Integer.valueOf(up1Var.z()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Integer.valueOf(up1Var.z()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final void u(u56 u56Var) throws InvalidProtocolBufferException {
        int iY;
        int i = this.b & 7;
        up1 up1Var = this.a;
        if (i == 0) {
            do {
                ((w7a) u56Var).add(Long.valueOf(up1Var.A()));
                if (up1Var.c()) {
                    return;
                } else {
                    iY = up1Var.y();
                }
            } while (iY == this.b);
            this.d = iY;
            return;
        }
        if (i != 2) {
            throw InvalidProtocolBufferException.b();
        }
        int iB = up1Var.b() + up1Var.z();
        do {
            ((w7a) u56Var).add(Long.valueOf(up1Var.A()));
        } while (up1Var.b() < iB);
        v(iB);
    }

    public final void v(int i) throws InvalidProtocolBufferException {
        if (this.a.b() != i) {
            throw InvalidProtocolBufferException.e();
        }
    }

    public final void w(int i) throws InvalidProtocolBufferException.InvalidWireTypeException {
        if ((this.b & 7) != i) {
            throw InvalidProtocolBufferException.b();
        }
    }

    public final boolean x() {
        int i;
        up1 up1Var = this.a;
        if (up1Var.c() || (i = this.b) == this.c) {
            return false;
        }
        return up1Var.B(i);
    }
}
