package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.orientation;

import a2.c;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: c, reason: collision with root package name */
    public static final int f39386c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final a f39387a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f39388b;

    public b(@NotNull a orientation, boolean z11) {
        Intrinsics.g(orientation, "orientation");
        this.f39387a = orientation;
        this.f39388b = z11;
    }

    @NotNull
    public final a a() {
        return this.f39387a;
    }

    public final boolean b() {
        return this.f39388b;
    }

    public final boolean c() {
        return this.f39388b;
    }

    @NotNull
    public final a d() {
        return this.f39387a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f39387a == bVar.f39387a && this.f39388b == bVar.f39388b;
    }

    public int hashCode() {
        return Boolean.hashCode(this.f39388b) + (this.f39387a.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("OrientationSettings(orientation=");
        sb2.append(this.f39387a);
        sb2.append(", allowOrientationChange=");
        return c.p(sb2, this.f39388b, ')');
    }

    public /* synthetic */ b(a aVar, boolean z11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(aVar, (i5 & 2) != 0 ? true : z11);
    }

    @NotNull
    public final b a(@NotNull a orientation, boolean z11) {
        Intrinsics.g(orientation, "orientation");
        return new b(orientation, z11);
    }

    public static /* synthetic */ b a(b bVar, a aVar, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            aVar = bVar.f39387a;
        }
        if ((i5 & 2) != 0) {
            z11 = bVar.f39388b;
        }
        return bVar.a(aVar, z11);
    }
}
