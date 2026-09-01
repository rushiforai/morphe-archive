package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UserProfileByIdQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.UserProfileByIdQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.UserProfileData;
import com.medium.android.graphql.selections.UserProfileByIdQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003()'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/UserProfileByIdQuery;", "Luqa;", "Lcom/medium/android/graphql/UserProfileByIdQuery$Data;", "", "userId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/UserProfileByIdQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "Companion", "Data", "User", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserProfileByIdQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "9c99f6ed5673562731ab523f1da4d8fdbd5cd656b511351ec5c99e5e9e82142f";
    public static final String OPERATION_NAME = "UserProfileByIdQuery";
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UserProfileByIdQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/UserProfileByIdQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/UserProfileByIdQuery$User;)V", "component1", "()Lcom/medium/android/graphql/UserProfileByIdQuery$User;", "copy", "(Lcom/medium/android/graphql/UserProfileByIdQuery$User;)Lcom/medium/android/graphql/UserProfileByIdQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UserProfileByIdQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final User user;

        public Data(User user) {
            this.user = user;
        }

        public static Data copy$default(Data data, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                user = data.user;
            }
            data.getClass();
            return new Data(user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Data copy(User user) {
            return new Data(user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.user, ((Data) other).user);
        }

        public final User getUser() {
            return this.user;
        }

        public final int hashCode() {
            User user = this.user;
            if (user == null) {
                return 0;
            }
            return user.hashCode();
        }

        public final String toString() {
            return "Data(user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UserProfileByIdQuery$User;", "", "__typename", "", "id", "userProfileData", "Lcom/medium/android/graphql/fragment/UserProfileData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserProfileData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getUserProfileData", "()Lcom/medium/android/graphql/fragment/UserProfileData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final UserProfileData userProfileData;

        public User(String str, String str2, UserProfileData userProfileData) {
            str.getClass();
            str2.getClass();
            userProfileData.getClass();
            this.__typename = str;
            this.id = str2;
            this.userProfileData = userProfileData;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, UserProfileData userProfileData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.id;
            }
            if ((i & 4) != 0) {
                userProfileData = user.userProfileData;
            }
            return user.copy(str, str2, userProfileData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final UserProfileData getUserProfileData() {
            return this.userProfileData;
        }

        public final User copy(String __typename, String id, UserProfileData userProfileData) {
            __typename.getClass();
            id.getClass();
            userProfileData.getClass();
            return new User(__typename, id, userProfileData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.id, user.id) && g76.L(this.userProfileData, user.userProfileData);
        }

        public final String getId() {
            return this.id;
        }

        public final UserProfileData getUserProfileData() {
            return this.userProfileData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.userProfileData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            UserProfileData userProfileData = this.userProfileData;
            StringBuilder sbU = y30.u("User(__typename=", str, ", id=", str2, ", userProfileData=");
            sbU.append(userProfileData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public UserProfileByIdQuery(String str) {
        str.getClass();
        this.userId = str;
    }

    public static /* synthetic */ UserProfileByIdQuery copy$default(UserProfileByIdQuery userProfileByIdQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userProfileByIdQuery.userId;
        }
        return userProfileByIdQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UserProfileByIdQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final UserProfileByIdQuery copy(String userId) {
        userId.getClass();
        return new UserProfileByIdQuery(userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query UserProfileByIdQuery($userId: ID!) { user(id: $userId) { __typename ...UserProfileData id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserProfileData on User { __typename imageId name username membership { __typename ...membershipFragment } ...UserNewsletterData ...UserBlockData ...UserMuteData ...UserFollowData viewerEdge { __typename isUser id } id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UserProfileByIdQuery) && g76.L(this.userId, ((UserProfileByIdQuery) other).userId);
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode();
    }

    @Override // defpackage.hv8
    public final String id() {
        return OPERATION_ID;
    }

    @Override // defpackage.hv8
    public final String name() {
        return OPERATION_NAME;
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = UserProfileByIdQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UserProfileByIdQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("UserProfileByIdQuery(userId=", this.userId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UserProfileByIdQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query UserProfileByIdQuery($userId: ID!) { user(id: $userId) { __typename ...UserProfileData id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserProfileData on User { __typename imageId name username membership { __typename ...membershipFragment } ...UserNewsletterData ...UserBlockData ...UserMuteData ...UserFollowData viewerEdge { __typename isUser id } id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
