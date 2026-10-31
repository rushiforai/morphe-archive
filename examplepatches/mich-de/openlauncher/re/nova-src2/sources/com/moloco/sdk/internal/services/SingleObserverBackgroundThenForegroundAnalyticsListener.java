package com.moloco.sdk.internal.services;

import androidx.lifecycle.DefaultLifecycleObserver;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\bH\u0000¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\r\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000bH\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u0017\u0010\u000f\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\u000bH\u0016¢\u0006\u0004\b\u000f\u0010\u000eR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u0010R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010\u0012R\u0018\u0010\u0016\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010\u0015R\u0016\u0010\u001a\u001a\u00020\u00178\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0018\u0010\u0019¨\u0006\u001b"}, d2 = {"Lcom/moloco/sdk/internal/services/SingleObserverBackgroundThenForegroundAnalyticsListener;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "Lcom/moloco/sdk/internal/services/analytics/a;", "analyticsService", "Lcom/moloco/sdk/internal/services/I;", "timeProviderService", "<init>", "(Lcom/moloco/sdk/internal/services/analytics/a;Lcom/moloco/sdk/internal/services/I;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "()V", "Lh6/a0;", "owner", "onStart", "(Lh6/a0;)V", "onStop", "Lcom/moloco/sdk/internal/services/analytics/a;", "b", "Lcom/moloco/sdk/internal/services/I;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "c", "Ljava/lang/Long;", "lastBgTimestamp", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "d", "Z", "trackNext", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
/* loaded from: classes4.dex */
public final class SingleObserverBackgroundThenForegroundAnalyticsListener implements DefaultLifecycleObserver {

    /* renamed from: e, reason: collision with root package name */
    public static final int f37640e = 8;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final com.moloco.sdk.internal.services.analytics.a analyticsService;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final I timeProviderService;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public Long lastBgTimestamp;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public boolean trackNext;

    public SingleObserverBackgroundThenForegroundAnalyticsListener(@NotNull com.moloco.sdk.internal.services.analytics.a analyticsService, @NotNull I timeProviderService) {
        Intrinsics.g(analyticsService, "analyticsService");
        Intrinsics.g(timeProviderService, "timeProviderService");
        this.analyticsService = analyticsService;
        this.timeProviderService = timeProviderService;
    }

    public final void a() {
        this.trackNext = true;
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onStart(@NotNull h6.a0 owner) {
        Intrinsics.g(owner, "owner");
        super.onStart(owner);
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        MolocoLogger.debug$default(molocoLogger, C2960h.f38001a, "Application onStart", false, 4, null);
        Long l9 = this.lastBgTimestamp;
        if (l9 != null) {
            MolocoLogger.debug$default(molocoLogger, C2960h.f38001a, "Background event has been recorded, recording foreground", false, 4, null);
            this.analyticsService.a(this.timeProviderService.invoke(), l9.longValue());
            this.lastBgTimestamp = null;
            this.trackNext = false;
        }
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onStop(@NotNull h6.a0 owner) {
        Intrinsics.g(owner, "owner");
        super.onStop(owner);
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        MolocoLogger.debug$default(molocoLogger, C2960h.f38001a, "Application onStop", false, 4, null);
        if (this.trackNext) {
            MolocoLogger.debug$default(molocoLogger, C2960h.f38001a, "Tracking of event is true. Recording background", false, 4, null);
            long jInvoke = this.timeProviderService.invoke();
            this.lastBgTimestamp = Long.valueOf(jInvoke);
            this.analyticsService.a(jInvoke);
        }
    }
}
