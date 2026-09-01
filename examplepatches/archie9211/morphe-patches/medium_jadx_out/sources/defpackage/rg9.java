package defpackage;

import android.os.Parcelable;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class rg9 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PostFragment b;

    public /* synthetic */ rg9(PostFragment postFragment, int i) {
        this.a = i;
        this.b = postFragment;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PostFragment postFragment = this.b;
        switch (i) {
            case 0:
                postFragment.k1().e1 = true;
                postFragment.J0.a("android.permission.POST_NOTIFICATIONS", null);
                return c1eVar;
            case 1:
                ((p13) postFragment.Z()).b0(postFragment.S());
                return c1eVar;
            case 2:
                postFragment.x0.setValue(Boolean.FALSE);
                postFragment.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            default:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(postFragment), "bundle_info", PostFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (PostFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
        }
    }
}
