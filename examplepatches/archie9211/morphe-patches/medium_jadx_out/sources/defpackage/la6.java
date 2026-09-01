package defpackage;

import android.os.Trace;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.impl.CallbackExceptionImpl;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class la6 extends aq7 {
    public final ea6 e;
    public final Executor f;
    public final u5e g;
    public ByteBuffer h;
    public long i;
    public long j;
    public int k;
    public final HttpURLConnection l;
    public WritableByteChannel n;
    public OutputStream o;
    public final /* synthetic */ na6 p;
    public final AtomicInteger d = new AtomicInteger(3);
    public final AtomicBoolean m = new AtomicBoolean(false);

    public la6(na6 na6Var, Executor executor, ma6 ma6Var, HttpURLConnection httpURLConnection, u5e u5eVar) {
        this.p = na6Var;
        this.e = new ea6(this, executor);
        this.f = ma6Var;
        this.g = new u5e(1, u5eVar);
        this.l = httpURLConnection;
    }

    public final void I(ha6 ha6Var, String str) {
        grb.f("JavaUploadDataSinkBase#executeOnExecutor ".concat(str));
        try {
            this.f.execute(new fi2(str, 12, ha6Var));
            Trace.endSection();
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public final void J(oa6 oa6Var, String str) {
        try {
            grb.f("Cronet JavaUploadDataSinkBase#executeOnUploadExecutor ".concat(str));
            try {
                this.e.execute(new ss(this, str, oa6Var, 12));
                Trace.endSection();
            } finally {
            }
        } catch (RejectedExecutionException e) {
            this.p.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", e));
        }
    }

    @Override // defpackage.aq7
    public final void v() {
        AtomicInteger atomicInteger = this.d;
        int i = 0;
        if (!atomicInteger.compareAndSet(0, 2)) {
            ygf.f(b09.w(atomicInteger.get(), "onReadSucceeded() called when not awaiting a read result; in state: "));
        } else {
            I(new ha6(this.p, new da6(this, i), 0), "onReadSucceeded");
        }
    }

    @Override // defpackage.aq7
    public final void w() {
        AtomicInteger atomicInteger = this.d;
        int i = 1;
        if (!atomicInteger.compareAndSet(1, 2)) {
            ygf.f(b09.w(atomicInteger.get(), "onRewindSucceeded() called when not awaiting a rewind; in state: "));
        } else {
            I(new ha6(this.p, new da6(this, i), 0), "startRead");
        }
    }
}
