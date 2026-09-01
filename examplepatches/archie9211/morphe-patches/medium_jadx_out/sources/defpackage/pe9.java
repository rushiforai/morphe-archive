package defpackage;

import com.medium.proto.event.PostClientVisibilityState;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pe9 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final boolean f;
    public final boolean g;
    public final String h;
    public final String i;
    public final int j;
    public final Long k;
    public final PostClientVisibilityState l;
    public final String m;

    public pe9(String str, String str2, String str3, String str4, String str5, boolean z, boolean z2, String str6, String str7, int i, Long l, PostClientVisibilityState postClientVisibilityState, String str8) {
        str.getClass();
        postClientVisibilityState.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = z;
        this.g = z2;
        this.h = str6;
        this.i = str7;
        this.j = i;
        this.k = l;
        this.l = postClientVisibilityState;
        this.m = str8;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x003c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L9b
        L5:
            boolean r1 = r5 instanceof defpackage.pe9
            r2 = 0
            if (r1 != 0) goto Lc
            goto L9a
        Lc:
            pe9 r5 = (defpackage.pe9) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1a
            goto L9a
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L26
            goto L9a
        L26:
            java.lang.String r1 = r4.c
            java.lang.String r3 = r5.c
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L32
            goto L9a
        L32:
            java.lang.String r1 = r5.d
            java.lang.String r3 = r4.d
            if (r3 != 0) goto L3e
            if (r1 != 0) goto L3c
            r1 = r0
            goto L45
        L3c:
            r1 = r2
            goto L45
        L3e:
            if (r1 != 0) goto L41
            goto L3c
        L41:
            boolean r1 = r3.equals(r1)
        L45:
            if (r1 != 0) goto L48
            goto L9a
        L48:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L53
            goto L9a
        L53:
            boolean r1 = r4.f
            boolean r3 = r5.f
            if (r1 == r3) goto L5a
            goto L9a
        L5a:
            boolean r1 = r4.g
            boolean r3 = r5.g
            if (r1 == r3) goto L61
            goto L9a
        L61:
            java.lang.String r1 = r4.h
            java.lang.String r3 = r5.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L6c
            goto L9a
        L6c:
            java.lang.String r1 = r4.i
            java.lang.String r3 = r5.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L77
            goto L9a
        L77:
            int r1 = r4.j
            int r3 = r5.j
            if (r1 == r3) goto L7e
            goto L9a
        L7e:
            java.lang.Long r1 = r4.k
            java.lang.Long r3 = r5.k
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L89
            goto L9a
        L89:
            com.medium.proto.event.PostClientVisibilityState r1 = r4.l
            com.medium.proto.event.PostClientVisibilityState r3 = r5.l
            if (r1 == r3) goto L90
            goto L9a
        L90:
            java.lang.String r4 = r4.m
            java.lang.String r5 = r5.m
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L9b
        L9a:
            return r2
        L9b:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pe9.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c);
        String str2 = this.d;
        int iHashCode2 = (iO + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.e;
        int iHashCode3 = (((((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31;
        String str4 = this.h;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.i;
        int iHashCode5 = (((iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31) + this.j) * 31;
        Long l = this.k;
        return this.m.hashCode() + ((this.l.hashCode() + ((iHashCode5 + (l != null ? l.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.d;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("PostCarouselUiModel(id=", this.a, ", title=", this.b, ", authorId=");
        ka1.C(sbU, this.c, ", authorImageId=", strA, ", authorName=");
        ka1.D(sbU, this.e, ", isLocked=", this.f, ", isVerifiedAuthor=");
        sbU.append(this.g);
        sbU.append(", collectionId=");
        sbU.append(this.h);
        sbU.append(", collectionName=");
        sbU.append(this.i);
        sbU.append(", minutesOfReadTime=");
        sbU.append(this.j);
        sbU.append(", firstPublishedAt=");
        sbU.append(this.k);
        sbU.append(", postVisibility=");
        sbU.append(this.l);
        sbU.append(", source=");
        return ka1.v(sbU, this.m, ")");
    }
}
