package defpackage;

import com.medium.android.graphql.PredefinedCatalogQuery;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.graphql.type.UserDismissableFlags;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0011\u0018\u00002\u00020\u0001:\u0006\u0002\u0003\u0004\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lide;", "Lque;", "oo2", "jce", "wce", "sce", "nce", "dce", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public class ide extends que {
    public final String b;
    public final n0c c;
    public final l95 d;
    public final qi1 e;
    public final yo8 f;
    public final ax2 g;
    public final tg1 h;
    public final me4 i;
    public final pe4 j;
    public final og3 k;
    public final ax2 l;
    public final String m;
    public boolean n;
    public final String o;
    public final SourceParameter p;
    public final LinkedHashSet q;
    public boolean r;
    public final r6c s;
    public final wua t;
    public final r6c u;
    public final uua v;
    public final xpc w;
    public final wua x;
    public final xpc y;
    public final wua z;

    public ide(tbe tbeVar, String str, String str2, n0c n0cVar, l95 l95Var, hha hhaVar, qi1 qi1Var, yo8 yo8Var, pu7 pu7Var, ax2 ax2Var, tg1 tg1Var, me4 me4Var, pe4 pe4Var, og3 og3Var, ax2 ax2Var2, zk2 zk2Var, kb2 kb2Var) {
        String strM;
        str2.getClass();
        qi1Var.getClass();
        pu7Var.getClass();
        zk2Var.getClass();
        this.b = str2;
        this.c = n0cVar;
        this.d = l95Var;
        this.e = qi1Var;
        this.f = yo8Var;
        this.g = ax2Var;
        this.h = tg1Var;
        this.i = me4Var;
        this.j = pe4Var;
        this.k = og3Var;
        this.l = ax2Var2;
        n92 n92Var = null;
        int i = 3;
        vx0.c0(f76.F(this), null, null, new bde(this, n92Var, i), 3);
        if (tbeVar instanceof rbe) {
            strM = zk2Var.m();
        } else {
            if (!(tbeVar instanceof sbe)) {
                ygf.a();
                throw null;
            }
            strM = ((sbe) tbeVar).a;
        }
        this.m = strM;
        this.o = str;
        this.p = new SourceParameter(str, null, null, null, null, null, null, null, null, null, null, null, strM, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null);
        this.q = new LinkedHashSet();
        bo4 bo4VarJ = m40.J(new zz(hhaVar.k(UserDismissableFlags.CREATE_CATALOGS_CTA), 17));
        this.s = k40.x(0, 7, null);
        PredefinedCatalogType predefinedCatalogType = PredefinedCatalogType.READING_LIST;
        strM.getClass();
        predefinedCatalogType.getClass();
        PredefinedCatalogQuery predefinedCatalogQuery = new PredefinedCatalogQuery(predefinedCatalogType, strM);
        e00 e00Var = qi1Var.a;
        e00Var.getClass();
        uz uzVar = new uz(e00Var, predefinedCatalogQuery);
        yd4 yd4Var = yd4.CacheAndNetwork;
        this.t = bo.e0(w2g.r(k40.T(bo4VarJ, kyd.H(m40.J(new to4(new l0(qi1Var, strM, n92Var, 23), new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, i), 0)))), new u50(12, new zce(this, null)), new mg7(i, n92Var, this)), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), vce.a);
        r6c r6cVarX = k40.x(0, 7, null);
        this.u = r6cVarX;
        this.v = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(null);
        this.w = xpcVarJ;
        this.x = bo.A(xpcVarJ);
        xpc xpcVarJ2 = vv2.j(null);
        this.y = xpcVarJ2;
        this.z = bo.A(xpcVarJ2);
    }

    public final void e(String str) {
        str.getClass();
        wld.a.a("Download lists catalog with id ".concat(str), new Object[0]);
        this.w.l(null);
        vx0.c0(f76.F(this), null, null, new j5d(this, str, (n92) null, 12), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(java.lang.String r8, defpackage.yd4 r9, defpackage.p92 r10) {
        /*
            r7 = this;
            boolean r0 = r10 instanceof defpackage.ade
            if (r0 == 0) goto L14
            r0 = r10
            ade r0 = (defpackage.ade) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r3 = r0
            goto L1a
        L14:
            ade r0 = new ade
            r0.<init>(r7, r10)
            goto L12
        L1a:
            java.lang.Object r10 = r3.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r3.d
            r2 = 1
            if (r1 == 0) goto L34
            if (r1 != r2) goto L2d
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r7 = r10.a
            return r7
        L2d:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L34:
            defpackage.br7.v(r10)
            r3.d = r2
            pe4 r1 = r7.j
            r2 = 20
            java.lang.String r5 = r7.m
            r6 = r8
            r4 = r9
            java.lang.Object r7 = r1.a(r2, r3, r4, r5, r6)
            if (r7 != r0) goto L48
            return r0
        L48:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ide.f(java.lang.String, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.cde
            if (r0 == 0) goto L13
            r0 = r6
            cde r0 = (defpackage.cde) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            cde r0 = new cde
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r6)
            goto L40
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r6)
            r0.d = r4
            yd4 r6 = defpackage.yd4.NetworkFirst
            me4 r2 = r5.i
            java.lang.String r5 = r5.m
            java.lang.Object r6 = r2.a(r5, r6, r0)
            if (r6 != r1) goto L40
            return r1
        L40:
            sua r6 = (defpackage.sua) r6
            boolean r5 = r6 instanceof defpackage.rua
            r0 = 0
            if (r5 == 0) goto L51
            uld r5 = defpackage.wld.a
            java.lang.String r6 = "Fetch reading list success"
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r5.a(r6, r0)
            goto L7a
        L51:
            boolean r5 = r6 instanceof defpackage.pua
            if (r5 == 0) goto L5f
            uld r5 = defpackage.wld.a
            java.lang.String r6 = "Fetch reading list forbidden"
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r5.c(r6, r0)
            goto L7a
        L5f:
            boolean r5 = r6 instanceof defpackage.qua
            if (r5 == 0) goto L6d
            uld r5 = defpackage.wld.a
            java.lang.String r6 = "Fetch reading list not found"
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r5.c(r6, r0)
            goto L7a
        L6d:
            boolean r5 = r6 instanceof defpackage.oua
            if (r5 == 0) goto L7d
            uld r5 = defpackage.wld.a
            java.lang.String r6 = "Fetch reading list failed"
            java.lang.Object[] r0 = new java.lang.Object[r0]
            r5.c(r6, r0)
        L7a:
            c1e r5 = defpackage.c1e.a
            return r5
        L7d:
            defpackage.ygf.a()
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ide.g(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(defpackage.yd4 r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.ede
            if (r0 == 0) goto L13
            r0 = r7
            ede r0 = (defpackage.ede) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ede r0 = new ede
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            return r5
        L2c:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L32:
            defpackage.br7.v(r7)
            r0.d = r4
            java.lang.Object r5 = r5.f(r3, r6, r0)
            if (r5 != r1) goto L3e
            return r1
        L3e:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ide.h(yd4, p92):java.lang.Object");
    }

    public final void i() {
        this.y.l(null);
    }

    public final void j() {
        vx0.c0(f76.F(this), null, null, new bde(this, null, 2), 3);
    }

    public final void k(String str) {
        str.getClass();
        wld.a.a("Remove downloaded lists catalog with id ".concat(str), new Object[0]);
        this.w.l(null);
        this.f.k(str);
    }
}
