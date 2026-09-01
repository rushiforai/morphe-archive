package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yne implements xi8 {
    public final boolean a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final bt4 f;
    public final cg8 g;
    public final SourceParameter h;

    public yne(boolean z, String str, String str2, String str3, String str4, bt4 bt4Var, cg8 cg8Var, SourceParameter sourceParameter) {
        str.getClass();
        bt4Var.getClass();
        this.a = z;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = bt4Var;
        this.g = cg8Var;
        this.h = sourceParameter;
    }

    public static yne a(yne yneVar, bt4 bt4Var, cg8 cg8Var, int i) {
        boolean z = yneVar.a;
        String str = yneVar.b;
        String str2 = yneVar.c;
        String str3 = yneVar.d;
        String str4 = yneVar.e;
        if ((i & 32) != 0) {
            bt4Var = yneVar.f;
        }
        bt4 bt4Var2 = bt4Var;
        if ((i & 64) != 0) {
            cg8Var = yneVar.g;
        }
        SourceParameter sourceParameter = yneVar.h;
        str.getClass();
        bt4Var2.getClass();
        return new yne(z, str, str2, str3, str4, bt4Var2, cg8Var, sourceParameter);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L5
            goto L69
        L5:
            boolean r1 = r5 instanceof defpackage.yne
            r2 = 0
            if (r1 != 0) goto Lc
            goto L68
        Lc:
            yne r5 = (defpackage.yne) r5
            boolean r1 = r4.a
            boolean r3 = r5.a
            if (r1 == r3) goto L15
            goto L68
        L15:
            java.lang.String r1 = r4.b
            java.lang.String r3 = r5.b
            boolean r1 = defpackage.g76.L(r1, r3)
            if (r1 != 0) goto L20
            goto L68
        L20:
            java.lang.String r1 = r5.c
            java.lang.String r3 = r4.c
            if (r3 != 0) goto L2c
            if (r1 != 0) goto L2a
            r1 = r0
            goto L33
        L2a:
            r1 = r2
            goto L33
        L2c:
            if (r1 != 0) goto L2f
            goto L2a
        L2f:
            boolean r1 = r3.equals(r1)
        L33:
            if (r1 != 0) goto L36
            goto L68
        L36:
            java.lang.String r1 = r4.d
            java.lang.String r3 = r5.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L41
            goto L68
        L41:
            java.lang.String r1 = r4.e
            java.lang.String r3 = r5.e
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L4c
            goto L68
        L4c:
            bt4 r1 = r4.f
            bt4 r3 = r5.f
            if (r1 == r3) goto L53
            goto L68
        L53:
            cg8 r1 = r4.g
            cg8 r3 = r5.g
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L5e
            goto L68
        L5e:
            gen.model.SourceParameter r4 = r4.h
            gen.model.SourceParameter r5 = r5.h
            boolean r4 = r4.equals(r5)
            if (r4 != 0) goto L69
        L68:
            return r2
        L69:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yne.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iO = wgd.o((this.a ? 1231 : 1237) * 31, 31, this.b);
        String str = this.c;
        return this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + wgd.o(wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.d), 31, this.e)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.c;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("UsersFollowingYouRollupItemNotificationDataItem(isUnread=");
        sb.append(this.a);
        sb.append(", actorId=");
        sb.append(this.b);
        sb.append(", actorImageId=");
        ka1.C(sb, strA, ", actorName=", this.d, ", actorBio=");
        sb.append(this.e);
        sb.append(", followState=");
        sb.append(this.f);
        sb.append(", newsletterSubscriptionState=");
        sb.append(this.g);
        sb.append(", sourceParameter=");
        sb.append(this.h);
        sb.append(")");
        return sb.toString();
    }
}
