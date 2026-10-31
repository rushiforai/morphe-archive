package cy;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f48423a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f48424b;

    /* renamed from: c, reason: collision with root package name */
    public final String f48425c;

    /* renamed from: d, reason: collision with root package name */
    public final String f48426d;

    /* renamed from: e, reason: collision with root package name */
    public final String f48427e;

    public /* synthetic */ b(int i5, String str, boolean z11) {
        this(z11, false, null, null, (i5 & 16) != 0 ? null : str);
    }

    public final boolean a() {
        return this.f48424b;
    }

    public final String b() {
        return this.f48425c;
    }

    public final String c() {
        return this.f48426d;
    }

    public final boolean d() {
        return this.f48423a;
    }

    public final String e() {
        return this.f48427e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f48423a == bVar.f48423a && this.f48424b == bVar.f48424b && Intrinsics.b(this.f48425c, bVar.f48425c) && Intrinsics.b(this.f48426d, bVar.f48426d) && Intrinsics.b(this.f48427e, bVar.f48427e);
    }

    public final int hashCode() {
        int iF = c9.f(Boolean.hashCode(this.f48423a) * 31, 31, this.f48424b);
        String str = this.f48425c;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f48426d;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f48427e;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BackendVerificationCacheCheck(cacheMatched=");
        sb2.append(this.f48423a);
        sb2.append(", backendActive=");
        sb2.append(this.f48424b);
        sb2.append(", backendPlan=");
        b.c0.D(sb2, this.f48425c, ", backendStatus=", this.f48426d, ", reason=");
        return b.c0.q(sb2, this.f48427e, ")");
    }

    public b(boolean z11, boolean z12, String str, String str2, String str3) {
        this.f48423a = z11;
        this.f48424b = z12;
        this.f48425c = str;
        this.f48426d = str2;
        this.f48427e = str3;
    }
}
