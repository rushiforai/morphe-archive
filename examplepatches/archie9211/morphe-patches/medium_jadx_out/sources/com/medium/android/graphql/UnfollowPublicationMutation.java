package com.medium.android.graphql;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.medium.android.graphql.adapter.UnfollowPublicationMutation_ResponseAdapter;
import com.medium.android.graphql.adapter.UnfollowPublicationMutation_VariablesAdapter;
import com.medium.android.graphql.fragment.CollectionFollowData;
import com.medium.android.graphql.selections.UnfollowPublicationMutationSelections;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\t\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0003()'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/UnfollowPublicationMutation;", "Lv78;", "Lcom/medium/android/graphql/UnfollowPublicationMutation$Data;", "", "publicationId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/UnfollowPublicationMutation;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "Companion", "Data", "UnfollowCollection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UnfollowPublicationMutation implements v78 {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "e7d8c47ed8bbb0f5ddb6a012ebba514aa57fa21eb5bd53f206c272c65a67405e";
    public static final String OPERATION_NAME = "UnfollowPublicationMutation";
    private final String publicationId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/UnfollowPublicationMutation$Data;", "Lu78;", "Lcom/medium/android/graphql/UnfollowPublicationMutation$UnfollowCollection;", "unfollowCollection", "<init>", "(Lcom/medium/android/graphql/UnfollowPublicationMutation$UnfollowCollection;)V", "component1", "()Lcom/medium/android/graphql/UnfollowPublicationMutation$UnfollowCollection;", "copy", "(Lcom/medium/android/graphql/UnfollowPublicationMutation$UnfollowCollection;)Lcom/medium/android/graphql/UnfollowPublicationMutation$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/UnfollowPublicationMutation$UnfollowCollection;", "getUnfollowCollection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements u78 {
        private final UnfollowCollection unfollowCollection;

        public Data(UnfollowCollection unfollowCollection) {
            this.unfollowCollection = unfollowCollection;
        }

        public static Data copy$default(Data data, UnfollowCollection unfollowCollection, int i, Object obj) {
            if ((i & 1) != 0) {
                unfollowCollection = data.unfollowCollection;
            }
            data.getClass();
            return new Data(unfollowCollection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final UnfollowCollection getUnfollowCollection() {
            return this.unfollowCollection;
        }

        public final Data copy(UnfollowCollection unfollowCollection) {
            return new Data(unfollowCollection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.unfollowCollection, ((Data) other).unfollowCollection);
        }

        public final UnfollowCollection getUnfollowCollection() {
            return this.unfollowCollection;
        }

        public final int hashCode() {
            UnfollowCollection unfollowCollection = this.unfollowCollection;
            if (unfollowCollection == null) {
                return 0;
            }
            return unfollowCollection.hashCode();
        }

        public final String toString() {
            return "Data(unfollowCollection=" + this.unfollowCollection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/UnfollowPublicationMutation$UnfollowCollection;", "", "__typename", "", "id", "collectionFollowData", "Lcom/medium/android/graphql/fragment/CollectionFollowData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionFollowData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCollectionFollowData", "()Lcom/medium/android/graphql/fragment/CollectionFollowData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UnfollowCollection {
        private final String __typename;
        private final CollectionFollowData collectionFollowData;
        private final String id;

        public UnfollowCollection(String str, String str2, CollectionFollowData collectionFollowData) {
            str.getClass();
            str2.getClass();
            collectionFollowData.getClass();
            this.__typename = str;
            this.id = str2;
            this.collectionFollowData = collectionFollowData;
        }

        public static /* synthetic */ UnfollowCollection copy$default(UnfollowCollection unfollowCollection, String str, String str2, CollectionFollowData collectionFollowData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = unfollowCollection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = unfollowCollection.id;
            }
            if ((i & 4) != 0) {
                collectionFollowData = unfollowCollection.collectionFollowData;
            }
            return unfollowCollection.copy(str, str2, collectionFollowData);
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
        public final CollectionFollowData getCollectionFollowData() {
            return this.collectionFollowData;
        }

        public final UnfollowCollection copy(String __typename, String id, CollectionFollowData collectionFollowData) {
            __typename.getClass();
            id.getClass();
            collectionFollowData.getClass();
            return new UnfollowCollection(__typename, id, collectionFollowData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UnfollowCollection)) {
                return false;
            }
            UnfollowCollection unfollowCollection = (UnfollowCollection) other;
            return g76.L(this.__typename, unfollowCollection.__typename) && g76.L(this.id, unfollowCollection.id) && g76.L(this.collectionFollowData, unfollowCollection.collectionFollowData);
        }

        public final CollectionFollowData getCollectionFollowData() {
            return this.collectionFollowData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.collectionFollowData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            CollectionFollowData collectionFollowData = this.collectionFollowData;
            StringBuilder sbU = y30.u("UnfollowCollection(__typename=", str, ", id=", str2, QFTsJPDEnO.VLOGJ);
            sbU.append(collectionFollowData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public UnfollowPublicationMutation(String str) {
        str.getClass();
        this.publicationId = str;
    }

    public static /* synthetic */ UnfollowPublicationMutation copy$default(UnfollowPublicationMutation unfollowPublicationMutation, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = unfollowPublicationMutation.publicationId;
        }
        return unfollowPublicationMutation.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(UnfollowPublicationMutation_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    public final UnfollowPublicationMutation copy(String publicationId) {
        publicationId.getClass();
        return new UnfollowPublicationMutation(publicationId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "mutation UnfollowPublicationMutation($publicationId: ID!) { unfollowCollection(targetCollectionId: $publicationId) { __typename id ...CollectionFollowData } }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UnfollowPublicationMutation) && g76.L(this.publicationId, ((UnfollowPublicationMutation) other).publicationId);
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return this.publicationId.hashCode();
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
        List<sx1> list = UnfollowPublicationMutationSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarL, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        UnfollowPublicationMutation_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("UnfollowPublicationMutation(publicationId=", this.publicationId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/UnfollowPublicationMutation$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "mutation UnfollowPublicationMutation($publicationId: ID!) { unfollowCollection(targetCollectionId: $publicationId) { __typename id ...CollectionFollowData } }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
