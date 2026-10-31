package io.sentry.android.core;

import io.sentry.g3;
import io.sentry.i2;
import io.sentry.j2;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements j2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66863a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ActivityLifecycleIntegration f66864b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ io.sentry.r0 f66865c;

    public /* synthetic */ e(ActivityLifecycleIntegration activityLifecycleIntegration, io.sentry.r0 r0Var, int i5) {
        this.f66863a = i5;
        this.f66864b = activityLifecycleIntegration;
        this.f66865c = r0Var;
    }

    @Override // io.sentry.j2
    public final void j(io.sentry.m0 m0Var) {
        switch (this.f66863a) {
            case 0:
                ActivityLifecycleIntegration activityLifecycleIntegration = this.f66864b;
                io.sentry.r0 r0Var = this.f66865c;
                activityLifecycleIntegration.getClass();
                i2 i2Var = (i2) m0Var;
                synchronized (i2Var.f67309l) {
                    if (i2Var.f67298a == r0Var) {
                        ((i2) m0Var).a();
                    }
                }
                return;
            default:
                ActivityLifecycleIntegration activityLifecycleIntegration2 = this.f66864b;
                io.sentry.r0 r0Var2 = this.f66865c;
                i2 i2Var2 = (i2) m0Var;
                synchronized (i2Var2.f67309l) {
                    if (i2Var2.f67298a == null) {
                        ((i2) m0Var).b(r0Var2);
                    } else {
                        SentryAndroidOptions sentryAndroidOptions = activityLifecycleIntegration2.f66756d;
                        if (sentryAndroidOptions != null) {
                            sentryAndroidOptions.getLogger().g(g3.DEBUG, "Transaction '%s' won't be bound to the Scope since there's one already in there.", r0Var2.getName());
                        }
                    }
                }
                return;
        }
    }
}
