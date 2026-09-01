package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.s;
import com.medium.stats.ui.user.UserStatsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tme implements hsc {
    public final /* synthetic */ UserStatsFragment a;

    public tme(UserStatsFragment userStatsFragment) {
        this.a = userStatsFragment;
    }

    @Override // defpackage.hsc
    public final void a(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        UserStatsFragment userStatsFragment = this.a;
        ((p13) userStatsFragment.Z()).r(userStatsFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.hsc
    public final void b(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserStatsFragment userStatsFragment = this.a;
        b09.K(userStatsFragment.Z(), userStatsFragment.S(), EditPostReference.NewPost.INSTANCE, gp7.u(sourceParameter));
    }

    @Override // defpackage.hsc
    public final void c(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        UserStatsFragment userStatsFragment = this.a;
        s sVarZ = userStatsFragment.Z();
        Context contextS = userStatsFragment.S();
        if (userStatsFragment.u0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).f(contextS, Uri.parse(i03.s), gp7.u(sourceParameter));
    }
}
