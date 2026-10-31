package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.ByteBuffer;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class h extends i {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f30805a = true;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f30806b;

    /* renamed from: c, reason: collision with root package name */
    public int f30807c;

    /* renamed from: d, reason: collision with root package name */
    public int f30808d;

    /* renamed from: e, reason: collision with root package name */
    public int f30809e;

    /* renamed from: f, reason: collision with root package name */
    public int f30810f;

    public h(ByteBuffer byteBuffer) {
        this.f30806b = byteBuffer.array();
        this.f30807c = byteBuffer.position() + byteBuffer.arrayOffset();
        this.f30808d = byteBuffer.limit() + byteBuffer.arrayOffset();
    }

    public final String a(boolean z11) throws n1 {
        c(2);
        int iX = x();
        if (iX == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        a(iX);
        if (z11) {
            byte[] bArr = this.f30806b;
            int i5 = this.f30807c;
            if (!d4.f30786a.b(bArr, i5, i5 + iX)) {
                throw new n1("Protocol message had invalid UTF-8.");
            }
        }
        String str = new String(this.f30806b, this.f30807c, iX, l1.f30847a);
        this.f30807c += iX;
        return str;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object b(Class cls, h0 h0Var) throws m1 {
        c(2);
        return d(p2.f30870c.a(cls), h0Var);
    }

    public final Object c(t2 t2Var, h0 h0Var) {
        int i5 = this.f30810f;
        this.f30810f = ((this.f30809e >>> 3) << 3) | 4;
        try {
            Object objA = t2Var.a();
            t2Var.a(objA, this, h0Var);
            t2Var.c(objA);
            if (this.f30809e == this.f30810f) {
                return objA;
            }
            throw new n1("Failed to parse the message.");
        } finally {
            this.f30810f = i5;
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int d() throws m1 {
        c(0);
        return x();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int e() {
        return this.f30809e;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long f() throws m1 {
        c(0);
        return y();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long g() throws n1 {
        c(1);
        a(8);
        return w();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final double h() throws n1 {
        c(1);
        a(8);
        return Double.longBitsToDouble(w());
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x008b  */
    @Override // com.fyber.inneractive.sdk.protobuf.s2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean i() throws n1 {
        int i5;
        int i11;
        if (u() || (i5 = this.f30809e) == (i11 = this.f30810f)) {
            return false;
        }
        int i12 = i5 & 7;
        if (i12 != 0) {
            if (i12 == 1) {
                a(8);
                this.f30807c += 8;
                return true;
            }
            if (i12 == 2) {
                int iX = x();
                a(iX);
                this.f30807c += iX;
                return true;
            }
            if (i12 != 3) {
                if (i12 != 5) {
                    int i13 = n1.f30859a;
                    throw new m1();
                }
                a(4);
                this.f30807c += 4;
                return true;
            }
            this.f30810f = ((i5 >>> 3) << 3) | 4;
            while (s() != Integer.MAX_VALUE && i()) {
            }
            if (this.f30809e != this.f30810f) {
                throw new n1("Failed to parse the message.");
            }
            this.f30810f = i11;
            return true;
        }
        int i14 = this.f30808d;
        int i15 = this.f30807c;
        if (i14 - i15 < 10) {
            while (i < 10) {
            }
            throw new n1("CodedInputStream encountered a malformed varint.");
        }
        byte[] bArr = this.f30806b;
        int i16 = 0;
        while (i16 < 10) {
            int i17 = i15 + 1;
            if (bArr[i15] >= 0) {
                this.f30807c = i17;
                break;
            }
            i16++;
            i15 = i17;
        }
        for (int i18 = 0; i18 < 10; i18++) {
            int i19 = this.f30807c;
            if (i19 == this.f30808d) {
                throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
            byte[] bArr2 = this.f30806b;
            this.f30807c = i19 + 1;
            if (bArr2[i19] < 0) {
            }
        }
        throw new n1("CodedInputStream encountered a malformed varint.");
        return true;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int j() throws m1 {
        c(0);
        return w.b(x());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final float k() throws n1 {
        c(5);
        a(4);
        return Float.intBitsToFloat(v());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long l() throws m1 {
        c(0);
        return w.a(y());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int m() throws n1 {
        c(5);
        a(4);
        return v();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final String n() {
        return a(false);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long o() throws m1 {
        c(0);
        return y();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final String p() {
        return a(true);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int q() throws n1 {
        c(5);
        a(4);
        return v();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final boolean r() throws m1 {
        c(0);
        return x() != 0;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int s() throws n1 {
        if (u()) {
            return LayoutNode.NotPlacedPlaceOrder;
        }
        int iX = x();
        this.f30809e = iX;
        return iX == this.f30810f ? LayoutNode.NotPlacedPlaceOrder : iX >>> 3;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final long t() throws n1 {
        c(1);
        a(8);
        return w();
    }

    public final boolean u() {
        return this.f30807c == this.f30808d;
    }

    public final int v() {
        int i5 = this.f30807c;
        byte[] bArr = this.f30806b;
        this.f30807c = i5 + 4;
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public final long w() {
        int i5 = this.f30807c;
        byte[] bArr = this.f30806b;
        this.f30807c = i5 + 8;
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x00a4 A[PHI: r2
      0x00a4: PHI (r2v7 int) = (r2v6 int), (r2v9 int) binds: [B:37:0x0082, B:41:0x008e] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int x() throws n1 {
        int i5;
        int i11 = this.f30807c;
        int i12 = this.f30808d;
        if (i12 == i11) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        byte[] bArr = this.f30806b;
        int i13 = i11 + 1;
        byte b11 = bArr[i11];
        if (b11 >= 0) {
            this.f30807c = i13;
            return b11;
        }
        if (i12 - i13 < 9) {
            long j11 = 0;
            for (int i14 = 0; i14 < 64; i14 += 7) {
                int i15 = this.f30807c;
                if (i15 == this.f30808d) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                byte[] bArr2 = this.f30806b;
                this.f30807c = i15 + 1;
                j11 |= (r4 & AbstractJsonLexerKt.TC_INVALID) << i14;
                if ((bArr2[i15] & 128) == 0) {
                    return (int) j11;
                }
            }
            throw new n1("CodedInputStream encountered a malformed varint.");
        }
        int i16 = i11 + 2;
        int i17 = (bArr[i13] << 7) ^ b11;
        if (i17 < 0) {
            i5 = i17 ^ (-128);
        } else {
            int i18 = i11 + 3;
            int i19 = (bArr[i16] << 14) ^ i17;
            if (i19 >= 0) {
                i5 = i19 ^ 16256;
            } else {
                int i21 = i11 + 4;
                int i22 = i19 ^ (bArr[i18] << 21);
                if (i22 < 0) {
                    i5 = (-2080896) ^ i22;
                    i16 = i21;
                } else {
                    i18 = i11 + 5;
                    byte b12 = bArr[i21];
                    int i23 = (i22 ^ (b12 << 28)) ^ 266354560;
                    if (b12 < 0) {
                        int i24 = i11 + 6;
                        if (bArr[i18] < 0) {
                            i18 = i11 + 7;
                            if (bArr[i24] < 0) {
                                i24 = i11 + 8;
                                if (bArr[i18] < 0) {
                                    i18 = i11 + 9;
                                    if (bArr[i24] < 0) {
                                        int i25 = i11 + 10;
                                        if (bArr[i18] < 0) {
                                            throw new n1("CodedInputStream encountered a malformed varint.");
                                        }
                                        i18 = i25;
                                    }
                                } else {
                                    i18 = i24;
                                }
                            }
                        }
                    }
                    i5 = i23;
                }
            }
            i16 = i18;
        }
        this.f30807c = i16;
        return i5;
    }

    public final long y() throws n1 {
        long j11;
        long j12;
        long j13;
        long j14;
        int i5 = this.f30807c;
        int i11 = this.f30808d;
        if (i11 == i5) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
        byte[] bArr = this.f30806b;
        int i12 = i5 + 1;
        byte b11 = bArr[i5];
        if (b11 >= 0) {
            this.f30807c = i12;
            return b11;
        }
        long j15 = 0;
        if (i11 - i12 < 9) {
            for (int i13 = 0; i13 < 64; i13 += 7) {
                int i14 = this.f30807c;
                if (i14 == this.f30808d) {
                    throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                }
                byte[] bArr2 = this.f30806b;
                this.f30807c = i14 + 1;
                j15 |= (r1 & AbstractJsonLexerKt.TC_INVALID) << i13;
                if ((bArr2[i14] & 128) == 0) {
                    return j15;
                }
            }
            throw new n1("CodedInputStream encountered a malformed varint.");
        }
        int i15 = i5 + 2;
        int i16 = (bArr[i12] << 7) ^ b11;
        if (i16 < 0) {
            j11 = i16 ^ (-128);
        } else {
            int i17 = i5 + 3;
            int i18 = (bArr[i15] << 14) ^ i16;
            if (i18 >= 0) {
                j11 = i18 ^ 16256;
                i15 = i17;
            } else {
                int i19 = i5 + 4;
                int i21 = i18 ^ (bArr[i17] << 21);
                if (i21 < 0) {
                    j14 = (-2080896) ^ i21;
                } else {
                    long j16 = i21;
                    i15 = i5 + 5;
                    long j17 = j16 ^ (bArr[i19] << 28);
                    if (j17 >= 0) {
                        j13 = 266354560;
                    } else {
                        i19 = i5 + 6;
                        long j18 = j17 ^ (bArr[i15] << 35);
                        if (j18 < 0) {
                            j12 = -34093383808L;
                        } else {
                            i15 = i5 + 7;
                            j17 = j18 ^ (bArr[i19] << 42);
                            if (j17 >= 0) {
                                j13 = 4363953127296L;
                            } else {
                                i19 = i5 + 8;
                                j18 = j17 ^ (bArr[i15] << 49);
                                if (j18 < 0) {
                                    j12 = -558586000294016L;
                                } else {
                                    i15 = i5 + 9;
                                    long j19 = (j18 ^ (bArr[i19] << 56)) ^ 71499008037633920L;
                                    if (j19 < 0) {
                                        int i22 = i5 + 10;
                                        if (bArr[i15] < 0) {
                                            throw new n1("CodedInputStream encountered a malformed varint.");
                                        }
                                        i15 = i22;
                                    }
                                    j11 = j19;
                                }
                            }
                        }
                        j14 = j12 ^ j18;
                    }
                    j11 = j13 ^ j17;
                }
                i15 = i19;
                j11 = j14;
            }
        }
        this.f30807c = i15;
        return j11;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void e(List list) throws n1 {
        int i5;
        int i11;
        if (!(list instanceof a1)) {
            int i12 = this.f30809e & 7;
            if (i12 == 2) {
                int iX = x();
                d(iX);
                int i13 = this.f30807c + iX;
                while (this.f30807c < i13) {
                    list.add(Integer.valueOf(v()));
                }
                return;
            }
            if (i12 != 5) {
                int i14 = n1.f30859a;
                throw new m1();
            }
            do {
                list.add(Integer.valueOf(q()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        a1 a1Var = (a1) list;
        int i15 = this.f30809e & 7;
        if (i15 == 2) {
            int iX2 = x();
            d(iX2);
            int i16 = this.f30807c + iX2;
            while (this.f30807c < i16) {
                a1Var.c(v());
            }
            return;
        }
        if (i15 != 5) {
            int i17 = n1.f30859a;
            throw new m1();
        }
        do {
            a1Var.c(q());
            if (u()) {
                return;
            } else {
                i11 = this.f30807c;
            }
        } while (x() == this.f30809e);
        this.f30807c = i11;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void n(List list) throws n1 {
        int i5;
        int i11;
        if (!(list instanceof u1)) {
            int i12 = this.f30809e & 7;
            if (i12 == 1) {
                do {
                    list.add(Long.valueOf(g()));
                    if (u()) {
                        return;
                    } else {
                        i5 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i5;
                return;
            }
            if (i12 != 2) {
                int i13 = n1.f30859a;
                throw new m1();
            }
            int iX = x();
            e(iX);
            int i14 = this.f30807c + iX;
            while (this.f30807c < i14) {
                list.add(Long.valueOf(w()));
            }
            return;
        }
        u1 u1Var = (u1) list;
        int i15 = this.f30809e & 7;
        if (i15 == 1) {
            do {
                u1Var.a(g());
                if (u()) {
                    return;
                } else {
                    i11 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i11;
            return;
        }
        if (i15 != 2) {
            int i16 = n1.f30859a;
            throw new m1();
        }
        int iX2 = x();
        e(iX2);
        int i17 = this.f30807c + iX2;
        while (this.f30807c < i17) {
            u1Var.a(w());
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void p(List list) throws n1 {
        int i5;
        int i11;
        if (!(list instanceof a1)) {
            int i12 = this.f30809e & 7;
            if (i12 != 0) {
                if (i12 != 2) {
                    int i13 = n1.f30859a;
                    throw new m1();
                }
                int iX = this.f30807c + x();
                while (this.f30807c < iX) {
                    list.add(Integer.valueOf(x()));
                }
                return;
            }
            do {
                c(0);
                list.add(Integer.valueOf(x()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        a1 a1Var = (a1) list;
        int i14 = this.f30809e & 7;
        if (i14 != 0) {
            if (i14 != 2) {
                int i15 = n1.f30859a;
                throw new m1();
            }
            int iX2 = this.f30807c + x();
            while (this.f30807c < iX2) {
                a1Var.c(x());
            }
            return;
        }
        do {
            c(0);
            a1Var.c(x());
            if (u()) {
                return;
            } else {
                i11 = this.f30807c;
            }
        } while (x() == this.f30809e);
        this.f30807c = i11;
    }

    public final Object d(t2 t2Var, h0 h0Var) throws n1 {
        int iX = x();
        a(iX);
        int i5 = this.f30808d;
        int i11 = this.f30807c + iX;
        this.f30808d = i11;
        try {
            Object objA = t2Var.a();
            t2Var.a(objA, this, h0Var);
            t2Var.c(objA);
            if (this.f30807c == i11) {
                return objA;
            }
            throw new n1("Failed to parse the message.");
        } finally {
            this.f30808d = i5;
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void f(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i12 = this.f30809e & 7;
            if (i12 == 2) {
                int iX = x();
                d(iX);
                int i13 = this.f30807c + iX;
                while (this.f30807c < i13) {
                    a1Var.c(v());
                }
                return;
            }
            if (i12 == 5) {
                do {
                    a1Var.c(m());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            int i14 = n1.f30859a;
            throw new m1();
        }
        int i15 = this.f30809e & 7;
        if (i15 == 2) {
            int iX2 = x();
            d(iX2);
            int i16 = this.f30807c + iX2;
            while (this.f30807c < i16) {
                list.add(Integer.valueOf(v()));
            }
            return;
        }
        if (i15 == 5) {
            do {
                list.add(Integer.valueOf(m()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        int i17 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void j(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof d0) {
            d0 d0Var = (d0) list;
            int i12 = this.f30809e & 7;
            if (i12 == 1) {
                do {
                    d0Var.a(h());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            if (i12 == 2) {
                int iX = x();
                e(iX);
                int i13 = this.f30807c + iX;
                while (this.f30807c < i13) {
                    d0Var.a(Double.longBitsToDouble(w()));
                }
                return;
            }
            int i14 = n1.f30859a;
            throw new m1();
        }
        int i15 = this.f30809e & 7;
        if (i15 == 1) {
            do {
                list.add(Double.valueOf(h()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        if (i15 == 2) {
            int iX2 = x();
            e(iX2);
            int i16 = this.f30807c + iX2;
            while (this.f30807c < i16) {
                list.add(Double.valueOf(Double.longBitsToDouble(w())));
            }
            return;
        }
        int i17 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void l(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof j) {
            j jVar = (j) list;
            int i12 = this.f30809e & 7;
            if (i12 == 0) {
                do {
                    jVar.a(r());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            if (i12 == 2) {
                int iX = this.f30807c + x();
                while (this.f30807c < iX) {
                    jVar.a(x() != 0);
                }
                b(iX);
                return;
            }
            int i13 = n1.f30859a;
            throw new m1();
        }
        int i14 = this.f30809e & 7;
        if (i14 == 0) {
            do {
                list.add(Boolean.valueOf(r()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        if (i14 == 2) {
            int iX2 = this.f30807c + x();
            while (this.f30807c < iX2) {
                list.add(Boolean.valueOf(x() != 0));
            }
            b(iX2);
            return;
        }
        int i15 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void o(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i12 = this.f30809e & 7;
            if (i12 == 0) {
                do {
                    c(0);
                    a1Var.c(x());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            if (i12 == 2) {
                int iX = this.f30807c + x();
                while (this.f30807c < iX) {
                    a1Var.c(x());
                }
                b(iX);
                return;
            }
            int i13 = n1.f30859a;
            throw new m1();
        }
        int i14 = this.f30809e & 7;
        if (i14 == 0) {
            do {
                c(0);
                list.add(Integer.valueOf(x()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        if (i14 == 2) {
            int iX2 = this.f30807c + x();
            while (this.f30807c < iX2) {
                list.add(Integer.valueOf(x()));
            }
            b(iX2);
            return;
        }
        int i15 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object b(t2 t2Var, h0 h0Var) throws m1 {
        c(2);
        return d(t2Var, h0Var);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void g(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i12 = this.f30809e & 7;
            if (i12 != 0) {
                if (i12 == 2) {
                    int iX = this.f30807c + x();
                    while (this.f30807c < iX) {
                        u1Var.a(w.a(y()));
                    }
                    return;
                }
                int i13 = n1.f30859a;
                throw new m1();
            }
            do {
                c(0);
                u1Var.a(w.a(y()));
                if (u()) {
                    return;
                } else {
                    i11 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i11;
            return;
        }
        int i14 = this.f30809e & 7;
        if (i14 != 0) {
            if (i14 == 2) {
                int iX2 = this.f30807c + x();
                while (this.f30807c < iX2) {
                    list.add(Long.valueOf(w.a(y())));
                }
                return;
            }
            int i15 = n1.f30859a;
            throw new m1();
        }
        do {
            c(0);
            list.add(Long.valueOf(w.a(y())));
            if (u()) {
                return;
            } else {
                i5 = this.f30807c;
            }
        } while (x() == this.f30809e);
        this.f30807c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void m(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i12 = this.f30809e & 7;
            if (i12 == 1) {
                do {
                    u1Var.a(t());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            if (i12 == 2) {
                int iX = x();
                e(iX);
                int i13 = this.f30807c + iX;
                while (this.f30807c < i13) {
                    u1Var.a(w());
                }
                return;
            }
            int i14 = n1.f30859a;
            throw new m1();
        }
        int i15 = this.f30809e & 7;
        if (i15 == 1) {
            do {
                list.add(Long.valueOf(t()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        if (i15 == 2) {
            int iX2 = x();
            e(iX2);
            int i16 = this.f30807c + iX2;
            while (this.f30807c < i16) {
                list.add(Long.valueOf(w()));
            }
            return;
        }
        int i17 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void q(List list) throws m1 {
        a(list, false);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void h(List list) throws m1 {
        int i5;
        if ((this.f30809e & 7) == 2) {
            do {
                list.add(a());
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        int i11 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void k(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i12 = this.f30809e & 7;
            if (i12 == 0) {
                do {
                    c(0);
                    u1Var.a(y());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            if (i12 == 2) {
                int iX = this.f30807c + x();
                while (this.f30807c < iX) {
                    u1Var.a(y());
                }
                b(iX);
                return;
            }
            int i13 = n1.f30859a;
            throw new m1();
        }
        int i14 = this.f30809e & 7;
        if (i14 == 0) {
            do {
                c(0);
                list.add(Long.valueOf(y()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        if (i14 == 2) {
            int iX2 = this.f30807c + x();
            while (this.f30807c < iX2) {
                list.add(Long.valueOf(y()));
            }
            b(iX2);
            return;
        }
        int i15 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int b() throws m1 {
        c(0);
        return x();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void b(List list) throws m1 {
        a(list, true);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void b(List list, t2 t2Var, h0 h0Var) throws m1 {
        int i5;
        int i11 = this.f30809e;
        if ((i11 & 7) == 2) {
            do {
                list.add(d(t2Var, h0Var));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == i11);
            this.f30807c = i5;
            return;
        }
        int i12 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object a(Class cls, h0 h0Var) throws m1 {
        c(3);
        return c(p2.f30870c.a(cls), h0Var);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final int c() throws m1 {
        c(0);
        return x();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final Object a(t2 t2Var, h0 h0Var) throws m1 {
        c(3);
        return c(t2Var, h0Var);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void c(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i12 = this.f30809e & 7;
            if (i12 != 0) {
                if (i12 == 2) {
                    int iX = this.f30807c + x();
                    while (this.f30807c < iX) {
                        a1Var.c(w.b(x()));
                    }
                    return;
                }
                int i13 = n1.f30859a;
                throw new m1();
            }
            do {
                c(0);
                a1Var.c(w.b(x()));
                if (u()) {
                    return;
                } else {
                    i11 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i11;
            return;
        }
        int i14 = this.f30809e & 7;
        if (i14 != 0) {
            if (i14 == 2) {
                int iX2 = this.f30807c + x();
                while (this.f30807c < iX2) {
                    list.add(Integer.valueOf(w.b(x())));
                }
                return;
            }
            int i15 = n1.f30859a;
            throw new m1();
        }
        do {
            c(0);
            list.add(Integer.valueOf(w.b(x())));
            if (u()) {
                return;
            } else {
                i5 = this.f30807c;
            }
        } while (x() == this.f30809e);
        this.f30807c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final s a() throws n1 {
        s qVar;
        c(2);
        int iX = x();
        if (iX == 0) {
            return s.f30889b;
        }
        a(iX);
        if (this.f30805a) {
            byte[] bArr = this.f30806b;
            int i5 = this.f30807c;
            q qVar2 = s.f30889b;
            qVar = new n(bArr, i5, iX);
        } else {
            byte[] bArr2 = this.f30806b;
            int i11 = this.f30807c;
            q qVar3 = s.f30889b;
            s.a(i11, i11 + iX, bArr2.length);
            qVar = new q(s.f30890c.a(bArr2, i11, iX));
        }
        this.f30807c += iX;
        return qVar;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void d(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof q0) {
            q0 q0Var = (q0) list;
            int i12 = this.f30809e & 7;
            if (i12 == 2) {
                int iX = x();
                d(iX);
                int i13 = this.f30807c + iX;
                while (this.f30807c < i13) {
                    q0Var.a(Float.intBitsToFloat(v()));
                }
                return;
            }
            if (i12 == 5) {
                do {
                    q0Var.a(k());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            int i14 = n1.f30859a;
            throw new m1();
        }
        int i15 = this.f30809e & 7;
        if (i15 == 2) {
            int iX2 = x();
            d(iX2);
            int i16 = this.f30807c + iX2;
            while (this.f30807c < i16) {
                list.add(Float.valueOf(Float.intBitsToFloat(v())));
            }
            return;
        }
        if (i15 == 5) {
            do {
                list.add(Float.valueOf(k()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        int i17 = n1.f30859a;
        throw new m1();
    }

    public final void b(int i5) throws n1 {
        if (this.f30807c != i5) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void a(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof u1) {
            u1 u1Var = (u1) list;
            int i12 = this.f30809e & 7;
            if (i12 == 0) {
                do {
                    c(0);
                    u1Var.a(y());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            if (i12 == 2) {
                int iX = this.f30807c + x();
                while (this.f30807c < iX) {
                    u1Var.a(y());
                }
                b(iX);
                return;
            }
            int i13 = n1.f30859a;
            throw new m1();
        }
        int i14 = this.f30809e & 7;
        if (i14 == 0) {
            do {
                c(0);
                list.add(Long.valueOf(y()));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        if (i14 == 2) {
            int iX2 = this.f30807c + x();
            while (this.f30807c < iX2) {
                list.add(Long.valueOf(y()));
            }
            b(iX2);
            return;
        }
        int i15 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void i(List list) throws n1 {
        int i5;
        int i11;
        if (list instanceof a1) {
            a1 a1Var = (a1) list;
            int i12 = this.f30809e & 7;
            if (i12 != 0) {
                if (i12 == 2) {
                    int iX = this.f30807c + x();
                    while (this.f30807c < iX) {
                        a1Var.c(x());
                    }
                    return;
                }
                int i13 = n1.f30859a;
                throw new m1();
            }
            do {
                c(0);
                a1Var.c(x());
                if (u()) {
                    return;
                } else {
                    i11 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i11;
            return;
        }
        int i14 = this.f30809e & 7;
        if (i14 != 0) {
            if (i14 == 2) {
                int iX2 = this.f30807c + x();
                while (this.f30807c < iX2) {
                    list.add(Integer.valueOf(x()));
                }
                return;
            }
            int i15 = n1.f30859a;
            throw new m1();
        }
        do {
            c(0);
            list.add(Integer.valueOf(x()));
            if (u()) {
                return;
            } else {
                i5 = this.f30807c;
            }
        } while (x() == this.f30809e);
        this.f30807c = i5;
    }

    public final void e(int i5) throws n1 {
        a(i5);
        if ((i5 & 7) != 0) {
            throw new n1("Failed to parse the message.");
        }
    }

    public final void c(int i5) throws m1 {
        if ((this.f30809e & 7) == i5) {
            return;
        }
        int i11 = n1.f30859a;
        throw new m1();
    }

    public final void d(int i5) throws n1 {
        a(i5);
        if ((i5 & 3) != 0) {
            throw new n1("Failed to parse the message.");
        }
    }

    public final void a(List list, boolean z11) throws m1 {
        int i5;
        int i11;
        if ((this.f30809e & 7) == 2) {
            if ((list instanceof q1) && !z11) {
                q1 q1Var = (q1) list;
                do {
                    q1Var.a(a());
                    if (u()) {
                        return;
                    } else {
                        i11 = this.f30807c;
                    }
                } while (x() == this.f30809e);
                this.f30807c = i11;
                return;
            }
            do {
                list.add(a(z11));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == this.f30809e);
            this.f30807c = i5;
            return;
        }
        int i12 = n1.f30859a;
        throw new m1();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.s2
    public final void a(List list, t2 t2Var, h0 h0Var) throws m1 {
        int i5;
        int i11 = this.f30809e;
        if ((i11 & 7) == 3) {
            do {
                list.add(c(t2Var, h0Var));
                if (u()) {
                    return;
                } else {
                    i5 = this.f30807c;
                }
            } while (x() == i11);
            this.f30807c = i5;
            return;
        }
        int i12 = n1.f30859a;
        throw new m1();
    }

    public final void a(int i5) throws n1 {
        if (i5 < 0 || i5 > this.f30808d - this.f30807c) {
            throw new n1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
        }
    }
}
