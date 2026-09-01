package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PostCatalogsConnectionQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PostCatalogsConnectionQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.EntityCatalogsConnectionData;
import com.medium.android.graphql.selections.PostCatalogsConnectionQuerySelections;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.Query;
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
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\r\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0005./01-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\nJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\nJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\nJ\u0010\u0010\u001d\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ$\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b!\u0010\nJ\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u001a\u0010'\u001a\u00020\u00112\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001e¨\u00062"}, d2 = {"Lcom/medium/android/graphql/PostCatalogsConnectionQuery;", "Luqa;", "Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Data;", "", "postId", "Lcom/medium/android/graphql/type/CatalogType;", "catalogType", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogType;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()Lcom/medium/android/graphql/type/CatalogType;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/CatalogType;)Lcom/medium/android/graphql/PostCatalogsConnectionQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Lcom/medium/android/graphql/type/CatalogType;", "getCatalogType", "Companion", "Data", "Post", "ViewerEdge", "CatalogsConnection", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostCatalogsConnectionQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "b624c222f7fe0819f95c4b3013c005f4b502799a0b48e211ab4dbe936b115376";
    public static final String OPERATION_NAME = "PostCatalogsConnection";
    private final CatalogType catalogType;
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PostCatalogsConnectionQuery$CatalogsConnection;", "", "__typename", "", "entityCatalogsConnectionData", "Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData;)V", "get__typename", "()Ljava/lang/String;", "getEntityCatalogsConnectionData", "()Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CatalogsConnection {
        private final String __typename;
        private final EntityCatalogsConnectionData entityCatalogsConnectionData;

        public CatalogsConnection(String str, EntityCatalogsConnectionData entityCatalogsConnectionData) {
            str.getClass();
            entityCatalogsConnectionData.getClass();
            this.__typename = str;
            this.entityCatalogsConnectionData = entityCatalogsConnectionData;
        }

        public static /* synthetic */ CatalogsConnection copy$default(CatalogsConnection catalogsConnection, String str, EntityCatalogsConnectionData entityCatalogsConnectionData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalogsConnection.__typename;
            }
            if ((i & 2) != 0) {
                entityCatalogsConnectionData = catalogsConnection.entityCatalogsConnectionData;
            }
            return catalogsConnection.copy(str, entityCatalogsConnectionData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final EntityCatalogsConnectionData getEntityCatalogsConnectionData() {
            return this.entityCatalogsConnectionData;
        }

        public final CatalogsConnection copy(String __typename, EntityCatalogsConnectionData entityCatalogsConnectionData) {
            __typename.getClass();
            entityCatalogsConnectionData.getClass();
            return new CatalogsConnection(__typename, entityCatalogsConnectionData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CatalogsConnection)) {
                return false;
            }
            CatalogsConnection catalogsConnection = (CatalogsConnection) other;
            return g76.L(this.__typename, catalogsConnection.__typename) && g76.L(this.entityCatalogsConnectionData, catalogsConnection.entityCatalogsConnectionData);
        }

        public final EntityCatalogsConnectionData getEntityCatalogsConnectionData() {
            return this.entityCatalogsConnectionData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.entityCatalogsConnectionData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "CatalogsConnection(__typename=" + this.__typename + ", entityCatalogsConnectionData=" + this.entityCatalogsConnectionData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Post;", "post", "<init>", "(Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Post;)V", "component1", "()Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Post;", "copy", "(Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Post;)Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Post;", "getPost", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Post post;

        public Data(Post post) {
            this.post = post;
        }

        public static Data copy$default(Data data, Post post, int i, Object obj) {
            if ((i & 1) != 0) {
                post = data.post;
            }
            data.getClass();
            return new Data(post);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Post getPost() {
            return this.post;
        }

        public final Data copy(Post post) {
            return new Data(post);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.post, ((Data) other).post);
        }

        public final Post getPost() {
            return this.post;
        }

        public final int hashCode() {
            Post post = this.post;
            if (post == null) {
                return 0;
            }
            return post.hashCode();
        }

        public final String toString() {
            return "Data(post=" + this.post + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Post;", "", "__typename", "", "viewerEdge", "Lcom/medium/android/graphql/PostCatalogsConnectionQuery$ViewerEdge;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PostCatalogsConnectionQuery$ViewerEdge;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getViewerEdge", "()Lcom/medium/android/graphql/PostCatalogsConnectionQuery$ViewerEdge;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final ViewerEdge viewerEdge;

        public Post(String str, ViewerEdge viewerEdge, String str2) {
            str.getClass();
            viewerEdge.getClass();
            str2.getClass();
            this.__typename = str;
            this.viewerEdge = viewerEdge;
            this.id = str2;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                viewerEdge = post.viewerEdge;
            }
            if ((i & 4) != 0) {
                str2 = post.id;
            }
            return post.copy(str, viewerEdge, str2);
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

        public final Post copy(String __typename, ViewerEdge viewerEdge, String id) {
            __typename.getClass();
            viewerEdge.getClass();
            id.getClass();
            return new Post(__typename, viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.viewerEdge, post.viewerEdge) && g76.L(this.id, post.id);
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
            return this.id.hashCode() + ((this.viewerEdge.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            ViewerEdge viewerEdge = this.viewerEdge;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Post(__typename=");
            sb.append(str);
            sb.append(", viewerEdge=");
            sb.append(viewerEdge);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PostCatalogsConnectionQuery$ViewerEdge;", "", "__typename", "", "catalogsConnection", "Lcom/medium/android/graphql/PostCatalogsConnectionQuery$CatalogsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PostCatalogsConnectionQuery$CatalogsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getCatalogsConnection", "()Lcom/medium/android/graphql/PostCatalogsConnectionQuery$CatalogsConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final CatalogsConnection catalogsConnection;
        private final String id;

        public ViewerEdge(String str, CatalogsConnection catalogsConnection, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.catalogsConnection = catalogsConnection;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, CatalogsConnection catalogsConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                catalogsConnection = viewerEdge.catalogsConnection;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, catalogsConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogsConnection getCatalogsConnection() {
            return this.catalogsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, CatalogsConnection catalogsConnection, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, catalogsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.catalogsConnection, viewerEdge.catalogsConnection) && g76.L(this.id, viewerEdge.id);
        }

        public final CatalogsConnection getCatalogsConnection() {
            return this.catalogsConnection;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            CatalogsConnection catalogsConnection = this.catalogsConnection;
            return this.id.hashCode() + ((iHashCode + (catalogsConnection == null ? 0 : catalogsConnection.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            CatalogsConnection catalogsConnection = this.catalogsConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", catalogsConnection=");
            sb.append(catalogsConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public PostCatalogsConnectionQuery(String str, CatalogType catalogType) {
        str.getClass();
        catalogType.getClass();
        this.postId = str;
        this.catalogType = catalogType;
    }

    public static /* synthetic */ PostCatalogsConnectionQuery copy$default(PostCatalogsConnectionQuery postCatalogsConnectionQuery, String str, CatalogType catalogType, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postCatalogsConnectionQuery.postId;
        }
        if ((i & 2) != 0) {
            catalogType = postCatalogsConnectionQuery.catalogType;
        }
        return postCatalogsConnectionQuery.copy(str, catalogType);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PostCatalogsConnectionQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final CatalogType getCatalogType() {
        return this.catalogType;
    }

    public final PostCatalogsConnectionQuery copy(String postId, CatalogType catalogType) {
        postId.getClass();
        catalogType.getClass();
        return new PostCatalogsConnectionQuery(postId, catalogType);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PostCatalogsConnection($postId: ID!, $catalogType: CatalogType!) { post(id: $postId) { __typename viewerEdge { __typename catalogsConnection { __typename ...EntityCatalogsConnectionData } id } id } }  fragment EntityCatalogsConnectionData on EntityCatalogsConnection { __typename predefinedContainingThis { __typename catalogId catalogItemIds predefined version } catalogsContainingThis(type: $catalogType) { __typename catalogId catalogItemIds } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostCatalogsConnectionQuery)) {
            return false;
        }
        PostCatalogsConnectionQuery postCatalogsConnectionQuery = (PostCatalogsConnectionQuery) other;
        return g76.L(this.postId, postCatalogsConnectionQuery.postId) && this.catalogType == postCatalogsConnectionQuery.catalogType;
    }

    public final CatalogType getCatalogType() {
        return this.catalogType;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.catalogType.hashCode() + (this.postId.hashCode() * 31);
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
        List<sx1> list = PostCatalogsConnectionQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PostCatalogsConnectionQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "PostCatalogsConnectionQuery(postId=" + this.postId + ", catalogType=" + this.catalogType + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PostCatalogsConnectionQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PostCatalogsConnection($postId: ID!, $catalogType: CatalogType!) { post(id: $postId) { __typename viewerEdge { __typename catalogsConnection { __typename ...EntityCatalogsConnectionData } id } id } }  fragment EntityCatalogsConnectionData on EntityCatalogsConnection { __typename predefinedContainingThis { __typename catalogId catalogItemIds predefined version } catalogsContainingThis(type: $catalogType) { __typename catalogId catalogItemIds } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
