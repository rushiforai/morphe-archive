package bn;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f18167a;

    /* renamed from: b, reason: collision with root package name */
    public final int f18168b;

    /* renamed from: c, reason: collision with root package name */
    public final int f18169c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f18170d;

    public d0(String str, int i5, int i11, boolean z11) {
        this.f18167a = str;
        this.f18168b = i5;
        this.f18169c = i11;
        this.f18170d = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return false;
        }
        d0 d0Var = (d0) obj;
        return Intrinsics.b(this.f18167a, d0Var.f18167a) && this.f18168b == d0Var.f18168b && this.f18169c == d0Var.f18169c && this.f18170d == d0Var.f18170d;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f18170d) + u4.a(this.f18169c, u4.a(this.f18168b, this.f18167a.hashCode() * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ProcessDetails(processName=");
        sb2.append(this.f18167a);
        sb2.append(", pid=");
        sb2.append(this.f18168b);
        sb2.append(", importance=");
        sb2.append(this.f18169c);
        sb2.append(", isDefaultProcess=");
        return a2.c.p(sb2, this.f18170d, ')');
    }
}
