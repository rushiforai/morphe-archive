package u40;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f90572a;

    /* renamed from: b, reason: collision with root package name */
    public final String f90573b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90574c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90575d;

    /* renamed from: e, reason: collision with root package name */
    public final long f90576e;

    public d(String str, String str2, String str3, String str4, long j11) {
        this.f90572a = str;
        this.f90573b = str2;
        this.f90574c = str3;
        this.f90575d = str4;
        this.f90576e = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f90572a, dVar.f90572a) && Intrinsics.b(this.f90573b, dVar.f90573b) && Intrinsics.b(this.f90574c, dVar.f90574c) && Intrinsics.b(this.f90575d, dVar.f90575d) && this.f90576e == dVar.f90576e;
    }

    public final int hashCode() {
        int iHashCode = this.f90572a.hashCode() * 31;
        String str = this.f90573b;
        int iE = c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f90574c);
        String str2 = this.f90575d;
        return Long.hashCode(this.f90576e) + ((iE + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchAliasImportData(packageName=");
        sb2.append(this.f90572a);
        sb2.append(", component=");
        sb2.append(this.f90573b);
        sb2.append(", matchAlias=");
        sb2.append(this.f90574c);
        sb2.append(", displayOverride=");
        sb2.append(this.f90575d);
        sb2.append(", sourcePriority=");
        return a2.c.n(sb2, this.f90576e, ')');
    }
}
