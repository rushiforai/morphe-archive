package defpackage;

import com.medium.android.admin.stagebranch.StageBranchData;
import com.medium.android.admin.stagebranch.StageBranchDataAdapter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lxmc;", "Lque;", "wmc", "rmc", "fs2", "admin_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class xmc extends que {
    public final String b;
    public final qn7 c;
    public final ax2 d;
    public final String e;
    public final String f;
    public boolean g;
    public final jb6 h;
    public final r6c i;
    public final wua j;

    public xmc(String str, x38 x38Var, qn7 qn7Var, ax2 ax2Var) {
        str.getClass();
        x38Var.getClass();
        qn7Var.getClass();
        this.b = str;
        this.c = qn7Var;
        this.d = ax2Var;
        this.e = "admin_stage_branch";
        this.f = "admin_stage_branch";
        hz2 hz2VarB = x38Var.b();
        hz2VarB.a(new StageBranchDataAdapter());
        this.h = jq7.f(new x38(hz2VarB), n1b.a(StageBranchData.class));
        this.i = k40.x(0, 7, null);
        this.j = bo.e0(new u50(12, new rna(this, null)), f76.F(this), l7c.b, vmc.a);
    }

    public final long e(StageBranchData stageBranchData) {
        en0 en0Var = gn0.f;
        byte[] bytes = this.h.d(stageBranchData).getBytes(wk1.a);
        bytes.getClass();
        return ((long) gn0.b(en0Var, bytes).length()) + 1000;
    }
}
