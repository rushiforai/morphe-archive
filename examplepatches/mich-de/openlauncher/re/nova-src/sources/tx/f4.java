package tx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f4 {

    /* renamed from: a, reason: collision with root package name */
    public final String f89741a;

    /* renamed from: b, reason: collision with root package name */
    public final long f89742b;

    public f4(String str, long j11) {
        this.f89741a = str;
        this.f89742b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f4)) {
            return false;
        }
        f4 f4Var = (f4) obj;
        return Intrinsics.b(this.f89741a, f4Var.f89741a) && this.f89742b == f4Var.f89742b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f89742b) + (this.f89741a.hashCode() * 31);
    }

    public final String toString() {
        return "SearchEntry(query=" + this.f89741a + ", searchedAt=" + this.f89742b + ")";
    }
}
