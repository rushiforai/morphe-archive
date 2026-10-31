package com.amplitude.android.internal.gestures;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20480a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WindowCallbackManager f20481b;

    public /* synthetic */ a(WindowCallbackManager windowCallbackManager, int i5) {
        this.f20480a = i5;
        this.f20481b = windowCallbackManager;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f20480a) {
            case 0:
                WindowCallbackManager.stop$lambda$4(this.f20481b);
                break;
            default:
                WindowCallbackManager.start$lambda$2(this.f20481b);
                break;
        }
    }
}
