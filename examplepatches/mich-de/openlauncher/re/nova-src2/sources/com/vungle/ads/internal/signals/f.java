package com.vungle.ads.internal.signals;

import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.model.w2;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;

/* loaded from: classes4.dex */
public final class f extends com.vungle.ads.internal.util.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j f47499a;

    public f(j jVar) {
        this.f47499a = jVar;
    }

    @Override // com.vungle.ads.internal.util.b
    public final void a() {
        boolean z11 = u.f47714a;
        t.a("SignalManager", "SignalManager#onBackground()");
        this.f47499a.f47505c = System.currentTimeMillis();
        j jVar = this.f47499a;
        jVar.f47507e = (jVar.f47505c - jVar.f47506d) + jVar.f47507e;
    }

    @Override // com.vungle.ads.internal.util.b
    public final void b() {
        Integer num;
        boolean z11 = u.f47714a;
        t.a("SignalManager", "SignalManager#onForeground()");
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j11 = jCurrentTimeMillis - this.f47499a.f47505c;
        ConfigManager.INSTANCE.getClass();
        w2 w2Var = ConfigManager.f46715a;
        if (j11 > ((w2Var == null || (num = w2Var.f47186l) == null) ? 1800 : num.intValue()) * 1000) {
            j jVar = this.f47499a;
            jVar.f();
            jVar.f47510h = new c(jVar.f47508f);
        }
        j jVar2 = this.f47499a;
        jVar2.f47506d = jCurrentTimeMillis;
        jVar2.f47505c = 0L;
    }
}
