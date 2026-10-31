package com.amplitude.android;

import android.view.View;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\"\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\u000bJ\u000e\u0010\r\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\bJ\u000e\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\bJ\u000e\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\bJ\u000e\u0010\u0010\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/FrustrationAnalyticsUtils;", b.f42142b, "()V", "IGNORE_DEAD_CLICK_KEY", b.f42142b, "IGNORE_FRUSTRATION_KEY", "IGNORE_RAGE_CLICK_KEY", "ignoreFrustrationAnalytics", "Landroid/view/View;", "view", "rageClick", b.f42142b, "deadClick", "isDeadClickIgnored", "isRageClickIgnored", "isViewIgnored", "unignoreView", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class FrustrationAnalyticsUtils {

    @NotNull
    public static final FrustrationAnalyticsUtils INSTANCE = new FrustrationAnalyticsUtils();
    private static final int IGNORE_RAGE_CLICK_KEY = -1989905945;
    private static final int IGNORE_DEAD_CLICK_KEY = -633031234;
    private static final int IGNORE_FRUSTRATION_KEY = 457577948;

    private FrustrationAnalyticsUtils() {
    }

    public static /* synthetic */ View ignoreFrustrationAnalytics$default(FrustrationAnalyticsUtils frustrationAnalyticsUtils, View view, boolean z11, boolean z12, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = true;
        }
        if ((i5 & 4) != 0) {
            z12 = true;
        }
        return frustrationAnalyticsUtils.ignoreFrustrationAnalytics(view, z11, z12);
    }

    @NotNull
    public final View ignoreFrustrationAnalytics(@NotNull View view, boolean rageClick, boolean deadClick) {
        Intrinsics.g(view, "view");
        view.setTag(IGNORE_RAGE_CLICK_KEY, Boolean.valueOf(rageClick));
        view.setTag(IGNORE_DEAD_CLICK_KEY, Boolean.valueOf(deadClick));
        view.setTag(IGNORE_FRUSTRATION_KEY, Boolean.valueOf(rageClick && deadClick));
        return view;
    }

    public final boolean isDeadClickIgnored(@NotNull View view) {
        Intrinsics.g(view, "view");
        Object tag = view.getTag(IGNORE_FRUSTRATION_KEY);
        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
        boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
        Object tag2 = view.getTag(IGNORE_DEAD_CLICK_KEY);
        Boolean bool2 = tag2 instanceof Boolean ? (Boolean) tag2 : null;
        return zBooleanValue || (bool2 != null ? bool2.booleanValue() : false);
    }

    public final boolean isRageClickIgnored(@NotNull View view) {
        Intrinsics.g(view, "view");
        Object tag = view.getTag(IGNORE_FRUSTRATION_KEY);
        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
        boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
        Object tag2 = view.getTag(IGNORE_RAGE_CLICK_KEY);
        Boolean bool2 = tag2 instanceof Boolean ? (Boolean) tag2 : null;
        return zBooleanValue || (bool2 != null ? bool2.booleanValue() : false);
    }

    public final boolean isViewIgnored(@NotNull View view) {
        Intrinsics.g(view, "view");
        Object tag = view.getTag(IGNORE_FRUSTRATION_KEY);
        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
        if (bool != null) {
            return bool.booleanValue();
        }
        return false;
    }

    @NotNull
    public final View unignoreView(@NotNull View view) {
        Intrinsics.g(view, "view");
        view.setTag(IGNORE_RAGE_CLICK_KEY, null);
        view.setTag(IGNORE_DEAD_CLICK_KEY, null);
        view.setTag(IGNORE_FRUSTRATION_KEY, null);
        return view;
    }
}
