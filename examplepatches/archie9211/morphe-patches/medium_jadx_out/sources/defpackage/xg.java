package defpackage;

import com.medium.refinerecommendations.muted.seeall.writers.AllMutedWritersFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xg implements obe {
    public final /* synthetic */ zg7 a;
    public final /* synthetic */ gh b;

    public xg(gh ghVar, zg7 zg7Var) {
        this.a = zg7Var;
        this.b = ghVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        gh ghVar = this.b;
        if (z) {
            vx0.c0(f76.F(ghVar), null, null, new ra((que) ghVar, str, sourceParameter, (n92) null, 11), 3);
        } else {
            vx0.c0(f76.F(ghVar), null, null, new ra((que) ghVar, str, sourceParameter, (n92) null, 12), 3);
        }
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        sourceParameter.getClass();
        throw new UnsupportedOperationException("AllMutedScreen doesn't support subscribing to newsletter");
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        throw new UnsupportedOperationException("AllMutedScreen doesn't support following users");
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        throw ho2.J(sourceParameter, str2, "AllMutedScreen doesn't support following users");
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        throw new UnsupportedOperationException("AllMutedScreen doesn't support subscribing to newsletter");
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        throw ho2.J(sourceParameter, str2, "AllMutedScreen doesn't support following users");
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        throw ho2.J(sourceParameter, str, "AllMutedScreen doesn't support following users");
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllMutedWritersFragment allMutedWritersFragment = (AllMutedWritersFragment) this.a.b;
        ((p13) allMutedWritersFragment.Z()).Q(allMutedWritersFragment.S(), str, strU);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        gh ghVar = this.b;
        if (ghVar.i.add(str)) {
            ghVar.f.x0(str, ghVar.b, gp7.u(sourceParameter), ghVar.j);
        }
    }
}
