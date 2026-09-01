package defpackage;

import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayDeque;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u7g implements Closeable {
    public final ByteArrayInputStream a;
    public r7g b;
    public final byte[] c = new byte[8];
    public final eoc d = new eoc(10);

    public u7g(ByteArrayInputStream byteArrayInputStream) {
        this.a = byteArrayInputStream;
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x008d, code lost:
    
        if (r2 != (-2)) goto L42;
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00cb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.r7g B() {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u7g.B():r7g");
    }

    public final boolean D() {
        N((byte) -32);
        if (this.b.b > 24) {
            ygf.f("expected simple value");
            return false;
        }
        int I = (int) I();
        if (I == 20) {
            return false;
        }
        if (I == 21) {
            return true;
        }
        ygf.f("expected FALSE or TRUE");
        return false;
    }

    public final long I() throws IOException {
        r7g r7gVar = this.b;
        byte b = r7gVar.b;
        if (b < 24) {
            long j = b;
            this.b = null;
            return j;
        }
        if (b == 24) {
            int i = this.a.read();
            if (i != -1) {
                this.b = null;
                return ((long) i) & 255;
            }
            ay0.b();
            return 0L;
        }
        byte[] bArr = this.c;
        if (b == 25) {
            Q(2, bArr);
            return ((((long) bArr[0]) & 255) << 8) | (((long) bArr[1]) & 255);
        }
        if (b == 26) {
            Q(4, bArr);
            return ((((long) bArr[0]) & 255) << 24) | ((((long) bArr[1]) & 255) << 16) | ((((long) bArr[2]) & 255) << 8) | (((long) bArr[3]) & 255);
        }
        if (b != 27) {
            ik4.g(ev6.v("invalid additional information ", b, (r7gVar.a >> 5) & 7, " for major type "));
            return 0L;
        }
        Q(8, bArr);
        long j2 = bArr[0];
        long j3 = bArr[1];
        long j4 = bArr[2];
        long j5 = bArr[3];
        return (((long) bArr[7]) & 255) | ((j2 & 255) << 56) | ((j3 & 255) << 48) | ((j4 & 255) << 40) | ((j5 & 255) << 32) | ((bArr[4] & 255) << 24) | ((bArr[5] & 255) << 16) | ((bArr[6] & 255) << 8);
    }

    public final void L() {
        B();
        byte b = this.b.b;
        if (b != 31) {
            return;
        }
        ygf.f(b09.w(b, "expected definite length but found "));
    }

    public final void N(byte b) {
        B();
        byte b2 = this.b.a;
        if (b2 == b) {
            return;
        }
        ygf.f(ev6.v("expected major type ", (b >> 5) & 7, (b2 >> 5) & 7, " but found "));
    }

    public final void Q(int i, byte[] bArr) throws IOException {
        int i2 = 0;
        while (i2 != i) {
            int i3 = this.a.read(bArr, i2, i - i2);
            if (i3 == -1) {
                ay0.b();
                return;
            }
            i2 += i3;
        }
        this.b = null;
    }

    public final byte[] R() {
        L();
        long jI = I();
        if (jI < 0 || jI > 2147483647L) {
            ik4.k("the maximum supported byte/text string length is 2147483647 bytes");
            return null;
        }
        if (this.a.available() < jI) {
            ay0.b();
            return null;
        }
        int i = (int) jI;
        byte[] bArr = new byte[i];
        Q(i, bArr);
        return bArr;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.a.close();
        this.d.g();
    }

    public final long f() {
        N((byte) -128);
        L();
        long jI = I();
        if (jI < 0) {
            ik4.k("the maximum supported array length is 9223372036854775807");
            return 0L;
        }
        if (jI > 0) {
            ((ArrayDeque) this.d.a).push(Long.valueOf(jI));
        }
        return jI;
    }

    public final long m() {
        boolean z;
        B();
        byte b = this.b.a;
        if (b == 0) {
            z = true;
        } else {
            if (b != 32) {
                ygf.f(b09.w((b >> 5) & 7, "expected major type 0 or 1 but found "));
                return 0L;
            }
            z = false;
        }
        long jI = I();
        if (jI >= 0) {
            return z ? jI : ~jI;
        }
        ik4.k("the maximum supported unsigned/negative integer is 9223372036854775807");
        return 0L;
    }

    public final long p() {
        N((byte) -96);
        L();
        long jI = I();
        if (jI < 0 || jI > 4611686018427387903L) {
            ik4.k("the maximum supported map length is 4611686018427387903L");
            return 0L;
        }
        if (jI > 0) {
            ((ArrayDeque) this.d.a).push(Long.valueOf(jI + jI));
        }
        return jI;
    }
}
