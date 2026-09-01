package defpackage;

import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sye extends b0f {
    public final nfb b;
    public final qy2 c;
    public final vob d;

    public sye(nfb nfbVar, qy2 qy2Var, vob vobVar) {
        nfbVar.getClass();
        vobVar.getClass();
        this.b = nfbVar;
        this.c = qy2Var;
        this.d = vobVar;
    }

    @Override // defpackage.b0f
    public final void a(Set set) {
        this.d.d("expanded_replies", qo7.v(f(), set));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Override // defpackage.b0f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r6, defpackage.agb r7, defpackage.yd4 r8, com.medium.android.graphql.type.ResponseSortType r9, int r10, defpackage.p92 r11) {
        /*
            r5 = this;
            boolean r0 = r11 instanceof defpackage.qye
            if (r0 == 0) goto L14
            r0 = r11
            qye r0 = (defpackage.qye) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r11 = r0
            goto L1a
        L14:
            qye r0 = new qye
            r0.<init>(r5, r11)
            goto L12
        L1a:
            java.lang.Object r0 = r11.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r11.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            defpackage.br7.v(r0)
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r5 = r0.a
            return r5
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L34:
            defpackage.br7.v(r0)
            if (r7 == 0) goto L3d
            com.medium.android.graphql.type.PagingOptions r4 = defpackage.vp7.F(r7)
        L3d:
            r7 = r4
            r11.d = r3
            nfb r5 = r5.b
            java.lang.Object r5 = r5.e(r6, r7, r8, r9, r10, r11)
            if (r5 != r1) goto L49
            return r1
        L49:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sye.d(java.lang.String, agb, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Override // defpackage.b0f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.uze r27, defpackage.agb r28, defpackage.yd4 r29, com.medium.android.graphql.type.ResponseSortType r30, int r31, defpackage.p92 r32) {
        /*
            Method dump skipped, instruction units count: 423
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sye.e(uze, agb, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    @Override // defpackage.b0f
    public final Set f() {
        Set set = (Set) this.d.a("expanded_replies");
        return set == null ? ny3.a : set;
    }

    @Override // defpackage.b0f
    public final Map g() {
        Map map = (Map) this.d.a("see_more_replies");
        return map == null ? fy3.a : map;
    }

    @Override // defpackage.b0f
    public final void k(Set set) {
        this.d.d("expanded_replies", qo7.t(f(), set));
    }

    @Override // defpackage.b0f
    public final void l(String str, agb agbVar) {
        str.getClass();
        agbVar.getClass();
        this.d.d("see_more_replies", ei7.T(g(), new f09(str, agbVar)));
    }

    @Override // defpackage.b0f
    public final void o(uze uzeVar, ugb ugbVar, String str, String str2, String str3) {
        str2.getClass();
        str3.getClass();
        String str4 = ugbVar.a;
        String str5 = ugbVar.q;
        if (str5 == null) {
            ay0.e("Required value was null.");
            return;
        }
        Integer num = ugbVar.r;
        this.c.b(str4, ((tze) uzeVar).a, str5, num, str2, str, str3);
    }

    @Override // defpackage.b0f
    public final void p(uze uzeVar, ugb ugbVar, String str, String str2, String str3) {
        str2.getClass();
        str3.getClass();
        String str4 = ugbVar.a;
        String str5 = ugbVar.q;
        if (str5 == null) {
            ay0.e("Required value was null.");
            return;
        }
        Integer num = ugbVar.r;
        this.c.c(str4, ((tze) uzeVar).a, str5, num, str2, str, str3);
    }

    @Override // defpackage.b0f
    public final void q(uze uzeVar, ugb ugbVar, String str, String str2, String str3) {
        str2.getClass();
        str3.getClass();
        String str4 = ugbVar.a;
        String str5 = ugbVar.q;
        if (str5 == null) {
            ay0.e("Required value was null.");
            return;
        }
        Integer num = ugbVar.r;
        this.c.d(str4, ((tze) uzeVar).a, str5, num, str2, str, str3);
    }
}
