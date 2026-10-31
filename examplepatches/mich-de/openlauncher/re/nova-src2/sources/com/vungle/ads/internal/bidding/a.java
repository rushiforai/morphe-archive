package com.vungle.ads.internal.bidding;

import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.model.w2;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;

/* loaded from: classes4.dex */
public final class a extends com.vungle.ads.internal.util.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f46742a;

    public a(e eVar) {
        this.f46742a = eVar;
    }

    @Override // com.vungle.ads.internal.util.b
    public final void a() {
        e eVar = this.f46742a;
        eVar.getClass();
        boolean z11 = u.f47714a;
        t.a("BidTokenEncoder", "BidTokenEncoder#onBackground()");
        eVar.f46751e = System.currentTimeMillis();
    }

    @Override // com.vungle.ads.internal.util.b
    public final void b() {
        Integer num;
        e eVar = this.f46742a;
        eVar.getClass();
        boolean z11 = u.f47714a;
        t.a("BidTokenEncoder", "BidTokenEncoder#onForeground()");
        long jCurrentTimeMillis = System.currentTimeMillis();
        ConfigManager.INSTANCE.getClass();
        w2 w2Var = ConfigManager.f46715a;
        if (jCurrentTimeMillis > eVar.f46751e + (((w2Var == null || (num = w2Var.f47184j) == null) ? 900 : num.intValue()) * 1000)) {
            eVar.f46749c = 0;
            eVar.f46751e = 0L;
        }
    }
}
