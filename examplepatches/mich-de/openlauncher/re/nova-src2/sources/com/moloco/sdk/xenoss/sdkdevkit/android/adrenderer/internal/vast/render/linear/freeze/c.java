package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.d0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c {
    @NotNull
    public static final b a(@NotNull Context context, @NotNull k viewModel) {
        Intrinsics.g(context, "context");
        Intrinsics.g(viewModel, "viewModel");
        return new b(context, viewModel.s(), new d0(viewModel, 1), viewModel.isCompleted(), null, null, 48, null);
    }

    public static final long a(k kVar) {
        return kVar.W();
    }
}
