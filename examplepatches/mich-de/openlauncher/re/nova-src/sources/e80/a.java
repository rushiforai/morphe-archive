package e80;

import b.c0;
import b.u4;
import cl.l0;
import h6.c1;
import java.io.EOFException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements k, j {

    /* renamed from: a, reason: collision with root package name */
    public h f52245a;

    /* renamed from: b, reason: collision with root package name */
    public h f52246b;

    /* renamed from: c, reason: collision with root package name */
    public long f52247c;

    @Override // e80.e
    public final long B(a aVar, long j11) {
        if (j11 < 0) {
            throw new IllegalArgumentException(c1.o(j11, "byteCount (", ") < 0").toString());
        }
        long j12 = this.f52247c;
        if (j12 == 0) {
            return -1L;
        }
        if (j11 > j12) {
            j11 = j12;
        }
        aVar.p(this, j11);
        return j11;
    }

    @Override // e80.k
    public final boolean N() {
        return this.f52247c == 0;
    }

    public final byte a() {
        if (0 >= this.f52247c) {
            throw new IndexOutOfBoundsException(a2.c.i(this.f52247c, "))", new StringBuilder("position (0) is not within the range [0..size(")));
        }
        h hVar = this.f52245a;
        Intrinsics.d(hVar);
        return hVar.f52260a[hVar.f52261b];
    }

    public final int b(int i5, int i11, byte[] sink) {
        Intrinsics.g(sink, "sink");
        n.a(sink.length, i5, i11);
        h hVar = this.f52245a;
        if (hVar == null) {
            return -1;
        }
        int iMin = Math.min(i11 - i5, hVar.a());
        int i12 = (i5 + iMin) - i5;
        byte[] bArr = hVar.f52260a;
        int i13 = hVar.f52261b;
        u90.b.q(bArr, i5, sink, i13, i13 + i12);
        hVar.f52261b += i12;
        this.f52247c -= iMin;
        if (hVar.a() == 0) {
            d();
        }
        return iMin;
    }

    public final void c(j sink, long j11) throws EOFException {
        Intrinsics.g(sink, "sink");
        if (j11 < 0) {
            throw new IllegalArgumentException(c1.o(j11, "byteCount (", ") < 0").toString());
        }
        long j12 = this.f52247c;
        if (j12 >= j11) {
            ((a) sink).p(this, j11);
        } else {
            ((a) sink).p(this, j12);
            throw new EOFException(a2.c.i(this.f52247c, " bytes were written.", c0.u(j11, "Buffer exhausted before writing ", " bytes. Only ")));
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
    }

    public final void d() {
        h hVar = this.f52245a;
        Intrinsics.d(hVar);
        h hVar2 = hVar.f52265f;
        this.f52245a = hVar2;
        if (hVar2 == null) {
            this.f52246b = null;
        } else {
            hVar2.f52266g = null;
        }
        hVar.f52265f = null;
        i.a(hVar);
    }

    public final long e(e source) {
        Intrinsics.g(source, "source");
        long j11 = 0;
        while (true) {
            long jB = source.B(this, 8192L);
            if (jB == -1) {
                return j11;
            }
            j11 += jB;
        }
    }

    public final long f(j sink) {
        Intrinsics.g(sink, "sink");
        long j11 = this.f52247c;
        if (j11 > 0) {
            ((a) sink).p(this, j11);
        }
        return j11;
    }

    @Override // java.io.Flushable
    public final void flush() {
    }

    public final /* synthetic */ h h() {
        h hVar = this.f52246b;
        if (hVar == null) {
            h hVarB = i.b();
            this.f52245a = hVarB;
            this.f52246b = hVarB;
            return hVarB;
        }
        if (hVar.f52262c + 1 <= 8192 && hVar.f52264e) {
            return hVar;
        }
        h hVarB2 = i.b();
        hVar.c(hVarB2);
        this.f52246b = hVarB2;
        return hVarB2;
    }

    @Override // e80.k
    public final a i() {
        return this;
    }

    @Override // e80.k
    public final boolean j(long j11) {
        if (j11 >= 0) {
            return this.f52247c >= j11;
        }
        throw new IllegalArgumentException(c1.o(j11, "byteCount: ", " < 0").toString());
    }

    public final void l(int i5, byte[] source) {
        Intrinsics.g(source, "source");
        int i11 = 0;
        n.a(source.length, 0, i5);
        while (i11 < i5) {
            h hVarH = h();
            byte[] bArr = hVarH.f52260a;
            int iMin = Math.min(i5 - i11, bArr.length - hVarH.f52262c) + i11;
            u90.b.q(source, hVarH.f52262c, bArr, i11, iMin);
            hVarH.f52262c = (iMin - i11) + hVarH.f52262c;
            i11 = iMin;
        }
        this.f52247c += i5;
    }

    @Override // e80.k
    public final void m(long j11) throws EOFException {
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: ").toString());
        }
        if (this.f52247c >= j11) {
            return;
        }
        throw new EOFException("Buffer doesn't contain required number of bytes (size: " + this.f52247c + ", required: " + j11 + ')');
    }

    public final void p(a aVar, long j11) {
        h hVarB;
        if (aVar == this) {
            throw new IllegalArgumentException("source == this");
        }
        n.b(aVar.f52247c, j11);
        while (j11 > 0) {
            Intrinsics.d(aVar.f52245a);
            int i5 = 0;
            if (j11 < r0.a()) {
                h hVar = this.f52246b;
                if (hVar != null && hVar.f52264e) {
                    long j12 = hVar.f52262c + j11;
                    l0 l0Var = hVar.f52263d;
                    if (j12 - (l0Var != null ? l0Var.G() : false ? 0 : hVar.f52261b) <= 8192) {
                        h hVar2 = aVar.f52245a;
                        Intrinsics.d(hVar2);
                        hVar2.e(hVar, (int) j11);
                        aVar.f52247c -= j11;
                        this.f52247c += j11;
                        return;
                    }
                }
                h hVar3 = aVar.f52245a;
                Intrinsics.d(hVar3);
                int i11 = (int) j11;
                if (i11 <= 0 || i11 > hVar3.f52262c - hVar3.f52261b) {
                    throw new IllegalArgumentException("byteCount out of range");
                }
                if (i11 >= 1024) {
                    hVarB = hVar3.d();
                } else {
                    hVarB = i.b();
                    byte[] bArr = hVar3.f52260a;
                    byte[] bArr2 = hVarB.f52260a;
                    int i12 = hVar3.f52261b;
                    u90.b.v(bArr, i12, bArr2, i12 + i11, 2);
                }
                hVarB.f52262c = hVarB.f52261b + i11;
                hVar3.f52261b += i11;
                h hVar4 = hVar3.f52266g;
                if (hVar4 != null) {
                    hVar4.c(hVarB);
                } else {
                    hVarB.f52265f = hVar3;
                    hVar3.f52266g = hVarB;
                }
                aVar.f52245a = hVarB;
            }
            h hVar5 = aVar.f52245a;
            Intrinsics.d(hVar5);
            long jA = hVar5.a();
            h hVarB2 = hVar5.b();
            aVar.f52245a = hVarB2;
            if (hVarB2 == null) {
                aVar.f52246b = null;
            }
            if (this.f52245a == null) {
                this.f52245a = hVar5;
                this.f52246b = hVar5;
            } else {
                h hVar6 = this.f52246b;
                Intrinsics.d(hVar6);
                hVar6.c(hVar5);
                h hVar7 = hVar5.f52266g;
                if (hVar7 == null) {
                    throw new IllegalStateException("cannot compact");
                }
                if (hVar7.f52264e) {
                    int i13 = hVar5.f52262c - hVar5.f52261b;
                    Intrinsics.d(hVar7);
                    int i14 = 8192 - hVar7.f52262c;
                    h hVar8 = hVar5.f52266g;
                    Intrinsics.d(hVar8);
                    l0 l0Var2 = hVar8.f52263d;
                    if (!(l0Var2 != null ? l0Var2.G() : false)) {
                        h hVar9 = hVar5.f52266g;
                        Intrinsics.d(hVar9);
                        i5 = hVar9.f52261b;
                    }
                    if (i13 <= i14 + i5) {
                        h hVar10 = hVar5.f52266g;
                        Intrinsics.d(hVar10);
                        hVar5.e(hVar10, i13);
                        if (hVar5.b() != null) {
                            throw new IllegalStateException("Check failed.");
                        }
                        i.a(hVar5);
                        hVar5 = hVar10;
                    }
                }
                this.f52246b = hVar5;
                if (hVar5.f52266g == null) {
                    this.f52245a = hVar5;
                }
            }
            aVar.f52247c -= jA;
            this.f52247c += jA;
            j11 -= jA;
        }
    }

    @Override // e80.k
    public final byte readByte() throws EOFException {
        h hVar = this.f52245a;
        if (hVar == null) {
            throw new EOFException(a2.c.i(this.f52247c, ", required: 1)", new StringBuilder("Buffer doesn't contain required number of bytes (size: ")));
        }
        int iA = hVar.a();
        if (iA == 0) {
            d();
            return readByte();
        }
        byte[] bArr = hVar.f52260a;
        int i5 = hVar.f52261b;
        hVar.f52261b = i5 + 1;
        byte b11 = bArr[i5];
        this.f52247c--;
        if (iA == 1) {
            d();
        }
        return b11;
    }

    public final void s(byte b11) {
        h hVarH = h();
        byte[] bArr = hVarH.f52260a;
        int i5 = hVarH.f52262c;
        hVarH.f52262c = i5 + 1;
        bArr[i5] = b11;
        this.f52247c++;
    }

    public final void skip(long j11) {
        if (j11 < 0) {
            throw new IllegalArgumentException(c1.o(j11, "byteCount (", ") < 0").toString());
        }
        long j12 = j11;
        while (j12 > 0) {
            h hVar = this.f52245a;
            if (hVar == null) {
                throw new EOFException(c1.o(j11, "Buffer exhausted before skipping ", " bytes."));
            }
            int iMin = (int) Math.min(j12, hVar.f52262c - hVar.f52261b);
            long j13 = iMin;
            this.f52247c -= j13;
            j12 -= j13;
            int i5 = hVar.f52261b + iMin;
            hVar.f52261b = i5;
            if (i5 == hVar.f52262c) {
                d();
            }
        }
    }

    public final String toString() {
        long j11 = this.f52247c;
        if (j11 == 0) {
            return "Buffer(size=0)";
        }
        long j12 = 64;
        int iMin = (int) Math.min(j12, j11);
        StringBuilder sb2 = new StringBuilder((iMin * 2) + (this.f52247c > j12 ? 1 : 0));
        int i5 = 0;
        for (h hVar = this.f52245a; hVar != null; hVar = hVar.f52265f) {
            int i11 = 0;
            while (i5 < iMin && i11 < hVar.a()) {
                int i12 = i11 + 1;
                byte bT = h80.a.f59541a.t(hVar, i11);
                i5++;
                char[] cArr = n.f52274a;
                sb2.append(cArr[(bT >> 4) & 15]);
                sb2.append(cArr[bT & 15]);
                i11 = i12;
            }
        }
        if (this.f52247c > j12) {
            sb2.append((char) 8230);
        }
        return "Buffer(size=" + this.f52247c + " hex=" + ((Object) sb2) + ')';
    }
}
