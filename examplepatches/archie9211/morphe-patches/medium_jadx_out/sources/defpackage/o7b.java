package defpackage;

import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lo7b;", "Lque;", "vr2", "n7b", "m7b", "reportuser_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class o7b extends que {
    public final String b;
    public final String c;
    public final j7b d;
    public final vob e;
    public final xpc f;
    public final wua g;
    public final r6c h;
    public final uua i;
    public final String j;
    public final String k;

    public o7b(String str, String str2, j7b j7bVar, vob vobVar) {
        str.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = j7bVar;
        this.e = vobVar;
        wua wuaVarC = vobVar.c("report_user_reason", null);
        Boolean bool = Boolean.FALSE;
        wua wuaVarC2 = vobVar.c("block_user", bool);
        xpc xpcVarJ = vv2.j(bool);
        this.f = xpcVarJ;
        pc1 pc1VarT = k40.T(wuaVarC, wuaVarC2, xpcVarJ, new u5b(4, 1 == true ? 1 : 0, null));
        gp1 gp1VarF = f76.F(this);
        vpc vpcVar = wuaVarC.a;
        this.g = bo.e0(pc1VarT, gp1VarF, l7c.b, new n7b((e7b) vpcVar.getValue(), ((Boolean) wuaVarC2.a.getValue()).booleanValue(), (vpcVar.getValue() == null || ((Boolean) xpcVarJ.getValue()).booleanValue()) ? false : true));
        r6c r6cVarX = k40.x(0, 7, null);
        this.h = r6cVarX;
        this.i = bo.z(r6cVarX);
        this.j = "report_user";
        this.k = gp7.u(new SourceParameter("report_user", null, null, null, null, null, null, null, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null));
    }
}
