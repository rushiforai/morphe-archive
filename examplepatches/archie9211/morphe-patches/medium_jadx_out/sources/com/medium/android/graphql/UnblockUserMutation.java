package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UnblockUserMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UnblockUserMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.UserBlockData;
import com.medium.android.graphql.selections.UnblockUserMutationSelections;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 *2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003+,*B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\tJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\tJ$\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b)\u0010\t¨\u0006-"}, d2 = {"Lcom/medium/android/graphql/UnblockUserMutation;", "Lv78;", "Lcom/medium/android/graphql/UnblockUserMutation$Data;", "", "targetUserId", "userId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/UnblockUserMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetUserId", "getUserId", "Companion", "Data", UnblockUserMutation.OPERATION_NAME, "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UnblockUserMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "3ea749701735ccd4c7528582853b4e9d94037c3d59c5540a952cae52273fdfa3";
    public static final String OPERATION_NAME = "UnblockUser";
    private final String targetUserId;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UnblockUserMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UnblockUserMutation$UnblockUser;", "unblockUser", "<init>", "(Lcom/medium/android/graphql/UnblockUserMutation$UnblockUser;)V", "component1", "()Lcom/medium/android/graphql/UnblockUserMutation$UnblockUser;", "copy", "(Lcom/medium/android/graphql/UnblockUserMutation$UnblockUser;)Lcom/medium/android/graphql/UnblockUserMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UnblockUserMutation$UnblockUser;", "getUnblockUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UnblockUser unblockUser;

        public Data(UnblockUser unblockUser) {
            this.unblockUser = unblockUser;
        }

        public static Data copy$default(Data data, UnblockUser unblockUser, int i, Object obj) {
            if ((i & 1) != 0) {
                unblockUser = data.unblockUser;
            }
            data.getClass();
            return new Data(unblockUser);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UnblockUser getUnblockUser() {
            return this.unblockUser;
        }

        public final Data copy(UnblockUser unblockUser) {
            return new Data(unblockUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.unblockUser, ((Data) other).unblockUser);
        }

        public final UnblockUser getUnblockUser() {
            return this.unblockUser;
        }

        public final int hashCode() {
            UnblockUser unblockUser = this.unblockUser;
            if (unblockUser == null) {
                return 0;
            }
            return unblockUser.hashCode();
        }

        public final String toString() {
            return "Data(unblockUser=" + this.unblockUser + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UnblockUserMutation$UnblockUser;", "", "__typename", "", "id", "userBlockData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserBlockData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getUserBlockData", "()Lcom/medium/android/graphql/fragment/UserBlockData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UnblockUser {
        private final String __typename;
        private final String id;
        private final UserBlockData userBlockData;

        public UnblockUser(String str, String str2, UserBlockData userBlockData) {
            str.getClass();
            str2.getClass();
            userBlockData.getClass();
            this.__typename = str;
            this.id = str2;
            this.userBlockData = userBlockData;
        }

        public static /* synthetic */ UnblockUser copy$default(UnblockUser unblockUser, String str, String str2, UserBlockData userBlockData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = unblockUser.__typename;
            }
            if ((i & 2) != 0) {
                str2 = unblockUser.id;
            }
            if ((i & 4) != 0) {
                userBlockData = unblockUser.userBlockData;
            }
            return unblockUser.copy(str, str2, userBlockData);
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
        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final UnblockUser copy(String __typename, String id, UserBlockData userBlockData) {
            __typename.getClass();
            id.getClass();
            userBlockData.getClass();
            return new UnblockUser(__typename, id, userBlockData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UnblockUser)) {
                return false;
            }
            UnblockUser unblockUser = (UnblockUser) other;
            return g76.L(this.__typename, unblockUser.__typename) && g76.L(this.id, unblockUser.id) && g76.L(this.userBlockData, unblockUser.userBlockData);
        }

        public final String getId() {
            return this.id;
        }

        public final UserBlockData getUserBlockData() {
            return this.userBlockData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.userBlockData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            UserBlockData userBlockData = this.userBlockData;
            StringBuilder sbU = y30.u("UnblockUser(__typename=", str, ", id=", str2, ", userBlockData=");
            sbU.append(userBlockData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public UnblockUserMutation(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.targetUserId = str;
        this.userId = str2;
    }

    public static /* synthetic */ UnblockUserMutation copy$default(UnblockUserMutation unblockUserMutation, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = unblockUserMutation.targetUserId;
        }
        if ((i & 2) != 0) {
            str2 = unblockUserMutation.userId;
        }
        return unblockUserMutation.copy(str, str2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UnblockUserMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetUserId() {
        return this.targetUserId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final UnblockUserMutation copy(String targetUserId, String userId) {
        targetUserId.getClass();
        userId.getClass();
        return new UnblockUserMutation(targetUserId, userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UnblockUser($targetUserId: ID!, $userId: ID!) { unblockUser(targetUserId: $targetUserId, userId: $userId) { __typename id ...UserBlockData } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UnblockUserMutation)) {
            return false;
        }
        UnblockUserMutation unblockUserMutation = (UnblockUserMutation) other;
        return g76.L(this.targetUserId, unblockUserMutation.targetUserId) && g76.L(this.userId, unblockUserMutation.userId);
    }

    public final String getTargetUserId() {
        return this.targetUserId;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + (this.targetUserId.hashCode() * 31);
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
        List<sx1> list = UnblockUserMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UnblockUserMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.y("UnblockUserMutation(targetUserId=", this.targetUserId, ", userId=", this.userId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UnblockUserMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UnblockUser($targetUserId: ID!, $userId: ID!) { unblockUser(targetUserId: $targetUserId, userId: $userId) { __typename id ...UserBlockData } }  fragment UserBlockData on User { __typename id name viewerEdge { __typename id isBlocking } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
