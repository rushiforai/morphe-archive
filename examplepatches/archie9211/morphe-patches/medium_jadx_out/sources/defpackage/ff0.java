package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ff0 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final cf0 e;
    public final bo4 f;
    public final int g;
    public final vv2 h;
    public final SourceParameter i;
    public final bo4 j;

    public ff0(String str, String str2, String str3, boolean z, cf0 cf0Var, bo4 bo4Var, int i, vv2 vv2Var, SourceParameter sourceParameter, bo4 bo4Var2) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = cf0Var;
        this.f = bo4Var;
        this.g = i;
        this.h = vv2Var;
        this.i = sourceParameter;
        this.j = bo4Var2;
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
            boolean r1 = r5 instanceof defpackage.ff0
            r2 = 0
            if (r1 != 0) goto Lc
            goto L80
        Lc:
            ff0 r5 = (defpackage.ff0) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L1a
            goto L80
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = r1.equals(r3)
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
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L43
            goto L80
        L43:
            cf0 r1 = r4.e
            cf0 r3 = r5.e
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L4e
            goto L80
        L4e:
            bo4 r1 = r4.f
            bo4 r3 = r5.f
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L59
            goto L80
        L59:
            int r1 = r4.g
            int r3 = r5.g
            if (r1 == r3) goto L60
            goto L80
        L60:
            vv2 r1 = r4.h
            vv2 r3 = r5.h
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L6b
            goto L80
        L6b:
            gen.model.SourceParameter r1 = r4.i
            gen.model.SourceParameter r3 = r5.i
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L76
            goto L80
        L76:
            bo4 r4 = r4.j
            bo4 r5 = r5.j
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L81
        L80:
            return r2
        L81:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ff0.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31;
        cf0 cf0Var = this.e;
        int iA = (ka1.a(this.f, (iHashCode + (cf0Var == null ? 0 : cf0Var.hashCode())) * 31, 31) + this.g) * 31;
        vv2 vv2Var = this.h;
        return this.j.hashCode() + ev6.o(this.i, (iA + (vv2Var != null ? vv2Var.hashCode() : 0)) * 31, 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("AuthorHeaderUiModel(authorId=", this.a, ", authorName=", this.b, ", authorImageId=");
        ka1.D(sbU, strA, ", isBookAuthor=", this.d, ", collection=");
        sbU.append(this.e);
        sbU.append(", isFollowingAuthorStream=");
        sbU.append(this.f);
        sbU.append(", minutesOfRead=");
        sbU.append(this.g);
        sbU.append(", publicationDate=");
        sbU.append(this.h);
        sbU.append(", sourceParameter=");
        sbU.append(this.i);
        sbU.append(", followSubscribeUiModelStream=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}
