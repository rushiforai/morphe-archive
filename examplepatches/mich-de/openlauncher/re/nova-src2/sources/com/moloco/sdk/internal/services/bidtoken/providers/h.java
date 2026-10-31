package com.moloco.sdk.internal.services.bidtoken.providers;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37775d = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Integer f37776a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f37777b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Boolean f37778c;

    public h() {
        this(null, null, null, 7, null);
    }

    @Nullable
    public final Integer a() {
        return this.f37776a;
    }

    @Nullable
    public final Integer b() {
        return this.f37777b;
    }

    @Nullable
    public final Boolean c() {
        return this.f37778c;
    }

    @Nullable
    public final Integer d() {
        return this.f37777b;
    }

    @Nullable
    public final Integer e() {
        return this.f37776a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.f37776a, hVar.f37776a) && Intrinsics.b(this.f37777b, hVar.f37777b) && Intrinsics.b(this.f37778c, hVar.f37778c);
    }

    @Nullable
    public final Boolean f() {
        return this.f37778c;
    }

    public int hashCode() {
        Integer num = this.f37776a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f37777b;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Boolean bool = this.f37778c;
        return iHashCode2 + (bool != null ? bool.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "BatteryInfoSignal(maxBatteryLevel=" + this.f37776a + ", batteryStatus=" + this.f37777b + ", isPowerSaveMode=" + this.f37778c + ')';
    }

    public h(@Nullable Integer num, @Nullable Integer num2, @Nullable Boolean bool) {
        this.f37776a = num;
        this.f37777b = num2;
        this.f37778c = bool;
    }

    @NotNull
    public final h a(@Nullable Integer num, @Nullable Integer num2, @Nullable Boolean bool) {
        return new h(num, num2, bool);
    }

    public static /* synthetic */ h a(h hVar, Integer num, Integer num2, Boolean bool, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            num = hVar.f37776a;
        }
        if ((i5 & 2) != 0) {
            num2 = hVar.f37777b;
        }
        if ((i5 & 4) != 0) {
            bool = hVar.f37778c;
        }
        return hVar.a(num, num2, bool);
    }

    public /* synthetic */ h(Integer num, Integer num2, Boolean bool, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : num, (i5 & 2) != 0 ? null : num2, (i5 & 4) != 0 ? null : bool);
    }
}
