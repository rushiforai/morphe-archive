package defpackage;

import com.medium.android.data.post.model.ReportRepostReason;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lk6b;", "Lque;", "tr2", "j6b", "i6b", "repost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class k6b extends que {
    public final String b;
    public final String c;
    public final mya d;
    public final vob e;
    public final xpc f;
    public final g08 g;
    public final wua h;
    public final r6c i;
    public final uua j;

    public k6b(String str, String str2, String str3, mya myaVar, vob vobVar) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = myaVar;
        this.e = vobVar;
        wua wuaVarC = vobVar.c("report_repost_reason", null);
        Boolean bool = Boolean.FALSE;
        wua wuaVarC2 = vobVar.c("block_user", bool);
        xpc xpcVarJ = vv2.j(bool);
        this.f = xpcVarJ;
        SourceParameter sourceParameter = new SourceParameter("report_repost", null, null, null, null, str, null, null, null, null, null, null, str2, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4130, 8191, null);
        this.g = new g08(sourceParameter, str3, "report_repost");
        pc1 pc1VarT = k40.T(wuaVarC, wuaVarC2, xpcVarJ, new mqa(1 == true ? 1 : 0, null, this));
        gp1 gp1VarF = f76.F(this);
        vpc vpcVar = wuaVarC.a;
        this.h = bo.e0(pc1VarT, gp1VarF, l7c.b, new j6b((ReportRepostReason) vpcVar.getValue(), ((Boolean) wuaVarC2.a.getValue()).booleanValue(), (vpcVar.getValue() == null || ((Boolean) xpcVarJ.getValue()).booleanValue()) ? false : true, sourceParameter));
        r6c r6cVarX = k40.x(0, 7, null);
        this.i = r6cVarX;
        this.j = bo.z(r6cVarX);
    }
}
