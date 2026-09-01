package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.medium.android.core.models.CatalogName;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.CatalogVisibility;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class rg1 implements x27 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final CatalogType e;
    public final CatalogName f;
    public final int g;
    public final CatalogVisibility h;
    public final az5 i;
    public final bo4 j;
    public final boolean k;
    public final bo4 l;
    public final qg1 m;
    public final String n;
    public final String o;

    public rg1(String str, String str2, String str3, boolean z, CatalogType catalogType, CatalogName catalogName, int i, CatalogVisibility catalogVisibility, az5 az5Var, bo4 bo4Var, boolean z2, bo4 bo4Var2, qg1 qg1Var, String str4) {
        str.getClass();
        catalogType.getClass();
        catalogName.getClass();
        catalogVisibility.getClass();
        az5Var.getClass();
        bo4Var2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = catalogType;
        this.f = catalogName;
        this.g = i;
        this.h = catalogVisibility;
        this.i = az5Var;
        this.j = bo4Var;
        this.k = z2;
        this.l = bo4Var2;
        this.m = qg1Var;
        this.n = str4;
        this.o = str;
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
            goto La2
        L5:
            boolean r1 = r5 instanceof defpackage.rg1
            r2 = 0
            if (r1 != 0) goto Lc
            goto La1
        Lc:
            rg1 r5 = (defpackage.rg1) r5
            java.lang.String r1 = r4.a
            java.lang.String r3 = r5.a
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L1a
            goto La1
        L1a:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L26
            goto La1
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
            if (r1 != 0) goto L3d
            goto La1
        L3d:
            boolean r1 = r4.d
            boolean r3 = r5.d
            if (r1 == r3) goto L44
            goto La1
        L44:
            com.medium.android.graphql.type.CatalogType r1 = r4.e
            com.medium.android.graphql.type.CatalogType r3 = r5.e
            if (r1 == r3) goto L4b
            goto La1
        L4b:
            com.medium.android.core.models.CatalogName r1 = r4.f
            com.medium.android.core.models.CatalogName r3 = r5.f
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L56
            goto La1
        L56:
            int r1 = r4.g
            int r3 = r5.g
            if (r1 == r3) goto L5d
            goto La1
        L5d:
            com.medium.android.graphql.type.CatalogVisibility r1 = r4.h
            com.medium.android.graphql.type.CatalogVisibility r3 = r5.h
            if (r1 == r3) goto L64
            goto La1
        L64:
            az5 r1 = r4.i
            az5 r3 = r5.i
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L6f
            goto La1
        L6f:
            bo4 r1 = r4.j
            bo4 r3 = r5.j
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L7a
            goto La1
        L7a:
            boolean r1 = r4.k
            boolean r3 = r5.k
            if (r1 == r3) goto L81
            goto La1
        L81:
            bo4 r1 = r4.l
            bo4 r3 = r5.l
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L8c
            goto La1
        L8c:
            qg1 r1 = r4.m
            qg1 r3 = r5.m
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L97
            goto La1
        L97:
            java.lang.String r4 = r4.n
            java.lang.String r5 = r5.n
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto La2
        La1:
            return r2
        La2:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rg1.equals(java.lang.Object):boolean");
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.o;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iB = ka1.b(this.i, (this.h.hashCode() + ((((this.f.hashCode() + ((this.e.hashCode() + ((((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31)) * 31)) * 31) + this.g) * 31)) * 31, 31);
        bo4 bo4Var = this.j;
        return this.n.hashCode() + ((this.m.hashCode() + ka1.a(this.l, (((iB + (bo4Var != null ? bo4Var.hashCode() : 0)) * 31) + (this.k ? 1231 : 1237)) * 31, 31)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sbU = y30.u("CatalogUiModel(id=", this.a, ", authorName=", this.b, ", authorImageId=");
        ka1.D(sbU, strA, ", isVerifiedAuthor=", this.d, ", catalogType=");
        sbU.append(this.e);
        sbU.append(", name=");
        sbU.append(this.f);
        sbU.append(PdtluglzAX.btQdRpb);
        sbU.append(this.g);
        sbU.append(", visibility=");
        sbU.append(this.h);
        sbU.append(", previewImages=");
        sbU.append(this.i);
        sbU.append(", isFollowingStream=");
        sbU.append(this.j);
        sbU.append(AEVqIoD.fqHaZuY);
        sbU.append(this.k);
        sbU.append(", downloadStatusStream=");
        sbU.append(this.l);
        sbU.append(", menuOptions=");
        sbU.append(this.m);
        sbU.append(", source=");
        sbU.append(this.n);
        sbU.append(")");
        return sbU.toString();
    }
}
