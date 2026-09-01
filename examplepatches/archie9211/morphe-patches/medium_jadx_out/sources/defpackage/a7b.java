package defpackage;

import com.medium.android.data.post.model.ReportPostReason;
import com.medium.android.reportresponse.ui.ReportResponseReference;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"La7b;", "Lque;", "ur2", "x6b", "w6b", "reportresponse_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class a7b extends que {
    public final ReportResponseReference b;
    public final String c;
    public final String d;
    public final t6b e;
    public final gg5 f;
    public final ae2 g;
    public final vob h;
    public final xpc i;
    public final wua j;
    public final r6c k;
    public final uua l;
    public final String m;
    public final String n;

    public a7b(ReportResponseReference reportResponseReference, String str, String str2, t6b t6bVar, gg5 gg5Var, ae2 ae2Var, vob vobVar) {
        reportResponseReference.getClass();
        str.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = reportResponseReference;
        this.c = str;
        this.d = str2;
        this.e = t6bVar;
        this.f = gg5Var;
        this.g = ae2Var;
        this.h = vobVar;
        wua wuaVarC = vobVar.c("report_response_reason", null);
        wua wuaVarC2 = vobVar.c("hide_response", Boolean.TRUE);
        Boolean bool = Boolean.FALSE;
        wua wuaVarC3 = vobVar.c("block_author", bool);
        xpc xpcVarJ = vv2.j(bool);
        this.i = xpcVarJ;
        pc1 pc1VarS = k40.S(wuaVarC, wuaVarC2, wuaVarC3, xpcVarJ, new z6b(this, null));
        gp1 gp1VarF = f76.F(this);
        vpc vpcVar = wuaVarC.a;
        this.j = bo.e0(pc1VarS, gp1VarF, l7c.b, new x6b((ReportPostReason) vpcVar.getValue(), ((Boolean) wuaVarC3.a.getValue()).booleanValue(), ((Boolean) wuaVarC2.a.getValue()).booleanValue(), (vpcVar.getValue() == null || ((Boolean) xpcVarJ.getValue()).booleanValue()) ? false : true, reportResponseReference.getCanHideResponse()));
        r6c r6cVarX = k40.x(0, 7, null);
        this.k = r6cVarX;
        this.l = bo.z(r6cVarX);
        this.m = "report_post";
        this.n = gp7.u(new SourceParameter("report_post", null, null, null, null, reportResponseReference.getResponseId(), null, null, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4130, 8191, null));
    }
}
