package com.medium.android.graphql;

import com.medium.android.graphql.adapter.ShowPostResponseOnParentMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.ShowPostResponseOnParentMutation_VariablesAdapter;
import com.medium.android.graphql.selections.ShowPostResponseOnParentMutationSelections;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 *2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002+*B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\tJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\tJ$\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010'\u001a\u0004\b(\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b)\u0010\t¨\u0006,"}, d2 = {"Lcom/medium/android/graphql/ShowPostResponseOnParentMutation;", "Lv78;", "Lcom/medium/android/graphql/ShowPostResponseOnParentMutation$Data;", "", "parentPostId", "postResponseId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/String;)Lcom/medium/android/graphql/ShowPostResponseOnParentMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getParentPostId", "getPostResponseId", "Companion", "Data", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ShowPostResponseOnParentMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d0602c8b210c164cf41ebbc819ad7ed8c580b8b7a08c0679076cf8efce0c34fc";
    public static final String OPERATION_NAME = "ShowPostResponseOnParentMutation";
    private final String parentPostId;
    private final String postResponseId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0012\u001a\u00020\u00022\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0014\u001a\u0004\b\u0015\u0010\u0007¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/ShowPostResponseOnParentMutation$Data;", "Lu78;", "", "unhidePostResponseOnParentPost", "<init>", "(Ljava/lang/Boolean;)V", "component1", "()Ljava/lang/Boolean;", "copy", "(Ljava/lang/Boolean;)Lcom/medium/android/graphql/ShowPostResponseOnParentMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/Boolean;", "getUnhidePostResponseOnParentPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final Boolean unhidePostResponseOnParentPost;

        public Data(Boolean bool) {
            this.unhidePostResponseOnParentPost = bool;
        }

        public static Data copy$default(Data data, Boolean bool, int i, Object obj) {
            if ((i & 1) != 0) {
                bool = data.unhidePostResponseOnParentPost;
            }
            data.getClass();
            return new Data(bool);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Boolean getUnhidePostResponseOnParentPost() {
            return this.unhidePostResponseOnParentPost;
        }

        public final Data copy(Boolean unhidePostResponseOnParentPost) {
            return new Data(unhidePostResponseOnParentPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.unhidePostResponseOnParentPost, ((Data) other).unhidePostResponseOnParentPost);
        }

        public final Boolean getUnhidePostResponseOnParentPost() {
            return this.unhidePostResponseOnParentPost;
        }

        public final int hashCode() {
            Boolean bool = this.unhidePostResponseOnParentPost;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "Data(unhidePostResponseOnParentPost=" + this.unhidePostResponseOnParentPost + ")";
        }
    }

    public ShowPostResponseOnParentMutation(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.parentPostId = str;
        this.postResponseId = str2;
    }

    public static /* synthetic */ ShowPostResponseOnParentMutation copy$default(ShowPostResponseOnParentMutation showPostResponseOnParentMutation, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = showPostResponseOnParentMutation.parentPostId;
        }
        if ((i & 2) != 0) {
            str2 = showPostResponseOnParentMutation.postResponseId;
        }
        return showPostResponseOnParentMutation.copy(str, str2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ShowPostResponseOnParentMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getParentPostId() {
        return this.parentPostId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPostResponseId() {
        return this.postResponseId;
    }

    public final ShowPostResponseOnParentMutation copy(String parentPostId, String postResponseId) {
        parentPostId.getClass();
        postResponseId.getClass();
        return new ShowPostResponseOnParentMutation(parentPostId, postResponseId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation ShowPostResponseOnParentMutation($parentPostId: ID!, $postResponseId: ID!) { unhidePostResponseOnParentPost(parentPostId: $parentPostId, postResponseId: $postResponseId) }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ShowPostResponseOnParentMutation)) {
            return false;
        }
        ShowPostResponseOnParentMutation showPostResponseOnParentMutation = (ShowPostResponseOnParentMutation) other;
        return g76.L(this.parentPostId, showPostResponseOnParentMutation.parentPostId) && g76.L(this.postResponseId, showPostResponseOnParentMutation.postResponseId);
    }

    public final String getParentPostId() {
        return this.parentPostId;
    }

    public final String getPostResponseId() {
        return this.postResponseId;
    }

    public final int hashCode() {
        return this.postResponseId.hashCode() + (this.parentPostId.hashCode() * 31);
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
        List<sx1> list = ShowPostResponseOnParentMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ShowPostResponseOnParentMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.y("ShowPostResponseOnParentMutation(parentPostId=", this.parentPostId, ", postResponseId=", this.postResponseId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/ShowPostResponseOnParentMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation ShowPostResponseOnParentMutation($parentPostId: ID!, $postResponseId: ID!) { unhidePostResponseOnParentPost(parentPostId: $parentPostId, postResponseId: $postResponseId) }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
