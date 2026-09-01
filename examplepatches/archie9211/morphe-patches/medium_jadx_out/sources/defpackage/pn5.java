package defpackage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import com.medium.android.admin.userdismissableflags.UserDismissableFlagsFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.onboarding.ui.topics.TopicsFragment;
import com.medium.android.onboarding.ui.welcome.WelcomeFragment;
import com.medium.android.profile.ui.view.UserProfileFragment;
import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;
import com.medium.android.unsplash.ui.UnsplashPickerFragment;
import com.medium.android.upvoters.ui.UpVotersFragment;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import com.medium.android.yourlibrary.YourLibraryFragment;
import com.medium.stats.ui.user.UserStatsFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class pn5 extends AbstractMediumFragment implements b75 {
    public final /* synthetic */ int o0;
    public vte p0;
    public boolean q0;
    public volatile u60 r0;
    public final Object s0;
    public boolean t0;

    public pn5(int i) {
        this.o0 = i;
        switch (i) {
            case 1:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 2:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 3:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 4:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 5:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 6:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 7:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 8:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 9:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 10:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            default:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
        }
    }

    private final Object a0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object b0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object c0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object d0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object e0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object f0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object g0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object h0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object i0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    private final Object j0() {
        if (this.r0 == null) {
            synchronized (this.s0) {
                try {
                    if (this.r0 == null) {
                        this.r0 = new u60(this);
                    }
                } finally {
                }
            }
        }
        return this.r0.c();
    }

    @Override // defpackage.j15
    public final LayoutInflater F(Bundle bundle) {
        switch (this.o0) {
            case 0:
                LayoutInflater layoutInflaterF = super.F(bundle);
                return layoutInflaterF.cloneInContext(new vte(layoutInflaterF, this));
            case 1:
                LayoutInflater layoutInflaterF2 = super.F(bundle);
                return layoutInflaterF2.cloneInContext(new vte(layoutInflaterF2, this));
            case 2:
                LayoutInflater layoutInflaterF3 = super.F(bundle);
                return layoutInflaterF3.cloneInContext(new vte(layoutInflaterF3, this));
            case 3:
                LayoutInflater layoutInflaterF4 = super.F(bundle);
                return layoutInflaterF4.cloneInContext(new vte(layoutInflaterF4, this));
            case 4:
                LayoutInflater layoutInflaterF5 = super.F(bundle);
                return layoutInflaterF5.cloneInContext(new vte(layoutInflaterF5, this));
            case 5:
                LayoutInflater layoutInflaterF6 = super.F(bundle);
                return layoutInflaterF6.cloneInContext(new vte(layoutInflaterF6, this));
            case 6:
                LayoutInflater layoutInflaterF7 = super.F(bundle);
                return layoutInflaterF7.cloneInContext(new vte(layoutInflaterF7, this));
            case 7:
                LayoutInflater layoutInflaterF8 = super.F(bundle);
                return layoutInflaterF8.cloneInContext(new vte(layoutInflaterF8, this));
            case 8:
                LayoutInflater layoutInflaterF9 = super.F(bundle);
                return layoutInflaterF9.cloneInContext(new vte(layoutInflaterF9, this));
            case 9:
                LayoutInflater layoutInflaterF10 = super.F(bundle);
                return layoutInflaterF10.cloneInContext(new vte(layoutInflaterF10, this));
            default:
                LayoutInflater layoutInflaterF11 = super.F(bundle);
                return layoutInflaterF11.cloneInContext(new vte(layoutInflaterF11, this));
        }
    }

    @Override // defpackage.a75
    public final Object c() {
        switch (this.o0) {
            case 0:
                return a0();
            case 1:
                return b0();
            case 2:
                return c0();
            case 3:
                return d0();
            case 4:
                return e0();
            case 5:
                return f0();
            case 6:
                return g0();
            case 7:
                return h0();
            case 8:
                return i0();
            case 9:
                return j0();
            default:
                if (this.r0 == null) {
                    synchronized (this.s0) {
                        try {
                            if (this.r0 == null) {
                                this.r0 = new u60(this);
                            }
                        } finally {
                        }
                        break;
                    }
                }
                return this.r0.c();
        }
    }

    @Override // defpackage.j15, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        switch (this.o0) {
        }
        return f49.C(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.j15
    public final Context i() {
        switch (this.o0) {
            case 0:
                if (super.i() != null || this.q0) {
                    l0();
                }
                break;
            case 1:
                if (super.i() != null || this.q0) {
                    q0();
                }
                break;
            case 2:
                if (super.i() != null || this.q0) {
                    r0();
                }
                break;
            case 3:
                if (super.i() != null || this.q0) {
                    s0();
                }
                break;
            case 4:
                if (super.i() != null || this.q0) {
                    p0();
                }
                break;
            case 5:
                if (super.i() != null || this.q0) {
                    n0();
                }
                break;
            case 6:
                if (super.i() != null || this.q0) {
                    k0();
                }
                break;
            case 7:
                if (super.i() != null || this.q0) {
                    m0();
                }
                break;
            case 8:
                if (super.i() != null || this.q0) {
                    o0();
                }
                break;
            case 9:
                if (super.i() != null || this.q0) {
                    t0();
                }
                break;
            default:
                if (super.i() != null || this.q0) {
                    u0();
                }
                break;
        }
        return this.p0;
    }

    public void k0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void l0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void m0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void n0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void o0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void p0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void q0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void r0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void s0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void t0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void u0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public final void v0() {
        switch (this.o0) {
            case 0:
                if (!this.t0) {
                    this.t0 = true;
                    hpd hpdVar = (hpd) c();
                    TopicsFragment topicsFragment = (TopicsFragment) this;
                    fo2 fo2Var = (fo2) hpdVar;
                    fo2Var.getClass();
                    topicsFragment.m0 = true;
                    ko2 ko2Var = fo2Var.b;
                    topicsFragment.n0 = ko2Var.s();
                    topicsFragment.u0 = (ks8) fo2Var.D.get();
                }
                break;
            case 1:
                if (!this.t0) {
                    this.t0 = true;
                    t1e t1eVar = (t1e) c();
                    UnrecognizedEmailFragment unrecognizedEmailFragment = (UnrecognizedEmailFragment) this;
                    fo2 fo2Var2 = (fo2) t1eVar;
                    fo2Var2.getClass();
                    unrecognizedEmailFragment.m0 = true;
                    ko2 ko2Var2 = fo2Var2.b;
                    unrecognizedEmailFragment.n0 = ko2Var2.s();
                    unrecognizedEmailFragment.u0 = i03.a;
                    unrecognizedEmailFragment.v0 = fo2Var2.c.c();
                }
                break;
            case 2:
                if (!this.t0) {
                    this.t0 = true;
                    z2e z2eVar = (z2e) c();
                    UnsplashPickerFragment unsplashPickerFragment = (UnsplashPickerFragment) this;
                    fo2 fo2Var3 = (fo2) z2eVar;
                    fo2Var3.getClass();
                    unsplashPickerFragment.m0 = true;
                    ko2 ko2Var3 = fo2Var3.b;
                    unsplashPickerFragment.n0 = ko2Var3.s();
                    unsplashPickerFragment.v0 = (gx5) ko2Var3.P.get();
                }
                break;
            case 3:
                if (!this.t0) {
                    this.t0 = true;
                    q3e q3eVar = (q3e) c();
                    UpVotersFragment upVotersFragment = (UpVotersFragment) this;
                    fo2 fo2Var4 = (fo2) q3eVar;
                    fo2Var4.getClass();
                    upVotersFragment.m0 = true;
                    ko2 ko2Var4 = fo2Var4.b;
                    upVotersFragment.n0 = ko2Var4.s();
                }
                break;
            case 4:
                if (!this.t0) {
                    this.t0 = true;
                    kae kaeVar = (kae) c();
                    UserDismissableFlagsFragment userDismissableFlagsFragment = (UserDismissableFlagsFragment) this;
                    fo2 fo2Var5 = (fo2) kaeVar;
                    fo2Var5.getClass();
                    userDismissableFlagsFragment.m0 = true;
                    ko2 ko2Var5 = fo2Var5.b;
                    userDismissableFlagsFragment.n0 = ko2Var5.s();
                }
                break;
            case 5:
                if (!this.t0) {
                    this.t0 = true;
                    qge qgeVar = (qge) c();
                    UserProfileFragment userProfileFragment = (UserProfileFragment) this;
                    fo2 fo2Var6 = (fo2) qgeVar;
                    fo2Var6.getClass();
                    userProfileFragment.m0 = true;
                    ko2 ko2Var6 = fo2Var6.b;
                    userProfileFragment.n0 = ko2Var6.s();
                    userProfileFragment.u0 = ko2Var6.c();
                    userProfileFragment.v0 = i03.a;
                }
                break;
            case 6:
                if (!this.t0) {
                    this.t0 = true;
                    vme vmeVar = (vme) c();
                    UserStatsFragment userStatsFragment = (UserStatsFragment) this;
                    fo2 fo2Var7 = (fo2) vmeVar;
                    fo2Var7.getClass();
                    userStatsFragment.m0 = true;
                    ko2 ko2Var7 = fo2Var7.b;
                    userStatsFragment.n0 = ko2Var7.s();
                    userStatsFragment.u0 = i03.a;
                }
                break;
            case 7:
                if (!this.t0) {
                    this.t0 = true;
                    m2f m2fVar = (m2f) c();
                    WelcomeFragment welcomeFragment = (WelcomeFragment) this;
                    fo2 fo2Var8 = (fo2) m2fVar;
                    fo2Var8.getClass();
                    welcomeFragment.m0 = true;
                    ko2 ko2Var8 = fo2Var8.b;
                    welcomeFragment.n0 = ko2Var8.s();
                    welcomeFragment.u0 = (ks8) fo2Var8.D.get();
                }
                break;
            case 8:
                if (!this.t0) {
                    this.t0 = true;
                    nbf nbfVar = (nbf) c();
                    YouProfileFragment youProfileFragment = (YouProfileFragment) this;
                    fo2 fo2Var9 = (fo2) nbfVar;
                    fo2Var9.getClass();
                    youProfileFragment.m0 = true;
                    ko2 ko2Var9 = fo2Var9.b;
                    youProfileFragment.n0 = ko2Var9.s();
                    youProfileFragment.u0 = i03.a;
                    youProfileFragment.v0 = ko2Var9.c();
                }
                break;
            case 9:
                if (!this.t0) {
                    this.t0 = true;
                    bcf bcfVar = (bcf) c();
                    YourFollowingFeedFragment yourFollowingFeedFragment = (YourFollowingFeedFragment) this;
                    fo2 fo2Var10 = (fo2) bcfVar;
                    fo2Var10.getClass();
                    yourFollowingFeedFragment.m0 = true;
                    ko2 ko2Var10 = fo2Var10.b;
                    yourFollowingFeedFragment.n0 = ko2Var10.s();
                }
                break;
            default:
                if (!this.t0) {
                    this.t0 = true;
                    tef tefVar = (tef) c();
                    YourLibraryFragment yourLibraryFragment = (YourLibraryFragment) this;
                    fo2 fo2Var11 = (fo2) tefVar;
                    fo2Var11.getClass();
                    yourLibraryFragment.m0 = true;
                    ko2 ko2Var11 = fo2Var11.b;
                    yourLibraryFragment.n0 = ko2Var11.s();
                }
                break;
        }
    }

    @Override // defpackage.j15
    public final void y(Activity activity) {
        boolean z = true;
        switch (this.o0) {
            case 0:
                this.E = true;
                vte vteVar = this.p0;
                if (vteVar != null && u60.d(vteVar) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                l0();
                v0();
                break;
            case 1:
                this.E = true;
                vte vteVar2 = this.p0;
                if (vteVar2 != null && u60.d(vteVar2) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                q0();
                v0();
                break;
            case 2:
                this.E = true;
                vte vteVar3 = this.p0;
                if (vteVar3 != null && u60.d(vteVar3) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                r0();
                v0();
                break;
            case 3:
                this.E = true;
                vte vteVar4 = this.p0;
                if (vteVar4 != null && u60.d(vteVar4) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                s0();
                v0();
                break;
            case 4:
                this.E = true;
                vte vteVar5 = this.p0;
                if (vteVar5 != null && u60.d(vteVar5) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                p0();
                v0();
                break;
            case 5:
                this.E = true;
                vte vteVar6 = this.p0;
                if (vteVar6 != null && u60.d(vteVar6) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                n0();
                v0();
                break;
            case 6:
                this.E = true;
                vte vteVar7 = this.p0;
                if (vteVar7 != null && u60.d(vteVar7) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                k0();
                v0();
                break;
            case 7:
                this.E = true;
                vte vteVar8 = this.p0;
                if (vteVar8 != null && u60.d(vteVar8) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                m0();
                v0();
                break;
            case 8:
                this.E = true;
                vte vteVar9 = this.p0;
                if (vteVar9 != null && u60.d(vteVar9) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                o0();
                v0();
                break;
            case 9:
                this.E = true;
                vte vteVar10 = this.p0;
                if (vteVar10 != null && u60.d(vteVar10) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                t0();
                v0();
                break;
            default:
                this.E = true;
                vte vteVar11 = this.p0;
                if (vteVar11 != null && u60.d(vteVar11) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                u0();
                v0();
                break;
        }
    }

    @Override // defpackage.j15
    public final void z(Context context) {
        switch (this.o0) {
            case 0:
                super.z(context);
                l0();
                v0();
                break;
            case 1:
                super.z(context);
                q0();
                v0();
                break;
            case 2:
                super.z(context);
                r0();
                v0();
                break;
            case 3:
                super.z(context);
                s0();
                v0();
                break;
            case 4:
                super.z(context);
                p0();
                v0();
                break;
            case 5:
                super.z(context);
                n0();
                v0();
                break;
            case 6:
                super.z(context);
                k0();
                v0();
                break;
            case 7:
                super.z(context);
                m0();
                v0();
                break;
            case 8:
                super.z(context);
                o0();
                v0();
                break;
            case 9:
                super.z(context);
                t0();
                v0();
                break;
            default:
                super.z(context);
                u0();
                v0();
                break;
        }
    }
}
