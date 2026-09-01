package defpackage;

import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lua;", "Lque;", "na", "fa", "ja", "catalogs_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ua extends que {
    public final fr9 b;
    public final gn9 c;
    public final vo3 d;
    public final ty2 e;
    public final tl f;
    public final ax2 g;
    public final String h;
    public final String i;
    public final String j;
    public final String k;
    public String l;
    public final boolean m;
    public final String n;
    public final SourceParameter o;
    public boolean p;
    public final r6c q;
    public final r6c r;
    public final uua s;
    public final wua t;

    public ua(vob vobVar, fr9 fr9Var, gn9 gn9Var, vo3 vo3Var, ty2 ty2Var, tl tlVar, ax2 ax2Var, kb2 kb2Var) {
        vobVar.getClass();
        gn9Var.getClass();
        this.b = fr9Var;
        this.c = gn9Var;
        this.d = vo3Var;
        this.e = ty2Var;
        this.f = tlVar;
        this.g = ax2Var;
        this.h = (String) no7.D(vobVar, "referrer_source");
        String str = (String) no7.D(vobVar, "catalog_id");
        this.i = str;
        this.j = (String) no7.D(vobVar, "catalog_item_id");
        this.k = (String) no7.D(vobVar, "post_id");
        String strA = vobVar.a("annotation");
        this.l = (String) (strA == null ? "" : strA);
        this.m = ((Boolean) no7.D(vobVar, "is_editing_annotation")).booleanValue();
        this.n = "add_note";
        this.o = new SourceParameter("add_note", null, null, null, null, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -514, 8191, null);
        this.q = k40.x(0, 7, null);
        r6c r6cVarX = k40.x(0, 7, null);
        this.r = r6cVarX;
        this.s = bo.z(r6cVarX);
        this.t = bo.e0(w2g.r(new u50(12, new l0(this, null, 1)), kb2Var), f76.F(this), l7c.b, ma.a);
    }
}
