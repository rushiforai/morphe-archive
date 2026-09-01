package defpackage;

import com.medium.android.tag.whotofollow.TagWhoToFollowFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bed implements obe {
    public final /* synthetic */ udd a;
    public final /* synthetic */ qed b;

    public bed(udd uddVar, qed qedVar) {
        this.a = uddVar;
        this.b = qedVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "TagWhoToFollowScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        qed qedVar = this.b;
        vx0.c0(f76.F(qedVar), null, null, new oed(qedVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        qed qedVar = this.b;
        qedVar.i.e(sourceParameter, str, qedVar.c, qedVar.p);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        qed qedVar = this.b;
        vx0.c0(f76.F(qedVar), null, null, new ned(qedVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        qed qedVar = this.b;
        vx0.c0(f76.F(qedVar), null, null, new oed(qedVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        qed qedVar = this.b;
        vx0.c0(f76.F(qedVar), null, null, new ned(qedVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        qed qedVar = this.b;
        vx0.c0(f76.F(qedVar), null, null, new med(qedVar, str, sourceParameter, null, 2), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        TagWhoToFollowFragment tagWhoToFollowFragment = this.a.a;
        ((p13) tagWhoToFollowFragment.Z()).Q(tagWhoToFollowFragment.S(), str, strU);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        qed qedVar = this.b;
        if (qedVar.t.add(str)) {
            qedVar.k.x0(str, qedVar.c, gp7.u(sourceParameter), qedVar.p);
        }
    }
}
