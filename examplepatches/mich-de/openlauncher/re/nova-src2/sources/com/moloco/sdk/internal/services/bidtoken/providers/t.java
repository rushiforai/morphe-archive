package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.services.A;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class t {

    /* renamed from: e, reason: collision with root package name */
    public static final int f37836e = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f37837a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f37838b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Boolean f37839c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final A f37840d;

    public t() {
        this(null, null, null, null, 15, null);
    }

    @Nullable
    public final Integer a() {
        return this.f37837a;
    }

    @Nullable
    public final Integer b() {
        return this.f37838b;
    }

    @Nullable
    public final Boolean c() {
        return this.f37839c;
    }

    @Nullable
    public final A d() {
        return this.f37840d;
    }

    @Nullable
    public final Integer e() {
        return this.f37837a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f37837a, tVar.f37837a) && Intrinsics.b(this.f37838b, tVar.f37838b) && Intrinsics.b(this.f37839c, tVar.f37839c) && Intrinsics.b(this.f37840d, tVar.f37840d);
    }

    @Nullable
    public final Integer f() {
        return this.f37838b;
    }

    @Nullable
    public final Boolean g() {
        return this.f37839c;
    }

    @Nullable
    public final A h() {
        return this.f37840d;
    }

    public int hashCode() {
        Integer num = this.f37837a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f37838b;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Boolean bool = this.f37839c;
        int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
        A a11 = this.f37840d;
        return iHashCode3 + (a11 != null ? a11.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "NetworkInfoSignal(mobileCountryCode=" + this.f37837a + ", mobileNetworkCode=" + this.f37838b + ", networkRestricted=" + this.f37839c + ", networkType=" + this.f37840d + ')';
    }

    public t(@Nullable Integer num, @Nullable Integer num2, @Nullable Boolean bool, @Nullable A a11) {
        this.f37837a = num;
        this.f37838b = num2;
        this.f37839c = bool;
        this.f37840d = a11;
    }

    @NotNull
    public final t a(@Nullable Integer num, @Nullable Integer num2, @Nullable Boolean bool, @Nullable A a11) {
        return new t(num, num2, bool, a11);
    }

    public static /* synthetic */ t a(t tVar, Integer num, Integer num2, Boolean bool, A a11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = tVar.f37837a;
        }
        if ((i5 & 2) != 0) {
            num2 = tVar.f37838b;
        }
        if ((i5 & 4) != 0) {
            bool = tVar.f37839c;
        }
        if ((i5 & 8) != 0) {
            a11 = tVar.f37840d;
        }
        return tVar.a(num, num2, bool, a11);
    }

    public /* synthetic */ t(Integer num, Integer num2, Boolean bool, A a11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : num, (i5 & 2) != 0 ? null : num2, (i5 & 4) != 0 ? null : bool, (i5 & 8) != 0 ? null : a11);
    }
}
