package com.medium.android.graphql.type;

import defpackage.ey3;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/Query;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Query {
    private static final sm8 type;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __draftResult_id = new mx1("id", false);
    private static final mx1 __membershipPlans_platform = new mx1("platform", false);
    private static final mx1 __mobilePlanConfig_input = new mx1("input", false);
    private static final mx1 __onboardingFeaturedUsers_first = new mx1("first", false);
    private static final mx1 __onboardingFeaturedUsers_after = new mx1("after", false);
    private static final mx1 __post_id = new mx1("id", true);
    private static final mx1 __followedPublicationsFeaturedPostsConnection_first = new mx1("first", false);
    private static final mx1 __followedPublicationsFeaturedPostsConnection_after = new mx1("after", false);
    private static final mx1 __publicationFeaturingTokenBalance_input = new mx1("input", false);
    private static final mx1 __publication_id = new mx1("id", true);
    private static final mx1 __publicationByRef_ref = new mx1("ref", false);
    private static final mx1 __publicationAggregateStats_input = new mx1("input", false);
    private static final mx1 __discoverPosts_input = new mx1("input", false);
    private static final mx1 __onboardingTags_input = new mx1("input", false);
    private static final mx1 __recommendedPublishers_first = new mx1("first", false);
    private static final mx1 __recommendedPublishers_after = new mx1("after", false);
    private static final mx1 __recommendedPublishers_mode = new mx1("mode", false);
    private static final mx1 __recommendedPublishers_tagSlug = new mx1("tagSlug", false);
    private static final mx1 __recommendedTags_input = new mx1("input", false);
    private static final mx1 __trendingPostsFeed_input = new mx1("input", false);
    private static final mx1 __authorCollectionRecircFeed_input = new mx1("input", false);
    private static final mx1 __catalogById_catalogId = new mx1("catalogId", false);
    private static final mx1 __collection_id = new mx1("id", true);
    private static final mx1 __followingFeed_paging = new mx1("paging", false);
    private static final mx1 __getPredefinedCatalog_type = new mx1("type", false);
    private static final mx1 __getPredefinedCatalog_userId = new mx1("userId", false);
    private static final mx1 __notificationsConnectionByActivityTypes_activityTypes = new mx1("activityTypes", false);
    private static final mx1 __notificationsConnectionByActivityTypes_paging = new mx1("paging", false);
    private static final mx1 __personalisedTagFeed_paging = new mx1("paging", false);
    private static final mx1 __personalisedTagFeed_tagSlug = new mx1("tagSlug", false);
    private static final mx1 __personalisedTagFeed_skipCache = new mx1("skipCache", false);
    private static final mx1 __postResult_id = new mx1("id", false);
    private static final mx1 __postResults_postIds = new mx1("postIds", false);
    private static final mx1 __recirc_paging = new mx1("paging", false);
    private static final mx1 __recirc_postId = new mx1("postId", false);
    private static final mx1 __staffPicksFeed_input = new mx1("input", false);
    private static final mx1 __user_id = new mx1("id", true);
    private static final mx1 __user_username = new mx1("username", false);
    private static final mx1 __userResult_id = new mx1("id", false);
    private static final mx1 __userResult_username = new mx1("username", false);
    private static final mx1 __variantFlagWithCustomIDs_input = new mx1("input", false);
    private static final mx1 __webRecommendedFeed_forceRank = new mx1("forceRank", false);
    private static final mx1 __webRecommendedFeed_paging = new mx1("paging", false);
    private static final mx1 __search_query = new mx1("query", false);
    private static final mx1 __rememberMeAccountHint_input = new mx1("input", false);
    private static final mx1 __onboardingStarterPack_input = new mx1("input", false);
    private static final mx1 __relatedTags_tagSlug = new mx1("tagSlug", false);
    private static final mx1 __tagFromSlug_tagSlug = new mx1("tagSlug", true);
    private static final mx1 __tagsTypeahead_prefix = new mx1("prefix", false);
    private static final mx1 __userActivitiesConnection_input = new mx1("input", false);
    private static final mx1 __userRepostsConnection_input = new mx1("input", false);
    private static final mx1 __postStatsDailyBundle_postStatsDailyBundleInput = new mx1("postStatsDailyBundleInput", false);
    private static final mx1 __postStatsTotalBundle_postStatsTotalBundleInput = new mx1("postStatsTotalBundleInput", false);

    static {
        ey3 ey3Var = ey3.a;
        type = new sm8("Query", ey3Var, ey3Var);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\bl\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0006\u001a\u0004\b\n\u0010\bR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0006\u001a\u0004\b\f\u0010\bR\u0017\u0010\r\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0006\u001a\u0004\b\u000e\u0010\bR\u0017\u0010\u000f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0006\u001a\u0004\b\u0010\u0010\bR\u0017\u0010\u0011\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0006\u001a\u0004\b\u0012\u0010\bR\u0017\u0010\u0013\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0006\u001a\u0004\b\u0014\u0010\bR\u0017\u0010\u0015\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0006\u001a\u0004\b\u0016\u0010\bR\u0017\u0010\u0017\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0006\u001a\u0004\b\u0018\u0010\bR\u0017\u0010\u0019\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u0006\u001a\u0004\b\u001a\u0010\bR\u0017\u0010\u001b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001b\u0010\u0006\u001a\u0004\b\u001c\u0010\bR\u0017\u0010\u001d\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u0006\u001a\u0004\b\u001e\u0010\bR\u0017\u0010\u001f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001f\u0010\u0006\u001a\u0004\b \u0010\bR\u0017\u0010!\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b!\u0010\u0006\u001a\u0004\b\"\u0010\bR\u0017\u0010#\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b#\u0010\u0006\u001a\u0004\b$\u0010\bR\u0017\u0010%\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b%\u0010\u0006\u001a\u0004\b&\u0010\bR\u0017\u0010'\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b'\u0010\u0006\u001a\u0004\b(\u0010\bR\u0017\u0010)\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b)\u0010\u0006\u001a\u0004\b*\u0010\bR\u0017\u0010+\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b+\u0010\u0006\u001a\u0004\b,\u0010\bR\u0017\u0010-\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b-\u0010\u0006\u001a\u0004\b.\u0010\bR\u0017\u0010/\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b/\u0010\u0006\u001a\u0004\b0\u0010\bR\u0017\u00101\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b1\u0010\u0006\u001a\u0004\b2\u0010\bR\u0017\u00103\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b3\u0010\u0006\u001a\u0004\b4\u0010\bR\u0017\u00105\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b5\u0010\u0006\u001a\u0004\b6\u0010\bR\u0017\u00107\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b7\u0010\u0006\u001a\u0004\b8\u0010\bR\u0017\u00109\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b9\u0010\u0006\u001a\u0004\b:\u0010\bR\u0017\u0010;\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b;\u0010\u0006\u001a\u0004\b<\u0010\bR\u0017\u0010=\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b=\u0010\u0006\u001a\u0004\b>\u0010\bR\u0017\u0010?\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b?\u0010\u0006\u001a\u0004\b@\u0010\bR\u0017\u0010A\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bA\u0010\u0006\u001a\u0004\bB\u0010\bR\u0017\u0010C\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bC\u0010\u0006\u001a\u0004\bD\u0010\bR\u0017\u0010E\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bE\u0010\u0006\u001a\u0004\bF\u0010\bR\u0017\u0010G\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bG\u0010\u0006\u001a\u0004\bH\u0010\bR\u0017\u0010I\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bI\u0010\u0006\u001a\u0004\bJ\u0010\bR\u0017\u0010K\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bK\u0010\u0006\u001a\u0004\bL\u0010\bR\u0017\u0010M\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bM\u0010\u0006\u001a\u0004\bN\u0010\bR\u0017\u0010O\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bO\u0010\u0006\u001a\u0004\bP\u0010\bR\u0017\u0010Q\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bQ\u0010\u0006\u001a\u0004\bR\u0010\bR\u0017\u0010S\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bS\u0010\u0006\u001a\u0004\bT\u0010\bR\u0017\u0010U\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bU\u0010\u0006\u001a\u0004\bV\u0010\bR\u0017\u0010W\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bW\u0010\u0006\u001a\u0004\bX\u0010\bR\u0017\u0010Y\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bY\u0010\u0006\u001a\u0004\bZ\u0010\bR\u0017\u0010[\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b[\u0010\u0006\u001a\u0004\b\\\u0010\bR\u0017\u0010]\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b]\u0010\u0006\u001a\u0004\b^\u0010\bR\u0017\u0010_\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b_\u0010\u0006\u001a\u0004\b`\u0010\bR\u0017\u0010a\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\ba\u0010\u0006\u001a\u0004\bb\u0010\bR\u0017\u0010c\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bc\u0010\u0006\u001a\u0004\bd\u0010\bR\u0017\u0010e\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\be\u0010\u0006\u001a\u0004\bf\u0010\bR\u0017\u0010g\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bg\u0010\u0006\u001a\u0004\bh\u0010\bR\u0017\u0010i\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bi\u0010\u0006\u001a\u0004\bj\u0010\bR\u0017\u0010k\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bk\u0010\u0006\u001a\u0004\bl\u0010\bR\u0017\u0010m\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bm\u0010\u0006\u001a\u0004\bn\u0010\bR\u0017\u0010o\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bo\u0010\u0006\u001a\u0004\bp\u0010\bR\u0017\u0010r\u001a\u00020q8\u0006¢\u0006\f\n\u0004\br\u0010s\u001a\u0004\bt\u0010u¨\u0006v"}, d2 = {"Lcom/medium/android/graphql/type/Query$Companion;", "", "<init>", "()V", "Lmx1;", "__draftResult_id", "Lmx1;", "get__draftResult_id", "()Lmx1;", "__membershipPlans_platform", "get__membershipPlans_platform", "__mobilePlanConfig_input", "get__mobilePlanConfig_input", "__onboardingFeaturedUsers_first", "get__onboardingFeaturedUsers_first", "__onboardingFeaturedUsers_after", "get__onboardingFeaturedUsers_after", "__post_id", "get__post_id", "__followedPublicationsFeaturedPostsConnection_first", "get__followedPublicationsFeaturedPostsConnection_first", "__followedPublicationsFeaturedPostsConnection_after", "get__followedPublicationsFeaturedPostsConnection_after", "__publicationFeaturingTokenBalance_input", "get__publicationFeaturingTokenBalance_input", "__publication_id", "get__publication_id", "__publicationByRef_ref", "get__publicationByRef_ref", "__publicationAggregateStats_input", "get__publicationAggregateStats_input", "__discoverPosts_input", "get__discoverPosts_input", "__onboardingTags_input", "get__onboardingTags_input", "__recommendedPublishers_first", "get__recommendedPublishers_first", "__recommendedPublishers_after", "get__recommendedPublishers_after", "__recommendedPublishers_mode", "get__recommendedPublishers_mode", "__recommendedPublishers_tagSlug", "get__recommendedPublishers_tagSlug", "__recommendedTags_input", "get__recommendedTags_input", "__trendingPostsFeed_input", "get__trendingPostsFeed_input", "__authorCollectionRecircFeed_input", "get__authorCollectionRecircFeed_input", "__catalogById_catalogId", "get__catalogById_catalogId", "__collection_id", "get__collection_id", "__followingFeed_paging", "get__followingFeed_paging", "__getPredefinedCatalog_type", "get__getPredefinedCatalog_type", "__getPredefinedCatalog_userId", "get__getPredefinedCatalog_userId", "__notificationsConnectionByActivityTypes_activityTypes", "get__notificationsConnectionByActivityTypes_activityTypes", "__notificationsConnectionByActivityTypes_paging", "get__notificationsConnectionByActivityTypes_paging", "__personalisedTagFeed_paging", "get__personalisedTagFeed_paging", "__personalisedTagFeed_tagSlug", "get__personalisedTagFeed_tagSlug", "__personalisedTagFeed_skipCache", "get__personalisedTagFeed_skipCache", "__postResult_id", "get__postResult_id", "__postResults_postIds", "get__postResults_postIds", "__recirc_paging", "get__recirc_paging", "__recirc_postId", "get__recirc_postId", "__staffPicksFeed_input", "get__staffPicksFeed_input", "__user_id", "get__user_id", "__user_username", "get__user_username", "__userResult_id", "get__userResult_id", "__userResult_username", "get__userResult_username", "__variantFlagWithCustomIDs_input", "get__variantFlagWithCustomIDs_input", "__webRecommendedFeed_forceRank", "get__webRecommendedFeed_forceRank", "__webRecommendedFeed_paging", "get__webRecommendedFeed_paging", "__search_query", "get__search_query", "__rememberMeAccountHint_input", "get__rememberMeAccountHint_input", "__onboardingStarterPack_input", "get__onboardingStarterPack_input", "__relatedTags_tagSlug", "get__relatedTags_tagSlug", "__tagFromSlug_tagSlug", "get__tagFromSlug_tagSlug", "__tagsTypeahead_prefix", "get__tagsTypeahead_prefix", "__userActivitiesConnection_input", "get__userActivitiesConnection_input", "__userRepostsConnection_input", "get__userRepostsConnection_input", "__postStatsDailyBundle_postStatsDailyBundleInput", "get__postStatsDailyBundle_postStatsDailyBundleInput", "__postStatsTotalBundle_postStatsTotalBundleInput", "get__postStatsTotalBundle_postStatsTotalBundleInput", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return Query.type;
        }

        public final mx1 get__authorCollectionRecircFeed_input() {
            return Query.__authorCollectionRecircFeed_input;
        }

        public final mx1 get__catalogById_catalogId() {
            return Query.__catalogById_catalogId;
        }

        public final mx1 get__collection_id() {
            return Query.__collection_id;
        }

        public final mx1 get__discoverPosts_input() {
            return Query.__discoverPosts_input;
        }

        public final mx1 get__draftResult_id() {
            return Query.__draftResult_id;
        }

        public final mx1 get__followedPublicationsFeaturedPostsConnection_after() {
            return Query.__followedPublicationsFeaturedPostsConnection_after;
        }

        public final mx1 get__followedPublicationsFeaturedPostsConnection_first() {
            return Query.__followedPublicationsFeaturedPostsConnection_first;
        }

        public final mx1 get__followingFeed_paging() {
            return Query.__followingFeed_paging;
        }

        public final mx1 get__getPredefinedCatalog_type() {
            return Query.__getPredefinedCatalog_type;
        }

        public final mx1 get__getPredefinedCatalog_userId() {
            return Query.__getPredefinedCatalog_userId;
        }

        public final mx1 get__membershipPlans_platform() {
            return Query.__membershipPlans_platform;
        }

        public final mx1 get__mobilePlanConfig_input() {
            return Query.__mobilePlanConfig_input;
        }

        public final mx1 get__notificationsConnectionByActivityTypes_activityTypes() {
            return Query.__notificationsConnectionByActivityTypes_activityTypes;
        }

        public final mx1 get__notificationsConnectionByActivityTypes_paging() {
            return Query.__notificationsConnectionByActivityTypes_paging;
        }

        public final mx1 get__onboardingFeaturedUsers_after() {
            return Query.__onboardingFeaturedUsers_after;
        }

        public final mx1 get__onboardingFeaturedUsers_first() {
            return Query.__onboardingFeaturedUsers_first;
        }

        public final mx1 get__onboardingStarterPack_input() {
            return Query.__onboardingStarterPack_input;
        }

        public final mx1 get__onboardingTags_input() {
            return Query.__onboardingTags_input;
        }

        public final mx1 get__personalisedTagFeed_paging() {
            return Query.__personalisedTagFeed_paging;
        }

        public final mx1 get__personalisedTagFeed_skipCache() {
            return Query.__personalisedTagFeed_skipCache;
        }

        public final mx1 get__personalisedTagFeed_tagSlug() {
            return Query.__personalisedTagFeed_tagSlug;
        }

        public final mx1 get__postResult_id() {
            return Query.__postResult_id;
        }

        public final mx1 get__postResults_postIds() {
            return Query.__postResults_postIds;
        }

        public final mx1 get__postStatsDailyBundle_postStatsDailyBundleInput() {
            return Query.__postStatsDailyBundle_postStatsDailyBundleInput;
        }

        public final mx1 get__postStatsTotalBundle_postStatsTotalBundleInput() {
            return Query.__postStatsTotalBundle_postStatsTotalBundleInput;
        }

        public final mx1 get__post_id() {
            return Query.__post_id;
        }

        public final mx1 get__publicationAggregateStats_input() {
            return Query.__publicationAggregateStats_input;
        }

        public final mx1 get__publicationByRef_ref() {
            return Query.__publicationByRef_ref;
        }

        public final mx1 get__publicationFeaturingTokenBalance_input() {
            return Query.__publicationFeaturingTokenBalance_input;
        }

        public final mx1 get__publication_id() {
            return Query.__publication_id;
        }

        public final mx1 get__recirc_paging() {
            return Query.__recirc_paging;
        }

        public final mx1 get__recirc_postId() {
            return Query.__recirc_postId;
        }

        public final mx1 get__recommendedPublishers_after() {
            return Query.__recommendedPublishers_after;
        }

        public final mx1 get__recommendedPublishers_first() {
            return Query.__recommendedPublishers_first;
        }

        public final mx1 get__recommendedPublishers_mode() {
            return Query.__recommendedPublishers_mode;
        }

        public final mx1 get__recommendedPublishers_tagSlug() {
            return Query.__recommendedPublishers_tagSlug;
        }

        public final mx1 get__recommendedTags_input() {
            return Query.__recommendedTags_input;
        }

        public final mx1 get__relatedTags_tagSlug() {
            return Query.__relatedTags_tagSlug;
        }

        public final mx1 get__rememberMeAccountHint_input() {
            return Query.__rememberMeAccountHint_input;
        }

        public final mx1 get__search_query() {
            return Query.__search_query;
        }

        public final mx1 get__staffPicksFeed_input() {
            return Query.__staffPicksFeed_input;
        }

        public final mx1 get__tagFromSlug_tagSlug() {
            return Query.__tagFromSlug_tagSlug;
        }

        public final mx1 get__tagsTypeahead_prefix() {
            return Query.__tagsTypeahead_prefix;
        }

        public final mx1 get__trendingPostsFeed_input() {
            return Query.__trendingPostsFeed_input;
        }

        public final mx1 get__userActivitiesConnection_input() {
            return Query.__userActivitiesConnection_input;
        }

        public final mx1 get__userRepostsConnection_input() {
            return Query.__userRepostsConnection_input;
        }

        public final mx1 get__userResult_id() {
            return Query.__userResult_id;
        }

        public final mx1 get__userResult_username() {
            return Query.__userResult_username;
        }

        public final mx1 get__user_id() {
            return Query.__user_id;
        }

        public final mx1 get__user_username() {
            return Query.__user_username;
        }

        public final mx1 get__variantFlagWithCustomIDs_input() {
            return Query.__variantFlagWithCustomIDs_input;
        }

        public final mx1 get__webRecommendedFeed_forceRank() {
            return Query.__webRecommendedFeed_forceRank;
        }

        public final mx1 get__webRecommendedFeed_paging() {
            return Query.__webRecommendedFeed_paging;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
