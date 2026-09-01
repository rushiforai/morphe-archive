package defpackage;

import com.medium.refinerecommendations.following.seeall.writers.AllFollowedWritersFragment;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uf implements obe {
    public final /* synthetic */ zm7 a;
    public final /* synthetic */ eg b;

    public uf(eg egVar, zm7 zm7Var) {
        this.a = zm7Var;
        this.b = egVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "AllFollowersScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        eg egVar = this.b;
        vx0.c0(f76.F(egVar), null, null, new dg(egVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        eg egVar = this.b;
        egVar.f.e(sourceParameter, str, egVar.b, egVar.j);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        eg egVar = this.b;
        vx0.c0(f76.F(egVar), null, null, new b9(egVar, str, str2, sourceParameter, (n92) null, 3), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        eg egVar = this.b;
        vx0.c0(f76.F(egVar), null, null, new dg(egVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        eg egVar = this.b;
        vx0.c0(f76.F(egVar), null, null, new b9(egVar, str, str2, sourceParameter, (n92) null, 2), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        eg egVar = this.b;
        vx0.c0(f76.F(egVar), null, null, new ra((que) egVar, str, sourceParameter, (n92) null, 8), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllFollowedWritersFragment allFollowedWritersFragment = (AllFollowedWritersFragment) this.a.b;
        ((p13) allFollowedWritersFragment.Z()).Q(allFollowedWritersFragment.S(), str, strU);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        eg egVar = this.b;
        Set linkedHashSet = (Set) egVar.c.a("user_ids_presented");
        if (linkedHashSet == null) {
            linkedHashSet = new LinkedHashSet();
        }
        if (linkedHashSet.add(str)) {
            egVar.g.x0(str, egVar.b, gp7.u(sourceParameter), egVar.j);
        }
    }
}
