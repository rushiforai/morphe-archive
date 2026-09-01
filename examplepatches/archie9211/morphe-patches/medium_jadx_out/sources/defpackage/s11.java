package defpackage;

import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s11 implements ikc {
    public final ByteBuffer a;
    public final int b;

    public s11(ByteBuffer byteBuffer) {
        ByteBuffer byteBufferSlice = byteBuffer.slice();
        this.a = byteBufferSlice;
        this.b = byteBufferSlice.capacity();
    }

    @Override // defpackage.ikc
    public final fmd b() {
        return fmd.d;
    }

    @Override // defpackage.ikc
    public final long q0(kz0 kz0Var, long j) {
        ByteBuffer byteBuffer = this.a;
        int iPosition = byteBuffer.position();
        int i = this.b;
        if (iPosition == i) {
            return -1L;
        }
        int iPosition2 = (int) (((long) byteBuffer.position()) + j);
        if (iPosition2 <= i) {
            i = iPosition2;
        }
        byteBuffer.limit(i);
        return kz0Var.write(byteBuffer);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }
}
