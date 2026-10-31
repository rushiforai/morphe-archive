package io.sentry.android.core.performance;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67030a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f67031b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Application f67032c;

    public /* synthetic */ b(d dVar, Application application, int i5) {
        this.f67030a = i5;
        this.f67031b = dVar;
        this.f67032c = application;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f67030a) {
            case 0:
                new Handler(Looper.getMainLooper()).post(new b(this.f67031b, this.f67032c, 1));
                break;
            default:
                d dVar = this.f67031b;
                Application application = this.f67032c;
                if (dVar.f67042h == null) {
                    dVar.f67036b = false;
                }
                application.unregisterActivityLifecycleCallbacks(d.f67034l);
                break;
        }
    }
}
