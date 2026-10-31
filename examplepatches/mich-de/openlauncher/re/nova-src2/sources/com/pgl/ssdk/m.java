package com.pgl.ssdk;

import b.c0;
import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/* loaded from: classes4.dex */
public class m implements q {

    /* renamed from: a, reason: collision with root package name */
    private final FileChannel f42369a;

    /* renamed from: b, reason: collision with root package name */
    private final long f42370b;

    /* renamed from: c, reason: collision with root package name */
    private final long f42371c;

    public m(FileChannel fileChannel, long j11, long j12) {
        if (j11 < 0) {
            throw new IndexOutOfBoundsException("offset: ".concat(String.valueOf(j12)));
        }
        if (j12 < 0) {
            throw new IndexOutOfBoundsException("size: ".concat(String.valueOf(j12)));
        }
        this.f42369a = fileChannel;
        this.f42370b = j11;
        this.f42371c = j12;
    }

    @Override // com.pgl.ssdk.q
    public long a() {
        long j11 = this.f42371c;
        if (j11 != -1) {
            return j11;
        }
        try {
            return this.f42369a.size();
        } catch (IOException unused) {
            return 0L;
        }
    }

    @Override // com.pgl.ssdk.q
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public m a(long j11, long j12) {
        long jA = a();
        a(j11, j12, jA);
        return (j11 == 0 && j12 == jA) ? this : new m(this.f42369a, this.f42370b + j11, j12);
    }

    @Override // com.pgl.ssdk.q
    public ByteBuffer a(long j11, int i5) {
        if (i5 < 0) {
            throw new IndexOutOfBoundsException("size: ".concat(String.valueOf(i5)));
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(i5);
        a(j11, i5, byteBufferAllocate);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    public void a(long j11, int i5, ByteBuffer byteBuffer) {
        int i11;
        a(j11, i5, a());
        if (i5 == 0) {
            return;
        }
        if (i5 > byteBuffer.remaining()) {
            throw new BufferOverflowException();
        }
        long j12 = this.f42370b + j11;
        int iLimit = byteBuffer.limit();
        try {
            byteBuffer.limit(byteBuffer.position() + i5);
            while (i5 > 0) {
                synchronized (this.f42369a) {
                    this.f42369a.position(j12);
                    i11 = this.f42369a.read(byteBuffer);
                }
                j12 += i11;
                i5 -= i11;
            }
        } finally {
            byteBuffer.limit(iLimit);
        }
    }

    private static void a(long j11, long j12, long j13) {
        if (j11 < 0) {
            throw new IndexOutOfBoundsException("offset: ".concat(String.valueOf(j11)));
        }
        if (j12 < 0) {
            throw new IndexOutOfBoundsException("size: ".concat(String.valueOf(j12)));
        }
        if (j11 > j13) {
            throw new IndexOutOfBoundsException(a2.c.i(j13, ")", c0.u(j11, "offset (", ") > source size (")));
        }
        long j14 = j11 + j12;
        if (j14 < j11) {
            throw new IndexOutOfBoundsException(a2.c.i(j12, ") overflow", c0.u(j11, "offset (", ") + size (")));
        }
        if (j14 <= j13) {
            return;
        }
        StringBuilder sbU = c0.u(j11, "offset (", ") + size (");
        sbU.append(j12);
        sbU.append(") > source size (");
        sbU.append(j13);
        sbU.append(")");
        throw new IndexOutOfBoundsException(sbU.toString());
    }
}
