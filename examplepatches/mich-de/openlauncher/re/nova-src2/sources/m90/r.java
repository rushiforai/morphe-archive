package m90;

import b.u4;
import java.io.EOFException;
import java.io.IOException;
import java.util.Arrays;
import java.util.zip.CRC32;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public byte f76156a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f76157b;

    /* renamed from: c, reason: collision with root package name */
    public final Inflater f76158c;

    /* renamed from: d, reason: collision with root package name */
    public final s f76159d;

    /* renamed from: e, reason: collision with root package name */
    public final CRC32 f76160e;

    public r(j0 source) {
        Intrinsics.g(source, "source");
        d0 d0Var = new d0(source);
        this.f76157b = d0Var;
        Inflater inflater = new Inflater(true);
        this.f76158c = inflater;
        this.f76159d = new s(d0Var, inflater);
        this.f76160e = new CRC32();
    }

    public static void a(int i5, int i11, String str) throws IOException {
        if (i11 != i5) {
            throw new IOException(String.format("%s: actual 0x%08x != expected 0x%08x", Arrays.copyOf(new Object[]{str, Integer.valueOf(i11), Integer.valueOf(i5)}, 3)));
        }
    }

    public final void b(g gVar, long j11, long j12) {
        e0 e0Var = gVar.f76125a;
        Intrinsics.d(e0Var);
        while (true) {
            int i5 = e0Var.f76117c;
            int i11 = e0Var.f76116b;
            if (j11 < i5 - i11) {
                break;
            }
            j11 -= i5 - i11;
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
        }
        while (j12 > 0) {
            int iMin = (int) Math.min(e0Var.f76117c - r6, j12);
            this.f76160e.update(e0Var.f76115a, (int) (e0Var.f76116b + j11), iMin);
            j12 -= iMin;
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j11 = 0;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f76159d.close();
    }

    @Override // m90.j0
    public final long read(g sink, long j11) throws DataFormatException, IOException {
        r rVar = this;
        Intrinsics.g(sink, "sink");
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        if (j11 == 0) {
            return 0L;
        }
        byte b11 = rVar.f76156a;
        CRC32 crc32 = rVar.f76160e;
        d0 d0Var = rVar.f76157b;
        if (b11 == 0) {
            d0Var.m(10L);
            g gVar = d0Var.f76105b;
            byte bF = gVar.f(3L);
            boolean z11 = ((bF >> 1) & 1) == 1;
            if (z11) {
                rVar.b(gVar, 0L, 10L);
            }
            a(8075, d0Var.readShort(), "ID1ID2");
            d0Var.skip(8L);
            if (((bF >> 2) & 1) == 1) {
                d0Var.m(2L);
                if (z11) {
                    b(gVar, 0L, 2L);
                }
                long jK = gVar.K() & 65535;
                d0Var.m(jK);
                if (z11) {
                    b(gVar, 0L, jK);
                }
                d0Var.skip(jK);
            }
            if (((bF >> 3) & 1) == 1) {
                long jA = d0Var.a((byte) 0, 0L, Long.MAX_VALUE);
                if (jA == -1) {
                    throw new EOFException();
                }
                if (z11) {
                    b(gVar, 0L, jA + 1);
                }
                d0Var.skip(jA + 1);
            }
            if (((bF >> 4) & 1) == 1) {
                long jA2 = d0Var.a((byte) 0, 0L, Long.MAX_VALUE);
                if (jA2 == -1) {
                    throw new EOFException();
                }
                if (z11) {
                    rVar = this;
                    rVar.b(gVar, 0L, jA2 + 1);
                } else {
                    rVar = this;
                }
                d0Var.skip(jA2 + 1);
            } else {
                rVar = this;
            }
            if (z11) {
                a(d0Var.e(), (short) crc32.getValue(), "FHCRC");
                crc32.reset();
            }
            rVar.f76156a = (byte) 1;
        }
        if (rVar.f76156a == 1) {
            long j12 = sink.f76126b;
            long j13 = rVar.f76159d.read(sink, j11);
            if (j13 != -1) {
                rVar.b(sink, j12, j13);
                return j13;
            }
            rVar.f76156a = (byte) 2;
        }
        if (rVar.f76156a == 2) {
            a(d0Var.c(), (int) crc32.getValue(), "CRC");
            a(d0Var.c(), (int) rVar.f76158c.getBytesWritten(), "ISIZE");
            rVar.f76156a = (byte) 3;
            if (!d0Var.N()) {
                throw new IOException("gzip finished without exhausting source");
            }
        }
        return -1L;
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f76157b.f76104a.timeout();
    }
}
