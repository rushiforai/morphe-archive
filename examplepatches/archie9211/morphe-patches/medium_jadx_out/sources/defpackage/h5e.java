package defpackage;

import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lh5e;", "Lque;", "d5e", "z4e", "v4e", "w4e", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class h5e extends que {
    public final ed4 b;
    public final r4e c;
    public final ax2 d;
    public final String e;
    public final String f;
    public String g;
    public String h;
    public boolean i;
    public final String j;
    public final String k;
    public boolean l;
    public final r6c m;
    public final uua n;
    public final xpc o;
    public final wua p;
    public final r6c q;
    public final wua r;

    public h5e(vob vobVar, ed4 ed4Var, r4e r4eVar, ax2 ax2Var, kb2 kb2Var) {
        vobVar.getClass();
        this.b = ed4Var;
        this.c = r4eVar;
        this.d = ax2Var;
        this.e = (String) no7.D(vobVar, "referrer_source");
        this.f = (String) no7.D(vobVar, "id");
        String strA = vobVar.a("title");
        this.g = (String) (strA == null ? "" : strA);
        Object objA = vobVar.a("description");
        this.h = (String) (objA != null ? objA : "");
        Object obj = Boolean.FALSE;
        Object objA2 = vobVar.a("is_private");
        this.i = ((Boolean) (objA2 != null ? objA2 : obj)).booleanValue();
        this.j = "edit_catalog_info";
        this.k = gp7.u(new SourceParameter("edit_catalog_info", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        r6c r6cVarX = k40.x(0, 7, null);
        this.m = r6cVarX;
        this.n = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(null);
        this.o = xpcVarJ;
        this.p = bo.A(xpcVarJ);
        this.q = k40.x(0, 7, null);
        this.r = bo.e0(w2g.r(new u50(12, new j5d(this, null, 8)), kb2Var), f76.F(this), l7c.b, c5e.a);
    }

    public static boolean f(String str) {
        return str.length() <= 280;
    }

    public static boolean g(String str) {
        return !muc.b0(str) && str.length() <= 60;
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x00c6, code lost:
    
        if (r10.a(r13, r6) != r0) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0096 A[PHI: r13
      0x0096: PHI (r13v11 java.lang.Object) = (r13v10 java.lang.Object), (r13v1 java.lang.Object) binds: [B:33:0x0092, B:23:0x0056] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x015d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x015e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.p92 r13) {
        /*
            Method dump skipped, instruction units count: 376
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h5e.e(p92):java.lang.Object");
    }
}
