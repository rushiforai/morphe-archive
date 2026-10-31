package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ic {

    /* renamed from: a, reason: collision with root package name */
    public final int f62680a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62681b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f62682c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f62683d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f62684e;

    /* renamed from: f, reason: collision with root package name */
    public final int f62685f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final Integer f62686g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f62687h;

    public Ic(int i5, @NotNull String query, @Nullable String str, @NotNull String should_execute_now_query, @Nullable String str2, int i11, @Nullable Integer num, boolean z11) {
        Intrinsics.g(query, "query");
        Intrinsics.g(should_execute_now_query, "should_execute_now_query");
        this.f62680a = i5;
        this.f62681b = query;
        this.f62682c = str;
        this.f62683d = should_execute_now_query;
        this.f62684e = str2;
        this.f62685f = i11;
        this.f62686g = num;
        this.f62687h = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Ic)) {
            return false;
        }
        Ic ic2 = (Ic) obj;
        return this.f62680a == ic2.f62680a && Intrinsics.b(this.f62681b, ic2.f62681b) && Intrinsics.b(this.f62682c, ic2.f62682c) && Intrinsics.b(this.f62683d, ic2.f62683d) && Intrinsics.b(this.f62684e, ic2.f62684e) && this.f62685f == ic2.f62685f && Intrinsics.b(this.f62686g, ic2.f62686g) && this.f62687h == ic2.f62687h;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = C3248l8.a(this.f62681b, Integer.hashCode(this.f62680a) * 31, 31);
        String str = this.f62682c;
        int iA2 = C3248l8.a(this.f62683d, (iA + (str == null ? 0 : str.hashCode())) * 31, 31);
        String str2 = this.f62684e;
        int iA3 = C3214j8.a(this.f62685f, (iA2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31);
        Integer num = this.f62686g;
        int iHashCode = (iA3 + (num != null ? num.hashCode() : 0)) * 31;
        boolean z11 = this.f62687h;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ScheduledQuery(query_id=");
        sb2.append(this.f62680a);
        sb2.append(", query=");
        sb2.append(this.f62681b);
        sb2.append(", bindings=");
        sb2.append(this.f62682c);
        sb2.append(", should_execute_now_query=");
        sb2.append(this.f62683d);
        sb2.append(", should_execute_now_query_bindings=");
        sb2.append(this.f62684e);
        sb2.append(", weight=");
        sb2.append(this.f62685f);
        sb2.append(", transaction_group_id=");
        sb2.append(this.f62686g);
        sb2.append(", uses_cursor=");
        return a2.c.p(sb2, this.f62687h, ')');
    }
}
