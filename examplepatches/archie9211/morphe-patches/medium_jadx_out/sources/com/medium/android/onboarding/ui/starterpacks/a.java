package com.medium.android.onboarding.ui.starterpacks;

import com.medium.android.onboarding.ui.starterpacks.StarterPacksFragment;
import defpackage.b55;
import defpackage.br7;
import defpackage.c1e;
import defpackage.g76;
import defpackage.ks8;
import defpackage.n92;
import defpackage.p4d;
import defpackage.sb2;
import defpackage.tb2;
import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a extends p4d implements b55 {
    public int b;
    public final /* synthetic */ StarterPacksFragment c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(StarterPacksFragment starterPacksFragment, n92 n92Var) {
        super(2, n92Var);
        this.c = starterPacksFragment;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new a(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((a) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            StarterPacksFragment starterPacksFragment = this.c;
            ks8 ks8Var = starterPacksFragment.u0;
            if (ks8Var == null) {
                g76.g0("onboardingRouter");
                throw null;
            }
            String referrerSource = ((StarterPacksFragment.BundleInfo) starterPacksFragment.v0.getValue()).getReferrerSource();
            this.b = 1;
            if (ks8Var.a(referrerSource, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
