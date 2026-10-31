package com.google.firebase.crashlytics.internal.common;

import com.google.firebase.crashlytics.internal.metadata.EventMetadata;
import com.google.firebase.crashlytics.internal.model.CrashlyticsReport;

/* loaded from: classes3.dex */
public final /* synthetic */ class r implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34724a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f34725b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f34726c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f34727d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f34728e;

    public /* synthetic */ r(int i5, Object obj, Object obj2, Object obj3, boolean z11) {
        this.f34724a = i5;
        this.f34726c = obj;
        this.f34727d = obj2;
        this.f34728e = obj3;
        this.f34725b = z11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f34724a) {
            case 0:
                ((SessionReportingCoordinator) this.f34726c).lambda$persistEvent$3((CrashlyticsReport.Session.Event) this.f34727d, (EventMetadata) this.f34728e, this.f34725b);
                break;
            default:
                com.vungle.ads.internal.network.r.a((com.vungle.ads.internal.network.r) this.f34726c, (com.vungle.ads.internal.network.q) this.f34727d, (String) this.f34728e, this.f34725b);
                break;
        }
    }
}
