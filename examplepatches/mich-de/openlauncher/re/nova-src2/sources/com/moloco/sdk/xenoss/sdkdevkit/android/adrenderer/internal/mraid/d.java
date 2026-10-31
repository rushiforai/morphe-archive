package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2982i;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.k;
import java.util.List;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class d {
    @NotNull
    public static final List<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.k> a(@NotNull c cVar, @NotNull j mraidFullscreenContentController, int i5, @NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r externalLinkHandler, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall.k linkHandler) {
        k.b bVar;
        Intrinsics.g(cVar, "<this>");
        Intrinsics.g(mraidFullscreenContentController, "mraidFullscreenContentController");
        Intrinsics.g(context, "context");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(linkHandler, "linkHandler");
        k.d dVar = new k.d(mraidFullscreenContentController);
        C2982i c2982iB = cVar.b();
        if (c2982iB != null) {
            int i11 = i5 < 0 ? 0 : i5;
            UInt.Companion companion = UInt.f71696b;
            bVar = new k.b(new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec.c(c2982iB, null, i11, context, customUserEventBuilderService, externalLinkHandler, linkHandler, null));
        } else {
            bVar = null;
        }
        return kotlin.collections.c.v0(new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.ad.k[]{dVar, bVar});
    }
}
