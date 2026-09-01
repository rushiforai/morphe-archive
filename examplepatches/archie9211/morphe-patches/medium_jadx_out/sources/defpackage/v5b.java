package defpackage;

import com.medium.android.data.post.model.ReportPostReason;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lv5b;", "Lque;", "sr2", "t5b", "s5b", "reportpost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class v5b extends que {
    public final String b;
    public final String c;
    public final String d;
    public final p5b e;
    public final vob f;
    public final xpc g;
    public final wua h;
    public final r6c i;
    public final uua j;
    public final String k;
    public final String l;

    public v5b(String str, String str2, String str3, p5b p5bVar, vob vobVar) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = p5bVar;
        this.f = vobVar;
        wua wuaVarC = vobVar.c("report_post_reason", null);
        Boolean bool = Boolean.FALSE;
        wua wuaVarC2 = vobVar.c("block_author", bool);
        xpc xpcVarJ = vv2.j(bool);
        this.g = xpcVarJ;
        pc1 pc1VarT = k40.T(wuaVarC, wuaVarC2, xpcVarJ, new u5b(4, 0, null));
        gp1 gp1VarF = f76.F(this);
        vpc vpcVar = wuaVarC.a;
        this.h = bo.e0(pc1VarT, gp1VarF, l7c.b, new t5b((ReportPostReason) vpcVar.getValue(), ((Boolean) wuaVarC2.a.getValue()).booleanValue(), (vpcVar.getValue() == null || ((Boolean) xpcVarJ.getValue()).booleanValue()) ? false : true));
        r6c r6cVarX = k40.x(0, 7, null);
        this.i = r6cVarX;
        this.j = bo.z(r6cVarX);
        this.k = "report_post";
        this.l = gp7.u(new SourceParameter("report_post", null, null, null, null, str, null, null, null, null, null, null, str2, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4130, 8191, null));
    }
}
