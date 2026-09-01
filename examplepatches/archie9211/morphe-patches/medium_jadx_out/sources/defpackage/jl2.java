package defpackage;

import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.settings.ui.customappicon.CustomAppIconFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jl2 {
    public final /* synthetic */ CustomAppIconFragment a;

    public jl2(CustomAppIconFragment customAppIconFragment) {
        this.a = customAppIconFragment;
    }

    public final void a(String str) {
        str.getClass();
        CustomAppIconFragment customAppIconFragment = this.a;
        ((p13) customAppIconFragment.Z()).J(customAppIconFragment.S(), new UpsellInfo(UpsellReferrer.CUSTOM_APP_ICON, null, null, null, null, null, 62, null), str, null);
    }
}
