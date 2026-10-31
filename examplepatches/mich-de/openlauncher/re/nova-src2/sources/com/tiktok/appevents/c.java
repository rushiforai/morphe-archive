package com.tiktok.appevents;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f46540a;

    public /* synthetic */ c(int i5) {
        this.f46540a = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f46540a) {
            case 0:
                DebugModeHelper.tryRequestConfig();
                break;
            case 1:
                TTAppEventStorage.persist(null);
                break;
            case 2:
                TTCrashHandler.initCrashReporter();
                break;
            default:
                TTCrashHandler.persistToFile();
                break;
        }
    }
}
