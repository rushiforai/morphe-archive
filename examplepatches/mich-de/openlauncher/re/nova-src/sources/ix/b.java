package ix;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f68177a;

    /* renamed from: b, reason: collision with root package name */
    public final double f68178b;

    /* renamed from: c, reason: collision with root package name */
    public final int f68179c;

    public b(String str, int i5, double d5) {
        this.f68177a = str;
        this.f68178b = d5;
        this.f68179c = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f68177a, bVar.f68177a) && Double.compare(this.f68178b, bVar.f68178b) == 0 && this.f68179c == bVar.f68179c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f68179c) + c9.c(this.f68178b, this.f68177a.hashCode() * 31, 31);
    }

    public final String toString() {
        return "ColorNameResult(name=" + this.f68177a + ", deltaE=" + this.f68178b + ", rgb=" + this.f68179c + ")";
    }
}
