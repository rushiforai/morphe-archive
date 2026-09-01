package defpackage;

import android.app.Activity;
import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.ImageView;
import com.medium.android.addressbook.ui.findfriends.FindFriendsFragment;
import com.medium.android.admin.stagebranch.StageBranchFragment;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.navigation.CatalogDetailReference;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationStatsReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.data.post.TargetPost;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.onboarding.OnboardingFlowActivity;
import com.medium.android.donkey.post.PostFragment;
import com.medium.android.donkey.post.PostPageFragment2;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.donkey.read.web.ExternalWebViewActivity;
import com.medium.android.donkey.read.web.ExternalWebViewBottomSheetDialogFragment;
import com.medium.android.donkey.read.web.ExternalWebViewFragment;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.followers.FollowersFragment;
import com.medium.android.followers.publication.PublicationFollowersFragment;
import com.medium.android.following.FollowingFragment;
import com.medium.android.following.FollowingTab;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.PredefinedCatalogType;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.newsletters.consent.SubscribeToNewsletterConsentDialogFragment;
import com.medium.android.payments.ui.subscription.SubscriptionBottomSheetDialogFragment;
import com.medium.android.postpage.displaysettings.DisplaySettingsDialogFragment;
import com.medium.android.postpage.featuredinpublication.FeaturedInPublicationFragment;
import com.medium.android.postpage.membershipinfo.MembershipInfoBottomSheetFragment;
import com.medium.android.postpage.share.SharePostDialogFragment;
import com.medium.android.profile.ui.edit.EditProfileFragment;
import com.medium.android.profile.ui.premium.ProfilePremiumBottomSheetDialogFragment;
import com.medium.android.profile.ui.view.UserProfileFragment;
import com.medium.android.profile.ui.view.UserProfileReference;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.android.profile.ui.you.YouProfileFragment;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.android.publication.ui.archive.PublicationArchiveFragment;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.android.publicationadmin.ui.featuredposts.FeaturedPostsFragment;
import com.medium.android.publicationadmin.ui.featurepost.FeaturePostBottomSheetFragment;
import com.medium.android.pushnotificationsettings.ui.PushNotificationSettingsFragment;
import com.medium.android.reportpost.ui.ReportPostDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseReference;
import com.medium.android.repost.ui.report.ReportRepostDialogFragment;
import com.medium.android.repost.ui.repostnote.RepostWithNoteBottomSheetFragment;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.settings.main.SettingsFragment;
import com.medium.android.settings.ui.privacy.PrivacyFragment;
import com.medium.android.showlesslikethis.ui.ShowLessLikeThisDialogFragment;
import com.medium.android.tag.recommendedposts.TagRecommendedPostsFragment;
import com.medium.android.tag.tagpage.TagFragment;
import com.medium.android.tag.whotofollow.TagWhoToFollowFragment;
import com.medium.android.upvoters.ui.UpVotersFragment;
import com.medium.android.upvoters.ui.UpVotersReference;
import com.medium.android.yourlibrary.YourLibraryTab;
import com.medium.android.yourlibrary.c;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsFragment;
import com.medium.refinerecommendations.RefineRecommendationsTab;
import com.medium.stats.ui.post.PostStatsFragment;
import com.medium.stats.ui.pub.PubStatsFragment;
import com.medium.stats.ui.subscriberslist.SubscribersListFragment;
import com.medium.stats.ui.user.UserStatsFragment;
import com.medium.stats.ui.user.UserStatsTab;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p13 implements s {
    public final dm4 a;
    public final vq6 b;

    public p13(dm4 dm4Var) {
        i03 i03Var = i03.a;
        this.a = dm4Var;
        this.b = vx0.d0(yw6.NONE, new nh2(4, this));
    }

    public final void A(Context context, String str) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new PushNotificationSettingsFragment.BundleInfo(str));
        m4.w(context, R.id.pushNotificationSettingsFragment, bundleA, null, 12);
    }

    public final void B(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        m4.w(context, R.id.yourLibraryFragment, c.b(str, YourLibraryTab.READING_HISTORY, 4), null, 12);
    }

    public final void C(Context context, String str) throws PendingIntent.CanceledException {
        str.getClass();
        RefineRecommendationsTab refineRecommendationsTab = RefineRecommendationsTab.Following;
        RefineRecommendationsFilter refineRecommendationsFilter = RefineRecommendationsFilter.ALL;
        refineRecommendationsTab.getClass();
        refineRecommendationsFilter.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new RefineRecommendationsFragment.BundleInfo(refineRecommendationsTab, refineRecommendationsFilter, str));
        m4.w(context, R.id.refineRecommendationsFragment, bundle, null, 12);
    }

    public final void D(Context context, String str) throws PendingIntent.CanceledException {
        RefineRecommendationsTab refineRecommendationsTab = RefineRecommendationsTab.Suggestions;
        RefineRecommendationsFilter refineRecommendationsFilter = RefineRecommendationsFilter.PUBLICATIONS;
        refineRecommendationsTab.getClass();
        refineRecommendationsFilter.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new RefineRecommendationsFragment.BundleInfo(refineRecommendationsTab, refineRecommendationsFilter, str));
        m4.w(context, R.id.refineRecommendationsFragment, bundle, null, 12);
    }

    public final void E(Context context, ResponsesReference responsesReference, String str, boolean z) {
        Bundle bundle;
        context.getClass();
        str.getClass();
        if (z && (responsesReference instanceof ResponsesReference.Post)) {
            int i = a() ? R.id.postPageFragment2 : R.id.postFragment;
            if (a()) {
                TargetPost targetPost = new TargetPost(((ResponsesReference.Post) responsesReference).getPostId(), null, null, 6, null);
                ReadingContext.Default r10 = ReadingContext.Default.INSTANCE;
                r10.getClass();
                bundle = new Bundle();
                bundle.putParcelable("bundle_info", new PostPageFragment2.BundleInfo(targetPost, r10, str));
            } else {
                TargetPost targetPost2 = new TargetPost(((ResponsesReference.Post) responsesReference).getPostId(), null, null, 6, null);
                ReadingContext.Default r102 = ReadingContext.Default.INSTANCE;
                r102.getClass();
                bundle = new Bundle();
                bundle.putParcelable("bundle_info", new PostFragment.BundleInfo(targetPost2, r102, str));
            }
            m4.w(context, i, bundle, null, 12);
        }
        m4.w(context, R.id.responsesFragment, com.medium.android.responses.c.a(responsesReference, str), new ob8(false, false, -1, false, false, R.anim.common_slide_in_bottom, R.anim.nav_default_exit_anim, R.anim.nav_default_pop_enter_anim, R.anim.common_slide_out_bottom), 8);
    }

    public final void F(Context context, String str, boolean z) {
        context.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str));
        m4.w(context, R.id.searchFragment, bundle, z ? qb8.V() : null, 8);
    }

    public final void G(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new SettingsFragment.BundleInfo(str));
        m4.w(context, R.id.settingsFragment, bundle, null, 12);
    }

    public final void H(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new StageBranchFragment.BundleInfo(str));
        m4.w(context, R.id.stageBranchFragment, bundle, null, 12);
    }

    public final void I(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        YouProfileTab.Posts posts = YouProfileTab.Posts.INSTANCE;
        posts.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(posts, str2));
        la3 la3Var = new la3(R.id.youProfileFragment, bundle, null, 12);
        UserStatsTab userStatsTab = UserStatsTab.AUDIENCE;
        userStatsTab.getClass();
        Bundle bundle2 = new Bundle();
        bundle2.putParcelable("bundle_info", new UserStatsFragment.BundleInfo(str, userStatsTab, str2));
        la3 la3Var2 = new la3(R.id.userStatsFragment, bundle2, null, 12);
        Bundle bundle3 = new Bundle();
        bundle3.putParcelable("bundle_info", new SubscribersListFragment.BundleInfo(str, str2));
        m4.x(context, d46.R(la3Var, la3Var2, new la3(R.id.subscribersListFragment, bundle3, null, 12)));
    }

    public final void J(Context context, UpsellInfo upsellInfo, String str, MembershipType membershipType) throws PendingIntent.CanceledException {
        context.getClass();
        upsellInfo.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new SubscriptionBottomSheetDialogFragment.BundleInfo(str, upsellInfo, membershipType));
        m4.w(context, R.id.subscriptionBottomSheetDialogFragment, bundle, null, 12);
    }

    public final void K(Context context, String str, SusiDestination susiDestination) {
        context.getClass();
        str.getClass();
        int i = SusiActivity.v;
        Intent intent = new Intent(context, (Class<?>) SusiActivity.class);
        Bundle bundle = new Bundle();
        bundle.putString("referrer_source", str);
        bundle.putParcelable("susi_destination", susiDestination);
        bundle.putSerializable("susi_operation", null);
        bundle.putParcelable("route_to", null);
        intent.putExtras(bundle);
        context.startActivity(intent);
    }

    public final void L(Context context, String str, String str2, boolean z) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        if (z) {
            Bundle bundle = new Bundle();
            bundle.putParcelable("bundle_info", new TagFragment.BundleInfo(str, str2));
            m4.w(context, R.id.tagFragment, bundle, null, 12);
        }
        Bundle bundle2 = new Bundle();
        bundle2.putParcelable("bundle_info", new TagRecommendedPostsFragment.BundleInfo(str, str2));
        m4.w(context, R.id.tagRecommendedPostsFragment, bundle2, null, 12);
    }

    public final void M(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new TagWhoToFollowFragment.BundleInfo(str, str2));
        m4.w(context, R.id.tagWhoToFollowFragment, bundle, null, 12);
    }

    public final void N(Context context, String str, String str2) {
        context.getClass();
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new TagFragment.BundleInfo(str, str2));
        m4.w(context, R.id.tagFragment, bundle, null, 12);
    }

    public final void O(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        YouProfileTab.Posts posts = YouProfileTab.Posts.INSTANCE;
        posts.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(posts, str2));
        la3 la3Var = new la3(R.id.youProfileFragment, bundle, null, 12);
        UserStatsTab userStatsTab = UserStatsTab.AUDIENCE;
        userStatsTab.getClass();
        Bundle bundle2 = new Bundle();
        bundle2.putParcelable("bundle_info", new UserStatsFragment.BundleInfo(str, userStatsTab, str2));
        m4.x(context, d46.R(la3Var, new la3(R.id.userStatsFragment, bundle2, null, 12)));
    }

    public final void P(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new FollowersFragment.BundleInfo(str, str2));
        m4.w(context, R.id.followersFragment, bundleA, null, 12);
    }

    public final void Q(Context context, String str, String str2) {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserProfileReference.UserId userId = new UserProfileReference.UserId(str);
        UserProfileTab.Posts posts = UserProfileTab.Posts.INSTANCE;
        posts.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserProfileFragment.BundleInfo(userId, posts, str2));
        m4.w(context, R.id.userProfileFragment, bundle, null, 12);
    }

    public final void R(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserProfileReference.Username username = new UserProfileReference.Username(str);
        UserProfileTab.Posts posts = UserProfileTab.Posts.INSTANCE;
        posts.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserProfileFragment.BundleInfo(username, posts, str2));
        m4.w(context, R.id.userProfileFragment, bundle, null, 12);
    }

    public final void S(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserProfileReference.Username username = new UserProfileReference.Username(str);
        UserProfileTab.About about = UserProfileTab.About.INSTANCE;
        about.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserProfileFragment.BundleInfo(username, about, str2));
        m4.w(context, R.id.userProfileFragment, bundle, null, 12);
    }

    public final void T(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserProfileReference.Username username = new UserProfileReference.Username(str);
        UserProfileTab.Activity activity = UserProfileTab.Activity.INSTANCE;
        activity.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserProfileFragment.BundleInfo(username, activity, str2));
        m4.w(context, R.id.userProfileFragment, bundle, null, 12);
    }

    public final void U(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserProfileReference.Username username = new UserProfileReference.Username(str);
        UserProfileTab.Books books = UserProfileTab.Books.INSTANCE;
        books.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserProfileFragment.BundleInfo(username, books, str2));
        m4.w(context, R.id.userProfileFragment, bundle, null, 12);
    }

    public final void V(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserProfileReference.Username username = new UserProfileReference.Username(str);
        UserProfileTab.Catalogs catalogs = UserProfileTab.Catalogs.INSTANCE;
        catalogs.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserProfileFragment.BundleInfo(username, catalogs, str2));
        m4.w(context, R.id.userProfileFragment, bundle, null, 12);
    }

    public final void W(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        UserStatsTab userStatsTab = UserStatsTab.STORIES;
        userStatsTab.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UserStatsFragment.BundleInfo(str, userStatsTab, str2));
        m4.w(context, R.id.userStatsFragment, bundle, null, 12);
    }

    public final void X(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        YouProfileTab.Posts posts = YouProfileTab.Posts.INSTANCE;
        posts.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(posts, str));
        m4.w(context, R.id.youProfileFragment, bundle, null, 12);
    }

    public final void Y(Context context, String str) throws PendingIntent.CanceledException {
        str.getClass();
        YouProfileTab.Reposts reposts = YouProfileTab.Reposts.INSTANCE;
        reposts.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new YouProfileFragment.BundleInfo(reposts, str));
        m4.w(context, R.id.youProfileFragment, bundle, null, 12);
    }

    public final void Z(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        m4.w(context, R.id.yourLibraryFragment, c.b(str, YourLibraryTab.RESPONSES, 4), null, 12);
    }

    public final boolean a() {
        return ((Boolean) this.b.getValue()).booleanValue();
    }

    public final void a0(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        m4.w(context, R.id.yourLibraryFragment, c.b(str, YourLibraryTab.SAVED_LISTS, 4), null, 12);
    }

    public final void b(Context context, String str) {
        str.getClass();
        Uri uriBuild = Uri.parse("https://play.google.com/store/account/subscriptions").buildUpon().appendQueryParameter("package", "com.medium.reader").appendQueryParameter("sku", str).build();
        uriBuild.getClass();
        e0(context, uriBuild);
    }

    public final void b0(Context context) {
        Intent intent = new Intent();
        intent.setAction("android.settings.APP_NOTIFICATION_SETTINGS");
        intent.addFlags(268435456);
        String packageName = context.getPackageName();
        intent.putExtra("app_package", packageName);
        intent.putExtra("app_uid", context.getApplicationInfo().uid);
        intent.putExtra("android.provider.extra.APP_PACKAGE", packageName);
        context.startActivity(intent);
    }

    public final void c(Context context, String str, String str2) {
        context.getClass();
        str.getClass();
        str2.getClass();
        CatalogDetailReference.CatalogDetailById catalogDetailById = new CatalogDetailReference.CatalogDetailById(str);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new CatalogDetailFragment.BundleInfo(catalogDetailById, str2));
        m4.w(context, R.id.catalogDetailFragment, bundle, null, 12);
    }

    public final void c0(Context context) {
        Intent intent = new Intent();
        intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setData(Uri.fromParts("package", context.getPackageName(), null));
        context.startActivity(intent);
    }

    public final void d(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        m4.w(context, R.id.yourLibraryFragment, c.a(YourLibraryTab.DIGEST, str2, str), null, 12);
    }

    public final void d0(Context context) {
        context.startActivity(new Intent("android.settings.INTERNAL_STORAGE_SETTINGS"));
    }

    public final void e(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new EditProfileFragment.BundleInfo(str));
        m4.w(context, R.id.editProfileFragment, bundle, null, 12);
    }

    public final void e0(Context context, Uri uri) {
        context.getClass();
        uri.getClass();
        context.startActivity(new Intent("android.intent.action.VIEW", uri));
    }

    public final void f(Context context, Uri uri, String str) {
        context.getClass();
        uri.getClass();
        str.getClass();
        if (ht2.o0(context) instanceof MainActivity) {
            Bundle bundle = new Bundle();
            bundle.putParcelable("bundle_info", new ExternalWebViewFragment.BundleInfo(str, uri));
            m4.w(context, R.id.externalWebViewFragment, bundle, null, 12);
        } else {
            int i = ExternalWebViewActivity.r;
            Intent intent = new Intent(context, (Class<?>) ExternalWebViewActivity.class);
            intent.setData(uri);
            intent.putExtra("referrer_source", str);
            intent.addFlags(268435456);
            context.startActivity(intent);
        }
    }

    public final void f0(Context context) {
        Uri uri = Uri.parse("https://play.google.com/store/apps/details?id=" + context.getPackageName());
        try {
            Intent intent = new Intent("android.intent.action.VIEW", uri);
            intent.setPackage("com.android.vending");
            context.startActivity(intent);
        } catch (ActivityNotFoundException e) {
            wld.a.e(e, "Failed to open Play Store listing!", new Object[0]);
            e0(context, uri);
        }
    }

    public final void g(Context context, Uri uri, String str) throws PendingIntent.CanceledException {
        uri.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new ExternalWebViewBottomSheetDialogFragment.BundleInfo(str, uri));
        m4.w(context, R.id.externalWebViewBottomSheetDialogFragment, bundle, null, 12);
    }

    public final void g0(Context context, String str) throws PendingIntent.CanceledException {
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str));
        bundle.putString("referrer_source", str);
        m4.w(context, R.id.createCatalogBottomSheetDialogFragment, bundle, null, 12);
    }

    public final void h(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new FeaturedPostsFragment.BundleInfo(str, str2));
        m4.w(context, R.id.featuredPostsFragment, bundleA, null, 12);
    }

    public final void h0(Context context, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str2));
        bundle.putString("referrer_source", str2);
        bundle.putString("catalog_id", str);
        m4.w(context, R.id.deleteCatalogDialogFragment, bundle, null, 12);
    }

    public final void i(Context context, String str) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new FindFriendsFragment.BundleInfo(str));
        m4.w(context, R.id.findFriendsFragment, bundleA, null, 12);
    }

    public final void i0(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new DisplaySettingsDialogFragment.BundleInfo(str, str2));
        m4.w(context, R.id.displaySettingsDialogFragment, bundleA, null, 12);
    }

    public final void j(Context context, String str, EntityType entityType, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        m4.w(context, R.id.followSubscribeModalFragment, com.medium.android.followsubscribemodal.c.a(str, entityType, str2), null, 12);
    }

    public final void j0(Context context, String str, String str2, String str3) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new FeaturePostBottomSheetFragment.BundleInfo(str, str2, str3));
        m4.w(context, R.id.featurePostBottomSheetFragment, bundle, null, 12);
    }

    public final void k(Context context, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        FollowingTab followingTab = FollowingTab.USERS;
        followingTab.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new FollowingFragment.BundleInfo(str2, str, followingTab));
        m4.w(context, R.id.followingFragment, bundle, null, 12);
    }

    public final void k0(Context context, String str, String str2, String str3, String str4, String str5) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        str3.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new FeaturedInPublicationFragment.BundleInfo(str, str2, str3, str4, str5));
        m4.w(context, R.id.featuredInPublicationFragment, bundle, null, 12);
    }

    public final void l(Context context, String str) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        m4.w(context, R.id.yourLibraryFragment, c.b(str, YourLibraryTab.HIGHLIGHTS, 4), null, 12);
    }

    public final void l0(Context context, HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        m4.w(context, R.id.highlightDetailBottomSheetFragment, com.medium.android.highlightdetail.c.a(highlightReference, sourceParameter, str, str2), null, 12);
    }

    public final void m(Context context, String str, boolean z) {
        context.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new HomeFragment.BundleInfo(str));
        m4.w(context, R.id.homeFragment, bundle, z ? new ob8(false, false, R.id.homeFragment, true, false, -1, -1, -1, -1) : qb8.V(), 8);
    }

    public final void m0(Context context, CatalogItemType catalogItemType, String str, String str2) throws PendingIntent.CanceledException {
        catalogItemType.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putSerializable("catalog_item_type", catalogItemType);
        bundle.putString("item_id", str);
        bundle.putString("referrer_source", str2);
        m4.w(context, R.id.listsCatalogSelectorDialogFragment, bundle, null, 12);
    }

    public final void n(Context context, String str, String str2, String str3, Integer num, Integer num2, String str4, ImageView imageView, cx7 cx7Var) throws PendingIntent.CanceledException {
        ImageCarouselActivity.SelectedImageContext selectedImageContext;
        str.getClass();
        str2.getClass();
        w6 w6Var = null;
        if (str3 != null) {
            selectedImageContext = new ImageCarouselActivity.SelectedImageContext(str3, num, num2, str4, cx7Var != null ? new ImageCarouselActivity.SelectedImageContext.Key(cx7Var.a, cx7Var.b) : null);
        } else {
            selectedImageContext = null;
        }
        if ((context instanceof Activity) && cx7Var != null) {
            w6Var = new w6(0, new y6(ActivityOptions.makeSceneTransitionAnimation((Activity) context, imageView, imageView.getTransitionName())));
        }
        int i = ImageCarouselActivity.x;
        Bundle bundle = new Bundle();
        bundle.putString("postId", str);
        bundle.putString("referrerSource", str2);
        bundle.putParcelable("selectedImage", selectedImageContext);
        m4.v(context, R.id.imageCarouselActivity, bundle, new ob8(false, false, -1, false, false, 0, 0, 0, 0), w6Var);
    }

    public final void n0(Context context, String str, String str2, String str3) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new MembershipInfoBottomSheetFragment.BundleInfo(str, str2, str3));
        m4.w(context, R.id.memberShipBottomSheetFragment, bundleA, null, 12);
    }

    public final void o(Context context, String str, SusiDestination susiDestination) {
        str.getClass();
        int i = OnboardingFlowActivity.q;
        Intent intent = new Intent(context, (Class<?>) OnboardingFlowActivity.class);
        Bundle bundle = new Bundle();
        bundle.putString("EXTRA_REFERRER_SOURCE", str);
        bundle.putParcelable("susi_destination", susiDestination);
        intent.putExtras(bundle);
        context.startActivity(intent);
    }

    public final void o0(Context context, String str) throws PendingIntent.CanceledException {
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str));
        m4.w(context, R.id.pushNotificationPermissionRequestDialogFragment, bundle, null, 12);
    }

    public final void p(Context context, String str, String str2, String str3, String str4) throws PendingIntent.CanceledException {
        Bundle bundle;
        context.getClass();
        str.getClass();
        str3.getClass();
        la3 la3Var = new la3(R.id.yourLibraryFragment, c.a(YourLibraryTab.DIGEST, str3, str2), null, 12);
        int i = a() ? R.id.postPageFragment2 : R.id.postFragment;
        if (a()) {
            TargetPost targetPost = new TargetPost(str, null, str4, 2, null);
            ReadingContext.Default r10 = ReadingContext.Default.INSTANCE;
            r10.getClass();
            bundle = new Bundle();
            bundle.putParcelable("bundle_info", new PostPageFragment2.BundleInfo(targetPost, r10, str3));
        } else {
            TargetPost targetPost2 = new TargetPost(str, null, str4, 2, null);
            ReadingContext.Default r102 = ReadingContext.Default.INSTANCE;
            r102.getClass();
            bundle = new Bundle();
            bundle.putParcelable("bundle_info", new PostFragment.BundleInfo(targetPost2, r102, str3));
        }
        m4.x(context, d46.R(la3Var, new la3(i, bundle, qb8.V(), 8)));
    }

    public final void p0(Context context, String str, String str2, String str3) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        str3.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new ReportPostDialogFragment.BundleInfo(str, str2, str3));
        m4.w(context, R.id.reportPostDialogFragment, bundle, null, 12);
    }

    public final void q(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new RepostersFragment.BundleInfo(str, str2));
        m4.w(context, R.id.repostersFragment, bundleA, null, 12);
    }

    public final void q0(Context context, String str, String str2, String str3, boolean z, String str4) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        str3.getClass();
        ReportResponseReference.Post post = new ReportResponseReference.Post(str, z, str3);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new ReportResponseDialogFragment.BundleInfo(post, str2, str4));
        m4.w(context, R.id.reportResponseDialogFragment, bundle, null, 12);
    }

    public final void r(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new PostStatsFragment.BundleInfo(str, str2));
        m4.w(context, R.id.postStatsFragment, bundle, null, 12);
    }

    public final void r0(Context context, String str, String str2, String str3) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        str3.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new ReportRepostDialogFragment.BundleInfo(str, str2, str3));
        m4.w(context, R.id.reportRepostDialogFragment, bundle, null, 12);
    }

    public final void s(Context context, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        UpVotersReference.Post post = new UpVotersReference.Post(str);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new UpVotersFragment.BundleInfo(post, str2));
        m4.w(context, R.id.upVotersFragment, bundle, null, 12);
    }

    public final void s0(Context context, String str, g08 g08Var, String str2, boolean z) {
        str.getClass();
        g08Var.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new RepostWithNoteBottomSheetFragment.BundleInfo(str, g08Var, str2, z));
        m4.w(context, R.id.repostWithNoteBottomSheetFragment, bundle, null, 12);
    }

    public final void t(Context context, String str, PredefinedCatalogType predefinedCatalogType, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str.getClass();
        predefinedCatalogType.getClass();
        str2.getClass();
        CatalogDetailReference.PredefinedCatalogDetail predefinedCatalogDetail = new CatalogDetailReference.PredefinedCatalogDetail(str, predefinedCatalogType);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new CatalogDetailFragment.BundleInfo(predefinedCatalogDetail, str2));
        m4.w(context, R.id.catalogDetailFragment, bundle, null, 12);
    }

    public final void t0(Context context, PostShareData postShareData, String str, String str2, String str3) throws PendingIntent.CanceledException {
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new SharePostDialogFragment.BundleInfo(postShareData, str, str2, str3));
        m4.w(context, R.id.sharePostBottomSheetDialogFragment, bundle, null, 12);
    }

    public final void u(Context context, String str) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new PrivacyFragment.BundleInfo(str));
        m4.w(context, R.id.privacyFragment, bundleA, null, 12);
    }

    public final void u0(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new ShowLessLikeThisDialogFragment.BundleInfo(str, str2));
        m4.w(context, R.id.showLessLikeThisDialogFragment, bundleA, null, 12);
    }

    public final void v(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new ProfilePremiumBottomSheetDialogFragment.BundleInfo(str2, str));
        m4.w(context, R.id.profilePremiumBottomSheetDialogFragment, bundleA, null, 12);
    }

    public final void v0(Context context, String str, EntityType entityType, String str2, String str3, String str4) throws PendingIntent.CanceledException {
        str.getClass();
        entityType.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new SubscribeToNewsletterConsentDialogFragment.BundleInfo(str, entityType, str2, str3, str4));
        m4.w(context, R.id.subscribeToNewsletterConsentDialogFragment, bundle, null, 12);
    }

    public final void w(Context context, PublicationReference publicationReference, Integer num, String str, rba rbaVar, String str2) {
        context.getClass();
        str2.getClass();
        m4.w(context, R.id.publicationArchiveFragment, xz5.E(new f09("bundle_info", new PublicationArchiveFragment.BundleInfo(publicationReference, num, str, rbaVar, str2))), null, 12);
    }

    public final void w0(Context context, String str, String str2) throws PendingIntent.CanceledException {
        str.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str2));
        bundle.putString("referrer_source", str2);
        bundle.putString("id", str);
        m4.w(context, R.id.updateCatalogBottomSheetDialogFragment, bundle, null, 12);
    }

    public final void x(Context context, String str, String str2) throws PendingIntent.CanceledException {
        Bundle bundleA = ho2.A(str);
        bundleA.putParcelable("bundle_info", new PublicationFollowersFragment.BundleInfo(str, str2));
        m4.w(context, R.id.publicationFollowersFragment, bundleA, null, 12);
    }

    public final void y(Context context, PublicationReference publicationReference, String str, PublicationTab publicationTab) {
        context.getClass();
        str.getClass();
        publicationTab.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new PublicationFragment.BundleInfo(publicationReference, str, publicationTab));
        m4.w(context, R.id.publicationFragment, bundle, null, 12);
    }

    public final void z(Context context, String str, String str2) throws PendingIntent.CanceledException {
        context.getClass();
        str2.getClass();
        PublicationStatsReference.PubBySlug pubBySlug = new PublicationStatsReference.PubBySlug(str);
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new PubStatsFragment.BundleInfo(pubBySlug, str2));
        m4.w(context, R.id.pubStatsFragments, bundle, null, 12);
    }
}
