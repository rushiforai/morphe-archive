package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zhg extends big implements Serializable {
    public final long b;

    public zhg(long j) {
        this.b = j;
    }

    @Override // defpackage.big
    public final int a() {
        return 64;
    }

    @Override // defpackage.big
    public final byte[] b() {
        return new byte[]{(byte) this.b, (byte) (r0 >> 8), (byte) (r0 >> 16), (byte) (r0 >> 24), (byte) (r0 >> 32), (byte) (r0 >> 40), (byte) (r0 >> 48), (byte) (r0 >> 56)};
    }

    @Override // defpackage.big
    public final int c() {
        return (int) this.b;
    }

    @Override // defpackage.big
    public final long d() {
        return this.b;
    }

    @Override // defpackage.big
    public final boolean f(big bigVar) {
        return this.b == bigVar.d();
    }
}
