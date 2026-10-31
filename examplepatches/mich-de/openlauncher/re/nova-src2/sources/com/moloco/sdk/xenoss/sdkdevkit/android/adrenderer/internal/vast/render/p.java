package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;

/* loaded from: classes4.dex */
public final class p {
    @NotNull
    public static final n a(@Nullable y yVar, @Nullable Integer num, @Nullable Integer num2, @Nullable String str, @NotNull j0 scope, @NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r externalLinkHandler, @Nullable Function0<Unit> function0, @Nullable Function0<Unit> function02) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(context, "context");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        return new o(yVar, num, num2, str, scope, context, customUserEventBuilderService, externalLinkHandler, function0, function02);
    }
}
