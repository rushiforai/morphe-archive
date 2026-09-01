package com.medium.android.graphql;

import com.medium.android.graphql.adapter.UpdateSubmissionStatusMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UpdateSubmissionStatusMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.PostSubmissionData;
import com.medium.android.graphql.selections.UpdateSubmissionStatusMutationSelections;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.UpdateSubmissionStatusInput;
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
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\n\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0004*+,)B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\u001c¨\u0006-"}, d2 = {"Lcom/medium/android/graphql/UpdateSubmissionStatusMutation;", "Lv78;", "Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Data;", "Lcom/medium/android/graphql/type/UpdateSubmissionStatusInput;", "input", "<init>", "(Lcom/medium/android/graphql/type/UpdateSubmissionStatusInput;)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/UpdateSubmissionStatusInput;", "copy", "(Lcom/medium/android/graphql/type/UpdateSubmissionStatusInput;)Lcom/medium/android/graphql/UpdateSubmissionStatusMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/UpdateSubmissionStatusInput;", "getInput", "Companion", "Data", "UpdateSubmissionStatus", "Post", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateSubmissionStatusMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "946433bc258537244cec9ac6b8b350a30bad854fb8fd012b6c98fac7ad3dd803";
    public static final String OPERATION_NAME = "UpdateSubmissionStatusMutation";
    private final UpdateSubmissionStatusInput input;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$UpdateSubmissionStatus;", "updateSubmissionStatus", "<init>", "(Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$UpdateSubmissionStatus;)V", "component1", "()Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$UpdateSubmissionStatus;", "copy", "(Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$UpdateSubmissionStatus;)Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$UpdateSubmissionStatus;", "getUpdateSubmissionStatus", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UpdateSubmissionStatus updateSubmissionStatus;

        public Data(UpdateSubmissionStatus updateSubmissionStatus) {
            this.updateSubmissionStatus = updateSubmissionStatus;
        }

        public static Data copy$default(Data data, UpdateSubmissionStatus updateSubmissionStatus, int i, Object obj) {
            if ((i & 1) != 0) {
                updateSubmissionStatus = data.updateSubmissionStatus;
            }
            data.getClass();
            return new Data(updateSubmissionStatus);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UpdateSubmissionStatus getUpdateSubmissionStatus() {
            return this.updateSubmissionStatus;
        }

        public final Data copy(UpdateSubmissionStatus updateSubmissionStatus) {
            return new Data(updateSubmissionStatus);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.updateSubmissionStatus, ((Data) other).updateSubmissionStatus);
        }

        public final UpdateSubmissionStatus getUpdateSubmissionStatus() {
            return this.updateSubmissionStatus;
        }

        public final int hashCode() {
            UpdateSubmissionStatus updateSubmissionStatus = this.updateSubmissionStatus;
            if (updateSubmissionStatus == null) {
                return 0;
            }
            return updateSubmissionStatus.hashCode();
        }

        public final String toString() {
            return "Data(updateSubmissionStatus=" + this.updateSubmissionStatus + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Post;", "", "__typename", "", "id", "postSubmissionData", "Lcom/medium/android/graphql/fragment/PostSubmissionData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostSubmissionData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostSubmissionData", "()Lcom/medium/android/graphql/fragment/PostSubmissionData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final PostSubmissionData postSubmissionData;

        public Post(String str, String str2, PostSubmissionData postSubmissionData) {
            str.getClass();
            str2.getClass();
            postSubmissionData.getClass();
            this.__typename = str;
            this.id = str2;
            this.postSubmissionData = postSubmissionData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, PostSubmissionData postSubmissionData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                postSubmissionData = post.postSubmissionData;
            }
            return post.copy(str, str2, postSubmissionData);
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
        public final PostSubmissionData getPostSubmissionData() {
            return this.postSubmissionData;
        }

        public final Post copy(String __typename, String id, PostSubmissionData postSubmissionData) {
            __typename.getClass();
            id.getClass();
            postSubmissionData.getClass();
            return new Post(__typename, id, postSubmissionData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.postSubmissionData, post.postSubmissionData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostSubmissionData getPostSubmissionData() {
            return this.postSubmissionData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postSubmissionData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            PostSubmissionData postSubmissionData = this.postSubmissionData;
            StringBuilder sbU = y30.u("Post(__typename=", str, fiHTiFJ.lWBnvjoE, str2, ", postSubmissionData=");
            sbU.append(postSubmissionData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$UpdateSubmissionStatus;", "", "__typename", "", "post", "Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Post;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Post;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getPost", "()Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Post;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UpdateSubmissionStatus {
        private final String __typename;
        private final String id;
        private final Post post;

        public UpdateSubmissionStatus(String str, Post post, String str2) {
            str.getClass();
            post.getClass();
            str2.getClass();
            this.__typename = str;
            this.post = post;
            this.id = str2;
        }

        public static /* synthetic */ UpdateSubmissionStatus copy$default(UpdateSubmissionStatus updateSubmissionStatus, String str, Post post, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = updateSubmissionStatus.__typename;
            }
            if ((i & 2) != 0) {
                post = updateSubmissionStatus.post;
            }
            if ((i & 4) != 0) {
                str2 = updateSubmissionStatus.id;
            }
            return updateSubmissionStatus.copy(str, post, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final UpdateSubmissionStatus copy(String __typename, Post post, String id) {
            __typename.getClass();
            post.getClass();
            id.getClass();
            return new UpdateSubmissionStatus(__typename, post, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UpdateSubmissionStatus)) {
                return false;
            }
            UpdateSubmissionStatus updateSubmissionStatus = (UpdateSubmissionStatus) other;
            return g76.L(this.__typename, updateSubmissionStatus.__typename) && g76.L(this.post, updateSubmissionStatus.post) && g76.L(this.id, updateSubmissionStatus.id);
        }

        public final String getId() {
            return this.id;
        }

        public final Post getPost() {
            return this.post;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.post.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Post post = this.post;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("UpdateSubmissionStatus(__typename=");
            sb.append(str);
            sb.append(", post=");
            sb.append(post);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public UpdateSubmissionStatusMutation(UpdateSubmissionStatusInput updateSubmissionStatusInput) {
        updateSubmissionStatusInput.getClass();
        this.input = updateSubmissionStatusInput;
    }

    public static /* synthetic */ UpdateSubmissionStatusMutation copy$default(UpdateSubmissionStatusMutation updateSubmissionStatusMutation, UpdateSubmissionStatusInput updateSubmissionStatusInput, int i, Object obj) {
        if ((i & 1) != 0) {
            updateSubmissionStatusInput = updateSubmissionStatusMutation.input;
        }
        return updateSubmissionStatusMutation.copy(updateSubmissionStatusInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UpdateSubmissionStatusMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final UpdateSubmissionStatusInput getInput() {
        return this.input;
    }

    public final UpdateSubmissionStatusMutation copy(UpdateSubmissionStatusInput input) {
        input.getClass();
        return new UpdateSubmissionStatusMutation(input);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UpdateSubmissionStatusMutation($input: UpdateSubmissionStatusInput!) { updateSubmissionStatus(input: $input) { __typename post { __typename ...PostSubmissionData id } id } }  fragment PostSubmissionData on Post { __typename viewerEdge { __typename mostRecentSubmission { __typename status publication { __typename name avatar { __typename id } id } id } id } id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UpdateSubmissionStatusMutation) && g76.L(this.input, ((UpdateSubmissionStatusMutation) other).input);
    }

    public final UpdateSubmissionStatusInput getInput() {
        return this.input;
    }

    public final int hashCode() {
        return this.input.hashCode();
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
        List<sx1> list = UpdateSubmissionStatusMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UpdateSubmissionStatusMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "UpdateSubmissionStatusMutation(input=" + this.input + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UpdateSubmissionStatusMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UpdateSubmissionStatusMutation($input: UpdateSubmissionStatusInput!) { updateSubmissionStatus(input: $input) { __typename post { __typename ...PostSubmissionData id } id } }  fragment PostSubmissionData on Post { __typename viewerEdge { __typename mostRecentSubmission { __typename status publication { __typename name avatar { __typename id } id } id } id } id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
