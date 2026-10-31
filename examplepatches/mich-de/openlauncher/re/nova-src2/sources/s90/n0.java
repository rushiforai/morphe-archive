package s90;

import android.os.Trace;
import java.nio.ByteBuffer;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.UploadDataSink;

/* loaded from: classes5.dex */
public abstract class n0 extends UploadDataSink {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicInteger f86982a = new AtomicInteger(3);

    /* renamed from: b, reason: collision with root package name */
    public final m0 f86983b;

    /* renamed from: c, reason: collision with root package name */
    public final Executor f86984c;

    /* renamed from: d, reason: collision with root package name */
    public final q90.a f86985d;

    /* renamed from: e, reason: collision with root package name */
    public ByteBuffer f86986e;

    /* renamed from: f, reason: collision with root package name */
    public long f86987f;

    /* renamed from: g, reason: collision with root package name */
    public long f86988g;

    /* renamed from: h, reason: collision with root package name */
    public int f86989h;

    public n0(Executor executor, Executor executor2, q90.a aVar) {
        this.f86983b = new m0(this, executor);
        this.f86984c = executor2;
        this.f86985d = new q90.a(aVar, 1);
    }

    public final void a(o0 o0Var, String str) {
        p90.a.a("JavaUploadDataSinkBase#executeOnExecutor ".concat(str));
        try {
            this.f86984c.execute(new kz.c(28, str, o0Var));
            Trace.endSection();
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final void b(b1 b1Var, String str) {
        try {
            p90.a.a("Cronet JavaUploadDataSinkBase#executeOnUploadExecutor ".concat(str));
            try {
                this.f86983b.execute(new androidx.fragment.app.d(29, this, str, b1Var));
                Trace.endSection();
            } finally {
            }
        } catch (RejectedExecutionException e3) {
            c(e3);
        }
    }

    public abstract void c(Exception exc);

    @Override // org.chromium.net.UploadDataSink
    public final void onReadError(Exception exc) {
        c(exc);
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onReadSucceeded(boolean z11) {
        AtomicInteger atomicInteger = this.f86982a;
        if (!atomicInteger.compareAndSet(0, 2)) {
            throw new IllegalStateException(b.c0.h(atomicInteger.get(), "onReadSucceeded() called when not awaiting a read result; in state: "));
        }
        a(new o0(((y0) this).f87071m, new k0(this, z11, 1), 2), "onReadSucceeded");
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onRewindError(Exception exc) {
        c(exc);
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onRewindSucceeded() {
        AtomicInteger atomicInteger = this.f86982a;
        if (!atomicInteger.compareAndSet(1, 2)) {
            throw new IllegalStateException(b.c0.h(atomicInteger.get(), "onRewindSucceeded() called when not awaiting a rewind; in state: "));
        }
        a(new o0(((y0) this).f87071m, new l0(this, 0), 2), "startRead");
    }
}
