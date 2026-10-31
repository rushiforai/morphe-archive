package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.FullscreenAd;
import com.moloco.sdk.publisher.InterstitialAd;
import com.moloco.sdk.publisher.InterstitialAdShowListener;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class G implements InterstitialAd, s, FullscreenAd<InterstitialAdShowListener> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final w<InterstitialAdShowListener> f36901a;

    /* JADX WARN: Multi-variable type inference failed */
    public G(@NotNull w<? super InterstitialAdShowListener> fullscreenAd) {
        Intrinsics.g(fullscreenAd, "fullscreenAd");
        this.f36901a = fullscreenAd;
    }

    @Override // com.moloco.sdk.internal.publisher.s
    public void a(long j11, long j12) {
        this.f36901a.a(j11, j12);
    }

    @Override // com.moloco.sdk.publisher.Destroyable
    public void destroy() {
        this.f36901a.destroy();
    }

    @Override // com.moloco.sdk.internal.publisher.s
    /* renamed from: getCreateAdObjectDuration-UwyO8pc, reason: not valid java name */
    public long mo266getCreateAdObjectDurationUwyO8pc() {
        return this.f36901a.mo266getCreateAdObjectDurationUwyO8pc();
    }

    @Override // com.moloco.sdk.publisher.AdLoad
    public boolean isLoaded() {
        return this.f36901a.isLoaded();
    }

    @Override // com.moloco.sdk.publisher.AdLoad
    public void load(@NotNull String bidResponseJson, @Nullable AdLoad.Listener listener) {
        Intrinsics.g(bidResponseJson, "bidResponseJson");
        this.f36901a.load(bidResponseJson, listener);
    }

    @Override // com.moloco.sdk.internal.publisher.s
    /* renamed from: setCreateAdObjectDuration-LRDsOJo, reason: not valid java name */
    public void mo267setCreateAdObjectDurationLRDsOJo(long j11) {
        this.f36901a.mo267setCreateAdObjectDurationLRDsOJo(j11);
    }

    @Override // com.moloco.sdk.publisher.FullscreenAd
    public void show(@Nullable InterstitialAdShowListener interstitialAdShowListener) {
        this.f36901a.show(H.a(interstitialAdShowListener));
    }
}
