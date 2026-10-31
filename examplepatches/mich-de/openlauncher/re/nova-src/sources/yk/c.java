package yk;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: d, reason: collision with root package name */
    public long f97371d;

    /* renamed from: e, reason: collision with root package name */
    public long f97372e;

    /* renamed from: a, reason: collision with root package name */
    public final ByteBuffer f97368a = ByteBuffer.allocate(23).order(ByteOrder.LITTLE_ENDIAN);

    /* renamed from: b, reason: collision with root package name */
    public final int f97369b = 16;

    /* renamed from: c, reason: collision with root package name */
    public final int f97370c = 16;

    /* renamed from: f, reason: collision with root package name */
    public int f97373f = 0;

    public c() {
        long j11 = 0;
        this.f97371d = j11;
        this.f97372e = j11;
    }

    public final void a() {
        ByteBuffer byteBuffer = this.f97368a;
        byteBuffer.flip();
        while (byteBuffer.remaining() >= this.f97370c) {
            b(byteBuffer);
        }
        byteBuffer.compact();
    }

    public final void b(ByteBuffer byteBuffer) {
        long j11 = byteBuffer.getLong();
        long j12 = byteBuffer.getLong();
        long jRotateLeft = (Long.rotateLeft(j11 * (-8663945395140668459L), 31) * 5545529020109919103L) ^ this.f97371d;
        this.f97371d = jRotateLeft;
        long jRotateLeft2 = Long.rotateLeft(jRotateLeft, 27);
        long j13 = this.f97372e;
        this.f97371d = ((jRotateLeft2 + j13) * 5) + 1390208809;
        long jRotateLeft3 = (Long.rotateLeft(j12 * 5545529020109919103L, 33) * (-8663945395140668459L)) ^ j13;
        this.f97372e = jRotateLeft3;
        this.f97372e = ((Long.rotateLeft(jRotateLeft3, 31) + this.f97371d) * 5) + 944331445;
        this.f97373f += 16;
    }

    public final c c(byte[] bArr) {
        ByteBuffer byteBufferOrder = ByteBuffer.wrap(bArr, 0, bArr.length).order(ByteOrder.LITTLE_ENDIAN);
        int iRemaining = byteBufferOrder.remaining();
        ByteBuffer byteBuffer = this.f97368a;
        if (iRemaining <= byteBuffer.remaining()) {
            byteBuffer.put(byteBufferOrder);
            if (byteBuffer.remaining() < 8) {
                a();
            }
            return this;
        }
        int iPosition = this.f97369b - byteBuffer.position();
        for (int i5 = 0; i5 < iPosition; i5++) {
            byteBuffer.put(byteBufferOrder.get());
        }
        a();
        while (byteBufferOrder.remaining() >= this.f97370c) {
            b(byteBufferOrder);
        }
        byteBuffer.put(byteBufferOrder);
        return this;
    }
}
