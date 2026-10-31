package io.sentry.protocol;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class l implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67569a;

    /* renamed from: b, reason: collision with root package name */
    public String f67570b;

    /* renamed from: c, reason: collision with root package name */
    public List f67571c;

    /* renamed from: d, reason: collision with root package name */
    public ConcurrentHashMap f67572d;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67569a != null) {
            e3Var.o("formatted");
            e3Var.A(this.f67569a);
        }
        if (this.f67570b != null) {
            e3Var.o(PglCryptUtils.KEY_MESSAGE);
            e3Var.A(this.f67570b);
        }
        List list = this.f67571c;
        if (list != null && !list.isEmpty()) {
            e3Var.o("params");
            e3Var.x(iLogger, this.f67571c);
        }
        ConcurrentHashMap concurrentHashMap = this.f67572d;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67572d, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
