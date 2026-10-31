package com.google.firebase.crashlytics.internal.common;

import com.google.firebase.crashlytics.internal.settings.SettingsProvider;
import java.util.Map;

/* loaded from: classes3.dex */
public final /* synthetic */ class i implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34705a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CrashlyticsCore f34706b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f34707c;

    public /* synthetic */ i(CrashlyticsCore crashlyticsCore, Object obj, int i5) {
        this.f34705a = i5;
        this.f34706b = crashlyticsCore;
        this.f34707c = obj;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        switch (this.f34705a) {
            case 0:
                this.f34706b.lambda$setCustomKeys$6((Map) this.f34707c);
                break;
            case 1:
                this.f34706b.lambda$finishInitSynchronously$9((SettingsProvider) this.f34707c);
                break;
            case 2:
                this.f34706b.lambda$logFatalException$8((Throwable) this.f34707c);
                break;
            default:
                this.f34706b.lambda$setUserId$4((String) this.f34707c);
                break;
        }
    }
}
