package defpackage;

import gen.model.SourceParameter;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hia {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final Integer e;
    public final bo4 f;
    public final gia g;
    public final Long h;
    public final String i;
    public final SourceParameter j;

    public hia(String str, String str2, String str3, String str4, Integer num, bo4 bo4Var, gia giaVar, Long l, String str5, SourceParameter sourceParameter) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = num;
        this.f = bo4Var;
        this.g = giaVar;
        this.h = l;
        this.i = str5;
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
            goto L89
        L5:
            boolean r1 = r5 instanceof defpackage.hia
            r2 = 0
            if (r1 != 0) goto Lc
            goto L88
        Lc:
            hia r5 = (defpackage.hia) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1a
            goto L88
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L26
            goto L88
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
            goto L88
        L3c:
            java.lang.String r1 = r4.d
            java.lang.String r3 = r5.d
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L47
            goto L88
        L47:
            java.lang.Integer r1 = r4.e
            java.lang.Integer r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L52
            goto L88
        L52:
            bo4 r1 = r4.f
            bo4 r3 = r5.f
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L5d
            goto L88
        L5d:
            gia r1 = r4.g
            gia r3 = r5.g
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L68
            goto L88
        L68:
            java.lang.Long r1 = r4.h
            java.lang.Long r3 = r5.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L73
            goto L88
        L73:
            java.lang.String r1 = r4.i
            java.lang.String r3 = r5.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L7e
            goto L88
        L7e:
            gen.model.SourceParameter r4 = r4.j
            gen.model.SourceParameter r5 = r5.j
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L89
        L88:
            return r2
        L89:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hia.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Integer num = this.e;
        int iA = ka1.a(this.f, (iHashCode4 + (num == null ? 0 : num.hashCode())) * 31, 31);
        gia giaVar = this.g;
        int iHashCode5 = (iA + (giaVar == null ? 0 : giaVar.hashCode())) * 31;
        Long l = this.h;
        int iHashCode6 = (iHashCode5 + (l == null ? 0 : l.hashCode())) * 31;
        String str4 = this.i;
        return this.j.hashCode() + ((iHashCode6 + (str4 != null ? str4.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? eoLmc.jMoSVYZTnRwf : ax5.a(str);
        StringBuilder sbU = y30.u("PublicationFooterUiModel(id=", this.a, ", name=", this.b, ", imageId=");
        ka1.C(sbU, strA, ", bio=", this.d, ", followersCount=");
        sbU.append(this.e);
        sbU.append(", isFollowingStream=");
        sbU.append(this.f);
        sbU.append(", newsletter=");
        sbU.append(this.g);
        sbU.append(", latestPublishedDate=");
        sbU.append(this.h);
        sbU.append(", latestPublishedPostId=");
        sbU.append(this.i);
        sbU.append(", sourceParameter=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}
