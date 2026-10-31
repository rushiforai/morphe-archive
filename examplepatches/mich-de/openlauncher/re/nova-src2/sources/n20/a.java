package n20;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f77713a;

    /* renamed from: b, reason: collision with root package name */
    public final List f77714b;

    /* renamed from: c, reason: collision with root package name */
    public final long f77715c;

    public a(List list, boolean z11, long j11) {
        this.f77713a = z11;
        this.f77714b = list;
        this.f77715c = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f77713a == aVar.f77713a && Intrinsics.b(this.f77714b, aVar.f77714b) && this.f77715c == aVar.f77715c;
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f77713a) * 31;
        List list = this.f77714b;
        return Long.hashCode(this.f77715c) + ((iHashCode + (list == null ? 0 : list.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ApiResult(hasError=");
        sb2.append(this.f77713a);
        sb2.append(", links=");
        sb2.append(this.f77714b);
        sb2.append(", bytesReceived=");
        return a2.c.i(this.f77715c, ")", sb2);
    }
}
