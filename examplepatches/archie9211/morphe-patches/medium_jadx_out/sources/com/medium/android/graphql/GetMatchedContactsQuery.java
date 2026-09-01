package com.medium.android.graphql;

import androidx.work.impl.yX.VrhD;
import com.medium.android.graphql.adapter.GetMatchedContactsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetMatchedContactsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.selections.GetMatchedContactsQuerySelections;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0002\b\u0013\b\u0086\b\u0018\u0000 02\b\u0012\u0004\u0012\u00020\u00020\u0001:\t123456780B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010\fJ\u0010\u0010 \u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b \u0010!J.\u0010\"\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b$\u0010\fJ\u0010\u0010%\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b%\u0010\u001eJ\u001a\u0010(\u001a\u00020\u00072\b\u0010'\u001a\u0004\u0018\u00010&HÖ\u0003¢\u0006\u0004\b(\u0010)R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010*\u001a\u0004\b+\u0010\u001eR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010,\u001a\u0004\b-\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010.\u001a\u0004\b/\u0010!¨\u00069"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery;", "Luqa;", "Lcom/medium/android/graphql/GetMatchedContactsQuery$Data;", "", "first", "", "after", "", "includeFollowedUsers", "<init>", "(ILjava/lang/String;Z)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()I", "component2", "component3", "()Z", "copy", "(ILjava/lang/String;Z)Lcom/medium/android/graphql/GetMatchedContactsQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "I", "getFirst", "Ljava/lang/String;", "getAfter", "Z", "getIncludeFollowedUsers", "Companion", "Data", "Viewer", "MatchedContactsConnection", "OnMatchedContactsConnection", "Edge", "Node", "PageInfo", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetMatchedContactsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "b43a71c27afd40064edb93d2296e5bd71511e4f759cf4f0318012a14d37b3761";
    public static final String OPERATION_NAME = "GetMatchedContactsQuery";
    private final String after;
    private final int first;
    private final boolean includeFollowedUsers;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetMatchedContactsQuery$Viewer;", "viewer", "<init>", "(Lcom/medium/android/graphql/GetMatchedContactsQuery$Viewer;)V", "component1", "()Lcom/medium/android/graphql/GetMatchedContactsQuery$Viewer;", "copy", "(Lcom/medium/android/graphql/GetMatchedContactsQuery$Viewer;)Lcom/medium/android/graphql/GetMatchedContactsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetMatchedContactsQuery$Viewer;", "getViewer", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Viewer viewer;

        public Data(Viewer viewer) {
            this.viewer = viewer;
        }

        public static Data copy$default(Data data, Viewer viewer, int i, Object obj) {
            if ((i & 1) != 0) {
                viewer = data.viewer;
            }
            data.getClass();
            return new Data(viewer);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Viewer getViewer() {
            return this.viewer;
        }

        public final Data copy(Viewer viewer) {
            return new Data(viewer);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.viewer, ((Data) other).viewer);
        }

        public final Viewer getViewer() {
            return this.viewer;
        }

        public final int hashCode() {
            Viewer viewer = this.viewer;
            if (viewer == null) {
                return 0;
            }
            return viewer.hashCode();
        }

        public final String toString() {
            return "Data(viewer=" + this.viewer + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/GetMatchedContactsQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetMatchedContactsQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/GetMatchedContactsQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$MatchedContactsConnection;", "", "__typename", "", "onMatchedContactsConnection", "Lcom/medium/android/graphql/GetMatchedContactsQuery$OnMatchedContactsConnection;", "onUnauthorized", "Lcom/medium/android/graphql/GetMatchedContactsQuery$OnUnauthorized;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetMatchedContactsQuery$OnMatchedContactsConnection;Lcom/medium/android/graphql/GetMatchedContactsQuery$OnUnauthorized;)V", "get__typename", "()Ljava/lang/String;", "getOnMatchedContactsConnection", "()Lcom/medium/android/graphql/GetMatchedContactsQuery$OnMatchedContactsConnection;", "getOnUnauthorized", "()Lcom/medium/android/graphql/GetMatchedContactsQuery$OnUnauthorized;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MatchedContactsConnection {
        private final String __typename;
        private final OnMatchedContactsConnection onMatchedContactsConnection;
        private final OnUnauthorized onUnauthorized;

        public MatchedContactsConnection(String str, OnMatchedContactsConnection onMatchedContactsConnection, OnUnauthorized onUnauthorized) {
            str.getClass();
            this.__typename = str;
            this.onMatchedContactsConnection = onMatchedContactsConnection;
            this.onUnauthorized = onUnauthorized;
        }

        public static /* synthetic */ MatchedContactsConnection copy$default(MatchedContactsConnection matchedContactsConnection, String str, OnMatchedContactsConnection onMatchedContactsConnection, OnUnauthorized onUnauthorized, int i, Object obj) {
            if ((i & 1) != 0) {
                str = matchedContactsConnection.__typename;
            }
            if ((i & 2) != 0) {
                onMatchedContactsConnection = matchedContactsConnection.onMatchedContactsConnection;
            }
            if ((i & 4) != 0) {
                onUnauthorized = matchedContactsConnection.onUnauthorized;
            }
            return matchedContactsConnection.copy(str, onMatchedContactsConnection, onUnauthorized);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnMatchedContactsConnection getOnMatchedContactsConnection() {
            return this.onMatchedContactsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final MatchedContactsConnection copy(String __typename, OnMatchedContactsConnection onMatchedContactsConnection, OnUnauthorized onUnauthorized) {
            __typename.getClass();
            return new MatchedContactsConnection(__typename, onMatchedContactsConnection, onUnauthorized);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MatchedContactsConnection)) {
                return false;
            }
            MatchedContactsConnection matchedContactsConnection = (MatchedContactsConnection) other;
            return g76.L(this.__typename, matchedContactsConnection.__typename) && g76.L(this.onMatchedContactsConnection, matchedContactsConnection.onMatchedContactsConnection) && g76.L(this.onUnauthorized, matchedContactsConnection.onUnauthorized);
        }

        public final OnMatchedContactsConnection getOnMatchedContactsConnection() {
            return this.onMatchedContactsConnection;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnMatchedContactsConnection onMatchedContactsConnection = this.onMatchedContactsConnection;
            int iHashCode2 = (iHashCode + (onMatchedContactsConnection == null ? 0 : onMatchedContactsConnection.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            return iHashCode2 + (onUnauthorized != null ? onUnauthorized.hashCode() : 0);
        }

        public final String toString() {
            return VrhD.oubixHcEnelCqK + this.__typename + ", onMatchedContactsConnection=" + this.onMatchedContactsConnection + ", onUnauthorized=" + this.onUnauthorized + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$Node;", "", "__typename", "", "id", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final CreatorPreviewData creatorPreviewData;
        private final String id;

        public Node(String str, String str2, CreatorPreviewData creatorPreviewData) {
            str.getClass();
            str2.getClass();
            creatorPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.creatorPreviewData = creatorPreviewData;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, String str2, CreatorPreviewData creatorPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                str2 = node.id;
            }
            if ((i & 4) != 0) {
                creatorPreviewData = node.creatorPreviewData;
            }
            return node.copy(str, str2, creatorPreviewData);
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
        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final Node copy(String __typename, String id, CreatorPreviewData creatorPreviewData) {
            __typename.getClass();
            id.getClass();
            creatorPreviewData.getClass();
            return new Node(__typename, id, creatorPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.id, node.id) && g76.L(this.creatorPreviewData, node.creatorPreviewData);
        }

        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.creatorPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            CreatorPreviewData creatorPreviewData = this.creatorPreviewData;
            StringBuilder sbU = y30.u("Node(__typename=", str, ", id=", str2, ", creatorPreviewData=");
            sbU.append(creatorPreviewData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0006HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$OnMatchedContactsConnection;", "", "edges", "", "Lcom/medium/android/graphql/GetMatchedContactsQuery$Edge;", "pageInfo", "Lcom/medium/android/graphql/GetMatchedContactsQuery$PageInfo;", "<init>", "(Ljava/util/List;Lcom/medium/android/graphql/GetMatchedContactsQuery$PageInfo;)V", "getEdges", "()Ljava/util/List;", "getPageInfo", "()Lcom/medium/android/graphql/GetMatchedContactsQuery$PageInfo;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMatchedContactsConnection {
        private final List<Edge> edges;
        private final PageInfo pageInfo;

        public OnMatchedContactsConnection(List<Edge> list, PageInfo pageInfo) {
            list.getClass();
            pageInfo.getClass();
            this.edges = list;
            this.pageInfo = pageInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnMatchedContactsConnection copy$default(OnMatchedContactsConnection onMatchedContactsConnection, List list, PageInfo pageInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onMatchedContactsConnection.edges;
            }
            if ((i & 2) != 0) {
                pageInfo = onMatchedContactsConnection.pageInfo;
            }
            return onMatchedContactsConnection.copy(list, pageInfo);
        }

        public final List<Edge> component1() {
            return this.edges;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PageInfo getPageInfo() {
            return this.pageInfo;
        }

        public final OnMatchedContactsConnection copy(List<Edge> edges, PageInfo pageInfo) {
            edges.getClass();
            pageInfo.getClass();
            return new OnMatchedContactsConnection(edges, pageInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnMatchedContactsConnection)) {
                return false;
            }
            OnMatchedContactsConnection onMatchedContactsConnection = (OnMatchedContactsConnection) other;
            return g76.L(this.edges, onMatchedContactsConnection.edges) && g76.L(this.pageInfo, onMatchedContactsConnection.pageInfo);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final PageInfo getPageInfo() {
            return this.pageInfo;
        }

        public final int hashCode() {
            return this.pageInfo.hashCode() + (this.edges.hashCode() * 31);
        }

        public final String toString() {
            return "OnMatchedContactsConnection(edges=" + this.edges + ", pageInfo=" + this.pageInfo + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUnauthorized {
        private final String message;

        public OnUnauthorized(String str) {
            this.message = str;
        }

        public static OnUnauthorized copy$default(OnUnauthorized onUnauthorized, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUnauthorized.message;
            }
            onUnauthorized.getClass();
            return new OnUnauthorized(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnUnauthorized copy(String message) {
            return new OnUnauthorized(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUnauthorized) && g76.L(this.message, ((OnUnauthorized) other).message);
        }

        public final String getMessage() {
            return this.message;
        }

        public final int hashCode() {
            String str = this.message;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return ev6.x("OnUnauthorized(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$PageInfo;", "", "__typename", "", "pageInfoData", "Lcom/medium/android/graphql/fragment/PageInfoData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PageInfoData;)V", "get__typename", "()Ljava/lang/String;", "getPageInfoData", "()Lcom/medium/android/graphql/fragment/PageInfoData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$Viewer;", "", "__typename", "", "matchedContactsConnection", "Lcom/medium/android/graphql/GetMatchedContactsQuery$MatchedContactsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetMatchedContactsQuery$MatchedContactsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMatchedContactsConnection", "()Lcom/medium/android/graphql/GetMatchedContactsQuery$MatchedContactsConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Viewer {
        private final String __typename;
        private final String id;
        private final MatchedContactsConnection matchedContactsConnection;

        public Viewer(String str, MatchedContactsConnection matchedContactsConnection, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.matchedContactsConnection = matchedContactsConnection;
            this.id = str2;
        }

        public static /* synthetic */ Viewer copy$default(Viewer viewer, String str, MatchedContactsConnection matchedContactsConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewer.__typename;
            }
            if ((i & 2) != 0) {
                matchedContactsConnection = viewer.matchedContactsConnection;
            }
            if ((i & 4) != 0) {
                str2 = viewer.id;
            }
            return viewer.copy(str, matchedContactsConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MatchedContactsConnection getMatchedContactsConnection() {
            return this.matchedContactsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Viewer copy(String __typename, MatchedContactsConnection matchedContactsConnection, String id) {
            __typename.getClass();
            id.getClass();
            return new Viewer(__typename, matchedContactsConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Viewer)) {
                return false;
            }
            Viewer viewer = (Viewer) other;
            return g76.L(this.__typename, viewer.__typename) && g76.L(this.matchedContactsConnection, viewer.matchedContactsConnection) && g76.L(this.id, viewer.id);
        }

        public final String getId() {
            return this.id;
        }

        public final MatchedContactsConnection getMatchedContactsConnection() {
            return this.matchedContactsConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MatchedContactsConnection matchedContactsConnection = this.matchedContactsConnection;
            return this.id.hashCode() + ((iHashCode + (matchedContactsConnection == null ? 0 : matchedContactsConnection.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            MatchedContactsConnection matchedContactsConnection = this.matchedContactsConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("Viewer(__typename=");
            sb.append(str);
            sb.append(", matchedContactsConnection=");
            sb.append(matchedContactsConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public GetMatchedContactsQuery(int i, String str, boolean z) {
        str.getClass();
        this.first = i;
        this.after = str;
        this.includeFollowedUsers = z;
    }

    public static /* synthetic */ GetMatchedContactsQuery copy$default(GetMatchedContactsQuery getMatchedContactsQuery, int i, String str, boolean z, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = getMatchedContactsQuery.first;
        }
        if ((i2 & 2) != 0) {
            str = getMatchedContactsQuery.after;
        }
        if ((i2 & 4) != 0) {
            z = getMatchedContactsQuery.includeFollowedUsers;
        }
        return getMatchedContactsQuery.copy(i, str, z);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetMatchedContactsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getAfter() {
        return this.after;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final boolean getIncludeFollowedUsers() {
        return this.includeFollowedUsers;
    }

    public final GetMatchedContactsQuery copy(int first, String after, boolean includeFollowedUsers) {
        after.getClass();
        return new GetMatchedContactsQuery(first, after, includeFollowedUsers);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetMatchedContactsQuery($first: Int!, $after: String!, $includeFollowedUsers: Boolean!) { viewer { __typename matchedContactsConnection(first: $first, after: $after, includeFollowedUsers: $includeFollowedUsers) { __typename ... on MatchedContactsConnection { edges { __typename node { __typename ...CreatorPreviewData id } } pageInfo { __typename ...PageInfoData } } ... on Unauthorized { message } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof GetMatchedContactsQuery)) {
            return false;
        }
        GetMatchedContactsQuery getMatchedContactsQuery = (GetMatchedContactsQuery) other;
        return this.first == getMatchedContactsQuery.first && g76.L(this.after, getMatchedContactsQuery.after) && this.includeFollowedUsers == getMatchedContactsQuery.includeFollowedUsers;
    }

    public final String getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final boolean getIncludeFollowedUsers() {
        return this.includeFollowedUsers;
    }

    public final int hashCode() {
        return wgd.o(this.first * 31, 31, this.after) + (this.includeFollowedUsers ? 1231 : 1237);
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
        List<sx1> list = GetMatchedContactsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetMatchedContactsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        int i = this.first;
        String str = this.after;
        boolean z = this.includeFollowedUsers;
        StringBuilder sb = new StringBuilder("GetMatchedContactsQuery(first=");
        sb.append(i);
        sb.append(", after=");
        sb.append(str);
        sb.append(", includeFollowedUsers=");
        return lv8.t(sb, z, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetMatchedContactsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetMatchedContactsQuery($first: Int!, $after: String!, $includeFollowedUsers: Boolean!) { viewer { __typename matchedContactsConnection(first: $first, after: $after, includeFollowedUsers: $includeFollowedUsers) { __typename ... on MatchedContactsConnection { edges { __typename node { __typename ...CreatorPreviewData id } } pageInfo { __typename ...PageInfoData } } ... on Unauthorized { message } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
