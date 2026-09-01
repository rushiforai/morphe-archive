package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationStaffQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationStaffQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.fragment.PublicationFlairedStaffData;
import com.medium.android.graphql.selections.PublicationStaffQuerySelections;
import com.medium.android.graphql.type.PublicationStaffRole;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
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
import defpackage.wgd;
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u0000\n\u0002\b\u0012\b\u0086\b\u0018\u0000 42\b\u0012\u0004\u0012\u00020\u00020\u0001:\u000756789:4B'\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000f\u0010\rJ'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001d\u001a\u00020\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\rJ\u0010\u0010 \u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\"\u0010\rJ\u0010\u0010#\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b#\u0010$J8\u0010%\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\bHÆ\u0001¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b'\u0010\rJ\u0010\u0010(\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b(\u0010!J\u001a\u0010+\u001a\u00020\u00142\b\u0010*\u001a\u0004\u0018\u00010)HÖ\u0003¢\u0006\u0004\b+\u0010,R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010-\u001a\u0004\b.\u0010\rR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010/\u001a\u0004\b0\u0010!R\u0017\u0010\u0007\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0007\u0010-\u001a\u0004\b1\u0010\rR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00102\u001a\u0004\b3\u0010$¨\u0006;"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationStaffQuery$Data;", "", "publicationId", "", "first", "after", "Lcom/medium/android/graphql/type/PublicationStaffRole;", "role", "<init>", "(Ljava/lang/String;ILjava/lang/String;Lcom/medium/android/graphql/type/PublicationStaffRole;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()I", "component3", "component4", "()Lcom/medium/android/graphql/type/PublicationStaffRole;", "copy", "(Ljava/lang/String;ILjava/lang/String;Lcom/medium/android/graphql/type/PublicationStaffRole;)Lcom/medium/android/graphql/PublicationStaffQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "I", "getFirst", "getAfter", "Lcom/medium/android/graphql/type/PublicationStaffRole;", "getRole", "Companion", "Data", "Publication", "MastheadConnection", "Edge", "Node", "PageInfo", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationStaffQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "18bdcc59b19c790e1b109ec84d30cabc1d0c413f13f8dc81ad7f02b56405a736";
    public static final String OPERATION_NAME = "PublicationStaffQuery";
    private final String after;
    private final int first;
    private final String publicationId;
    private final PublicationStaffRole role;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationStaffQuery$Publication;", "publication", "<init>", "(Lcom/medium/android/graphql/PublicationStaffQuery$Publication;)V", "component1", "()Lcom/medium/android/graphql/PublicationStaffQuery$Publication;", "copy", "(Lcom/medium/android/graphql/PublicationStaffQuery$Publication;)Lcom/medium/android/graphql/PublicationStaffQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationStaffQuery$Publication;", "getPublication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Publication publication;

        public Data(Publication publication) {
            this.publication = publication;
        }

        public static Data copy$default(Data data, Publication publication, int i, Object obj) {
            if ((i & 1) != 0) {
                publication = data.publication;
            }
            data.getClass();
            return new Data(publication);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        public final Data copy(Publication publication) {
            return new Data(publication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.publication, ((Data) other).publication);
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final int hashCode() {
            Publication publication = this.publication;
            if (publication == null) {
                return 0;
            }
            return publication.hashCode();
        }

        public final String toString() {
            return "Data(publication=" + this.publication + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/PublicationStaffQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationStaffQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/PublicationStaffQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$MastheadConnection;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/PublicationStaffQuery$Edge;", "pageInfo", "Lcom/medium/android/graphql/PublicationStaffQuery$PageInfo;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/PublicationStaffQuery$PageInfo;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "getPageInfo", "()Lcom/medium/android/graphql/PublicationStaffQuery$PageInfo;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MastheadConnection {
        private final String __typename;
        private final List<Edge> edges;
        private final PageInfo pageInfo;

        public MastheadConnection(String str, List<Edge> list, PageInfo pageInfo) {
            str.getClass();
            pageInfo.getClass();
            this.__typename = str;
            this.edges = list;
            this.pageInfo = pageInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ MastheadConnection copy$default(MastheadConnection mastheadConnection, String str, List list, PageInfo pageInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mastheadConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = mastheadConnection.edges;
            }
            if ((i & 4) != 0) {
                pageInfo = mastheadConnection.pageInfo;
            }
            return mastheadConnection.copy(str, list, pageInfo);
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

        public final MastheadConnection copy(String __typename, List<Edge> edges, PageInfo pageInfo) {
            __typename.getClass();
            pageInfo.getClass();
            return new MastheadConnection(__typename, edges, pageInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MastheadConnection)) {
                return false;
            }
            MastheadConnection mastheadConnection = (MastheadConnection) other;
            return g76.L(this.__typename, mastheadConnection.__typename) && g76.L(this.edges, mastheadConnection.edges) && g76.L(this.pageInfo, mastheadConnection.pageInfo);
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
            int iHashCode = this.__typename.hashCode() * 31;
            List<Edge> list = this.edges;
            return this.pageInfo.hashCode() + ((iHashCode + (list == null ? 0 : list.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            List<Edge> list = this.edges;
            PageInfo pageInfo = this.pageInfo;
            StringBuilder sbE = b09.E("MastheadConnection(__typename=", str, ", edges=", ", pageInfo=", list);
            sbE.append(pageInfo);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$Node;", "", "__typename", "", "publicationFlairedStaffData", "Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;)V", "get__typename", "()Ljava/lang/String;", "getPublicationFlairedStaffData", "()Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final PublicationFlairedStaffData publicationFlairedStaffData;

        public Node(String str, PublicationFlairedStaffData publicationFlairedStaffData) {
            str.getClass();
            publicationFlairedStaffData.getClass();
            this.__typename = str;
            this.publicationFlairedStaffData = publicationFlairedStaffData;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, PublicationFlairedStaffData publicationFlairedStaffData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                publicationFlairedStaffData = node.publicationFlairedStaffData;
            }
            return node.copy(str, publicationFlairedStaffData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationFlairedStaffData getPublicationFlairedStaffData() {
            return this.publicationFlairedStaffData;
        }

        public final Node copy(String __typename, PublicationFlairedStaffData publicationFlairedStaffData) {
            __typename.getClass();
            publicationFlairedStaffData.getClass();
            return new Node(__typename, publicationFlairedStaffData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.publicationFlairedStaffData, node.publicationFlairedStaffData);
        }

        public final PublicationFlairedStaffData getPublicationFlairedStaffData() {
            return this.publicationFlairedStaffData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.publicationFlairedStaffData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Node(__typename=" + this.__typename + ", publicationFlairedStaffData=" + this.publicationFlairedStaffData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$PageInfo;", "", "__typename", "", "pageInfoData", "Lcom/medium/android/graphql/fragment/PageInfoData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PageInfoData;)V", "get__typename", "()Ljava/lang/String;", "getPageInfoData", "()Lcom/medium/android/graphql/fragment/PageInfoData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$Publication;", "", "__typename", "", "mastheadConnection", "Lcom/medium/android/graphql/PublicationStaffQuery$MastheadConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationStaffQuery$MastheadConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMastheadConnection", "()Lcom/medium/android/graphql/PublicationStaffQuery$MastheadConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final String id;
        private final MastheadConnection mastheadConnection;

        public Publication(String str, MastheadConnection mastheadConnection, String str2) {
            str.getClass();
            mastheadConnection.getClass();
            str2.getClass();
            this.__typename = str;
            this.mastheadConnection = mastheadConnection;
            this.id = str2;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, MastheadConnection mastheadConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                mastheadConnection = publication.mastheadConnection;
            }
            if ((i & 4) != 0) {
                str2 = publication.id;
            }
            return publication.copy(str, mastheadConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MastheadConnection getMastheadConnection() {
            return this.mastheadConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, MastheadConnection mastheadConnection, String id) {
            __typename.getClass();
            mastheadConnection.getClass();
            id.getClass();
            return new Publication(__typename, mastheadConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.mastheadConnection, publication.mastheadConnection) && g76.L(this.id, publication.id);
        }

        public final String getId() {
            return this.id;
        }

        public final MastheadConnection getMastheadConnection() {
            return this.mastheadConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.mastheadConnection.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            MastheadConnection mastheadConnection = this.mastheadConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Publication(__typename=");
            sb.append(str);
            sb.append(", mastheadConnection=");
            sb.append(mastheadConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public PublicationStaffQuery(String str, int i, String str2, PublicationStaffRole publicationStaffRole) {
        str.getClass();
        str2.getClass();
        publicationStaffRole.getClass();
        this.publicationId = str;
        this.first = i;
        this.after = str2;
        this.role = publicationStaffRole;
    }

    public static /* synthetic */ PublicationStaffQuery copy$default(PublicationStaffQuery publicationStaffQuery, String str, int i, String str2, PublicationStaffRole publicationStaffRole, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = publicationStaffQuery.publicationId;
        }
        if ((i2 & 2) != 0) {
            i = publicationStaffQuery.first;
        }
        if ((i2 & 4) != 0) {
            str2 = publicationStaffQuery.after;
        }
        if ((i2 & 8) != 0) {
            publicationStaffRole = publicationStaffQuery.role;
        }
        return publicationStaffQuery.copy(str, i, str2, publicationStaffRole);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationStaffQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
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
    public final PublicationStaffRole getRole() {
        return this.role;
    }

    public final PublicationStaffQuery copy(String publicationId, int first, String after, PublicationStaffRole role) {
        publicationId.getClass();
        after.getClass();
        role.getClass();
        return new PublicationStaffQuery(publicationId, first, after, role);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationStaffQuery($publicationId: String!, $first: Int!, $after: String!, $role: PublicationStaffRole!) { publication(id: $publicationId) { __typename mastheadConnection(first: $first, after: $after, opts: { filterRoles: [$role] } ) { __typename edges { __typename node { __typename ...PublicationFlairedStaffData } } pageInfo { __typename ...PageInfoData } } id } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment PublicationStaffData on User { __typename id name bio imageId ...UserFollowData membership { __typename ...membershipFragment } newsletterV3 { __typename id } }  fragment PublicationFlairedStaffData on PublicationFlairedUser { __typename title user { __typename ...PublicationStaffData id } }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationStaffQuery)) {
            return false;
        }
        PublicationStaffQuery publicationStaffQuery = (PublicationStaffQuery) other;
        return g76.L(this.publicationId, publicationStaffQuery.publicationId) && this.first == publicationStaffQuery.first && g76.L(this.after, publicationStaffQuery.after) && this.role == publicationStaffQuery.role;
    }

    public final String getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final PublicationStaffRole getRole() {
        return this.role;
    }

    public final int hashCode() {
        return this.role.hashCode() + wgd.o(((this.publicationId.hashCode() * 31) + this.first) * 31, 31, this.after);
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
        List<sx1> list = PublicationStaffQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationStaffQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.publicationId;
        int i = this.first;
        String str2 = this.after;
        PublicationStaffRole publicationStaffRole = this.role;
        StringBuilder sbT = y30.t(i, "PublicationStaffQuery(publicationId=", str, ", first=", ", after=");
        sbT.append(str2);
        sbT.append(", role=");
        sbT.append(publicationStaffRole);
        sbT.append(")");
        return sbT.toString();
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationStaffQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationStaffQuery($publicationId: String!, $first: Int!, $after: String!, $role: PublicationStaffRole!) { publication(id: $publicationId) { __typename mastheadConnection(first: $first, after: $after, opts: { filterRoles: [$role] } ) { __typename edges { __typename node { __typename ...PublicationFlairedStaffData } } pageInfo { __typename ...PageInfoData } } id } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment PublicationStaffData on User { __typename id name bio imageId ...UserFollowData membership { __typename ...membershipFragment } newsletterV3 { __typename id } }  fragment PublicationFlairedStaffData on PublicationFlairedUser { __typename title user { __typename ...PublicationStaffData id } }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
