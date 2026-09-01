package com.medium.android.graphql;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.graphql.adapter.AllSuggestionsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.AllSuggestionsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.graphql.selections.AllSuggestionsQuerySelections;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.RecommendedTagsInput;
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
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u0000\n\u0002\b\u001f\b\u0086\b\u0018\u0000 82\b\u0012\u0004\u0012\u00020\u00020\u0001:\u00139:;<=>?@ABCDEFGHIJ8B1\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0007\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0010\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0011\u0010\u000fJ'\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0015\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001f\u001a\u00020\u001eH\u0016¢\u0006\u0004\b\u001f\u0010 J\u0010\u0010!\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b#\u0010\u000fJ\u0018\u0010$\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0007HÆ\u0003¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b&\u0010'J@\u0010(\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\u0010\b\u0002\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00072\b\b\u0002\u0010\u000b\u001a\u00020\nHÆ\u0001¢\u0006\u0004\b(\u0010)J\u0010\u0010*\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b*\u0010\u000fJ\u0010\u0010+\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b+\u0010\"J\u001a\u0010.\u001a\u00020\u00162\b\u0010-\u001a\u0004\u0018\u00010,HÖ\u0003¢\u0006\u0004\b.\u0010/R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u00100\u001a\u0004\b1\u0010\"R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u00102\u001a\u0004\b3\u0010\u000fR\u001f\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\b0\u00078\u0006¢\u0006\f\n\u0004\b\t\u00104\u001a\u0004\b5\u0010%R\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u00106\u001a\u0004\b7\u0010'¨\u0006K"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery;", "Luqa;", "Lcom/medium/android/graphql/AllSuggestionsQuery$Data;", "", "first", "", "after", "Lzv8;", "Lcom/medium/android/graphql/type/RecommendedPublishersMode;", "mode", "Lcom/medium/android/graphql/type/RecommendedTagsInput;", "recommendedTagsInput", "<init>", "(ILjava/lang/String;Lzv8;Lcom/medium/android/graphql/type/RecommendedTagsInput;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()I", "component2", "component3", "()Lzv8;", "component4", "()Lcom/medium/android/graphql/type/RecommendedTagsInput;", "copy", "(ILjava/lang/String;Lzv8;Lcom/medium/android/graphql/type/RecommendedTagsInput;)Lcom/medium/android/graphql/AllSuggestionsQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "I", "getFirst", "Ljava/lang/String;", "getAfter", "Lzv8;", "getMode", "Lcom/medium/android/graphql/type/RecommendedTagsInput;", "getRecommendedTagsInput", "Companion", "Data", "Writers", "Edge", "Node", "OnUser", "Publications", "Edge1", "Node1", "OnCollection", "RecommendedTags", "Edge2", "Node2", "Viewer", "MatchedContactsConnection", "OnMatchedContactsConnection", "Edge3", "Node3", "OnUnauthorized", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class AllSuggestionsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "d8c9d0770bdf5736b09d1f0b0f92cd0335851d3bc56c732e9c423716f4ba2fe0";
    public static final String OPERATION_NAME = "AllSuggestionsQuery";
    private final String after;
    private final int first;
    private final zv8 mode;
    private final RecommendedTagsInput recommendedTagsInput;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0012\u0010\u0012\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J:\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\bHÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0017\u001a\u00020\u0016HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u001a\u001a\u00020\u0019HÖ\u0001¢\u0006\u0004\b\u001a\u0010\u001bJ\u001a\u0010\u001f\u001a\u00020\u001e2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001cHÖ\u0003¢\u0006\u0004\b\u001f\u0010 R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010!\u001a\u0004\b\"\u0010\rR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010#\u001a\u0004\b$\u0010\u000fR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010%\u001a\u0004\b&\u0010\u0011R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010'\u001a\u0004\b(\u0010\u0013¨\u0006)"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/AllSuggestionsQuery$Writers;", "writers", "Lcom/medium/android/graphql/AllSuggestionsQuery$Publications;", "publications", "Lcom/medium/android/graphql/AllSuggestionsQuery$RecommendedTags;", "recommendedTags", "Lcom/medium/android/graphql/AllSuggestionsQuery$Viewer;", "viewer", "<init>", "(Lcom/medium/android/graphql/AllSuggestionsQuery$Writers;Lcom/medium/android/graphql/AllSuggestionsQuery$Publications;Lcom/medium/android/graphql/AllSuggestionsQuery$RecommendedTags;Lcom/medium/android/graphql/AllSuggestionsQuery$Viewer;)V", "component1", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Writers;", "component2", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Publications;", "component3", "()Lcom/medium/android/graphql/AllSuggestionsQuery$RecommendedTags;", "component4", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Viewer;", "copy", "(Lcom/medium/android/graphql/AllSuggestionsQuery$Writers;Lcom/medium/android/graphql/AllSuggestionsQuery$Publications;Lcom/medium/android/graphql/AllSuggestionsQuery$RecommendedTags;Lcom/medium/android/graphql/AllSuggestionsQuery$Viewer;)Lcom/medium/android/graphql/AllSuggestionsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/AllSuggestionsQuery$Writers;", "getWriters", "Lcom/medium/android/graphql/AllSuggestionsQuery$Publications;", "getPublications", "Lcom/medium/android/graphql/AllSuggestionsQuery$RecommendedTags;", "getRecommendedTags", "Lcom/medium/android/graphql/AllSuggestionsQuery$Viewer;", "getViewer", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final Publications publications;
        private final RecommendedTags recommendedTags;
        private final Viewer viewer;
        private final Writers writers;

        public Data(Writers writers, Publications publications, RecommendedTags recommendedTags, Viewer viewer) {
            writers.getClass();
            publications.getClass();
            recommendedTags.getClass();
            this.writers = writers;
            this.publications = publications;
            this.recommendedTags = recommendedTags;
            this.viewer = viewer;
        }

        public static /* synthetic */ Data copy$default(Data data, Writers writers, Publications publications, RecommendedTags recommendedTags, Viewer viewer, int i, Object obj) {
            if ((i & 1) != 0) {
                writers = data.writers;
            }
            if ((i & 2) != 0) {
                publications = data.publications;
            }
            if ((i & 4) != 0) {
                recommendedTags = data.recommendedTags;
            }
            if ((i & 8) != 0) {
                viewer = data.viewer;
            }
            return data.copy(writers, publications, recommendedTags, viewer);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Writers getWriters() {
            return this.writers;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Publications getPublications() {
            return this.publications;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final RecommendedTags getRecommendedTags() {
            return this.recommendedTags;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Viewer getViewer() {
            return this.viewer;
        }

        public final Data copy(Writers writers, Publications publications, RecommendedTags recommendedTags, Viewer viewer) {
            writers.getClass();
            publications.getClass();
            recommendedTags.getClass();
            return new Data(writers, publications, recommendedTags, viewer);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.writers, data.writers) && g76.L(this.publications, data.publications) && g76.L(this.recommendedTags, data.recommendedTags) && g76.L(this.viewer, data.viewer);
        }

        public final Publications getPublications() {
            return this.publications;
        }

        public final RecommendedTags getRecommendedTags() {
            return this.recommendedTags;
        }

        public final Viewer getViewer() {
            return this.viewer;
        }

        public final Writers getWriters() {
            return this.writers;
        }

        public final int hashCode() {
            int iHashCode = (this.recommendedTags.hashCode() + ((this.publications.hashCode() + (this.writers.hashCode() * 31)) * 31)) * 31;
            Viewer viewer = this.viewer;
            return iHashCode + (viewer == null ? 0 : viewer.hashCode());
        }

        public final String toString() {
            return "Data(writers=" + this.writers + ", publications=" + this.publications + ", recommendedTags=" + this.recommendedTags + ", viewer=" + this.viewer + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/AllSuggestionsQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return peNPu.mfTYmVQDWbhF + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Edge1;", "", "__typename", "", "node", "Lcom/medium/android/graphql/AllSuggestionsQuery$Node1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$Node1;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Node1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge1 {
        private final String __typename;
        private final Node1 node;

        public Edge1(String str, Node1 node1) {
            str.getClass();
            node1.getClass();
            this.__typename = str;
            this.node = node1;
        }

        public static /* synthetic */ Edge1 copy$default(Edge1 edge1, String str, Node1 node1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge1.__typename;
            }
            if ((i & 2) != 0) {
                node1 = edge1.node;
            }
            return edge1.copy(str, node1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node1 getNode() {
            return this.node;
        }

        public final Edge1 copy(String __typename, Node1 node) {
            __typename.getClass();
            node.getClass();
            return new Edge1(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge1)) {
                return false;
            }
            Edge1 edge1 = (Edge1) other;
            return g76.L(this.__typename, edge1.__typename) && g76.L(this.node, edge1.node);
        }

        public final Node1 getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge1(__typename=" + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Edge2;", "", "__typename", "", "node", "Lcom/medium/android/graphql/AllSuggestionsQuery$Node2;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$Node2;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Node2;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge2 {
        private final String __typename;
        private final Node2 node;

        public Edge2(String str, Node2 node2) {
            str.getClass();
            node2.getClass();
            this.__typename = str;
            this.node = node2;
        }

        public static /* synthetic */ Edge2 copy$default(Edge2 edge2, String str, Node2 node2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge2.__typename;
            }
            if ((i & 2) != 0) {
                node2 = edge2.node;
            }
            return edge2.copy(str, node2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node2 getNode() {
            return this.node;
        }

        public final Edge2 copy(String __typename, Node2 node) {
            __typename.getClass();
            node.getClass();
            return new Edge2(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge2)) {
                return false;
            }
            Edge2 edge2 = (Edge2) other;
            return g76.L(this.__typename, edge2.__typename) && g76.L(this.node, edge2.node);
        }

        public final Node2 getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Edge2(__typename=" + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Edge3;", "", "__typename", "", "node", "Lcom/medium/android/graphql/AllSuggestionsQuery$Node3;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$Node3;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/AllSuggestionsQuery$Node3;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge3 {
        private final String __typename;
        private final Node3 node;

        public Edge3(String str, Node3 node3) {
            str.getClass();
            node3.getClass();
            this.__typename = str;
            this.node = node3;
        }

        public static /* synthetic */ Edge3 copy$default(Edge3 edge3, String str, Node3 node3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge3.__typename;
            }
            if ((i & 2) != 0) {
                node3 = edge3.node;
            }
            return edge3.copy(str, node3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Node3 getNode() {
            return this.node;
        }

        public final Edge3 copy(String __typename, Node3 node) {
            __typename.getClass();
            node.getClass();
            return new Edge3(__typename, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge3)) {
                return false;
            }
            Edge3 edge3 = (Edge3) other;
            return g76.L(this.__typename, edge3.__typename) && g76.L(this.node, edge3.node);
        }

        public final Node3 getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.node.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return CspinKvYN.eVCDTj + this.__typename + ", node=" + this.node + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$MatchedContactsConnection;", "", "__typename", "", "onMatchedContactsConnection", "Lcom/medium/android/graphql/AllSuggestionsQuery$OnMatchedContactsConnection;", "onUnauthorized", "Lcom/medium/android/graphql/AllSuggestionsQuery$OnUnauthorized;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$OnMatchedContactsConnection;Lcom/medium/android/graphql/AllSuggestionsQuery$OnUnauthorized;)V", "get__typename", "()Ljava/lang/String;", "getOnMatchedContactsConnection", "()Lcom/medium/android/graphql/AllSuggestionsQuery$OnMatchedContactsConnection;", "getOnUnauthorized", "()Lcom/medium/android/graphql/AllSuggestionsQuery$OnUnauthorized;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return "MatchedContactsConnection(__typename=" + this.__typename + ", onMatchedContactsConnection=" + this.onMatchedContactsConnection + ", onUnauthorized=" + this.onUnauthorized + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Node;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/AllSuggestionsQuery$OnUser;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$OnUser;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/AllSuggestionsQuery$OnUser;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final OnUser onUser;

        public Node(String str, OnUser onUser) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, OnUser onUser, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                onUser = node.onUser;
            }
            return node.copy(str, onUser);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final Node copy(String __typename, OnUser onUser) {
            __typename.getClass();
            return new Node(__typename, onUser);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.onUser, node.onUser);
        }

        public final OnUser getOnUser() {
            return this.onUser;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnUser onUser = this.onUser;
            return iHashCode + (onUser == null ? 0 : onUser.hashCode());
        }

        public final String toString() {
            return "Node(__typename=" + this.__typename + ", onUser=" + this.onUser + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Node1;", "", "__typename", "", "onCollection", "Lcom/medium/android/graphql/AllSuggestionsQuery$OnCollection;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$OnCollection;)V", "get__typename", "()Ljava/lang/String;", "getOnCollection", "()Lcom/medium/android/graphql/AllSuggestionsQuery$OnCollection;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node1 {
        private final String __typename;
        private final OnCollection onCollection;

        public Node1(String str, OnCollection onCollection) {
            str.getClass();
            this.__typename = str;
            this.onCollection = onCollection;
        }

        public static /* synthetic */ Node1 copy$default(Node1 node1, String str, OnCollection onCollection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node1.__typename;
            }
            if ((i & 2) != 0) {
                onCollection = node1.onCollection;
            }
            return node1.copy(str, onCollection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnCollection getOnCollection() {
            return this.onCollection;
        }

        public final Node1 copy(String __typename, OnCollection onCollection) {
            __typename.getClass();
            return new Node1(__typename, onCollection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node1)) {
                return false;
            }
            Node1 node1 = (Node1) other;
            return g76.L(this.__typename, node1.__typename) && g76.L(this.onCollection, node1.onCollection);
        }

        public final OnCollection getOnCollection() {
            return this.onCollection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnCollection onCollection = this.onCollection;
            return iHashCode + (onCollection == null ? 0 : onCollection.hashCode());
        }

        public final String toString() {
            return "Node1(__typename=" + this.__typename + ", onCollection=" + this.onCollection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Node2;", "", "__typename", "", "normalizedTagSlug", "tagData", "Lcom/medium/android/graphql/fragment/TagData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagData", "()Lcom/medium/android/graphql/fragment/TagData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node2 {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagData tagData;

        public Node2(String str, String str2, TagData tagData) {
            lv8.C(str, str2, tagData);
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagData = tagData;
        }

        public static /* synthetic */ Node2 copy$default(Node2 node2, String str, String str2, TagData tagData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node2.__typename;
            }
            if ((i & 2) != 0) {
                str2 = node2.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagData = node2.tagData;
            }
            return node2.copy(str, str2, tagData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final TagData getTagData() {
            return this.tagData;
        }

        public final Node2 copy(String __typename, String normalizedTagSlug, TagData tagData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagData.getClass();
            return new Node2(__typename, normalizedTagSlug, tagData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node2)) {
                return false;
            }
            Node2 node2 = (Node2) other;
            return g76.L(this.__typename, node2.__typename) && g76.L(this.normalizedTagSlug, node2.normalizedTagSlug) && g76.L(this.tagData, node2.tagData);
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final TagData getTagData() {
            return this.tagData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.tagData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.normalizedTagSlug);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.normalizedTagSlug;
            TagData tagData = this.tagData;
            StringBuilder sbU = y30.u("Node2(__typename=", str, ", normalizedTagSlug=", str2, ", tagData=");
            sbU.append(tagData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Node3;", "", "__typename", "", "id", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node3 {
        private final String __typename;
        private final CreatorPreviewData creatorPreviewData;
        private final String id;

        public Node3(String str, String str2, CreatorPreviewData creatorPreviewData) {
            str.getClass();
            str2.getClass();
            creatorPreviewData.getClass();
            this.__typename = str;
            this.id = str2;
            this.creatorPreviewData = creatorPreviewData;
        }

        public static /* synthetic */ Node3 copy$default(Node3 node3, String str, String str2, CreatorPreviewData creatorPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node3.__typename;
            }
            if ((i & 2) != 0) {
                str2 = node3.id;
            }
            if ((i & 4) != 0) {
                creatorPreviewData = node3.creatorPreviewData;
            }
            return node3.copy(str, str2, creatorPreviewData);
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

        public final Node3 copy(String __typename, String id, CreatorPreviewData creatorPreviewData) {
            __typename.getClass();
            id.getClass();
            creatorPreviewData.getClass();
            return new Node3(__typename, id, creatorPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node3)) {
                return false;
            }
            Node3 node3 = (Node3) other;
            return g76.L(this.__typename, node3.__typename) && g76.L(this.id, node3.id) && g76.L(this.creatorPreviewData, node3.creatorPreviewData);
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
            StringBuilder sbU = y30.u("Node3(__typename=", str, ", id=", str2, ", creatorPreviewData=");
            sbU.append(creatorPreviewData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$OnCollection;", "", "id", "", "collectionPreviewData", "Lcom/medium/android/graphql/fragment/CollectionPreviewData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionPreviewData;)V", "getId", "()Ljava/lang/String;", "getCollectionPreviewData", "()Lcom/medium/android/graphql/fragment/CollectionPreviewData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnCollection {
        private final CollectionPreviewData collectionPreviewData;
        private final String id;

        public OnCollection(String str, CollectionPreviewData collectionPreviewData) {
            str.getClass();
            collectionPreviewData.getClass();
            this.id = str;
            this.collectionPreviewData = collectionPreviewData;
        }

        public static /* synthetic */ OnCollection copy$default(OnCollection onCollection, String str, CollectionPreviewData collectionPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onCollection.id;
            }
            if ((i & 2) != 0) {
                collectionPreviewData = onCollection.collectionPreviewData;
            }
            return onCollection.copy(str, collectionPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CollectionPreviewData getCollectionPreviewData() {
            return this.collectionPreviewData;
        }

        public final OnCollection copy(String id, CollectionPreviewData collectionPreviewData) {
            id.getClass();
            collectionPreviewData.getClass();
            return new OnCollection(id, collectionPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnCollection)) {
                return false;
            }
            OnCollection onCollection = (OnCollection) other;
            return g76.L(this.id, onCollection.id) && g76.L(this.collectionPreviewData, onCollection.collectionPreviewData);
        }

        public final CollectionPreviewData getCollectionPreviewData() {
            return this.collectionPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.collectionPreviewData.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnCollection(id=" + this.id + ", collectionPreviewData=" + this.collectionPreviewData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$OnMatchedContactsConnection;", "", "edges", "", "Lcom/medium/android/graphql/AllSuggestionsQuery$Edge3;", "<init>", "(Ljava/util/List;)V", "getEdges", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnMatchedContactsConnection {
        private final List<Edge3> edges;

        public OnMatchedContactsConnection(List<Edge3> list) {
            list.getClass();
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnMatchedContactsConnection copy$default(OnMatchedContactsConnection onMatchedContactsConnection, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onMatchedContactsConnection.edges;
            }
            return onMatchedContactsConnection.copy(list);
        }

        public final List<Edge3> component1() {
            return this.edges;
        }

        public final OnMatchedContactsConnection copy(List<Edge3> edges) {
            edges.getClass();
            return new OnMatchedContactsConnection(edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnMatchedContactsConnection) && g76.L(this.edges, ((OnMatchedContactsConnection) other).edges);
        }

        public final List<Edge3> getEdges() {
            return this.edges;
        }

        public final int hashCode() {
            return this.edges.hashCode();
        }

        public final String toString() {
            return ka1.t("OnMatchedContactsConnection(edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$OnUser;", "", "id", "", "creatorPreviewData", "Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData;)V", "getId", "()Ljava/lang/String;", "getCreatorPreviewData", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final CreatorPreviewData creatorPreviewData;
        private final String id;

        public OnUser(String str, CreatorPreviewData creatorPreviewData) {
            str.getClass();
            creatorPreviewData.getClass();
            this.id = str;
            this.creatorPreviewData = creatorPreviewData;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, String str, CreatorPreviewData creatorPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUser.id;
            }
            if ((i & 2) != 0) {
                creatorPreviewData = onUser.creatorPreviewData;
            }
            return onUser.copy(str, creatorPreviewData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final OnUser copy(String id, CreatorPreviewData creatorPreviewData) {
            id.getClass();
            creatorPreviewData.getClass();
            return new OnUser(id, creatorPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.id, onUser.id) && g76.L(this.creatorPreviewData, onUser.creatorPreviewData);
        }

        public final CreatorPreviewData getCreatorPreviewData() {
            return this.creatorPreviewData;
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.creatorPreviewData.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnUser(id=" + this.id + ", creatorPreviewData=" + this.creatorPreviewData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Publications;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/AllSuggestionsQuery$Edge1;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publications {
        private final String __typename;
        private final List<Edge1> edges;

        public Publications(String str, List<Edge1> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Publications copy$default(Publications publications, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publications.__typename;
            }
            if ((i & 2) != 0) {
                list = publications.edges;
            }
            return publications.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge1> component2() {
            return this.edges;
        }

        public final Publications copy(String __typename, List<Edge1> edges) {
            __typename.getClass();
            edges.getClass();
            return new Publications(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publications)) {
                return false;
            }
            Publications publications = (Publications) other;
            return g76.L(this.__typename, publications.__typename) && g76.L(this.edges, publications.edges);
        }

        public final List<Edge1> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("Publications(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$RecommendedTags;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/AllSuggestionsQuery$Edge2;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RecommendedTags {
        private final String __typename;
        private final List<Edge2> edges;

        public RecommendedTags(String str, List<Edge2> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ RecommendedTags copy$default(RecommendedTags recommendedTags, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = recommendedTags.__typename;
            }
            if ((i & 2) != 0) {
                list = recommendedTags.edges;
            }
            return recommendedTags.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge2> component2() {
            return this.edges;
        }

        public final RecommendedTags copy(String __typename, List<Edge2> edges) {
            __typename.getClass();
            edges.getClass();
            return new RecommendedTags(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RecommendedTags)) {
                return false;
            }
            RecommendedTags recommendedTags = (RecommendedTags) other;
            return g76.L(this.__typename, recommendedTags.__typename) && g76.L(this.edges, recommendedTags.edges);
        }

        public final List<Edge2> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("RecommendedTags(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Viewer;", "", "__typename", "", "matchedContactsConnection", "Lcom/medium/android/graphql/AllSuggestionsQuery$MatchedContactsConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/AllSuggestionsQuery$MatchedContactsConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMatchedContactsConnection", "()Lcom/medium/android/graphql/AllSuggestionsQuery$MatchedContactsConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Writers;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/AllSuggestionsQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Writers {
        private final String __typename;
        private final List<Edge> edges;

        public Writers(String str, List<Edge> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Writers copy$default(Writers writers, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = writers.__typename;
            }
            if ((i & 2) != 0) {
                list = writers.edges;
            }
            return writers.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        public final Writers copy(String __typename, List<Edge> edges) {
            __typename.getClass();
            edges.getClass();
            return new Writers(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Writers)) {
                return false;
            }
            Writers writers = (Writers) other;
            return g76.L(this.__typename, writers.__typename) && g76.L(this.edges, writers.edges);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.edges.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("Writers(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    public AllSuggestionsQuery(int i, String str, zv8 zv8Var, RecommendedTagsInput recommendedTagsInput) {
        str.getClass();
        zv8Var.getClass();
        recommendedTagsInput.getClass();
        this.first = i;
        this.after = str;
        this.mode = zv8Var;
        this.recommendedTagsInput = recommendedTagsInput;
    }

    public static /* synthetic */ AllSuggestionsQuery copy$default(AllSuggestionsQuery allSuggestionsQuery, int i, String str, zv8 zv8Var, RecommendedTagsInput recommendedTagsInput, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = allSuggestionsQuery.first;
        }
        if ((i2 & 2) != 0) {
            str = allSuggestionsQuery.after;
        }
        if ((i2 & 4) != 0) {
            zv8Var = allSuggestionsQuery.mode;
        }
        if ((i2 & 8) != 0) {
            recommendedTagsInput = allSuggestionsQuery.recommendedTagsInput;
        }
        return allSuggestionsQuery.copy(i, str, zv8Var, recommendedTagsInput);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(AllSuggestionsQuery_ResponseAdapter.Data.INSTANCE, false);
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
    public final zv8 getMode() {
        return this.mode;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final RecommendedTagsInput getRecommendedTagsInput() {
        return this.recommendedTagsInput;
    }

    public final AllSuggestionsQuery copy(int first, String after, zv8 mode, RecommendedTagsInput recommendedTagsInput) {
        after.getClass();
        mode.getClass();
        recommendedTagsInput.getClass();
        return new AllSuggestionsQuery(first, after, mode, recommendedTagsInput);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query AllSuggestionsQuery($first: Int!, $after: String!, $mode: RecommendedPublishersMode, $recommendedTagsInput: RecommendedTagsInput!) { writers: recommendedPublishers(first: $first, after: $after, mode: $mode) { __typename edges { __typename node { __typename ... on User { ...CreatorPreviewData id } } } } publications: recommendedPublishers(first: $first, after: $after, mode: $mode) { __typename edges { __typename node { __typename ... on Collection { ...CollectionPreviewData id } } } } recommendedTags(input: $recommendedTagsInput) { __typename edges { __typename node { __typename ...TagData normalizedTagSlug } } } viewer { __typename matchedContactsConnection(first: $first, after: $after, includeFollowedUsers: false) { __typename ... on MatchedContactsConnection { edges { __typename node { __typename ...CreatorPreviewData id } } } ... on Unauthorized { message } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AllSuggestionsQuery)) {
            return false;
        }
        AllSuggestionsQuery allSuggestionsQuery = (AllSuggestionsQuery) other;
        return this.first == allSuggestionsQuery.first && g76.L(this.after, allSuggestionsQuery.after) && g76.L(this.mode, allSuggestionsQuery.mode) && g76.L(this.recommendedTagsInput, allSuggestionsQuery.recommendedTagsInput);
    }

    public final String getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final zv8 getMode() {
        return this.mode;
    }

    public final RecommendedTagsInput getRecommendedTagsInput() {
        return this.recommendedTagsInput;
    }

    public final int hashCode() {
        return this.recommendedTagsInput.hashCode() + lv8.h(this.mode, wgd.o(this.first * 31, 31, this.after), 31);
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
        List<sx1> list = AllSuggestionsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        AllSuggestionsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "AllSuggestionsQuery(first=" + this.first + ", after=" + this.after + ", mode=" + this.mode + ", recommendedTagsInput=" + this.recommendedTagsInput + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/AllSuggestionsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query AllSuggestionsQuery($first: Int!, $after: String!, $mode: RecommendedPublishersMode, $recommendedTagsInput: RecommendedTagsInput!) { writers: recommendedPublishers(first: $first, after: $after, mode: $mode) { __typename edges { __typename node { __typename ... on User { ...CreatorPreviewData id } } } } publications: recommendedPublishers(first: $first, after: $after, mode: $mode) { __typename edges { __typename node { __typename ... on Collection { ...CollectionPreviewData id } } } } recommendedTags(input: $recommendedTagsInput) { __typename edges { __typename node { __typename ...TagData normalizedTagSlug } } } viewer { __typename matchedContactsConnection(first: $first, after: $after, includeFollowedUsers: false) { __typename ... on MatchedContactsConnection { edges { __typename node { __typename ...CreatorPreviewData id } } } ... on Unauthorized { message } } id } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment CreatorPreviewData on User { __typename id name imageId bio verifications { __typename isBookAuthor } membership { __typename ...membershipFragment } socialStats { __typename followerCount } newsletterV3 { __typename id } ...UserFollowData }  fragment CollectionPreviewData on Collection { __typename id name avatar { __typename id } description subscriberCount customStyleSheet { __typename header { __typename backgroundImage { __typename id } } } }  fragment TagData on Tag { __typename id normalizedTagSlug displayTitle followerCount postCount viewerEdge { __typename id isFollowing } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ AllSuggestionsQuery(int i, String str, zv8 zv8Var, RecommendedTagsInput recommendedTagsInput, int i2, gy2 gy2Var) {
        this(i, str, (i2 & 4) != 0 ? xv8.a : zv8Var, recommendedTagsInput);
    }
}
