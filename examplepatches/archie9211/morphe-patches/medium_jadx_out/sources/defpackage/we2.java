package defpackage;

import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lwe2;", "Lque;", "ue2", "re2", "oe2", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class we2 extends que {
    public final le2 b;
    public final String c;
    public String d;
    public String e;
    public boolean f;
    public final String g;
    public final String h;
    public final r6c i;
    public final uua j;
    public final r6c k;
    public final wua l;

    public we2(vob vobVar, le2 le2Var, kb2 kb2Var) {
        vobVar.getClass();
        this.b = le2Var;
        this.c = (String) no7.D(vobVar, "referrer_source");
        String strA = vobVar.a("title");
        this.d = (String) (strA == null ? "" : strA);
        Object objA = vobVar.a("description");
        this.e = (String) (objA != null ? objA : "");
        Object obj = Boolean.FALSE;
        Object objA2 = vobVar.a("is_private");
        this.f = ((Boolean) (objA2 != null ? objA2 : obj)).booleanValue();
        this.g = "create_list";
        this.h = gp7.u(new SourceParameter("create_list", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        r6c r6cVarX = k40.x(0, 7, null);
        this.i = r6cVarX;
        this.j = bo.z(r6cVarX);
        this.k = k40.x(0, 7, null);
        this.l = bo.e0(w2g.r(new u50(12, new r91(this, (n92) null, 16)), kb2Var), f76.F(this), l7c.b, te2.a);
    }

    public static boolean e(String str) {
        return !muc.b0(str) && str.length() <= 60;
    }
}
