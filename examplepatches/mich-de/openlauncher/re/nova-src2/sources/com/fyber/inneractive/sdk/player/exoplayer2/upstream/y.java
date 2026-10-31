package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class y extends Handler implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final z f30418a;

    /* renamed from: b, reason: collision with root package name */
    public final x f30419b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30420c;

    /* renamed from: d, reason: collision with root package name */
    public final long f30421d;

    /* renamed from: e, reason: collision with root package name */
    public IOException f30422e;

    /* renamed from: f, reason: collision with root package name */
    public int f30423f;

    /* renamed from: g, reason: collision with root package name */
    public volatile Thread f30424g;

    /* renamed from: h, reason: collision with root package name */
    public volatile boolean f30425h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ b0 f30426i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(b0 b0Var, Looper looper, z zVar, x xVar, int i5, long j11) {
        super(looper);
        this.f30426i = b0Var;
        this.f30418a = zVar;
        this.f30419b = xVar;
        this.f30420c = i5;
        this.f30421d = j11;
    }

    public final void a(boolean z11) {
        this.f30425h = z11;
        this.f30422e = null;
        if (hasMessages(0)) {
            removeMessages(0);
            if (!z11) {
                sendEmptyMessage(1);
            }
        } else {
            this.f30418a.b();
            if (this.f30424g != null) {
                this.f30424g.interrupt();
            }
        }
        if (z11) {
            this.f30426i.f30275b = null;
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            this.f30419b.a(this.f30418a, jElapsedRealtime, jElapsedRealtime - this.f30421d, true);
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        if (this.f30425h) {
            return;
        }
        int i5 = message.what;
        if (i5 == 0) {
            this.f30422e = null;
            b0 b0Var = this.f30426i;
            b0Var.f30274a.execute(b0Var.f30275b);
            return;
        }
        if (i5 == 4) {
            throw ((Error) message.obj);
        }
        this.f30426i.f30275b = null;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        long j11 = jElapsedRealtime - this.f30421d;
        if (this.f30418a.a()) {
            this.f30419b.a(this.f30418a, jElapsedRealtime, j11, false);
            return;
        }
        int i11 = message.what;
        if (i11 == 1) {
            this.f30419b.a(this.f30418a, jElapsedRealtime, j11, false);
            return;
        }
        if (i11 == 2) {
            this.f30419b.a(this.f30418a, jElapsedRealtime, j11);
            return;
        }
        if (i11 != 3) {
            return;
        }
        IOException iOException = (IOException) message.obj;
        this.f30422e = iOException;
        int iA = this.f30419b.a(this.f30418a, jElapsedRealtime, j11, iOException);
        if (iA == 3) {
            this.f30426i.f30276c = this.f30422e;
            return;
        }
        if (iA != 2) {
            int i12 = iA == 1 ? 1 : this.f30423f + 1;
            this.f30423f = i12;
            long jMin = Math.min((i12 - 1) * 1000, 5000);
            b0 b0Var2 = this.f30426i;
            if (b0Var2.f30275b != null) {
                throw new IllegalStateException();
            }
            b0Var2.f30275b = this;
            if (jMin > 0) {
                sendEmptyMessageDelayed(0, jMin);
            } else {
                this.f30422e = null;
                b0Var2.f30274a.execute(this);
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            this.f30424g = Thread.currentThread();
            if (!this.f30418a.a()) {
                com.fyber.inneractive.sdk.player.exoplayer2.util.w.a("load:".concat(this.f30418a.getClass().getSimpleName()));
                try {
                    this.f30418a.load();
                    com.fyber.inneractive.sdk.player.exoplayer2.util.w.a();
                } catch (Throwable th2) {
                    com.fyber.inneractive.sdk.player.exoplayer2.util.w.a();
                    throw th2;
                }
            }
            if (this.f30425h) {
                return;
            }
            sendEmptyMessage(2);
        } catch (IOException e3) {
            if (this.f30425h) {
                return;
            }
            obtainMessage(3, e3).sendToTarget();
        } catch (Error e11) {
            Log.e("LoadTask", "Unexpected error loading stream", e11);
            if (!this.f30425h) {
                obtainMessage(4, e11).sendToTarget();
            }
            throw e11;
        } catch (InterruptedException unused) {
            if (!this.f30418a.a()) {
                throw new IllegalStateException();
            }
            if (this.f30425h) {
                return;
            }
            sendEmptyMessage(2);
        } catch (Exception e12) {
            Log.e("LoadTask", "Unexpected exception loading stream", e12);
            if (this.f30425h) {
                return;
            }
            obtainMessage(3, new a0(e12)).sendToTarget();
        } catch (OutOfMemoryError e13) {
            Log.e("LoadTask", "OutOfMemory error loading stream", e13);
            if (this.f30425h) {
                return;
            }
            obtainMessage(3, new a0(e13)).sendToTarget();
        }
    }
}
