package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.w1;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class l0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f28179a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p0 f28180b;

    public l0(p0 p0Var, long j11) {
        this.f28180b = p0Var;
        this.f28179a = j11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f28180b.I()) {
            p0 p0Var = this.f28180b;
            p0Var.n = new k0(this);
            long jA = p0Var.a(this.f28179a);
            p0 p0Var2 = this.f28180b;
            p0Var2.getClass();
            w1 w1Var = new w1(TimeUnit.MILLISECONDS, jA);
            p0Var2.o = w1Var;
            w1Var.f31250e = new o0(p0Var2);
            w1Var.f31249d = false;
            w1Var.f31248c.sendEmptyMessage(1932593528);
            p0 p0Var3 = this.f28180b;
            p0Var3.getClass();
            IAlog.a("%sad contains custom close. Will show transparent x in %d", IAlog.a(p0Var3), Long.valueOf(jA));
            this.f28180b.f28266l = null;
        } else {
            p0 p0Var4 = this.f28180b;
            p0Var4.getClass();
            IAlog.a("%sad does not contain custom close. Showing close button", IAlog.a(p0Var4));
            this.f28180b.e(false);
        }
        Runnable runnable = this.f28180b.f28266l;
        if (runnable != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(runnable);
            this.f28180b.f28266l = null;
        }
    }
}
