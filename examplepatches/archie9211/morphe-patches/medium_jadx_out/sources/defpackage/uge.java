package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uge {
    public final String a;
    public final String b;
    public final String c;
    public final Long d;
    public final Long e;
    public final wu4 f;
    public final boolean g;
    public final boolean h;
    public final List i;
    public final SourceParameter j;

    public uge(String str, String str2, String str3, Long l, Long l2, wu4 wu4Var, boolean z, boolean z2, List list, SourceParameter sourceParameter) {
        str.getClass();
        list.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = l;
        this.e = l2;
        this.f = wu4Var;
        this.g = z;
        this.h = z2;
        this.i = list;
        this.j = sourceParameter;
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
            goto L81
        L5:
            boolean r1 = r5 instanceof defpackage.uge
            r2 = 0
            if (r1 != 0) goto Lc
            goto L80
        Lc:
            uge r5 = (defpackage.uge) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1a
            goto L80
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L26
            goto L80
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
            goto L80
        L3c:
            java.lang.Long r1 = r4.d
            java.lang.Long r3 = r5.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L47
            goto L80
        L47:
            java.lang.Long r1 = r4.e
            java.lang.Long r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L52
            goto L80
        L52:
            wu4 r1 = r4.f
            wu4 r3 = r5.f
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L5d
            goto L80
        L5d:
            boolean r1 = r4.g
            boolean r3 = r5.g
            if (r1 == r3) goto L64
            goto L80
        L64:
            boolean r1 = r4.h
            boolean r3 = r5.h
            if (r1 == r3) goto L6b
            goto L80
        L6b:
            java.util.List r1 = r4.i
            java.util.List r3 = r5.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L76
            goto L80
        L76:
            gen.model.SourceParameter r4 = r4.j
            gen.model.SourceParameter r5 = r5.j
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 != 0) goto L81
        L80:
            return r2
        L81:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uge.equals(java.lang.Object):boolean");
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
        return this.j.hashCode() + wgd.p((((((this.f.hashCode() + ((iHashCode4 + (l2 != null ? l2.hashCode() : 0)) * 31)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31, 31, this.i);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("UserProfileHeaderUiModel(id=", this.a, ", name=", this.b, ", imageId=");
        sbU.append(strA);
        sbU.append(", followerCount=");
        sbU.append(this.d);
        sbU.append(", followingCount=");
        sbU.append(this.e);
        sbU.append(", followSubscribeUiModel=");
        sbU.append(this.f);
        sbU.append(", isPremiumMember=");
        ho2.R(sbU, this.g, ", isVerifiedAuthor=", this.h, ", pronouns=");
        sbU.append(this.i);
        sbU.append(", sourceParameter=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}
