package defpackage;

import android.os.Parcelable;
import com.medium.android.admin.payments.PaymentsDebuggerFragment;
import com.medium.android.common.post.mixtape.ParagraphEditMixtapeLayout;
import com.medium.android.donkey.post.PostPageFragment2;
import com.medium.android.followers.publication.PublicationFollowersFragment;
import com.medium.android.notifications.NotificationsFragment;
import com.medium.android.notifications.NotificationsRollupFragment;
import com.medium.android.postpublishing.ui.PublicationFlowFragment;
import com.medium.android.publication.ui.archive.PublicationArchiveFragment;
import com.medium.android.publication.ui.editors.PublicationEditorsFragment;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.android.publication.ui.writers.PublicationWritersFragment;
import com.medium.android.pushnotificationsettings.ui.PushNotificationSettingsFragment;
import com.medium.android.settings.ui.privacy.PrivacyFragment;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.stats.ui.post.PostStatsFragment;
import com.medium.stats.ui.pub.PubStatsFragment;
import java.io.Closeable;
import java.util.UUID;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class yj8 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ yj8(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 3;
        c1e c1eVar = c1e.a;
        String str = gYpYQDQkhfs.iPhbFSKCMPCMk;
        n92 n92Var = null;
        Object obj = this.b;
        switch (i) {
            case 0:
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F((NotificationsFragment) obj), str, NotificationsFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (NotificationsFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                Parcelable parcelable2 = (Parcelable) ht2.r0(dm2.F((NotificationsRollupFragment) obj), str, NotificationsRollupFragment.BundleInfo.class);
                if (parcelable2 != null) {
                    return (NotificationsRollupFragment.BundleInfo) parcelable2;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 2:
                ((ik8) obj).getClass();
                return c1eVar;
            case 3:
                nl8 nl8Var = ((vk8) obj).b;
                vx0.c0(f76.F(nl8Var), null, null, new hl8(nl8Var, n92Var, 1), 3);
                return c1eVar;
            case 4:
                return new z31((u31) ((ef6) obj).invoke());
            case 5:
                return new gq8((iq8) obj);
            case 6:
                ParagraphEditMixtapeLayout paragraphEditMixtapeLayout = (ParagraphEditMixtapeLayout) obj;
                int i3 = ParagraphEditMixtapeLayout.i;
                paragraphEditMixtapeLayout.getListener().i(paragraphEditMixtapeLayout);
                return c1eVar;
            case 7:
                n39 n39Var = ((r19) obj).c;
                return new h09(n39Var.i, n39Var.j, n39Var);
            case 8:
                d59 d59Var = (d59) obj;
                return d59Var.a.D(d59Var.b);
            case 9:
                Parcelable parcelable3 = (Parcelable) ht2.r0(dm2.F((PaymentsDebuggerFragment) obj), str, PaymentsDebuggerFragment.BundleInfo.class);
                if (parcelable3 != null) {
                    return (PaymentsDebuggerFragment.BundleInfo) parcelable3;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 10:
                Parcelable parcelable4 = (Parcelable) ht2.r0(dm2.F((PostPageFragment2) obj), str, PostPageFragment2.BundleInfo.class);
                if (parcelable4 != null) {
                    return (PostPageFragment2.BundleInfo) parcelable4;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 11:
                Parcelable parcelable5 = (Parcelable) ht2.r0(dm2.F((PostStatsFragment) obj), str, PostStatsFragment.BundleInfo.class);
                if (parcelable5 != null) {
                    return (PostStatsFragment.BundleInfo) parcelable5;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 12:
                wp9 wp9Var = ((fp9) obj).b;
                vx0.c0(f76.F(wp9Var), null, null, new sp9(wp9Var, n92Var, 0), 3);
                return c1eVar;
            case 13:
                Parcelable parcelable6 = (Parcelable) ht2.r0(dm2.F((PrivacyFragment) obj), str, PrivacyFragment.BundleInfo.class);
                if (parcelable6 != null) {
                    return (PrivacyFragment.BundleInfo) parcelable6;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 14:
                ((upe) obj).getClass();
                UUID uuidRandomUUID = UUID.randomUUID();
                uuidRandomUUID.getClass();
                String string = uuidRandomUUID.toString();
                string.getClass();
                return string;
            case 15:
                Parcelable parcelable7 = (Parcelable) ht2.r0(dm2.F((PubStatsFragment) obj), str, PubStatsFragment.BundleInfo.class);
                if (parcelable7 != null) {
                    return (PubStatsFragment.BundleInfo) parcelable7;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 16:
                Parcelable parcelable8 = (Parcelable) ht2.r0(((PublicationArchiveFragment) obj).R(), str, PublicationArchiveFragment.BundleInfo.class);
                if (parcelable8 != null) {
                    return (PublicationArchiveFragment.BundleInfo) parcelable8;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 17:
                Parcelable parcelable9 = (Parcelable) ht2.r0(((PublicationEditorsFragment) obj).R(), str, PublicationEditorsFragment.BundleInfo.class);
                if (parcelable9 != null) {
                    return (PublicationEditorsFragment.BundleInfo) parcelable9;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 18:
                Parcelable parcelable10 = (Parcelable) ht2.r0(((PublicationFlowFragment) obj).R(), str, PublicationFlowFragment.BundleInfo.class);
                if (parcelable10 != null) {
                    return (PublicationFlowFragment.BundleInfo) parcelable10;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 19:
                ((ui9) obj).invoke();
                return c1eVar;
            case 20:
                Parcelable parcelable11 = (Parcelable) ht2.r0(((PublicationFollowersFragment) obj).R(), str, PublicationFollowersFragment.BundleInfo.class);
                if (parcelable11 != null) {
                    return (PublicationFollowersFragment.BundleInfo) parcelable11;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 21:
                Parcelable parcelable12 = (Parcelable) ht2.r0(((PublicationFragment) obj).R(), str, PublicationFragment.BundleInfo.class);
                if (parcelable12 != null) {
                    return (PublicationFragment.BundleInfo) parcelable12;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 22:
                Parcelable parcelable13 = (Parcelable) ht2.r0(((PublicationWritersFragment) obj).R(), str, PublicationWritersFragment.BundleInfo.class);
                if (parcelable13 != null) {
                    return (PublicationWritersFragment.BundleInfo) parcelable13;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 23:
                return Float.valueOf(((mn4) obj).invoke() < 1.0f ? 0.3f : 1.0f);
            case 24:
                Parcelable parcelable14 = (Parcelable) ht2.r0(dm2.F((PushNotificationSettingsFragment) obj), str, PushNotificationSettingsFragment.BundleInfo.class);
                if (parcelable14 != null) {
                    return (PushNotificationSettingsFragment.BundleInfo) parcelable14;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 25:
                nua nuaVar = ((vta) obj).a;
                vx0.c0(f76.F(nuaVar), null, null, new kua(nuaVar, n92Var, i2), 3);
                return c1eVar;
            case 26:
                egf.b((v1f) obj);
                return c1eVar;
            case 27:
                egf.b((Closeable) ((rya) obj).a);
                return c1eVar;
            case 28:
                cva cvaVar = ((zva) obj).h;
                cvaVar.getClass();
                cvaVar.cancel();
                return c1eVar;
            default:
                Parcelable parcelable15 = (Parcelable) ht2.r0(dm2.F((RefineRecommendationsFragment) obj), str, RefineRecommendationsFragment.BundleInfo.class);
                if (parcelable15 != null) {
                    return (RefineRecommendationsFragment.BundleInfo) parcelable15;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
        }
    }
}
