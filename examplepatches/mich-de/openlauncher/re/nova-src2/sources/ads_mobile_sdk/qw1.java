package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class qw1 {

    /* renamed from: a, reason: collision with root package name */
    public final b.c8 f8854a;

    /* renamed from: b, reason: collision with root package name */
    public final mw1 f8855b;

    /* renamed from: c, reason: collision with root package name */
    public final zy1 f8856c;

    public qw1(b.c8 nativeAdViewabilityMonitor, mw1 nativeAdViewVisibilityChangedListenerImpl, zy1 nativeMediaViewFullyVisibleEventListenerImpl) {
        Intrinsics.g(nativeAdViewabilityMonitor, "nativeAdViewabilityMonitor");
        Intrinsics.g(nativeAdViewVisibilityChangedListenerImpl, "nativeAdViewVisibilityChangedListenerImpl");
        Intrinsics.g(nativeMediaViewFullyVisibleEventListenerImpl, "nativeMediaViewFullyVisibleEventListenerImpl");
        this.f8854a = nativeAdViewabilityMonitor;
        this.f8855b = nativeAdViewVisibilityChangedListenerImpl;
        this.f8856c = nativeMediaViewFullyVisibleEventListenerImpl;
    }
}
