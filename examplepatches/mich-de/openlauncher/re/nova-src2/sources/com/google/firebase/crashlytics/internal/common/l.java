package com.google.firebase.crashlytics.internal.common;

/* loaded from: classes3.dex */
public final /* synthetic */ class l implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34713a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CrashlyticsCore f34714b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f34715c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f34716d;

    public /* synthetic */ l(CrashlyticsCore crashlyticsCore, String str, String str2, int i5) {
        this.f34713a = i5;
        this.f34714b = crashlyticsCore;
        this.f34715c = str;
        this.f34716d = str2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f34713a) {
            case 0:
                this.f34714b.lambda$setCustomKey$5(this.f34715c, this.f34716d);
                break;
            default:
                this.f34714b.lambda$setInternalKey$7(this.f34715c, this.f34716d);
                break;
        }
    }
}
