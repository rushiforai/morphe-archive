package defpackage;

import com.medium.android.graphql.PredefinedCatalogQuery;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import com.medium.android.graphql.fragment.EntityCatalogsConnectionData;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.proto.event.PostAddToList;
import com.medium.proto.event.PostRemoveFromList;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x47 extends que {
    public final ud1 b;
    public final String c;
    public final qi1 d;
    public final me4 e;
    public final pe4 f;
    public final gg5 g;
    public final n53 h;
    public final nz9 i;
    public final ty2 j;
    public final pu7 k;
    public final yo8 l;
    public final String m;
    public final String n;
    public final String o;
    public CatalogPreviewData p;
    public final r6c q;
    public List r;
    public EntityCatalogsConnectionData s;
    public final xpc t;
    public final xpc u;
    public final ff4 v;
    public final xpc w;
    public final r6c x;
    public final uua y;
    public final wua z;

    public x47(ud1 ud1Var, String str, zk2 zk2Var, qi1 qi1Var, me4 me4Var, pe4 pe4Var, gg5 gg5Var, n53 n53Var, nz9 nz9Var, ty2 ty2Var, pu7 pu7Var, yo8 yo8Var) {
        zk2Var.getClass();
        qi1Var.getClass();
        pu7Var.getClass();
        this.b = ud1Var;
        this.c = str;
        this.d = qi1Var;
        this.e = me4Var;
        this.f = pe4Var;
        this.g = gg5Var;
        this.h = n53Var;
        this.i = nz9Var;
        this.j = ty2Var;
        this.k = pu7Var;
        this.l = yo8Var;
        this.m = "catalog_selector";
        this.n = gp7.u(new SourceParameter("catalog_selector", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        String strM = zk2Var.m();
        this.o = strM;
        PredefinedCatalogType predefinedCatalogType = PredefinedCatalogType.READING_LIST;
        nx nxVar = new nx(26);
        predefinedCatalogType.getClass();
        PredefinedCatalogQuery predefinedCatalogQuery = new PredefinedCatalogQuery(predefinedCatalogType, strM);
        e00 e00Var = qi1Var.a;
        e00Var.getClass();
        n92 n92Var = null;
        int i = 3;
        int i2 = 0;
        ro4 ro4Var = new ro4(new u50(i, new ro4(gr7.F(new uz(e00Var, predefinedCatalogQuery)), new ni1(nxVar, null), 1)), new u47(i, i2, n92Var), 1);
        u50 u50Var = new u50(12, new n47(this, null));
        this.q = k40.x(0, 7, null);
        xpc xpcVarJ = vv2.j(null);
        this.t = xpcVarJ;
        Boolean bool = Boolean.FALSE;
        xpc xpcVarJ2 = vv2.j(bool);
        this.u = xpcVarJ2;
        this.v = new ff4(23, this);
        xpc xpcVarJ3 = vv2.j(bool);
        this.w = xpcVarJ3;
        r6c r6cVarX = k40.x(0, 7, null);
        this.x = r6cVarX;
        this.y = bo.z(r6cVarX);
        this.z = bo.e0(k40.R(ro4Var, m40.J(u50Var), xpcVarJ, xpcVarJ2, xpcVarJ3, new w47(this, null)), f76.F(this), l7c.b, j47.a);
        vx0.c0(f76.F(this), null, null, new d47(this, null), 3);
        vx0.c0(f76.F(this), null, null, new e47(this, n92Var, i2), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(int r9, defpackage.p92 r10, defpackage.yd4 r11, java.lang.String r12) {
        /*
            r8 = this;
            boolean r0 = r10 instanceof defpackage.o47
            if (r0 == 0) goto L14
            r0 = r10
            o47 r0 = (defpackage.o47) r0
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
            o47 r0 = new o47
            r0.<init>(r8, r10)
            goto L12
        L1a:
            java.lang.Object r10 = r3.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r3.d
            r2 = 1
            r7 = 0
            if (r1 == 0) goto L34
            if (r1 != r2) goto L2e
            defpackage.br7.v(r10)
            bjb r10 = (defpackage.bjb) r10
            java.lang.Object r8 = r10.a
            goto L47
        L2e:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r7
        L34:
            defpackage.br7.v(r10)
            r3.d = r2
            pe4 r1 = r8.f
            java.lang.String r5 = r8.o
            r2 = r9
            r4 = r11
            r6 = r12
            java.lang.Object r8 = r1.a(r2, r3, r4, r5, r6)
            if (r8 != r0) goto L47
            return r0
        L47:
            boolean r9 = r8 instanceof defpackage.ajb
            if (r9 == 0) goto L4c
            return r7
        L4c:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x47.e(int, p92, yd4, java.lang.String):java.lang.Object");
    }

    public final void f(String str) {
        ud1 ud1Var = this.b;
        if (!y30.C(ud1Var)) {
            ygf.a();
            return;
        }
        String str2 = ud1Var.b;
        ty2 ty2Var = this.j;
        ty2Var.getClass();
        str.getClass();
        str2.getClass();
        String str3 = this.c;
        str3.getClass();
        String str4 = this.n;
        str4.getClass();
        String str5 = this.m;
        str5.getClass();
        rqd.a(ty2Var.a, new PostAddToList(null, str2, str, null, 9, null), str3, str4, false, null, str5, 24);
    }

    public final void g(String str) {
        ud1 ud1Var = this.b;
        if (!y30.C(ud1Var)) {
            ygf.a();
            return;
        }
        String str2 = ud1Var.b;
        ty2 ty2Var = this.j;
        ty2Var.getClass();
        str.getClass();
        str2.getClass();
        String str3 = this.c;
        str3.getClass();
        String str4 = this.n;
        str4.getClass();
        String str5 = this.m;
        str5.getClass();
        rqd.a(ty2Var.a, new PostRemoveFromList(null, str2, str, null, 9, null), str3, str4, false, null, str5, 24);
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00a3 A[PHI: r2 r12
      0x00a3: PHI (r2v5 lz9) = (r2v4 lz9), (r2v12 lz9) binds: [B:32:0x009f, B:20:0x0048] A[DONT_GENERATE, DONT_INLINE]
      0x00a3: PHI (r12v15 java.lang.Object) = (r12v14 java.lang.Object), (r12v1 java.lang.Object) binds: [B:32:0x009f, B:20:0x0048] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(defpackage.p92 r12) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 319
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x47.h(p92):java.lang.Object");
    }

    public final void i(String str, String str2) {
        ArrayList arrayList;
        List<CatalogPreviewData> list = this.r;
        if (list != null) {
            arrayList = new ArrayList(cu1.k0(list, 10));
            for (CatalogPreviewData catalogPreviewDataCopy$default : list) {
                if (g76.L(catalogPreviewDataCopy$default.getId(), str)) {
                    catalogPreviewDataCopy$default = CatalogPreviewData.copy$default(catalogPreviewDataCopy$default, null, null, null, CatalogSummaryData.copy$default(catalogPreviewDataCopy$default.getCatalogSummaryData(), null, null, null, null, null, null, null, str2, 0L, 0, null, 1919, null), 7, null);
                }
                arrayList.add(catalogPreviewDataCopy$default);
            }
        } else {
            arrayList = null;
        }
        this.r = arrayList;
    }

    public final void j(String str) {
        CatalogPreviewData catalogPreviewData = this.p;
        this.p = catalogPreviewData != null ? CatalogPreviewData.copy$default(catalogPreviewData, null, null, null, CatalogSummaryData.copy$default(catalogPreviewData.getCatalogSummaryData(), null, null, null, null, null, null, null, str, 0L, 0, null, 1919, null), 7, null) : null;
    }
}
