package com.moloco.sdk.internal.services.bidtoken.providers;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37827d = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Boolean f37828a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Long f37829b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Long f37830c;

    public r() {
        this(null, null, null, 7, null);
    }

    @Nullable
    public final Boolean a() {
        return this.f37828a;
    }

    @Nullable
    public final Long b() {
        return this.f37829b;
    }

    @Nullable
    public final Long c() {
        return this.f37830c;
    }

    @Nullable
    public final Boolean d() {
        return this.f37828a;
    }

    @Nullable
    public final Long e() {
        return this.f37829b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return Intrinsics.b(this.f37828a, rVar.f37828a) && Intrinsics.b(this.f37829b, rVar.f37829b) && Intrinsics.b(this.f37830c, rVar.f37830c);
    }

    @Nullable
    public final Long f() {
        return this.f37830c;
    }

    public int hashCode() {
        Boolean bool = this.f37828a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Long l9 = this.f37829b;
        int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
        Long l11 = this.f37830c;
        return iHashCode2 + (l11 != null ? l11.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "MemoryInfoSignal(lowMemory=" + this.f37828a + ", threshold=" + this.f37829b + ", totalMem=" + this.f37830c + ')';
    }

    public r(@Nullable Boolean bool, @Nullable Long l9, @Nullable Long l11) {
        this.f37828a = bool;
        this.f37829b = l9;
        this.f37830c = l11;
    }

    @NotNull
    public final r a(@Nullable Boolean bool, @Nullable Long l9, @Nullable Long l11) {
        return new r(bool, l9, l11);
    }

    public static /* synthetic */ r a(r rVar, Boolean bool, Long l9, Long l11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            bool = rVar.f37828a;
        }
        if ((i5 & 2) != 0) {
            l9 = rVar.f37829b;
        }
        if ((i5 & 4) != 0) {
            l11 = rVar.f37830c;
        }
        return rVar.a(bool, l9, l11);
    }

    public /* synthetic */ r(Boolean bool, Long l9, Long l11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : bool, (i5 & 2) != 0 ? null : l9, (i5 & 4) != 0 ? null : l11);
    }
}
