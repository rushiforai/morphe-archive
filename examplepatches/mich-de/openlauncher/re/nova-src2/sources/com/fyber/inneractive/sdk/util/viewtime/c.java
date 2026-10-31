package com.fyber.inneractive.sdk.util.viewtime;

import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.x;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.response.e;
import com.fyber.inneractive.sdk.util.c0;
import java.util.Locale;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public final class c extends a {

    /* renamed from: b, reason: collision with root package name */
    public final x f31243b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.a f31244c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f31245d;

    public c(x xVar, com.fyber.inneractive.sdk.util.a aVar, boolean z11) {
        this.f31243b = xVar;
        this.f31244c = aVar;
        this.f31245d = z11;
    }

    public final void a(boolean z11) {
        Object objA;
        r rVar;
        long j11 = this.f31238a;
        String str = String.format(Locale.US, "%d.%03d", Integer.valueOf((int) (j11 / 1000)), Integer.valueOf((int) (j11 % 1000)));
        u uVar = u.VAST_WATCHED_DURATION_AND_SKIP_ACTION;
        x xVar = this.f31243b;
        InneractiveAdRequest inneractiveAdRequest = xVar != null ? xVar.f28437a : null;
        e eVar = xVar != null ? xVar.f28438b : null;
        JSONArray jSONArrayB = (xVar == null || (rVar = xVar.f28439c) == null) ? null : rVar.b();
        w wVar = new w(eVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        Boolean boolValueOf = Boolean.valueOf(this.f31245d);
        if (z11) {
            com.fyber.inneractive.sdk.util.a aVar = this.f31244c;
            aVar.getClass();
            objA = c0.a(System.currentTimeMillis(), aVar.f31169d, aVar.f31171f);
        } else {
            objA = -1;
        }
        wVar.a("duration", str, "is_skip_clickable", boolValueOf, "skip_action_latency", objA);
        wVar.a((String) null);
    }
}
