package com.tiktok.appevents;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f46538a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ TTAppEventLogger f46539b;

    public /* synthetic */ b(TTAppEventLogger tTAppEventLogger, int i5) {
        this.f46538a = i5;
        this.f46539b = tTAppEventLogger;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f46538a) {
            case 0:
                this.f46539b.clearAllImmediately();
                break;
            case 1:
                this.f46539b.lambda$new$0();
                break;
            default:
                this.f46539b.lambda$fetchGlobalConfig$7();
                break;
        }
    }
}
