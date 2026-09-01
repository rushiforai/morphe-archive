package defpackage;

import com.medium.android.followers.FollowersFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pw4 implements lw4 {
    public final /* synthetic */ rz2 a;
    public final /* synthetic */ ax4 b;

    public pw4(rz2 rz2Var, ax4 ax4Var) {
        this.a = rz2Var;
        this.b = ax4Var;
    }

    @Override // defpackage.obe
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "Mute a user is not supported.");
    }

    @Override // defpackage.jt4
    public final void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.P(sourceParameter, str, str2, str3);
        ax4 ax4Var = this.b;
        vx0.c0(f76.F(ax4Var), null, null, new zw4(ax4Var, str3, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void M(String str, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        ax4 ax4Var = this.b;
        ax4Var.g.e(sourceParameter, str, ax4Var.b, ax4Var.h);
    }

    @Override // defpackage.jt4
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        ax4 ax4Var = this.b;
        vx0.c0(f76.F(ax4Var), null, null, new xw4(ax4Var, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.jt4
    public final void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        ho2.O(sourceParameter, str, str2);
        ax4 ax4Var = this.b;
        vx0.c0(f76.F(ax4Var), null, null, new zw4(ax4Var, str3, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.obe
    public final /* bridge */ void P(String str, SourceParameter sourceParameter) {
        wgd.c(str, sourceParameter);
    }

    @Override // defpackage.jt4
    public final void S(SourceParameter sourceParameter, String str, String str2) {
        str2.getClass();
        sourceParameter.getClass();
        ax4 ax4Var = this.b;
        vx0.c0(f76.F(ax4Var), null, null, new xw4(ax4Var, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.jt4
    public final void U(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        ax4 ax4Var = this.b;
        vx0.c0(f76.F(ax4Var), null, null, new ku2(ax4Var, str, sourceParameter, null, 25), 3);
    }

    @Override // defpackage.lw4
    public final void a() {
        k40.X((FollowersFragment) this.a.b).f();
    }

    @Override // defpackage.lw4
    public final void h() {
        ax4 ax4Var = this.b;
        if (ax4Var.k) {
            return;
        }
        ax4Var.k = true;
        ax4Var.f.j(ax4Var.b, ax4Var.j, ax4Var.h);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        FollowersFragment followersFragment = (FollowersFragment) this.a.b;
        ((p13) followersFragment.Z()).Q(followersFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.lw4
    public final void t() {
        ax4 ax4Var = this.b;
        vx0.c0(f76.F(ax4Var), null, null, new ww4(ax4Var, null, 1), 3);
    }

    @Override // defpackage.obe, defpackage.e9d
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        ax4 ax4Var = this.b;
        if (ax4Var.l.add(str)) {
            s26 s26Var = ax4Var.e;
            String str2 = ax4Var.h;
            s26Var.x0(str, ax4Var.b, gp7.u(sourceParameter), str2);
        }
    }
}
