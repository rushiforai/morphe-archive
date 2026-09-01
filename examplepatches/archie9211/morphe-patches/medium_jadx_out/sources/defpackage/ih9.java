package defpackage;

import android.app.AlertDialog;
import android.app.PendingIntent;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.s;
import com.medium.android.donkey.post.PostFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ih9 implements iq9 {
    public final /* synthetic */ PostFragment a;

    public ih9(PostFragment postFragment) {
        this.a = postFragment;
    }

    @Override // defpackage.iq9
    public final void A(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().w(sourceParameter, str2, str, false);
    }

    @Override // defpackage.iq9
    public final void B(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().y(sourceParameter, str, false);
    }

    @Override // defpackage.iq9
    public final void C(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().y(sourceParameter, str, true);
    }

    @Override // defpackage.iq9
    public final void D(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().k(str, sourceParameter);
    }

    @Override // defpackage.iq9
    public final void H(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostFragment postFragment = this.a;
        b09.K(postFragment.Z(), postFragment.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.iq9
    public final void I(String str, SourceParameter sourceParameter) {
        str.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).y(postFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.iq9
    public final void L(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).i0(postFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.iq9
    public final void a() {
        this.a.Q().getOnBackPressedDispatcher().d();
    }

    @Override // defpackage.iq9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str, str2);
        PostFragment postFragment = this.a;
        sw9 sw9VarK1 = postFragment.k1();
        sw9VarK1.s.s(sourceParameter, str, str2, sw9VarK1.d, sw9VarK1.D0);
        s sVarZ = postFragment.Z();
        ((p13) sVarZ).j0(postFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.iq9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        ho2.O(sourceParameter, str, str2);
        PostFragment postFragment = this.a;
        sw9 sw9VarK1 = postFragment.k1();
        sw9VarK1.s.r(sourceParameter, str, str2, sw9VarK1.d, sw9VarK1.D0);
        s sVarZ = postFragment.Z();
        ((p13) sVarZ).j0(postFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.iq9
    public final void e(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().D(str, sourceParameter);
    }

    @Override // defpackage.iq9
    public final void h(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).r(postFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.iq9
    public final void i(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        PostFragment postFragment = this.a;
        ((p13) postFragment.Z()).p0(postFragment.S(), str, str2, gp7.u(sourceParameter));
    }

    @Override // defpackage.iq9
    public final void n(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        sw9 sw9VarK1 = this.a.k1();
        vx0.c0(f76.F(sw9VarK1), null, null, new gs9(sw9VarK1, str, sourceParameter, null, 17), 3);
    }

    @Override // defpackage.iq9
    public final void p(int i) {
        this.a.k1().B(i);
    }

    @Override // defpackage.iq9
    public final void q(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        this.a.k1().x(sourceParameter, str2, str, false);
    }

    @Override // defpackage.iq9
    public final void r(String str, String str2) {
        str.getClass();
        str2.getClass();
        PostFragment postFragment = this.a;
        new AlertDialog.Builder(postFragment.S()).setTitle(R.string.common_post_delete_story_title).setMessage(postFragment.p(R.string.common_post_delete_story_warning, str2)).setPositiveButton(R.string.common_post_delete_story_do_it, new qa3(1, postFragment)).setNegativeButton(R.string.common_post_delete_story_cancel, new i60(1)).show();
    }

    @Override // defpackage.iq9
    public final void t(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().w(sourceParameter, str2, str, true);
    }

    @Override // defpackage.iq9
    public final void u(SourceParameter sourceParameter, String str, String str2) {
        ho2.O(sourceParameter, str, str2);
        this.a.k1().x(sourceParameter, str2, str, true);
    }

    @Override // defpackage.iq9
    public final void w(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a.k1().F(str, sourceParameter);
    }

    @Override // defpackage.iq9
    public final void x() {
        this.a.k1().z();
    }
}
