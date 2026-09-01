package com.medium.android.postpage.sharepostfriendlink;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import defpackage.db8;
import defpackage.g76;
import defpackage.i03;
import defpackage.i5c;
import defpackage.k40;
import defpackage.p13;
import defpackage.qo7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a implements i5c {
    public final /* synthetic */ SharePostFriendLinkDialogFragment a;

    public a(SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment) {
        this.a = sharePostFriendLinkDialogFragment;
    }

    public final void a(boolean z) {
        SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = this.a;
        db8 db8VarX = k40.X(sharePostFriendLinkDialogFragment);
        Bundle bundle = new Bundle();
        bundle.putBoolean("share_post_friend_link_result", z);
        qo7.A(db8VarX, bundle);
        if (db8VarX.f()) {
            return;
        }
        sharePostFriendLinkDialogFragment.Q().getOnBackPressedDispatcher().d();
    }

    public final void b() {
        SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = this.a;
        if (k40.X(sharePostFriendLinkDialogFragment).f()) {
            return;
        }
        sharePostFriendLinkDialogFragment.Q().getOnBackPressedDispatcher().d();
    }

    public final void c() throws PendingIntent.CanceledException {
        SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = this.a;
        p13 p13Var = sharePostFriendLinkDialogFragment.H0;
        if (p13Var == null) {
            g76.g0("router");
            throw null;
        }
        Context contextS = sharePostFriendLinkDialogFragment.S();
        if (sharePostFriendLinkDialogFragment.J0 != null) {
            p13Var.g(contextS, Uri.parse(i03.v), sharePostFriendLinkDialogFragment.g0().getReferrerSource());
        } else {
            g76.g0("mediumUris");
            throw null;
        }
    }
}
