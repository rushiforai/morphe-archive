package e80;

import b.u4;
import h6.c1;
import java.io.EOFException;

/* loaded from: classes5.dex */
public final class f implements k {

    /* renamed from: a, reason: collision with root package name */
    public final d f52255a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f52256b;

    /* renamed from: c, reason: collision with root package name */
    public final a f52257c = new a();

    public f(d dVar) {
        this.f52255a = dVar;
    }

    @Override // e80.e
    public final long B(a aVar, long j11) {
        if (this.f52256b) {
            throw new IllegalStateException("Source is closed.");
        }
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: ").toString());
        }
        a aVar2 = this.f52257c;
        if (aVar2.f52247c == 0 && this.f52255a.B(aVar2, 8192L) == -1) {
            return -1L;
        }
        return aVar2.B(aVar, Math.min(j11, aVar2.f52247c));
    }

    @Override // e80.k
    public final boolean N() {
        if (this.f52256b) {
            throw new IllegalStateException("Source is closed.");
        }
        a aVar = this.f52257c;
        return aVar.N() && this.f52255a.B(aVar, 8192L) == -1;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        if (this.f52256b) {
            return;
        }
        this.f52256b = true;
        this.f52255a.f52253e = true;
        a aVar = this.f52257c;
        aVar.skip(aVar.f52247c);
    }

    @Override // e80.k
    public final a i() {
        return this.f52257c;
    }

    @Override // e80.k
    public final boolean j(long j11) {
        a aVar;
        if (this.f52256b) {
            throw new IllegalStateException("Source is closed.");
        }
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: ").toString());
        }
        do {
            aVar = this.f52257c;
            if (aVar.f52247c >= j11) {
                return true;
            }
        } while (this.f52255a.B(aVar, 8192L) != -1);
        return false;
    }

    @Override // e80.k
    public final void m(long j11) throws EOFException {
        if (!j(j11)) {
            throw new EOFException(c1.o(j11, "Source doesn't contain required number of bytes (", ")."));
        }
    }

    @Override // e80.k
    public final byte readByte() throws EOFException {
        m(1L);
        return this.f52257c.readByte();
    }

    public final String toString() {
        return "buffered(" + this.f52255a + ')';
    }
}
