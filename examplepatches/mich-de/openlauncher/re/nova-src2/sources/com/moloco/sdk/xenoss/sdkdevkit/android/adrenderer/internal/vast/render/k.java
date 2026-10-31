package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class k implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l {

    /* renamed from: c, reason: collision with root package name */
    public static final int f41693c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final j f41694a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l f41695b;

    public k(@NotNull j resource, @Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l lVar) {
        Intrinsics.g(resource, "resource");
        this.f41694a = resource;
        this.f41695b = lVar;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l lVar = this.f41695b;
        if (lVar != null) {
            lVar.destroy();
        }
    }

    @NotNull
    public final j k() {
        return this.f41694a;
    }

    public /* synthetic */ k(j jVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l lVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(jVar, (i5 & 2) != 0 ? null : lVar);
    }
}
