package u10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final float f90384a;

    /* renamed from: b, reason: collision with root package name */
    public final long f90385b;

    /* renamed from: c, reason: collision with root package name */
    public final String f90386c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90387d;

    /* renamed from: e, reason: collision with root package name */
    public final String f90388e;

    public j(float f11, long j11, String str, String str2, String str3) {
        this.f90384a = f11;
        this.f90385b = j11;
        this.f90386c = str;
        this.f90387d = str2;
        this.f90388e = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Float.compare(this.f90384a, jVar.f90384a) == 0 && this.f90385b == jVar.f90385b && Intrinsics.b(this.f90386c, jVar.f90386c) && Intrinsics.b(this.f90387d, jVar.f90387d) && Intrinsics.b(this.f90388e, jVar.f90388e);
    }

    public final int hashCode() {
        int iE = b.c0.e(b.c0.e(b.c0.d(Float.hashCode(this.f90384a) * 31, 31, this.f90385b), 31, this.f90386c), 31, this.f90387d);
        String str = this.f90388e;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppstoreMetadata(rating=");
        sb2.append(this.f90384a);
        sb2.append(", ratingCount=");
        sb2.append(this.f90385b);
        b.c0.D(sb2, ", downloadCount=", this.f90386c, ", averageSizeInMB=", this.f90387d);
        return b.c0.r(sb2, ", category=", this.f90388e, ")");
    }
}
