package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.d;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import t70.j0;

/* loaded from: classes4.dex */
public final class f {
    public static final d.a b(int i5) {
        return i5 == 0 ? d.a.C0283a.f41609b : new d.a.b(i5, null);
    }

    @NotNull
    public static final d a(int i5, @NotNull j0 scope) {
        Intrinsics.g(scope, "scope");
        return new e(i5, scope, null);
    }
}
