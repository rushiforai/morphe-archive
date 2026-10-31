package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import java.util.Comparator;
import kotlin.Pair;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class a implements Comparator<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e> {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f40188a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f40189b;

    /* JADX WARN: Multi-variable type inference failed */
    public a() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    @Override // java.util.Comparator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compare(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e c12, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.e c22) {
        Intrinsics.g(c12, "c1");
        Intrinsics.g(c22, "c2");
        Pair pairD = g.d(c12, c22, this.f40188a, this.f40189b);
        return Intrinsics.h(((Number) pairD.f71684b).intValue(), ((Number) pairD.f71683a).intValue());
    }

    public a(@Nullable Integer num, @Nullable Integer num2) {
        this.f40188a = num;
        this.f40189b = num2;
    }

    public /* synthetic */ a(Integer num, Integer num2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : num, (i5 & 2) != 0 ? null : num2);
    }
}
