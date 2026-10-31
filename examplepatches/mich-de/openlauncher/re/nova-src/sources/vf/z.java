package vf;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import com.google.android.exoplayer2.upstream.Loader$UnexpectedLoaderException;
import gf.i0;
import java.io.IOException;
import java.util.concurrent.ExecutorService;

/* loaded from: classes3.dex */
public final class z extends Handler implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final int f92756a;

    /* renamed from: b, reason: collision with root package name */
    public final i0 f92757b;

    /* renamed from: c, reason: collision with root package name */
    public Object f92758c;

    /* renamed from: d, reason: collision with root package name */
    public IOException f92759d;

    /* renamed from: e, reason: collision with root package name */
    public int f92760e;

    /* renamed from: f, reason: collision with root package name */
    public Thread f92761f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f92762g;

    /* renamed from: h, reason: collision with root package name */
    public volatile boolean f92763h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ b0 f92764i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(b0 b0Var, Looper looper, i0 i0Var, y yVar, int i5, long j11) {
        super(looper);
        this.f92764i = b0Var;
        this.f92757b = i0Var;
        this.f92758c = yVar;
        this.f92756a = i5;
    }

    /* JADX WARN: Type inference failed for: r5v3, types: [java.lang.Object, vf.y] */
    public final void a(boolean z11) {
        this.f92763h = z11;
        this.f92759d = null;
        if (hasMessages(0)) {
            this.f92762g = true;
            removeMessages(0);
            if (!z11) {
                sendEmptyMessage(1);
            }
        } else {
            synchronized (this) {
                try {
                    this.f92762g = true;
                    this.f92757b.f57518g = true;
                    Thread thread = this.f92761f;
                    if (thread != null) {
                        thread.interrupt();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        if (z11) {
            this.f92764i.f92636b = null;
            SystemClock.elapsedRealtime();
            ?? r52 = this.f92758c;
            r52.getClass();
            r52.b(this.f92757b, true);
            this.f92758c = null;
        }
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Object, vf.y] */
    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        if (this.f92763h) {
            return;
        }
        int i5 = message.what;
        if (i5 == 0) {
            this.f92759d = null;
            b0 b0Var = this.f92764i;
            ExecutorService executorService = b0Var.f92635a;
            z zVar = b0Var.f92636b;
            zVar.getClass();
            executorService.execute(zVar);
            return;
        }
        if (i5 == 3) {
            throw ((Error) message.obj);
        }
        this.f92764i.f92636b = null;
        SystemClock.elapsedRealtime();
        ?? r02 = this.f92758c;
        r02.getClass();
        if (this.f92762g) {
            r02.b(this.f92757b, false);
            return;
        }
        int i11 = message.what;
        if (i11 == 1) {
            try {
                r02.f(this.f92757b);
                return;
            } catch (RuntimeException e3) {
                wf.a.p("LoadTask", "Unexpected exception handling load completed", e3);
                this.f92764i.f92637c = new Loader$UnexpectedLoaderException(e3);
                return;
            }
        }
        if (i11 != 2) {
            return;
        }
        IOException iOException = (IOException) message.obj;
        this.f92759d = iOException;
        int i12 = this.f92760e + 1;
        this.f92760e = i12;
        ve.e eVarA = r02.a(this.f92757b, iOException, i12);
        int i13 = eVarA.f92619a;
        if (i13 == 3) {
            this.f92764i.f92637c = this.f92759d;
            return;
        }
        if (i13 != 2) {
            if (i13 == 1) {
                this.f92760e = 1;
            }
            long jMin = eVarA.f92620b;
            if (jMin == -9223372036854775807L) {
                jMin = Math.min((this.f92760e - 1) * 1000, 5000);
            }
            b0 b0Var2 = this.f92764i;
            wf.a.i(b0Var2.f92636b == null);
            b0Var2.f92636b = this;
            if (jMin > 0) {
                sendEmptyMessageDelayed(0, jMin);
            } else {
                this.f92759d = null;
                b0Var2.f92635a.execute(this);
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z11;
        try {
            synchronized (this) {
                z11 = this.f92762g;
                this.f92761f = Thread.currentThread();
            }
            if (!z11) {
                wf.a.b("load:".concat(this.f92757b.getClass().getSimpleName()));
                try {
                    this.f92757b.b();
                    wf.a.q();
                } catch (Throwable th2) {
                    wf.a.q();
                    throw th2;
                }
            }
            synchronized (this) {
                this.f92761f = null;
                Thread.interrupted();
            }
            if (this.f92763h) {
                return;
            }
            sendEmptyMessage(1);
        } catch (IOException e3) {
            if (this.f92763h) {
                return;
            }
            obtainMessage(2, e3).sendToTarget();
        } catch (Exception e11) {
            if (this.f92763h) {
                return;
            }
            wf.a.p("LoadTask", "Unexpected exception loading stream", e11);
            obtainMessage(2, new Loader$UnexpectedLoaderException(e11)).sendToTarget();
        } catch (OutOfMemoryError e12) {
            if (this.f92763h) {
                return;
            }
            wf.a.p("LoadTask", "OutOfMemory error loading stream", e12);
            obtainMessage(2, new Loader$UnexpectedLoaderException(e12)).sendToTarget();
        } catch (Error e13) {
            if (!this.f92763h) {
                wf.a.p("LoadTask", "Unexpected error loading stream", e13);
                obtainMessage(3, e13).sendToTarget();
            }
            throw e13;
        }
    }
}
