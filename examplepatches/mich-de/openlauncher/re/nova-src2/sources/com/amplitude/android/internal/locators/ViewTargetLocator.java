package com.amplitude.android.internal.locators;

import com.amplitude.android.internal.ViewTarget;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Pair;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J*\u0010\u0002\u001a\u0004\u0018\u00010\u0003*\u00020\u00012\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\tÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/android/internal/locators/ViewTargetLocator;", b.f42142b, "locate", "Lcom/amplitude/android/internal/ViewTarget;", "targetPosition", "Lkotlin/Pair;", b.f42142b, "targetType", "Lcom/amplitude/android/internal/ViewTarget$Type;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface ViewTargetLocator {
    @Nullable
    ViewTarget locate(@NotNull Object obj, @NotNull Pair<Float, Float> pair, @NotNull ViewTarget.Type type);
}
