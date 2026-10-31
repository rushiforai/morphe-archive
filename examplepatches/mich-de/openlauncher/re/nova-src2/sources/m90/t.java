package m90;

import java.io.Closeable;
import java.io.RandomAccessFile;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;

/* loaded from: classes5.dex */
public final class t implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f76165a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f76166b;

    /* renamed from: c, reason: collision with root package name */
    public int f76167c;

    /* renamed from: d, reason: collision with root package name */
    public final ReentrantLock f76168d = new ReentrantLock();

    /* renamed from: e, reason: collision with root package name */
    public final RandomAccessFile f76169e;

    public t(boolean z11, RandomAccessFile randomAccessFile) {
        this.f76165a = z11;
        this.f76169e = randomAccessFile;
    }

    public static k a(t tVar) {
        if (!tVar.f76165a) {
            throw new IllegalStateException("file handle is read-only");
        }
        ReentrantLock reentrantLock = tVar.f76168d;
        reentrantLock.lock();
        try {
            if (tVar.f76166b) {
                throw new IllegalStateException("closed");
            }
            tVar.f76167c++;
            reentrantLock.unlock();
            return new k(tVar);
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public final l b(long j11) {
        ReentrantLock reentrantLock = this.f76168d;
        reentrantLock.lock();
        try {
            if (this.f76166b) {
                throw new IllegalStateException("closed");
            }
            this.f76167c++;
            reentrantLock.unlock();
            return new l(this, j11);
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        ReentrantLock reentrantLock = this.f76168d;
        reentrantLock.lock();
        try {
            if (this.f76166b) {
                return;
            }
            this.f76166b = true;
            if (this.f76167c != 0) {
                return;
            }
            Unit unit = Unit.f71706a;
            synchronized (this) {
                this.f76169e.close();
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    public final void flush() {
        if (!this.f76165a) {
            throw new IllegalStateException("file handle is read-only");
        }
        ReentrantLock reentrantLock = this.f76168d;
        reentrantLock.lock();
        try {
            if (this.f76166b) {
                throw new IllegalStateException("closed");
            }
            Unit unit = Unit.f71706a;
            synchronized (this) {
                this.f76169e.getFD().sync();
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    public final long size() {
        long length;
        ReentrantLock reentrantLock = this.f76168d;
        reentrantLock.lock();
        try {
            if (this.f76166b) {
                throw new IllegalStateException("closed");
            }
            Unit unit = Unit.f71706a;
            synchronized (this) {
                length = this.f76169e.length();
            }
            return length;
        } finally {
            reentrantLock.unlock();
        }
    }
}
