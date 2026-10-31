package com.moloco.sdk.internal.ortb.model;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* renamed from: com.moloco.sdk.internal.ortb.model.h, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2938h {

    /* renamed from: a, reason: collision with root package name */
    public static final float f36747a = 0.1f;

    public static final float a(@NotNull C2935e c2935e) {
        u experimental;
        Float adaptiveBannerBlurGapThreshold;
        Intrinsics.g(c2935e, "<this>");
        z configs = c2935e.getExt().getConfigs();
        if (configs == null || (experimental = configs.getExperimental()) == null || (adaptiveBannerBlurGapThreshold = experimental.getAdaptiveBannerBlurGapThreshold()) == null) {
            return 0.1f;
        }
        float fFloatValue = adaptiveBannerBlurGapThreshold.floatValue();
        if (0.0f > fFloatValue || fFloatValue > 1.0f) {
            adaptiveBannerBlurGapThreshold = null;
        }
        if (adaptiveBannerBlurGapThreshold != null) {
            return adaptiveBannerBlurGapThreshold.floatValue();
        }
        return 0.1f;
    }

    public static final boolean b(@NotNull C2935e c2935e) {
        u experimental;
        Intrinsics.g(c2935e, "<this>");
        z configs = c2935e.getExt().getConfigs();
        if (configs == null || (experimental = configs.getExperimental()) == null) {
            return false;
        }
        return Intrinsics.b(experimental.getAdaptiveBannerBlurBgEnabled(), Boolean.TRUE);
    }

    public static final boolean c(@NotNull C2935e c2935e) {
        u experimental;
        Intrinsics.g(c2935e, "<this>");
        z configs = c2935e.getExt().getConfigs();
        if (configs == null || (experimental = configs.getExperimental()) == null) {
            return false;
        }
        return Intrinsics.b(experimental.getBannerNonHtmlAdmCheckEnabled(), Boolean.TRUE);
    }

    public static final boolean d(@NotNull C2935e c2935e) {
        u experimental;
        Intrinsics.g(c2935e, "<this>");
        z configs = c2935e.getExt().getConfigs();
        if (configs == null || (experimental = configs.getExperimental()) == null) {
            return false;
        }
        return Intrinsics.b(experimental.getComposeRemovalEnabled(), Boolean.TRUE);
    }

    @NotNull
    public static final String e(@NotNull C2935e c2935e) {
        Intrinsics.g(c2935e, "<this>");
        String mtid = c2935e.getExt().getMtid();
        return mtid == null ? "UNKNOWN_MTID" : mtid;
    }
}
