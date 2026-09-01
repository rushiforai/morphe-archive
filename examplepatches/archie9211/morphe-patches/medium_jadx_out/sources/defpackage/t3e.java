package defpackage;

import com.medium.android.upvoters.ui.UpVotersFragment;
import com.medium.android.upvoters.ui.a;
import com.medium.android.upvoters.ui.d;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t3e implements obe {
    public final /* synthetic */ a a;
    public final /* synthetic */ d b;

    public t3e(a aVar, d dVar) {
        this.a = aVar;
        this.b = dVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "UpVotersScreen doesn't support muting users");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        d dVar = this.b;
        vx0.c0(f76.F(dVar), null, null, new b4e(dVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        d dVar = this.b;
        dVar.f.e(sourceParameter, str, dVar.c, dVar.k);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        d dVar = this.b;
        vx0.c0(f76.F(dVar), null, null, new z3e(dVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        d dVar = this.b;
        vx0.c0(f76.F(dVar), null, null, new b4e(dVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        d dVar = this.b;
        vx0.c0(f76.F(dVar), null, null, new z3e(dVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        d dVar = this.b;
        vx0.c0(f76.F(dVar), null, null, new j5d(dVar, str, sourceParameter, null, 7), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        UpVotersFragment upVotersFragment = this.a.a;
        ((p13) upVotersFragment.Z()).Q(upVotersFragment.S(), str, ((UpVotersFragment.BundleInfo) upVotersFragment.u0.getValue()).getReferrerSource());
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        d dVar = this.b;
        if (dVar.j.add(str)) {
            dVar.h.x0(str, dVar.c, gp7.u(sourceParameter), dVar.k);
        }
    }
}
