package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import android.animation.TimeInterpolator;
import android.view.View;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class t {
    public static /* synthetic */ void a(View view, boolean z11, long j11, TimeInterpolator timeInterpolator, Function0 function0, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            function0 = null;
        }
        a(view, z11, j11, timeInterpolator, function0);
    }

    public static final void a(@NotNull View view, boolean z11, long j11, @NotNull TimeInterpolator interpolator, @Nullable Function0<Unit> function0) {
        Intrinsics.g(view, "<this>");
        Intrinsics.g(interpolator, "interpolator");
        view.animate().cancel();
        if (!z11) {
            view.animate().alpha(0.0f).setDuration(j11).setInterpolator(interpolator).withEndAction(new ae.c(17, view, function0)).start();
        } else {
            view.setVisibility(0);
            view.animate().alpha(1.0f).setDuration(j11).setInterpolator(interpolator).withEndAction(new b4.b(function0, 3)).start();
        }
    }

    public static final void a(Function0 function0) {
        if (function0 != null) {
            function0.invoke();
        }
    }

    public static final void a(View view, Function0 function0) {
        view.setVisibility(8);
        if (function0 != null) {
            function0.invoke();
        }
    }
}
