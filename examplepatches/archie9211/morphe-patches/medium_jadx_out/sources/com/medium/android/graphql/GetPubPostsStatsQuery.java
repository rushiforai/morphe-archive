package com.medium.android.graphql;

import com.medium.android.graphql.adapter.GetPubPostsStatsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetPubPostsStatsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.fragment.StatsPost;
import com.medium.android.graphql.selections.GetPubPostsStatsQuerySelections;
import com.medium.android.graphql.type.PublicationRef;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k8;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sqa;
import defpackage.sx1;
import defpackage.uqa;
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0000\n\u0002\b\u0014\b\u0086\b\u0018\u0000 <2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0007=>?@AB<BC\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\t\u0012\u0010\b\u0002\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\t¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0012\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0013\u0010\u0011J'\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0015\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010!\u001a\u00020 H\u0016¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b'\u0010\u0011J\u0018\u0010(\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\tHÆ\u0003¢\u0006\u0004\b(\u0010)J\u0018\u0010*\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\tHÆ\u0003¢\u0006\u0004\b*\u0010)JR\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\t2\u0010\b\u0002\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\tHÆ\u0001¢\u0006\u0004\b+\u0010,J\u0010\u0010-\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b-\u0010\u0011J\u0010\u0010.\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b.\u0010&J\u001a\u00101\u001a\u00020\u00182\b\u00100\u001a\u0004\u0018\u00010/HÖ\u0003¢\u0006\u0004\b1\u00102R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00103\u001a\u0004\b4\u0010$R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00105\u001a\u0004\b6\u0010&R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u00107\u001a\u0004\b8\u0010\u0011R\u001f\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\t8\u0006¢\u0006\f\n\u0004\b\u000b\u00109\u001a\u0004\b:\u0010)R\u001f\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\t8\u0006¢\u0006\f\n\u0004\b\r\u00109\u001a\u0004\b;\u0010)¨\u0006C"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery;", "Luqa;", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$Data;", "Lcom/medium/android/graphql/type/PublicationRef;", "ref", "", "first", "", "after", "Lzv8;", "Lcom/medium/android/graphql/type/PublicationPostsOrderBy;", "orderBy", "Lcom/medium/android/graphql/type/PublicationPostsFilter;", "filter", "<init>", "(Lcom/medium/android/graphql/type/PublicationRef;ILjava/lang/String;Lzv8;Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/PublicationRef;", "component2", "()I", "component3", "component4", "()Lzv8;", "component5", "copy", "(Lcom/medium/android/graphql/type/PublicationRef;ILjava/lang/String;Lzv8;Lzv8;)Lcom/medium/android/graphql/GetPubPostsStatsQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/PublicationRef;", "getRef", "I", "getFirst", "Ljava/lang/String;", "getAfter", "Lzv8;", "getOrderBy", "getFilter", "Companion", "Data", "PublicationByRef", "PublicationPostsConnection", "Edge", "Node", "PageInfo", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetPubPostsStatsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "c9c103970b6e33af52e6ad8f29923f21023dad66466ee2c42a65490e8d5bf342";
    public static final String OPERATION_NAME = "GetPubPostsStatsQuery";
    private final String after;
    private final zv8 filter;
    private final int first;
    private final zv8 orderBy;
    private final PublicationRef ref;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationByRef;", "publicationByRef", "<init>", "(Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationByRef;)V", "component1", "()Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationByRef;", "copy", "(Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationByRef;)Lcom/medium/android/graphql/GetPubPostsStatsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationByRef;", "getPublicationByRef", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final PublicationByRef publicationByRef;

        public Data(PublicationByRef publicationByRef) {
            this.publicationByRef = publicationByRef;
        }

        public static Data copy$default(Data data, PublicationByRef publicationByRef, int i, Object obj) {
            if ((i & 1) != 0) {
                publicationByRef = data.publicationByRef;
            }
            data.getClass();
            return new Data(publicationByRef);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PublicationByRef getPublicationByRef() {
            return this.publicationByRef;
        }

        public final Data copy(PublicationByRef publicationByRef) {
            return new Data(publicationByRef);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.publicationByRef, ((Data) other).publicationByRef);
        }

        public final PublicationByRef getPublicationByRef() {
            return this.publicationByRef;
        }

        public final int hashCode() {
            PublicationByRef publicationByRef = this.publicationByRef;
            if (publicationByRef == null) {
                return 0;
            }
            return publicationByRef.hashCode();
        }

        public final String toString() {
            return "Data(publicationByRef=" + this.publicationByRef + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPubPostsStatsQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/GetPubPostsStatsQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$Node;", "", "__typename", "", "id", "statsPost", "Lcom/medium/android/graphql/fragment/StatsPost;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/StatsPost;)V", "get__typename", "()Ljava/lang/String;", "getId", "getStatsPost", "()Lcom/medium/android/graphql/fragment/StatsPost;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final String id;
        private final StatsPost statsPost;

        public Node(String str, String str2, StatsPost statsPost) {
            str.getClass();
            str2.getClass();
            statsPost.getClass();
            this.__typename = str;
            this.id = str2;
            this.statsPost = statsPost;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, String str2, StatsPost statsPost, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                str2 = node.id;
            }
            if ((i & 4) != 0) {
                statsPost = node.statsPost;
            }
            return node.copy(str, str2, statsPost);
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
        public final StatsPost getStatsPost() {
            return this.statsPost;
        }

        public final Node copy(String __typename, String id, StatsPost statsPost) {
            __typename.getClass();
            id.getClass();
            statsPost.getClass();
            return new Node(__typename, id, statsPost);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.id, node.id) && g76.L(this.statsPost, node.statsPost);
        }

        public final String getId() {
            return this.id;
        }

        public final StatsPost getStatsPost() {
            return this.statsPost;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.statsPost.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            StatsPost statsPost = this.statsPost;
            StringBuilder sbU = y30.u("Node(__typename=", str, ", id=", str2, ", statsPost=");
            sbU.append(statsPost);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$PageInfo;", "", "__typename", "", "pageInfoData", "Lcom/medium/android/graphql/fragment/PageInfoData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PageInfoData;)V", "get__typename", "()Ljava/lang/String;", "getPageInfoData", "()Lcom/medium/android/graphql/fragment/PageInfoData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PageInfo {
        private final String __typename;
        private final PageInfoData pageInfoData;

        public PageInfo(String str, PageInfoData pageInfoData) {
            str.getClass();
            pageInfoData.getClass();
            this.__typename = str;
            this.pageInfoData = pageInfoData;
        }

        public static /* synthetic */ PageInfo copy$default(PageInfo pageInfo, String str, PageInfoData pageInfoData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pageInfo.__typename;
            }
            if ((i & 2) != 0) {
                pageInfoData = pageInfo.pageInfoData;
            }
            return pageInfo.copy(str, pageInfoData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PageInfoData getPageInfoData() {
            return this.pageInfoData;
        }

        public final PageInfo copy(String __typename, PageInfoData pageInfoData) {
            __typename.getClass();
            pageInfoData.getClass();
            return new PageInfo(__typename, pageInfoData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PageInfo)) {
                return false;
            }
            PageInfo pageInfo = (PageInfo) other;
            return g76.L(this.__typename, pageInfo.__typename) && g76.L(this.pageInfoData, pageInfo.pageInfoData);
        }

        public final PageInfoData getPageInfoData() {
            return this.pageInfoData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pageInfoData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "PageInfo(__typename=" + this.__typename + ", pageInfoData=" + this.pageInfoData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationByRef;", "", "__typename", "", "publicationPostsConnection", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationPostsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationPostsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getPublicationPostsConnection", "()Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationPostsConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationByRef {
        private final String __typename;
        private final String id;
        private final PublicationPostsConnection publicationPostsConnection;

        public PublicationByRef(String str, PublicationPostsConnection publicationPostsConnection, String str2) {
            str.getClass();
            publicationPostsConnection.getClass();
            str2.getClass();
            this.__typename = str;
            this.publicationPostsConnection = publicationPostsConnection;
            this.id = str2;
        }

        public static /* synthetic */ PublicationByRef copy$default(PublicationByRef publicationByRef, String str, PublicationPostsConnection publicationPostsConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationByRef.__typename;
            }
            if ((i & 2) != 0) {
                publicationPostsConnection = publicationByRef.publicationPostsConnection;
            }
            if ((i & 4) != 0) {
                str2 = publicationByRef.id;
            }
            return publicationByRef.copy(str, publicationPostsConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationPostsConnection getPublicationPostsConnection() {
            return this.publicationPostsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final PublicationByRef copy(String __typename, PublicationPostsConnection publicationPostsConnection, String id) {
            __typename.getClass();
            publicationPostsConnection.getClass();
            id.getClass();
            return new PublicationByRef(__typename, publicationPostsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationByRef)) {
                return false;
            }
            PublicationByRef publicationByRef = (PublicationByRef) other;
            return g76.L(this.__typename, publicationByRef.__typename) && g76.L(this.publicationPostsConnection, publicationByRef.publicationPostsConnection) && g76.L(this.id, publicationByRef.id);
        }

        public final String getId() {
            return this.id;
        }

        public final PublicationPostsConnection getPublicationPostsConnection() {
            return this.publicationPostsConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.publicationPostsConnection.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            PublicationPostsConnection publicationPostsConnection = this.publicationPostsConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("PublicationByRef(__typename=");
            sb.append(str);
            sb.append(", publicationPostsConnection=");
            sb.append(publicationPostsConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0019\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$PublicationPostsConnection;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$Edge;", "pageInfo", "Lcom/medium/android/graphql/GetPubPostsStatsQuery$PageInfo;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/GetPubPostsStatsQuery$PageInfo;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "getPageInfo", "()Lcom/medium/android/graphql/GetPubPostsStatsQuery$PageInfo;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationPostsConnection {
        private final String __typename;
        private final List<Edge> edges;
        private final PageInfo pageInfo;

        public PublicationPostsConnection(String str, List<Edge> list, PageInfo pageInfo) {
            str.getClass();
            list.getClass();
            pageInfo.getClass();
            this.__typename = str;
            this.edges = list;
            this.pageInfo = pageInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PublicationPostsConnection copy$default(PublicationPostsConnection publicationPostsConnection, String str, List list, PageInfo pageInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationPostsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = publicationPostsConnection.edges;
            }
            if ((i & 4) != 0) {
                pageInfo = publicationPostsConnection.pageInfo;
            }
            return publicationPostsConnection.copy(str, list, pageInfo);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PageInfo getPageInfo() {
            return this.pageInfo;
        }

        public final PublicationPostsConnection copy(String __typename, List<Edge> edges, PageInfo pageInfo) {
            __typename.getClass();
            edges.getClass();
            pageInfo.getClass();
            return new PublicationPostsConnection(__typename, edges, pageInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationPostsConnection)) {
                return false;
            }
            PublicationPostsConnection publicationPostsConnection = (PublicationPostsConnection) other;
            return g76.L(this.__typename, publicationPostsConnection.__typename) && g76.L(this.edges, publicationPostsConnection.edges) && g76.L(this.pageInfo, publicationPostsConnection.pageInfo);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final PageInfo getPageInfo() {
            return this.pageInfo;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.pageInfo.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.edges);
        }

        public final String toString() {
            String str = this.__typename;
            List<Edge> list = this.edges;
            PageInfo pageInfo = this.pageInfo;
            StringBuilder sbE = b09.E("PublicationPostsConnection(__typename=", str, ", edges=", ", pageInfo=", list);
            sbE.append(pageInfo);
            sbE.append(")");
            return sbE.toString();
        }
    }

    public GetPubPostsStatsQuery(PublicationRef publicationRef, int i, String str, zv8 zv8Var, zv8 zv8Var2) {
        publicationRef.getClass();
        str.getClass();
        zv8Var.getClass();
        zv8Var2.getClass();
        this.ref = publicationRef;
        this.first = i;
        this.after = str;
        this.orderBy = zv8Var;
        this.filter = zv8Var2;
    }

    public static /* synthetic */ GetPubPostsStatsQuery copy$default(GetPubPostsStatsQuery getPubPostsStatsQuery, PublicationRef publicationRef, int i, String str, zv8 zv8Var, zv8 zv8Var2, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            publicationRef = getPubPostsStatsQuery.ref;
        }
        if ((i2 & 2) != 0) {
            i = getPubPostsStatsQuery.first;
        }
        if ((i2 & 4) != 0) {
            str = getPubPostsStatsQuery.after;
        }
        if ((i2 & 8) != 0) {
            zv8Var = getPubPostsStatsQuery.orderBy;
        }
        if ((i2 & 16) != 0) {
            zv8Var2 = getPubPostsStatsQuery.filter;
        }
        zv8 zv8Var3 = zv8Var2;
        String str2 = str;
        return getPubPostsStatsQuery.copy(publicationRef, i, str2, zv8Var, zv8Var3);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetPubPostsStatsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PublicationRef getRef() {
        return this.ref;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getAfter() {
        return this.after;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getOrderBy() {
        return this.orderBy;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getFilter() {
        return this.filter;
    }

    public final GetPubPostsStatsQuery copy(PublicationRef ref, int first, String after, zv8 orderBy, zv8 filter) {
        ref.getClass();
        after.getClass();
        orderBy.getClass();
        filter.getClass();
        return new GetPubPostsStatsQuery(ref, first, after, orderBy, filter);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetPubPostsStatsQuery($ref: PublicationRef!, $first: Int!, $after: String!, $orderBy: PublicationPostsOrderBy, $filter: PublicationPostsFilter) { publicationByRef(ref: $ref) { __typename publicationPostsConnection(first: $first, after: $after, orderBy: $orderBy, filter: $filter) { __typename edges { __typename node { __typename ...StatsPost id } } pageInfo { __typename ...PageInfoData } } id } }  fragment StatsPost on Post { __typename id title creator { __typename id name imageId } firstPublishedAt firstBoostedAt isLocked visibility earnings { __typename total { __typename currency: currencyCode nanos units } } totalStats { __typename presentations views reads } isFeaturedInPublishedPublication }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof GetPubPostsStatsQuery)) {
            return false;
        }
        GetPubPostsStatsQuery getPubPostsStatsQuery = (GetPubPostsStatsQuery) other;
        return g76.L(this.ref, getPubPostsStatsQuery.ref) && this.first == getPubPostsStatsQuery.first && g76.L(this.after, getPubPostsStatsQuery.after) && g76.L(this.orderBy, getPubPostsStatsQuery.orderBy) && g76.L(this.filter, getPubPostsStatsQuery.filter);
    }

    public final String getAfter() {
        return this.after;
    }

    public final zv8 getFilter() {
        return this.filter;
    }

    public final int getFirst() {
        return this.first;
    }

    public final zv8 getOrderBy() {
        return this.orderBy;
    }

    public final PublicationRef getRef() {
        return this.ref;
    }

    public final int hashCode() {
        return this.filter.hashCode() + lv8.h(this.orderBy, wgd.o(((this.ref.hashCode() * 31) + this.first) * 31, 31, this.after), 31);
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
        List<sx1> list = GetPubPostsStatsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetPubPostsStatsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        PublicationRef publicationRef = this.ref;
        int i = this.first;
        String str = this.after;
        zv8 zv8Var = this.orderBy;
        zv8 zv8Var2 = this.filter;
        StringBuilder sb = new StringBuilder("GetPubPostsStatsQuery(ref=");
        sb.append(publicationRef);
        sb.append(", first=");
        sb.append(i);
        sb.append(", after=");
        sb.append(str);
        sb.append(", orderBy=");
        sb.append(zv8Var);
        sb.append(", filter=");
        return km4.B(sb, zv8Var2, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetPubPostsStatsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetPubPostsStatsQuery($ref: PublicationRef!, $first: Int!, $after: String!, $orderBy: PublicationPostsOrderBy, $filter: PublicationPostsFilter) { publicationByRef(ref: $ref) { __typename publicationPostsConnection(first: $first, after: $after, orderBy: $orderBy, filter: $filter) { __typename edges { __typename node { __typename ...StatsPost id } } pageInfo { __typename ...PageInfoData } } id } }  fragment StatsPost on Post { __typename id title creator { __typename id name imageId } firstPublishedAt firstBoostedAt isLocked visibility earnings { __typename total { __typename currency: currencyCode nanos units } } totalStats { __typename presentations views reads } isFeaturedInPublishedPublication }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ GetPubPostsStatsQuery(PublicationRef publicationRef, int i, String str, zv8 zv8Var, zv8 zv8Var2, int i2, gy2 gy2Var) {
        int i3 = i2 & 8;
        xv8 xv8Var = xv8.a;
        this(publicationRef, i, str, i3 != 0 ? xv8Var : zv8Var, (i2 & 16) != 0 ? xv8Var : zv8Var2);
    }
}
