package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.tag.whotofollow.TagWhoToFollowFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zdd implements cs1 {
    public final /* synthetic */ udd a;
    public final /* synthetic */ qed b;

    public zdd(udd uddVar, qed qedVar) {
        this.a = uddVar;
        this.b = qedVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "TagWhoToFollowScreen doesn't support muting collections");
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        qed qedVar = this.b;
        if (z) {
            vx0.c0(f76.F(qedVar), null, null, new med(qedVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(qedVar), null, null, new med(qedVar, str, sourceParameter, n92Var, 1), 3);
        }
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        TagWhoToFollowFragment tagWhoToFollowFragment = this.a.a;
        ((p13) tagWhoToFollowFragment.Z()).y(tagWhoToFollowFragment.S(), new PublicationReference.Id(str), strU, PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        qed qedVar = this.b;
        if (qedVar.s.add(str)) {
            qedVar.j.g(str, qedVar.c, gp7.u(sourceParameter), qedVar.p);
        }
    }
}
