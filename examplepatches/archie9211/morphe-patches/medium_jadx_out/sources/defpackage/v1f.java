package defpackage;

import com.drew.metadata.exif.ExifDirectoryBase;
import java.io.Closeable;
import java.io.IOException;
import java.util.Random;
import java.util.zip.Deflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v1f implements Closeable {
    public final xua a;
    public final Random b;
    public final boolean c;
    public final boolean d;
    public final long e;
    public final kz0 g;
    public boolean h;
    public xy7 i;
    public final kz0 f = new kz0();
    public final byte[] j = new byte[4];
    public final hz0 k = new hz0();

    public v1f(xua xuaVar, Random random, boolean z, boolean z2, long j) {
        this.a = xuaVar;
        this.b = random;
        this.c = z;
        this.d = z2;
        this.e = j;
        this.g = xuaVar.b;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        xy7 xy7Var = this.i;
        if (xy7Var != null) {
            egf.b(xy7Var);
        }
        egf.b(this.a);
    }

    public final void f(int i, h21 h21Var) throws IOException {
        if (this.h) {
            ik4.g("closed");
            return;
        }
        int iE = h21Var.e();
        if (iE > 125) {
            ay0.e("Payload size must be less than or equal to 125");
            return;
        }
        kz0 kz0Var = this.g;
        kz0Var.K0(i | 128);
        kz0Var.K0(iE | 128);
        byte[] bArr = this.j;
        bArr.getClass();
        this.b.nextBytes(bArr);
        kz0Var.write(bArr, 0, bArr.length);
        if (iE > 0) {
            long j = kz0Var.b;
            kz0Var.J0(h21Var);
            hz0 hz0Var = this.k;
            hz0Var.getClass();
            kz0Var.T(hz0Var);
            hz0Var.m(j);
            iq7.U(hz0Var, bArr);
            hz0Var.close();
        }
        this.a.flush();
    }

    public final void m(int i, h21 h21Var) throws IOException {
        if (this.h) {
            ik4.g("closed");
            return;
        }
        kz0 kz0Var = this.f;
        kz0Var.J0(h21Var);
        int i2 = i | 128;
        if (this.c && h21Var.e() >= this.e) {
            xy7 xy7Var = this.i;
            if (xy7Var == null) {
                xy7Var = new xy7(0, this.d);
                this.i = xy7Var;
            }
            w33 w33Var = (w33) xy7Var.e;
            kz0 kz0Var2 = xy7Var.c;
            if (kz0Var2.b != 0) {
                ay0.e("Failed requirement.");
                return;
            }
            if (xy7Var.b) {
                ((Deflater) xy7Var.d).reset();
            }
            w33Var.c0(kz0Var, kz0Var.b);
            w33Var.flush();
            h21 h21Var2 = yy7.a;
            if (kz0Var2.R(h21Var2.e(), kz0Var2.b - ((long) h21Var2.a.length), h21Var2)) {
                long j = kz0Var2.b - 4;
                hz0 hz0VarT = kz0Var2.T(dm2.b);
                try {
                    hz0VarT.f(j);
                    hz0VarT.close();
                } finally {
                }
            } else {
                kz0Var2.K0(0);
            }
            kz0Var.c0(kz0Var2, kz0Var2.b);
            i2 = i | 192;
        }
        long j2 = kz0Var.b;
        kz0 kz0Var3 = this.g;
        kz0Var3.K0(i2);
        if (j2 <= 125) {
            kz0Var3.K0(((int) j2) | 128);
        } else if (j2 <= 65535) {
            kz0Var3.K0(ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            kz0Var3.P0((int) j2);
        } else {
            kz0Var3.K0(255);
            kz0Var3.O0(j2);
        }
        byte[] bArr = this.j;
        bArr.getClass();
        this.b.nextBytes(bArr);
        kz0Var3.write(bArr, 0, bArr.length);
        if (j2 > 0) {
            hz0 hz0Var = this.k;
            hz0Var.getClass();
            kz0Var.T(hz0Var);
            hz0Var.m(0L);
            iq7.U(hz0Var, bArr);
            hz0Var.close();
        }
        kz0Var3.c0(kz0Var, j2);
        this.a.flush();
    }
}
