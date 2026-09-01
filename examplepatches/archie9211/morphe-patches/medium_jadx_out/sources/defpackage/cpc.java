package defpackage;

import android.os.Bundle;
import com.medium.android.onboarding.ui.starterpackdetail.StarterPackDetailFragment;
import com.medium.android.onboarding.ui.starterpacks.StarterPacksFragment;
import com.medium.android.onboarding.ui.starterpacks.b;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cpc {
    public final /* synthetic */ yoc a;
    public final /* synthetic */ jpc b;

    public cpc(yoc yocVar, jpc jpcVar) {
        this.a = yocVar;
        this.b = jpcVar;
    }

    public final void a(String str) {
        str.getClass();
        StarterPacksFragment starterPacksFragment = ((b) this.a).a;
        ks8 ks8Var = starterPacksFragment.u0;
        if (ks8Var == null) {
            g76.g0("onboardingRouter");
            throw null;
        }
        String referrerSource = ((StarterPacksFragment.BundleInfo) starterPacksFragment.v0.getValue()).getReferrerSource();
        referrerSource.getClass();
        db8 db8VarX = k40.X(ks8Var.a);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new StarterPackDetailFragment.BundleInfo(referrerSource, str));
        db8VarX.c(R.id.starterPackDetailFragment, bundle, (ob8) ks8Var.e.getValue(), null);
    }

    public final void b() {
        jpc jpcVar = this.b;
        vx0.c0(f76.F(jpcVar), null, null, new xi7(jpcVar, null, 19), 3);
    }
}
