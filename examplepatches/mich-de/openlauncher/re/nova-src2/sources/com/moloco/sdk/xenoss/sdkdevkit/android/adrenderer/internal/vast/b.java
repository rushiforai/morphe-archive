package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.q;
import java.util.Comparator;
import kotlin.Pair;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b implements Comparator<q> {

    /* renamed from: a, reason: collision with root package name */
    public final double f40190a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Long f40191b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Integer f40192c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Integer f40193d;

    public b(double d5, @Nullable Long l9, @Nullable Integer num, @Nullable Integer num2) {
        this.f40190a = d5;
        this.f40191b = l9;
        this.f40192c = num;
        this.f40193d = num2;
    }

    @Override // java.util.Comparator
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public int compare(@NotNull q mf1, @NotNull q mf2) {
        Intrinsics.g(mf1, "mf1");
        Intrinsics.g(mf2, "mf2");
        Pair pairB = g.b(mf1, mf2, this.f40190a, this.f40191b, this.f40192c, this.f40193d);
        return Intrinsics.h(((Number) pairB.f71684b).intValue(), ((Number) pairB.f71683a).intValue());
    }

    public /* synthetic */ b(double d5, Long l9, Integer num, Integer num2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(d5, (i5 & 2) != 0 ? null : l9, (i5 & 4) != 0 ? null : num, (i5 & 8) != 0 ? null : num2);
    }
}
