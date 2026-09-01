package defpackage;

import android.content.Context;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.reposters.ui.a;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nab implements jt4 {
    public final /* synthetic */ jab a;
    public final /* synthetic */ jbb b;
    public final /* synthetic */ Context c;
    public final /* synthetic */ mab d;

    public nab(jab jabVar, jbb jbbVar, Context context, mab mabVar) {
        this.a = jabVar;
        this.b = jbbVar;
        this.c = context;
        this.d = mabVar;
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        jbb jbbVar = this.b;
        vx0.c0(f76.F(jbbVar), null, null, new gbb(jbbVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        jbb jbbVar = this.b;
        jbbVar.i.e(sourceParameter, str, jbbVar.c, jbbVar.s);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        jbb jbbVar = this.b;
        vx0.c0(f76.F(jbbVar), null, null, new cbb(jbbVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        jbb jbbVar = this.b;
        vx0.c0(f76.F(jbbVar), null, null, new gbb(jbbVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        jbb jbbVar = this.b;
        vx0.c0(f76.F(jbbVar), null, null, new cbb(jbbVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        jbb jbbVar = this.b;
        vx0.c0(f76.F(jbbVar), null, null, new ebb(jbbVar, str, sourceParameter, null, 3), 3);
    }

    public final void b(String str, SourceParameter sourceParameter) {
        str.getClass();
        jbb jbbVar = this.b;
        if (jbbVar.v.add(str)) {
            jbbVar.k.x0(str, jbbVar.c, gp7.u(sourceParameter), jbbVar.s);
        }
    }

    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        RepostersFragment repostersFragment = ((a) this.a).a;
        ((p13) repostersFragment.Z()).Q(repostersFragment.S(), str, ((RepostersFragment.BundleInfo) repostersFragment.w0.getValue()).getReferrerSource());
    }
}
