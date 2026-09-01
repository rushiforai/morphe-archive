package defpackage;

import android.os.Parcelable;
import com.medium.android.admin.admininternalstatus.AdminInternalStatusFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jb implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ AdminInternalStatusFragment b;

    public /* synthetic */ jb(AdminInternalStatusFragment adminInternalStatusFragment, int i) {
        this.a = i;
        this.b = adminInternalStatusFragment;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        AdminInternalStatusFragment adminInternalStatusFragment = this.b;
        switch (i) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(adminInternalStatusFragment), "bundle_info", AdminInternalStatusFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (AdminInternalStatusFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            default:
                adminInternalStatusFragment.Q().getOnBackPressedDispatcher().d();
                return c1e.a;
        }
    }
}
