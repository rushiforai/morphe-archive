package com.google.firebase.crashlytics.internal.common;

import com.google.firebase.crashlytics.internal.settings.SettingsProvider;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34702a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f34703b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f34704c;

    public /* synthetic */ e(int i5, Object obj, Object obj2) {
        this.f34702a = i5;
        this.f34703b = obj;
        this.f34704c = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f34702a) {
            case 0:
                ((CrashlyticsController) this.f34703b).lambda$openSession$1((String) this.f34704c);
                break;
            default:
                ((CrashlyticsCore) this.f34703b).lambda$doBackgroundInitializationAsync$0((SettingsProvider) this.f34704c);
                break;
        }
    }
}
