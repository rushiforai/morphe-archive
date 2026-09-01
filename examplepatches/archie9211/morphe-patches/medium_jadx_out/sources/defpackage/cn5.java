package defpackage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import com.medium.android.admin.payments.PaymentsDebuggerFragment;
import com.medium.android.admin.stagebranch.StageBranchFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.donkey.post.PostFragment;
import com.medium.android.donkey.post.PostPageFragment2;
import com.medium.android.followers.publication.PublicationFollowersFragment;
import com.medium.android.notifications.NotificationsRollupFragment;
import com.medium.android.onboarding.ui.starterpackdetail.StarterPackDetailFragment;
import com.medium.android.onboarding.ui.starterpacks.StarterPacksFragment;
import com.medium.android.postpublishing.ui.PublicationFlowFragment;
import com.medium.android.publication.ui.archive.PublicationArchiveFragment;
import com.medium.android.publication.ui.editors.PublicationEditorsFragment;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.android.publication.ui.writers.PublicationWritersFragment;
import com.medium.android.pushnotificationsettings.ui.PushNotificationSettingsFragment;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.responses.ResponsesFragment;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.android.settings.main.SettingsFragment;
import com.medium.android.settings.ui.privacy.PrivacyFragment;
import com.medium.android.susi.ui.signIn.SignInFragment;
import com.medium.android.susi.ui.signUp.SignUpFragment;
import com.medium.android.susi.ui.welcome.SusiWelcomeFragment;
import com.medium.android.tag.recommendedposts.TagRecommendedPostsFragment;
import com.medium.android.tag.tagdirectory.TagDirectoryFragment;
import com.medium.android.tag.tagpage.TagFragment;
import com.medium.android.tag.whotofollow.TagWhoToFollowFragment;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.stats.ui.post.PostStatsFragment;
import com.medium.stats.ui.pub.PubStatsFragment;
import com.medium.stats.ui.subscriberslist.SubscribersListFragment;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class cn5 extends AbstractMediumFragment implements b75 {
    public final /* synthetic */ int o0;
    public vte p0;
    public boolean q0;
    public volatile u60 r0;
    public final Object s0;
    public boolean t0;

    public cn5(int i) {
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
            case 11:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 12:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 13:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 14:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 15:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 16:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 17:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 18:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 19:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 20:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 21:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 22:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 23:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 24:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 25:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 26:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 27:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 28:
                this.q0 = false;
                this.s0 = new Object();
                this.t0 = false;
                break;
            case 29:
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

    private final Object A0() {
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

    private final Object B0() {
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

    private final Object C0() {
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

    private final Object k0() {
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

    private final Object l0() {
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

    private final Object m0() {
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

    private final Object n0() {
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

    private final Object o0() {
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

    private final Object p0() {
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

    private final Object q0() {
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

    private final Object r0() {
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

    private final Object s0() {
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

    private final Object t0() {
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

    private final Object u0() {
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

    private final Object v0() {
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

    private final Object w0() {
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

    private final Object x0() {
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

    private final Object y0() {
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

    private final Object z0() {
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

    public void D0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void E0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
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
            case 10:
                LayoutInflater layoutInflaterF11 = super.F(bundle);
                return layoutInflaterF11.cloneInContext(new vte(layoutInflaterF11, this));
            case 11:
                LayoutInflater layoutInflaterF12 = super.F(bundle);
                return layoutInflaterF12.cloneInContext(new vte(layoutInflaterF12, this));
            case 12:
                LayoutInflater layoutInflaterF13 = super.F(bundle);
                return layoutInflaterF13.cloneInContext(new vte(layoutInflaterF13, this));
            case 13:
                LayoutInflater layoutInflaterF14 = super.F(bundle);
                return layoutInflaterF14.cloneInContext(new vte(layoutInflaterF14, this));
            case 14:
                LayoutInflater layoutInflaterF15 = super.F(bundle);
                return layoutInflaterF15.cloneInContext(new vte(layoutInflaterF15, this));
            case 15:
                LayoutInflater layoutInflaterF16 = super.F(bundle);
                return layoutInflaterF16.cloneInContext(new vte(layoutInflaterF16, this));
            case 16:
                LayoutInflater layoutInflaterF17 = super.F(bundle);
                return layoutInflaterF17.cloneInContext(new vte(layoutInflaterF17, this));
            case 17:
                LayoutInflater layoutInflaterF18 = super.F(bundle);
                return layoutInflaterF18.cloneInContext(new vte(layoutInflaterF18, this));
            case 18:
                LayoutInflater layoutInflaterF19 = super.F(bundle);
                return layoutInflaterF19.cloneInContext(new vte(layoutInflaterF19, this));
            case 19:
                LayoutInflater layoutInflaterF20 = super.F(bundle);
                return layoutInflaterF20.cloneInContext(new vte(layoutInflaterF20, this));
            case 20:
                LayoutInflater layoutInflaterF21 = super.F(bundle);
                return layoutInflaterF21.cloneInContext(new vte(layoutInflaterF21, this));
            case 21:
                LayoutInflater layoutInflaterF22 = super.F(bundle);
                return layoutInflaterF22.cloneInContext(new vte(layoutInflaterF22, this));
            case 22:
                LayoutInflater layoutInflaterF23 = super.F(bundle);
                return layoutInflaterF23.cloneInContext(new vte(layoutInflaterF23, this));
            case 23:
                LayoutInflater layoutInflaterF24 = super.F(bundle);
                return layoutInflaterF24.cloneInContext(new vte(layoutInflaterF24, this));
            case 24:
                LayoutInflater layoutInflaterF25 = super.F(bundle);
                return layoutInflaterF25.cloneInContext(new vte(layoutInflaterF25, this));
            case 25:
                LayoutInflater layoutInflaterF26 = super.F(bundle);
                return layoutInflaterF26.cloneInContext(new vte(layoutInflaterF26, this));
            case 26:
                LayoutInflater layoutInflaterF27 = super.F(bundle);
                return layoutInflaterF27.cloneInContext(new vte(layoutInflaterF27, this));
            case 27:
                LayoutInflater layoutInflaterF28 = super.F(bundle);
                return layoutInflaterF28.cloneInContext(new vte(layoutInflaterF28, this));
            case 28:
                LayoutInflater layoutInflaterF29 = super.F(bundle);
                return layoutInflaterF29.cloneInContext(new vte(layoutInflaterF29, this));
            default:
                LayoutInflater layoutInflaterF30 = super.F(bundle);
                return layoutInflaterF30.cloneInContext(new vte(layoutInflaterF30, this));
        }
    }

    public void F0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void G0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void H0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void I0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void J0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void K0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void L0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void M0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void N0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void O0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void P0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void Q0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void R0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void S0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void T0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void U0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void V0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void W0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void X0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void Y0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void Z0() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void a1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void b1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
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
            case 10:
                return k0();
            case 11:
                return l0();
            case 12:
                return m0();
            case 13:
                return n0();
            case 14:
                return o0();
            case 15:
                return p0();
            case 16:
                return q0();
            case 17:
                return r0();
            case 18:
                return s0();
            case 19:
                return t0();
            case 20:
                return u0();
            case 21:
                return v0();
            case 22:
                return w0();
            case 23:
                return x0();
            case 24:
                return y0();
            case 25:
                return z0();
            case 26:
                return A0();
            case 27:
                return B0();
            case 28:
                return C0();
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

    public void c1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void d1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void e1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void f1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    public void g1() {
        if (this.p0 == null) {
            this.p0 = new vte(super.i(), this);
            this.q0 = bo.W(super.i());
        }
    }

    @Override // defpackage.j15, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        switch (this.o0) {
        }
        return f49.C(this, super.getDefaultViewModelProviderFactory());
    }

    public final void h1() {
        yi3 yi3Var;
        switch (this.o0) {
            case 0:
                if (!this.t0) {
                    this.t0 = true;
                    hk8 hk8Var = (hk8) c();
                    NotificationsRollupFragment notificationsRollupFragment = (NotificationsRollupFragment) this;
                    fo2 fo2Var = (fo2) hk8Var;
                    fo2Var.getClass();
                    notificationsRollupFragment.m0 = true;
                    ko2 ko2Var = fo2Var.b;
                    notificationsRollupFragment.n0 = ko2Var.s();
                }
                break;
            case 1:
                if (!this.t0) {
                    this.t0 = true;
                    w69 w69Var = (w69) c();
                    PaymentsDebuggerFragment paymentsDebuggerFragment = (PaymentsDebuggerFragment) this;
                    fo2 fo2Var2 = (fo2) w69Var;
                    fo2Var2.getClass();
                    paymentsDebuggerFragment.m0 = true;
                    ko2 ko2Var2 = fo2Var2.b;
                    paymentsDebuggerFragment.n0 = ko2Var2.s();
                }
                break;
            case 2:
                if (!this.t0) {
                    this.t0 = true;
                    jh9 jh9Var = (jh9) c();
                    PostFragment postFragment = (PostFragment) this;
                    fo2 fo2Var3 = (fo2) jh9Var;
                    fo2Var3.getClass();
                    postFragment.m0 = true;
                    ko2 ko2Var3 = fo2Var3.b;
                    postFragment.n0 = ko2Var3.s();
                    ct2 ct2Var = new ct2(24);
                    ct2Var.c(zh9.class, new ue0((vn2) fo2Var3.e.get()));
                    ct2Var.c(pj9.class, new ue0((xn2) fo2Var3.f.get()));
                    ct2Var.c(ni3.class, new ue0((yn2) fo2Var3.g.get()));
                    ct2Var.c(if1.class, new ue0((zn2) fo2Var3.h.get()));
                    ct2Var.c(me9.class, new ue0((ao2) fo2Var3.i.get()));
                    ct2Var.c(mf1.class, new ue0((bo2) fo2Var3.j.get()));
                    ct2Var.c(h24.class, new ue0((co2) fo2Var3.k.get()));
                    ct2Var.c(n39.class, new ue0((do2) fo2Var3.l.get()));
                    ct2Var.c(j06.class, new ue0((an2) fo2Var3.m.get()));
                    ct2Var.c(gf0.class, new ue0((bn2) fo2Var3.n.get()));
                    ct2Var.c(ve0.class, new ue0((cn2) fo2Var3.o.get()));
                    ct2Var.c(iia.class, new ue0((dn2) fo2Var3.p.get()));
                    ct2Var.c(qg5.class, new ue0((en2) fo2Var3.q.get()));
                    ct2Var.c(u38.class, new ue0((fn2) fo2Var3.r.get()));
                    ct2Var.c(uvb.class, new ue0((gn2) fo2Var3.s.get()));
                    ct2Var.c(kwa.class, new ue0((hn2) fo2Var3.t.get()));
                    ct2Var.c(xvb.class, new ue0((in2) fo2Var3.u.get()));
                    ct2Var.c(gqd.class, new ue0((jn2) fo2Var3.v.get()));
                    ct2Var.c(h1e.class, new ue0((ln2) fo2Var3.w.get()));
                    ct2Var.c(r35.class, new ue0((mn2) fo2Var3.x.get()));
                    ct2Var.c(yn8.class, new ue0((nn2) fo2Var3.y.get()));
                    ct2Var.c(ko9.class, new ue0((on2) fo2Var3.z.get()));
                    ct2Var.c(ve9.class, new ue0((pn2) fo2Var3.A.get()));
                    ct2Var.c(ii9.class, new ue0((qn2) fo2Var3.B.get()));
                    Map mapB = ct2Var.b();
                    mapB.getClass();
                    my6 my6Var = new my6();
                    my6Var.a = mapB;
                    postFragment.u0 = my6Var;
                    postFragment.v0 = ko2Var3.c();
                    postFragment.w0 = i03.a;
                }
                break;
            case 3:
                if (!this.t0) {
                    this.t0 = true;
                    ni9 ni9Var = (ni9) c();
                    PostPageFragment2 postPageFragment2 = (PostPageFragment2) this;
                    fo2 fo2Var4 = (fo2) ni9Var;
                    fo2Var4.getClass();
                    postPageFragment2.m0 = true;
                    ko2 ko2Var4 = fo2Var4.b;
                    postPageFragment2.n0 = ko2Var4.s();
                    postPageFragment2.u0 = ko2Var4.c();
                    postPageFragment2.v0 = i03.a;
                }
                break;
            case 4:
                if (!this.t0) {
                    this.t0 = true;
                    bp9 bp9Var = (bp9) c();
                    PostStatsFragment postStatsFragment = (PostStatsFragment) this;
                    fo2 fo2Var5 = (fo2) bp9Var;
                    fo2Var5.getClass();
                    postStatsFragment.m0 = true;
                    ko2 ko2Var5 = fo2Var5.b;
                    postStatsFragment.n0 = ko2Var5.s();
                    postStatsFragment.u0 = i03.a;
                }
                break;
            case 5:
                if (!this.t0) {
                    this.t0 = true;
                    f1a f1aVar = (f1a) c();
                    PrivacyFragment privacyFragment = (PrivacyFragment) this;
                    fo2 fo2Var6 = (fo2) f1aVar;
                    fo2Var6.getClass();
                    privacyFragment.m0 = true;
                    ko2 ko2Var6 = fo2Var6.b;
                    privacyFragment.n0 = ko2Var6.s();
                }
                break;
            case 6:
                if (!this.t0) {
                    this.t0 = true;
                    z8a z8aVar = (z8a) c();
                    PubStatsFragment pubStatsFragment = (PubStatsFragment) this;
                    fo2 fo2Var7 = (fo2) z8aVar;
                    fo2Var7.getClass();
                    pubStatsFragment.m0 = true;
                    ko2 ko2Var7 = fo2Var7.b;
                    pubStatsFragment.n0 = ko2Var7.s();
                    pubStatsFragment.u0 = i03.a;
                }
                break;
            case 7:
                if (!this.t0) {
                    this.t0 = true;
                    eba ebaVar = (eba) c();
                    PublicationArchiveFragment publicationArchiveFragment = (PublicationArchiveFragment) this;
                    fo2 fo2Var8 = (fo2) ebaVar;
                    fo2Var8.getClass();
                    publicationArchiveFragment.m0 = true;
                    ko2 ko2Var8 = fo2Var8.b;
                    publicationArchiveFragment.n0 = ko2Var8.s();
                }
                break;
            case 8:
                if (!this.t0) {
                    this.t0 = true;
                    pca pcaVar = (pca) c();
                    PublicationEditorsFragment publicationEditorsFragment = (PublicationEditorsFragment) this;
                    fo2 fo2Var9 = (fo2) pcaVar;
                    fo2Var9.getClass();
                    publicationEditorsFragment.m0 = true;
                    ko2 ko2Var9 = fo2Var9.b;
                    publicationEditorsFragment.n0 = ko2Var9.s();
                }
                break;
            case 9:
                if (!this.t0) {
                    this.t0 = true;
                    nda ndaVar = (nda) c();
                    PublicationFlowFragment publicationFlowFragment = (PublicationFlowFragment) this;
                    fo2 fo2Var10 = (fo2) ndaVar;
                    fo2Var10.getClass();
                    publicationFlowFragment.m0 = true;
                    ko2 ko2Var10 = fo2Var10.b;
                    publicationFlowFragment.n0 = ko2Var10.s();
                    publicationFlowFragment.u0 = i03.a;
                }
                break;
            case 10:
                if (!this.t0) {
                    this.t0 = true;
                    iha ihaVar = (iha) c();
                    PublicationFollowersFragment publicationFollowersFragment = (PublicationFollowersFragment) this;
                    fo2 fo2Var11 = (fo2) ihaVar;
                    fo2Var11.getClass();
                    publicationFollowersFragment.m0 = true;
                    ko2 ko2Var11 = fo2Var11.b;
                    publicationFollowersFragment.n0 = ko2Var11.s();
                }
                break;
            case 11:
                if (!this.t0) {
                    this.t0 = true;
                    lia liaVar = (lia) c();
                    PublicationFragment publicationFragment = (PublicationFragment) this;
                    fo2 fo2Var12 = (fo2) liaVar;
                    fo2Var12.getClass();
                    publicationFragment.m0 = true;
                    ko2 ko2Var12 = fo2Var12.b;
                    publicationFragment.n0 = ko2Var12.s();
                    publicationFragment.v0 = ko2Var12.c();
                }
                break;
            case 12:
                if (!this.t0) {
                    this.t0 = true;
                    pna pnaVar = (pna) c();
                    PublicationWritersFragment publicationWritersFragment = (PublicationWritersFragment) this;
                    fo2 fo2Var13 = (fo2) pnaVar;
                    fo2Var13.getClass();
                    publicationWritersFragment.m0 = true;
                    ko2 ko2Var13 = fo2Var13.b;
                    publicationWritersFragment.n0 = ko2Var13.s();
                }
                break;
            case 13:
                if (!this.t0) {
                    this.t0 = true;
                    aqa aqaVar = (aqa) c();
                    PushNotificationSettingsFragment pushNotificationSettingsFragment = (PushNotificationSettingsFragment) this;
                    fo2 fo2Var14 = (fo2) aqaVar;
                    fo2Var14.getClass();
                    pushNotificationSettingsFragment.m0 = true;
                    ko2 ko2Var14 = fo2Var14.b;
                    pushNotificationSettingsFragment.n0 = ko2Var14.s();
                }
                break;
            case 14:
                if (!this.t0) {
                    this.t0 = true;
                    vza vzaVar = (vza) c();
                    RefineRecommendationsFragment refineRecommendationsFragment = (RefineRecommendationsFragment) this;
                    fo2 fo2Var15 = (fo2) vzaVar;
                    fo2Var15.getClass();
                    refineRecommendationsFragment.m0 = true;
                    ko2 ko2Var15 = fo2Var15.b;
                    refineRecommendationsFragment.n0 = ko2Var15.s();
                }
                break;
            case 15:
                if (!this.t0) {
                    this.t0 = true;
                    iab iabVar = (iab) c();
                    RepostersFragment repostersFragment = (RepostersFragment) this;
                    fo2 fo2Var16 = (fo2) iabVar;
                    fo2Var16.getClass();
                    repostersFragment.m0 = true;
                    ko2 ko2Var16 = fo2Var16.b;
                    repostersFragment.n0 = ko2Var16.s();
                    repostersFragment.u0 = i03.a;
                    repostersFragment.v0 = ko2Var16.c();
                }
                break;
            case 16:
                if (!this.t0) {
                    this.t0 = true;
                    ufb ufbVar = (ufb) c();
                    ResponsesFragment responsesFragment = (ResponsesFragment) this;
                    fo2 fo2Var17 = (fo2) ufbVar;
                    fo2Var17.getClass();
                    responsesFragment.m0 = true;
                    ko2 ko2Var17 = fo2Var17.b;
                    responsesFragment.n0 = ko2Var17.s();
                    responsesFragment.u0 = ko2Var17.c();
                    responsesFragment.v0 = i03.a;
                }
                break;
            case 17:
                if (!this.t0) {
                    this.t0 = true;
                    itb itbVar = (itb) c();
                    SearchFragment searchFragment = (SearchFragment) this;
                    fo2 fo2Var18 = (fo2) itbVar;
                    fo2Var18.getClass();
                    searchFragment.m0 = true;
                    ko2 ko2Var18 = fo2Var18.b;
                    searchFragment.n0 = ko2Var18.s();
                }
                break;
            case 18:
                if (!this.t0) {
                    this.t0 = true;
                    e2c e2cVar = (e2c) c();
                    SettingsFragment settingsFragment = (SettingsFragment) this;
                    fo2 fo2Var19 = (fo2) e2cVar;
                    fo2Var19.getClass();
                    settingsFragment.m0 = true;
                    ko2 ko2Var19 = fo2Var19.b;
                    settingsFragment.n0 = ko2Var19.s();
                    settingsFragment.u0 = i03.a;
                    settingsFragment.v0 = ko2Var19.c();
                    f8a f8aVar = fo2Var19.c.e;
                    if (f8aVar instanceof yi3) {
                        yi3Var = (yi3) f8aVar;
                    } else {
                        f8aVar.getClass();
                        yi3Var = new yi3(f8aVar);
                    }
                    settingsFragment.w0 = yi3Var;
                    settingsFragment.x0 = d46.R("public_profile", "email");
                }
                break;
            case 19:
                if (!this.t0) {
                    this.t0 = true;
                    w9c w9cVar = (w9c) c();
                    SignInFragment signInFragment = (SignInFragment) this;
                    fo2 fo2Var20 = (fo2) w9cVar;
                    fo2Var20.getClass();
                    signInFragment.m0 = true;
                    ko2 ko2Var20 = fo2Var20.b;
                    signInFragment.n0 = ko2Var20.s();
                    signInFragment.u0 = fo2Var20.c.c();
                }
                break;
            case 20:
                if (!this.t0) {
                    this.t0 = true;
                    yac yacVar = (yac) c();
                    SignUpFragment signUpFragment = (SignUpFragment) this;
                    fo2 fo2Var21 = (fo2) yacVar;
                    fo2Var21.getClass();
                    signUpFragment.m0 = true;
                    ko2 ko2Var21 = fo2Var21.b;
                    signUpFragment.n0 = ko2Var21.s();
                    i03 i03Var = i03.a;
                    signUpFragment.u0 = fo2Var21.c.c();
                }
                break;
            case 21:
                if (!this.t0) {
                    this.t0 = true;
                    mmc mmcVar = (mmc) c();
                    StageBranchFragment stageBranchFragment = (StageBranchFragment) this;
                    fo2 fo2Var22 = (fo2) mmcVar;
                    fo2Var22.getClass();
                    stageBranchFragment.m0 = true;
                    ko2 ko2Var22 = fo2Var22.b;
                    stageBranchFragment.n0 = ko2Var22.s();
                }
                break;
            case 22:
                if (!this.t0) {
                    this.t0 = true;
                    foc focVar = (foc) c();
                    StarterPackDetailFragment starterPackDetailFragment = (StarterPackDetailFragment) this;
                    fo2 fo2Var23 = (fo2) focVar;
                    fo2Var23.getClass();
                    starterPackDetailFragment.m0 = true;
                    ko2 ko2Var23 = fo2Var23.b;
                    starterPackDetailFragment.n0 = ko2Var23.s();
                    starterPackDetailFragment.u0 = (ks8) fo2Var23.D.get();
                }
                break;
            case 23:
                if (!this.t0) {
                    this.t0 = true;
                    xoc xocVar = (xoc) c();
                    StarterPacksFragment starterPacksFragment = (StarterPacksFragment) this;
                    fo2 fo2Var24 = (fo2) xocVar;
                    fo2Var24.getClass();
                    starterPacksFragment.m0 = true;
                    ko2 ko2Var24 = fo2Var24.b;
                    starterPacksFragment.n0 = ko2Var24.s();
                    starterPacksFragment.u0 = (ks8) fo2Var24.D.get();
                }
                break;
            case 24:
                if (!this.t0) {
                    this.t0 = true;
                    bxc bxcVar = (bxc) c();
                    SubscribersListFragment subscribersListFragment = (SubscribersListFragment) this;
                    fo2 fo2Var25 = (fo2) bxcVar;
                    fo2Var25.getClass();
                    subscribersListFragment.m0 = true;
                    ko2 ko2Var25 = fo2Var25.b;
                    subscribersListFragment.n0 = ko2Var25.s();
                }
                break;
            case 25:
                if (!this.t0) {
                    this.t0 = true;
                    c4d c4dVar = (c4d) c();
                    SusiWelcomeFragment susiWelcomeFragment = (SusiWelcomeFragment) this;
                    fo2 fo2Var26 = (fo2) c4dVar;
                    fo2Var26.getClass();
                    susiWelcomeFragment.m0 = true;
                    ko2 ko2Var26 = fo2Var26.b;
                    susiWelcomeFragment.n0 = ko2Var26.s();
                    susiWelcomeFragment.u0 = fo2Var26.c.c();
                }
                break;
            case 26:
                if (!this.t0) {
                    this.t0 = true;
                    g8d g8dVar = (g8d) c();
                    TagDirectoryFragment tagDirectoryFragment = (TagDirectoryFragment) this;
                    fo2 fo2Var27 = (fo2) g8dVar;
                    fo2Var27.getClass();
                    tagDirectoryFragment.m0 = true;
                    ko2 ko2Var27 = fo2Var27.b;
                    tagDirectoryFragment.n0 = ko2Var27.s();
                }
                break;
            case 27:
                if (!this.t0) {
                    this.t0 = true;
                    v8d v8dVar = (v8d) c();
                    TagFragment tagFragment = (TagFragment) this;
                    fo2 fo2Var28 = (fo2) v8dVar;
                    fo2Var28.getClass();
                    tagFragment.m0 = true;
                    ko2 ko2Var28 = fo2Var28.b;
                    tagFragment.n0 = ko2Var28.s();
                }
                break;
            case 28:
                if (!this.t0) {
                    this.t0 = true;
                    p9d p9dVar = (p9d) c();
                    TagRecommendedPostsFragment tagRecommendedPostsFragment = (TagRecommendedPostsFragment) this;
                    fo2 fo2Var29 = (fo2) p9dVar;
                    fo2Var29.getClass();
                    tagRecommendedPostsFragment.m0 = true;
                    ko2 ko2Var29 = fo2Var29.b;
                    tagRecommendedPostsFragment.n0 = ko2Var29.s();
                }
                break;
            default:
                if (!this.t0) {
                    this.t0 = true;
                    vdd vddVar = (vdd) c();
                    TagWhoToFollowFragment tagWhoToFollowFragment = (TagWhoToFollowFragment) this;
                    fo2 fo2Var30 = (fo2) vddVar;
                    fo2Var30.getClass();
                    tagWhoToFollowFragment.m0 = true;
                    ko2 ko2Var30 = fo2Var30.b;
                    tagWhoToFollowFragment.n0 = ko2Var30.s();
                }
                break;
        }
    }

    @Override // defpackage.j15
    public final Context i() {
        switch (this.o0) {
            case 0:
                if (super.i() != null || this.q0) {
                    G0();
                }
                break;
            case 1:
                if (super.i() != null || this.q0) {
                    J0();
                }
                break;
            case 2:
                if (super.i() != null || this.q0) {
                    D0();
                }
                break;
            case 3:
                if (super.i() != null || this.q0) {
                    E0();
                }
                break;
            case 4:
                if (super.i() != null || this.q0) {
                    e1();
                }
                break;
            case 5:
                if (super.i() != null || this.q0) {
                    V0();
                }
                break;
            case 6:
                if (super.i() != null || this.q0) {
                    f1();
                }
                break;
            case 7:
                if (super.i() != null || this.q0) {
                    L0();
                }
                break;
            case 8:
                if (super.i() != null || this.q0) {
                    M0();
                }
                break;
            case 9:
                if (super.i() != null || this.q0) {
                    K0();
                }
                break;
            case 10:
                if (super.i() != null || this.q0) {
                    F0();
                }
                break;
            case 11:
                if (super.i() != null || this.q0) {
                    O0();
                }
                break;
            case 12:
                if (super.i() != null || this.q0) {
                    P0();
                }
                break;
            case 13:
                if (super.i() != null || this.q0) {
                    Q0();
                }
                break;
            case 14:
                if (super.i() != null || this.q0) {
                    d1();
                }
                break;
            case 15:
                if (super.i() != null || this.q0) {
                    R0();
                }
                break;
            case 16:
                if (super.i() != null || this.q0) {
                    S0();
                }
                break;
            case 17:
                if (super.i() != null || this.q0) {
                    T0();
                }
                break;
            case 18:
                if (super.i() != null || this.q0) {
                    U0();
                }
                break;
            case 19:
                if (super.i() != null || this.q0) {
                    W0();
                }
                break;
            case 20:
                if (super.i() != null || this.q0) {
                    X0();
                }
                break;
            case 21:
                if (super.i() != null || this.q0) {
                    N0();
                }
                break;
            case 22:
                if (super.i() != null || this.q0) {
                    H0();
                }
                break;
            case 23:
                if (super.i() != null || this.q0) {
                    I0();
                }
                break;
            case 24:
                if (super.i() != null || this.q0) {
                    g1();
                }
                break;
            case 25:
                if (super.i() != null || this.q0) {
                    Y0();
                }
                break;
            case 26:
                if (super.i() != null || this.q0) {
                    a1();
                }
                break;
            case 27:
                if (super.i() != null || this.q0) {
                    b1();
                }
                break;
            case 28:
                if (super.i() != null || this.q0) {
                    Z0();
                }
                break;
            default:
                if (super.i() != null || this.q0) {
                    c1();
                }
                break;
        }
        return this.p0;
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
                G0();
                h1();
                break;
            case 1:
                this.E = true;
                vte vteVar2 = this.p0;
                if (vteVar2 != null && u60.d(vteVar2) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                J0();
                h1();
                break;
            case 2:
                this.E = true;
                vte vteVar3 = this.p0;
                if (vteVar3 != null && u60.d(vteVar3) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                D0();
                h1();
                break;
            case 3:
                this.E = true;
                vte vteVar4 = this.p0;
                if (vteVar4 != null && u60.d(vteVar4) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                E0();
                h1();
                break;
            case 4:
                this.E = true;
                vte vteVar5 = this.p0;
                if (vteVar5 != null && u60.d(vteVar5) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                e1();
                h1();
                break;
            case 5:
                this.E = true;
                vte vteVar6 = this.p0;
                if (vteVar6 != null && u60.d(vteVar6) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                V0();
                h1();
                break;
            case 6:
                this.E = true;
                vte vteVar7 = this.p0;
                if (vteVar7 != null && u60.d(vteVar7) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                f1();
                h1();
                break;
            case 7:
                this.E = true;
                vte vteVar8 = this.p0;
                if (vteVar8 != null && u60.d(vteVar8) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                L0();
                h1();
                break;
            case 8:
                this.E = true;
                vte vteVar9 = this.p0;
                if (vteVar9 != null && u60.d(vteVar9) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                M0();
                h1();
                break;
            case 9:
                this.E = true;
                vte vteVar10 = this.p0;
                if (vteVar10 != null && u60.d(vteVar10) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                K0();
                h1();
                break;
            case 10:
                this.E = true;
                vte vteVar11 = this.p0;
                if (vteVar11 != null && u60.d(vteVar11) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                F0();
                h1();
                break;
            case 11:
                this.E = true;
                vte vteVar12 = this.p0;
                if (vteVar12 != null && u60.d(vteVar12) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                O0();
                h1();
                break;
            case 12:
                this.E = true;
                vte vteVar13 = this.p0;
                if (vteVar13 != null && u60.d(vteVar13) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                P0();
                h1();
                break;
            case 13:
                this.E = true;
                vte vteVar14 = this.p0;
                if (vteVar14 != null && u60.d(vteVar14) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                Q0();
                h1();
                break;
            case 14:
                this.E = true;
                vte vteVar15 = this.p0;
                if (vteVar15 != null && u60.d(vteVar15) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                d1();
                h1();
                break;
            case 15:
                this.E = true;
                vte vteVar16 = this.p0;
                if (vteVar16 != null && u60.d(vteVar16) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                R0();
                h1();
                break;
            case 16:
                this.E = true;
                vte vteVar17 = this.p0;
                if (vteVar17 != null && u60.d(vteVar17) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                S0();
                h1();
                break;
            case 17:
                this.E = true;
                vte vteVar18 = this.p0;
                if (vteVar18 != null && u60.d(vteVar18) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                T0();
                h1();
                break;
            case 18:
                this.E = true;
                vte vteVar19 = this.p0;
                if (vteVar19 != null && u60.d(vteVar19) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                U0();
                h1();
                break;
            case 19:
                this.E = true;
                vte vteVar20 = this.p0;
                if (vteVar20 != null && u60.d(vteVar20) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                W0();
                h1();
                break;
            case 20:
                this.E = true;
                vte vteVar21 = this.p0;
                if (vteVar21 != null && u60.d(vteVar21) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                X0();
                h1();
                break;
            case 21:
                this.E = true;
                vte vteVar22 = this.p0;
                if (vteVar22 != null && u60.d(vteVar22) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                N0();
                h1();
                break;
            case 22:
                this.E = true;
                vte vteVar23 = this.p0;
                if (vteVar23 != null && u60.d(vteVar23) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                H0();
                h1();
                break;
            case 23:
                this.E = true;
                vte vteVar24 = this.p0;
                if (vteVar24 != null && u60.d(vteVar24) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                I0();
                h1();
                break;
            case 24:
                this.E = true;
                vte vteVar25 = this.p0;
                if (vteVar25 != null && u60.d(vteVar25) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                g1();
                h1();
                break;
            case 25:
                this.E = true;
                vte vteVar26 = this.p0;
                if (vteVar26 != null && u60.d(vteVar26) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                Y0();
                h1();
                break;
            case 26:
                this.E = true;
                vte vteVar27 = this.p0;
                if (vteVar27 != null && u60.d(vteVar27) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                a1();
                h1();
                break;
            case 27:
                this.E = true;
                vte vteVar28 = this.p0;
                if (vteVar28 != null && u60.d(vteVar28) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                b1();
                h1();
                break;
            case 28:
                this.E = true;
                vte vteVar29 = this.p0;
                if (vteVar29 != null && u60.d(vteVar29) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                Z0();
                h1();
                break;
            default:
                this.E = true;
                vte vteVar30 = this.p0;
                if (vteVar30 != null && u60.d(vteVar30) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                c1();
                h1();
                break;
        }
    }

    @Override // defpackage.j15
    public final void z(Context context) {
        switch (this.o0) {
            case 0:
                super.z(context);
                G0();
                h1();
                break;
            case 1:
                super.z(context);
                J0();
                h1();
                break;
            case 2:
                super.z(context);
                D0();
                h1();
                break;
            case 3:
                super.z(context);
                E0();
                h1();
                break;
            case 4:
                super.z(context);
                e1();
                h1();
                break;
            case 5:
                super.z(context);
                V0();
                h1();
                break;
            case 6:
                super.z(context);
                f1();
                h1();
                break;
            case 7:
                super.z(context);
                L0();
                h1();
                break;
            case 8:
                super.z(context);
                M0();
                h1();
                break;
            case 9:
                super.z(context);
                K0();
                h1();
                break;
            case 10:
                super.z(context);
                F0();
                h1();
                break;
            case 11:
                super.z(context);
                O0();
                h1();
                break;
            case 12:
                super.z(context);
                P0();
                h1();
                break;
            case 13:
                super.z(context);
                Q0();
                h1();
                break;
            case 14:
                super.z(context);
                d1();
                h1();
                break;
            case 15:
                super.z(context);
                R0();
                h1();
                break;
            case 16:
                super.z(context);
                S0();
                h1();
                break;
            case 17:
                super.z(context);
                T0();
                h1();
                break;
            case 18:
                super.z(context);
                U0();
                h1();
                break;
            case 19:
                super.z(context);
                W0();
                h1();
                break;
            case 20:
                super.z(context);
                X0();
                h1();
                break;
            case 21:
                super.z(context);
                N0();
                h1();
                break;
            case 22:
                super.z(context);
                H0();
                h1();
                break;
            case 23:
                super.z(context);
                I0();
                h1();
                break;
            case 24:
                super.z(context);
                g1();
                h1();
                break;
            case 25:
                super.z(context);
                Y0();
                h1();
                break;
            case 26:
                super.z(context);
                a1();
                h1();
                break;
            case 27:
                super.z(context);
                b1();
                h1();
                break;
            case 28:
                super.z(context);
                Z0();
                h1();
                break;
            default:
                super.z(context);
                c1();
                h1();
                break;
        }
    }
}
