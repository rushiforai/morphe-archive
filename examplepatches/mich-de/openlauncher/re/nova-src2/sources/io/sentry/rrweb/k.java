package io.sentry.rrweb;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class k extends b implements i1 {

    /* renamed from: c, reason: collision with root package name */
    public String f67738c;

    /* renamed from: d, reason: collision with root package name */
    public String f67739d;

    /* renamed from: e, reason: collision with root package name */
    public String f67740e;

    /* renamed from: f, reason: collision with root package name */
    public double f67741f;

    /* renamed from: g, reason: collision with root package name */
    public double f67742g;

    /* renamed from: h, reason: collision with root package name */
    public ConcurrentHashMap f67743h;

    /* renamed from: i, reason: collision with root package name */
    public HashMap f67744i;

    /* renamed from: j, reason: collision with root package name */
    public ConcurrentHashMap f67745j;

    /* renamed from: k, reason: collision with root package name */
    public ConcurrentHashMap f67746k;

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
        e3Var.o("tag");
        e3Var.A(this.f67738c);
        e3Var.o("payload");
        e3Var.f();
        if (this.f67739d != null) {
            e3Var.o("op");
            e3Var.A(this.f67739d);
        }
        if (this.f67740e != null) {
            e3Var.o(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
            e3Var.A(this.f67740e);
        }
        e3Var.o("startTimestamp");
        e3Var.x(iLogger, BigDecimal.valueOf(this.f67741f));
        e3Var.o("endTimestamp");
        e3Var.x(iLogger, BigDecimal.valueOf(this.f67742g));
        if (this.f67743h != null) {
            e3Var.o("data");
            e3Var.x(iLogger, this.f67743h);
        }
        ConcurrentHashMap concurrentHashMap = this.f67745j;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67745j, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
        ConcurrentHashMap concurrentHashMap2 = this.f67746k;
        if (concurrentHashMap2 != null) {
            for (String str2 : concurrentHashMap2.keySet()) {
                C3125e3.a(this.f67746k, str2, e3Var, str2, iLogger);
            }
        }
        e3Var.i();
        HashMap map = this.f67744i;
        if (map != null) {
            for (String str3 : map.keySet()) {
                C3125e3.a(this.f67744i, str3, e3Var, str3, iLogger);
            }
        }
        e3Var.i();
    }
}
