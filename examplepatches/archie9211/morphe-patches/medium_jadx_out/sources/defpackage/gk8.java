package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.notifications.NotificationsRollupFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gk8 implements ek8 {
    public final /* synthetic */ NotificationsRollupFragment a;

    public gk8(NotificationsRollupFragment notificationsRollupFragment) {
        this.a = notificationsRollupFragment;
    }

    @Override // defpackage.ek8
    public final void a() {
        this.a.Q().getOnBackPressedDispatcher().d();
    }

    @Override // defpackage.ek8
    public final void j(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        NotificationsRollupFragment notificationsRollupFragment = this.a;
        b09.O(notificationsRollupFragment.Z(), notificationsRollupFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }

    @Override // defpackage.ek8
    public final void k(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        NotificationsRollupFragment notificationsRollupFragment = this.a;
        ((p13) notificationsRollupFragment.Z()).Q(notificationsRollupFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ek8
    public final void l(String str, SourceParameter sourceParameter) {
        str.getClass();
        NotificationsRollupFragment notificationsRollupFragment = this.a;
        ((p13) notificationsRollupFragment.Z()).y(notificationsRollupFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.ek8
    public final void m(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        NotificationsRollupFragment notificationsRollupFragment = this.a;
        b09.K(notificationsRollupFragment.Z(), notificationsRollupFragment.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.ek8
    public final void n(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
    }

    @Override // defpackage.ek8
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        NotificationsRollupFragment notificationsRollupFragment = this.a;
        ((p13) notificationsRollupFragment.Z()).c(notificationsRollupFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ek8
    public final void p(ResponsesReference responsesReference, SourceParameter sourceParameter) {
        NotificationsRollupFragment notificationsRollupFragment = this.a;
        ((p13) notificationsRollupFragment.Z()).E(notificationsRollupFragment.S(), responsesReference, gp7.u(sourceParameter), !(responsesReference instanceof ResponsesReference.Catalog));
    }
}
