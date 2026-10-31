package m90;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class k implements h0 {

    /* renamed from: a, reason: collision with root package name */
    public final t f76134a;

    /* renamed from: b, reason: collision with root package name */
    public long f76135b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f76136c;

    public k(t fileHandle) {
        Intrinsics.g(fileHandle, "fileHandle");
        this.f76134a = fileHandle;
        this.f76135b = 0L;
    }

    @Override // m90.h0
    public final void Z(g source, long j11) {
        Intrinsics.g(source, "source");
        if (this.f76136c) {
            throw new IllegalStateException("closed");
        }
        t tVar = this.f76134a;
        long j12 = this.f76135b;
        tVar.getClass();
        com.google.android.gms.internal.consent_sdk.e0.v(source.f76126b, 0L, j11);
        long j13 = j12 + j11;
        while (j12 < j13) {
            e0 e0Var = source.f76125a;
            Intrinsics.d(e0Var);
            int iMin = (int) Math.min(j13 - j12, e0Var.f76117c - e0Var.f76116b);
            byte[] array = e0Var.f76115a;
            int i5 = e0Var.f76116b;
            synchronized (tVar) {
                Intrinsics.g(array, "array");
                tVar.f76169e.seek(j12);
                tVar.f76169e.write(array, i5, iMin);
            }
            int i11 = e0Var.f76116b + iMin;
            e0Var.f76116b = i11;
            long j14 = iMin;
            j12 += j14;
            source.f76126b -= j14;
            if (i11 == e0Var.f76117c) {
                source.f76125a = e0Var.a();
                f0.a(e0Var);
            }
        }
        this.f76135b += j11;
    }

    @Override // m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        t tVar = this.f76134a;
        if (this.f76136c) {
            return;
        }
        this.f76136c = true;
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

    @Override // m90.h0, java.io.Flushable
    public final void flush() {
        if (this.f76136c) {
            throw new IllegalStateException("closed");
        }
        t tVar = this.f76134a;
        synchronized (tVar) {
            tVar.f76169e.getFD().sync();
        }
    }

    @Override // m90.h0
    public final l0 timeout() {
        return l0.f76140d;
    }
}
