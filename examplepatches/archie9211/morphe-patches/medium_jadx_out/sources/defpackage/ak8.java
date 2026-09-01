package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.notifications.NotificationsFragment;
import com.medium.android.notifications.NotificationsRollupFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ak8 implements ek8 {
    public final /* synthetic */ NotificationsFragment a;

    public ak8(NotificationsFragment notificationsFragment) {
        this.a = notificationsFragment;
    }

    @Override // defpackage.ek8
    public final void a() {
        this.a.Q().getOnBackPressedDispatcher().d();
    }

    @Override // defpackage.ek8
    public final void j(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        NotificationsFragment notificationsFragment = this.a;
        b09.O(notificationsFragment.Z(), notificationsFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
    }

    @Override // defpackage.ek8
    public final void k(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        NotificationsFragment notificationsFragment = this.a;
        ((p13) notificationsFragment.Z()).Q(notificationsFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ek8
    public final void l(String str, SourceParameter sourceParameter) {
        str.getClass();
        NotificationsFragment notificationsFragment = this.a;
        ((p13) notificationsFragment.Z()).y(notificationsFragment.S(), new PublicationReference.Id(str), gp7.u(sourceParameter), PublicationTab.Home.INSTANCE);
    }

    @Override // defpackage.ek8
    public final void m(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        NotificationsFragment notificationsFragment = this.a;
        b09.K(notificationsFragment.Z(), notificationsFragment.S(), new EditPostReference.ExistingPost(str), gp7.u(sourceParameter));
    }

    @Override // defpackage.ek8
    public final void n(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        sourceParameter.getClass();
        NotificationsFragment notificationsFragment = this.a;
        notificationsFragment.Z();
        Context contextS = notificationsFragment.S();
        String strU = gp7.u(sourceParameter);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new NotificationsRollupFragment.BundleInfo(strU, str));
        m4.w(contextS, R.id.notificationsRollupFragment, bundle, null, 12);
    }

    @Override // defpackage.ek8
    public final void o(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        NotificationsFragment notificationsFragment = this.a;
        ((p13) notificationsFragment.Z()).c(notificationsFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.ek8
    public final void p(ResponsesReference responsesReference, SourceParameter sourceParameter) {
        NotificationsFragment notificationsFragment = this.a;
        ((p13) notificationsFragment.Z()).E(notificationsFragment.S(), responsesReference, gp7.u(sourceParameter), !(responsesReference instanceof ResponsesReference.Catalog));
    }
}
