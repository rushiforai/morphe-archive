package com.medium.android.graphql;

import com.medium.android.graphql.adapter.MuteUserMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.MuteUserMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.UserMuteData;
import com.medium.android.graphql.selections.MuteUserMutationSelections;
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
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003()'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/MuteUserMutation;", "Lv78;", "Lcom/medium/android/graphql/MuteUserMutation$Data;", "", "targetUserId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/MuteUserMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getTargetUserId", "Companion", "Data", "MuteUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class MuteUserMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "4fc2cb660590b9d2ee2ec6e42510d4875754f9ea7707d26118a8d1a5b34c1f92";
    public static final String OPERATION_NAME = "MuteUserMutation";
    private final String targetUserId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/MuteUserMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/MuteUserMutation$MuteUser;", "muteUser", "<init>", "(Lcom/medium/android/graphql/MuteUserMutation$MuteUser;)V", "component1", "()Lcom/medium/android/graphql/MuteUserMutation$MuteUser;", "copy", "(Lcom/medium/android/graphql/MuteUserMutation$MuteUser;)Lcom/medium/android/graphql/MuteUserMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/MuteUserMutation$MuteUser;", "getMuteUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final MuteUser muteUser;

        public Data(MuteUser muteUser) {
            this.muteUser = muteUser;
        }

        public static Data copy$default(Data data, MuteUser muteUser, int i, Object obj) {
            if ((i & 1) != 0) {
                muteUser = data.muteUser;
            }
            data.getClass();
            return new Data(muteUser);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final MuteUser getMuteUser() {
            return this.muteUser;
        }

        public final Data copy(MuteUser muteUser) {
            return new Data(muteUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.muteUser, ((Data) other).muteUser);
        }

        public final MuteUser getMuteUser() {
            return this.muteUser;
        }

        public final int hashCode() {
            MuteUser muteUser = this.muteUser;
            if (muteUser == null) {
                return 0;
            }
            return muteUser.hashCode();
        }

        public final String toString() {
            return "Data(muteUser=" + this.muteUser + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/MuteUserMutation$MuteUser;", "", "__typename", "", "id", "userMuteData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserMuteData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getUserMuteData", "()Lcom/medium/android/graphql/fragment/UserMuteData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MuteUser {
        private final String __typename;
        private final String id;
        private final UserMuteData userMuteData;

        public MuteUser(String str, String str2, UserMuteData userMuteData) {
            str.getClass();
            str2.getClass();
            userMuteData.getClass();
            this.__typename = str;
            this.id = str2;
            this.userMuteData = userMuteData;
        }

        public static /* synthetic */ MuteUser copy$default(MuteUser muteUser, String str, String str2, UserMuteData userMuteData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = muteUser.__typename;
            }
            if ((i & 2) != 0) {
                str2 = muteUser.id;
            }
            if ((i & 4) != 0) {
                userMuteData = muteUser.userMuteData;
            }
            return muteUser.copy(str, str2, userMuteData);
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
        public final UserMuteData getUserMuteData() {
            return this.userMuteData;
        }

        public final MuteUser copy(String __typename, String id, UserMuteData userMuteData) {
            __typename.getClass();
            id.getClass();
            userMuteData.getClass();
            return new MuteUser(__typename, id, userMuteData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MuteUser)) {
                return false;
            }
            MuteUser muteUser = (MuteUser) other;
            return g76.L(this.__typename, muteUser.__typename) && g76.L(this.id, muteUser.id) && g76.L(this.userMuteData, muteUser.userMuteData);
        }

        public final String getId() {
            return this.id;
        }

        public final UserMuteData getUserMuteData() {
            return this.userMuteData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.userMuteData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            UserMuteData userMuteData = this.userMuteData;
            StringBuilder sbU = y30.u("MuteUser(__typename=", str, ", id=", str2, ", userMuteData=");
            sbU.append(userMuteData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public MuteUserMutation(String str) {
        str.getClass();
        this.targetUserId = str;
    }

    public static /* synthetic */ MuteUserMutation copy$default(MuteUserMutation muteUserMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = muteUserMutation.targetUserId;
        }
        return muteUserMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(MuteUserMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getTargetUserId() {
        return this.targetUserId;
    }

    public final MuteUserMutation copy(String targetUserId) {
        targetUserId.getClass();
        return new MuteUserMutation(targetUserId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation MuteUserMutation($targetUserId: ID!) { muteUser(targetUserId: $targetUserId) { __typename id ...UserMuteData } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof MuteUserMutation) && g76.L(this.targetUserId, ((MuteUserMutation) other).targetUserId);
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

    @Override // defpackage.m44
    public final nx1 rootField() {
        sm8 sm8VarL = lv8.l(Mutation.INSTANCE);
        List<sx1> list = MuteUserMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        MuteUserMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("MuteUserMutation(targetUserId=", this.targetUserId, ")");
    }

    @Override // defpackage.hv8
    public final String name() {
        return AEVqIoD.ELqltHblwu;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/MuteUserMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation MuteUserMutation($targetUserId: ID!) { muteUser(targetUserId: $targetUserId) { __typename id ...UserMuteData } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
