package defpackage;

import gen.model.SourceParameter;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Ln4a;", "Lque;", "l4a", "k4a", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class n4a extends que {
    public final olb b;
    public final String c;
    public final r6c d;
    public final uua e;
    public final xpc f;
    public final xpc g;
    public final wua h;

    public n4a(vob vobVar, olb olbVar) {
        vobVar.getClass();
        this.b = olbVar;
        String strU = gp7.u(new SourceParameter("edit_profile_pronouns_picker", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null));
        this.c = strU;
        r6c r6cVarX = k40.x(0, 7, null);
        this.d = r6cVarX;
        this.e = bo.z(r6cVarX);
        u50 u50Var = new u50(12, new zo5(this, null, 18));
        xpc xpcVarJ = vv2.j("");
        this.f = xpcVarJ;
        List list = (List) vobVar.a("selected_pronouns_key");
        ey3 ey3Var = ey3.a;
        xpc xpcVarJ2 = vv2.j(list == null ? ey3Var : list);
        this.g = xpcVarJ2;
        xpc xpcVarJ3 = vv2.j(Boolean.FALSE);
        this.h = bo.e0(k40.S(xpcVarJ, xpcVarJ2, u50Var, xpcVarJ3, new m4a(this, null)), f76.F(this), l7c.b, new l4a((String) xpcVarJ.getValue(), ey3Var, (List) xpcVarJ2.getValue(), ((Boolean) xpcVarJ3.getValue()).booleanValue(), strU));
    }
}
