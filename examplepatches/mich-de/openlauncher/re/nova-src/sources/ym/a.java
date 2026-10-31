package ym;

import an.d;
import com.google.firebase.crashlytics.internal.CrashlyticsRemoteConfigListener;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97390a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CrashlyticsRemoteConfigListener f97391b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d f97392c;

    public /* synthetic */ a(CrashlyticsRemoteConfigListener crashlyticsRemoteConfigListener, d dVar, int i5) {
        this.f97390a = i5;
        this.f97391b = crashlyticsRemoteConfigListener;
        this.f97392c = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f97390a) {
            case 0:
                this.f97391b.onRolloutsStateChanged(this.f97392c);
                break;
            default:
                this.f97391b.onRolloutsStateChanged(this.f97392c);
                break;
        }
    }
}
