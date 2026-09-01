package com.medium.android.donkey.onboarding;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentContainerView;
import androidx.navigation.fragment.NavHostFragment;
import com.medium.android.onboarding.ui.welcome.WelcomeFragment;
import com.medium.reader.R;
import defpackage.b75;
import defpackage.db8;
import defpackage.f49;
import defpackage.fo3;
import defpackage.gp7;
import defpackage.h10;
import defpackage.j15;
import defpackage.lv5;
import defpackage.mb8;
import defpackage.q58;
import defpackage.q6;
import defpackage.uue;
import defpackage.yo7;
import defpackage.z72;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class OnboardingFlowActivity extends lv5 implements b75 {
    public static final /* synthetic */ int q = 0;
    public volatile q6 n;
    public final Object o = new Object();
    public boolean p = false;

    public OnboardingFlowActivity() {
        addOnContextAvailableListener(new h10(this, 5));
    }

    @Override // defpackage.a75
    public final Object c() {
        return r().c();
    }

    @Override // defpackage.xy1, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return f49.A(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.lv5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        fo3.a(this, null, 3);
        s(bundle);
        View viewInflate = getLayoutInflater().inflate(R.layout.activity_onboarding_flow, (ViewGroup) null, false);
        if (viewInflate == null) {
            z72.c("rootView");
            return;
        }
        setContentView((FragmentContainerView) viewInflate);
        j15 j15VarC = m().C(R.id.nav_host_fragment);
        j15VarC.getClass();
        db8 db8VarY = ((NavHostFragment) j15VarC).Y();
        String stringExtra = getIntent().getStringExtra("EXTRA_REFERRER_SOURCE");
        if (stringExtra == null) {
            stringExtra = gp7.u(new SourceParameter(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, 8191, null));
        }
        Bundle bundle2 = new Bundle();
        bundle2.putParcelable("bundle_info", new WelcomeFragment.BundleInfo(stringExtra));
        db8VarY.b.s(((mb8) db8VarY.h.getValue()).b(R.navigation.onboarding_graph), bundle2);
        yo7.n(getOnBackPressedDispatcher(), this, new q58(db8VarY, 15, this));
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        r().a();
    }

    public final q6 r() {
        if (this.n == null) {
            synchronized (this.o) {
                try {
                    if (this.n == null) {
                        this.n = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.n;
    }

    public final void s(Bundle bundle) {
        super.onCreate(bundle);
        r().d();
    }
}
