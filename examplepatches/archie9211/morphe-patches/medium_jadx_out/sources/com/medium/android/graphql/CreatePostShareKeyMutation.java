package com.medium.android.graphql;

import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.graphql.adapter.CreatePostShareKeyMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.CreatePostShareKeyMutation_VariablesAdapter;
import com.medium.android.graphql.selections.CreatePostShareKeyMutationSelections;
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
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004()*'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006+"}, d2 = {"Lcom/medium/android/graphql/CreatePostShareKeyMutation;", "Lv78;", "Lcom/medium/android/graphql/CreatePostShareKeyMutation$Data;", "", "postId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/CreatePostShareKeyMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Companion", "Data", CreatePostShareKeyMutation.OPERATION_NAME, "OnPostShareKey", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CreatePostShareKeyMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "a2914d96d4332ff1c564030d6335bcd79a3cb1ec492e1549d95cf94c97b857da";
    public static final String OPERATION_NAME = "CreatePostShareKey";
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/CreatePostShareKeyMutation$CreatePostShareKey;", "", "__typename", "", "onPostShareKey", "Lcom/medium/android/graphql/CreatePostShareKeyMutation$OnPostShareKey;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/CreatePostShareKeyMutation$OnPostShareKey;)V", "get__typename", "()Ljava/lang/String;", "getOnPostShareKey", "()Lcom/medium/android/graphql/CreatePostShareKeyMutation$OnPostShareKey;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CreatePostShareKey {
        private final String __typename;
        private final OnPostShareKey onPostShareKey;

        public CreatePostShareKey(String str, OnPostShareKey onPostShareKey) {
            str.getClass();
            this.__typename = str;
            this.onPostShareKey = onPostShareKey;
        }

        public static /* synthetic */ CreatePostShareKey copy$default(CreatePostShareKey createPostShareKey, String str, OnPostShareKey onPostShareKey, int i, Object obj) {
            if ((i & 1) != 0) {
                str = createPostShareKey.__typename;
            }
            if ((i & 2) != 0) {
                onPostShareKey = createPostShareKey.onPostShareKey;
            }
            return createPostShareKey.copy(str, onPostShareKey);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPostShareKey getOnPostShareKey() {
            return this.onPostShareKey;
        }

        public final CreatePostShareKey copy(String __typename, OnPostShareKey onPostShareKey) {
            __typename.getClass();
            return new CreatePostShareKey(__typename, onPostShareKey);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CreatePostShareKey)) {
                return false;
            }
            CreatePostShareKey createPostShareKey = (CreatePostShareKey) other;
            return g76.L(this.__typename, createPostShareKey.__typename) && g76.L(this.onPostShareKey, createPostShareKey.onPostShareKey);
        }

        public final OnPostShareKey getOnPostShareKey() {
            return this.onPostShareKey;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPostShareKey onPostShareKey = this.onPostShareKey;
            return iHashCode + (onPostShareKey == null ? 0 : onPostShareKey.hashCode());
        }

        public final String toString() {
            return bPUi.uqNw + this.__typename + ", onPostShareKey=" + this.onPostShareKey + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/CreatePostShareKeyMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/CreatePostShareKeyMutation$CreatePostShareKey;", "createPostShareKey", "<init>", "(Lcom/medium/android/graphql/CreatePostShareKeyMutation$CreatePostShareKey;)V", "component1", "()Lcom/medium/android/graphql/CreatePostShareKeyMutation$CreatePostShareKey;", "copy", "(Lcom/medium/android/graphql/CreatePostShareKeyMutation$CreatePostShareKey;)Lcom/medium/android/graphql/CreatePostShareKeyMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/CreatePostShareKeyMutation$CreatePostShareKey;", "getCreatePostShareKey", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final CreatePostShareKey createPostShareKey;

        public Data(CreatePostShareKey createPostShareKey) {
            createPostShareKey.getClass();
            this.createPostShareKey = createPostShareKey;
        }

        public static /* synthetic */ Data copy$default(Data data, CreatePostShareKey createPostShareKey, int i, Object obj) {
            if ((i & 1) != 0) {
                createPostShareKey = data.createPostShareKey;
            }
            return data.copy(createPostShareKey);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final CreatePostShareKey getCreatePostShareKey() {
            return this.createPostShareKey;
        }

        public final Data copy(CreatePostShareKey createPostShareKey) {
            createPostShareKey.getClass();
            return new Data(createPostShareKey);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.createPostShareKey, ((Data) other).createPostShareKey);
        }

        public final CreatePostShareKey getCreatePostShareKey() {
            return this.createPostShareKey;
        }

        public final int hashCode() {
            return this.createPostShareKey.hashCode();
        }

        public final String toString() {
            return "Data(createPostShareKey=" + this.createPostShareKey + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/CreatePostShareKeyMutation$OnPostShareKey;", "", "key", "", "<init>", "(Ljava/lang/String;)V", "getKey", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPostShareKey {
        private final String key;

        public OnPostShareKey(String str) {
            str.getClass();
            this.key = str;
        }

        public static /* synthetic */ OnPostShareKey copy$default(OnPostShareKey onPostShareKey, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPostShareKey.key;
            }
            return onPostShareKey.copy(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getKey() {
            return this.key;
        }

        public final OnPostShareKey copy(String key) {
            key.getClass();
            return new OnPostShareKey(key);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPostShareKey) && g76.L(this.key, ((OnPostShareKey) other).key);
        }

        public final String getKey() {
            return this.key;
        }

        public final int hashCode() {
            return this.key.hashCode();
        }

        public final String toString() {
            return ev6.x("OnPostShareKey(key=", this.key, ")");
        }
    }

    public CreatePostShareKeyMutation(String str) {
        str.getClass();
        this.postId = str;
    }

    public static /* synthetic */ CreatePostShareKeyMutation copy$default(CreatePostShareKeyMutation createPostShareKeyMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = createPostShareKeyMutation.postId;
        }
        return createPostShareKeyMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CreatePostShareKeyMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final CreatePostShareKeyMutation copy(String postId) {
        postId.getClass();
        return new CreatePostShareKeyMutation(postId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation CreatePostShareKey($postId: ID!) { createPostShareKey(postId: $postId) { __typename ... on PostShareKey { key } } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof CreatePostShareKeyMutation) && g76.L(this.postId, ((CreatePostShareKeyMutation) other).postId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode();
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
        List<sx1> list = CreatePostShareKeyMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CreatePostShareKeyMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("CreatePostShareKeyMutation(postId=", this.postId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/CreatePostShareKeyMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation CreatePostShareKey($postId: ID!) { createPostShareKey(postId: $postId) { __typename ... on PostShareKey { key } } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
