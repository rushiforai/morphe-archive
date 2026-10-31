package qm;

import b.c0;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f84247a;

    /* renamed from: b, reason: collision with root package name */
    public final String f84248b;

    /* renamed from: c, reason: collision with root package name */
    public final String f84249c;

    /* renamed from: d, reason: collision with root package name */
    public final c f84250d;

    /* renamed from: e, reason: collision with root package name */
    public final int f84251e;

    public a(String str, String str2, String str3, c cVar, int i5) {
        this.f84247a = str;
        this.f84248b = str2;
        this.f84249c = str3;
        this.f84250d = cVar;
        this.f84251e = i5;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        int i5 = aVar.f84251e;
        c cVar = aVar.f84250d;
        String str = aVar.f84249c;
        String str2 = aVar.f84248b;
        String str3 = aVar.f84247a;
        String str4 = this.f84247a;
        if (str4 == null) {
            if (str3 != null) {
                return false;
            }
        } else if (!str4.equals(str3)) {
            return false;
        }
        String str5 = this.f84248b;
        if (str5 == null) {
            if (str2 != null) {
                return false;
            }
        } else if (!str5.equals(str2)) {
            return false;
        }
        String str6 = this.f84249c;
        if (str6 == null) {
            if (str != null) {
                return false;
            }
        } else if (!str6.equals(str)) {
            return false;
        }
        c cVar2 = this.f84250d;
        if (cVar2 == null) {
            if (cVar != null) {
                return false;
            }
        } else if (!cVar2.equals(cVar)) {
            return false;
        }
        int i11 = this.f84251e;
        return i11 == 0 ? i5 == 0 : c0.b(i11, i5);
    }

    public final int hashCode() {
        String str = this.f84247a;
        int iHashCode = ((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003;
        String str2 = this.f84248b;
        int iHashCode2 = (iHashCode ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        String str3 = this.f84249c;
        int iHashCode3 = (iHashCode2 ^ (str3 == null ? 0 : str3.hashCode())) * 1000003;
        c cVar = this.f84250d;
        int iHashCode4 = (iHashCode3 ^ (cVar == null ? 0 : cVar.hashCode())) * 1000003;
        int i5 = this.f84251e;
        return (i5 != 0 ? c0.F(i5) : 0) ^ iHashCode4;
    }

    public final String toString() {
        return "InstallationResponse{uri=" + this.f84247a + ", fid=" + this.f84248b + ", refreshToken=" + this.f84249c + ", authToken=" + this.f84250d + ", responseCode=" + e.r(this.f84251e) + "}";
    }
}
