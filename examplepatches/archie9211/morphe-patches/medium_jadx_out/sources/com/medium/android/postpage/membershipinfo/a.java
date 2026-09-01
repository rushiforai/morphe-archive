package com.medium.android.postpage.membershipinfo;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.reader.R;
import defpackage.g76;
import defpackage.gp7;
import defpackage.i03;
import defpackage.k40;
import defpackage.p13;
import defpackage.qo7;
import defpackage.rv7;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a implements rv7 {
    public final /* synthetic */ MembershipInfoBottomSheetFragment a;

    public a(MembershipInfoBottomSheetFragment membershipInfoBottomSheetFragment) {
        this.a = membershipInfoBottomSheetFragment;
    }

    @Override // defpackage.rv7
    public final void a() {
        qo7.z(k40.X(this.a), R.id.memberShipBottomSheetFragment);
    }

    @Override // defpackage.rv7
    public final void b() throws PendingIntent.CanceledException {
        MembershipInfoBottomSheetFragment membershipInfoBottomSheetFragment = this.a;
        p13 p13Var = membershipInfoBottomSheetFragment.H0;
        if (p13Var == null) {
            g76.g0("router");
            throw null;
        }
        p13Var.J(membershipInfoBottomSheetFragment.S(), new UpsellInfo(UpsellReferrer.MEMBER_ONLY_CONTENT_SHEET, null, null, membershipInfoBottomSheetFragment.g0().getPostId(), membershipInfoBottomSheetFragment.g0().getAuthorId(), null, 38, null), membershipInfoBottomSheetFragment.g0().getReferrerSource(), null);
    }

    @Override // defpackage.rv7
    public final void c() {
        MembershipInfoBottomSheetFragment membershipInfoBottomSheetFragment = this.a;
        p13 p13Var = membershipInfoBottomSheetFragment.H0;
        if (p13Var == null) {
            g76.g0("router");
            throw null;
        }
        Context contextS = membershipInfoBottomSheetFragment.S();
        if (membershipInfoBottomSheetFragment.J0 != null) {
            p13Var.f(contextS, Uri.parse(i03.s), gp7.u(new SourceParameter("member_only_content_sheet", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null)));
        } else {
            g76.g0("mediumUris");
            throw null;
        }
    }
}
