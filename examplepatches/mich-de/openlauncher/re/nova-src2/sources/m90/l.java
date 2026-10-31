package m90;

import b.u4;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class l implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final t f76137a;

    /* renamed from: b, reason: collision with root package name */
    public long f76138b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f76139c;

    public l(t tVar, long j11) {
        this.f76137a = tVar;
        this.f76138b = j11;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        t tVar = this.f76137a;
        if (this.f76139c) {
            return;
        }
        this.f76139c = true;
        ReentrantLock reentrantLock = tVar.f76168d;
        reentrantLock.lock();
        try {
            int i5 = tVar.f76167c - 1;
            tVar.f76167c = i5;
            if (i5 == 0 && tVar.f76166b) {
                Unit unit = Unit.f71706a;
                synchronized (tVar) {
                    tVar.f76169e.close();
                }
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // m90.j0
    public final long read(g sink, long j11) {
        long j12;
        long j13;
        int i5;
        Intrinsics.g(sink, "sink");
        if (this.f76139c) {
            throw new IllegalStateException("closed");
        }
        t tVar = this.f76137a;
        long j14 = this.f76138b;
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        long j15 = j11 + j14;
        long j16 = j14;
        while (true) {
            if (j16 >= j15) {
                j12 = -1;
                break;
            }
            e0 e0VarE0 = sink.e0(1);
            byte[] array = e0VarE0.f76115a;
            int i11 = e0VarE0.f76117c;
            j12 = -1;
            int iMin = (int) Math.min(j15 - j16, 8192 - i11);
            synchronized (tVar) {
                Intrinsics.g(array, "array");
                tVar.f76169e.seek(j16);
                i5 = 0;
                while (true) {
                    if (i5 >= iMin) {
                        break;
                    }
                    int i12 = tVar.f76169e.read(array, i11, iMin - i5);
                    if (i12 != -1) {
                        i5 += i12;
                    } else if (i5 == 0) {
                        i5 = -1;
                    }
                }
            }
            if (i5 == -1) {
                if (e0VarE0.f76116b == e0VarE0.f76117c) {
                    sink.f76125a = e0VarE0.a();
                    f0.a(e0VarE0);
                }
                if (j14 == j16) {
                    j13 = -1;
                }
            } else {
                e0VarE0.f76117c += i5;
                long j17 = i5;
                j16 += j17;
                sink.f76126b += j17;
            }
        }
        j13 = j16 - j14;
        if (j13 != j12) {
            this.f76138b += j13;
        }
        return j13;
    }

    @Override // m90.j0
    public final l0 timeout() {
        return l0.f76140d;
    }
}
