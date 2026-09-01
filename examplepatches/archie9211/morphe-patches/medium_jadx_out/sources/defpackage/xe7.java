package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.share.PostShareData;
import com.medium.android.donkey.main.MainActivity;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xe7 implements i45 {
    public final /* synthetic */ MainActivity a;

    public xe7(MainActivity mainActivity) {
        this.a = mainActivity;
    }

    @Override // defpackage.i45
    public final void j() {
        int i = MainActivity.H;
        y23 y23Var = (y23) this.a.v().c;
        vx0.c0(y23Var.e, null, null, new t23(y23Var, null, 5), 3);
    }

    @Override // defpackage.i45
    public final void k(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        int i = MainActivity.H;
        sg7 sg7VarV = this.a.v();
        vx0.c0(f76.F(sg7VarV), null, null, new hg7(z, sg7VarV, str, str2, sourceParameter, null, 0), 3);
    }

    @Override // defpackage.i45
    public final void l() {
        int i = MainActivity.H;
        xpc xpcVar = this.a.v().F;
        Boolean bool = Boolean.FALSE;
        xpcVar.getClass();
        xpcVar.m(null, bool);
    }

    @Override // defpackage.i45
    public final void m(String str) {
        int i = MainActivity.H;
        y23 y23Var = (y23) this.a.v().c;
        y23Var.getClass();
        vx0.c0(y23Var.e, null, null, new r91(y23Var, str, null, 23), 3);
    }

    @Override // defpackage.i45
    public final void n(float f) {
        int i = MainActivity.H;
        y23 y23Var = (y23) this.a.v().c;
        vx0.c0(y23Var.e, null, null, new jk(y23Var, f, null, 3), 3);
    }

    @Override // defpackage.i45
    public final void o() throws PendingIntent.CanceledException {
        MainActivity mainActivity = this.a;
        mainActivity.t();
        m4.w(mainActivity, R.id.voiceSelectionFragment, null, null, 14);
    }

    @Override // defpackage.i45
    public final void p() {
        int i = MainActivity.H;
        y23 y23Var = (y23) this.a.v().c;
        vx0.c0(y23Var.e, null, null, new t23(y23Var, null, 1), 3);
    }

    @Override // defpackage.i45
    public final void q(PostShareData postShareData, String str) throws PendingIntent.CanceledException {
        postShareData.getClass();
        MainActivity mainActivity = this.a;
        ((p13) mainActivity.t()).t0(mainActivity, postShareData, "", str, "app");
    }

    @Override // defpackage.i45
    public final void r(String str, String str2, String str3) throws PendingIntent.CanceledException {
        MainActivity mainActivity = this.a;
        ((p13) mainActivity.t()).p0(mainActivity, str, str2, str3);
    }

    @Override // defpackage.i45
    public final void s() {
        int i = MainActivity.H;
        y23 y23Var = (y23) this.a.v().c;
        vx0.c0(y23Var.e, null, null, new t23(y23Var, null, 4), 3);
    }

    @Override // defpackage.i45
    public final void t(String str) throws PendingIntent.CanceledException {
        MainActivity mainActivity = this.a;
        b09.O(mainActivity.t(), mainActivity, str, gp7.u(new SourceParameter("tts_player", null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null)), null, null, null, 120);
    }

    @Override // defpackage.i45
    public final void u(String str) {
        int i = MainActivity.H;
        y23 y23Var = (y23) this.a.v().c;
        y23Var.getClass();
        vx0.c0(y23Var.e, null, null, new ku2(y23Var, "", str, null, 4), 3);
    }

    @Override // defpackage.i45
    public final void v(String str) {
        str.getClass();
        MainActivity mainActivity = this.a;
        ((p13) mainActivity.t()).y(mainActivity, new PublicationReference.Id(str), gp7.u(new SourceParameter("tts_player", null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null)), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.i45
    public final void w(String str, String str2) throws PendingIntent.CanceledException {
        MainActivity mainActivity = this.a;
        ((p13) mainActivity.t()).u0(mainActivity, str, str2);
    }

    @Override // defpackage.i45
    public final void x(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        int i = MainActivity.H;
        sg7 sg7VarV = this.a.v();
        vx0.c0(f76.F(sg7VarV), null, null, new hg7(z, sg7VarV, str, str2, sourceParameter, null, 1), 3);
    }

    @Override // defpackage.i45
    public final void y(String str) {
        str.getClass();
        MainActivity mainActivity = this.a;
        ((p13) mainActivity.t()).Q(mainActivity, str, gp7.u(new SourceParameter("tts_player", null, null, null, null, null, null, null, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null)));
    }
}
