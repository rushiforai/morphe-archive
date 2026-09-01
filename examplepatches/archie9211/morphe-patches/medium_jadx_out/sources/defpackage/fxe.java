package defpackage;

import com.medium.proto.event.ResponseCollapsed;
import com.medium.proto.event.ResponseContinue;
import com.medium.proto.event.ResponseExpanded;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fxe extends b0f {
    public final /* synthetic */ int b;
    public final nfb c;
    public final qy2 d;
    public final vob e;

    public fxe(nfb nfbVar, qy2 qy2Var, vob vobVar, int i) {
        this.b = i;
        nfbVar.getClass();
        vobVar.getClass();
        switch (i) {
            case 1:
                this.c = nfbVar;
                this.d = qy2Var;
                this.e = vobVar;
                break;
            default:
                this.c = nfbVar;
                this.d = qy2Var;
                this.e = vobVar;
                break;
        }
    }

    @Override // defpackage.b0f
    public final void a(Set set) {
        int i = this.b;
        vob vobVar = this.e;
        switch (i) {
            case 0:
                vobVar.d("expanded_replies", qo7.v(f(), set));
                break;
            default:
                vobVar.d("expanded_replies", qo7.v(f(), set));
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001d  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0061  */
    @Override // defpackage.b0f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object d(java.lang.String r8, defpackage.agb r9, defpackage.yd4 r10, com.medium.android.graphql.type.ResponseSortType r11, int r12, defpackage.p92 r13) {
        /*
            r7 = this;
            int r0 = r7.b
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = 1
            r4 = 0
            switch(r0) {
                case 0: goto L4f;
                default: goto Lb;
            }
        Lb:
            boolean r0 = r13 instanceof defpackage.txe
            if (r0 == 0) goto L1d
            r0 = r13
            txe r0 = (defpackage.txe) r0
            int r5 = r0.d
            r6 = r5 & r2
            if (r6 == 0) goto L1d
            int r5 = r5 - r2
            r0.d = r5
        L1b:
            r13 = r0
            goto L23
        L1d:
            txe r0 = new txe
            r0.<init>(r7, r13)
            goto L1b
        L23:
            java.lang.Object r0 = r13.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r13.d
            if (r5 == 0) goto L39
            if (r5 != r3) goto L35
            defpackage.br7.v(r0)
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r4 = r0.a
            goto L4e
        L35:
            defpackage.ygf.f(r1)
            goto L4e
        L39:
            defpackage.br7.v(r0)
            if (r9 == 0) goto L42
            com.medium.android.graphql.type.PagingOptions r4 = defpackage.vp7.F(r9)
        L42:
            r9 = r4
            r13.d = r3
            nfb r7 = r7.c
            java.lang.Object r4 = r7.e(r8, r9, r10, r11, r12, r13)
            if (r4 != r2) goto L4e
            r4 = r2
        L4e:
            return r4
        L4f:
            boolean r0 = r13 instanceof defpackage.dxe
            if (r0 == 0) goto L61
            r0 = r13
            dxe r0 = (defpackage.dxe) r0
            int r5 = r0.d
            r6 = r5 & r2
            if (r6 == 0) goto L61
            int r5 = r5 - r2
            r0.d = r5
        L5f:
            r13 = r0
            goto L67
        L61:
            dxe r0 = new dxe
            r0.<init>(r7, r13)
            goto L5f
        L67:
            java.lang.Object r0 = r13.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r13.d
            if (r5 == 0) goto L7d
            if (r5 != r3) goto L79
            defpackage.br7.v(r0)
            bjb r0 = (defpackage.bjb) r0
            java.lang.Object r4 = r0.a
            goto L92
        L79:
            defpackage.ygf.f(r1)
            goto L92
        L7d:
            defpackage.br7.v(r0)
            if (r9 == 0) goto L86
            com.medium.android.graphql.type.PagingOptions r4 = defpackage.vp7.F(r9)
        L86:
            r9 = r4
            r13.d = r3
            nfb r7 = r7.c
            java.lang.Object r4 = r7.e(r8, r9, r10, r11, r12, r13)
            if (r4 != r2) goto L92
            r4 = r2
        L92:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fxe.d(java.lang.String, agb, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:151:0x037a  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x039c  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0023  */
    /* JADX WARN: Type inference failed for: r2v39 */
    /* JADX WARN: Type inference failed for: r2v40, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v54 */
    /* JADX WARN: Type inference failed for: r2v55, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v59, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v66, types: [java.util.ArrayList] */
    @Override // defpackage.b0f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.uze r33, defpackage.agb r34, defpackage.yd4 r35, com.medium.android.graphql.type.ResponseSortType r36, int r37, defpackage.p92 r38) {
        /*
            Method dump skipped, instruction units count: 1522
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fxe.e(uze, agb, yd4, com.medium.android.graphql.type.ResponseSortType, int, p92):java.lang.Object");
    }

    @Override // defpackage.b0f
    public final Set f() {
        int i = this.b;
        ny3 ny3Var = ny3.a;
        vob vobVar = this.e;
        switch (i) {
            case 0:
                Set set = (Set) vobVar.a("expanded_replies");
                return set == null ? ny3Var : set;
            default:
                Set set2 = (Set) vobVar.a("expanded_replies");
                return set2 == null ? ny3Var : set2;
        }
    }

    @Override // defpackage.b0f
    public final Map g() {
        int i = this.b;
        fy3 fy3Var = fy3.a;
        vob vobVar = this.e;
        switch (i) {
            case 0:
                Map map = (Map) vobVar.a("see_more_replies");
                return map == null ? fy3Var : map;
            default:
                Map map2 = (Map) vobVar.a("see_more_replies");
                return map2 == null ? fy3Var : map2;
        }
    }

    @Override // defpackage.b0f
    public final void k(Set set) {
        int i = this.b;
        vob vobVar = this.e;
        switch (i) {
            case 0:
                vobVar.d("expanded_replies", qo7.t(f(), set));
                break;
            default:
                vobVar.d("expanded_replies", qo7.t(f(), set));
                break;
        }
    }

    @Override // defpackage.b0f
    public final void l(String str, agb agbVar) {
        int i = this.b;
        vob vobVar = this.e;
        str.getClass();
        agbVar.getClass();
        switch (i) {
            case 0:
                vobVar.d("see_more_replies", ei7.T(g(), new f09(str, agbVar)));
                break;
            default:
                vobVar.d("see_more_replies", ei7.T(g(), new f09(str, agbVar)));
                break;
        }
    }

    @Override // defpackage.b0f
    public final void o(uze uzeVar, ugb ugbVar, String str, String str2, String str3) {
        int i = this.b;
        str2.getClass();
        str3.getClass();
        switch (i) {
            case 0:
                String str4 = ugbVar.a;
                String str5 = ((rze) uzeVar).a;
                str4.getClass();
                str5.getClass();
                rqd.a(this.d.a, new ResponseCollapsed(null, str4, null, str5, null, null, null, 117, null), str2, str, false, null, str3, 24);
                break;
            default:
                String str6 = ugbVar.a;
                String str7 = ugbVar.q;
                if (str7 == null) {
                    ay0.e("Required value was null.");
                } else {
                    Integer num = ugbVar.r;
                    this.d.b(str6, ((sze) uzeVar).a, str7, num, str2, str, str3);
                }
                break;
        }
    }

    @Override // defpackage.b0f
    public final void p(uze uzeVar, ugb ugbVar, String str, String str2, String str3) {
        int i = this.b;
        str2.getClass();
        str3.getClass();
        switch (i) {
            case 0:
                String str4 = ugbVar.a;
                String str5 = ((rze) uzeVar).a;
                str4.getClass();
                str5.getClass();
                rqd.a(this.d.a, new ResponseExpanded(null, str4, null, str5, null, null, null, 117, null), str2, str, false, null, str3, 24);
                break;
            default:
                String str6 = ugbVar.a;
                String str7 = ugbVar.q;
                if (str7 == null) {
                    ay0.e("Required value was null.");
                } else {
                    Integer num = ugbVar.r;
                    this.d.c(str6, ((sze) uzeVar).a, str7, num, str2, str, str3);
                }
                break;
        }
    }

    @Override // defpackage.b0f
    public final void q(uze uzeVar, ugb ugbVar, String str, String str2, String str3) {
        int i = this.b;
        str2.getClass();
        str3.getClass();
        switch (i) {
            case 0:
                String str4 = ugbVar.a;
                String str5 = ((rze) uzeVar).a;
                str4.getClass();
                str5.getClass();
                rqd.a(this.d.a, new ResponseContinue(null, str4, null, str5, null, null, null, 117, null), str2, str, false, null, str3, 24);
                break;
            default:
                String str6 = ugbVar.a;
                String str7 = ugbVar.q;
                if (str7 == null) {
                    ay0.e("Required value was null.");
                } else {
                    Integer num = ugbVar.r;
                    this.d.d(str6, ((sze) uzeVar).a, str7, num, str2, str, str3);
                }
                break;
        }
    }
}
