package defpackage;

import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lj53;", "Lque;", "g53", "h53", "d53", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class j53 extends que {
    public final c53 b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final r6c g;
    public final uua h;
    public final r6c i;
    public final wua j;

    public j53(vob vobVar, c53 c53Var, kb2 kb2Var) {
        vobVar.getClass();
        this.b = c53Var;
        this.c = (String) no7.D(vobVar, "referrer_source");
        String str = (String) no7.D(vobVar, "catalog_id");
        this.d = str;
        this.e = "delete_list";
        this.f = gp7.u(new SourceParameter("delete_list", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        r6c r6cVarX = k40.x(0, 7, null);
        this.g = r6cVarX;
        this.h = bo.z(r6cVarX);
        r6c r6cVarX2 = k40.x(0, 7, null);
        this.i = r6cVarX2;
        this.j = bo.e0(w2g.r(new pc1(r6cVarX2, 3, this), kb2Var), f76.F(this), l7c.b, new h53(str, true));
    }
}
