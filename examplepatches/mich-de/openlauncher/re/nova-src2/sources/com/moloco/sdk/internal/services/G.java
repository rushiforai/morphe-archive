package com.moloco.sdk.internal.services;

import android.content.Context;
import com.moloco.sdk.common_adapter_internal.ScreenData;
import kotlin.Deprecated;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class G implements F {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37629b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f37630a;

    public G(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f37630a = context;
    }

    @Override // com.moloco.sdk.internal.services.F
    @NotNull
    public E a() {
        ScreenData screenDataInvoke = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.s.a(this.f37630a).invoke();
        float widthDp = screenDataInvoke.getWidthDp();
        return new E(screenDataInvoke.getWidthPx(), widthDp, screenDataInvoke.getHeightPx(), screenDataInvoke.getHeightDp(), screenDataInvoke.getPxRatio(), screenDataInvoke.getDpi(), this.f37630a.getResources().getDisplayMetrics().xdpi, this.f37630a.getResources().getDisplayMetrics().ydpi);
    }

    @Override // com.moloco.sdk.internal.services.F
    @NotNull
    public H b() {
        int i5 = this.f37630a.getResources().getConfiguration().orientation;
        return i5 != 1 ? i5 != 2 ? H.f37631a : H.f37633c : H.f37632b;
    }

    @NotNull
    public final Context c() {
        return this.f37630a;
    }

    @Override // com.moloco.sdk.internal.services.F
    @Deprecated
    @NotNull
    public E invoke() {
        return a();
    }
}
