package defpackage;

import android.net.Uri;
import com.medium.android.profile.ui.view.UserProfileFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pge {
    public final /* synthetic */ UserProfileFragment a;

    public pge(UserProfileFragment userProfileFragment) {
        this.a = userProfileFragment;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        UserProfileFragment userProfileFragment = this.a;
        py2 py2Var = userProfileFragment.u0;
        if (py2Var != null) {
            py2Var.a(userProfileFragment.S(), Uri.parse(str), gp7.u(sourceParameter), null);
        } else {
            g76.g0("deepLinkHandler");
            throw null;
        }
    }
}
