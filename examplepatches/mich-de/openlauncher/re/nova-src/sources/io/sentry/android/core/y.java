package io.sentry.android.core;

/* loaded from: classes4.dex */
public final /* synthetic */ class y implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67094a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AppLifecycleIntegration f67095b;

    public /* synthetic */ y(AppLifecycleIntegration appLifecycleIntegration, int i5) {
        this.f67094a = i5;
        this.f67095b = appLifecycleIntegration;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f67094a) {
            case 0:
                this.f67095b.c();
                break;
            default:
                this.f67095b.a();
                break;
        }
    }
}
