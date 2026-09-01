package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eg7 implements fg7 {
    public final String a;
    public final zw7 b;
    public final boolean c;
    public final List d;
    public final lv0 e;

    public eg7(String str, zw7 zw7Var, boolean z, f17 f17Var, lv0 lv0Var) {
        zw7Var.getClass();
        f17Var.getClass();
        lv0Var.getClass();
        this.a = str;
        this.b = zw7Var;
        this.c = z;
        this.d = f17Var;
        this.e = lv0Var;
    }

    @Override // defpackage.fg7
    public final List a() {
        return this.d;
    }

    @Override // defpackage.fg7
    public final lv0 b() {
        return this.e;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            r4 = this;
            r0 = 1
            if (r4 != r5) goto L4
            goto L42
        L4:
            boolean r1 = r5 instanceof defpackage.eg7
            r2 = 0
            if (r1 != 0) goto La
            goto L41
        La:
            eg7 r5 = (defpackage.eg7) r5
            java.lang.String r1 = r5.a
            java.lang.String r3 = r4.a
            if (r3 != 0) goto L18
            if (r1 != 0) goto L16
            r1 = r0
            goto L1f
        L16:
            r1 = r2
            goto L1f
        L18:
            if (r1 != 0) goto L1b
            goto L16
        L1b:
            boolean r1 = r3.equals(r1)
        L1f:
            if (r1 != 0) goto L22
            goto L41
        L22:
            zw7 r1 = r4.b
            zw7 r3 = r5.b
            if (r1 == r3) goto L29
            goto L41
        L29:
            boolean r1 = r4.c
            boolean r3 = r5.c
            if (r1 == r3) goto L30
            goto L41
        L30:
            java.util.List r1 = r4.d
            java.util.List r3 = r5.d
            boolean r1 = r1.equals(r3)
            if (r1 != 0) goto L3b
            goto L41
        L3b:
            lv0 r4 = r4.e
            lv0 r5 = r5.e
            if (r4 == r5) goto L42
        L41:
            return r2
        L42:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eg7.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        return this.e.hashCode() + wgd.p((((this.b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31)) * 31) + (this.c ? 1231 : 1237)) * 31, 31, this.d);
    }

    public final String toString() {
        String str = this.a;
        return "Main(userImageId=" + (str == null ? "null" : ax5.a(str)) + ", userMembershipType=" + this.b + ", hasNewFollowedContent=" + this.c + ", bottomBarItems=" + this.d + ", selectedBottomBarItem=" + this.e + ziYqbdHrAXvj.OXCJl;
    }
}
