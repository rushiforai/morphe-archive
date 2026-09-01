package com.medium.android.graphql;

import com.medium.android.graphql.adapter.ClapPostMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.ClapPostMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.PostClapsData;
import com.medium.android.graphql.selections.ClapPostMutationSelections;
import com.medium.android.graphql.type.Mutation;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003/0.B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u000bJ\u0010\u0010\u001f\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J.\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010$\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b$\u0010 J\u001a\u0010'\u001a\u00020\u00122\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010)\u001a\u0004\b+\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010 ¨\u00061"}, d2 = {"Lcom/medium/android/graphql/ClapPostMutation;", "Lv78;", "Lcom/medium/android/graphql/ClapPostMutation$Data;", "", "postId", "userId", "", "numClaps", "<init>", "(Ljava/lang/String;Ljava/lang/String;I)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "()I", "copy", "(Ljava/lang/String;Ljava/lang/String;I)Lcom/medium/android/graphql/ClapPostMutation;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getUserId", "I", "getNumClaps", "Companion", "Data", "Clap", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class ClapPostMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "571afa26beff551775ddce6105c067b0273461a8f752af54b3279898bf2378d7";
    public static final String OPERATION_NAME = "ClapPostMutation";
    private final int numClaps;
    private final String postId;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/ClapPostMutation$Clap;", "", "__typename", "", "id", "postClapsData", "Lcom/medium/android/graphql/fragment/PostClapsData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostClapsData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostClapsData", "()Lcom/medium/android/graphql/fragment/PostClapsData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Clap {
        private final String __typename;
        private final String id;
        private final PostClapsData postClapsData;

        public Clap(String str, String str2, PostClapsData postClapsData) {
            str.getClass();
            str2.getClass();
            postClapsData.getClass();
            this.__typename = str;
            this.id = str2;
            this.postClapsData = postClapsData;
        }

        public static /* synthetic */ Clap copy$default(Clap clap, String str, String str2, PostClapsData postClapsData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = clap.__typename;
            }
            if ((i & 2) != 0) {
                str2 = clap.id;
            }
            if ((i & 4) != 0) {
                postClapsData = clap.postClapsData;
            }
            return clap.copy(str, str2, postClapsData);
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
        public final PostClapsData getPostClapsData() {
            return this.postClapsData;
        }

        public final Clap copy(String __typename, String id, PostClapsData postClapsData) {
            __typename.getClass();
            id.getClass();
            postClapsData.getClass();
            return new Clap(__typename, id, postClapsData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Clap)) {
                return false;
            }
            Clap clap = (Clap) other;
            return g76.L(this.__typename, clap.__typename) && g76.L(this.id, clap.id) && g76.L(this.postClapsData, clap.postClapsData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostClapsData getPostClapsData() {
            return this.postClapsData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postClapsData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            PostClapsData postClapsData = this.postClapsData;
            StringBuilder sbU = y30.u("Clap(__typename=", str, ", id=", str2, ", postClapsData=");
            sbU.append(postClapsData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/ClapPostMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/ClapPostMutation$Clap;", "clap", "<init>", "(Lcom/medium/android/graphql/ClapPostMutation$Clap;)V", "component1", "()Lcom/medium/android/graphql/ClapPostMutation$Clap;", "copy", "(Lcom/medium/android/graphql/ClapPostMutation$Clap;)Lcom/medium/android/graphql/ClapPostMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/ClapPostMutation$Clap;", "getClap", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final Clap clap;

        public Data(Clap clap) {
            this.clap = clap;
        }

        public static Data copy$default(Data data, Clap clap, int i, Object obj) {
            if ((i & 1) != 0) {
                clap = data.clap;
            }
            data.getClass();
            return new Data(clap);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Clap getClap() {
            return this.clap;
        }

        public final Data copy(Clap clap) {
            return new Data(clap);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.clap, ((Data) other).clap);
        }

        public final Clap getClap() {
            return this.clap;
        }

        public final int hashCode() {
            Clap clap = this.clap;
            if (clap == null) {
                return 0;
            }
            return clap.hashCode();
        }

        public final String toString() {
            return "Data(clap=" + this.clap + ")";
        }
    }

    public ClapPostMutation(String str, String str2, int i) {
        str.getClass();
        str2.getClass();
        this.postId = str;
        this.userId = str2;
        this.numClaps = i;
    }

    public static /* synthetic */ ClapPostMutation copy$default(ClapPostMutation clapPostMutation, String str, String str2, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = clapPostMutation.postId;
        }
        if ((i2 & 2) != 0) {
            str2 = clapPostMutation.userId;
        }
        if ((i2 & 4) != 0) {
            i = clapPostMutation.numClaps;
        }
        return clapPostMutation.copy(str, str2, i);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(ClapPostMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getNumClaps() {
        return this.numClaps;
    }

    public final ClapPostMutation copy(String postId, String userId, int numClaps) {
        postId.getClass();
        userId.getClass();
        return new ClapPostMutation(postId, userId, numClaps);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation ClapPostMutation($postId: ID!, $userId: ID!, $numClaps: Int!) { clap(targetPostId: $postId, userId: $userId, numClaps: $numClaps) { __typename id ...PostClapsData } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ClapPostMutation)) {
            return false;
        }
        ClapPostMutation clapPostMutation = (ClapPostMutation) other;
        return g76.L(this.postId, clapPostMutation.postId) && g76.L(this.userId, clapPostMutation.userId) && this.numClaps == clapPostMutation.numClaps;
    }

    public final int getNumClaps() {
        return this.numClaps;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return wgd.o(this.postId.hashCode() * 31, 31, this.userId) + this.numClaps;
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
        List<sx1> list = ClapPostMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        ClapPostMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.postId;
        String str2 = this.userId;
        return ho2.H(y30.u("ClapPostMutation(postId=", str, ", userId=", str2, ", numClaps="), this.numClaps, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/ClapPostMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation ClapPostMutation($postId: ID!, $userId: ID!, $numClaps: Int!) { clap(targetPostId: $postId, userId: $userId, numClaps: $numClaps) { __typename id ...PostClapsData } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
