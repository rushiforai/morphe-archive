package com.google.protobuf;

import com.google.protobuf.InvalidProtocolBufferException;
import defpackage.ay0;
import defpackage.b46;
import defpackage.brb;
import defpackage.f21;
import defpackage.j6f;
import defpackage.jn4;
import defpackage.ka7;
import defpackage.p74;
import defpackage.qt0;
import defpackage.sp1;
import defpackage.t7a;
import defpackage.uw6;
import defpackage.v56;
import defpackage.vi3;
import defpackage.vp1;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d {
    public final sp1 a;
    public int b;
    public int c;
    public int d = 0;

    public d(sp1 sp1Var) {
        v56.a("input", sp1Var);
        this.a = sp1Var;
        sp1Var.b = this;
    }

    public static void y(int i) throws InvalidProtocolBufferException {
        if ((i & 3) != 0) {
            throw InvalidProtocolBufferException.f();
        }
    }

    public static void z(int i) throws InvalidProtocolBufferException {
        if ((i & 7) != 0) {
            throw InvalidProtocolBufferException.f();
        }
    }

    public final int a() {
        int iZ = this.d;
        if (iZ != 0) {
            this.b = iZ;
            this.d = 0;
        } else {
            iZ = this.a.z();
            this.b = iZ;
        }
        if (iZ == 0 || iZ == this.c) {
            return Integer.MAX_VALUE;
        }
        return iZ >>> 3;
    }

    public final void b(Object obj, brb brbVar, p74 p74Var) {
        int i = this.c;
        this.c = ((this.b >>> 3) << 3) | 4;
        try {
            brbVar.e(obj, this, p74Var);
            if (this.b == this.c) {
            } else {
                throw InvalidProtocolBufferException.f();
            }
        } finally {
            this.c = i;
        }
    }

    public final void c(Object obj, brb brbVar, p74 p74Var) throws InvalidProtocolBufferException {
        sp1 sp1Var = this.a;
        int iA = sp1Var.A();
        if (sp1Var.a >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use CodedInputStream.setRecursionLimit() to increase the depth limit.");
        }
        int i = sp1Var.i(iA);
        sp1Var.a++;
        brbVar.e(obj, this, p74Var);
        sp1Var.a(0);
        sp1Var.a--;
        sp1Var.h(i);
    }

    public final void d(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof qt0;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Boolean.valueOf(sp1Var.j()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Boolean.valueOf(sp1Var.j()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        qt0 qt0Var = (qt0) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                qt0Var.e(sp1Var.j());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            qt0Var.e(sp1Var.j());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final f21 e() throws InvalidProtocolBufferException.InvalidWireTypeException {
        w(2);
        return this.a.k();
    }

    public final void f(List list) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iZ;
        if ((this.b & 7) != 2) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            list.add(e());
            sp1 sp1Var = this.a;
            if (sp1Var.e()) {
                return;
            } else {
                iZ = sp1Var.z();
            }
        } while (iZ == this.b);
        this.d = iZ;
    }

    public final void g(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof vi3;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 1) {
                do {
                    list.add(Double.valueOf(sp1Var.l()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iA = sp1Var.A();
            z(iA);
            int iD = sp1Var.d() + iA;
            do {
                list.add(Double.valueOf(sp1Var.l()));
            } while (sp1Var.d() < iD);
            return;
        }
        vi3 vi3Var = (vi3) list;
        int i3 = i & 7;
        if (i3 == 1) {
            do {
                vi3Var.e(sp1Var.l());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iA2 = sp1Var.A();
        z(iA2);
        int iD2 = sp1Var.d() + iA2;
        do {
            vi3Var.e(sp1Var.l());
        } while (sp1Var.d() < iD2);
    }

    public final void h(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof b46;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Integer.valueOf(sp1Var.m()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Integer.valueOf(sp1Var.m()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        b46 b46Var = (b46) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                b46Var.e(sp1Var.m());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            b46Var.e(sp1Var.m());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final Object i(j6f j6fVar, Class cls, p74 p74Var) throws InvalidProtocolBufferException {
        int i = vp1.a[j6fVar.ordinal()];
        sp1 sp1Var = this.a;
        switch (i) {
            case 1:
                w(0);
                return Boolean.valueOf(sp1Var.j());
            case 2:
                return e();
            case 3:
                w(1);
                return Double.valueOf(sp1Var.l());
            case 4:
                w(0);
                return Integer.valueOf(sp1Var.m());
            case 5:
                w(5);
                return Integer.valueOf(sp1Var.n());
            case 6:
                w(1);
                return Long.valueOf(sp1Var.o());
            case 7:
                w(5);
                return Float.valueOf(sp1Var.p());
            case 8:
                w(0);
                return Integer.valueOf(sp1Var.q());
            case 9:
                w(0);
                return Long.valueOf(sp1Var.r());
            case 10:
                w(2);
                brb brbVarA = t7a.c.a(cls);
                Object objD = brbVarA.d();
                c(objD, brbVarA, p74Var);
                brbVarA.b(objD);
                return objD;
            case 11:
                w(5);
                return Integer.valueOf(sp1Var.t());
            case 12:
                w(1);
                return Long.valueOf(sp1Var.u());
            case 13:
                w(0);
                return Integer.valueOf(sp1Var.v());
            case 14:
                w(0);
                return Long.valueOf(sp1Var.w());
            case 15:
                w(2);
                return sp1Var.y();
            case 16:
                w(0);
                return Integer.valueOf(sp1Var.A());
            case 17:
                w(0);
                return Long.valueOf(sp1Var.B());
            default:
                ay0.e("unsupported field type.");
                return null;
        }
    }

    public final void j(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof b46;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 2) {
                int iA = sp1Var.A();
                y(iA);
                int iD = sp1Var.d() + iA;
                do {
                    list.add(Integer.valueOf(sp1Var.n()));
                } while (sp1Var.d() < iD);
                return;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            do {
                list.add(Integer.valueOf(sp1Var.n()));
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ = sp1Var.z();
                }
            } while (iZ == this.b);
            this.d = iZ;
            return;
        }
        b46 b46Var = (b46) list;
        int i3 = i & 7;
        if (i3 == 2) {
            int iA2 = sp1Var.A();
            y(iA2);
            int iD2 = sp1Var.d() + iA2;
            do {
                b46Var.e(sp1Var.n());
            } while (sp1Var.d() < iD2);
            return;
        }
        if (i3 != 5) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            b46Var.e(sp1Var.n());
            if (sp1Var.e()) {
                return;
            } else {
                iZ2 = sp1Var.z();
            }
        } while (iZ2 == this.b);
        this.d = iZ2;
    }

    public final void k(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof ka7;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 1) {
                do {
                    list.add(Long.valueOf(sp1Var.o()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iA = sp1Var.A();
            z(iA);
            int iD = sp1Var.d() + iA;
            do {
                list.add(Long.valueOf(sp1Var.o()));
            } while (sp1Var.d() < iD);
            return;
        }
        ka7 ka7Var = (ka7) list;
        int i3 = i & 7;
        if (i3 == 1) {
            do {
                ka7Var.e(sp1Var.o());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iA2 = sp1Var.A();
        z(iA2);
        int iD2 = sp1Var.d() + iA2;
        do {
            ka7Var.e(sp1Var.o());
        } while (sp1Var.d() < iD2);
    }

    public final void l(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof jn4;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 2) {
                int iA = sp1Var.A();
                y(iA);
                int iD = sp1Var.d() + iA;
                do {
                    list.add(Float.valueOf(sp1Var.p()));
                } while (sp1Var.d() < iD);
                return;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            do {
                list.add(Float.valueOf(sp1Var.p()));
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ = sp1Var.z();
                }
            } while (iZ == this.b);
            this.d = iZ;
            return;
        }
        jn4 jn4Var = (jn4) list;
        int i3 = i & 7;
        if (i3 == 2) {
            int iA2 = sp1Var.A();
            y(iA2);
            int iD2 = sp1Var.d() + iA2;
            do {
                jn4Var.e(sp1Var.p());
            } while (sp1Var.d() < iD2);
            return;
        }
        if (i3 != 5) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            jn4Var.e(sp1Var.p());
            if (sp1Var.e()) {
                return;
            } else {
                iZ2 = sp1Var.z();
            }
        } while (iZ2 == this.b);
        this.d = iZ2;
    }

    public final void m(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof b46;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Integer.valueOf(sp1Var.q()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Integer.valueOf(sp1Var.q()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        b46 b46Var = (b46) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                b46Var.e(sp1Var.q());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            b46Var.e(sp1Var.q());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final void n(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof ka7;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Long.valueOf(sp1Var.r()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Long.valueOf(sp1Var.r()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        ka7 ka7Var = (ka7) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                ka7Var.e(sp1Var.r());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            ka7Var.e(sp1Var.r());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final void o(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof b46;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 2) {
                int iA = sp1Var.A();
                y(iA);
                int iD = sp1Var.d() + iA;
                do {
                    list.add(Integer.valueOf(sp1Var.t()));
                } while (sp1Var.d() < iD);
                return;
            }
            if (i2 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            do {
                list.add(Integer.valueOf(sp1Var.t()));
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ = sp1Var.z();
                }
            } while (iZ == this.b);
            this.d = iZ;
            return;
        }
        b46 b46Var = (b46) list;
        int i3 = i & 7;
        if (i3 == 2) {
            int iA2 = sp1Var.A();
            y(iA2);
            int iD2 = sp1Var.d() + iA2;
            do {
                b46Var.e(sp1Var.t());
            } while (sp1Var.d() < iD2);
            return;
        }
        if (i3 != 5) {
            throw InvalidProtocolBufferException.c();
        }
        do {
            b46Var.e(sp1Var.t());
            if (sp1Var.e()) {
                return;
            } else {
                iZ2 = sp1Var.z();
            }
        } while (iZ2 == this.b);
        this.d = iZ2;
    }

    public final void p(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof ka7;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 1) {
                do {
                    list.add(Long.valueOf(sp1Var.u()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iA = sp1Var.A();
            z(iA);
            int iD = sp1Var.d() + iA;
            do {
                list.add(Long.valueOf(sp1Var.u()));
            } while (sp1Var.d() < iD);
            return;
        }
        ka7 ka7Var = (ka7) list;
        int i3 = i & 7;
        if (i3 == 1) {
            do {
                ka7Var.e(sp1Var.u());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iA2 = sp1Var.A();
        z(iA2);
        int iD2 = sp1Var.d() + iA2;
        do {
            ka7Var.e(sp1Var.u());
        } while (sp1Var.d() < iD2);
    }

    public final void q(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof b46;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Integer.valueOf(sp1Var.v()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Integer.valueOf(sp1Var.v()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        b46 b46Var = (b46) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                b46Var.e(sp1Var.v());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            b46Var.e(sp1Var.v());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final void r(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof ka7;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Long.valueOf(sp1Var.w()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Long.valueOf(sp1Var.w()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        ka7 ka7Var = (ka7) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                ka7Var.e(sp1Var.w());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            ka7Var.e(sp1Var.w());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final void s(List list, boolean z) throws InvalidProtocolBufferException.InvalidWireTypeException {
        String strX;
        int iZ;
        int iZ2;
        if ((this.b & 7) != 2) {
            throw InvalidProtocolBufferException.c();
        }
        boolean z2 = list instanceof uw6;
        sp1 sp1Var = this.a;
        if (z2 && !z) {
            uw6 uw6Var = (uw6) list;
            do {
                uw6Var.j(e());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        do {
            if (z) {
                w(2);
                strX = sp1Var.y();
            } else {
                w(2);
                strX = sp1Var.x();
            }
            list.add(strX);
            if (sp1Var.e()) {
                return;
            } else {
                iZ = sp1Var.z();
            }
        } while (iZ == this.b);
        this.d = iZ;
    }

    public final void t(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof b46;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Integer.valueOf(sp1Var.A()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Integer.valueOf(sp1Var.A()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        b46 b46Var = (b46) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                b46Var.e(sp1Var.A());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            b46Var.e(sp1Var.A());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final void u(List list) throws InvalidProtocolBufferException {
        int iZ;
        int iZ2;
        boolean z = list instanceof ka7;
        int i = this.b;
        sp1 sp1Var = this.a;
        if (!z) {
            int i2 = i & 7;
            if (i2 == 0) {
                do {
                    list.add(Long.valueOf(sp1Var.B()));
                    if (sp1Var.e()) {
                        return;
                    } else {
                        iZ = sp1Var.z();
                    }
                } while (iZ == this.b);
                this.d = iZ;
                return;
            }
            if (i2 != 2) {
                throw InvalidProtocolBufferException.c();
            }
            int iD = sp1Var.d() + sp1Var.A();
            do {
                list.add(Long.valueOf(sp1Var.B()));
            } while (sp1Var.d() < iD);
            v(iD);
            return;
        }
        ka7 ka7Var = (ka7) list;
        int i3 = i & 7;
        if (i3 == 0) {
            do {
                ka7Var.e(sp1Var.B());
                if (sp1Var.e()) {
                    return;
                } else {
                    iZ2 = sp1Var.z();
                }
            } while (iZ2 == this.b);
            this.d = iZ2;
            return;
        }
        if (i3 != 2) {
            throw InvalidProtocolBufferException.c();
        }
        int iD2 = sp1Var.d() + sp1Var.A();
        do {
            ka7Var.e(sp1Var.B());
        } while (sp1Var.d() < iD2);
        v(iD2);
    }

    public final void v(int i) throws InvalidProtocolBufferException {
        if (this.a.d() != i) {
            throw InvalidProtocolBufferException.g();
        }
    }

    public final void w(int i) throws InvalidProtocolBufferException.InvalidWireTypeException {
        if ((this.b & 7) != i) {
            throw InvalidProtocolBufferException.c();
        }
    }

    public final boolean x() {
        int i;
        sp1 sp1Var = this.a;
        if (sp1Var.e() || (i = this.b) == this.c) {
            return false;
        }
        return sp1Var.C(i);
    }
}
