package com.fyber.inneractive.sdk.config;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.u1;
import com.fyber.inneractive.sdk.util.w1;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class e implements u {

    /* renamed from: d, reason: collision with root package name */
    public w1 f27794d;

    /* renamed from: e, reason: collision with root package name */
    public final c1 f27795e;

    /* renamed from: g, reason: collision with root package name */
    public final d f27797g;

    /* renamed from: a, reason: collision with root package name */
    public final Set f27791a = Collections.newSetFromMap(new ConcurrentHashMap());

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f27792b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    public boolean f27793c = false;

    /* renamed from: f, reason: collision with root package name */
    public final Handler f27796f = new Handler(Looper.getMainLooper(), new b(this));

    public e(c1 c1Var) {
        c cVar = new c(this);
        this.f27797g = new d(this);
        this.f27795e = c1Var;
        Application application = com.fyber.inneractive.sdk.util.o.f31210a;
        if (application != null) {
            application.registerActivityLifecycleCallbacks(cVar);
        }
    }

    public final void a() {
        v vVar = IAConfigManager.Q.f27761u;
        if (!vVar.f27938d) {
            vVar.f27937c.add(this);
        }
        w1 w1Var = new w1(TimeUnit.MINUTES, r0.f27761u.f27936b.a("session_duration", 30, 1));
        this.f27794d = w1Var;
        w1Var.f31250e = this.f27797g;
    }

    @Override // com.fyber.inneractive.sdk.config.u
    public final void onGlobalConfigChanged(v vVar, r rVar) {
        w1 w1Var = this.f27794d;
        if (w1Var != null) {
            w1Var.f31249d = false;
            w1Var.f31251f = 0L;
            u1 u1Var = w1Var.f31248c;
            if (u1Var != null) {
                u1Var.removeMessages(1932593528);
            }
            TimeUnit timeUnit = TimeUnit.MINUTES;
            long jA = rVar.a("session_duration", 30, 1);
            long j11 = this.f27794d.f31251f;
            w1 w1Var2 = new w1(timeUnit, jA);
            w1Var2.f31251f = j11;
            IAlog.a("Visible time counter init - time %d", Long.valueOf(jA));
            this.f27794d = w1Var2;
            w1Var2.f31250e = this.f27797g;
        }
        vVar.f27937c.remove(this);
    }
}
