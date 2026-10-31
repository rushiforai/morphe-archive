package q1;

import ads_mobile_sdk.cu0;
import ads_mobile_sdk.ft3;
import ads_mobile_sdk.hn2;
import ads_mobile_sdk.jb1;
import ads_mobile_sdk.nl0;
import ads_mobile_sdk.rb1;
import ads_mobile_sdk.wm1;
import ads_mobile_sdk.xi1;
import ads_mobile_sdk.yi1;
import androidx.compose.ui.node.LayoutNode;
import b.b3;
import b.c9;
import b.e9;
import b.o5;
import b.u8;
import b.x8;

/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public int f83399a;

    /* renamed from: b, reason: collision with root package name */
    public int f83400b;

    /* renamed from: c, reason: collision with root package name */
    public int f83401c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f83402d;

    public l0(com.google.crypto.tink.shaded.protobuf.k kVar) {
        this.f83401c = 0;
        byte[] bArr = rb1.f9048a;
        this.f83402d = kVar;
        kVar.f34623c = this;
    }

    public int a() {
        int i5 = this.f83401c;
        if (i5 != 0) {
            this.f83399a = i5;
            this.f83401c = 0;
        } else {
            this.f83399a = ((com.google.crypto.tink.shaded.protobuf.k) this.f83402d).t();
        }
        int i11 = this.f83399a;
        return (i11 == 0 || i11 == this.f83400b) ? LayoutNode.NotPlacedPlaceOrder : i11 >>> 3;
    }

    public void b(ads_mobile_sdk.g gVar, x8 x8Var, nl0 nl0Var) throws yi1 {
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        int iM = kVar.m();
        if (kVar.f34621a + kVar.f34622b >= 100) {
            throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iD = kVar.d(iM);
        kVar.f34621a++;
        x8Var.a(gVar, this, nl0Var);
        kVar.a(0);
        kVar.f34621a--;
        if (kVar.a() != 0) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        kVar.c(iD);
    }

    public void c(e9 e9Var) throws yi1 {
        int iT;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (e9Var instanceof b3) {
            c9.r(e9Var);
            int i5 = this.f83399a & 7;
            if (i5 == 1) {
                kVar.f();
                throw null;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            d(kVar.u());
            kVar.f();
            throw null;
        }
        int i12 = this.f83399a & 7;
        if (i12 == 1) {
            do {
                e9Var.add(Double.valueOf(kVar.f()));
                if (kVar.c()) {
                    return;
                } else {
                    iT = kVar.t();
                }
            } while (iT == this.f83399a);
            this.f83401c = iT;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iU = kVar.u();
        d(iU);
        int iB = kVar.b() + iU;
        do {
            e9Var.add(Double.valueOf(kVar.f()));
        } while (kVar.b() < iB);
    }

    public void d(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof jb1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Integer.valueOf(kVar.g()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Integer.valueOf(kVar.g()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        jb1 jb1Var = (jb1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                jb1Var.b(kVar.g());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            jb1Var.b(kVar.g());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public void e(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof jb1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 2) {
                int iU = kVar.u();
                c(iU);
                int iB = kVar.b() + iU;
                do {
                    e9Var.add(Integer.valueOf(kVar.h()));
                } while (kVar.b() < iB);
                return;
            }
            if (i5 != 5) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            do {
                e9Var.add(Integer.valueOf(kVar.h()));
                if (kVar.c()) {
                    return;
                } else {
                    iT = kVar.t();
                }
            } while (iT == this.f83399a);
            this.f83401c = iT;
            return;
        }
        jb1 jb1Var = (jb1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 2) {
            int iU2 = kVar.u();
            c(iU2);
            int iB2 = kVar.b() + iU2;
            do {
                jb1Var.b(kVar.h());
            } while (kVar.b() < iB2);
            return;
        }
        if (i12 != 5) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        do {
            jb1Var.b(kVar.h());
            if (kVar.c()) {
                return;
            } else {
                iT2 = kVar.t();
            }
        } while (iT2 == this.f83399a);
        this.f83401c = iT2;
    }

    public void f(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof wm1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 1) {
                do {
                    e9Var.add(Long.valueOf(kVar.i()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iU = kVar.u();
            d(iU);
            int iB = kVar.b() + iU;
            do {
                e9Var.add(Long.valueOf(kVar.i()));
            } while (kVar.b() < iB);
            return;
        }
        wm1 wm1Var = (wm1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 1) {
            do {
                wm1Var.a(kVar.i());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iU2 = kVar.u();
        d(iU2);
        int iB2 = kVar.b() + iU2;
        do {
            wm1Var.a(kVar.i());
        } while (kVar.b() < iB2);
    }

    public void g(e9 e9Var) throws yi1 {
        int iT;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (e9Var instanceof u8) {
            c9.r(e9Var);
            int i5 = this.f83399a & 7;
            if (i5 == 2) {
                c(kVar.u());
                kVar.j();
                throw null;
            }
            if (i5 == 5) {
                kVar.j();
                throw null;
            }
            int i11 = yi1.f12028b;
            throw new xi1();
        }
        int i12 = this.f83399a & 7;
        if (i12 == 2) {
            int iU = kVar.u();
            c(iU);
            int iB = kVar.b() + iU;
            do {
                e9Var.add(Float.valueOf(kVar.j()));
            } while (kVar.b() < iB);
            return;
        }
        if (i12 != 5) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        do {
            e9Var.add(Float.valueOf(kVar.j()));
            if (kVar.c()) {
                return;
            } else {
                iT = kVar.t();
            }
        } while (iT == this.f83399a);
        this.f83401c = iT;
    }

    public void h(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof jb1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Integer.valueOf(kVar.k()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Integer.valueOf(kVar.k()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        jb1 jb1Var = (jb1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                jb1Var.b(kVar.k());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            jb1Var.b(kVar.k());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public void i(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof wm1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Long.valueOf(kVar.l()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Long.valueOf(kVar.l()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        wm1 wm1Var = (wm1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                wm1Var.a(kVar.l());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            wm1Var.a(kVar.l());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public void j(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof jb1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 2) {
                int iU = kVar.u();
                c(iU);
                int iB = kVar.b() + iU;
                do {
                    e9Var.add(Integer.valueOf(kVar.n()));
                } while (kVar.b() < iB);
                return;
            }
            if (i5 != 5) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            do {
                e9Var.add(Integer.valueOf(kVar.n()));
                if (kVar.c()) {
                    return;
                } else {
                    iT = kVar.t();
                }
            } while (iT == this.f83399a);
            this.f83401c = iT;
            return;
        }
        jb1 jb1Var = (jb1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 2) {
            int iU2 = kVar.u();
            c(iU2);
            int iB2 = kVar.b() + iU2;
            do {
                jb1Var.b(kVar.n());
            } while (kVar.b() < iB2);
            return;
        }
        if (i12 != 5) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        do {
            jb1Var.b(kVar.n());
            if (kVar.c()) {
                return;
            } else {
                iT2 = kVar.t();
            }
        } while (iT2 == this.f83399a);
        this.f83401c = iT2;
    }

    public void k(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof wm1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 1) {
                do {
                    e9Var.add(Long.valueOf(kVar.o()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iU = kVar.u();
            d(iU);
            int iB = kVar.b() + iU;
            do {
                e9Var.add(Long.valueOf(kVar.o()));
            } while (kVar.b() < iB);
            return;
        }
        wm1 wm1Var = (wm1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 1) {
            do {
                wm1Var.a(kVar.o());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iU2 = kVar.u();
        d(iU2);
        int iB2 = kVar.b() + iU2;
        do {
            wm1Var.a(kVar.o());
        } while (kVar.b() < iB2);
    }

    public void l(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof jb1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Integer.valueOf(kVar.p()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Integer.valueOf(kVar.p()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        jb1 jb1Var = (jb1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                jb1Var.b(kVar.p());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            jb1Var.b(kVar.p());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public void m(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof wm1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Long.valueOf(kVar.q()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Long.valueOf(kVar.q()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        wm1 wm1Var = (wm1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                wm1Var.a(kVar.q());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            wm1Var.a(kVar.q());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public void n(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof jb1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Integer.valueOf(kVar.u()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Integer.valueOf(kVar.u()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        jb1 jb1Var = (jb1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                jb1Var.b(kVar.u());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            jb1Var.b(kVar.u());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public void o(e9 e9Var) throws yi1 {
        int iT;
        int iT2;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (!(e9Var instanceof wm1)) {
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                do {
                    e9Var.add(Long.valueOf(kVar.v()));
                    if (kVar.c()) {
                        return;
                    } else {
                        iT = kVar.t();
                    }
                } while (iT == this.f83399a);
                this.f83401c = iT;
                return;
            }
            if (i5 != 2) {
                int i11 = yi1.f12028b;
                throw new xi1();
            }
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Long.valueOf(kVar.v()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        wm1 wm1Var = (wm1) e9Var;
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                wm1Var.a(kVar.v());
                if (kVar.c()) {
                    return;
                } else {
                    iT2 = kVar.t();
                }
            } while (iT2 == this.f83399a);
            this.f83401c = iT2;
            return;
        }
        if (i12 != 2) {
            int i13 = yi1.f12028b;
            throw new xi1();
        }
        int iB2 = kVar.b() + kVar.u();
        do {
            wm1Var.a(kVar.v());
        } while (kVar.b() < iB2);
        a(iB2);
    }

    public l0(m0 m0Var) {
        this.f83402d = m0Var;
    }

    public void a(ads_mobile_sdk.g gVar, x8 x8Var, nl0 nl0Var) throws yi1 {
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        int i5 = kVar.f34621a;
        int i11 = kVar.f34622b;
        if (i5 + i11 < 100) {
            int i12 = this.f83400b;
            this.f83400b = ((this.f83399a >>> 3) << 3) | 4;
            kVar.f34622b = i11 + 1;
            try {
                x8Var.a(gVar, this, nl0Var);
                if (this.f83399a == this.f83400b) {
                    return;
                } else {
                    throw new yi1("Failed to parse the message.");
                }
            } finally {
                kVar.f34622b--;
                this.f83400b = i12;
            }
        }
        throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
    }

    public void b(e9 e9Var) throws xi1 {
        int iT;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if ((this.f83399a & 7) == 2) {
            do {
                b(2);
                e9Var.add(kVar.e());
                if (kVar.c()) {
                    return;
                } else {
                    iT = kVar.t();
                }
            } while (iT == this.f83399a);
            this.f83401c = iT;
            return;
        }
        int i5 = yi1.f12028b;
        throw new xi1();
    }

    public void a(e9 e9Var) throws yi1 {
        int iT;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if (e9Var instanceof o5) {
            c9.r(e9Var);
            int i5 = this.f83399a & 7;
            if (i5 == 0) {
                kVar.d();
                throw null;
            }
            if (i5 == 2) {
                kVar.u();
                kVar.d();
                throw null;
            }
            int i11 = yi1.f12028b;
            throw new xi1();
        }
        int i12 = this.f83399a & 7;
        if (i12 == 0) {
            do {
                e9Var.add(Boolean.valueOf(kVar.d()));
                if (kVar.c()) {
                    return;
                } else {
                    iT = kVar.t();
                }
            } while (iT == this.f83399a);
            this.f83401c = iT;
            return;
        }
        if (i12 == 2) {
            int iB = kVar.b() + kVar.u();
            do {
                e9Var.add(Boolean.valueOf(kVar.d()));
            } while (kVar.b() < iB);
            a(iB);
            return;
        }
        int i13 = yi1.f12028b;
        throw new xi1();
    }

    public static void c(int i5) throws yi1 {
        if ((i5 & 3) != 0) {
            throw new yi1("Failed to parse the message.");
        }
    }

    public void b(int i5) {
        if ((this.f83399a & 7) == i5) {
            return;
        }
        int i11 = yi1.f12028b;
        throw new xi1();
    }

    public static void d(int i5) throws yi1 {
        if ((i5 & 7) != 0) {
            throw new yi1("Failed to parse the message.");
        }
    }

    public int h(int i5) {
        return ((m0) this.f83402d).f83406d[this.f83400b + i5];
    }

    public Object i(int i5) {
        return ((m0) this.f83402d).f83408f[this.f83401c + i5];
    }

    public Object a(ft3 ft3Var, Class cls, nl0 nl0Var) throws yi1 {
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        switch (ft3Var.ordinal()) {
            case 0:
                b(1);
                return Double.valueOf(kVar.f());
            case 1:
                b(5);
                return Float.valueOf(kVar.j());
            case 2:
                b(0);
                return Long.valueOf(kVar.l());
            case 3:
                b(0);
                return Long.valueOf(kVar.v());
            case 4:
                b(0);
                return Integer.valueOf(kVar.k());
            case 5:
                b(1);
                return Long.valueOf(kVar.i());
            case 6:
                b(5);
                return Integer.valueOf(kVar.h());
            case 7:
                b(0);
                return Boolean.valueOf(kVar.d());
            case 8:
                b(2);
                return kVar.s();
            case 9:
            default:
                throw new IllegalArgumentException("unsupported field type.");
            case 10:
                b(2);
                x8 x8VarA = hn2.f4463c.a(cls);
                cu0 cu0VarA = x8VarA.a();
                b(cu0VarA, x8VarA, nl0Var);
                x8VarA.c(cu0VarA);
                return cu0VarA;
            case 11:
                b(2);
                return kVar.e();
            case 12:
                b(0);
                return Integer.valueOf(kVar.u());
            case 13:
                b(0);
                return Integer.valueOf(kVar.g());
            case 14:
                b(5);
                return Integer.valueOf(kVar.n());
            case 15:
                b(1);
                return Long.valueOf(kVar.o());
            case 16:
                b(0);
                return Integer.valueOf(kVar.p());
            case 17:
                b(0);
                return Long.valueOf(kVar.q());
        }
    }

    public void a(e9 e9Var, boolean z11) throws xi1 {
        String strR;
        int iT;
        com.google.crypto.tink.shaded.protobuf.k kVar = (com.google.crypto.tink.shaded.protobuf.k) this.f83402d;
        if ((this.f83399a & 7) == 2) {
            do {
                if (z11) {
                    b(2);
                    strR = kVar.s();
                } else {
                    b(2);
                    strR = kVar.r();
                }
                e9Var.add(strR);
                if (kVar.c()) {
                    return;
                } else {
                    iT = kVar.t();
                }
            } while (iT == this.f83399a);
            this.f83401c = iT;
            return;
        }
        int i5 = yi1.f12028b;
        throw new xi1();
    }

    public void a(int i5) throws yi1 {
        if (((com.google.crypto.tink.shaded.protobuf.k) this.f83402d).b() != i5) {
            throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }
}
