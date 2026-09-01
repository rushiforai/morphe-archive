package com.medium.android.graphql;

import com.medium.android.graphql.adapter.FollowUserMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.FollowUserMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.UserFollowData;
import com.medium.android.graphql.selections.FollowUserMutationSelections;
import com.medium.android.graphql.type.Mutation;
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
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003()'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/FollowUserMutation;", "Lv78;", "Lcom/medium/android/graphql/FollowUserMutation$Data;", "", "targetUserId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/FollowUserMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetUserId", "Companion", "Data", "FollowUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FollowUserMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d37b98047bfa964fb9ec62f9ac5c9a761906e5059d9e9f9674d70b2176df5969";
    public static final String OPERATION_NAME = "FollowUserMutation";
    private final String targetUserId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/FollowUserMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/FollowUserMutation$FollowUser;", "followUser", "<init>", "(Lcom/medium/android/graphql/FollowUserMutation$FollowUser;)V", "component1", "()Lcom/medium/android/graphql/FollowUserMutation$FollowUser;", "copy", "(Lcom/medium/android/graphql/FollowUserMutation$FollowUser;)Lcom/medium/android/graphql/FollowUserMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/FollowUserMutation$FollowUser;", "getFollowUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final FollowUser followUser;

        public Data(FollowUser followUser) {
            this.followUser = followUser;
        }

        public static Data copy$default(Data data, FollowUser followUser, int i, Object obj) {
            if ((i & 1) != 0) {
                followUser = data.followUser;
            }
            data.getClass();
            return new Data(followUser);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final FollowUser getFollowUser() {
            return this.followUser;
        }

        public final Data copy(FollowUser followUser) {
            return new Data(followUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.followUser, ((Data) other).followUser);
        }

        public final FollowUser getFollowUser() {
            return this.followUser;
        }

        public final int hashCode() {
            FollowUser followUser = this.followUser;
            if (followUser == null) {
                return 0;
            }
            return followUser.hashCode();
        }

        public final String toString() {
            return "Data(followUser=" + this.followUser + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FollowUserMutation$FollowUser;", "", "__typename", "", "id", "userFollowData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserFollowData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getUserFollowData", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowUser {
        private final String __typename;
        private final String id;
        private final UserFollowData userFollowData;

        public FollowUser(String str, String str2, UserFollowData userFollowData) {
            str.getClass();
            str2.getClass();
            userFollowData.getClass();
            this.__typename = str;
            this.id = str2;
            this.userFollowData = userFollowData;
        }

        public static /* synthetic */ FollowUser copy$default(FollowUser followUser, String str, String str2, UserFollowData userFollowData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followUser.__typename;
            }
            if ((i & 2) != 0) {
                str2 = followUser.id;
            }
            if ((i & 4) != 0) {
                userFollowData = followUser.userFollowData;
            }
            return followUser.copy(str, str2, userFollowData);
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
        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final FollowUser copy(String __typename, String id, UserFollowData userFollowData) {
            __typename.getClass();
            id.getClass();
            userFollowData.getClass();
            return new FollowUser(__typename, id, userFollowData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowUser)) {
                return false;
            }
            FollowUser followUser = (FollowUser) other;
            return g76.L(this.__typename, followUser.__typename) && g76.L(this.id, followUser.id) && g76.L(this.userFollowData, followUser.userFollowData);
        }

        public final String getId() {
            return this.id;
        }

        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.userFollowData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            UserFollowData userFollowData = this.userFollowData;
            StringBuilder sbU = y30.u("FollowUser(__typename=", str, ", id=", str2, ", userFollowData=");
            sbU.append(userFollowData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public FollowUserMutation(String str) {
        str.getClass();
        this.targetUserId = str;
    }

    public static /* synthetic */ FollowUserMutation copy$default(FollowUserMutation followUserMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = followUserMutation.targetUserId;
        }
        return followUserMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(FollowUserMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetUserId() {
        return this.targetUserId;
    }

    public final FollowUserMutation copy(String targetUserId) {
        targetUserId.getClass();
        return new FollowUserMutation(targetUserId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation FollowUserMutation($targetUserId: ID!) { followUser(targetUserId: $targetUserId) { __typename id ...UserFollowData } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof FollowUserMutation) && g76.L(this.targetUserId, ((FollowUserMutation) other).targetUserId);
    }

    public final String getTargetUserId() {
        return this.targetUserId;
    }

    public final int hashCode() {
        return this.targetUserId.hashCode();
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
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = FollowUserMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        FollowUserMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("FollowUserMutation(targetUserId=", this.targetUserId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/FollowUserMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation FollowUserMutation($targetUserId: ID!) { followUser(targetUserId: $targetUserId) { __typename id ...UserFollowData } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
