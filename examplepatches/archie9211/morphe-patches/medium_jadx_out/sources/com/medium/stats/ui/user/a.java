package com.medium.stats.ui.user;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import com.medium.reader.R;
import com.medium.stats.ui.subscriberslist.SubscribersListFragment;
import com.medium.stats.ui.user.UserStatsFragment;
import defpackage.ab0;
import defpackage.gp7;
import defpackage.ho2;
import defpackage.m4;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a implements ab0 {
    public final /* synthetic */ UserStatsFragment a;

    public a(UserStatsFragment userStatsFragment) {
        this.a = userStatsFragment;
    }

    @Override // defpackage.ab0
    public final void a(SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        sourceParameter.getClass();
        UserStatsFragment userStatsFragment = this.a;
        userStatsFragment.Z();
        Context contextS = userStatsFragment.S();
        String userId = ((UserStatsFragment.BundleInfo) userStatsFragment.v0.getValue()).getUserId();
        String strU = gp7.u(sourceParameter);
        Bundle bundleA = ho2.A(userId);
        bundleA.putParcelable("bundle_info", new SubscribersListFragment.BundleInfo(userId, strU));
        m4.w(contextS, R.id.subscribersListFragment, bundleA, null, 12);
    }
}
