package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.we, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3440we {

    /* renamed from: a, reason: collision with root package name */
    @gn.a
    @gn.c("query")
    @Nullable
    public final String f66245a;

    /* renamed from: b, reason: collision with root package name */
    @gn.a
    @gn.c("phase")
    @Nullable
    public final String f66246b;

    /* renamed from: c, reason: collision with root package name */
    @gn.a
    @gn.c("order")
    @Nullable
    public final Integer f66247c;

    /* renamed from: d, reason: collision with root package name */
    @gn.a
    @gn.c("binds")
    @Nullable
    public final String f66248d;

    /* renamed from: e, reason: collision with root package name */
    @gn.a
    @gn.c("repeat_binds")
    @Nullable
    public final Boolean f66249e;

    public C3440we() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3440we)) {
            return false;
        }
        C3440we c3440we = (C3440we) obj;
        return Intrinsics.b(this.f66245a, c3440we.f66245a) && Intrinsics.b(this.f66246b, c3440we.f66246b) && Intrinsics.b(this.f66247c, c3440we.f66247c) && Intrinsics.b(this.f66248d, c3440we.f66248d) && Intrinsics.b(this.f66249e, c3440we.f66249e);
    }

    public final int hashCode() {
        String str = this.f66245a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f66246b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.f66247c;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        String str3 = this.f66248d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Boolean bool = this.f66249e;
        return iHashCode4 + (bool != null ? bool.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        return "Statement(query=" + this.f66245a + ", phase=" + this.f66246b + ", order=" + this.f66247c + ", binds=" + this.f66248d + ", repeatBinds=" + this.f66249e + ')';
    }

    public /* synthetic */ C3440we(int i5) {
        this(null, null, null, null, null);
    }

    public C3440we(@Nullable String str, @Nullable String str2, @Nullable Integer num, @Nullable String str3, @Nullable Boolean bool) {
        this.f66245a = str;
        this.f66246b = str2;
        this.f66247c = num;
        this.f66248d = str3;
        this.f66249e = bool;
    }
}
