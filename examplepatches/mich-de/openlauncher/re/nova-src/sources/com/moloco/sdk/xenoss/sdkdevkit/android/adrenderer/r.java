package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import android.content.Context;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.moloco.sdk.common_adapter_internal.ScreenData;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.D;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class r implements q {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f42127a;

    public r(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f42127a = context;
    }

    public final DisplayMetrics a(WindowManager windowManager) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getRealMetrics(displayMetrics);
        return displayMetrics;
    }

    public final DisplayMetrics b(WindowManager windowManager) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        displayMetrics.density = this.f42127a.getResources().getDisplayMetrics().density;
        displayMetrics.densityDpi = this.f42127a.getResources().getDisplayMetrics().densityDpi;
        displayMetrics.widthPixels = windowManager.getCurrentWindowMetrics().getBounds().width();
        displayMetrics.heightPixels = windowManager.getCurrentWindowMetrics().getBounds().height();
        return displayMetrics;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.q
    @NotNull
    public ScreenData invoke() {
        WindowManager windowManager = (WindowManager) this.f42127a.getSystemService(WindowManager.class);
        if (windowManager == null) {
            return new ScreenData(0, 0, 0.0f, 0.0f, 0, 0.0f);
        }
        DisplayMetrics displayMetricsB = Build.VERSION.SDK_INT >= 30 ? b(windowManager) : a(windowManager);
        int i5 = displayMetricsB.widthPixels;
        return new ScreenData(i5, displayMetricsB.heightPixels, D.b(i5, displayMetricsB.density), D.b(displayMetricsB.heightPixels, displayMetricsB.density), displayMetricsB.densityDpi, displayMetricsB.density);
    }
}
