package com.medium.android.graphql;

import com.medium.android.graphql.adapter.ReportUserMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.ReportUserMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.UserBlockData;
import com.medium.android.graphql.fragment.UserFollowData;
import com.medium.android.graphql.selections.ReportUserMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
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
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 22\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003342B'\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\fJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\fJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\fJ\u0010\u0010 \u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b \u0010!J8\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b$\u0010\fJ\u0010\u0010&\u001a\u00020%HÖ\u0001¢\u0006\u0004\b&\u0010'J\u001a\u0010*\u001a\u00020\u00072\b\u0010)\u001a\u0004\u0018\u00010(HÖ\u0003¢\u0006\u0004\b*\u0010+R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010,\u001a\u0004\b-\u0010\fR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010,\u001a\u0004\b.\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0006\u0010,\u001a\u0004\b/\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00100\u001a\u0004\b1\u0010!¨\u00065"}, d2 = {"Lcom/medium/android/graphql/ReportUserMutation;", "Lv78;", "Lcom/medium/android/graphql/ReportUserMutation$Data;", "", "targetUserId", "userId", "reason", "", "alsoBlockUser", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "component4", "()Z", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/medium/android/graphql/ReportUserMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetUserId", "getUserId", "getReason", "Z", "getAlsoBlockUser", "Companion", "Data", "ReportAndMaybeBlockUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ReportUserMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "6f81e4de9e5d1b45294fec4b7f4a07173229b8b48f26620a8e04638730cfc73c";
    public static final String OPERATION_NAME = "ReportUser";
    private final boolean alsoBlockUser;
    private final String reason;
    private final String targetUserId;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/ReportUserMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/ReportUserMutation$ReportAndMaybeBlockUser;", "reportAndMaybeBlockUser", "<init>", "(Lcom/medium/android/graphql/ReportUserMutation$ReportAndMaybeBlockUser;)V", "component1", "()Lcom/medium/android/graphql/ReportUserMutation$ReportAndMaybeBlockUser;", "copy", "(Lcom/medium/android/graphql/ReportUserMutation$ReportAndMaybeBlockUser;)Lcom/medium/android/graphql/ReportUserMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/ReportUserMutation$ReportAndMaybeBlockUser;", "getReportAndMaybeBlockUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final ReportAndMaybeBlockUser reportAndMaybeBlockUser;

        public Data(ReportAndMaybeBlockUser reportAndMaybeBlockUser) {
            this.reportAndMaybeBlockUser = reportAndMaybeBlockUser;
        }

        public static Data copy$default(Data data, ReportAndMaybeBlockUser reportAndMaybeBlockUser, int i, Object obj) {
            if ((i & 1) != 0) {
                reportAndMaybeBlockUser = data.reportAndMaybeBlockUser;
            }
            data.getClass();
            return new Data(reportAndMaybeBlockUser);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final ReportAndMaybeBlockUser getReportAndMaybeBlockUser() {
            return this.reportAndMaybeBlockUser;
        }

        public final Data copy(ReportAndMaybeBlockUser reportAndMaybeBlockUser) {
            return new Data(reportAndMaybeBlockUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.reportAndMaybeBlockUser, ((Data) other).reportAndMaybeBlockUser);
        }

        public final ReportAndMaybeBlockUser getReportAndMaybeBlockUser() {
            return this.reportAndMaybeBlockUser;
        }

        public final int hashCode() {
            ReportAndMaybeBlockUser reportAndMaybeBlockUser = this.reportAndMaybeBlockUser;
            if (reportAndMaybeBlockUser == null) {
                return 0;
            }
            return reportAndMaybeBlockUser.hashCode();
        }

        public final String toString() {
            return "Data(reportAndMaybeBlockUser=" + this.reportAndMaybeBlockUser + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/ReportUserMutation$ReportAndMaybeBlockUser;", "", "__typename", "", "id", "userFollowData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "userBlockData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserFollowData;Lcom/medium/android/graphql/fragment/UserBlockData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getUserFollowData", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "getUserBlockData", "()Lcom/medium/android/graphql/fragment/UserBlockData;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ReportAndMaybeBlockUser {
        private final String __typename;
        private final String id;
        private final UserBlockData userBlockData;
        private final UserFollowData userFollowData;

        public ReportAndMaybeBlockUser(String str, String str2, UserFollowData userFollowData, UserBlockData userBlockData) {
            str.getClass();
            str2.getClass();
            userFollowData.getClass();
            userBlockData.getClass();
            this.__typename = str;
            this.id = str2;
            this.userFollowData = userFollowData;
            this.userBlockData = userBlockData;
        }

        public static /* synthetic */ ReportAndMaybeBlockUser copy$default(ReportAndMaybeBlockUser reportAndMaybeBlockUser, String str, String str2, UserFollowData userFollowData, UserBlockData userBlockData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = reportAndMaybeBlockUser.__typename;
            }
            if ((i & 2) != 0) {
                str2 = reportAndMaybeBlockUser.id;
            }
            if ((i & 4) != 0) {
                userFollowData = reportAndMaybeBlockUser.userFollowData;
            }
            if ((i & 8) != 0) {
                userBlockData = reportAndMaybeBlockUser.userBlockData;
            }
            return reportAndMaybeBlockUser.copy(str, str2, userFollowData, userBlockData);
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

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final ReportAndMaybeBlockUser copy(String __typename, String id, UserFollowData userFollowData, UserBlockData userBlockData) {
            __typename.getClass();
            id.getClass();
            userFollowData.getClass();
            userBlockData.getClass();
            return new ReportAndMaybeBlockUser(__typename, id, userFollowData, userBlockData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ReportAndMaybeBlockUser)) {
                return false;
            }
            ReportAndMaybeBlockUser reportAndMaybeBlockUser = (ReportAndMaybeBlockUser) other;
            return g76.L(this.__typename, reportAndMaybeBlockUser.__typename) && g76.L(this.id, reportAndMaybeBlockUser.id) && g76.L(this.userFollowData, reportAndMaybeBlockUser.userFollowData) && g76.L(this.userBlockData, reportAndMaybeBlockUser.userBlockData);
        }

        public final String getId() {
            return this.id;
        }

        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.userBlockData.hashCode() + ((this.userFollowData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            UserFollowData userFollowData = this.userFollowData;
            UserBlockData userBlockData = this.userBlockData;
            StringBuilder sbU = y30.u("ReportAndMaybeBlockUser(__typename=", str, ", id=", str2, ", userFollowData=");
            sbU.append(userFollowData);
            sbU.append(", userBlockData=");
            sbU.append(userBlockData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public ReportUserMutation(String str, String str2, String str3, boolean z) {
        b09.I(str, str2, str3);
        this.targetUserId = str;
        this.userId = str2;
        this.reason = str3;
        this.alsoBlockUser = z;
    }

    public static /* synthetic */ ReportUserMutation copy$default(ReportUserMutation reportUserMutation, String str, String str2, String str3, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = reportUserMutation.targetUserId;
        }
        if ((i & 2) != 0) {
            str2 = reportUserMutation.userId;
        }
        if ((i & 4) != 0) {
            str3 = reportUserMutation.reason;
        }
        if ((i & 8) != 0) {
            z = reportUserMutation.alsoBlockUser;
        }
        return reportUserMutation.copy(str, str2, str3, z);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ReportUserMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetUserId() {
        return this.targetUserId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getReason() {
        return this.reason;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final boolean getAlsoBlockUser() {
        return this.alsoBlockUser;
    }

    public final ReportUserMutation copy(String targetUserId, String userId, String reason, boolean alsoBlockUser) {
        targetUserId.getClass();
        userId.getClass();
        reason.getClass();
        return new ReportUserMutation(targetUserId, userId, reason, alsoBlockUser);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation ReportUser($targetUserId: ID!, $userId: ID!, $reason: String!, $alsoBlockUser: Boolean!) { reportAndMaybeBlockUser(alsoBlockUser: $alsoBlockUser, targetUserId: $targetUserId, reason: $reason, userId: $userId) { __typename ...UserFollowData ...UserBlockData id } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ReportUserMutation)) {
            return false;
        }
        ReportUserMutation reportUserMutation = (ReportUserMutation) other;
        return g76.L(this.targetUserId, reportUserMutation.targetUserId) && g76.L(this.userId, reportUserMutation.userId) && g76.L(this.reason, reportUserMutation.reason) && this.alsoBlockUser == reportUserMutation.alsoBlockUser;
    }

    public final boolean getAlsoBlockUser() {
        return this.alsoBlockUser;
    }

    public final String getReason() {
        return this.reason;
    }

    public final String getTargetUserId() {
        return this.targetUserId;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return wgd.o(wgd.o(this.targetUserId.hashCode() * 31, 31, this.userId), 31, this.reason) + (this.alsoBlockUser ? 1231 : 1237);
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
        List<sx1> list = ReportUserMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ReportUserMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.targetUserId;
        String str2 = this.userId;
        String str3 = this.reason;
        boolean z = this.alsoBlockUser;
        StringBuilder sbU = y30.u("ReportUserMutation(targetUserId=", str, ", userId=", str2, ", reason=");
        sbU.append(str3);
        sbU.append(", alsoBlockUser=");
        sbU.append(z);
        sbU.append(")");
        return sbU.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/ReportUserMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation ReportUser($targetUserId: ID!, $userId: ID!, $reason: String!, $alsoBlockUser: Boolean!) { reportAndMaybeBlockUser(alsoBlockUser: $alsoBlockUser, targetUserId: $targetUserId, reason: $reason, userId: $userId) { __typename ...UserFollowData ...UserBlockData id } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
