package defpackage;

import com.medium.refinerecommendations.suggestions.seeall.friends.AllSuggestionsFriendsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ph implements obe {
    public final /* synthetic */ md5 a;
    public final /* synthetic */ bi b;

    public ph(bi biVar, md5 md5Var) {
        this.a = md5Var;
        this.b = biVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "AllSuggestionsFriendsScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        bi biVar = this.b;
        vx0.c0(f76.F(biVar), null, null, new ai(biVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        bi biVar = this.b;
        biVar.e.e(sourceParameter, str, biVar.b, biVar.i);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        bi biVar = this.b;
        vx0.c0(f76.F(biVar), null, null, new vh(biVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        bi biVar = this.b;
        vx0.c0(f76.F(biVar), null, null, new ai(biVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        bi biVar = this.b;
        vx0.c0(f76.F(biVar), null, null, new vh(biVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        bi biVar = this.b;
        vx0.c0(f76.F(biVar), null, null, new l0(biVar, str, sourceParameter, null, 3), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        AllSuggestionsFriendsFragment allSuggestionsFriendsFragment = (AllSuggestionsFriendsFragment) this.a.b;
        ((p13) allSuggestionsFriendsFragment.Z()).Q(allSuggestionsFriendsFragment.S(), str, strU);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        bi biVar = this.b;
        if (biVar.h.add(str)) {
            biVar.f.x0(str, biVar.b, gp7.u(sourceParameter), biVar.i);
        }
    }
}
