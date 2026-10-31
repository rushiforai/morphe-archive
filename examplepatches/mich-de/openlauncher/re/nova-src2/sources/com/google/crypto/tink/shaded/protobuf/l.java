package com.google.crypto.tink.shaded.protobuf;

import androidx.compose.ui.node.LayoutNode;
import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final k f34624a;

    /* renamed from: b, reason: collision with root package name */
    public int f34625b;

    /* renamed from: c, reason: collision with root package name */
    public int f34626c;

    /* renamed from: d, reason: collision with root package name */
    public int f34627d = 0;

    public l(k kVar) {
        b0.a(kVar, "input");
        this.f34624a = kVar;
        kVar.f34623c = this;
    }

    public static void A(int i5) throws InvalidProtocolBufferException {
        if ((i5 & 7) != 0) {
            throw InvalidProtocolBufferException.c();
        }
    }

    public static l a(k kVar) {
        l lVar = (l) kVar.f34623c;
        return lVar != null ? lVar : new l(kVar);
    }

    public static void z(int i5) throws InvalidProtocolBufferException {
        if ((i5 & 3) != 0) {
            throw InvalidProtocolBufferException.c();
        }
    }

    public final int b() {
        int i5 = this.f34627d;
        if (i5 != 0) {
            this.f34625b = i5;
            this.f34627d = 0;
        } else {
            this.f34625b = this.f34624a.F();
        }
        int i11 = this.f34625b;
        return (i11 == 0 || i11 == this.f34626c) ? LayoutNode.NotPlacedPlaceOrder : i11 >>> 3;
    }

    public final void c(Object obj, x0 x0Var, p pVar) {
        int i5 = this.f34626c;
        this.f34626c = ((this.f34625b >>> 3) << 3) | 4;
        try {
            x0Var.g(obj, this, pVar);
            if (this.f34625b == this.f34626c) {
            } else {
                throw InvalidProtocolBufferException.c();
            }
        } finally {
            this.f34626c = i5;
        }
    }

    public final void d(Object obj, x0 x0Var, p pVar) throws InvalidProtocolBufferException {
        k kVar = this.f34624a;
        int I = ((j) kVar).I();
        if (kVar.f34621a + 0 >= kVar.f34622b) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iD = kVar.D(I);
        kVar.f34621a++;
        x0Var.g(obj, this, pVar);
        j jVar = (j) kVar;
        if (jVar.f34616q != 0) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
        kVar.f34621a--;
        jVar.f34617r = iD;
        jVar.L();
    }

    public final void e(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof d;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Boolean.valueOf(kVar.E()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Boolean.valueOf(kVar.E()));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        d dVar = (d) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                dVar.d(kVar.E());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            dVar.d(kVar.E());
        } while (kVar.B() < iB2);
        x(iB2);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0037  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final g f() throws InvalidProtocolBufferException {
        byte[] bArrCopyOfRange;
        y(2);
        j jVar = (j) this.f34624a;
        byte[] bArr = jVar.f34613d;
        int I = jVar.I();
        if (I > 0) {
            int i5 = jVar.f34614m;
            int i11 = jVar.o;
            if (I <= i5 - i11) {
                g gVarE = i.e(i11, I, bArr);
                jVar.o += I;
                return gVarE;
            }
        }
        if (I == 0) {
            return i.f34608b;
        }
        if (I > 0) {
            int i12 = jVar.f34614m;
            int i13 = jVar.o;
            if (I <= i12 - i13) {
                int i14 = I + i13;
                jVar.o = i14;
                bArrCopyOfRange = Arrays.copyOfRange(bArr, i13, i14);
            } else {
                if (I > 0) {
                    throw InvalidProtocolBufferException.d();
                }
                if (I != 0) {
                    throw InvalidProtocolBufferException.b();
                }
                bArrCopyOfRange = b0.f34576b;
            }
        }
        g gVar = i.f34608b;
        return new g(bArrCopyOfRange);
    }

    public final void g(a0 a0Var) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iF;
        if ((this.f34625b & 7) != 2) {
            int i5 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        do {
            a0Var.add(f());
            k kVar = this.f34624a;
            if (kVar.C()) {
                return;
            } else {
                iF = kVar.F();
            }
        } while (iF == this.f34625b);
        this.f34627d = iF;
    }

    public final void h(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof n;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 1) {
                do {
                    a0Var.add(Double.valueOf(Double.longBitsToDouble(((j) kVar).H())));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int I = ((j) kVar).I();
            A(I);
            int iB = kVar.B() + I;
            do {
                a0Var.add(Double.valueOf(Double.longBitsToDouble(((j) kVar).H())));
            } while (kVar.B() < iB);
            return;
        }
        n nVar = (n) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 1) {
            do {
                nVar.d(Double.longBitsToDouble(((j) kVar).H()));
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int I2 = ((j) kVar).I();
        A(I2);
        int iB2 = kVar.B() + I2;
        do {
            nVar.d(Double.longBitsToDouble(((j) kVar).H()));
        } while (kVar.B() < iB2);
    }

    public final void i(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof y;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Integer.valueOf(((j) kVar).I()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Integer.valueOf(((j) kVar).I()));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        y yVar = (y) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                yVar.d(((j) kVar).I());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            yVar.d(((j) kVar).I());
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final void j(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof y;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 2) {
                int I = ((j) kVar).I();
                z(I);
                int iB = kVar.B() + I;
                do {
                    a0Var.add(Integer.valueOf(((j) kVar).G()));
                } while (kVar.B() < iB);
                return;
            }
            if (i5 != 5) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            do {
                a0Var.add(Integer.valueOf(((j) kVar).G()));
                if (kVar.C()) {
                    return;
                } else {
                    iF = kVar.F();
                }
            } while (iF == this.f34625b);
            this.f34627d = iF;
            return;
        }
        y yVar = (y) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 2) {
            int I2 = ((j) kVar).I();
            z(I2);
            int iB2 = kVar.B() + I2;
            do {
                yVar.d(((j) kVar).G());
            } while (kVar.B() < iB2);
            return;
        }
        if (i12 != 5) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        do {
            yVar.d(((j) kVar).G());
            if (kVar.C()) {
                return;
            } else {
                iF2 = kVar.F();
            }
        } while (iF2 == this.f34625b);
        this.f34627d = iF2;
    }

    public final void k(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof g0;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 1) {
                do {
                    a0Var.add(Long.valueOf(((j) kVar).H()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int I = ((j) kVar).I();
            A(I);
            int iB = kVar.B() + I;
            do {
                a0Var.add(Long.valueOf(((j) kVar).H()));
            } while (kVar.B() < iB);
            return;
        }
        g0 g0Var = (g0) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 1) {
            do {
                g0Var.d(((j) kVar).H());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int I2 = ((j) kVar).I();
        A(I2);
        int iB2 = kVar.B() + I2;
        do {
            g0Var.d(((j) kVar).H());
        } while (kVar.B() < iB2);
    }

    public final void l(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof t;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 2) {
                int I = ((j) kVar).I();
                z(I);
                int iB = kVar.B() + I;
                do {
                    a0Var.add(Float.valueOf(Float.intBitsToFloat(((j) kVar).G())));
                } while (kVar.B() < iB);
                return;
            }
            if (i5 != 5) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            do {
                a0Var.add(Float.valueOf(Float.intBitsToFloat(((j) kVar).G())));
                if (kVar.C()) {
                    return;
                } else {
                    iF = kVar.F();
                }
            } while (iF == this.f34625b);
            this.f34627d = iF;
            return;
        }
        t tVar = (t) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 2) {
            int I2 = ((j) kVar).I();
            z(I2);
            int iB2 = kVar.B() + I2;
            do {
                tVar.d(Float.intBitsToFloat(((j) kVar).G()));
            } while (kVar.B() < iB2);
            return;
        }
        if (i12 != 5) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        do {
            tVar.d(Float.intBitsToFloat(((j) kVar).G()));
            if (kVar.C()) {
                return;
            } else {
                iF2 = kVar.F();
            }
        } while (iF2 == this.f34625b);
        this.f34627d = iF2;
    }

    public final void m(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof y;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Integer.valueOf(((j) kVar).I()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Integer.valueOf(((j) kVar).I()));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        y yVar = (y) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                yVar.d(((j) kVar).I());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            yVar.d(((j) kVar).I());
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final void n(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof g0;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Long.valueOf(((j) kVar).J()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Long.valueOf(((j) kVar).J()));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        g0 g0Var = (g0) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                g0Var.d(((j) kVar).J());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            g0Var.d(((j) kVar).J());
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final void o(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof y;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 2) {
                int I = ((j) kVar).I();
                z(I);
                int iB = kVar.B() + I;
                do {
                    a0Var.add(Integer.valueOf(((j) kVar).G()));
                } while (kVar.B() < iB);
                return;
            }
            if (i5 != 5) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            do {
                a0Var.add(Integer.valueOf(((j) kVar).G()));
                if (kVar.C()) {
                    return;
                } else {
                    iF = kVar.F();
                }
            } while (iF == this.f34625b);
            this.f34627d = iF;
            return;
        }
        y yVar = (y) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 2) {
            int I2 = ((j) kVar).I();
            z(I2);
            int iB2 = kVar.B() + I2;
            do {
                yVar.d(((j) kVar).G());
            } while (kVar.B() < iB2);
            return;
        }
        if (i12 != 5) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        do {
            yVar.d(((j) kVar).G());
            if (kVar.C()) {
                return;
            } else {
                iF2 = kVar.F();
            }
        } while (iF2 == this.f34625b);
        this.f34627d = iF2;
    }

    public final void p(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof g0;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 1) {
                do {
                    a0Var.add(Long.valueOf(((j) kVar).H()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int I = ((j) kVar).I();
            A(I);
            int iB = kVar.B() + I;
            do {
                a0Var.add(Long.valueOf(((j) kVar).H()));
            } while (kVar.B() < iB);
            return;
        }
        g0 g0Var = (g0) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 1) {
            do {
                g0Var.d(((j) kVar).H());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int I2 = ((j) kVar).I();
        A(I2);
        int iB2 = kVar.B() + I2;
        do {
            g0Var.d(((j) kVar).H());
        } while (kVar.B() < iB2);
    }

    public final void q(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof y;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Integer.valueOf(k.k(((j) kVar).I())));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Integer.valueOf(k.k(((j) kVar).I())));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        y yVar = (y) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                yVar.d(k.k(((j) kVar).I()));
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            yVar.d(k.k(((j) kVar).I()));
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final void r(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof g0;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Long.valueOf(k.l(((j) kVar).J())));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Long.valueOf(k.l(((j) kVar).J())));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        g0 g0Var = (g0) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                g0Var.d(k.l(((j) kVar).J()));
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            g0Var.d(k.l(((j) kVar).J()));
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final String s() throws InvalidProtocolBufferException {
        y(2);
        j jVar = (j) this.f34624a;
        int I = jVar.I();
        if (I > 0) {
            int i5 = jVar.f34614m;
            int i11 = jVar.o;
            if (I <= i5 - i11) {
                String str = new String(jVar.f34613d, i11, I, b0.f34575a);
                jVar.o += I;
                return str;
            }
        }
        if (I == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (I < 0) {
            throw InvalidProtocolBufferException.b();
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void t(a0 a0Var, boolean z11) throws InvalidProtocolBufferException.InvalidWireTypeException {
        int iF;
        if ((this.f34625b & 7) != 2) {
            int i5 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        do {
            a0Var.add(z11 ? u() : s());
            k kVar = this.f34624a;
            if (kVar.C()) {
                return;
            } else {
                iF = kVar.F();
            }
        } while (iF == this.f34625b);
        this.f34627d = iF;
    }

    public final String u() throws InvalidProtocolBufferException {
        y(2);
        j jVar = (j) this.f34624a;
        int I = jVar.I();
        if (I > 0) {
            int i5 = jVar.f34614m;
            int i11 = jVar.o;
            if (I <= i5 - i11) {
                String strC = j1.f34620a.C(i11, I, jVar.f34613d);
                jVar.o += I;
                return strC;
            }
        }
        if (I == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (I <= 0) {
            throw InvalidProtocolBufferException.b();
        }
        throw InvalidProtocolBufferException.d();
    }

    public final void v(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof y;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Integer.valueOf(((j) kVar).I()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Integer.valueOf(((j) kVar).I()));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        y yVar = (y) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                yVar.d(((j) kVar).I());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            yVar.d(((j) kVar).I());
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final void w(a0 a0Var) throws InvalidProtocolBufferException {
        int iF;
        int iF2;
        boolean z11 = a0Var instanceof g0;
        k kVar = this.f34624a;
        if (!z11) {
            int i5 = this.f34625b & 7;
            if (i5 == 0) {
                do {
                    a0Var.add(Long.valueOf(((j) kVar).J()));
                    if (kVar.C()) {
                        return;
                    } else {
                        iF = kVar.F();
                    }
                } while (iF == this.f34625b);
                this.f34627d = iF;
                return;
            }
            if (i5 != 2) {
                int i11 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            int iB = kVar.B() + ((j) kVar).I();
            do {
                a0Var.add(Long.valueOf(((j) kVar).J()));
            } while (kVar.B() < iB);
            x(iB);
            return;
        }
        g0 g0Var = (g0) a0Var;
        int i12 = this.f34625b & 7;
        if (i12 == 0) {
            do {
                g0Var.d(((j) kVar).J());
                if (kVar.C()) {
                    return;
                } else {
                    iF2 = kVar.F();
                }
            } while (iF2 == this.f34625b);
            this.f34627d = iF2;
            return;
        }
        if (i12 != 2) {
            int i13 = InvalidProtocolBufferException.f34567a;
            throw new InvalidProtocolBufferException.InvalidWireTypeException();
        }
        int iB2 = kVar.B() + ((j) kVar).I();
        do {
            g0Var.d(((j) kVar).J());
        } while (kVar.B() < iB2);
        x(iB2);
    }

    public final void x(int i5) throws InvalidProtocolBufferException {
        if (this.f34624a.B() != i5) {
            throw InvalidProtocolBufferException.d();
        }
    }

    public final void y(int i5) throws InvalidProtocolBufferException.InvalidWireTypeException {
        if ((this.f34625b & 7) == i5) {
            return;
        }
        int i11 = InvalidProtocolBufferException.f34567a;
        throw new InvalidProtocolBufferException.InvalidWireTypeException();
    }
}
