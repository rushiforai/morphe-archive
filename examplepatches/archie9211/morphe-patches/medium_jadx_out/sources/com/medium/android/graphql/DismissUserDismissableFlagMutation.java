package com.medium.android.graphql;

import com.medium.android.graphql.adapter.DismissUserDismissableFlagMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.DismissUserDismissableFlagMutation_VariablesAdapter;
import com.medium.android.graphql.selections.DismissUserDismissableFlagMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UserDismissableFlags;
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
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003./-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\nJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u001dR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\n¨\u00060"}, d2 = {"Lcom/medium/android/graphql/DismissUserDismissableFlagMutation;", "Lv78;", "Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$Data;", "Lcom/medium/android/graphql/type/UserDismissableFlags;", "flag", "", "userId", "<init>", "(Lcom/medium/android/graphql/type/UserDismissableFlags;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/UserDismissableFlags;", "component2", "copy", "(Lcom/medium/android/graphql/type/UserDismissableFlags;Ljava/lang/String;)Lcom/medium/android/graphql/DismissUserDismissableFlagMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/UserDismissableFlags;", "getFlag", "Ljava/lang/String;", "getUserId", "Companion", "Data", "UserDismissFlag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class DismissUserDismissableFlagMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "5e43e36ebc5fabe52d4ad3b575f76bb12285c58f91aa5b1f717ce044e442c8af";
    public static final String OPERATION_NAME = "DismissUserDismissableFlagMutation";
    private final UserDismissableFlags flag;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$UserDismissFlag;", "userDismissFlag", "<init>", "(Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$UserDismissFlag;)V", "component1", "()Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$UserDismissFlag;", "copy", "(Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$UserDismissFlag;)Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$UserDismissFlag;", "getUserDismissFlag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UserDismissFlag userDismissFlag;

        public Data(UserDismissFlag userDismissFlag) {
            this.userDismissFlag = userDismissFlag;
        }

        public static Data copy$default(Data data, UserDismissFlag userDismissFlag, int i, Object obj) {
            if ((i & 1) != 0) {
                userDismissFlag = data.userDismissFlag;
            }
            data.getClass();
            return new Data(userDismissFlag);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UserDismissFlag getUserDismissFlag() {
            return this.userDismissFlag;
        }

        public final Data copy(UserDismissFlag userDismissFlag) {
            return new Data(userDismissFlag);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.userDismissFlag, ((Data) other).userDismissFlag);
        }

        public final UserDismissFlag getUserDismissFlag() {
            return this.userDismissFlag;
        }

        public final int hashCode() {
            UserDismissFlag userDismissFlag = this.userDismissFlag;
            if (userDismissFlag == null) {
                return 0;
            }
            return userDismissFlag.hashCode();
        }

        public final String toString() {
            return "Data(userDismissFlag=" + this.userDismissFlag + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J-\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$UserDismissFlag;", "", "__typename", "", "id", "dismissableFlags", "", "Lcom/medium/android/graphql/type/UserDismissableFlags;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getId", "getDismissableFlags", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UserDismissFlag {
        private final String __typename;
        private final List<UserDismissableFlags> dismissableFlags;
        private final String id;

        /* JADX WARN: Multi-variable type inference failed */
        public UserDismissFlag(String str, String str2, List<? extends UserDismissableFlags> list) {
            str.getClass();
            str2.getClass();
            list.getClass();
            this.__typename = str;
            this.id = str2;
            this.dismissableFlags = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ UserDismissFlag copy$default(UserDismissFlag userDismissFlag, String str, String str2, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = userDismissFlag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = userDismissFlag.id;
            }
            if ((i & 4) != 0) {
                list = userDismissFlag.dismissableFlags;
            }
            return userDismissFlag.copy(str, str2, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final List<UserDismissableFlags> component3() {
            return this.dismissableFlags;
        }

        public final UserDismissFlag copy(String __typename, String id, List<? extends UserDismissableFlags> dismissableFlags) {
            __typename.getClass();
            id.getClass();
            dismissableFlags.getClass();
            return new UserDismissFlag(__typename, id, dismissableFlags);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UserDismissFlag)) {
                return false;
            }
            UserDismissFlag userDismissFlag = (UserDismissFlag) other;
            return g76.L(this.__typename, userDismissFlag.__typename) && g76.L(this.id, userDismissFlag.id) && g76.L(this.dismissableFlags, userDismissFlag.dismissableFlags);
        }

        public final List<UserDismissableFlags> getDismissableFlags() {
            return this.dismissableFlags;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.dismissableFlags.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return b09.B(y30.u("UserDismissFlag(__typename=", str, ", id=", str2, ", dismissableFlags="), this.dismissableFlags, ")");
        }
    }

    public DismissUserDismissableFlagMutation(UserDismissableFlags userDismissableFlags, String str) {
        userDismissableFlags.getClass();
        str.getClass();
        this.flag = userDismissableFlags;
        this.userId = str;
    }

    public static /* synthetic */ DismissUserDismissableFlagMutation copy$default(DismissUserDismissableFlagMutation dismissUserDismissableFlagMutation, UserDismissableFlags userDismissableFlags, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            userDismissableFlags = dismissUserDismissableFlagMutation.flag;
        }
        if ((i & 2) != 0) {
            str = dismissUserDismissableFlagMutation.userId;
        }
        return dismissUserDismissableFlagMutation.copy(userDismissableFlags, str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(DismissUserDismissableFlagMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final UserDismissableFlags getFlag() {
        return this.flag;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    public final DismissUserDismissableFlagMutation copy(UserDismissableFlags flag, String userId) {
        flag.getClass();
        userId.getClass();
        return new DismissUserDismissableFlagMutation(flag, userId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation DismissUserDismissableFlagMutation($flag: UserDismissableFlags!, $userId: ID!) { userDismissFlag(flag: $flag, userId: $userId) { __typename id dismissableFlags } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DismissUserDismissableFlagMutation)) {
            return false;
        }
        DismissUserDismissableFlagMutation dismissUserDismissableFlagMutation = (DismissUserDismissableFlagMutation) other;
        return this.flag == dismissUserDismissableFlagMutation.flag && g76.L(this.userId, dismissUserDismissableFlagMutation.userId);
    }

    public final UserDismissableFlags getFlag() {
        return this.flag;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.userId.hashCode() + (this.flag.hashCode() * 31);
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
        List<sx1> list = DismissUserDismissableFlagMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        DismissUserDismissableFlagMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "DismissUserDismissableFlagMutation(flag=" + this.flag + ", userId=" + this.userId + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/DismissUserDismissableFlagMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation DismissUserDismissableFlagMutation($flag: UserDismissableFlags!, $userId: ID!) { userDismissFlag(flag: $flag, userId: $userId) { __typename id dismissableFlags } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
