package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Oc {

    /* renamed from: a, reason: collision with root package name */
    public final int f63024a;

    /* renamed from: b, reason: collision with root package name */
    public final long f63025b;

    /* renamed from: c, reason: collision with root package name */
    public final long f63026c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f63027d;

    public Oc(int i5, long j11, long j12, @Nullable String str) {
        this.f63024a = i5;
        this.f63025b = j11;
        this.f63026c = j12;
        this.f63027d = str;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Oc)) {
            return false;
        }
        Oc oc2 = (Oc) obj;
        return this.f63024a == oc2.f63024a && this.f63025b == oc2.f63025b && this.f63026c == oc2.f63026c && Intrinsics.b(this.f63027d, oc2.f63027d);
    }

    public final int hashCode() {
        int iA = C3231k8.a(this.f63026c, C3231k8.a(this.f63025b, Integer.hashCode(this.f63024a) * 31, 31), 31);
        String str = this.f63027d;
        return iA + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ScheduledQueryExecutionRecord(query_id=");
        sb2.append(this.f63024a);
        sb2.append(", timestamp=");
        sb2.append(this.f63025b);
        sb2.append(", duration=");
        sb2.append(this.f63026c);
        sb2.append(", error=");
        return Z.a(sb2, this.f63027d, ')');
    }
}
