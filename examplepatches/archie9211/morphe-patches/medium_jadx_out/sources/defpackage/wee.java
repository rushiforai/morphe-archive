package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wee implements yee {
    public final String a;
    public final String b;
    public final String c;
    public final Long d;
    public final Long e;
    public final List f;
    public final boolean g;
    public final boolean h;

    public wee(String str, String str2, String str3, Long l, Long l2, List list, boolean z, boolean z2) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = l;
        this.e = l2;
        this.f = list;
        this.g = z;
        this.h = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wee)) {
            return false;
        }
        wee weeVar = (wee) obj;
        return this.a.equals(weeVar.a) && g76.L(this.b, weeVar.b) && g76.L(this.c, weeVar.c) && g76.L(this.d, weeVar.d) && g76.L(this.e, weeVar.e) && this.f.equals(weeVar.f) && this.g == weeVar.g && this.h == weeVar.h;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l = this.d;
        int iHashCode4 = (iHashCode3 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.e;
        return ((wgd.p((iHashCode4 + (l2 != null ? l2.hashCode() : 0)) * 31, 31, this.f) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Success(name=", this.a, ", bio=", this.b, ", about=");
        sbU.append(this.c);
        sbU.append(", regularMemberAt=");
        sbU.append(this.d);
        sbU.append(", premiumMemberAt=");
        sbU.append(this.e);
        sbU.append(", adminPublications=");
        sbU.append(this.f);
        sbU.append(", isCurrentUser=");
        return b09.C(sbU, this.g, ", isRefreshing=", this.h, ")");
    }
}
