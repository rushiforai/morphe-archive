package defpackage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import com.medium.android.addressbook.ui.findfriends.FindFriendsFragment;
import com.medium.android.admin.admininternalstatus.AdminInternalStatusFragment;
import com.medium.android.admin.admintools.AdminToolsFragment;
import com.medium.android.admin.flags.FlagsFragment;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.digest.ui.settings.DigestSettingsFragment;
import com.medium.android.donkey.read.web.ExternalWebViewFragment;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.explore.ui.ExploreFragment;
import com.medium.android.followers.FollowersFragment;
import com.medium.android.following.FollowingFragment;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.notifications.NotificationsFragment;
import com.medium.android.profile.ui.edit.EditProfileFragment;
import com.medium.android.publicationadmin.ui.featuredposts.FeaturedPostsFragment;
import com.medium.android.settings.downloadedcontent.DownloadedContentFragment;
import com.medium.android.settings.ui.customappicon.CustomAppIconFragment;
import com.medium.android.settings.ui.discoverability.DiscoverabilityFragment;
import com.medium.android.susi.ui.addInfo.AddInfoFragment;
import com.medium.android.susi.ui.auth.AuthFragment;
import com.medium.android.susi.ui.magicLinkConfirmation.MagicLinkConfirmationFragment;
import com.medium.refinerecommendations.following.seeall.collections.AllFollowedCollectionsFragment;
import com.medium.refinerecommendations.following.seeall.tags.AllFollowedTagsFragment;
import com.medium.refinerecommendations.following.seeall.writers.AllFollowedWritersFragment;
import com.medium.refinerecommendations.muted.seeall.collections.AllMutedCollectionsFragment;
import com.medium.refinerecommendations.muted.seeall.writers.AllMutedWritersFragment;
import com.medium.refinerecommendations.suggestions.seeall.friends.AllSuggestionsFriendsFragment;
import com.medium.refinerecommendations.suggestions.seeall.publications.AllSuggestionsPublicationsFragment;
import com.medium.refinerecommendations.suggestions.seeall.tags.AllSuggestedTagsFragment;
import com.medium.refinerecommendations.suggestions.seeall.writers.AllSuggestedWritersFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class km5 extends AbstractMediumFragment implements b75 {
    public final /* synthetic */ int o0;
    public vte p0;
    public boolean q0;
    public volatile u60 r0;
    public final Object s0;
    public boolean t0;

    public km5(int i) {
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
        switch (this.o0) {
            case 0:
                if (!this.t0) {
                    this.t0 = true;
                    n8 n8Var = (n8) c();
                    AddInfoFragment addInfoFragment = (AddInfoFragment) this;
                    fo2 fo2Var = (fo2) n8Var;
                    fo2Var.getClass();
                    addInfoFragment.m0 = true;
                    ko2 ko2Var = fo2Var.b;
                    addInfoFragment.n0 = ko2Var.s();
                    addInfoFragment.u0 = i03.a;
                }
                break;
            case 1:
                if (!this.t0) {
                    this.t0 = true;
                    lb lbVar = (lb) c();
                    AdminInternalStatusFragment adminInternalStatusFragment = (AdminInternalStatusFragment) this;
                    fo2 fo2Var2 = (fo2) lbVar;
                    fo2Var2.getClass();
                    adminInternalStatusFragment.m0 = true;
                    ko2 ko2Var2 = fo2Var2.b;
                    adminInternalStatusFragment.n0 = ko2Var2.s();
                    adminInternalStatusFragment.u0 = i03.a;
                }
                break;
            case 2:
                if (!this.t0) {
                    this.t0 = true;
                    yb ybVar = (yb) c();
                    AdminToolsFragment adminToolsFragment = (AdminToolsFragment) this;
                    fo2 fo2Var3 = (fo2) ybVar;
                    fo2Var3.getClass();
                    adminToolsFragment.m0 = true;
                    ko2 ko2Var3 = fo2Var3.b;
                    adminToolsFragment.n0 = ko2Var3.s();
                    adminToolsFragment.u0 = new jzb();
                }
                break;
            case 3:
                if (!this.t0) {
                    this.t0 = true;
                    le leVar = (le) c();
                    AllFollowedCollectionsFragment allFollowedCollectionsFragment = (AllFollowedCollectionsFragment) this;
                    fo2 fo2Var4 = (fo2) leVar;
                    fo2Var4.getClass();
                    allFollowedCollectionsFragment.m0 = true;
                    ko2 ko2Var4 = fo2Var4.b;
                    allFollowedCollectionsFragment.n0 = ko2Var4.s();
                }
                break;
            case 4:
                if (!this.t0) {
                    this.t0 = true;
                    af afVar = (af) c();
                    AllFollowedTagsFragment allFollowedTagsFragment = (AllFollowedTagsFragment) this;
                    fo2 fo2Var5 = (fo2) afVar;
                    fo2Var5.getClass();
                    allFollowedTagsFragment.m0 = true;
                    ko2 ko2Var5 = fo2Var5.b;
                    allFollowedTagsFragment.n0 = ko2Var5.s();
                }
                break;
            case 5:
                if (!this.t0) {
                    this.t0 = true;
                    rf rfVar = (rf) c();
                    AllFollowedWritersFragment allFollowedWritersFragment = (AllFollowedWritersFragment) this;
                    fo2 fo2Var6 = (fo2) rfVar;
                    fo2Var6.getClass();
                    allFollowedWritersFragment.m0 = true;
                    ko2 ko2Var6 = fo2Var6.b;
                    allFollowedWritersFragment.n0 = ko2Var6.s();
                }
                break;
            case 6:
                if (!this.t0) {
                    this.t0 = true;
                    gg ggVar = (gg) c();
                    AllMutedCollectionsFragment allMutedCollectionsFragment = (AllMutedCollectionsFragment) this;
                    fo2 fo2Var7 = (fo2) ggVar;
                    fo2Var7.getClass();
                    allMutedCollectionsFragment.m0 = true;
                    ko2 ko2Var7 = fo2Var7.b;
                    allMutedCollectionsFragment.n0 = ko2Var7.s();
                }
                break;
            case 7:
                if (!this.t0) {
                    this.t0 = true;
                    vg vgVar = (vg) c();
                    AllMutedWritersFragment allMutedWritersFragment = (AllMutedWritersFragment) this;
                    fo2 fo2Var8 = (fo2) vgVar;
                    fo2Var8.getClass();
                    allMutedWritersFragment.m0 = true;
                    ko2 ko2Var8 = fo2Var8.b;
                    allMutedWritersFragment.n0 = ko2Var8.s();
                }
                break;
            case 8:
                if (!this.t0) {
                    this.t0 = true;
                    ih ihVar = (ih) c();
                    AllSuggestedTagsFragment allSuggestedTagsFragment = (AllSuggestedTagsFragment) this;
                    fo2 fo2Var9 = (fo2) ihVar;
                    fo2Var9.getClass();
                    allSuggestedTagsFragment.m0 = true;
                    ko2 ko2Var9 = fo2Var9.b;
                    allSuggestedTagsFragment.n0 = ko2Var9.s();
                }
                break;
            case 9:
                if (!this.t0) {
                    this.t0 = true;
                    kh khVar = (kh) c();
                    AllSuggestedWritersFragment allSuggestedWritersFragment = (AllSuggestedWritersFragment) this;
                    fo2 fo2Var10 = (fo2) khVar;
                    fo2Var10.getClass();
                    allSuggestedWritersFragment.m0 = true;
                    ko2 ko2Var10 = fo2Var10.b;
                    allSuggestedWritersFragment.n0 = ko2Var10.s();
                }
                break;
            case 10:
                if (!this.t0) {
                    this.t0 = true;
                    mh mhVar = (mh) c();
                    AllSuggestionsFriendsFragment allSuggestionsFriendsFragment = (AllSuggestionsFriendsFragment) this;
                    fo2 fo2Var11 = (fo2) mhVar;
                    fo2Var11.getClass();
                    allSuggestionsFriendsFragment.m0 = true;
                    ko2 ko2Var11 = fo2Var11.b;
                    allSuggestionsFriendsFragment.n0 = ko2Var11.s();
                }
                break;
            case 11:
                if (!this.t0) {
                    this.t0 = true;
                    ei eiVar = (ei) c();
                    AllSuggestionsPublicationsFragment allSuggestionsPublicationsFragment = (AllSuggestionsPublicationsFragment) this;
                    fo2 fo2Var12 = (fo2) eiVar;
                    fo2Var12.getClass();
                    allSuggestionsPublicationsFragment.m0 = true;
                    ko2 ko2Var12 = fo2Var12.b;
                    allSuggestionsPublicationsFragment.n0 = ko2Var12.s();
                }
                break;
            case 12:
                if (!this.t0) {
                    this.t0 = true;
                    bc0 bc0Var = (bc0) c();
                    AuthFragment authFragment = (AuthFragment) this;
                    fo2 fo2Var13 = (fo2) bc0Var;
                    fo2Var13.getClass();
                    authFragment.m0 = true;
                    ko2 ko2Var13 = fo2Var13.b;
                    authFragment.n0 = ko2Var13.s();
                    authFragment.u0 = "216296035834-k1k6qe060s2tp2a2jam4ljdcms00sttg.apps.googleusercontent.com";
                    authFragment.v0 = d46.R("public_profile", "email");
                    xm2 xm2Var = fo2Var13.c;
                    authFragment.w0 = (o41) xm2Var.e.get();
                    authFragment.x0 = aa7.e.t();
                    authFragment.y0 = ko2Var13.c();
                    authFragment.z0 = i03.a;
                    authFragment.A0 = xm2Var.c();
                }
                break;
            case 13:
                if (!this.t0) {
                    this.t0 = true;
                    x81 x81Var = (x81) c();
                    CatalogDetailFragment catalogDetailFragment = (CatalogDetailFragment) this;
                    fo2 fo2Var14 = (fo2) x81Var;
                    fo2Var14.getClass();
                    catalogDetailFragment.m0 = true;
                    ko2 ko2Var14 = fo2Var14.b;
                    catalogDetailFragment.n0 = ko2Var14.s();
                }
                break;
            case 14:
                if (!this.t0) {
                    this.t0 = true;
                    kl2 kl2Var = (kl2) c();
                    CustomAppIconFragment customAppIconFragment = (CustomAppIconFragment) this;
                    fo2 fo2Var15 = (fo2) kl2Var;
                    fo2Var15.getClass();
                    customAppIconFragment.m0 = true;
                    ko2 ko2Var15 = fo2Var15.b;
                    customAppIconFragment.n0 = ko2Var15.s();
                }
                break;
            case 15:
                if (!this.t0) {
                    this.t0 = true;
                    td3 td3Var = (td3) c();
                    DigestSettingsFragment digestSettingsFragment = (DigestSettingsFragment) this;
                    fo2 fo2Var16 = (fo2) td3Var;
                    fo2Var16.getClass();
                    digestSettingsFragment.m0 = true;
                    ko2 ko2Var16 = fo2Var16.b;
                    digestSettingsFragment.n0 = ko2Var16.s();
                    digestSettingsFragment.u0 = i03.a;
                }
                break;
            case 16:
                if (!this.t0) {
                    this.t0 = true;
                    jf3 jf3Var = (jf3) c();
                    DiscoverabilityFragment discoverabilityFragment = (DiscoverabilityFragment) this;
                    fo2 fo2Var17 = (fo2) jf3Var;
                    fo2Var17.getClass();
                    discoverabilityFragment.m0 = true;
                    ko2 ko2Var17 = fo2Var17.b;
                    discoverabilityFragment.n0 = ko2Var17.s();
                }
                break;
            case 17:
                if (!this.t0) {
                    this.t0 = true;
                    qj3 qj3Var = (qj3) c();
                    DownloadedContentFragment downloadedContentFragment = (DownloadedContentFragment) this;
                    fo2 fo2Var18 = (fo2) qj3Var;
                    fo2Var18.getClass();
                    downloadedContentFragment.m0 = true;
                    ko2 ko2Var18 = fo2Var18.b;
                    downloadedContentFragment.n0 = ko2Var18.s();
                    downloadedContentFragment.v0 = (un2) fo2Var18.G.get();
                }
                break;
            case 18:
                if (!this.t0) {
                    this.t0 = true;
                    lq3 lq3Var = (lq3) c();
                    EditPostFragment editPostFragment = (EditPostFragment) this;
                    fo2 fo2Var19 = (fo2) lq3Var;
                    fo2Var19.getClass();
                    editPostFragment.m0 = true;
                    ko2 ko2Var19 = fo2Var19.b;
                    editPostFragment.n0 = ko2Var19.s();
                    editPostFragment.y0 = (cxd) ko2Var19.N.get();
                    editPostFragment.z0 = (zk2) ko2Var19.r.get();
                    editPostFragment.A0 = new eh3((pu7) ko2Var19.w.get());
                    editPostFragment.B0 = i03.a;
                    editPostFragment.C0 = (ex2) ko2Var19.J.get();
                    editPostFragment.D0 = new tg1(new ze1(new tz7(19)), (qi1) ko2Var19.t.get());
                }
                break;
            case 19:
                if (!this.t0) {
                    this.t0 = true;
                    lt3 lt3Var = (lt3) c();
                    EditProfileFragment editProfileFragment = (EditProfileFragment) this;
                    fo2 fo2Var20 = (fo2) lt3Var;
                    fo2Var20.getClass();
                    editProfileFragment.m0 = true;
                    ko2 ko2Var20 = fo2Var20.b;
                    editProfileFragment.n0 = ko2Var20.s();
                }
                break;
            case 20:
                if (!this.t0) {
                    this.t0 = true;
                    c64 c64Var = (c64) c();
                    ExploreFragment exploreFragment = (ExploreFragment) this;
                    fo2 fo2Var21 = (fo2) c64Var;
                    fo2Var21.getClass();
                    exploreFragment.m0 = true;
                    ko2 ko2Var21 = fo2Var21.b;
                    exploreFragment.n0 = ko2Var21.s();
                }
                break;
            case 21:
                if (!this.t0) {
                    this.t0 = true;
                    h84 h84Var = (h84) c();
                    ExternalWebViewFragment externalWebViewFragment = (ExternalWebViewFragment) this;
                    fo2 fo2Var22 = (fo2) h84Var;
                    fo2Var22.getClass();
                    externalWebViewFragment.m0 = true;
                    ko2 ko2Var22 = fo2Var22.b;
                    externalWebViewFragment.n0 = ko2Var22.s();
                    externalWebViewFragment.u0 = (zk2) ko2Var22.r.get();
                    externalWebViewFragment.v0 = ko2Var22.c();
                    externalWebViewFragment.w0 = i03.a;
                    externalWebViewFragment.x0 = "4.5.1784910415";
                }
                break;
            case 22:
                if (!this.t0) {
                    this.t0 = true;
                    vb4 vb4Var = (vb4) c();
                    FeaturedPostsFragment featuredPostsFragment = (FeaturedPostsFragment) this;
                    fo2 fo2Var23 = (fo2) vb4Var;
                    fo2Var23.getClass();
                    featuredPostsFragment.m0 = true;
                    ko2 ko2Var23 = fo2Var23.b;
                    featuredPostsFragment.n0 = ko2Var23.s();
                }
                break;
            case 23:
                if (!this.t0) {
                    this.t0 = true;
                    ci4 ci4Var = (ci4) c();
                    FindFriendsFragment findFriendsFragment = (FindFriendsFragment) this;
                    fo2 fo2Var24 = (fo2) ci4Var;
                    fo2Var24.getClass();
                    findFriendsFragment.m0 = true;
                    ko2 ko2Var24 = fo2Var24.b;
                    findFriendsFragment.n0 = ko2Var24.s();
                    findFriendsFragment.v0 = ko2Var24.c();
                    findFriendsFragment.w0 = i03.a;
                }
                break;
            case 24:
                if (!this.t0) {
                    this.t0 = true;
                    gm4 gm4Var = (gm4) c();
                    FlagsFragment flagsFragment = (FlagsFragment) this;
                    fo2 fo2Var25 = (fo2) gm4Var;
                    fo2Var25.getClass();
                    flagsFragment.m0 = true;
                    ko2 ko2Var25 = fo2Var25.b;
                    flagsFragment.n0 = ko2Var25.s();
                }
                break;
            case 25:
                if (!this.t0) {
                    this.t0 = true;
                    kw4 kw4Var = (kw4) c();
                    FollowersFragment followersFragment = (FollowersFragment) this;
                    fo2 fo2Var26 = (fo2) kw4Var;
                    fo2Var26.getClass();
                    followersFragment.m0 = true;
                    ko2 ko2Var26 = fo2Var26.b;
                    followersFragment.n0 = ko2Var26.s();
                }
                break;
            case 26:
                if (!this.t0) {
                    this.t0 = true;
                    cx4 cx4Var = (cx4) c();
                    FollowingFragment followingFragment = (FollowingFragment) this;
                    fo2 fo2Var27 = (fo2) cx4Var;
                    fo2Var27.getClass();
                    followingFragment.m0 = true;
                    ko2 ko2Var27 = fo2Var27.b;
                    followingFragment.n0 = ko2Var27.s();
                }
                break;
            case 27:
                if (!this.t0) {
                    this.t0 = true;
                    fq5 fq5Var = (fq5) c();
                    HomeFragment homeFragment = (HomeFragment) this;
                    fo2 fo2Var28 = (fo2) fq5Var;
                    fo2Var28.getClass();
                    homeFragment.m0 = true;
                    ko2 ko2Var28 = fo2Var28.b;
                    homeFragment.n0 = ko2Var28.s();
                    homeFragment.v0 = i03.a;
                    homeFragment.w0 = ko2Var28.c();
                }
                break;
            case 28:
                if (!this.t0) {
                    this.t0 = true;
                    id7 id7Var = (id7) c();
                    MagicLinkConfirmationFragment magicLinkConfirmationFragment = (MagicLinkConfirmationFragment) this;
                    fo2 fo2Var29 = (fo2) id7Var;
                    fo2Var29.getClass();
                    magicLinkConfirmationFragment.m0 = true;
                    ko2 ko2Var29 = fo2Var29.b;
                    magicLinkConfirmationFragment.n0 = ko2Var29.s();
                    magicLinkConfirmationFragment.u0 = fo2Var29.c.c();
                    magicLinkConfirmationFragment.v0 = ko2Var29.c();
                }
                break;
            default:
                if (!this.t0) {
                    this.t0 = true;
                    bk8 bk8Var = (bk8) c();
                    NotificationsFragment notificationsFragment = (NotificationsFragment) this;
                    fo2 fo2Var30 = (fo2) bk8Var;
                    fo2Var30.getClass();
                    notificationsFragment.m0 = true;
                    ko2 ko2Var30 = fo2Var30.b;
                    notificationsFragment.n0 = ko2Var30.s();
                }
                break;
        }
    }

    @Override // defpackage.j15
    public final Context i() {
        switch (this.o0) {
            case 0:
                if (super.i() != null || this.q0) {
                    U0();
                }
                break;
            case 1:
                if (super.i() != null || this.q0) {
                    E0();
                }
                break;
            case 2:
                if (super.i() != null || this.q0) {
                    H0();
                }
                break;
            case 3:
                if (super.i() != null || this.q0) {
                    X0();
                }
                break;
            case 4:
                if (super.i() != null || this.q0) {
                    Y0();
                }
                break;
            case 5:
                if (super.i() != null || this.q0) {
                    a1();
                }
                break;
            case 6:
                if (super.i() != null || this.q0) {
                    b1();
                }
                break;
            case 7:
                if (super.i() != null || this.q0) {
                    c1();
                }
                break;
            case 8:
                if (super.i() != null || this.q0) {
                    f1();
                }
                break;
            case 9:
                if (super.i() != null || this.q0) {
                    g1();
                }
                break;
            case 10:
                if (super.i() != null || this.q0) {
                    d1();
                }
                break;
            case 11:
                if (super.i() != null || this.q0) {
                    e1();
                }
                break;
            case 12:
                if (super.i() != null || this.q0) {
                    V0();
                }
                break;
            case 13:
                if (super.i() != null || this.q0) {
                    Z0();
                }
                break;
            case 14:
                if (super.i() != null || this.q0) {
                    S0();
                }
                break;
            case 15:
                if (super.i() != null || this.q0) {
                    F0();
                }
                break;
            case 16:
                if (super.i() != null || this.q0) {
                    T0();
                }
                break;
            case 17:
                if (super.i() != null || this.q0) {
                    R0();
                }
                break;
            case 18:
                if (super.i() != null || this.q0) {
                    I0();
                }
                break;
            case 19:
                if (super.i() != null || this.q0) {
                    P0();
                }
                break;
            case 20:
                if (super.i() != null || this.q0) {
                    J0();
                }
                break;
            case 21:
                if (super.i() != null || this.q0) {
                    G0();
                }
                break;
            case 22:
                if (super.i() != null || this.q0) {
                    Q0();
                }
                break;
            case 23:
                if (super.i() != null || this.q0) {
                    D0();
                }
                break;
            case 24:
                if (super.i() != null || this.q0) {
                    O0();
                }
                break;
            case 25:
                if (super.i() != null || this.q0) {
                    K0();
                }
                break;
            case 26:
                if (super.i() != null || this.q0) {
                    L0();
                }
                break;
            case 27:
                if (super.i() != null || this.q0) {
                    M0();
                }
                break;
            case 28:
                if (super.i() != null || this.q0) {
                    W0();
                }
                break;
            default:
                if (super.i() != null || this.q0) {
                    N0();
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
                U0();
                h1();
                break;
            case 1:
                this.E = true;
                vte vteVar2 = this.p0;
                if (vteVar2 != null && u60.d(vteVar2) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                E0();
                h1();
                break;
            case 2:
                this.E = true;
                vte vteVar3 = this.p0;
                if (vteVar3 != null && u60.d(vteVar3) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                H0();
                h1();
                break;
            case 3:
                this.E = true;
                vte vteVar4 = this.p0;
                if (vteVar4 != null && u60.d(vteVar4) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                X0();
                h1();
                break;
            case 4:
                this.E = true;
                vte vteVar5 = this.p0;
                if (vteVar5 != null && u60.d(vteVar5) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                Y0();
                h1();
                break;
            case 5:
                this.E = true;
                vte vteVar6 = this.p0;
                if (vteVar6 != null && u60.d(vteVar6) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                a1();
                h1();
                break;
            case 6:
                this.E = true;
                vte vteVar7 = this.p0;
                if (vteVar7 != null && u60.d(vteVar7) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                b1();
                h1();
                break;
            case 7:
                this.E = true;
                vte vteVar8 = this.p0;
                if (vteVar8 != null && u60.d(vteVar8) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                c1();
                h1();
                break;
            case 8:
                this.E = true;
                vte vteVar9 = this.p0;
                if (vteVar9 != null && u60.d(vteVar9) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                f1();
                h1();
                break;
            case 9:
                this.E = true;
                vte vteVar10 = this.p0;
                if (vteVar10 != null && u60.d(vteVar10) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                g1();
                h1();
                break;
            case 10:
                this.E = true;
                vte vteVar11 = this.p0;
                if (vteVar11 != null && u60.d(vteVar11) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                d1();
                h1();
                break;
            case 11:
                this.E = true;
                vte vteVar12 = this.p0;
                if (vteVar12 != null && u60.d(vteVar12) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                e1();
                h1();
                break;
            case 12:
                this.E = true;
                vte vteVar13 = this.p0;
                if (vteVar13 != null && u60.d(vteVar13) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                V0();
                h1();
                break;
            case 13:
                this.E = true;
                vte vteVar14 = this.p0;
                if (vteVar14 != null && u60.d(vteVar14) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                Z0();
                h1();
                break;
            case 14:
                this.E = true;
                vte vteVar15 = this.p0;
                if (vteVar15 != null && u60.d(vteVar15) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                S0();
                h1();
                break;
            case 15:
                this.E = true;
                vte vteVar16 = this.p0;
                if (vteVar16 != null && u60.d(vteVar16) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                F0();
                h1();
                break;
            case 16:
                this.E = true;
                vte vteVar17 = this.p0;
                if (vteVar17 != null && u60.d(vteVar17) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                T0();
                h1();
                break;
            case 17:
                this.E = true;
                vte vteVar18 = this.p0;
                if (vteVar18 != null && u60.d(vteVar18) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                R0();
                h1();
                break;
            case 18:
                this.E = true;
                vte vteVar19 = this.p0;
                if (vteVar19 != null && u60.d(vteVar19) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                I0();
                h1();
                break;
            case 19:
                this.E = true;
                vte vteVar20 = this.p0;
                if (vteVar20 != null && u60.d(vteVar20) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                P0();
                h1();
                break;
            case 20:
                this.E = true;
                vte vteVar21 = this.p0;
                if (vteVar21 != null && u60.d(vteVar21) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                J0();
                h1();
                break;
            case 21:
                this.E = true;
                vte vteVar22 = this.p0;
                if (vteVar22 != null && u60.d(vteVar22) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                G0();
                h1();
                break;
            case 22:
                this.E = true;
                vte vteVar23 = this.p0;
                if (vteVar23 != null && u60.d(vteVar23) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                Q0();
                h1();
                break;
            case 23:
                this.E = true;
                vte vteVar24 = this.p0;
                if (vteVar24 != null && u60.d(vteVar24) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                D0();
                h1();
                break;
            case 24:
                this.E = true;
                vte vteVar25 = this.p0;
                if (vteVar25 != null && u60.d(vteVar25) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                O0();
                h1();
                break;
            case 25:
                this.E = true;
                vte vteVar26 = this.p0;
                if (vteVar26 != null && u60.d(vteVar26) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                K0();
                h1();
                break;
            case 26:
                this.E = true;
                vte vteVar27 = this.p0;
                if (vteVar27 != null && u60.d(vteVar27) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                L0();
                h1();
                break;
            case 27:
                this.E = true;
                vte vteVar28 = this.p0;
                if (vteVar28 != null && u60.d(vteVar28) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                M0();
                h1();
                break;
            case 28:
                this.E = true;
                vte vteVar29 = this.p0;
                if (vteVar29 != null && u60.d(vteVar29) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                W0();
                h1();
                break;
            default:
                this.E = true;
                vte vteVar30 = this.p0;
                if (vteVar30 != null && u60.d(vteVar30) != activity) {
                    z = false;
                }
                gq7.l(z, "onAttach called multiple times with different Context! Hilt Fragments should not be retained.", new Object[0]);
                N0();
                h1();
                break;
        }
    }

    @Override // defpackage.j15
    public final void z(Context context) {
        switch (this.o0) {
            case 0:
                super.z(context);
                U0();
                h1();
                break;
            case 1:
                super.z(context);
                E0();
                h1();
                break;
            case 2:
                super.z(context);
                H0();
                h1();
                break;
            case 3:
                super.z(context);
                X0();
                h1();
                break;
            case 4:
                super.z(context);
                Y0();
                h1();
                break;
            case 5:
                super.z(context);
                a1();
                h1();
                break;
            case 6:
                super.z(context);
                b1();
                h1();
                break;
            case 7:
                super.z(context);
                c1();
                h1();
                break;
            case 8:
                super.z(context);
                f1();
                h1();
                break;
            case 9:
                super.z(context);
                g1();
                h1();
                break;
            case 10:
                super.z(context);
                d1();
                h1();
                break;
            case 11:
                super.z(context);
                e1();
                h1();
                break;
            case 12:
                super.z(context);
                V0();
                h1();
                break;
            case 13:
                super.z(context);
                Z0();
                h1();
                break;
            case 14:
                super.z(context);
                S0();
                h1();
                break;
            case 15:
                super.z(context);
                F0();
                h1();
                break;
            case 16:
                super.z(context);
                T0();
                h1();
                break;
            case 17:
                super.z(context);
                R0();
                h1();
                break;
            case 18:
                super.z(context);
                I0();
                h1();
                break;
            case 19:
                super.z(context);
                P0();
                h1();
                break;
            case 20:
                super.z(context);
                J0();
                h1();
                break;
            case 21:
                super.z(context);
                G0();
                h1();
                break;
            case 22:
                super.z(context);
                Q0();
                h1();
                break;
            case 23:
                super.z(context);
                D0();
                h1();
                break;
            case 24:
                super.z(context);
                O0();
                h1();
                break;
            case 25:
                super.z(context);
                K0();
                h1();
                break;
            case 26:
                super.z(context);
                L0();
                h1();
                break;
            case 27:
                super.z(context);
                M0();
                h1();
                break;
            case 28:
                super.z(context);
                W0();
                h1();
                break;
            default:
                super.z(context);
                N0();
                h1();
                break;
        }
    }
}
