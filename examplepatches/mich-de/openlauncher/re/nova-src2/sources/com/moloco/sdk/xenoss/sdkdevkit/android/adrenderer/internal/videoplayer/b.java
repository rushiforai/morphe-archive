package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer;

import b.c9;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: d, reason: collision with root package name */
    public static final int f41898d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f41899a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f41900b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f41901c;

    public b(boolean z11, boolean z12, boolean z13) {
        this.f41899a = z11;
        this.f41900b = z12;
        this.f41901c = z13;
    }

    public final boolean a() {
        return this.f41899a;
    }

    public final boolean b() {
        return this.f41900b;
    }

    public final boolean c() {
        return this.f41901c;
    }

    public final boolean d() {
        return this.f41901c;
    }

    public final boolean e() {
        return this.f41899a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f41899a == bVar.f41899a && this.f41900b == bVar.f41900b && this.f41901c == bVar.f41901c;
    }

    public final boolean f() {
        return this.f41900b;
    }

    public int hashCode() {
        return Boolean.hashCode(this.f41901c) + c9.f(Boolean.hashCode(this.f41899a) * 31, 31, this.f41900b);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("PlayingState(isPlaying=");
        sb2.append(this.f41899a);
        sb2.append(", isVisible=");
        sb2.append(this.f41900b);
        sb2.append(", hasMore=");
        return a2.c.p(sb2, this.f41901c, ')');
    }

    @NotNull
    public final b a(boolean z11, boolean z12, boolean z13) {
        return new b(z11, z12, z13);
    }

    public static /* synthetic */ b a(b bVar, boolean z11, boolean z12, boolean z13, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = bVar.f41899a;
        }
        if ((i5 & 2) != 0) {
            z12 = bVar.f41900b;
        }
        if ((i5 & 4) != 0) {
            z13 = bVar.f41901c;
        }
        return bVar.a(z11, z12, z13);
    }

    public /* synthetic */ b(boolean z11, boolean z12, boolean z13, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(z11, (i5 & 2) != 0 ? true : z12, (i5 & 4) != 0 ? true : z13);
    }
}
