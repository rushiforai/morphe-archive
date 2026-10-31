package io.sentry.protocol;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class a0 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public Long f67457a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f67458b;

    /* renamed from: c, reason: collision with root package name */
    public String f67459c;

    /* renamed from: d, reason: collision with root package name */
    public String f67460d;

    /* renamed from: e, reason: collision with root package name */
    public Boolean f67461e;

    /* renamed from: f, reason: collision with root package name */
    public Boolean f67462f;

    /* renamed from: g, reason: collision with root package name */
    public Boolean f67463g;

    /* renamed from: h, reason: collision with root package name */
    public Boolean f67464h;

    /* renamed from: i, reason: collision with root package name */
    public z f67465i;

    /* renamed from: j, reason: collision with root package name */
    public Map f67466j;

    /* renamed from: k, reason: collision with root package name */
    public ConcurrentHashMap f67467k;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67457a != null) {
            e3Var.o("id");
            e3Var.z(this.f67457a);
        }
        if (this.f67458b != null) {
            e3Var.o("priority");
            e3Var.z(this.f67458b);
        }
        if (this.f67459c != null) {
            e3Var.o(PendingUpgradeStore.KEY_NAME);
            e3Var.A(this.f67459c);
        }
        if (this.f67460d != null) {
            e3Var.o("state");
            e3Var.A(this.f67460d);
        }
        if (this.f67461e != null) {
            e3Var.o("crashed");
            e3Var.y(this.f67461e);
        }
        if (this.f67462f != null) {
            e3Var.o("current");
            e3Var.y(this.f67462f);
        }
        if (this.f67463g != null) {
            e3Var.o("daemon");
            e3Var.y(this.f67463g);
        }
        if (this.f67464h != null) {
            e3Var.o("main");
            e3Var.y(this.f67464h);
        }
        if (this.f67465i != null) {
            e3Var.o("stacktrace");
            e3Var.x(iLogger, this.f67465i);
        }
        if (this.f67466j != null) {
            e3Var.o("held_locks");
            e3Var.x(iLogger, this.f67466j);
        }
        ConcurrentHashMap concurrentHashMap = this.f67467k;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67467k, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
