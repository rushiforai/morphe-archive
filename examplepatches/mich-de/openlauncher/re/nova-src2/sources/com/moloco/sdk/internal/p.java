package com.moloco.sdk.internal;

import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Unit;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f36873a = LazyKt.a(new com.instabridge.ai.tools.a(17));

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final Lazy f36874b = LazyKt.a(new com.instabridge.ai.tools.a(18));

    @Nullable
    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o a(boolean z11) {
        if (z11) {
            return null;
        }
        return g();
    }

    public static final Unit b() {
        return Unit.f71706a;
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o c() {
        return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o(new com.instabridge.ai.tools.a(14), new com.instabridge.ai.tools.a(15), new com.instabridge.ai.tools.a(16));
    }

    public static final Unit d() {
        return Unit.f71706a;
    }

    public static final Unit e() {
        return Unit.f71706a;
    }

    public static final Unit f() {
        return Unit.f71706a;
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o g() {
        return (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o) f36873a.getValue();
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o h() {
        return (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o) f36874b.getValue();
    }

    public static final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o a() {
        return new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.o(new com.instabridge.ai.tools.a(13), null, null, 6, null);
    }
}
