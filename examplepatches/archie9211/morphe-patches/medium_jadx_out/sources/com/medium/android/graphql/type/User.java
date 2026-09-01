package com.medium.android.graphql.type;

import defpackage.d46;
import defpackage.ey3;
import defpackage.gy2;
import defpackage.mx1;
import defpackage.sm8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/graphql/type/User;", "", "<init>", "()V", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class User {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private static final mx1 __digestsConnection_first = new mx1("first", false);
    private static final mx1 __digestsConnection_after = new mx1("after", false);
    private static final mx1 __digestById_id = new mx1("id", false);
    private static final mx1 __matchedContactsConnection_first = new mx1("first", false);
    private static final mx1 __matchedContactsConnection_after = new mx1("after", false);
    private static final mx1 __matchedContactsConnection_includeFollowedUsers = new mx1("includeFollowedUsers", false);
    private static final mx1 __postsConnection_first = new mx1("first", false);
    private static final mx1 __postsConnection_after = new mx1("after", false);
    private static final mx1 __postsConnection_orderBy = new mx1("orderBy", false);
    private static final mx1 __postsConnection_filter = new mx1("filter", false);
    private static final mx1 __followedTags_paging = new mx1("paging", false);
    private static final mx1 __followersUserConnection_paging = new mx1("paging", false);
    private static final mx1 __followingCollectionConnection_paging = new mx1("paging", false);
    private static final mx1 __followingUserConnection_paging = new mx1("paging", false);
    private static final mx1 __highlightsStreamConnection_paging = new mx1("paging", false);
    private static final mx1 __homepagePostsConnection_paging = new mx1("paging", false);
    private static final mx1 __latestPostsConnection_includeDeleted = new mx1("includeDeleted", false);
    private static final mx1 __latestPostsConnection_includeResponses = new mx1("includeResponses", false);
    private static final mx1 __latestPostsConnection_includeSuspended = new mx1("includeSuspended", false);
    private static final mx1 __latestPostsConnection_paging = new mx1("paging", false);
    private static final mx1 __latestPostsConnection_type = new mx1("type", false);
    private static final mx1 __mutedCollectionConnection_paging = new mx1("paging", false);
    private static final mx1 __mutedUserConnection_paging = new mx1("paging", false);
    private static final mx1 __popularPosts_input = new mx1("input", false);
    private static final mx1 __postsAggregateTimeseriesStats_input = new mx1("input", false);
    private static final sm8 type = new sm8("User", d46.Q("id"), ey3.a);

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b4\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\t\u0010\u0006\u001a\u0004\b\n\u0010\bR\u0017\u0010\u000b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0006\u001a\u0004\b\f\u0010\bR\u0017\u0010\r\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\r\u0010\u0006\u001a\u0004\b\u000e\u0010\bR\u0017\u0010\u000f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0006\u001a\u0004\b\u0010\u0010\bR\u0017\u0010\u0011\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0006\u001a\u0004\b\u0012\u0010\bR\u0017\u0010\u0013\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0013\u0010\u0006\u001a\u0004\b\u0014\u0010\bR\u0017\u0010\u0015\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0006\u001a\u0004\b\u0016\u0010\bR\u0017\u0010\u0017\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0017\u0010\u0006\u001a\u0004\b\u0018\u0010\bR\u0017\u0010\u0019\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u0006\u001a\u0004\b\u001a\u0010\bR\u0017\u0010\u001b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001b\u0010\u0006\u001a\u0004\b\u001c\u0010\bR\u0017\u0010\u001d\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u0006\u001a\u0004\b\u001e\u0010\bR\u0017\u0010\u001f\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001f\u0010\u0006\u001a\u0004\b \u0010\bR\u0017\u0010!\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b!\u0010\u0006\u001a\u0004\b\"\u0010\bR\u0017\u0010#\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b#\u0010\u0006\u001a\u0004\b$\u0010\bR\u0017\u0010%\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b%\u0010\u0006\u001a\u0004\b&\u0010\bR\u0017\u0010'\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b'\u0010\u0006\u001a\u0004\b(\u0010\bR\u0017\u0010)\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b)\u0010\u0006\u001a\u0004\b*\u0010\bR\u0017\u0010+\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b+\u0010\u0006\u001a\u0004\b,\u0010\bR\u0017\u0010-\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b-\u0010\u0006\u001a\u0004\b.\u0010\bR\u0017\u0010/\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b/\u0010\u0006\u001a\u0004\b0\u0010\bR\u0017\u00101\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b1\u0010\u0006\u001a\u0004\b2\u0010\bR\u0017\u00103\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b3\u0010\u0006\u001a\u0004\b4\u0010\bR\u0017\u00105\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b5\u0010\u0006\u001a\u0004\b6\u0010\bR\u0017\u00107\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b7\u0010\u0006\u001a\u0004\b8\u0010\bR\u0017\u0010:\u001a\u0002098\u0006¢\u0006\f\n\u0004\b:\u0010;\u001a\u0004\b<\u0010=¨\u0006>"}, d2 = {"Lcom/medium/android/graphql/type/User$Companion;", "", "<init>", "()V", "Lmx1;", "__digestsConnection_first", "Lmx1;", "get__digestsConnection_first", "()Lmx1;", "__digestsConnection_after", "get__digestsConnection_after", "__digestById_id", "get__digestById_id", "__matchedContactsConnection_first", "get__matchedContactsConnection_first", "__matchedContactsConnection_after", "get__matchedContactsConnection_after", "__matchedContactsConnection_includeFollowedUsers", "get__matchedContactsConnection_includeFollowedUsers", "__postsConnection_first", "get__postsConnection_first", "__postsConnection_after", "get__postsConnection_after", "__postsConnection_orderBy", "get__postsConnection_orderBy", "__postsConnection_filter", "get__postsConnection_filter", "__followedTags_paging", "get__followedTags_paging", "__followersUserConnection_paging", "get__followersUserConnection_paging", "__followingCollectionConnection_paging", "get__followingCollectionConnection_paging", "__followingUserConnection_paging", "get__followingUserConnection_paging", "__highlightsStreamConnection_paging", "get__highlightsStreamConnection_paging", "__homepagePostsConnection_paging", "get__homepagePostsConnection_paging", "__latestPostsConnection_includeDeleted", "get__latestPostsConnection_includeDeleted", "__latestPostsConnection_includeResponses", "get__latestPostsConnection_includeResponses", "__latestPostsConnection_includeSuspended", "get__latestPostsConnection_includeSuspended", "__latestPostsConnection_paging", "get__latestPostsConnection_paging", "__latestPostsConnection_type", "get__latestPostsConnection_type", "__mutedCollectionConnection_paging", "get__mutedCollectionConnection_paging", "__mutedUserConnection_paging", "get__mutedUserConnection_paging", "__popularPosts_input", "get__popularPosts_input", "__postsAggregateTimeseriesStats_input", "get__postsAggregateTimeseriesStats_input", "Lsm8;", "type", "Lsm8;", "getType", "()Lsm8;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final sm8 getType() {
            return User.type;
        }

        public final mx1 get__digestById_id() {
            return User.__digestById_id;
        }

        public final mx1 get__digestsConnection_after() {
            return User.__digestsConnection_after;
        }

        public final mx1 get__digestsConnection_first() {
            return User.__digestsConnection_first;
        }

        public final mx1 get__followedTags_paging() {
            return User.__followedTags_paging;
        }

        public final mx1 get__followersUserConnection_paging() {
            return User.__followersUserConnection_paging;
        }

        public final mx1 get__followingCollectionConnection_paging() {
            return User.__followingCollectionConnection_paging;
        }

        public final mx1 get__followingUserConnection_paging() {
            return User.__followingUserConnection_paging;
        }

        public final mx1 get__highlightsStreamConnection_paging() {
            return User.__highlightsStreamConnection_paging;
        }

        public final mx1 get__homepagePostsConnection_paging() {
            return User.__homepagePostsConnection_paging;
        }

        public final mx1 get__latestPostsConnection_includeDeleted() {
            return User.__latestPostsConnection_includeDeleted;
        }

        public final mx1 get__latestPostsConnection_includeResponses() {
            return User.__latestPostsConnection_includeResponses;
        }

        public final mx1 get__latestPostsConnection_includeSuspended() {
            return User.__latestPostsConnection_includeSuspended;
        }

        public final mx1 get__latestPostsConnection_paging() {
            return User.__latestPostsConnection_paging;
        }

        public final mx1 get__latestPostsConnection_type() {
            return User.__latestPostsConnection_type;
        }

        public final mx1 get__matchedContactsConnection_after() {
            return User.__matchedContactsConnection_after;
        }

        public final mx1 get__matchedContactsConnection_first() {
            return User.__matchedContactsConnection_first;
        }

        public final mx1 get__matchedContactsConnection_includeFollowedUsers() {
            return User.__matchedContactsConnection_includeFollowedUsers;
        }

        public final mx1 get__mutedCollectionConnection_paging() {
            return User.__mutedCollectionConnection_paging;
        }

        public final mx1 get__mutedUserConnection_paging() {
            return User.__mutedUserConnection_paging;
        }

        public final mx1 get__popularPosts_input() {
            return User.__popularPosts_input;
        }

        public final mx1 get__postsAggregateTimeseriesStats_input() {
            return User.__postsAggregateTimeseriesStats_input;
        }

        public final mx1 get__postsConnection_after() {
            return User.__postsConnection_after;
        }

        public final mx1 get__postsConnection_filter() {
            return User.__postsConnection_filter;
        }

        public final mx1 get__postsConnection_first() {
            return User.__postsConnection_first;
        }

        public final mx1 get__postsConnection_orderBy() {
            return User.__postsConnection_orderBy;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
