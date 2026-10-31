package com.moloco.sdk.internal;

import com.moloco.sdk.publisher.MolocoAdError;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class u {
    public static /* synthetic */ t a(String str, MolocoAdError.ErrorType errorType, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar, Map map, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            map = b70.h.f17594a;
        }
        return a(str, errorType, cVar, map);
    }

    @NotNull
    public static final t a(@NotNull String adUnitId, @NotNull MolocoAdError.ErrorType errorType, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c subErrorType, @NotNull Map<String, String> details) {
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(errorType, "errorType");
        Intrinsics.g(subErrorType, "subErrorType");
        Intrinsics.g(details, "details");
        return new t(new MolocoAdError("Moloco", adUnitId, errorType, null, 8, null), subErrorType, details);
    }
}
