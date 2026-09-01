package com.medium.android.graphql;

import com.medium.android.graphql.adapter.SetPostVisibilityMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.SetPostVisibilityMutation_VariablesAdapter;
import com.medium.android.graphql.selections.SetPostVisibilityMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.PostVisibilityType;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.u78;
import defpackage.v78;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u000b\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003./-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00060"}, d2 = {"Lcom/medium/android/graphql/SetPostVisibilityMutation;", "Lv78;", "Lcom/medium/android/graphql/SetPostVisibilityMutation$Data;", "", "postId", "Lcom/medium/android/graphql/type/PostVisibilityType;", "visibility", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PostVisibilityType;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/PostVisibilityType;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PostVisibilityType;)Lcom/medium/android/graphql/SetPostVisibilityMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Lcom/medium/android/graphql/type/PostVisibilityType;", "getVisibility", "Companion", "Data", "SetPostAudience", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostVisibilityMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d6b6f5026ca43f1cb6111eb34865ecb41369b31a9798a5eca3983cf9beb65055";
    public static final String OPERATION_NAME = "SetPostVisibilityMutation";
    private final String postId;
    private final PostVisibilityType visibility;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/SetPostVisibilityMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/SetPostVisibilityMutation$SetPostAudience;", "setPostAudience", "<init>", "(Lcom/medium/android/graphql/SetPostVisibilityMutation$SetPostAudience;)V", "component1", "()Lcom/medium/android/graphql/SetPostVisibilityMutation$SetPostAudience;", "copy", "(Lcom/medium/android/graphql/SetPostVisibilityMutation$SetPostAudience;)Lcom/medium/android/graphql/SetPostVisibilityMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/SetPostVisibilityMutation$SetPostAudience;", "getSetPostAudience", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final SetPostAudience setPostAudience;

        public Data(SetPostAudience setPostAudience) {
            this.setPostAudience = setPostAudience;
        }

        public static Data copy$default(Data data, SetPostAudience setPostAudience, int i, Object obj) {
            if ((i & 1) != 0) {
                setPostAudience = data.setPostAudience;
            }
            data.getClass();
            return new Data(setPostAudience);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final SetPostAudience getSetPostAudience() {
            return this.setPostAudience;
        }

        public final Data copy(SetPostAudience setPostAudience) {
            return new Data(setPostAudience);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.setPostAudience, ((Data) other).setPostAudience);
        }

        public final SetPostAudience getSetPostAudience() {
            return this.setPostAudience;
        }

        public final int hashCode() {
            SetPostAudience setPostAudience = this.setPostAudience;
            if (setPostAudience == null) {
                return 0;
            }
            return setPostAudience.hashCode();
        }

        public final String toString() {
            return "Data(setPostAudience=" + this.setPostAudience + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/SetPostVisibilityMutation$SetPostAudience;", "", "__typename", "", "visibility", "Lcom/medium/android/graphql/type/PostVisibilityType;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PostVisibilityType;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getVisibility", "()Lcom/medium/android/graphql/type/PostVisibilityType;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SetPostAudience {
        private final String __typename;
        private final String id;
        private final PostVisibilityType visibility;

        public SetPostAudience(String str, PostVisibilityType postVisibilityType, String str2) {
            str.getClass();
            postVisibilityType.getClass();
            str2.getClass();
            this.__typename = str;
            this.visibility = postVisibilityType;
            this.id = str2;
        }

        public static /* synthetic */ SetPostAudience copy$default(SetPostAudience setPostAudience, String str, PostVisibilityType postVisibilityType, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = setPostAudience.__typename;
            }
            if ((i & 2) != 0) {
                postVisibilityType = setPostAudience.visibility;
            }
            if ((i & 4) != 0) {
                str2 = setPostAudience.id;
            }
            return setPostAudience.copy(str, postVisibilityType, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostVisibilityType getVisibility() {
            return this.visibility;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final SetPostAudience copy(String __typename, PostVisibilityType visibility, String id) {
            __typename.getClass();
            visibility.getClass();
            id.getClass();
            return new SetPostAudience(__typename, visibility, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SetPostAudience)) {
                return false;
            }
            SetPostAudience setPostAudience = (SetPostAudience) other;
            return g76.L(this.__typename, setPostAudience.__typename) && this.visibility == setPostAudience.visibility && g76.L(this.id, setPostAudience.id);
        }

        public final String getId() {
            return this.id;
        }

        public final PostVisibilityType getVisibility() {
            return this.visibility;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.visibility.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            PostVisibilityType postVisibilityType = this.visibility;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("SetPostAudience(__typename=");
            sb.append(str);
            sb.append(", visibility=");
            sb.append(postVisibilityType);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public SetPostVisibilityMutation(String str, PostVisibilityType postVisibilityType) {
        str.getClass();
        postVisibilityType.getClass();
        this.postId = str;
        this.visibility = postVisibilityType;
    }

    public static /* synthetic */ SetPostVisibilityMutation copy$default(SetPostVisibilityMutation setPostVisibilityMutation, String str, PostVisibilityType postVisibilityType, int i, Object obj) {
        if ((i & 1) != 0) {
            str = setPostVisibilityMutation.postId;
        }
        if ((i & 2) != 0) {
            postVisibilityType = setPostVisibilityMutation.visibility;
        }
        return setPostVisibilityMutation.copy(str, postVisibilityType);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(SetPostVisibilityMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final PostVisibilityType getVisibility() {
        return this.visibility;
    }

    public final SetPostVisibilityMutation copy(String postId, PostVisibilityType visibility) {
        postId.getClass();
        visibility.getClass();
        return new SetPostVisibilityMutation(postId, visibility);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation SetPostVisibilityMutation($postId: ID!, $visibility: PostVisibilityType!) { setPostAudience(targetPostId: $postId, visibility: $visibility) { __typename visibility id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SetPostVisibilityMutation)) {
            return false;
        }
        SetPostVisibilityMutation setPostVisibilityMutation = (SetPostVisibilityMutation) other;
        return g76.L(this.postId, setPostVisibilityMutation.postId) && this.visibility == setPostVisibilityMutation.visibility;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final PostVisibilityType getVisibility() {
        return this.visibility;
    }

    public final int hashCode() {
        return this.visibility.hashCode() + (this.postId.hashCode() * 31);
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
        List<sx1> list = SetPostVisibilityMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        SetPostVisibilityMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "SetPostVisibilityMutation(postId=" + this.postId + ", visibility=" + this.visibility + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/SetPostVisibilityMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation SetPostVisibilityMutation($postId: ID!, $visibility: PostVisibilityType!) { setPostAudience(targetPostId: $postId, visibility: $visibility) { __typename visibility id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
