package com.moloco.sdk.internal.services.bidtoken.providers;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: e, reason: collision with root package name */
    public static final int f37745e = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Boolean f37746a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Boolean f37747b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Boolean f37748c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final Float f37749d;

    public a() {
        this(null, null, null, null, 15, null);
    }

    @Nullable
    public final Boolean a() {
        return this.f37746a;
    }

    @Nullable
    public final Boolean b() {
        return this.f37747b;
    }

    @Nullable
    public final Boolean c() {
        return this.f37748c;
    }

    @Nullable
    public final Float d() {
        return this.f37749d;
    }

    @Nullable
    public final Boolean e() {
        return this.f37746a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f37746a, aVar.f37746a) && Intrinsics.b(this.f37747b, aVar.f37747b) && Intrinsics.b(this.f37748c, aVar.f37748c) && Intrinsics.b(this.f37749d, aVar.f37749d);
    }

    @Nullable
    public final Boolean f() {
        return this.f37747b;
    }

    @Nullable
    public final Float g() {
        return this.f37749d;
    }

    @Nullable
    public final Boolean h() {
        return this.f37748c;
    }

    public int hashCode() {
        Boolean bool = this.f37746a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Boolean bool2 = this.f37747b;
        int iHashCode2 = (iHashCode + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Boolean bool3 = this.f37748c;
        int iHashCode3 = (iHashCode2 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        Float f11 = this.f37749d;
        return iHashCode3 + (f11 != null ? f11.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "AccessibilitySignal(accessibilityCaptioningEnabled=" + this.f37746a + ", accessibilityLargePointerIcon=" + this.f37747b + ", reduceBrightColorsActivated=" + this.f37748c + ", fontScale=" + this.f37749d + ')';
    }

    public a(@Nullable Boolean bool, @Nullable Boolean bool2, @Nullable Boolean bool3, @Nullable Float f11) {
        this.f37746a = bool;
        this.f37747b = bool2;
        this.f37748c = bool3;
        this.f37749d = f11;
    }

    @NotNull
    public final a a(@Nullable Boolean bool, @Nullable Boolean bool2, @Nullable Boolean bool3, @Nullable Float f11) {
        return new a(bool, bool2, bool3, f11);
    }

    public static /* synthetic */ a a(a aVar, Boolean bool, Boolean bool2, Boolean bool3, Float f11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            bool = aVar.f37746a;
        }
        if ((i5 & 2) != 0) {
            bool2 = aVar.f37747b;
        }
        if ((i5 & 4) != 0) {
            bool3 = aVar.f37748c;
        }
        if ((i5 & 8) != 0) {
            f11 = aVar.f37749d;
        }
        return aVar.a(bool, bool2, bool3, f11);
    }

    public /* synthetic */ a(Boolean bool, Boolean bool2, Boolean bool3, Float f11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : bool, (i5 & 2) != 0 ? null : bool2, (i5 & 4) != 0 ? null : bool3, (i5 & 8) != 0 ? null : f11);
    }
}
