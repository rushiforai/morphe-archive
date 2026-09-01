package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationByIdQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationByIdQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CollectionNewsletterData;
import com.medium.android.graphql.selections.PublicationByIdQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;
import pushnotifications.SY.eoLmc;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0002\b\u0014\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000b/012345678.B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u000bJ\u0010\u0010\u001f\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J.\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010$\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b$\u0010 J\u001a\u0010'\u001a\u00020\u00122\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u000bR\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010)\u001a\u0004\b+\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010,\u001a\u0004\b-\u0010 ¨\u00069"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationByIdQuery$Data;", "", "publicationId", "collectionId", "", "editorCount", "<init>", "(Ljava/lang/String;Ljava/lang/String;I)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "component3", "()I", "copy", "(Ljava/lang/String;Ljava/lang/String;I)Lcom/medium/android/graphql/PublicationByIdQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "getCollectionId", "I", "getEditorCount", "Companion", "Data", "Publication", "Avatar", "FollowGraph", "MastheadConnection", "Edge", "Node", "User", "Collection", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationByIdQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "4d13caa68338bcf3f8538b67bb2933d9100a7b180a0026f515bd2a452f644284";
    public static final String OPERATION_NAME = "PublicationByIdQuery";
    private final String collectionId;
    private final int editorCount;
    private final String publicationId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Avatar;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Avatar {
        private final String __typename;
        private final String id;

        public Avatar(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ Avatar copy$default(Avatar avatar, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = avatar.__typename;
            }
            if ((i & 2) != 0) {
                str2 = avatar.id;
            }
            return avatar.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Avatar copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new Avatar(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Avatar)) {
                return false;
            }
            Avatar avatar = (Avatar) other;
            return g76.L(this.__typename, avatar.__typename) && g76.L(this.id, avatar.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("Avatar(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Collection;", "", "__typename", "", "viewerEdge", "Lcom/medium/android/graphql/PublicationByIdQuery$ViewerEdge;", "id", "collectionNewsletterData", "Lcom/medium/android/graphql/fragment/CollectionNewsletterData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationByIdQuery$ViewerEdge;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionNewsletterData;)V", "get__typename", "()Ljava/lang/String;", "getViewerEdge", "()Lcom/medium/android/graphql/PublicationByIdQuery$ViewerEdge;", "getId", "getCollectionNewsletterData", "()Lcom/medium/android/graphql/fragment/CollectionNewsletterData;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Collection {
        private final String __typename;
        private final CollectionNewsletterData collectionNewsletterData;
        private final String id;
        private final ViewerEdge viewerEdge;

        public Collection(String str, ViewerEdge viewerEdge, String str2, CollectionNewsletterData collectionNewsletterData) {
            str.getClass();
            viewerEdge.getClass();
            str2.getClass();
            collectionNewsletterData.getClass();
            this.__typename = str;
            this.viewerEdge = viewerEdge;
            this.id = str2;
            this.collectionNewsletterData = collectionNewsletterData;
        }

        public static /* synthetic */ Collection copy$default(Collection collection, String str, ViewerEdge viewerEdge, String str2, CollectionNewsletterData collectionNewsletterData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = collection.__typename;
            }
            if ((i & 2) != 0) {
                viewerEdge = collection.viewerEdge;
            }
            if ((i & 4) != 0) {
                str2 = collection.id;
            }
            if ((i & 8) != 0) {
                collectionNewsletterData = collection.collectionNewsletterData;
            }
            return collection.copy(str, viewerEdge, str2, collectionNewsletterData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final CollectionNewsletterData getCollectionNewsletterData() {
            return this.collectionNewsletterData;
        }

        public final Collection copy(String __typename, ViewerEdge viewerEdge, String id, CollectionNewsletterData collectionNewsletterData) {
            __typename.getClass();
            viewerEdge.getClass();
            id.getClass();
            collectionNewsletterData.getClass();
            return new Collection(__typename, viewerEdge, id, collectionNewsletterData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Collection)) {
                return false;
            }
            Collection collection = (Collection) other;
            return g76.L(this.__typename, collection.__typename) && g76.L(this.viewerEdge, collection.viewerEdge) && g76.L(this.id, collection.id) && g76.L(this.collectionNewsletterData, collection.collectionNewsletterData);
        }

        public final CollectionNewsletterData getCollectionNewsletterData() {
            return this.collectionNewsletterData;
        }

        public final String getId() {
            return this.id;
        }

        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.collectionNewsletterData.hashCode() + wgd.o((this.viewerEdge.hashCode() + (this.__typename.hashCode() * 31)) * 31, 31, this.id);
        }

        public final String toString() {
            return eoLmc.sAKcqhycxVe + this.__typename + ", viewerEdge=" + this.viewerEdge + ", id=" + this.id + ", collectionNewsletterData=" + this.collectionNewsletterData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0012\u0010\b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010\n\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ(\u0010\f\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\tR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationByIdQuery$Publication;", "publication", "Lcom/medium/android/graphql/PublicationByIdQuery$Collection;", "collection", "<init>", "(Lcom/medium/android/graphql/PublicationByIdQuery$Publication;Lcom/medium/android/graphql/PublicationByIdQuery$Collection;)V", "component1", "()Lcom/medium/android/graphql/PublicationByIdQuery$Publication;", "component2", "()Lcom/medium/android/graphql/PublicationByIdQuery$Collection;", "copy", "(Lcom/medium/android/graphql/PublicationByIdQuery$Publication;Lcom/medium/android/graphql/PublicationByIdQuery$Collection;)Lcom/medium/android/graphql/PublicationByIdQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationByIdQuery$Publication;", "getPublication", "Lcom/medium/android/graphql/PublicationByIdQuery$Collection;", "getCollection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Collection collection;
        private final Publication publication;

        public Data(Publication publication, Collection collection) {
            this.publication = publication;
            this.collection = collection;
        }

        public static Data copy$default(Data data, Publication publication, Collection collection, int i, Object obj) {
            if ((i & 1) != 0) {
                publication = data.publication;
            }
            if ((i & 2) != 0) {
                collection = data.collection;
            }
            data.getClass();
            return new Data(publication, collection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Collection getCollection() {
            return this.collection;
        }

        public final Data copy(Publication publication, Collection collection) {
            return new Data(publication, collection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.publication, data.publication) && g76.L(this.collection, data.collection);
        }

        public final Collection getCollection() {
            return this.collection;
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final int hashCode() {
            Publication publication = this.publication;
            int iHashCode = (publication == null ? 0 : publication.hashCode()) * 31;
            Collection collection = this.collection;
            return iHashCode + (collection != null ? collection.hashCode() : 0);
        }

        public final String toString() {
            return "Data(publication=" + this.publication + ", collection=" + this.collection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/PublicationByIdQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationByIdQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/PublicationByIdQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge {
        private final String __typename;
        private final Node node;

        public Edge(String str, Node node) {
            str.getClass();
            node.getClass();
            this.__typename = str;
            this.node = node;
        }

        public static /* synthetic */ Edge copy$default(Edge edge, String str, Node node, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge.__typename;
            }
            if ((i & 2) != 0) {
                node = edge.node;
            }
            return edge.copy(str, node);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node getNode() {
            return this.node;
        }

        public final Edge copy(String __typename, Node node) {
            __typename.getClass();
            node.getClass();
            return new Edge(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge)) {
                return false;
            }
            Edge edge = (Edge) other;
            return g76.L(this.__typename, edge.__typename) && g76.L(this.node, edge.node);
        }

        public final Node getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge(__typename=" + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$FollowGraph;", "", "__typename", "", "followerCount", "", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getFollowerCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Integer;)Lcom/medium/android/graphql/PublicationByIdQuery$FollowGraph;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowGraph {
        private final String __typename;
        private final Integer followerCount;

        public FollowGraph(String str, Integer num) {
            str.getClass();
            this.__typename = str;
            this.followerCount = num;
        }

        public static /* synthetic */ FollowGraph copy$default(FollowGraph followGraph, String str, Integer num, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followGraph.__typename;
            }
            if ((i & 2) != 0) {
                num = followGraph.followerCount;
            }
            return followGraph.copy(str, num);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getFollowerCount() {
            return this.followerCount;
        }

        public final FollowGraph copy(String __typename, Integer followerCount) {
            __typename.getClass();
            return new FollowGraph(__typename, followerCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowGraph)) {
                return false;
            }
            FollowGraph followGraph = (FollowGraph) other;
            return g76.L(this.__typename, followGraph.__typename) && g76.L(this.followerCount, followGraph.followerCount);
        }

        public final Integer getFollowerCount() {
            return this.followerCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.followerCount;
            return iHashCode + (num == null ? 0 : num.hashCode());
        }

        public final String toString() {
            return "FollowGraph(__typename=" + this.__typename + ", followerCount=" + this.followerCount + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$MastheadConnection;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/PublicationByIdQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MastheadConnection {
        private final String __typename;
        private final List<Edge> edges;

        public MastheadConnection(String str, List<Edge> list) {
            str.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ MastheadConnection copy$default(MastheadConnection mastheadConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mastheadConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = mastheadConnection.edges;
            }
            return mastheadConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        public final MastheadConnection copy(String __typename, List<Edge> edges) {
            __typename.getClass();
            return new MastheadConnection(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MastheadConnection)) {
                return false;
            }
            MastheadConnection mastheadConnection = (MastheadConnection) other;
            return g76.L(this.__typename, mastheadConnection.__typename) && g76.L(this.edges, mastheadConnection.edges);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<Edge> list = this.edges;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            return ka1.s("MastheadConnection(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Node;", "", "__typename", "", "user", "Lcom/medium/android/graphql/PublicationByIdQuery$User;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationByIdQuery$User;)V", "get__typename", "()Ljava/lang/String;", "getUser", "()Lcom/medium/android/graphql/PublicationByIdQuery$User;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final User user;

        public Node(String str, User user) {
            str.getClass();
            user.getClass();
            this.__typename = str;
            this.user = user;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                user = node.user;
            }
            return node.copy(str, user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Node copy(String __typename, User user) {
            __typename.getClass();
            user.getClass();
            return new Node(__typename, user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.user, node.user);
        }

        public final User getUser() {
            return this.user;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.user.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Node(__typename=" + this.__typename + ", user=" + this.user + gYpYQDQkhfs.jRlVUFSoPw;
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BI\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÆ\u0003J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\tHÆ\u0003J\t\u0010\"\u001a\u00020\u000bHÆ\u0003J\t\u0010#\u001a\u00020\rHÆ\u0003J[\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\rHÆ\u0001J\u0013\u0010%\u001a\u00020&2\b\u0010'\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010(\u001a\u00020)HÖ\u0001J\t\u0010*\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001b¨\u0006+"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Publication;", "", "__typename", "", "id", "slug", "name", "tagline", "avatar", "Lcom/medium/android/graphql/PublicationByIdQuery$Avatar;", "followGraph", "Lcom/medium/android/graphql/PublicationByIdQuery$FollowGraph;", "mastheadConnection", "Lcom/medium/android/graphql/PublicationByIdQuery$MastheadConnection;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/PublicationByIdQuery$Avatar;Lcom/medium/android/graphql/PublicationByIdQuery$FollowGraph;Lcom/medium/android/graphql/PublicationByIdQuery$MastheadConnection;)V", "get__typename", "()Ljava/lang/String;", "getId", "getSlug", "getName", "getTagline", "getAvatar", "()Lcom/medium/android/graphql/PublicationByIdQuery$Avatar;", "getFollowGraph", "()Lcom/medium/android/graphql/PublicationByIdQuery$FollowGraph;", "getMastheadConnection", "()Lcom/medium/android/graphql/PublicationByIdQuery$MastheadConnection;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final Avatar avatar;
        private final FollowGraph followGraph;
        private final String id;
        private final MastheadConnection mastheadConnection;
        private final String name;
        private final String slug;
        private final String tagline;

        public Publication(String str, String str2, String str3, String str4, String str5, Avatar avatar, FollowGraph followGraph, MastheadConnection mastheadConnection) {
            str.getClass();
            str2.getClass();
            str3.getClass();
            str4.getClass();
            str5.getClass();
            followGraph.getClass();
            mastheadConnection.getClass();
            this.__typename = str;
            this.id = str2;
            this.slug = str3;
            this.name = str4;
            this.tagline = str5;
            this.avatar = avatar;
            this.followGraph = followGraph;
            this.mastheadConnection = mastheadConnection;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, String str2, String str3, String str4, String str5, Avatar avatar, FollowGraph followGraph, MastheadConnection mastheadConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publication.id;
            }
            if ((i & 4) != 0) {
                str3 = publication.slug;
            }
            if ((i & 8) != 0) {
                str4 = publication.name;
            }
            if ((i & 16) != 0) {
                str5 = publication.tagline;
            }
            if ((i & 32) != 0) {
                avatar = publication.avatar;
            }
            if ((i & 64) != 0) {
                followGraph = publication.followGraph;
            }
            if ((i & 128) != 0) {
                mastheadConnection = publication.mastheadConnection;
            }
            FollowGraph followGraph2 = followGraph;
            MastheadConnection mastheadConnection2 = mastheadConnection;
            String str6 = str5;
            Avatar avatar2 = avatar;
            return publication.copy(str, str2, str3, str4, str6, avatar2, followGraph2, mastheadConnection2);
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
        public final String getSlug() {
            return this.slug;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getTagline() {
            return this.tagline;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final Avatar getAvatar() {
            return this.avatar;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final FollowGraph getFollowGraph() {
            return this.followGraph;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final MastheadConnection getMastheadConnection() {
            return this.mastheadConnection;
        }

        public final Publication copy(String __typename, String id, String slug, String name, String tagline, Avatar avatar, FollowGraph followGraph, MastheadConnection mastheadConnection) {
            __typename.getClass();
            id.getClass();
            slug.getClass();
            name.getClass();
            tagline.getClass();
            followGraph.getClass();
            mastheadConnection.getClass();
            return new Publication(__typename, id, slug, name, tagline, avatar, followGraph, mastheadConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.id, publication.id) && g76.L(this.slug, publication.slug) && g76.L(this.name, publication.name) && g76.L(this.tagline, publication.tagline) && g76.L(this.avatar, publication.avatar) && g76.L(this.followGraph, publication.followGraph) && g76.L(this.mastheadConnection, publication.mastheadConnection);
        }

        public final Avatar getAvatar() {
            return this.avatar;
        }

        public final FollowGraph getFollowGraph() {
            return this.followGraph;
        }

        public final String getId() {
            return this.id;
        }

        public final MastheadConnection getMastheadConnection() {
            return this.mastheadConnection;
        }

        public final String getName() {
            return this.name;
        }

        public final String getSlug() {
            return this.slug;
        }

        public final String getTagline() {
            return this.tagline;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(wgd.o(wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.slug), 31, this.name), 31, this.tagline);
            Avatar avatar = this.avatar;
            return this.mastheadConnection.hashCode() + ((this.followGraph.hashCode() + ((iO + (avatar == null ? 0 : avatar.hashCode())) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.slug;
            String str4 = this.name;
            String str5 = this.tagline;
            Avatar avatar = this.avatar;
            FollowGraph followGraph = this.followGraph;
            MastheadConnection mastheadConnection = this.mastheadConnection;
            StringBuilder sbU = y30.u("Publication(__typename=", str, ", id=", str2, ", slug=");
            ka1.C(sbU, str3, ", name=", str4, ", tagline=");
            sbU.append(str5);
            sbU.append(", avatar=");
            sbU.append(avatar);
            sbU.append(", followGraph=");
            sbU.append(followGraph);
            sbU.append(", mastheadConnection=");
            sbU.append(mastheadConnection);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$User;", "", "__typename", "", "imageId", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getImageId", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final String imageId;

        public User(String str, String str2, String str3) {
            str.getClass();
            str3.getClass();
            this.__typename = str;
            this.imageId = str2;
            this.id = str3;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.imageId;
            }
            if ((i & 4) != 0) {
                str3 = user.id;
            }
            return user.copy(str, str2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final User copy(String __typename, String imageId, String id) {
            __typename.getClass();
            id.getClass();
            return new User(__typename, imageId, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.imageId, user.imageId) && g76.L(this.id, user.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.imageId;
            return this.id.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.imageId;
            return ka1.v(y30.u("User(__typename=", str, ", imageId=", str2, ", id="), this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$ViewerEdge;", "", "__typename", "", "isEditor", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isEditor;

        public ViewerEdge(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isEditor = z;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge.isEditor;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, z, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsEditor() {
            return this.isEditor;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, boolean isEditor, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, isEditor, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.isEditor == viewerEdge.isEditor && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (((this.__typename.hashCode() * 31) + (this.isEditor ? 1231 : 1237)) * 31);
        }

        public final boolean isEditor() {
            return this.isEditor;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isEditor;
            return ka1.v(ev6.D("ViewerEdge(__typename=", str, ", isEditor=", ", id=", z), this.id, ")");
        }
    }

    public PublicationByIdQuery(String str, String str2, int i) {
        str.getClass();
        str2.getClass();
        this.publicationId = str;
        this.collectionId = str2;
        this.editorCount = i;
    }

    public static /* synthetic */ PublicationByIdQuery copy$default(PublicationByIdQuery publicationByIdQuery, String str, String str2, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = publicationByIdQuery.publicationId;
        }
        if ((i2 & 2) != 0) {
            str2 = publicationByIdQuery.collectionId;
        }
        if ((i2 & 4) != 0) {
            i = publicationByIdQuery.editorCount;
        }
        return publicationByIdQuery.copy(str, str2, i);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationByIdQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getCollectionId() {
        return this.collectionId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getEditorCount() {
        return this.editorCount;
    }

    public final PublicationByIdQuery copy(String publicationId, String collectionId, int editorCount) {
        publicationId.getClass();
        collectionId.getClass();
        return new PublicationByIdQuery(publicationId, collectionId, editorCount);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationByIdQuery($publicationId: String!, $collectionId: ID!, $editorCount: Int!) { publication(id: $publicationId) { __typename id slug name tagline avatar { __typename id } followGraph { __typename followerCount } mastheadConnection(first: $editorCount, after: \"\", opts: { filterRoles: [EDITOR] } ) { __typename edges { __typename node { __typename user { __typename imageId id } } } } } collection(id: $collectionId) { __typename viewerEdge { __typename isEditor id } ...CollectionNewsletterData id } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment CollectionNewsletterData on Collection { __typename id newsletterV3 { __typename showPromo ...NewsletterData id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationByIdQuery)) {
            return false;
        }
        PublicationByIdQuery publicationByIdQuery = (PublicationByIdQuery) other;
        return g76.L(this.publicationId, publicationByIdQuery.publicationId) && g76.L(this.collectionId, publicationByIdQuery.collectionId) && this.editorCount == publicationByIdQuery.editorCount;
    }

    public final String getCollectionId() {
        return this.collectionId;
    }

    public final int getEditorCount() {
        return this.editorCount;
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return wgd.o(this.publicationId.hashCode() * 31, 31, this.collectionId) + this.editorCount;
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
        sm8 sm8VarM = lv8.m(Query.INSTANCE);
        List<sx1> list = PublicationByIdQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationByIdQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.publicationId;
        String str2 = this.collectionId;
        return ho2.H(y30.u("PublicationByIdQuery(publicationId=", str, ", collectionId=", str2, ", editorCount="), this.editorCount, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationByIdQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationByIdQuery($publicationId: String!, $collectionId: ID!, $editorCount: Int!) { publication(id: $publicationId) { __typename id slug name tagline avatar { __typename id } followGraph { __typename followerCount } mastheadConnection(first: $editorCount, after: \"\", opts: { filterRoles: [EDITOR] } ) { __typename edges { __typename node { __typename user { __typename imageId id } } } } } collection(id: $collectionId) { __typename viewerEdge { __typename isEditor id } ...CollectionNewsletterData id } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment CollectionNewsletterData on Collection { __typename id newsletterV3 { __typename showPromo ...NewsletterData id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
