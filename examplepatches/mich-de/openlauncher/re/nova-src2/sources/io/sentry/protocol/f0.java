package io.sentry.protocol;

import com.amplitude.android.TrackingOptions;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes4.dex */
public final class f0 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67496a;

    /* renamed from: b, reason: collision with root package name */
    public String f67497b;

    /* renamed from: c, reason: collision with root package name */
    public String f67498c;

    /* renamed from: d, reason: collision with root package name */
    public String f67499d;

    /* renamed from: e, reason: collision with root package name */
    public String f67500e;

    /* renamed from: f, reason: collision with root package name */
    public String f67501f;

    /* renamed from: g, reason: collision with root package name */
    public h f67502g;

    /* renamed from: h, reason: collision with root package name */
    public ConcurrentHashMap f67503h;

    /* renamed from: i, reason: collision with root package name */
    public ConcurrentHashMap f67504i;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && f0.class == obj.getClass()) {
            f0 f0Var = (f0) obj;
            if (i30.j.z(this.f67496a, f0Var.f67496a) && i30.j.z(this.f67497b, f0Var.f67497b) && i30.j.z(this.f67498c, f0Var.f67498c) && i30.j.z(this.f67499d, f0Var.f67499d) && i30.j.z(this.f67500e, f0Var.f67500e)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67496a, this.f67497b, this.f67498c, this.f67499d, this.f67500e});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67496a != null) {
            e3Var.o(ActionCategory.EMAIL);
            e3Var.A(this.f67496a);
        }
        if (this.f67497b != null) {
            e3Var.o("id");
            e3Var.A(this.f67497b);
        }
        if (this.f67498c != null) {
            e3Var.o("username");
            e3Var.A(this.f67498c);
        }
        if (this.f67499d != null) {
            e3Var.o("segment");
            e3Var.A(this.f67499d);
        }
        if (this.f67500e != null) {
            e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_IP_ADDRESS);
            e3Var.A(this.f67500e);
        }
        if (this.f67501f != null) {
            e3Var.o(PendingUpgradeStore.KEY_NAME);
            e3Var.A(this.f67501f);
        }
        if (this.f67502g != null) {
            e3Var.o("geo");
            this.f67502g.serialize(e3Var, iLogger);
        }
        if (this.f67503h != null) {
            e3Var.o("data");
            e3Var.x(iLogger, this.f67503h);
        }
        ConcurrentHashMap concurrentHashMap = this.f67504i;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67504i, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
