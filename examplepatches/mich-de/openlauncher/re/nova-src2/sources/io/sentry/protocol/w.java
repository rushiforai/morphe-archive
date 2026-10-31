package io.sentry.protocol;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class w implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67625a;

    /* renamed from: b, reason: collision with root package name */
    public String f67626b;

    /* renamed from: c, reason: collision with root package name */
    public String f67627c;

    /* renamed from: d, reason: collision with root package name */
    public ConcurrentHashMap f67628d;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67625a != null) {
            e3Var.o(PendingUpgradeStore.KEY_NAME);
            e3Var.A(this.f67625a);
        }
        if (this.f67626b != null) {
            e3Var.o("version");
            e3Var.A(this.f67626b);
        }
        if (this.f67627c != null) {
            e3Var.o("raw_description");
            e3Var.A(this.f67627c);
        }
        ConcurrentHashMap concurrentHashMap = this.f67628d;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67628d, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
