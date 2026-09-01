package defpackage;

import com.medium.android.followers.publication.PublicationFollowersFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lha implements jha {
    public final /* synthetic */ hha a;
    public final /* synthetic */ zha b;

    public lha(hha hhaVar, zha zhaVar) {
        this.a = hhaVar;
        this.b = zhaVar;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("Mute action is not handled in PublicationFollowers screen");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        zha zhaVar = this.b;
        vx0.c0(f76.F(zhaVar), null, null, new yha(zhaVar, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        zha zhaVar = this.b;
        zhaVar.g.e(sourceParameter, str, zhaVar.b, zhaVar.h);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        zha zhaVar = this.b;
        vx0.c0(f76.F(zhaVar), null, null, new vha(zhaVar, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        zha zhaVar = this.b;
        vx0.c0(f76.F(zhaVar), null, null, new yha(zhaVar, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        zha zhaVar = this.b;
        vx0.c0(f76.F(zhaVar), null, null, new vha(zhaVar, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        zha zhaVar = this.b;
        vx0.c0(f76.F(zhaVar), null, null, new mw9((que) zhaVar, str, (Object) sourceParameter, (n92) null, 9), 3);
    }

    @Override // defpackage.jha
    public final void a() {
        k40.X((PublicationFollowersFragment) this.a.a).f();
    }

    @Override // defpackage.jha
    public final void h() {
        zha zhaVar = this.b;
        if (zhaVar.k) {
            return;
        }
        zhaVar.k = true;
        zhaVar.f.j(zhaVar.b, zhaVar.j, zhaVar.h);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        PublicationFollowersFragment publicationFollowersFragment = (PublicationFollowersFragment) this.a.a;
        ((p13) publicationFollowersFragment.Z()).Q(publicationFollowersFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.jha
    public final void t() {
        zha zhaVar = this.b;
        vx0.c0(f76.F(zhaVar), null, null, new uha(zhaVar, null, 1), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        zha zhaVar = this.b;
        if (zhaVar.l.add(str)) {
            s26 s26Var = zhaVar.e;
            String str2 = zhaVar.h;
            s26Var.x0(str, zhaVar.b, gp7.u(sourceParameter), str2);
        }
    }
}
