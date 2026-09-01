package defpackage;

import java.io.IOException;
import java.util.zip.CRC32;
import java.util.zip.Inflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xh5 implements ikc {
    public byte a;
    public final yua b;
    public final Inflater c;
    public final o16 d;
    public final CRC32 e;

    public xh5(zz0 zz0Var) {
        zz0Var.getClass();
        yua yuaVar = new yua(zz0Var);
        this.b = yuaVar;
        Inflater inflater = new Inflater(true);
        this.c = inflater;
        this.d = new o16(yuaVar, inflater);
        this.e = new CRC32();
    }

    public static void f(int i, int i2, String str) throws IOException {
        if (i2 == i) {
            return;
        }
        throw new IOException(str + ": actual 0x" + muc.h0(8, dm2.d0(i2)) + " != expected 0x" + muc.h0(8, dm2.d0(i)));
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return this.b.a.b();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.d.close();
    }

    public final void m(kz0 kz0Var, long j, long j2) {
        iwb iwbVar = kz0Var.a;
        iwbVar.getClass();
        while (true) {
            long j3 = iwbVar.c - iwbVar.b;
            if (j < j3) {
                break;
            }
            j -= j3;
            iwbVar = iwbVar.f;
            iwbVar.getClass();
        }
        while (j2 > 0) {
            int i = (int) (((long) iwbVar.b) + j);
            int iMin = (int) Math.min(iwbVar.c - i, j2);
            this.e.update(iwbVar.a, i, iMin);
            j2 -= (long) iMin;
            iwbVar = iwbVar.f;
            iwbVar.getClass();
            j = 0;
        }
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        byte b;
        kz0 kz0Var2;
        xh5 xh5Var = this;
        yua yuaVar = xh5Var.b;
        kz0 kz0Var3 = yuaVar.b;
        kz0Var.getClass();
        if (j < 0) {
            ywb.g(ho2.D(j, "byteCount < 0: "));
            return 0L;
        }
        if (j == 0) {
            return 0L;
        }
        byte b2 = xh5Var.a;
        CRC32 crc32 = xh5Var.e;
        if (b2 == 0) {
            yuaVar.x0(10L);
            byte bL = kz0Var3.L(3L);
            boolean z = ((bL >> 1) & 1) == 1;
            if (z) {
                xh5Var.m(kz0Var3, 0L, 10L);
            }
            f(8075, yuaVar.B(), "ID1ID2");
            yuaVar.skip(8L);
            if (((bL >> 2) & 1) == 1) {
                yuaVar.x0(2L);
                if (z) {
                    m(kz0Var3, 0L, 2L);
                }
                long jE0 = kz0Var3.E0() & 65535;
                yuaVar.x0(jE0);
                if (z) {
                    m(kz0Var3, 0L, jE0);
                }
                kz0Var2 = kz0Var3;
                yuaVar.skip(jE0);
            } else {
                kz0Var2 = kz0Var3;
            }
            if (((bL >> 3) & 1) == 1) {
                long jF = yuaVar.f((byte) 0, 0L, Long.MAX_VALUE);
                if (jF == -1) {
                    ay0.b();
                    return 0L;
                }
                if (z) {
                    m(kz0Var2, 0L, jF + 1);
                }
                yuaVar.skip(jF + 1);
            }
            if (((bL >> 4) & 1) == 1) {
                long jF2 = yuaVar.f((byte) 0, 0L, Long.MAX_VALUE);
                if (jF2 == -1) {
                    ay0.b();
                    return 0L;
                }
                if (z) {
                    xh5Var = this;
                    xh5Var.m(kz0Var2, 0L, jF2 + 1);
                } else {
                    xh5Var = this;
                }
                yuaVar.skip(jF2 + 1);
            } else {
                xh5Var = this;
            }
            if (z) {
                f(yuaVar.D(), (short) crc32.getValue(), "FHCRC");
                crc32.reset();
            }
            xh5Var.a = (byte) 1;
            b2 = 1;
        }
        if (b2 == 1) {
            long j2 = kz0Var.b;
            long jQ0 = xh5Var.d.q0(kz0Var, j);
            if (jQ0 != -1) {
                xh5Var.m(kz0Var, j2, jQ0);
                return jQ0;
            }
            b = 2;
            xh5Var.a = (byte) 2;
            b2 = 2;
        } else {
            b = 2;
        }
        if (b2 == b) {
            f(yuaVar.i0(), (int) crc32.getValue(), "CRC");
            f(yuaVar.i0(), (int) xh5Var.c.getBytesWritten(), "ISIZE");
            xh5Var.a = (byte) 3;
            if (!yuaVar.H()) {
                ik4.g("gzip finished without exhausting source");
                return 0L;
            }
        }
        return -1L;
    }
}
