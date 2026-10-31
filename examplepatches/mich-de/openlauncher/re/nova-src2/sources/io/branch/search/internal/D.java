package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class D {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62316a;

    /* renamed from: b, reason: collision with root package name */
    public final int f62317b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62318c;

    /* renamed from: d, reason: collision with root package name */
    public final long f62319d;

    /* renamed from: e, reason: collision with root package name */
    public final long f62320e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Long f62321f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final Integer f62322g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final Boolean f62323h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final Boolean f62324i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final Boolean f62325j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final Boolean f62326k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final Boolean f62327l;

    /* renamed from: m, reason: collision with root package name */
    @Nullable
    public final Boolean f62328m;

    public D(@NotNull String params, int i5, long j11, long j12, long j13, @Nullable Long l9, @Nullable Integer num, @Nullable Boolean bool, @Nullable Boolean bool2, @Nullable Boolean bool3, @Nullable Boolean bool4, @Nullable Boolean bool5, @Nullable Boolean bool6) {
        Intrinsics.g(params, "params");
        this.f62316a = params;
        this.f62317b = i5;
        this.f62318c = j11;
        this.f62319d = j12;
        this.f62320e = j13;
        this.f62321f = l9;
        this.f62322g = num;
        this.f62323h = bool;
        this.f62324i = bool2;
        this.f62325j = bool3;
        this.f62326k = bool4;
        this.f62327l = bool5;
        this.f62328m = bool6;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof D)) {
            return false;
        }
        D d5 = (D) obj;
        return Intrinsics.b(this.f62316a, d5.f62316a) && this.f62317b == d5.f62317b && this.f62318c == d5.f62318c && this.f62319d == d5.f62319d && this.f62320e == d5.f62320e && Intrinsics.b(this.f62321f, d5.f62321f) && Intrinsics.b(this.f62322g, d5.f62322g) && Intrinsics.b(this.f62323h, d5.f62323h) && Intrinsics.b(this.f62324i, d5.f62324i) && Intrinsics.b(this.f62325j, d5.f62325j) && Intrinsics.b(this.f62326k, d5.f62326k) && Intrinsics.b(this.f62327l, d5.f62327l) && Intrinsics.b(this.f62328m, d5.f62328m);
    }

    public final int hashCode() {
        int iA = C3231k8.a(this.f62320e, C3231k8.a(this.f62319d, C3231k8.a(this.f62318c, C3214j8.a(this.f62317b, this.f62316a.hashCode() * 31, 31), 31), 31), 31);
        Long l9 = this.f62321f;
        int iHashCode = (iA + (l9 == null ? 0 : l9.hashCode())) * 31;
        Integer num = this.f62322g;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Boolean bool = this.f62323h;
        int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.f62324i;
        int iHashCode4 = (iHashCode3 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Boolean bool3 = this.f62325j;
        int iHashCode5 = (iHashCode4 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        Boolean bool4 = this.f62326k;
        int iHashCode6 = (iHashCode5 + (bool4 == null ? 0 : bool4.hashCode())) * 31;
        Boolean bool5 = this.f62327l;
        int iHashCode7 = (iHashCode6 + (bool5 == null ? 0 : bool5.hashCode())) * 31;
        Boolean bool6 = this.f62328m;
        return iHashCode7 + (bool6 != null ? bool6.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        return "AggregateAnalyticsQueryResult(params=" + this.f62316a + ", query_id=" + this.f62317b + ", timestamp=" + this.f62318c + ", min_wait_time=" + this.f62319d + ", max_wait_time=" + this.f62320e + ", initial_backoff_millis=" + this.f62321f + ", back_off_type=" + this.f62322g + ", only_on_wifi=" + this.f62323h + ", must_not_have_low_battery=" + this.f62324i + ", requires_connectivity=" + this.f62325j + ", requires_charging=" + this.f62326k + ", requires_storage_not_low=" + this.f62327l + ", requires_idle_device=" + this.f62328m + ')';
    }
}
