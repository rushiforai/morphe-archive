package defpackage;

import android.app.RemoteAction;
import android.content.Intent;
import android.os.Parcelable;
import com.medium.android.admin.userdismissableflags.UserDismissableFlagsFragment;
import com.medium.android.audio.voiceselector.VoiceSelectionFragment;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.onboarding.ui.starterpackdetail.StarterPackDetailFragment;
import com.medium.android.onboarding.ui.starterpacks.StarterPacksFragment;
import com.medium.android.onboarding.ui.topics.TopicsFragment;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import com.medium.android.profile.ui.view.UserProfileFragment;
import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;
import com.medium.android.susi.ui.welcome.SusiWelcomeFragment;
import com.medium.android.tag.recommendedposts.TagRecommendedPostsFragment;
import com.medium.android.tag.tagdirectory.TagDirectoryFragment;
import com.medium.android.tag.tagpage.TagFragment;
import com.medium.android.tag.whotofollow.TagWhoToFollowFragment;
import com.medium.android.unsplash.ui.UnsplashPickerFragment;
import com.medium.android.upvoters.ui.UpVotersFragment;
import com.medium.stats.ui.subscriberslist.SubscribersListFragment;
import com.medium.stats.ui.user.UserStatsFragment;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class doc implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ doc(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F((StarterPackDetailFragment) obj), "bundle_info", StarterPackDetailFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (StarterPackDetailFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((StarterPacksFragment) obj), "bundle_info", StarterPacksFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (StarterPacksFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 2:
                Parcelable parcelable3 = (Parcelable) ht2.r0(dm2.F((SubscribersListFragment) obj), "bundle_info", SubscribersListFragment.BundleInfo.class);
                if (parcelable3 != null) {
                    return (SubscribersListFragment.BundleInfo) parcelable3;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 3:
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F((SubscriptionBottomSheetDialogFragment) obj), "bundle_info", SubscriptionBottomSheetDialogFragment.BundleInfo.class);
                if (parcelable4 != null) {
                    return (SubscriptionBottomSheetDialogFragment.BundleInfo) parcelable4;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 4:
                SusiActivity susiActivity = (SusiActivity) obj;
                int i2 = SusiActivity.v;
                if (!susiActivity.getIntent().hasExtra("referrer_source")) {
                    return "";
                }
                Intent intent = susiActivity.getIntent();
                intent.getClass();
                return op8.j0(intent);
            case 5:
                Parcelable parcelable5 = (Parcelable) ht2.r0(dm2.F((SusiWelcomeFragment) obj), "bundle_info", SusiWelcomeFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (SusiWelcomeFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 6:
                Parcelable parcelable6 = (Parcelable) ht2.r0(dm2.F((TagDirectoryFragment) obj), "bundle_info", TagDirectoryFragment.BundleInfo.class);
                if (parcelable6 != null) {
                    return (TagDirectoryFragment.BundleInfo) parcelable6;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 7:
                Parcelable parcelable7 = (Parcelable) ht2.r0(dm2.F((TagFragment) obj), "bundle_info", TagFragment.BundleInfo.class);
                if (parcelable7 != null) {
                    return (TagFragment.BundleInfo) parcelable7;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 8:
                Parcelable parcelable8 = (Parcelable) ht2.r0(dm2.F((TagRecommendedPostsFragment) obj), "bundle_info", TagRecommendedPostsFragment.BundleInfo.class);
                if (parcelable8 != null) {
                    return (TagRecommendedPostsFragment.BundleInfo) parcelable8;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 9:
                Parcelable parcelable9 = (Parcelable) ht2.r0(dm2.F((TagWhoToFollowFragment) obj), "bundle_info", TagWhoToFollowFragment.BundleInfo.class);
                if (parcelable9 != null) {
                    return (TagWhoToFollowFragment.BundleInfo) parcelable9;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 10:
                pgd pgdVar = (pgd) obj;
                pgdVar.E = null;
                dl7.u(pgdVar);
                gx1.M(pgdVar);
                wgf.y(pgdVar);
                return Boolean.TRUE;
            case 11:
                ep6.j((RemoteAction) obj);
                return c1eVar;
            case 12:
                nhd nhdVar = (nhd) obj;
                return nhdVar.n ? iq7.A(nhdVar) : xgd.b;
            case 13:
                return (wid) obj;
            case 14:
                return new k46(((o46) obj).c());
            case 15:
                lkd lkdVar = (lkd) obj;
                lkdVar.A = null;
                dl7.u(lkdVar);
                gx1.M(lkdVar);
                wgf.y(lkdVar);
                return Boolean.TRUE;
            case 16:
                ((mnd) obj).P.invoke(Boolean.valueOf(!r7.O));
                return c1eVar;
            case 17:
                Parcelable parcelable10 = (Parcelable) ht2.r0(dm2.F((TopicsFragment) obj), "bundle_info", TopicsFragment.BundleInfo.class);
                if (parcelable10 != null) {
                    return (TopicsFragment.BundleInfo) parcelable10;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 18:
                Parcelable parcelable11 = (Parcelable) ht2.r0(dm2.F((UnrecognizedEmailFragment) obj), "bundle_info", UnrecognizedEmailFragment.BundleInfo.class);
                if (parcelable11 != null) {
                    return (UnrecognizedEmailFragment.BundleInfo) parcelable11;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 19:
                return ((e2e) obj).e();
            case 20:
                Parcelable parcelable12 = (Parcelable) ht2.r0(dm2.F((UnsplashPickerFragment) obj), "bundle_info", UnsplashPickerFragment.BundleInfo.class);
                if (parcelable12 != null) {
                    return (UnsplashPickerFragment.BundleInfo) parcelable12;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 21:
                Parcelable parcelable13 = (Parcelable) ht2.r0(dm2.F((UpVotersFragment) obj), "bundle_info", UpVotersFragment.BundleInfo.class);
                if (parcelable13 != null) {
                    return (UpVotersFragment.BundleInfo) parcelable13;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 22:
                t6e t6eVar = (t6e) obj;
                cc2 cc2Var = new cc2();
                xua xuaVar = new xua(cc2Var);
                t6eVar.d(xuaVar);
                xuaVar.flush();
                long j = cc2Var.a;
                Iterator it2 = t6eVar.a.values().iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
                return Long.valueOf(j);
            case 23:
                Parcelable parcelable14 = (Parcelable) ht2.r0(dm2.F((UserDismissableFlagsFragment) obj), "bundle_info", UserDismissableFlagsFragment.BundleInfo.class);
                if (parcelable14 != null) {
                    return (UserDismissableFlagsFragment.BundleInfo) parcelable14;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 24:
                String str = ((hne) obj).d;
                return Boolean.valueOf(!(str == null || str.length() == 0));
            case 25:
                Parcelable parcelable15 = (Parcelable) ht2.r0(dm2.F((UserProfileFragment) obj), "bundle_info", UserProfileFragment.BundleInfo.class);
                if (parcelable15 != null) {
                    return (UserProfileFragment.BundleInfo) parcelable15;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 26:
                jje jjeVar = (jje) ((nje) obj);
                return Boolean.valueOf(d46.R(d88.NOT_MUTED, d88.MUTED).contains(jjeVar.i) || d46.R(ns0.NOT_BLOCKED, ns0.BLOCKED).contains(jjeVar.j) || jjeVar.k || jjeVar.l);
            case 27:
                ((ihe) obj).b0();
                return c1eVar;
            case 28:
                Parcelable parcelable16 = (Parcelable) ht2.r0(dm2.F((UserStatsFragment) obj), "bundle_info", UserStatsFragment.BundleInfo.class);
                if (parcelable16 != null) {
                    return (UserStatsFragment.BundleInfo) parcelable16;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            default:
                ((VoiceSelectionFragment) obj).Y();
                return c1eVar;
        }
    }
}
