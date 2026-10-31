package io.sentry.protocol;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class o implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67585a;

    /* renamed from: b, reason: collision with root package name */
    public String f67586b;

    /* renamed from: c, reason: collision with root package name */
    public String f67587c;

    /* renamed from: d, reason: collision with root package name */
    public Object f67588d;

    /* renamed from: e, reason: collision with root package name */
    public String f67589e;

    /* renamed from: f, reason: collision with root package name */
    public ConcurrentHashMap f67590f;

    /* renamed from: g, reason: collision with root package name */
    public ConcurrentHashMap f67591g;

    /* renamed from: h, reason: collision with root package name */
    public Long f67592h;

    /* renamed from: i, reason: collision with root package name */
    public ConcurrentHashMap f67593i;

    /* renamed from: j, reason: collision with root package name */
    public String f67594j;

    /* renamed from: k, reason: collision with root package name */
    public String f67595k;

    /* renamed from: l, reason: collision with root package name */
    public ConcurrentHashMap f67596l;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || o.class != obj.getClass()) {
            return false;
        }
        o oVar = (o) obj;
        return i30.j.z(this.f67585a, oVar.f67585a) && i30.j.z(this.f67586b, oVar.f67586b) && i30.j.z(this.f67587c, oVar.f67587c) && i30.j.z(this.f67589e, oVar.f67589e) && i30.j.z(this.f67590f, oVar.f67590f) && i30.j.z(this.f67591g, oVar.f67591g) && i30.j.z(this.f67592h, oVar.f67592h) && i30.j.z(this.f67594j, oVar.f67594j) && i30.j.z(this.f67595k, oVar.f67595k);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67585a, this.f67586b, this.f67587c, this.f67589e, this.f67590f, this.f67591g, this.f67592h, this.f67594j, this.f67595k});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67585a != null) {
            e3Var.o(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            e3Var.A(this.f67585a);
        }
        if (this.f67586b != null) {
            e3Var.o("method");
            e3Var.A(this.f67586b);
        }
        if (this.f67587c != null) {
            e3Var.o("query_string");
            e3Var.A(this.f67587c);
        }
        if (this.f67588d != null) {
            e3Var.o("data");
            e3Var.x(iLogger, this.f67588d);
        }
        if (this.f67589e != null) {
            e3Var.o("cookies");
            e3Var.A(this.f67589e);
        }
        if (this.f67590f != null) {
            e3Var.o("headers");
            e3Var.x(iLogger, this.f67590f);
        }
        if (this.f67591g != null) {
            e3Var.o("env");
            e3Var.x(iLogger, this.f67591g);
        }
        if (this.f67593i != null) {
            e3Var.o(InneractiveMediationNameConsts.OTHER);
            e3Var.x(iLogger, this.f67593i);
        }
        if (this.f67594j != null) {
            e3Var.o("fragment");
            e3Var.x(iLogger, this.f67594j);
        }
        if (this.f67592h != null) {
            e3Var.o("body_size");
            e3Var.x(iLogger, this.f67592h);
        }
        if (this.f67595k != null) {
            e3Var.o("api_target");
            e3Var.x(iLogger, this.f67595k);
        }
        ConcurrentHashMap concurrentHashMap = this.f67596l;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67596l, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
