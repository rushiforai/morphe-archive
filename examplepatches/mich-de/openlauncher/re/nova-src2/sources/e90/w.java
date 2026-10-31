package e90;

import b.u4;
import h6.c1;
import java.io.IOException;
import java.io.InterruptedIOException;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;
import m90.l0;
import okhttp3.internal.http2.StreamResetException;

/* loaded from: classes.dex */
public final class w implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f52391a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f52392b;

    /* renamed from: c, reason: collision with root package name */
    public final m90.g f52393c = new m90.g();

    /* renamed from: d, reason: collision with root package name */
    public final m90.g f52394d = new m90.g();

    /* renamed from: e, reason: collision with root package name */
    public boolean f52395e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ y f52396f;

    public w(y yVar, long j11, boolean z11) {
        this.f52396f = yVar;
        this.f52391a = j11;
        this.f52392b = z11;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        long j11;
        y yVar = this.f52396f;
        synchronized (yVar) {
            this.f52395e = true;
            m90.g gVar = this.f52394d;
            j11 = gVar.f76126b;
            gVar.a();
            yVar.notifyAll();
            Unit unit = Unit.f71706a;
        }
        if (j11 > 0) {
            y yVar2 = this.f52396f;
            byte[] bArr = y80.c.f96853a;
            yVar2.f52399b.e(j11);
        }
        this.f52396f.a();
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0097 A[LOOP:0: B:4:0x000e->B:47:0x0097, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x009b A[SYNTHETIC] */
    @Override // m90.j0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long read(m90.g sink, long j11) throws Throwable {
        int i5;
        Throwable streamResetException;
        boolean z11;
        long j12;
        Intrinsics.g(sink, "sink");
        long j13 = 0;
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        while (true) {
            y yVar = this.f52396f;
            synchronized (yVar) {
                yVar.f52408k.h();
                try {
                    synchronized (yVar) {
                        i5 = yVar.f52410m;
                    }
                    if (z11) {
                        if (j12 != -1) {
                            return j12;
                        }
                        if (streamResetException == null) {
                            return -1L;
                        }
                        throw streamResetException;
                    }
                    j13 = 0;
                } catch (Throwable th2) {
                    yVar.f52408k.k();
                    throw th2;
                }
            }
            if (i5 != 0 && !this.f52392b) {
                streamResetException = yVar.n;
                if (streamResetException == null) {
                    synchronized (yVar) {
                        int i11 = yVar.f52410m;
                        c1.w(i11);
                        streamResetException = new StreamResetException(i11);
                    }
                }
            }
            streamResetException = null;
            if (this.f52395e) {
                throw new IOException("stream closed");
            }
            m90.g gVar = this.f52394d;
            long j14 = gVar.f76126b;
            z11 = false;
            if (j14 > j13) {
                j12 = gVar.read(sink, Math.min(j11, j14));
                long j15 = yVar.f52400c + j12;
                yVar.f52400c = j15;
                long j16 = j15 - yVar.f52401d;
                if (streamResetException == null && j16 >= yVar.f52399b.f52359p.a() / 2) {
                    yVar.f52399b.l(yVar.f52398a, j16);
                    yVar.f52401d = yVar.f52400c;
                }
            } else {
                if (!this.f52392b && streamResetException == null) {
                    try {
                        yVar.wait();
                        z11 = true;
                    } catch (InterruptedException unused) {
                        Thread.currentThread().interrupt();
                        throw new InterruptedIOException();
                    }
                }
                j12 = -1;
            }
            yVar.f52408k.k();
            Unit unit = Unit.f71706a;
            if (z11) {
            }
        }
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f52396f.f52408k;
    }
}
