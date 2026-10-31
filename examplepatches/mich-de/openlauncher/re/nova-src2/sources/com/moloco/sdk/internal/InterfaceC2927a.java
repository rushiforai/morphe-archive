package com.moloco.sdk.internal;

import android.content.Context;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.i;
import com.moloco.sdk.internal.publisher.C2939a;
import com.moloco.sdk.internal.services.I;
import com.moloco.sdk.internal.services.InterfaceC2958f;
import com.moloco.sdk.publisher.Banner;
import com.moloco.sdk.publisher.InterstitialAd;
import com.moloco.sdk.publisher.NativeAd;
import com.moloco.sdk.publisher.RewardedInterstitialAd;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.S;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.internal.a, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public interface InterfaceC2927a {
    @NotNull
    Banner a(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull C c11, @NotNull i.a aVar, @NotNull MetricsRecorder metricsRecorder);

    @NotNull
    Banner a(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull C c11, @NotNull i.c cVar, @NotNull MetricsRecorder metricsRecorder);

    @NotNull
    Banner a(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull C c11, @NotNull i iVar, @NotNull MetricsRecorder metricsRecorder);

    @NotNull
    InterstitialAd a(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i iVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull MetricsRecorder metricsRecorder);

    @NotNull
    NativeAd a(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull com.moloco.sdk.internal.services.n nVar, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i iVar, @NotNull C c11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull I i5, @NotNull MetricsRecorder metricsRecorder);

    @NotNull
    RewardedInterstitialAd a(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.i iVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull MetricsRecorder metricsRecorder, @NotNull com.moloco.sdk.internal.services.config.a aVar);

    @NotNull
    Banner b(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull C c11, @NotNull i iVar, @NotNull MetricsRecorder metricsRecorder);

    @NotNull
    Banner c(@NotNull Context context, @NotNull InterfaceC2958f interfaceC2958f, @NotNull String str, @NotNull S s11, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.z zVar, @NotNull C2939a c2939a, @NotNull C c11, @NotNull i iVar, @NotNull MetricsRecorder metricsRecorder);
}
