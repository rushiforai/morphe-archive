package l20;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f74621a;

    /* renamed from: b, reason: collision with root package name */
    public final String f74622b;

    /* renamed from: c, reason: collision with root package name */
    public final String f74623c;

    public d(String str, String str2, String str3) {
        this.f74621a = str;
        this.f74622b = str2;
        this.f74623c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f74621a, dVar.f74621a) && Intrinsics.b(this.f74622b, dVar.f74622b) && Intrinsics.b(this.f74623c, dVar.f74623c);
    }

    public final int hashCode() {
        int iHashCode = this.f74621a.hashCode() * 31;
        String str = this.f74622b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f74623c;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return c0.q(c0.w("FetchData(url=", this.f74621a, ", path=", this.f74622b, ", cursor="), this.f74623c, ")");
    }
}
