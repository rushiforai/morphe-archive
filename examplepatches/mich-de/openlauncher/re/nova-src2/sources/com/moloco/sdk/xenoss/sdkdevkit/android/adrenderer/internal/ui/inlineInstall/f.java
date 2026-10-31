package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class f implements k {

    /* renamed from: b, reason: collision with root package name */
    public static final int f39840b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final r f39841a;

    public f(@NotNull r externalLinkHandler) {
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        this.f39841a = externalLinkHandler;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k
    public void a(@NotNull String url) {
        Intrinsics.g(url, "url");
        this.f39841a.a(url);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k
    public void b(@Nullable String str) {
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k
    public void c(@Nullable String str) {
    }
}
