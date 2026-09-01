package defpackage;

import java.io.Closeable;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u5e implements Closeable {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ u5e(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public final void B(aq7 aq7Var) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                aq7Var.w();
                break;
            default:
                ((u5e) obj).B(aq7Var);
                break;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        switch (this.a) {
            case 1:
                ((u5e) this.b).close();
                break;
        }
    }

    public final long m() {
        switch (this.a) {
            case 0:
                return ((ByteBuffer) this.b).limit();
            default:
                return ((u5e) this.b).m();
        }
    }

    public final void p(aq7 aq7Var, ByteBuffer byteBuffer) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ByteBuffer byteBuffer2 = (ByteBuffer) obj;
                if (!byteBuffer.hasRemaining()) {
                    ygf.f("Cronet passed a buffer with no bytes remaining");
                } else {
                    if (byteBuffer.remaining() >= byteBuffer2.remaining()) {
                        byteBuffer.put(byteBuffer2);
                    } else {
                        int iLimit = byteBuffer2.limit();
                        byteBuffer.put(byteBuffer2);
                    }
                    aq7Var.v();
                }
                break;
            default:
                ((u5e) obj).p(aq7Var, byteBuffer);
                break;
        }
    }

    public final void f() {
    }
}
