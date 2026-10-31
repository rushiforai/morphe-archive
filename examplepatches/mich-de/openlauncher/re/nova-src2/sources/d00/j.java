package d00;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f48694a;

    /* renamed from: b, reason: collision with root package name */
    public final long f48695b;

    public j(String str, long j11) {
        this.f48694a = str;
        this.f48695b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f48694a, jVar.f48694a) && this.f48695b == jVar.f48695b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f48695b) + (this.f48694a.hashCode() * 31);
    }

    public final String toString() {
        return c1.o(this.f48695b, "IbSession(userId=", ", token=<redacted>)");
    }
}
