package com.moloco.sdk.internal.utils;

import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final a f38215c = new a(null);

    /* renamed from: d, reason: collision with root package name */
    public static final int f38216d = 0;

    /* renamed from: e, reason: collision with root package name */
    public static final int f38217e = 100;

    /* renamed from: a, reason: collision with root package name */
    public final long f38218a;

    /* renamed from: b, reason: collision with root package name */
    public final long f38219b;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public e(long j11, long j12) {
        this.f38218a = j11;
        this.f38219b = j12;
    }

    public final long a() {
        return this.f38218a;
    }

    public final long b() {
        return this.f38219b;
    }

    public final long c() {
        return this.f38218a;
    }

    public final long d() {
        return this.f38219b;
    }

    @Nullable
    public final Integer e() {
        long j11 = this.f38219b;
        if (j11 > 0) {
            return Integer.valueOf((int) (((j11 - this.f38218a) * 100) / j11));
        }
        return null;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f38218a == eVar.f38218a && this.f38219b == eVar.f38219b;
    }

    public int hashCode() {
        return Long.hashCode(this.f38219b) + (Long.hashCode(this.f38218a) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("StorageInfo(availableBytes=");
        sb2.append(this.f38218a);
        sb2.append(", totalBytes=");
        return a2.c.n(sb2, this.f38219b, ')');
    }

    @NotNull
    public final e a(long j11, long j12) {
        return new e(j11, j12);
    }

    public static /* synthetic */ e a(e eVar, long j11, long j12, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = eVar.f38218a;
        }
        if ((i5 & 2) != 0) {
            j12 = eVar.f38219b;
        }
        return eVar.a(j11, j12);
    }
}
