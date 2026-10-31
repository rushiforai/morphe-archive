package com.moloco.sdk.acm.db;

import b.c0;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final long f36026a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f36027b;

    /* renamed from: c, reason: collision with root package name */
    public final long f36028c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final c f36029d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final Long f36030e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<String> f36031f;

    public b(long j11, @NotNull String name, long j12, @NotNull c eventType, @Nullable Long l9, @NotNull List<String> tags) {
        Intrinsics.g(name, "name");
        Intrinsics.g(eventType, "eventType");
        Intrinsics.g(tags, "tags");
        this.f36026a = j11;
        this.f36027b = name;
        this.f36028c = j12;
        this.f36029d = eventType;
        this.f36030e = l9;
        this.f36031f = tags;
    }

    public final long a() {
        return this.f36026a;
    }

    @NotNull
    public final String b() {
        return this.f36027b;
    }

    public final long c() {
        return this.f36028c;
    }

    @NotNull
    public final c d() {
        return this.f36029d;
    }

    @Nullable
    public final Long e() {
        return this.f36030e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f36026a == bVar.f36026a && Intrinsics.b(this.f36027b, bVar.f36027b) && this.f36028c == bVar.f36028c && this.f36029d == bVar.f36029d && Intrinsics.b(this.f36030e, bVar.f36030e) && Intrinsics.b(this.f36031f, bVar.f36031f);
    }

    @NotNull
    public final List<String> f() {
        return this.f36031f;
    }

    @Nullable
    public final Long g() {
        return this.f36030e;
    }

    @NotNull
    public final c h() {
        return this.f36029d;
    }

    public int hashCode() {
        int iHashCode = (this.f36029d.hashCode() + c0.d(c0.e(Long.hashCode(this.f36026a) * 31, 31, this.f36027b), 31, this.f36028c)) * 31;
        Long l9 = this.f36030e;
        return this.f36031f.hashCode() + ((iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31);
    }

    public final long i() {
        return this.f36026a;
    }

    @NotNull
    public final String j() {
        return this.f36027b;
    }

    @NotNull
    public final List<String> k() {
        return this.f36031f;
    }

    public final long l() {
        return this.f36028c;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("EventEntity(id=");
        sb2.append(this.f36026a);
        sb2.append(", name=");
        sb2.append(this.f36027b);
        sb2.append(", timestamp=");
        sb2.append(this.f36028c);
        sb2.append(", eventType=");
        sb2.append(this.f36029d);
        sb2.append(", data=");
        sb2.append(this.f36030e);
        sb2.append(", tags=");
        return fq.c.e(sb2, this.f36031f, ')');
    }

    @NotNull
    public final b a(long j11, @NotNull String name, long j12, @NotNull c eventType, @Nullable Long l9, @NotNull List<String> tags) {
        Intrinsics.g(name, "name");
        Intrinsics.g(eventType, "eventType");
        Intrinsics.g(tags, "tags");
        return new b(j11, name, j12, eventType, l9, tags);
    }

    public static /* synthetic */ b a(b bVar, long j11, String str, long j12, c cVar, Long l9, List list, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = bVar.f36026a;
        }
        long j13 = j11;
        if ((i5 & 2) != 0) {
            str = bVar.f36027b;
        }
        String str2 = str;
        if ((i5 & 4) != 0) {
            j12 = bVar.f36028c;
        }
        long j14 = j12;
        if ((i5 & 8) != 0) {
            cVar = bVar.f36029d;
        }
        return bVar.a(j13, str2, j14, cVar, (i5 & 16) != 0 ? bVar.f36030e : l9, (i5 & 32) != 0 ? bVar.f36031f : list);
    }

    public b(long j11, String str, long j12, c cVar, Long l9, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? 0L : j11, str, j12, cVar, (i5 & 16) != 0 ? null : l9, (i5 & 32) != 0 ? EmptyList.f71733a : list);
    }
}
