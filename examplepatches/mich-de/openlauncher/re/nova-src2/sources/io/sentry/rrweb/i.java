package io.sentry.rrweb;

import com.amplitude.core.events.Plan;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes4.dex */
public final class i extends e implements i1 {

    /* renamed from: d, reason: collision with root package name */
    public int f67730d;

    /* renamed from: e, reason: collision with root package name */
    public List f67731e;

    /* renamed from: f, reason: collision with root package name */
    public HashMap f67732f;

    /* renamed from: g, reason: collision with root package name */
    public HashMap f67733g;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o(TTConst.TRACK_TYPE);
        e3Var.x(iLogger, this.f67714a);
        e3Var.o("timestamp");
        e3Var.w(this.f67715b);
        e3Var.o("data");
        e3Var.f();
        e3Var.o(Plan.AMP_PLAN_SOURCE);
        e3Var.x(iLogger, this.f67716c);
        List list = this.f67731e;
        if (list != null && !list.isEmpty()) {
            e3Var.o("positions");
            e3Var.x(iLogger, this.f67731e);
        }
        e3Var.o("pointerId");
        e3Var.w(this.f67730d);
        HashMap map = this.f67733g;
        if (map != null) {
            for (String str : map.keySet()) {
                C3125e3.a(this.f67733g, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
        HashMap map2 = this.f67732f;
        if (map2 != null) {
            for (String str2 : map2.keySet()) {
                C3125e3.a(this.f67732f, str2, e3Var, str2, iLogger);
            }
        }
        e3Var.i();
    }
}
