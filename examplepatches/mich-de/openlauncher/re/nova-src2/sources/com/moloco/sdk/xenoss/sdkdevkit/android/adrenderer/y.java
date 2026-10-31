package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import android.content.Context;
import android.view.View;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.moloco.sdk.internal.ortb.model.C2931a;
import com.moloco.sdk.internal.ortb.model.C2932b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.S;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class y implements InterfaceC2973c {

    /* renamed from: l, reason: collision with root package name */
    public static final int f42129l = 0;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f42130a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Boolean f42131b;

    /* renamed from: c, reason: collision with root package name */
    public final int f42132c;

    /* renamed from: d, reason: collision with root package name */
    public final int f42133d;

    /* renamed from: e, reason: collision with root package name */
    public final int f42134e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f42135f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f42136g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final Function2<Context, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i, View> f42137h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final C2931a f42138i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final C2932b f42139j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final g f42140k;

    public y() {
        this(false, null, 0, 0, 0, false, false, null, null, null, null, 2047, null);
    }

    @NotNull
    public final g a() {
        return this.f42140k;
    }

    @Nullable
    public final C2931a b() {
        return this.f42138i;
    }

    @Nullable
    public final C2932b c() {
        return this.f42139j;
    }

    public final boolean d() {
        return this.f42136g;
    }

    public final boolean e() {
        return this.f42135f;
    }

    public final int f() {
        return this.f42133d;
    }

    public final int g() {
        return this.f42134e;
    }

    @Nullable
    public final Boolean h() {
        return this.f42131b;
    }

    public final int i() {
        return this.f42132c;
    }

    public final boolean j() {
        return this.f42130a;
    }

    @NotNull
    public final Function2<Context, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i, View> k() {
        return this.f42137h;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public y(boolean z11, @Nullable Boolean bool, int i5, int i11, int i12, boolean z12, boolean z13, @NotNull Function2<? super Context, ? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.i, ? extends View> VastRenderer, @Nullable C2931a c2931a, @Nullable C2932b c2932b, @NotNull g adaptiveBlurConfig) {
        Intrinsics.g(VastRenderer, "VastRenderer");
        Intrinsics.g(adaptiveBlurConfig, "adaptiveBlurConfig");
        this.f42130a = z11;
        this.f42131b = bool;
        this.f42132c = i5;
        this.f42133d = i11;
        this.f42134e = i12;
        this.f42135f = z12;
        this.f42136g = z13;
        this.f42137h = VastRenderer;
        this.f42138i = c2931a;
        this.f42139j = c2932b;
        this.f42140k = adaptiveBlurConfig;
    }

    public /* synthetic */ y(boolean z11, Boolean bool, int i5, int i11, int i12, boolean z12, boolean z13, Function2 function2, C2931a c2931a, C2932b c2932b, g gVar, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this((i13 & 1) != 0 ? true : z11, (i13 & 2) != 0 ? null : bool, (i13 & 4) != 0 ? 5 : i5, (i13 & 8) != 0 ? 5 : i11, (i13 & 16) == 0 ? i12 : 5, (i13 & 32) != 0 ? false : z12, (i13 & 64) == 0 ? z13 : false, (i13 & 128) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.x.a(0L, (Function2) null, (Function2) null, (Function2) null, (Function2) null, (Function2) null, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o) null, (Function2) null, (Function2) null, (Function2) null, (S) null, false, 4095, (Object) null) : function2, (i13 & 256) != 0 ? null : c2931a, (i13 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? c2932b : null, (i13 & 1024) != 0 ? new g(false, 0.0f, 0, 0, 15, null) : gVar);
    }
}
