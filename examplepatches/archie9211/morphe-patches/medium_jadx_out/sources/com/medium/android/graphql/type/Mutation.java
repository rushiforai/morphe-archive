package com.medium.android.graphql.type;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import defpackage.ey3;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/Mutation;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Mutation {
    private static final mx1 __batchFollowUsers_input;
    private static final mx1 __createPostShareKey_postId;
    private static final mx1 __followTag_tagSlug;
    private static final mx1 __followTag_userId;
    private static final mx1 __followTags_input;
    private static final mx1 __publishCatalogResponse_responseDistribution;
    private static final mx1 __publishPostThreadedResponse_deltas;
    private static final mx1 __publishPostThreadedResponse_inResponseToPostId;
    private static final mx1 __publishPostThreadedResponse_inResponseToQuoteId;
    private static final mx1 __publishPostThreadedResponse_responseDistribution;
    private static final mx1 __reportAndMaybeBlockUser_alsoBlockUser;
    private static final mx1 __reportAndMaybeBlockUser_reason;
    private static final mx1 __reportAndMaybeBlockUser_targetUserId;
    private static final mx1 __reportAndMaybeBlockUser_userId;
    private static final mx1 __reportStoryAndMaybeBlockAuthor_alsoBlockAuthor;
    private static final mx1 __reportStoryAndMaybeBlockAuthor_reason;
    private static final mx1 __reportStoryAndMaybeBlockAuthor_targetAuthorId;
    private static final mx1 __reportStoryAndMaybeBlockAuthor_targetPostId;
    private static final mx1 __searchClickEvent_indexName;
    private static final mx1 __searchClickEvent_objectIds;
    private static final mx1 __searchClickEvent_positions;
    private static final mx1 __searchClickEvent_queryId;
    private static final mx1 __sendAcctAuthEmailByUserId_captchaValue;
    private static final mx1 __sendAcctAuthEmailByUserId_redirect;
    private static final mx1 __sendAcctAuthEmailByUserId_userId;
    private static final mx1 __sendAcctAuthEmail_captchaValue;
    private static final mx1 __sendAcctAuthEmail_email;
    private static final mx1 __sendAcctAuthEmail_fullName;
    private static final mx1 __sendAcctAuthEmail_operation;
    private static final mx1 __sendAcctAuthEmail_redirect;
    private static final mx1 __sendAcctAuthEmail_rememberMe;
    private static final mx1 __sendAcctAuthEmail_type;
    private static final mx1 __setUserPronouns_input;
    private static final mx1 __showCatalogResponseOnParent_catalogResponseId;
    private static final mx1 __showCatalogResponseOnParent_parentCatalogId;
    private static final mx1 __subscribeNewsletterV3_newsletterV3Id;
    private static final mx1 __subscribeNewsletterV3_shouldRecordConsent;
    private static final mx1 __unblockUser_targetUserId;
    private static final mx1 __unblockUser_userId;
    private static final mx1 __unfollowCatalog_catalogId;
    private static final mx1 __unfollowCollection_targetCollectionId;
    private static final mx1 __unfollowTag_tagSlug;
    private static final mx1 __unfollowTag_userId;
    private static final mx1 __unfollowTags_input;
    private static final mx1 __unfollowUser_targetUserId;
    private static final mx1 __unhidePostResponseOnParentPost_parentPostId;
    private static final mx1 __unhidePostResponseOnParentPost_postResponseId;
    private static final mx1 __unlockResponsesOnPost_postId;
    private static final mx1 __unmuteCollection_targetCollectionId;
    private static final mx1 __unmuteUser_targetUserId;
    private static final mx1 __unsubscribeNewsletterV3_newsletterV3Id;
    private static final mx1 __updateCatalog_attributes;
    private static final mx1 __updateCatalog_catalogId;
    private static final mx1 __updatePostResponse_deltas;
    private static final mx1 __updatePostResponse_latestRev;
    private static final mx1 __updatePostResponse_responseId;
    private static final mx1 __updateUserPreferences_input;
    private static final mx1 __uploadContacts_input;
    private static final mx1 __userCompleteProfile_bio;
    private static final mx1 __userCompleteProfile_imageId;
    private static final mx1 __userCompleteProfile_name;
    private static final mx1 __userCompleteProfile_userId;
    private static final mx1 __userDismissFlag_flag;
    private static final mx1 __userDismissFlag_userId;
    private static final mx1 __verifyLoginCode_loginCode;
    private static final sm8 type;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __logClientEvents_input = new mx1("input", false);
    private static final mx1 __logExperimentExposure_input = new mx1("input", false);
    private static final mx1 __logGateExposure_input = new mx1("input", false);
    private static final mx1 __updateAndroidMembershipPlan_input = new mx1("input", false);
    private static final mx1 __registerMobileMembershipPurchase_input = new mx1("input", false);
    private static final mx1 __setPostDistributionSettings_input = new mx1("input", false);
    private static final mx1 __clap_numClaps = new mx1("numClaps", false);
    private static final mx1 __clap_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __clap_userId = new mx1("userId", false);
    private static final mx1 __deletePost_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __hideRepost_input = new mx1("input", false);
    private static final mx1 __lockResponsesOnPost_postId = new mx1("postId", false);
    private static final mx1 __reportRepost_input = new mx1("input", false);
    private static final mx1 __repost_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __repost_note = new mx1("note", false);
    private static final mx1 __setPostAllowCuration_allowCuration = new mx1("allowCuration", false);
    private static final mx1 __setPostAllowCuration_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __setPostAllowResponses_allowResponses = new mx1("allowResponses", false);
    private static final mx1 __setPostAllowResponses_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __setPostAudience_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __setPostAudience_visibility = new mx1("visibility", false);
    private static final mx1 __setPostPinnedOnCreatorProfile_input = new mx1("input", false);
    private static final mx1 __setPostPublished_input = new mx1("input", false);
    private static final mx1 __setPostTags_tagNames = new mx1("tagNames", false);
    private static final mx1 __setPostTags_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __stageUpdatePostMetadata_input = new mx1("input", false);
    private static final mx1 __undoRepost_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __unhideRepost_input = new mx1("input", false);
    private static final mx1 __updateRepost_input = new mx1("input", false);
    private static final mx1 __setPostPublicationFeatured_input = new mx1("input", false);
    private static final mx1 __batchFollowPublications_input = new mx1("input", false);
    private static final mx1 __submitToPublication_input = new mx1("input", false);
    private static final mx1 __updateSubmissionStatus_input = new mx1("input", false);
    private static final mx1 __sendExplicitSignal_input = new mx1("input", false);
    private static final mx1 __updateFollowedEntityViewedAt_input = new mx1("input", false);
    private static final mx1 __addToPredefinedCatalog_operation = new mx1("operation", false);
    private static final mx1 __addToPredefinedCatalog_type = new mx1("type", false);
    private static final mx1 __blockUser_targetUserId = new mx1("targetUserId", false);
    private static final mx1 __blockUser_userId = new mx1("userId", false);
    private static final mx1 __clapCatalog_catalogId = new mx1("catalogId", false);
    private static final mx1 __clapCatalog_numClaps = new mx1("numClaps", false);
    private static final mx1 __createCatalog_attributes = new mx1("attributes", false);
    private static final mx1 __createMediaResource_url = new mx1("url", false);
    private static final mx1 __createQuote_endOffset = new mx1("endOffset", false);
    private static final mx1 __createQuote_quoteType = new mx1("quoteType", false);
    private static final mx1 __createQuote_startOffset = new mx1("startOffset", false);
    private static final mx1 __createQuote_targetParagraphNames = new mx1("targetParagraphNames", false);
    private static final mx1 __createQuote_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __createQuote_targetPostVersionId = new mx1("targetPostVersionId", false);
    private static final mx1 __deleteCatalog_catalogId = new mx1("catalogId", false);
    private static final mx1 __deleteQuote_targetPostId = new mx1("targetPostId", false);
    private static final mx1 __deleteQuote_targetQuoteId = new mx1("targetQuoteId", false);
    private static final mx1 __editCatalogItemAnnotation_annotation = new mx1("annotation", false);
    private static final mx1 __editCatalogItemAnnotation_catalogId = new mx1("catalogId", false);
    private static final mx1 __editCatalogItemAnnotation_catalogItemId = new mx1("catalogItemId", false);
    private static final mx1 __editCatalogItems_catalogId = new mx1("catalogId", false);
    private static final mx1 __editCatalogItems_operations = new mx1("operations", false);
    private static final mx1 __editCatalogItems_version = new mx1("version", false);
    private static final mx1 __fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_shouldSubscribeCurrentUser = new mx1("shouldSubscribeCurrentUser", false);
    private static final mx1 __fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_userId = new mx1("userId", false);
    private static final mx1 __flagCatalog_catalogId = new mx1("catalogId", false);
    private static final mx1 __followCatalog_catalogId = new mx1("catalogId", false);
    private static final mx1 __followCollection_targetCollectionId = new mx1("targetCollectionId", false);
    private static final mx1 __followUser_targetUserId = new mx1("targetUserId", false);
    private static final mx1 __hideCatalogResponseOnParent_catalogResponseId = new mx1("catalogResponseId", false);
    private static final mx1 __hideCatalogResponseOnParent_parentCatalogId = new mx1("parentCatalogId", false);
    private static final mx1 __hidePostResponseOnParentPost_parentPostId = new mx1("parentPostId", false);
    private static final mx1 __hidePostResponseOnParentPost_postResponseId = new mx1("postResponseId", false);
    private static final mx1 __linkMobileDevice_token = new mx1("token", false);
    private static final mx1 __muteCollection_targetCollectionId = new mx1("targetCollectionId", false);
    private static final mx1 __muteUser_targetUserId = new mx1("targetUserId", false);
    private static final mx1 __publishCatalogResponse_deltas = new mx1("deltas", false);
    private static final mx1 __publishCatalogResponse_inResponseToCatalogId = new mx1("inResponseToCatalogId", false);

    static {
        String str = QFTsJPDEnO.yTKWfglUeLFId;
        __publishCatalogResponse_responseDistribution = new mx1(str, false);
        __publishPostThreadedResponse_deltas = new mx1("deltas", false);
        __publishPostThreadedResponse_inResponseToPostId = new mx1("inResponseToPostId", false);
        __publishPostThreadedResponse_inResponseToQuoteId = new mx1("inResponseToQuoteId", false);
        __publishPostThreadedResponse_responseDistribution = new mx1(str, false);
        __reportAndMaybeBlockUser_alsoBlockUser = new mx1("alsoBlockUser", false);
        __reportAndMaybeBlockUser_reason = new mx1("reason", false);
        __reportAndMaybeBlockUser_targetUserId = new mx1("targetUserId", false);
        __reportAndMaybeBlockUser_userId = new mx1("userId", false);
        __reportStoryAndMaybeBlockAuthor_alsoBlockAuthor = new mx1("alsoBlockAuthor", false);
        __reportStoryAndMaybeBlockAuthor_reason = new mx1("reason", false);
        __reportStoryAndMaybeBlockAuthor_targetAuthorId = new mx1("targetAuthorId", false);
        __reportStoryAndMaybeBlockAuthor_targetPostId = new mx1("targetPostId", false);
        __sendAcctAuthEmail_captchaValue = new mx1("captchaValue", false);
        __sendAcctAuthEmail_email = new mx1("email", false);
        __sendAcctAuthEmail_fullName = new mx1("fullName", false);
        __sendAcctAuthEmail_operation = new mx1("operation", false);
        __sendAcctAuthEmail_redirect = new mx1("redirect", false);
        __sendAcctAuthEmail_type = new mx1("type", false);
        __sendAcctAuthEmail_rememberMe = new mx1("rememberMe", false);
        __sendAcctAuthEmailByUserId_captchaValue = new mx1("captchaValue", false);
        __sendAcctAuthEmailByUserId_redirect = new mx1("redirect", false);
        __sendAcctAuthEmailByUserId_userId = new mx1("userId", false);
        __showCatalogResponseOnParent_catalogResponseId = new mx1("catalogResponseId", false);
        __showCatalogResponseOnParent_parentCatalogId = new mx1("parentCatalogId", false);
        __subscribeNewsletterV3_newsletterV3Id = new mx1("newsletterV3Id", false);
        __subscribeNewsletterV3_shouldRecordConsent = new mx1("shouldRecordConsent", false);
        __unblockUser_targetUserId = new mx1("targetUserId", false);
        __unblockUser_userId = new mx1("userId", false);
        __unfollowCatalog_catalogId = new mx1("catalogId", false);
        __unfollowCollection_targetCollectionId = new mx1("targetCollectionId", false);
        __unfollowUser_targetUserId = new mx1("targetUserId", false);
        __unhidePostResponseOnParentPost_parentPostId = new mx1("parentPostId", false);
        __unhidePostResponseOnParentPost_postResponseId = new mx1("postResponseId", false);
        __unlockResponsesOnPost_postId = new mx1("postId", false);
        __unmuteCollection_targetCollectionId = new mx1("targetCollectionId", false);
        __unmuteUser_targetUserId = new mx1("targetUserId", false);
        __unsubscribeNewsletterV3_newsletterV3Id = new mx1("newsletterV3Id", false);
        __updateCatalog_attributes = new mx1("attributes", false);
        __updateCatalog_catalogId = new mx1("catalogId", false);
        __updatePostResponse_deltas = new mx1("deltas", false);
        __updatePostResponse_latestRev = new mx1("latestRev", false);
        __updatePostResponse_responseId = new mx1("responseId", false);
        __userCompleteProfile_bio = new mx1("bio", false);
        __userCompleteProfile_imageId = new mx1("imageId", false);
        __userCompleteProfile_name = new mx1("name", false);
        __userCompleteProfile_userId = new mx1("userId", false);
        __userDismissFlag_flag = new mx1("flag", false);
        __userDismissFlag_userId = new mx1("userId", false);
        __verifyLoginCode_loginCode = new mx1("loginCode", false);
        __searchClickEvent_indexName = new mx1("indexName", false);
        __searchClickEvent_objectIds = new mx1("objectIds", false);
        __searchClickEvent_positions = new mx1("positions", false);
        __searchClickEvent_queryId = new mx1("queryId", false);
        __createPostShareKey_postId = new mx1("postId", false);
        __followTag_tagSlug = new mx1("tagSlug", false);
        __followTag_userId = new mx1("userId", false);
        __followTags_input = new mx1("input", false);
        __unfollowTag_tagSlug = new mx1("tagSlug", false);
        __unfollowTag_userId = new mx1("userId", false);
        __unfollowTags_input = new mx1("input", false);
        __batchFollowUsers_input = new mx1("input", false);
        __setUserPronouns_input = new mx1("input", false);
        __uploadContacts_input = new mx1("input", false);
        __updateUserPreferences_input = new mx1("input", false);
        ey3 ey3Var = ey3.a;
        type = new sm8("Mutation", ey3Var, ey3Var);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001d\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0003\b\u0096\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0006\u001a\u0004\b\n\u0010\bR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0006\u001a\u0004\b\f\u0010\bR\u0017\u0010\r\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0006\u001a\u0004\b\u000e\u0010\bR\u0017\u0010\u000f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0006\u001a\u0004\b\u0010\u0010\bR\u0017\u0010\u0011\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0006\u001a\u0004\b\u0012\u0010\bR\u0017\u0010\u0013\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0006\u001a\u0004\b\u0014\u0010\bR\u0017\u0010\u0015\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0006\u001a\u0004\b\u0016\u0010\bR\u0017\u0010\u0017\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0006\u001a\u0004\b\u0018\u0010\bR\u0017\u0010\u0019\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u0006\u001a\u0004\b\u001a\u0010\bR\u0017\u0010\u001b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001b\u0010\u0006\u001a\u0004\b\u001c\u0010\bR\u0017\u0010\u001d\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u0006\u001a\u0004\b\u001e\u0010\bR\u0017\u0010\u001f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001f\u0010\u0006\u001a\u0004\b \u0010\bR\u0017\u0010!\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b!\u0010\u0006\u001a\u0004\b\"\u0010\bR\u0017\u0010#\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b#\u0010\u0006\u001a\u0004\b$\u0010\bR\u0017\u0010%\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b%\u0010\u0006\u001a\u0004\b&\u0010\bR\u0017\u0010'\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b'\u0010\u0006\u001a\u0004\b(\u0010\bR\u0017\u0010)\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b)\u0010\u0006\u001a\u0004\b*\u0010\bR\u0017\u0010+\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b+\u0010\u0006\u001a\u0004\b,\u0010\bR\u0017\u0010-\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b-\u0010\u0006\u001a\u0004\b.\u0010\bR\u0017\u0010/\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b/\u0010\u0006\u001a\u0004\b0\u0010\bR\u0017\u00101\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b1\u0010\u0006\u001a\u0004\b2\u0010\bR\u0017\u00103\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b3\u0010\u0006\u001a\u0004\b4\u0010\bR\u0017\u00105\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b5\u0010\u0006\u001a\u0004\b6\u0010\bR\u0017\u00107\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b7\u0010\u0006\u001a\u0004\b8\u0010\bR\u0017\u00109\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b9\u0010\u0006\u001a\u0004\b:\u0010\bR\u0017\u0010;\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b;\u0010\u0006\u001a\u0004\b<\u0010\bR\u0017\u0010=\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b=\u0010\u0006\u001a\u0004\b>\u0010\bR\u0017\u0010?\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b?\u0010\u0006\u001a\u0004\b@\u0010\bR\u0017\u0010A\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bA\u0010\u0006\u001a\u0004\bB\u0010\bR\u0017\u0010C\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bC\u0010\u0006\u001a\u0004\bD\u0010\bR\u0017\u0010E\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bE\u0010\u0006\u001a\u0004\bF\u0010\bR\u0017\u0010G\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bG\u0010\u0006\u001a\u0004\bH\u0010\bR\u0017\u0010I\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bI\u0010\u0006\u001a\u0004\bJ\u0010\bR\u0017\u0010K\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bK\u0010\u0006\u001a\u0004\bL\u0010\bR\u0017\u0010M\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bM\u0010\u0006\u001a\u0004\bN\u0010\bR\u0017\u0010O\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bO\u0010\u0006\u001a\u0004\bP\u0010\bR\u0017\u0010Q\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bQ\u0010\u0006\u001a\u0004\bR\u0010\bR\u0017\u0010S\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bS\u0010\u0006\u001a\u0004\bT\u0010\bR\u0017\u0010U\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bU\u0010\u0006\u001a\u0004\bV\u0010\bR\u0017\u0010W\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bW\u0010\u0006\u001a\u0004\bX\u0010\bR\u0017\u0010Y\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bY\u0010\u0006\u001a\u0004\bZ\u0010\bR\u0017\u0010[\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b[\u0010\u0006\u001a\u0004\b\\\u0010\bR\u0017\u0010]\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b]\u0010\u0006\u001a\u0004\b^\u0010\bR\u0017\u0010_\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b_\u0010\u0006\u001a\u0004\b`\u0010\bR\u0017\u0010a\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\ba\u0010\u0006\u001a\u0004\bb\u0010\bR\u0017\u0010c\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bc\u0010\u0006\u001a\u0004\bd\u0010\bR\u0017\u0010e\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\be\u0010\u0006\u001a\u0004\bf\u0010\bR\u0017\u0010g\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bg\u0010\u0006\u001a\u0004\bh\u0010\bR\u0017\u0010i\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bi\u0010\u0006\u001a\u0004\bj\u0010\bR\u0017\u0010k\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bk\u0010\u0006\u001a\u0004\bl\u0010\bR\u0017\u0010m\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bm\u0010\u0006\u001a\u0004\bn\u0010\bR\u0017\u0010o\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bo\u0010\u0006\u001a\u0004\bp\u0010\bR\u0017\u0010q\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bq\u0010\u0006\u001a\u0004\br\u0010\bR\u0017\u0010s\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bs\u0010\u0006\u001a\u0004\bt\u0010\bR\u0017\u0010u\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bu\u0010\u0006\u001a\u0004\bv\u0010\bR\u0017\u0010w\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\bw\u0010\u0006\u001a\u0004\bx\u0010\bR\u0017\u0010y\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\by\u0010\u0006\u001a\u0004\bz\u0010\bR\u0017\u0010{\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b{\u0010\u0006\u001a\u0004\b|\u0010\bR\u0017\u0010}\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b}\u0010\u0006\u001a\u0004\b~\u0010\bR\u0018\u0010\u007f\u001a\u00020\u00048\u0006¢\u0006\r\n\u0004\b\u007f\u0010\u0006\u001a\u0005\b\u0080\u0001\u0010\bR\u001a\u0010\u0081\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0081\u0001\u0010\u0006\u001a\u0005\b\u0082\u0001\u0010\bR\u001a\u0010\u0083\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0083\u0001\u0010\u0006\u001a\u0005\b\u0084\u0001\u0010\bR\u001a\u0010\u0085\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0085\u0001\u0010\u0006\u001a\u0005\b\u0086\u0001\u0010\bR\u001a\u0010\u0087\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0087\u0001\u0010\u0006\u001a\u0005\b\u0088\u0001\u0010\bR\u001a\u0010\u0089\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0089\u0001\u0010\u0006\u001a\u0005\b\u008a\u0001\u0010\bR\u001a\u0010\u008b\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u008b\u0001\u0010\u0006\u001a\u0005\b\u008c\u0001\u0010\bR\u001a\u0010\u008d\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u008d\u0001\u0010\u0006\u001a\u0005\b\u008e\u0001\u0010\bR\u001a\u0010\u008f\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u008f\u0001\u0010\u0006\u001a\u0005\b\u0090\u0001\u0010\bR\u001a\u0010\u0091\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0091\u0001\u0010\u0006\u001a\u0005\b\u0092\u0001\u0010\bR\u001a\u0010\u0093\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0093\u0001\u0010\u0006\u001a\u0005\b\u0094\u0001\u0010\bR\u001a\u0010\u0095\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0095\u0001\u0010\u0006\u001a\u0005\b\u0096\u0001\u0010\bR\u001a\u0010\u0097\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0097\u0001\u0010\u0006\u001a\u0005\b\u0098\u0001\u0010\bR\u001a\u0010\u0099\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0099\u0001\u0010\u0006\u001a\u0005\b\u009a\u0001\u0010\bR\u001a\u0010\u009b\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u009b\u0001\u0010\u0006\u001a\u0005\b\u009c\u0001\u0010\bR\u001a\u0010\u009d\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u009d\u0001\u0010\u0006\u001a\u0005\b\u009e\u0001\u0010\bR\u001a\u0010\u009f\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u009f\u0001\u0010\u0006\u001a\u0005\b \u0001\u0010\bR\u001a\u0010¡\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b¡\u0001\u0010\u0006\u001a\u0005\b¢\u0001\u0010\bR\u001a\u0010£\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b£\u0001\u0010\u0006\u001a\u0005\b¤\u0001\u0010\bR\u001a\u0010¥\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b¥\u0001\u0010\u0006\u001a\u0005\b¦\u0001\u0010\bR\u001a\u0010§\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b§\u0001\u0010\u0006\u001a\u0005\b¨\u0001\u0010\bR\u001a\u0010©\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b©\u0001\u0010\u0006\u001a\u0005\bª\u0001\u0010\bR\u001a\u0010«\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b«\u0001\u0010\u0006\u001a\u0005\b¬\u0001\u0010\bR\u001a\u0010\u00ad\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u00ad\u0001\u0010\u0006\u001a\u0005\b®\u0001\u0010\bR\u001a\u0010¯\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b¯\u0001\u0010\u0006\u001a\u0005\b°\u0001\u0010\bR\u001a\u0010±\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b±\u0001\u0010\u0006\u001a\u0005\b²\u0001\u0010\bR\u001a\u0010³\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b³\u0001\u0010\u0006\u001a\u0005\b´\u0001\u0010\bR\u001a\u0010µ\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bµ\u0001\u0010\u0006\u001a\u0005\b¶\u0001\u0010\bR\u001a\u0010·\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b·\u0001\u0010\u0006\u001a\u0005\b¸\u0001\u0010\bR\u001a\u0010¹\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b¹\u0001\u0010\u0006\u001a\u0005\bº\u0001\u0010\bR\u001a\u0010»\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b»\u0001\u0010\u0006\u001a\u0005\b¼\u0001\u0010\bR\u001a\u0010½\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b½\u0001\u0010\u0006\u001a\u0005\b¾\u0001\u0010\bR\u001a\u0010¿\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b¿\u0001\u0010\u0006\u001a\u0005\bÀ\u0001\u0010\bR\u001a\u0010Á\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÁ\u0001\u0010\u0006\u001a\u0005\bÂ\u0001\u0010\bR\u001a\u0010Ã\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÃ\u0001\u0010\u0006\u001a\u0005\bÄ\u0001\u0010\bR\u001a\u0010Å\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÅ\u0001\u0010\u0006\u001a\u0005\bÆ\u0001\u0010\bR\u001a\u0010Ç\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÇ\u0001\u0010\u0006\u001a\u0005\bÈ\u0001\u0010\bR\u001a\u0010É\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÉ\u0001\u0010\u0006\u001a\u0005\bÊ\u0001\u0010\bR\u001a\u0010Ë\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bË\u0001\u0010\u0006\u001a\u0005\bÌ\u0001\u0010\bR\u001a\u0010Í\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÍ\u0001\u0010\u0006\u001a\u0005\bÎ\u0001\u0010\bR\u001a\u0010Ï\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÏ\u0001\u0010\u0006\u001a\u0005\bÐ\u0001\u0010\bR\u001a\u0010Ñ\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÑ\u0001\u0010\u0006\u001a\u0005\bÒ\u0001\u0010\bR\u001a\u0010Ó\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÓ\u0001\u0010\u0006\u001a\u0005\bÔ\u0001\u0010\bR\u001a\u0010Õ\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÕ\u0001\u0010\u0006\u001a\u0005\bÖ\u0001\u0010\bR\u001a\u0010×\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b×\u0001\u0010\u0006\u001a\u0005\bØ\u0001\u0010\bR\u001a\u0010Ù\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÙ\u0001\u0010\u0006\u001a\u0005\bÚ\u0001\u0010\bR\u001a\u0010Û\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÛ\u0001\u0010\u0006\u001a\u0005\bÜ\u0001\u0010\bR\u001a\u0010Ý\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÝ\u0001\u0010\u0006\u001a\u0005\bÞ\u0001\u0010\bR\u001a\u0010ß\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bß\u0001\u0010\u0006\u001a\u0005\bà\u0001\u0010\bR\u001a\u0010á\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bá\u0001\u0010\u0006\u001a\u0005\bâ\u0001\u0010\bR\u001a\u0010ã\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bã\u0001\u0010\u0006\u001a\u0005\bä\u0001\u0010\bR\u001a\u0010å\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bå\u0001\u0010\u0006\u001a\u0005\bæ\u0001\u0010\bR\u001a\u0010ç\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bç\u0001\u0010\u0006\u001a\u0005\bè\u0001\u0010\bR\u001a\u0010é\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bé\u0001\u0010\u0006\u001a\u0005\bê\u0001\u0010\bR\u001a\u0010ë\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bë\u0001\u0010\u0006\u001a\u0005\bì\u0001\u0010\bR\u001a\u0010í\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bí\u0001\u0010\u0006\u001a\u0005\bî\u0001\u0010\bR\u001a\u0010ï\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bï\u0001\u0010\u0006\u001a\u0005\bð\u0001\u0010\bR\u001a\u0010ñ\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bñ\u0001\u0010\u0006\u001a\u0005\bò\u0001\u0010\bR\u001a\u0010ó\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bó\u0001\u0010\u0006\u001a\u0005\bô\u0001\u0010\bR\u001a\u0010õ\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bõ\u0001\u0010\u0006\u001a\u0005\bö\u0001\u0010\bR\u001a\u0010÷\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b÷\u0001\u0010\u0006\u001a\u0005\bø\u0001\u0010\bR\u001a\u0010ù\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bù\u0001\u0010\u0006\u001a\u0005\bú\u0001\u0010\bR\u001a\u0010û\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bû\u0001\u0010\u0006\u001a\u0005\bü\u0001\u0010\bR\u001a\u0010ý\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bý\u0001\u0010\u0006\u001a\u0005\bþ\u0001\u0010\bR\u001a\u0010ÿ\u0001\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\bÿ\u0001\u0010\u0006\u001a\u0005\b\u0080\u0002\u0010\bR\u001a\u0010\u0081\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0081\u0002\u0010\u0006\u001a\u0005\b\u0082\u0002\u0010\bR\u001a\u0010\u0083\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0083\u0002\u0010\u0006\u001a\u0005\b\u0084\u0002\u0010\bR\u001a\u0010\u0085\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0085\u0002\u0010\u0006\u001a\u0005\b\u0086\u0002\u0010\bR\u001a\u0010\u0087\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0087\u0002\u0010\u0006\u001a\u0005\b\u0088\u0002\u0010\bR\u001a\u0010\u0089\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0089\u0002\u0010\u0006\u001a\u0005\b\u008a\u0002\u0010\bR\u001a\u0010\u008b\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u008b\u0002\u0010\u0006\u001a\u0005\b\u008c\u0002\u0010\bR\u001a\u0010\u008d\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u008d\u0002\u0010\u0006\u001a\u0005\b\u008e\u0002\u0010\bR\u001a\u0010\u008f\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u008f\u0002\u0010\u0006\u001a\u0005\b\u0090\u0002\u0010\bR\u001a\u0010\u0091\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0091\u0002\u0010\u0006\u001a\u0005\b\u0092\u0002\u0010\bR\u001a\u0010\u0093\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0093\u0002\u0010\u0006\u001a\u0005\b\u0094\u0002\u0010\bR\u001a\u0010\u0095\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0095\u0002\u0010\u0006\u001a\u0005\b\u0096\u0002\u0010\bR\u001a\u0010\u0097\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0097\u0002\u0010\u0006\u001a\u0005\b\u0098\u0002\u0010\bR\u001a\u0010\u0099\u0002\u001a\u00020\u00048\u0006¢\u0006\u000e\n\u0005\b\u0099\u0002\u0010\u0006\u001a\u0005\b\u009a\u0002\u0010\bR\u001d\u0010\u009c\u0002\u001a\u00030\u009b\u00028\u0006¢\u0006\u0010\n\u0006\b\u009c\u0002\u0010\u009d\u0002\u001a\u0006\b\u009e\u0002\u0010\u009f\u0002¨\u0006 \u0002"}, d2 = {"Lcom/medium/android/graphql/type/Mutation$Companion;", "", "<init>", "()V", "Lmx1;", "__logClientEvents_input", "Lmx1;", "get__logClientEvents_input", "()Lmx1;", "__logExperimentExposure_input", "get__logExperimentExposure_input", "__logGateExposure_input", "get__logGateExposure_input", "__updateAndroidMembershipPlan_input", "get__updateAndroidMembershipPlan_input", "__registerMobileMembershipPurchase_input", "get__registerMobileMembershipPurchase_input", "__setPostDistributionSettings_input", "get__setPostDistributionSettings_input", "__clap_numClaps", "get__clap_numClaps", "__clap_targetPostId", "get__clap_targetPostId", "__clap_userId", "get__clap_userId", "__deletePost_targetPostId", "get__deletePost_targetPostId", "__hideRepost_input", "get__hideRepost_input", "__lockResponsesOnPost_postId", "get__lockResponsesOnPost_postId", "__reportRepost_input", "get__reportRepost_input", "__repost_targetPostId", "get__repost_targetPostId", "__repost_note", "get__repost_note", "__setPostAllowCuration_allowCuration", "get__setPostAllowCuration_allowCuration", "__setPostAllowCuration_targetPostId", "get__setPostAllowCuration_targetPostId", "__setPostAllowResponses_allowResponses", "get__setPostAllowResponses_allowResponses", "__setPostAllowResponses_targetPostId", "get__setPostAllowResponses_targetPostId", "__setPostAudience_targetPostId", "get__setPostAudience_targetPostId", "__setPostAudience_visibility", "get__setPostAudience_visibility", "__setPostPinnedOnCreatorProfile_input", "get__setPostPinnedOnCreatorProfile_input", "__setPostPublished_input", "get__setPostPublished_input", "__setPostTags_tagNames", "get__setPostTags_tagNames", "__setPostTags_targetPostId", "get__setPostTags_targetPostId", "__stageUpdatePostMetadata_input", "get__stageUpdatePostMetadata_input", "__undoRepost_targetPostId", "get__undoRepost_targetPostId", "__unhideRepost_input", "get__unhideRepost_input", "__updateRepost_input", "get__updateRepost_input", "__setPostPublicationFeatured_input", "get__setPostPublicationFeatured_input", "__batchFollowPublications_input", "get__batchFollowPublications_input", "__submitToPublication_input", "get__submitToPublication_input", "__updateSubmissionStatus_input", "get__updateSubmissionStatus_input", "__sendExplicitSignal_input", "get__sendExplicitSignal_input", "__updateFollowedEntityViewedAt_input", "get__updateFollowedEntityViewedAt_input", "__addToPredefinedCatalog_operation", "get__addToPredefinedCatalog_operation", "__addToPredefinedCatalog_type", "get__addToPredefinedCatalog_type", "__blockUser_targetUserId", "get__blockUser_targetUserId", "__blockUser_userId", "get__blockUser_userId", "__clapCatalog_catalogId", "get__clapCatalog_catalogId", "__clapCatalog_numClaps", "get__clapCatalog_numClaps", "__createCatalog_attributes", "get__createCatalog_attributes", "__createMediaResource_url", "get__createMediaResource_url", "__createQuote_endOffset", "get__createQuote_endOffset", "__createQuote_quoteType", "get__createQuote_quoteType", "__createQuote_startOffset", "get__createQuote_startOffset", "__createQuote_targetParagraphNames", "get__createQuote_targetParagraphNames", "__createQuote_targetPostId", "get__createQuote_targetPostId", "__createQuote_targetPostVersionId", "get__createQuote_targetPostVersionId", "__deleteCatalog_catalogId", "get__deleteCatalog_catalogId", "__deleteQuote_targetPostId", "get__deleteQuote_targetPostId", "__deleteQuote_targetQuoteId", "get__deleteQuote_targetQuoteId", "__editCatalogItemAnnotation_annotation", "get__editCatalogItemAnnotation_annotation", "__editCatalogItemAnnotation_catalogId", "get__editCatalogItemAnnotation_catalogId", "__editCatalogItemAnnotation_catalogItemId", "get__editCatalogItemAnnotation_catalogItemId", "__editCatalogItems_catalogId", "get__editCatalogItems_catalogId", "__editCatalogItems_operations", "get__editCatalogItems_operations", "__editCatalogItems_version", "get__editCatalogItems_version", "__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_shouldSubscribeCurrentUser", "get__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_shouldSubscribeCurrentUser", "__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_userId", "get__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_userId", "__flagCatalog_catalogId", "get__flagCatalog_catalogId", "__followCatalog_catalogId", "get__followCatalog_catalogId", "__followCollection_targetCollectionId", "get__followCollection_targetCollectionId", "__followUser_targetUserId", "get__followUser_targetUserId", "__hideCatalogResponseOnParent_catalogResponseId", "get__hideCatalogResponseOnParent_catalogResponseId", "__hideCatalogResponseOnParent_parentCatalogId", "get__hideCatalogResponseOnParent_parentCatalogId", "__hidePostResponseOnParentPost_parentPostId", "get__hidePostResponseOnParentPost_parentPostId", "__hidePostResponseOnParentPost_postResponseId", "get__hidePostResponseOnParentPost_postResponseId", "__linkMobileDevice_token", "get__linkMobileDevice_token", "__muteCollection_targetCollectionId", "get__muteCollection_targetCollectionId", "__muteUser_targetUserId", "get__muteUser_targetUserId", "__publishCatalogResponse_deltas", "get__publishCatalogResponse_deltas", "__publishCatalogResponse_inResponseToCatalogId", "get__publishCatalogResponse_inResponseToCatalogId", "__publishCatalogResponse_responseDistribution", "get__publishCatalogResponse_responseDistribution", "__publishPostThreadedResponse_deltas", "get__publishPostThreadedResponse_deltas", "__publishPostThreadedResponse_inResponseToPostId", "get__publishPostThreadedResponse_inResponseToPostId", "__publishPostThreadedResponse_inResponseToQuoteId", "get__publishPostThreadedResponse_inResponseToQuoteId", "__publishPostThreadedResponse_responseDistribution", "get__publishPostThreadedResponse_responseDistribution", "__reportAndMaybeBlockUser_alsoBlockUser", "get__reportAndMaybeBlockUser_alsoBlockUser", "__reportAndMaybeBlockUser_reason", "get__reportAndMaybeBlockUser_reason", "__reportAndMaybeBlockUser_targetUserId", "get__reportAndMaybeBlockUser_targetUserId", "__reportAndMaybeBlockUser_userId", "get__reportAndMaybeBlockUser_userId", "__reportStoryAndMaybeBlockAuthor_alsoBlockAuthor", "get__reportStoryAndMaybeBlockAuthor_alsoBlockAuthor", "__reportStoryAndMaybeBlockAuthor_reason", "get__reportStoryAndMaybeBlockAuthor_reason", "__reportStoryAndMaybeBlockAuthor_targetAuthorId", "get__reportStoryAndMaybeBlockAuthor_targetAuthorId", "__reportStoryAndMaybeBlockAuthor_targetPostId", "get__reportStoryAndMaybeBlockAuthor_targetPostId", "__sendAcctAuthEmail_captchaValue", "get__sendAcctAuthEmail_captchaValue", "__sendAcctAuthEmail_email", "get__sendAcctAuthEmail_email", "__sendAcctAuthEmail_fullName", "get__sendAcctAuthEmail_fullName", "__sendAcctAuthEmail_operation", "get__sendAcctAuthEmail_operation", "__sendAcctAuthEmail_redirect", "get__sendAcctAuthEmail_redirect", "__sendAcctAuthEmail_type", "get__sendAcctAuthEmail_type", "__sendAcctAuthEmail_rememberMe", "get__sendAcctAuthEmail_rememberMe", "__sendAcctAuthEmailByUserId_captchaValue", "get__sendAcctAuthEmailByUserId_captchaValue", "__sendAcctAuthEmailByUserId_redirect", "get__sendAcctAuthEmailByUserId_redirect", "__sendAcctAuthEmailByUserId_userId", "get__sendAcctAuthEmailByUserId_userId", "__showCatalogResponseOnParent_catalogResponseId", "get__showCatalogResponseOnParent_catalogResponseId", "__showCatalogResponseOnParent_parentCatalogId", "get__showCatalogResponseOnParent_parentCatalogId", "__subscribeNewsletterV3_newsletterV3Id", "get__subscribeNewsletterV3_newsletterV3Id", "__subscribeNewsletterV3_shouldRecordConsent", "get__subscribeNewsletterV3_shouldRecordConsent", "__unblockUser_targetUserId", "get__unblockUser_targetUserId", "__unblockUser_userId", "get__unblockUser_userId", "__unfollowCatalog_catalogId", "get__unfollowCatalog_catalogId", "__unfollowCollection_targetCollectionId", "get__unfollowCollection_targetCollectionId", "__unfollowUser_targetUserId", "get__unfollowUser_targetUserId", "__unhidePostResponseOnParentPost_parentPostId", "get__unhidePostResponseOnParentPost_parentPostId", "__unhidePostResponseOnParentPost_postResponseId", "get__unhidePostResponseOnParentPost_postResponseId", "__unlockResponsesOnPost_postId", "get__unlockResponsesOnPost_postId", "__unmuteCollection_targetCollectionId", "get__unmuteCollection_targetCollectionId", "__unmuteUser_targetUserId", "get__unmuteUser_targetUserId", "__unsubscribeNewsletterV3_newsletterV3Id", "get__unsubscribeNewsletterV3_newsletterV3Id", "__updateCatalog_attributes", "get__updateCatalog_attributes", "__updateCatalog_catalogId", "get__updateCatalog_catalogId", "__updatePostResponse_deltas", "get__updatePostResponse_deltas", "__updatePostResponse_latestRev", "get__updatePostResponse_latestRev", "__updatePostResponse_responseId", "get__updatePostResponse_responseId", "__userCompleteProfile_bio", "get__userCompleteProfile_bio", "__userCompleteProfile_imageId", "get__userCompleteProfile_imageId", "__userCompleteProfile_name", "get__userCompleteProfile_name", "__userCompleteProfile_userId", "get__userCompleteProfile_userId", "__userDismissFlag_flag", "get__userDismissFlag_flag", "__userDismissFlag_userId", "get__userDismissFlag_userId", "__verifyLoginCode_loginCode", "get__verifyLoginCode_loginCode", "__searchClickEvent_indexName", "get__searchClickEvent_indexName", "__searchClickEvent_objectIds", "get__searchClickEvent_objectIds", "__searchClickEvent_positions", "get__searchClickEvent_positions", "__searchClickEvent_queryId", "get__searchClickEvent_queryId", "__createPostShareKey_postId", "get__createPostShareKey_postId", "__followTag_tagSlug", "get__followTag_tagSlug", "__followTag_userId", "get__followTag_userId", "__followTags_input", "get__followTags_input", "__unfollowTag_tagSlug", "get__unfollowTag_tagSlug", "__unfollowTag_userId", "get__unfollowTag_userId", "__unfollowTags_input", "get__unfollowTags_input", "__batchFollowUsers_input", "get__batchFollowUsers_input", "__setUserPronouns_input", "get__setUserPronouns_input", "__uploadContacts_input", "get__uploadContacts_input", "__updateUserPreferences_input", "get__updateUserPreferences_input", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return Mutation.type;
        }

        public final mx1 get__addToPredefinedCatalog_operation() {
            return Mutation.__addToPredefinedCatalog_operation;
        }

        public final mx1 get__addToPredefinedCatalog_type() {
            return Mutation.__addToPredefinedCatalog_type;
        }

        public final mx1 get__batchFollowPublications_input() {
            return Mutation.__batchFollowPublications_input;
        }

        public final mx1 get__batchFollowUsers_input() {
            return Mutation.__batchFollowUsers_input;
        }

        public final mx1 get__blockUser_targetUserId() {
            return Mutation.__blockUser_targetUserId;
        }

        public final mx1 get__blockUser_userId() {
            return Mutation.__blockUser_userId;
        }

        public final mx1 get__clapCatalog_catalogId() {
            return Mutation.__clapCatalog_catalogId;
        }

        public final mx1 get__clapCatalog_numClaps() {
            return Mutation.__clapCatalog_numClaps;
        }

        public final mx1 get__clap_numClaps() {
            return Mutation.__clap_numClaps;
        }

        public final mx1 get__clap_targetPostId() {
            return Mutation.__clap_targetPostId;
        }

        public final mx1 get__clap_userId() {
            return Mutation.__clap_userId;
        }

        public final mx1 get__createCatalog_attributes() {
            return Mutation.__createCatalog_attributes;
        }

        public final mx1 get__createMediaResource_url() {
            return Mutation.__createMediaResource_url;
        }

        public final mx1 get__createPostShareKey_postId() {
            return Mutation.__createPostShareKey_postId;
        }

        public final mx1 get__createQuote_endOffset() {
            return Mutation.__createQuote_endOffset;
        }

        public final mx1 get__createQuote_quoteType() {
            return Mutation.__createQuote_quoteType;
        }

        public final mx1 get__createQuote_startOffset() {
            return Mutation.__createQuote_startOffset;
        }

        public final mx1 get__createQuote_targetParagraphNames() {
            return Mutation.__createQuote_targetParagraphNames;
        }

        public final mx1 get__createQuote_targetPostId() {
            return Mutation.__createQuote_targetPostId;
        }

        public final mx1 get__createQuote_targetPostVersionId() {
            return Mutation.__createQuote_targetPostVersionId;
        }

        public final mx1 get__deleteCatalog_catalogId() {
            return Mutation.__deleteCatalog_catalogId;
        }

        public final mx1 get__deletePost_targetPostId() {
            return Mutation.__deletePost_targetPostId;
        }

        public final mx1 get__deleteQuote_targetPostId() {
            return Mutation.__deleteQuote_targetPostId;
        }

        public final mx1 get__deleteQuote_targetQuoteId() {
            return Mutation.__deleteQuote_targetQuoteId;
        }

        public final mx1 get__editCatalogItemAnnotation_annotation() {
            return Mutation.__editCatalogItemAnnotation_annotation;
        }

        public final mx1 get__editCatalogItemAnnotation_catalogId() {
            return Mutation.__editCatalogItemAnnotation_catalogId;
        }

        public final mx1 get__editCatalogItemAnnotation_catalogItemId() {
            return Mutation.__editCatalogItemAnnotation_catalogItemId;
        }

        public final mx1 get__editCatalogItems_catalogId() {
            return Mutation.__editCatalogItems_catalogId;
        }

        public final mx1 get__editCatalogItems_operations() {
            return Mutation.__editCatalogItems_operations;
        }

        public final mx1 get__editCatalogItems_version() {
            return Mutation.__editCatalogItems_version;
        }

        public final mx1 get__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_shouldSubscribeCurrentUser() {
            return Mutation.__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_shouldSubscribeCurrentUser;
        }

        public final mx1 get__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_userId() {
            return Mutation.__fetchOrLazilyCreateNewsletterV3AndMaybeSubscribe_userId;
        }

        public final mx1 get__flagCatalog_catalogId() {
            return Mutation.__flagCatalog_catalogId;
        }

        public final mx1 get__followCatalog_catalogId() {
            return Mutation.__followCatalog_catalogId;
        }

        public final mx1 get__followCollection_targetCollectionId() {
            return Mutation.__followCollection_targetCollectionId;
        }

        public final mx1 get__followTag_tagSlug() {
            return Mutation.__followTag_tagSlug;
        }

        public final mx1 get__followTag_userId() {
            return Mutation.__followTag_userId;
        }

        public final mx1 get__followTags_input() {
            return Mutation.__followTags_input;
        }

        public final mx1 get__followUser_targetUserId() {
            return Mutation.__followUser_targetUserId;
        }

        public final mx1 get__hideCatalogResponseOnParent_catalogResponseId() {
            return Mutation.__hideCatalogResponseOnParent_catalogResponseId;
        }

        public final mx1 get__hideCatalogResponseOnParent_parentCatalogId() {
            return Mutation.__hideCatalogResponseOnParent_parentCatalogId;
        }

        public final mx1 get__hidePostResponseOnParentPost_parentPostId() {
            return Mutation.__hidePostResponseOnParentPost_parentPostId;
        }

        public final mx1 get__hidePostResponseOnParentPost_postResponseId() {
            return Mutation.__hidePostResponseOnParentPost_postResponseId;
        }

        public final mx1 get__hideRepost_input() {
            return Mutation.__hideRepost_input;
        }

        public final mx1 get__linkMobileDevice_token() {
            return Mutation.__linkMobileDevice_token;
        }

        public final mx1 get__lockResponsesOnPost_postId() {
            return Mutation.__lockResponsesOnPost_postId;
        }

        public final mx1 get__logClientEvents_input() {
            return Mutation.__logClientEvents_input;
        }

        public final mx1 get__logExperimentExposure_input() {
            return Mutation.__logExperimentExposure_input;
        }

        public final mx1 get__logGateExposure_input() {
            return Mutation.__logGateExposure_input;
        }

        public final mx1 get__muteCollection_targetCollectionId() {
            return Mutation.__muteCollection_targetCollectionId;
        }

        public final mx1 get__muteUser_targetUserId() {
            return Mutation.__muteUser_targetUserId;
        }

        public final mx1 get__publishCatalogResponse_deltas() {
            return Mutation.__publishCatalogResponse_deltas;
        }

        public final mx1 get__publishCatalogResponse_inResponseToCatalogId() {
            return Mutation.__publishCatalogResponse_inResponseToCatalogId;
        }

        public final mx1 get__publishCatalogResponse_responseDistribution() {
            return Mutation.__publishCatalogResponse_responseDistribution;
        }

        public final mx1 get__publishPostThreadedResponse_deltas() {
            return Mutation.__publishPostThreadedResponse_deltas;
        }

        public final mx1 get__publishPostThreadedResponse_inResponseToPostId() {
            return Mutation.__publishPostThreadedResponse_inResponseToPostId;
        }

        public final mx1 get__publishPostThreadedResponse_inResponseToQuoteId() {
            return Mutation.__publishPostThreadedResponse_inResponseToQuoteId;
        }

        public final mx1 get__publishPostThreadedResponse_responseDistribution() {
            return Mutation.__publishPostThreadedResponse_responseDistribution;
        }

        public final mx1 get__registerMobileMembershipPurchase_input() {
            return Mutation.__registerMobileMembershipPurchase_input;
        }

        public final mx1 get__reportAndMaybeBlockUser_alsoBlockUser() {
            return Mutation.__reportAndMaybeBlockUser_alsoBlockUser;
        }

        public final mx1 get__reportAndMaybeBlockUser_reason() {
            return Mutation.__reportAndMaybeBlockUser_reason;
        }

        public final mx1 get__reportAndMaybeBlockUser_targetUserId() {
            return Mutation.__reportAndMaybeBlockUser_targetUserId;
        }

        public final mx1 get__reportAndMaybeBlockUser_userId() {
            return Mutation.__reportAndMaybeBlockUser_userId;
        }

        public final mx1 get__reportRepost_input() {
            return Mutation.__reportRepost_input;
        }

        public final mx1 get__reportStoryAndMaybeBlockAuthor_alsoBlockAuthor() {
            return Mutation.__reportStoryAndMaybeBlockAuthor_alsoBlockAuthor;
        }

        public final mx1 get__reportStoryAndMaybeBlockAuthor_reason() {
            return Mutation.__reportStoryAndMaybeBlockAuthor_reason;
        }

        public final mx1 get__reportStoryAndMaybeBlockAuthor_targetAuthorId() {
            return Mutation.__reportStoryAndMaybeBlockAuthor_targetAuthorId;
        }

        public final mx1 get__reportStoryAndMaybeBlockAuthor_targetPostId() {
            return Mutation.__reportStoryAndMaybeBlockAuthor_targetPostId;
        }

        public final mx1 get__repost_note() {
            return Mutation.__repost_note;
        }

        public final mx1 get__repost_targetPostId() {
            return Mutation.__repost_targetPostId;
        }

        public final mx1 get__searchClickEvent_indexName() {
            return Mutation.__searchClickEvent_indexName;
        }

        public final mx1 get__searchClickEvent_objectIds() {
            return Mutation.__searchClickEvent_objectIds;
        }

        public final mx1 get__searchClickEvent_positions() {
            return Mutation.__searchClickEvent_positions;
        }

        public final mx1 get__searchClickEvent_queryId() {
            return Mutation.__searchClickEvent_queryId;
        }

        public final mx1 get__sendAcctAuthEmailByUserId_captchaValue() {
            return Mutation.__sendAcctAuthEmailByUserId_captchaValue;
        }

        public final mx1 get__sendAcctAuthEmailByUserId_redirect() {
            return Mutation.__sendAcctAuthEmailByUserId_redirect;
        }

        public final mx1 get__sendAcctAuthEmailByUserId_userId() {
            return Mutation.__sendAcctAuthEmailByUserId_userId;
        }

        public final mx1 get__sendAcctAuthEmail_captchaValue() {
            return Mutation.__sendAcctAuthEmail_captchaValue;
        }

        public final mx1 get__sendAcctAuthEmail_email() {
            return Mutation.__sendAcctAuthEmail_email;
        }

        public final mx1 get__sendAcctAuthEmail_fullName() {
            return Mutation.__sendAcctAuthEmail_fullName;
        }

        public final mx1 get__sendAcctAuthEmail_operation() {
            return Mutation.__sendAcctAuthEmail_operation;
        }

        public final mx1 get__sendAcctAuthEmail_redirect() {
            return Mutation.__sendAcctAuthEmail_redirect;
        }

        public final mx1 get__sendAcctAuthEmail_rememberMe() {
            return Mutation.__sendAcctAuthEmail_rememberMe;
        }

        public final mx1 get__sendAcctAuthEmail_type() {
            return Mutation.__sendAcctAuthEmail_type;
        }

        public final mx1 get__sendExplicitSignal_input() {
            return Mutation.__sendExplicitSignal_input;
        }

        public final mx1 get__setPostAllowCuration_allowCuration() {
            return Mutation.__setPostAllowCuration_allowCuration;
        }

        public final mx1 get__setPostAllowCuration_targetPostId() {
            return Mutation.__setPostAllowCuration_targetPostId;
        }

        public final mx1 get__setPostAllowResponses_allowResponses() {
            return Mutation.__setPostAllowResponses_allowResponses;
        }

        public final mx1 get__setPostAllowResponses_targetPostId() {
            return Mutation.__setPostAllowResponses_targetPostId;
        }

        public final mx1 get__setPostAudience_targetPostId() {
            return Mutation.__setPostAudience_targetPostId;
        }

        public final mx1 get__setPostAudience_visibility() {
            return Mutation.__setPostAudience_visibility;
        }

        public final mx1 get__setPostDistributionSettings_input() {
            return Mutation.__setPostDistributionSettings_input;
        }

        public final mx1 get__setPostPinnedOnCreatorProfile_input() {
            return Mutation.__setPostPinnedOnCreatorProfile_input;
        }

        public final mx1 get__setPostPublicationFeatured_input() {
            return Mutation.__setPostPublicationFeatured_input;
        }

        public final mx1 get__setPostPublished_input() {
            return Mutation.__setPostPublished_input;
        }

        public final mx1 get__setPostTags_tagNames() {
            return Mutation.__setPostTags_tagNames;
        }

        public final mx1 get__setPostTags_targetPostId() {
            return Mutation.__setPostTags_targetPostId;
        }

        public final mx1 get__setUserPronouns_input() {
            return Mutation.__setUserPronouns_input;
        }

        public final mx1 get__showCatalogResponseOnParent_catalogResponseId() {
            return Mutation.__showCatalogResponseOnParent_catalogResponseId;
        }

        public final mx1 get__showCatalogResponseOnParent_parentCatalogId() {
            return Mutation.__showCatalogResponseOnParent_parentCatalogId;
        }

        public final mx1 get__stageUpdatePostMetadata_input() {
            return Mutation.__stageUpdatePostMetadata_input;
        }

        public final mx1 get__submitToPublication_input() {
            return Mutation.__submitToPublication_input;
        }

        public final mx1 get__subscribeNewsletterV3_newsletterV3Id() {
            return Mutation.__subscribeNewsletterV3_newsletterV3Id;
        }

        public final mx1 get__subscribeNewsletterV3_shouldRecordConsent() {
            return Mutation.__subscribeNewsletterV3_shouldRecordConsent;
        }

        public final mx1 get__unblockUser_targetUserId() {
            return Mutation.__unblockUser_targetUserId;
        }

        public final mx1 get__unblockUser_userId() {
            return Mutation.__unblockUser_userId;
        }

        public final mx1 get__undoRepost_targetPostId() {
            return Mutation.__undoRepost_targetPostId;
        }

        public final mx1 get__unfollowCatalog_catalogId() {
            return Mutation.__unfollowCatalog_catalogId;
        }

        public final mx1 get__unfollowCollection_targetCollectionId() {
            return Mutation.__unfollowCollection_targetCollectionId;
        }

        public final mx1 get__unfollowTag_tagSlug() {
            return Mutation.__unfollowTag_tagSlug;
        }

        public final mx1 get__unfollowTag_userId() {
            return Mutation.__unfollowTag_userId;
        }

        public final mx1 get__unfollowTags_input() {
            return Mutation.__unfollowTags_input;
        }

        public final mx1 get__unfollowUser_targetUserId() {
            return Mutation.__unfollowUser_targetUserId;
        }

        public final mx1 get__unhidePostResponseOnParentPost_parentPostId() {
            return Mutation.__unhidePostResponseOnParentPost_parentPostId;
        }

        public final mx1 get__unhidePostResponseOnParentPost_postResponseId() {
            return Mutation.__unhidePostResponseOnParentPost_postResponseId;
        }

        public final mx1 get__unhideRepost_input() {
            return Mutation.__unhideRepost_input;
        }

        public final mx1 get__unlockResponsesOnPost_postId() {
            return Mutation.__unlockResponsesOnPost_postId;
        }

        public final mx1 get__unmuteCollection_targetCollectionId() {
            return Mutation.__unmuteCollection_targetCollectionId;
        }

        public final mx1 get__unmuteUser_targetUserId() {
            return Mutation.__unmuteUser_targetUserId;
        }

        public final mx1 get__unsubscribeNewsletterV3_newsletterV3Id() {
            return Mutation.__unsubscribeNewsletterV3_newsletterV3Id;
        }

        public final mx1 get__updateAndroidMembershipPlan_input() {
            return Mutation.__updateAndroidMembershipPlan_input;
        }

        public final mx1 get__updateCatalog_attributes() {
            return Mutation.__updateCatalog_attributes;
        }

        public final mx1 get__updateCatalog_catalogId() {
            return Mutation.__updateCatalog_catalogId;
        }

        public final mx1 get__updateFollowedEntityViewedAt_input() {
            return Mutation.__updateFollowedEntityViewedAt_input;
        }

        public final mx1 get__updatePostResponse_deltas() {
            return Mutation.__updatePostResponse_deltas;
        }

        public final mx1 get__updatePostResponse_latestRev() {
            return Mutation.__updatePostResponse_latestRev;
        }

        public final mx1 get__updatePostResponse_responseId() {
            return Mutation.__updatePostResponse_responseId;
        }

        public final mx1 get__updateRepost_input() {
            return Mutation.__updateRepost_input;
        }

        public final mx1 get__updateSubmissionStatus_input() {
            return Mutation.__updateSubmissionStatus_input;
        }

        public final mx1 get__updateUserPreferences_input() {
            return Mutation.__updateUserPreferences_input;
        }

        public final mx1 get__uploadContacts_input() {
            return Mutation.__uploadContacts_input;
        }

        public final mx1 get__userCompleteProfile_bio() {
            return Mutation.__userCompleteProfile_bio;
        }

        public final mx1 get__userCompleteProfile_imageId() {
            return Mutation.__userCompleteProfile_imageId;
        }

        public final mx1 get__userCompleteProfile_name() {
            return Mutation.__userCompleteProfile_name;
        }

        public final mx1 get__userCompleteProfile_userId() {
            return Mutation.__userCompleteProfile_userId;
        }

        public final mx1 get__userDismissFlag_flag() {
            return Mutation.__userDismissFlag_flag;
        }

        public final mx1 get__userDismissFlag_userId() {
            return Mutation.__userDismissFlag_userId;
        }

        public final mx1 get__verifyLoginCode_loginCode() {
            return Mutation.__verifyLoginCode_loginCode;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
