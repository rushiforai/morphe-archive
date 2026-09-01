package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UserCompleteProfileMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UserCompleteProfileMutation_VariablesAdapter;
import com.medium.android.graphql.selections.UserCompleteProfileMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.k8;
import defpackage.km4;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 /2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u00020/B'\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\u0005\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0005\u0010\u000bJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u000bJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u000bJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u000bJ8\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\"\u0010\u000bJ\u0010\u0010$\u001a\u00020#HÖ\u0001¢\u0006\u0004\b$\u0010%J\u001a\u0010(\u001a\u00020\u00112\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010*\u001a\u0004\b,\u0010\u000bR\u0017\u0010\u0006\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0006\u0010*\u001a\u0004\b-\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0007\u0010*\u001a\u0004\b.\u0010\u000b¨\u00061"}, d2 = {"Lcom/medium/android/graphql/UserCompleteProfileMutation;", "Lv78;", "Lcom/medium/android/graphql/UserCompleteProfileMutation$Data;", "", "userId", "name", "bio", "imageId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/UserCompleteProfileMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "getName", "getBio", "getImageId", "Companion", "Data", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserCompleteProfileMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d8a044ef0f8a6ec6c646fb8b4877d3099b4d805fc2facfe90167fa613f35930a";
    public static final String OPERATION_NAME = "UserCompleteProfile";
    private final String bio;
    private final String imageId;
    private final String name;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0012\u001a\u00020\u00022\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0014\u001a\u0004\b\u0015\u0010\u0007¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/UserCompleteProfileMutation$Data;", "Lu78;", "", "userCompleteProfile", "<init>", "(Z)V", "component1", "()Z", "copy", "(Z)Lcom/medium/android/graphql/UserCompleteProfileMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Z", "getUserCompleteProfile", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final boolean userCompleteProfile;

        public Data(boolean z) {
            this.userCompleteProfile = z;
        }

        public static Data copy$default(Data data, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                z = data.userCompleteProfile;
            }
            data.getClass();
            return new Data(z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final boolean getUserCompleteProfile() {
            return this.userCompleteProfile;
        }

        public final Data copy(boolean userCompleteProfile) {
            return new Data(userCompleteProfile);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && this.userCompleteProfile == ((Data) other).userCompleteProfile;
        }

        public final boolean getUserCompleteProfile() {
            return this.userCompleteProfile;
        }

        public final int hashCode() {
            return this.userCompleteProfile ? 1231 : 1237;
        }

        public final String toString() {
            return b09.z("Data(userCompleteProfile=", ")", this.userCompleteProfile);
        }
    }

    public UserCompleteProfileMutation(String str, String str2, String str3, String str4) {
        ho2.Q(str, str2, str3, str4);
        this.userId = str;
        this.name = str2;
        this.bio = str3;
        this.imageId = str4;
    }

    public static /* synthetic */ UserCompleteProfileMutation copy$default(UserCompleteProfileMutation userCompleteProfileMutation, String str, String str2, String str3, String str4, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userCompleteProfileMutation.userId;
        }
        if ((i & 2) != 0) {
            str2 = userCompleteProfileMutation.name;
        }
        if ((i & 4) != 0) {
            str3 = userCompleteProfileMutation.bio;
        }
        if ((i & 8) != 0) {
            str4 = userCompleteProfileMutation.imageId;
        }
        return userCompleteProfileMutation.copy(str, str2, str3, str4);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UserCompleteProfileMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getBio() {
        return this.bio;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getImageId() {
        return this.imageId;
    }

    public final UserCompleteProfileMutation copy(String userId, String name, String bio, String imageId) {
        userId.getClass();
        name.getClass();
        bio.getClass();
        imageId.getClass();
        return new UserCompleteProfileMutation(userId, name, bio, imageId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UserCompleteProfile($userId: ID!, $name: String!, $bio: String!, $imageId: String!) { userCompleteProfile(userId: $userId, name: $name, bio: $bio, imageId: $imageId) }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserCompleteProfileMutation)) {
            return false;
        }
        UserCompleteProfileMutation userCompleteProfileMutation = (UserCompleteProfileMutation) other;
        return g76.L(this.userId, userCompleteProfileMutation.userId) && g76.L(this.name, userCompleteProfileMutation.name) && g76.L(this.bio, userCompleteProfileMutation.bio) && g76.L(this.imageId, userCompleteProfileMutation.imageId);
    }

    public final String getBio() {
        return this.bio;
    }

    public final String getImageId() {
        return this.imageId;
    }

    public final String getName() {
        return this.name;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.imageId.hashCode() + wgd.o(wgd.o(this.userId.hashCode() * 31, 31, this.name), 31, this.bio);
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
        List<sx1> list = UserCompleteProfileMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UserCompleteProfileMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.userId;
        String str2 = this.name;
        return km4.C(y30.u("UserCompleteProfileMutation(userId=", str, ", name=", str2, ", bio="), this.bio, ", imageId=", this.imageId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UserCompleteProfileMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UserCompleteProfile($userId: ID!, $name: String!, $bio: String!, $imageId: String!) { userCompleteProfile(userId: $userId, name: $name, bio: $bio, imageId: $imageId) }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
