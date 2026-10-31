package m90;

import b.u4;
import com.google.android.gms.internal.measurement.k2;
import java.io.EOFException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public final class d0 implements i {

    /* renamed from: a, reason: collision with root package name */
    public final j0 f76104a;

    /* renamed from: b, reason: collision with root package name */
    public final g f76105b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f76106c;

    public d0(j0 source) {
        Intrinsics.g(source, "source");
        this.f76104a = source;
        this.f76105b = new g();
    }

    @Override // m90.i
    public final j H(long j11) throws EOFException {
        m(j11);
        return this.f76105b.H(j11);
    }

    @Override // m90.i
    public final byte[] L() {
        j0 j0Var = this.f76104a;
        g gVar = this.f76105b;
        gVar.I(j0Var);
        return gVar.D(gVar.f76126b);
    }

    public final boolean N() {
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        g gVar = this.f76105b;
        return gVar.N() && this.f76104a.read(gVar, 8192L) == -1;
    }

    @Override // m90.i
    public final long O(h hVar) {
        g gVar;
        long j11 = 0;
        while (true) {
            j0 j0Var = this.f76104a;
            gVar = this.f76105b;
            if (j0Var.read(gVar, 8192L) == -1) {
                break;
            }
            long jD = gVar.d();
            if (jD > 0) {
                j11 += jD;
                hVar.Z(gVar, jD);
            }
        }
        long j12 = gVar.f76126b;
        if (j12 <= 0) {
            return j11;
        }
        long j13 = j11 + j12;
        hVar.Z(gVar, j12);
        return j13;
    }

    @Override // m90.i
    public final String Q(Charset charset) {
        j0 j0Var = this.f76104a;
        g gVar = this.f76105b;
        gVar.I(j0Var);
        return gVar.Q(charset);
    }

    @Override // m90.i
    public final boolean R(long j11, j bytes) {
        Intrinsics.g(bytes, "bytes");
        int iC = bytes.c();
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        if (j11 >= 0 && iC >= 0 && bytes.c() >= iC) {
            for (int i5 = 0; i5 < iC; i5++) {
                long j12 = i5 + j11;
                if (j(1 + j12) && this.f76105b.f(j12) == bytes.j(i5)) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // m90.i
    public final j U() {
        j0 j0Var = this.f76104a;
        g gVar = this.f76105b;
        gVar.I(j0Var);
        return gVar.H(gVar.f76126b);
    }

    public final long a(byte b11, long j11, long j12) {
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        if (0 > j12) {
            throw new IllegalArgumentException(u4.g(j12, "fromIndex=0 toIndex=").toString());
        }
        long jMax = 0;
        while (jMax < j12) {
            g gVar = this.f76105b;
            byte b12 = b11;
            long j13 = j12;
            long jH = gVar.h(b12, jMax, j13);
            if (jH != -1) {
                return jH;
            }
            long j14 = gVar.f76126b;
            if (j14 >= j13 || this.f76104a.read(gVar, 8192L) == -1) {
                break;
            }
            jMax = Math.max(jMax, j14);
            b11 = b12;
            j12 = j13;
        }
        return -1L;
    }

    @Override // m90.i
    public final long a0() throws EOFException {
        g gVar;
        byte bF;
        m(1L);
        int i5 = 0;
        while (true) {
            int i11 = i5 + 1;
            boolean zJ = j(i11);
            gVar = this.f76105b;
            if (!zJ) {
                break;
            }
            bF = gVar.f(i5);
            if ((bF < 48 || bF > 57) && ((bF < 97 || bF > 102) && (bF < 65 || bF > 70))) {
                break;
            }
            i5 = i11;
        }
        if (i5 == 0) {
            kotlin.text.a.a(16);
            kotlin.text.a.a(16);
            String string = Integer.toString(bF, 16);
            Intrinsics.f(string, "toString(this, checkRadix(radix))");
            throw new NumberFormatException("Expected leading [0-9a-fA-F] character but was 0x".concat(string));
        }
        return gVar.a0();
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x008e, code lost:
    
        r1 = new m90.g();
        r1.h0(r8);
        r1.g0(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0099, code lost:
    
        if (r2 != false) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x009b, code lost:
    
        r1.readByte();
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00ad, code lost:
    
        throw new java.lang.NumberFormatException("Number too large: ".concat(r1.P()));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long b() throws EOFException {
        g gVar;
        long j11;
        boolean z11;
        byte bF;
        m(1L);
        long j12 = 0;
        while (true) {
            long j13 = j12 + 1;
            boolean zJ = j(j13);
            gVar = this.f76105b;
            if (!zJ) {
                break;
            }
            bF = gVar.f(j12);
            if ((bF < 48 || bF > 57) && !(j12 == 0 && bF == 45)) {
                break;
            }
            j12 = j13;
        }
        if (j12 == 0) {
            kotlin.text.a.a(16);
            kotlin.text.a.a(16);
            String string = Integer.toString(bF, 16);
            Intrinsics.f(string, "toString(this, checkRadix(radix))");
            throw new NumberFormatException("Expected a digit or '-' but was 0x".concat(string));
        }
        long j14 = 0;
        if (gVar.f76126b == 0) {
            throw new EOFException();
        }
        int i5 = 0;
        boolean z12 = false;
        long j15 = 0;
        long j16 = -7;
        boolean z13 = false;
        loop1: while (true) {
            e0 e0Var = gVar.f76125a;
            Intrinsics.d(e0Var);
            byte[] bArr = e0Var.f76115a;
            int i11 = e0Var.f76116b;
            int i12 = e0Var.f76117c;
            while (i11 < i12) {
                byte b11 = bArr[i11];
                j11 = j14;
                if (b11 >= 48 && b11 <= 57) {
                    int i13 = 48 - b11;
                    if (j15 < -922337203685477580L) {
                        break loop1;
                    }
                    z11 = z13;
                    if (j15 == -922337203685477580L && i13 < j16) {
                        break loop1;
                    }
                    j15 = (j15 * 10) + i13;
                } else {
                    z11 = z13;
                    if (b11 != 45 || i5 != 0) {
                        z13 = true;
                        break;
                    }
                    j16--;
                    z12 = true;
                }
                i11++;
                i5++;
                j14 = j11;
                z13 = z11;
            }
            j11 = j14;
            if (i11 == i12) {
                gVar.f76125a = e0Var.a();
                f0.a(e0Var);
            } else {
                e0Var.f76116b = i11;
            }
            if (z13 || gVar.f76125a == null) {
                break;
            }
            j14 = j11;
        }
        long j17 = gVar.f76126b - i5;
        gVar.f76126b = j17;
        if (i5 >= (z12 ? 2 : 1)) {
            return z12 ? j15 : -j15;
        }
        if (j17 == j11) {
            throw new EOFException();
        }
        StringBuilder sbK = k2.k(z12 ? "Expected a digit" : "Expected a digit or '-'", " but was 0x");
        sbK.append(com.google.android.gms.internal.consent_sdk.e0.i0(gVar.f(j11)));
        throw new NumberFormatException(sbK.toString());
    }

    @Override // m90.i
    public final InputStream b0() {
        return new a60.b(this, 5);
    }

    public final int c() throws EOFException {
        m(4L);
        return com.google.android.gms.internal.consent_sdk.e0.a0(this.f76105b.readInt());
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable, java.nio.channels.Channel
    public final void close() {
        if (this.f76106c) {
            return;
        }
        this.f76106c = true;
        this.f76104a.close();
        this.f76105b.a();
    }

    public final long d() throws EOFException {
        long j11;
        m(8L);
        g gVar = this.f76105b;
        if (gVar.f76126b < 8) {
            throw new EOFException();
        }
        e0 e0Var = gVar.f76125a;
        Intrinsics.d(e0Var);
        int i5 = e0Var.f76116b;
        int i11 = e0Var.f76117c;
        if (i11 - i5 < 8) {
            j11 = ((gVar.readInt() & 4294967295L) << 32) | (4294967295L & gVar.readInt());
        } else {
            byte[] bArr = e0Var.f76115a;
            int i12 = i5 + 7;
            long j12 = ((bArr[i5 + 1] & 255) << 48) | ((bArr[i5] & 255) << 56) | ((bArr[i5 + 2] & 255) << 40) | ((bArr[i5 + 3] & 255) << 32) | ((bArr[i5 + 4] & 255) << 24) | ((bArr[i5 + 5] & 255) << 16) | ((bArr[i5 + 6] & 255) << 8);
            int i13 = i5 + 8;
            long j13 = j12 | (bArr[i12] & 255);
            gVar.f76126b -= 8;
            if (i13 == i11) {
                gVar.f76125a = e0Var.a();
                f0.a(e0Var);
            } else {
                e0Var.f76116b = i13;
            }
            j11 = j13;
        }
        return com.google.android.gms.internal.consent_sdk.e0.b0(j11);
    }

    public final short e() throws EOFException {
        m(2L);
        return this.f76105b.K();
    }

    public final String f(long j11) throws EOFException {
        m(j11);
        g gVar = this.f76105b;
        gVar.getClass();
        return gVar.M(j11, Charsets.f72000b);
    }

    @Override // m90.i
    public final g i() {
        return this.f76105b;
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return !this.f76106c;
    }

    @Override // m90.i
    public final boolean j(long j11) {
        g gVar;
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        do {
            gVar = this.f76105b;
            if (gVar.f76126b >= j11) {
                return true;
            }
        } while (this.f76104a.read(gVar, 8192L) != -1);
        return false;
    }

    @Override // m90.i
    public final void m(long j11) throws EOFException {
        if (!j(j11)) {
            throw new EOFException();
        }
    }

    @Override // m90.i
    public final d0 peek() {
        return x7.f.r(new a0(this));
    }

    @Override // m90.i
    public final String r(long j11) throws EOFException {
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "limit < 0: ").toString());
        }
        long j12 = j11 == Long.MAX_VALUE ? Long.MAX_VALUE : j11 + 1;
        long jA = a((byte) 10, 0L, j12);
        g gVar = this.f76105b;
        if (jA != -1) {
            return n90.a.c(gVar, jA);
        }
        if (j12 < Long.MAX_VALUE && j(j12) && gVar.f(j12 - 1) == 13 && j(j12 + 1) && gVar.f(j12) == 10) {
            return n90.a.c(gVar, j12);
        }
        g gVar2 = new g();
        gVar.e(gVar2, 0L, Math.min(32, gVar.f76126b));
        throw new EOFException("\\n not found: limit=" + Math.min(gVar.f76126b, j11) + " content=" + gVar2.H(gVar2.f76126b).d() + (char) 8230);
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(ByteBuffer sink) {
        Intrinsics.g(sink, "sink");
        g gVar = this.f76105b;
        if (gVar.f76126b == 0 && this.f76104a.read(gVar, 8192L) == -1) {
            return -1;
        }
        return gVar.read(sink);
    }

    @Override // m90.i
    public final byte readByte() throws EOFException {
        m(1L);
        return this.f76105b.readByte();
    }

    @Override // m90.i
    public final int readInt() throws EOFException {
        m(4L);
        return this.f76105b.readInt();
    }

    @Override // m90.i
    public final short readShort() throws EOFException {
        m(2L);
        return this.f76105b.readShort();
    }

    @Override // m90.i
    public final void skip(long j11) throws EOFException {
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        while (j11 > 0) {
            g gVar = this.f76105b;
            if (gVar.f76126b == 0 && this.f76104a.read(gVar, 8192L) == -1) {
                throw new EOFException();
            }
            long jMin = Math.min(j11, gVar.f76126b);
            gVar.skip(jMin);
            j11 -= jMin;
        }
    }

    @Override // m90.i
    public final long t(j targetBytes) {
        Intrinsics.g(targetBytes, "targetBytes");
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        long jMax = 0;
        while (true) {
            g gVar = this.f76105b;
            long jA = gVar.A(jMax, targetBytes);
            if (jA != -1) {
                return jA;
            }
            long j11 = gVar.f76126b;
            if (this.f76104a.read(gVar, 8192L) == -1) {
                return -1L;
            }
            jMax = Math.max(jMax, j11);
        }
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f76104a.timeout();
    }

    public final String toString() {
        return "buffer(" + this.f76104a + ')';
    }

    @Override // m90.i
    public final int v(x options) {
        Intrinsics.g(options, "options");
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        while (true) {
            g gVar = this.f76105b;
            int iD = n90.a.d(gVar, options, true);
            if (iD != -2) {
                if (iD != -1) {
                    gVar.skip(options.f76172b[iD].c());
                    return iD;
                }
            } else if (this.f76104a.read(gVar, 8192L) == -1) {
                break;
            }
        }
        return -1;
    }

    @Override // m90.i
    public final long y(j bytes) {
        Intrinsics.g(bytes, "bytes");
        if (this.f76106c) {
            throw new IllegalStateException("closed");
        }
        long jMax = 0;
        while (true) {
            g gVar = this.f76105b;
            long jW = gVar.w(jMax, bytes);
            if (jW != -1) {
                return jW;
            }
            long j11 = gVar.f76126b;
            if (this.f76104a.read(gVar, 8192L) == -1) {
                return -1L;
            }
            jMax = Math.max(jMax, (j11 - bytes.c()) + 1);
        }
    }

    @Override // m90.i
    public final String z() {
        return r(Long.MAX_VALUE);
    }

    @Override // m90.j0
    public final long read(g sink, long j11) {
        Intrinsics.g(sink, "sink");
        if (j11 >= 0) {
            if (!this.f76106c) {
                g gVar = this.f76105b;
                if (gVar.f76126b == 0 && this.f76104a.read(gVar, 8192L) == -1) {
                    return -1L;
                }
                return gVar.read(sink, Math.min(j11, gVar.f76126b));
            }
            throw new IllegalStateException("closed");
        }
        throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
    }
}
