package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2982i;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public static final int f39072b = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final C2982i f39073a;

    /* JADX WARN: Multi-variable type inference failed */
    public c() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    @Nullable
    public final C2982i a() {
        return this.f39073a;
    }

    @Nullable
    public final C2982i b() {
        return this.f39073a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f39073a, ((c) obj).f39073a);
    }

    public int hashCode() {
        C2982i c2982i = this.f39073a;
        if (c2982i == null) {
            return 0;
        }
        return c2982i.hashCode();
    }

    @NotNull
    public String toString() {
        return "MraidAdData(dec=" + this.f39073a + ')';
    }

    public c(@Nullable C2982i c2982i) {
        this.f39073a = c2982i;
    }

    @NotNull
    public final c a(@Nullable C2982i c2982i) {
        return new c(c2982i);
    }

    public static /* synthetic */ c a(c cVar, C2982i c2982i, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            c2982i = cVar.f39073a;
        }
        return cVar.a(c2982i);
    }

    public /* synthetic */ c(C2982i c2982i, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : c2982i);
    }
}
