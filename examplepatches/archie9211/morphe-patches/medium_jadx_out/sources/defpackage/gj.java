package defpackage;

import com.medium.refinerecommendations.suggestions.seeall.writers.AllSuggestedWritersFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gj implements obe {
    public final /* synthetic */ zg7 a;
    public final /* synthetic */ rj b;

    public gj(rj rjVar, zg7 zg7Var) {
        this.a = zg7Var;
        this.b = rjVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "AllFollowersScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        rj rjVar = this.b;
        vx0.c0(f76.F(rjVar), null, null, new qj(rjVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        rj rjVar = this.b;
        rjVar.e.e(sourceParameter, str, rjVar.b, rjVar.i);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        rj rjVar = this.b;
        vx0.c0(f76.F(rjVar), null, null, new b9(rjVar, str, str2, sourceParameter, (n92) null, 6), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        rj rjVar = this.b;
        vx0.c0(f76.F(rjVar), null, null, new qj(rjVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        rj rjVar = this.b;
        vx0.c0(f76.F(rjVar), null, null, new b9(rjVar, str, str2, sourceParameter, (n92) null, 5), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        rj rjVar = this.b;
        vx0.c0(f76.F(rjVar), null, null, new ra((que) rjVar, str, sourceParameter, (n92) null, 17), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllSuggestedWritersFragment allSuggestedWritersFragment = (AllSuggestedWritersFragment) this.a.b;
        ((p13) allSuggestedWritersFragment.Z()).Q(allSuggestedWritersFragment.S(), str, strU);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        rj rjVar = this.b;
        if (rjVar.h.add(str)) {
            rjVar.f.x0(str, rjVar.b, gp7.u(sourceParameter), rjVar.i);
        }
    }
}
