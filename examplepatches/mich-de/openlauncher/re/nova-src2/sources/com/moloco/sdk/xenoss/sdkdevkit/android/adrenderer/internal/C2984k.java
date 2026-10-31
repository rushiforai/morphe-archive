package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.k, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2984k {

    /* renamed from: c, reason: collision with root package name */
    public static final int f38852c = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f38853a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<String> f38854b;

    public C2984k(@Nullable Integer num, @NotNull List<String> gradient) {
        Intrinsics.g(gradient, "gradient");
        this.f38853a = num;
        this.f38854b = gradient;
    }

    @Nullable
    public final Integer a() {
        return this.f38853a;
    }

    @NotNull
    public final List<String> b() {
        return this.f38854b;
    }

    @Nullable
    public final Integer c() {
        return this.f38853a;
    }

    @NotNull
    public final List<String> d() {
        return this.f38854b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2984k)) {
            return false;
        }
        C2984k c2984k = (C2984k) obj;
        return Intrinsics.b(this.f38853a, c2984k.f38853a) && Intrinsics.b(this.f38854b, c2984k.f38854b);
    }

    public int hashCode() {
        Integer num = this.f38853a;
        return this.f38854b.hashCode() + ((num == null ? 0 : num.hashCode()) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DECBorder(borderWidth=");
        sb2.append(this.f38853a);
        sb2.append(", gradient=");
        return fq.c.e(sb2, this.f38854b, ')');
    }

    @NotNull
    public final C2984k a(@Nullable Integer num, @NotNull List<String> gradient) {
        Intrinsics.g(gradient, "gradient");
        return new C2984k(num, gradient);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ C2984k a(C2984k c2984k, Integer num, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = c2984k.f38853a;
        }
        if ((i5 & 2) != 0) {
            list = c2984k.f38854b;
        }
        return c2984k.a(num, list);
    }

    public C2984k(Integer num, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(num, (i5 & 2) != 0 ? EmptyList.f71733a : list);
    }
}
