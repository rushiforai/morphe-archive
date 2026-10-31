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

/* loaded from: classes4.dex */
public final class g extends e implements i1 {

    /* renamed from: d, reason: collision with root package name */
    public f f67717d;

    /* renamed from: e, reason: collision with root package name */
    public int f67718e;

    /* renamed from: f, reason: collision with root package name */
    public float f67719f;

    /* renamed from: g, reason: collision with root package name */
    public float f67720g;

    /* renamed from: h, reason: collision with root package name */
    public int f67721h;

    /* renamed from: i, reason: collision with root package name */
    public int f67722i;

    /* renamed from: j, reason: collision with root package name */
    public HashMap f67723j;

    /* renamed from: k, reason: collision with root package name */
    public HashMap f67724k;

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
        e3Var.o(TTConst.TRACK_TYPE);
        e3Var.x(iLogger, this.f67717d);
        e3Var.o("id");
        e3Var.w(this.f67718e);
        e3Var.o("x");
        e3Var.v(this.f67719f);
        e3Var.o("y");
        e3Var.v(this.f67720g);
        e3Var.o("pointerType");
        e3Var.w(this.f67721h);
        e3Var.o("pointerId");
        e3Var.w(this.f67722i);
        HashMap map = this.f67724k;
        if (map != null) {
            for (String str : map.keySet()) {
                C3125e3.a(this.f67724k, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
        HashMap map2 = this.f67723j;
        if (map2 != null) {
            for (String str2 : map2.keySet()) {
                C3125e3.a(this.f67723j, str2, e3Var, str2, iLogger);
            }
        }
        e3Var.i();
    }
}
