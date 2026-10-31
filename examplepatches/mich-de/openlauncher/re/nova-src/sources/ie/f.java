package ie;

import com.google.android.exoplayer2.decoder.DecoderInputBuffer$InsufficientCapacityException;
import fe.i0;
import h6.c1;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public class f extends a {

    /* renamed from: c, reason: collision with root package name */
    public final c f61579c = new c();

    /* renamed from: d, reason: collision with root package name */
    public ByteBuffer f61580d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f61581e;

    /* renamed from: f, reason: collision with root package name */
    public long f61582f;

    /* renamed from: g, reason: collision with root package name */
    public ByteBuffer f61583g;

    /* renamed from: h, reason: collision with root package name */
    public final int f61584h;

    static {
        i0.a("goog.exo.decoder");
    }

    public f(int i5) {
        this.f61584h = i5;
    }

    public void q() {
        this.f61556b = 0;
        ByteBuffer byteBuffer = this.f61580d;
        if (byteBuffer != null) {
            byteBuffer.clear();
        }
        ByteBuffer byteBuffer2 = this.f61583g;
        if (byteBuffer2 != null) {
            byteBuffer2.clear();
        }
        this.f61581e = false;
    }

    public final ByteBuffer t(int i5) {
        int i11 = this.f61584h;
        if (i11 == 1) {
            return ByteBuffer.allocate(i5);
        }
        if (i11 == 2) {
            return ByteBuffer.allocateDirect(i5);
        }
        ByteBuffer byteBuffer = this.f61580d;
        throw new DecoderInputBuffer$InsufficientCapacityException(c1.n(byteBuffer == null ? 0 : byteBuffer.capacity(), "Buffer too small (", " < ", i5, ")"));
    }

    public final void u(int i5) {
        ByteBuffer byteBuffer = this.f61580d;
        if (byteBuffer == null) {
            this.f61580d = t(i5);
            return;
        }
        int iCapacity = byteBuffer.capacity();
        int iPosition = byteBuffer.position();
        int i11 = i5 + iPosition;
        if (iCapacity >= i11) {
            this.f61580d = byteBuffer;
            return;
        }
        ByteBuffer byteBufferT = t(i11);
        byteBufferT.order(byteBuffer.order());
        if (iPosition > 0) {
            byteBuffer.flip();
            byteBufferT.put(byteBuffer);
        }
        this.f61580d = byteBufferT;
    }

    public final void v() {
        ByteBuffer byteBuffer = this.f61580d;
        if (byteBuffer != null) {
            byteBuffer.flip();
        }
        ByteBuffer byteBuffer2 = this.f61583g;
        if (byteBuffer2 != null) {
            byteBuffer2.flip();
        }
    }
}
