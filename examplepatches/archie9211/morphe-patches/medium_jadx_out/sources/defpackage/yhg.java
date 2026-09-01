package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yhg extends big implements Serializable {
    public final byte[] b;

    public yhg(byte[] bArr) {
        bArr.getClass();
        this.b = bArr;
    }

    @Override // defpackage.big
    public final int a() {
        return this.b.length * 8;
    }

    @Override // defpackage.big
    public final byte[] b() {
        return (byte[]) this.b.clone();
    }

    @Override // defpackage.big
    public final int c() {
        byte[] bArr = this.b;
        int length = bArr.length;
        if (length >= 4) {
            return ((bArr[3] & 255) << 24) | (bArr[0] & 255) | ((bArr[1] & 255) << 8) | ((bArr[2] & 255) << 16);
        }
        ygf.f(mq7.H("HashCode#asInt() requires >= 4 bytes (it only has %s bytes).", Integer.valueOf(length)));
        return 0;
    }

    @Override // defpackage.big
    public final long d() {
        byte[] bArr = this.b;
        int length = bArr.length;
        if (!(length >= 8)) {
            ygf.f(mq7.H("HashCode#asLong() requires >= 8 bytes (it only has %s bytes).", Integer.valueOf(length)));
            return 0L;
        }
        long j = bArr[0] & 255;
        for (int i = 1; i < Math.min(bArr.length, 8); i++) {
            j |= (((long) bArr[i]) & 255) << (i * 8);
        }
        return j;
    }

    @Override // defpackage.big
    public final byte[] e() {
        return this.b;
    }

    @Override // defpackage.big
    public final boolean f(big bigVar) {
        int length = bigVar.e().length;
        byte[] bArr = this.b;
        if (bArr.length != length) {
            return false;
        }
        boolean z = true;
        for (int i = 0; i < bArr.length; i++) {
            z &= bArr[i] == bigVar.e()[i];
        }
        return z;
    }
}
