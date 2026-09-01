package defpackage;

import com.medium.android.profile.ui.you.YouProfileTab;
import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ubf implements xbf {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final Long e;
    public final Long f;
    public final boolean g;
    public final List h;
    public final List i;
    public final YouProfileTab j;
    public final SourceParameter k;
    public final boolean l;
    public final int m;

    public ubf(String str, String str2, String str3, boolean z, Long l, Long l2, boolean z2, List list, List list2, YouProfileTab youProfileTab, SourceParameter sourceParameter, boolean z3) {
        str.getClass();
        str2.getClass();
        list.getClass();
        youProfileTab.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = l;
        this.f = l2;
        this.g = z2;
        this.h = list;
        this.i = list2;
        this.j = youProfileTab;
        this.k = sourceParameter;
        this.l = z3;
        int iIndexOf = list2.indexOf(youProfileTab);
        Integer numValueOf = iIndexOf < 0 ? null : Integer.valueOf(iIndexOf);
        this.m = numValueOf != null ? numValueOf.intValue() : 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L93
        L5:
            boolean r1 = r5 instanceof defpackage.ubf
            r2 = 0
            if (r1 != 0) goto Lc
            goto L92
        Lc:
            ubf r5 = (defpackage.ubf) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1a
            goto L92
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L26
            goto L92
        L26:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L32
            if (r1 != 0) goto L30
            r1 = r0
            goto L39
        L30:
            r1 = r2
            goto L39
        L32:
            if (r1 != 0) goto L35
            goto L30
        L35:
            boolean r1 = r3.equals(r1)
        L39:
            if (r1 != 0) goto L3c
            goto L92
        L3c:
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L43
            goto L92
        L43:
            java.lang.Long r1 = r4.e
            java.lang.Long r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4e
            goto L92
        L4e:
            java.lang.Long r1 = r4.f
            java.lang.Long r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L59
            goto L92
        L59:
            boolean r1 = r4.g
            boolean r3 = r5.g
            if (r1 == r3) goto L60
            goto L92
        L60:
            java.util.List r1 = r4.h
            java.util.List r3 = r5.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L6b
            goto L92
        L6b:
            java.util.List r1 = r4.i
            java.util.List r3 = r5.i
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L76
            goto L92
        L76:
            com.medium.android.profile.ui.you.YouProfileTab r1 = r4.j
            com.medium.android.profile.ui.you.YouProfileTab r3 = r5.j
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L81
            goto L92
        L81:
            gen.model.SourceParameter r1 = r4.k
            gen.model.SourceParameter r3 = r5.k
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L8c
            goto L92
        L8c:
            boolean r4 = r4.l
            boolean r5 = r5.l
            if (r4 == r5) goto L93
        L92:
            return r2
        L93:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ubf.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31;
        Long l = this.e;
        int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.f;
        return ev6.o(this.k, (this.j.hashCode() + wgd.p(wgd.p((((iHashCode2 + (l2 != null ? l2.hashCode() : 0)) * 31) + (this.g ? 1231 : 1237)) * 31, 31, this.h), 31, this.i)) * 31, 31) + (this.l ? 1231 : 1237);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("Content(userId=", this.a, ", userName=", this.b, ", userImageId=");
        ka1.D(sbU, strA, ", isPremiumMember=", this.d, ", followerCount=");
        sbU.append(this.e);
        sbU.append(", followingCount=");
        sbU.append(this.f);
        sbU.append(", isBookAuthor=");
        sbU.append(this.g);
        sbU.append(", pronouns=");
        sbU.append(this.h);
        sbU.append(", tabs=");
        sbU.append(this.i);
        sbU.append(", selectedTab=");
        sbU.append(this.j);
        sbU.append(", sourceParameter=");
        sbU.append(this.k);
        sbU.append(", isRefreshing=");
        sbU.append(this.l);
        sbU.append(")");
        return sbU.toString();
    }
}
