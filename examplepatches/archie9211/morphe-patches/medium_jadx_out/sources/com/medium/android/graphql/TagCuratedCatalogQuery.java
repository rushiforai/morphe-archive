package com.medium.android.graphql;

import androidx.core.widget.nRCC.nGxjfIr;
import com.medium.android.graphql.adapter.TagCuratedCatalogQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.TagCuratedCatalogQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.CatalogItemPostData;
import com.medium.android.graphql.fragment.CatalogItemUserData;
import com.medium.android.graphql.selections.TagCuratedCatalogQuerySelections;
import com.medium.android.graphql.type.PredefinedCatalogType;
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
import defpackage.wgd;
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0086\b\u0018\u0000 )2\b\u0012\u0004\u0012\u00020\u00020\u0001:\n*+,-./012)B\u0019\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\n\u0010\tJ\u000f\u0010\u000b\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u000b\u0010\tJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u0018\u0010\u001b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\"\u0010\u001d\u001a\u00020\u00002\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003HÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u001f\u0010\tJ\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\u00102\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b(\u0010\u001c¨\u00063"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery;", "Luqa;", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$Data;", "Lzv8;", "", "tagSlug", "<init>", "(Lzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lzv8;", "copy", "(Lzv8;)Lcom/medium/android/graphql/TagCuratedCatalogQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getTagSlug", "Companion", "Data", "TagFromSlug", "CuratedLists", "Edge", "Node", "Creator", "ItemsConnection", "Item", "Entity", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TagCuratedCatalogQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "654b5d1e61e71b3188f9697e9ff47d68e820b6e2c0b2e62fc4b56b3becfdb54d";
    public static final String OPERATION_NAME = "TagCuratedCatalog";
    private final zv8 tagSlug;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Creator;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String name;

        public Creator(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            return creator.copy(str, str2, str3);
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
        public final String getName() {
            return this.name;
        }

        public final Creator copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Creator(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$CuratedLists;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class CuratedLists {
        private final String __typename;
        private final List<Edge> edges;

        public CuratedLists(String str, List<Edge> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ CuratedLists copy$default(CuratedLists curatedLists, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = curatedLists.__typename;
            }
            if ((i & 2) != 0) {
                list = curatedLists.edges;
            }
            return curatedLists.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge> component2() {
            return this.edges;
        }

        public final CuratedLists copy(String __typename, List<Edge> edges) {
            __typename.getClass();
            edges.getClass();
            return new CuratedLists(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CuratedLists)) {
                return false;
            }
            CuratedLists curatedLists = (CuratedLists) other;
            return g76.L(this.__typename, curatedLists.__typename) && g76.L(this.edges, curatedLists.edges);
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
            return ka1.s("CuratedLists(__typename=", this.__typename, nGxjfIr.Ujb, ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$TagFromSlug;", "tagFromSlug", "<init>", "(Lcom/medium/android/graphql/TagCuratedCatalogQuery$TagFromSlug;)V", "component1", "()Lcom/medium/android/graphql/TagCuratedCatalogQuery$TagFromSlug;", "copy", "(Lcom/medium/android/graphql/TagCuratedCatalogQuery$TagFromSlug;)Lcom/medium/android/graphql/TagCuratedCatalogQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$TagFromSlug;", "getTagFromSlug", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final TagFromSlug tagFromSlug;

        public Data(TagFromSlug tagFromSlug) {
            this.tagFromSlug = tagFromSlug;
        }

        public static Data copy$default(Data data, TagFromSlug tagFromSlug, int i, Object obj) {
            if ((i & 1) != 0) {
                tagFromSlug = data.tagFromSlug;
            }
            data.getClass();
            return new Data(tagFromSlug);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final TagFromSlug getTagFromSlug() {
            return this.tagFromSlug;
        }

        public final Data copy(TagFromSlug tagFromSlug) {
            return new Data(tagFromSlug);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.tagFromSlug, ((Data) other).tagFromSlug);
        }

        public final TagFromSlug getTagFromSlug() {
            return this.tagFromSlug;
        }

        public final int hashCode() {
            TagFromSlug tagFromSlug = this.tagFromSlug;
            if (tagFromSlug == null) {
                return 0;
            }
            return tagFromSlug.hashCode();
        }

        public final String toString() {
            return "Data(tagFromSlug=" + this.tagFromSlug + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/TagCuratedCatalogQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/TagCuratedCatalogQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Entity;", "", "__typename", "", "catalogItemPostData", "Lcom/medium/android/graphql/fragment/CatalogItemPostData;", "catalogItemUserData", "Lcom/medium/android/graphql/fragment/CatalogItemUserData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogItemPostData;Lcom/medium/android/graphql/fragment/CatalogItemUserData;)V", "get__typename", "()Ljava/lang/String;", "getCatalogItemPostData", "()Lcom/medium/android/graphql/fragment/CatalogItemPostData;", "getCatalogItemUserData", "()Lcom/medium/android/graphql/fragment/CatalogItemUserData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Entity {
        private final String __typename;
        private final CatalogItemPostData catalogItemPostData;
        private final CatalogItemUserData catalogItemUserData;

        public Entity(String str, CatalogItemPostData catalogItemPostData, CatalogItemUserData catalogItemUserData) {
            str.getClass();
            this.__typename = str;
            this.catalogItemPostData = catalogItemPostData;
            this.catalogItemUserData = catalogItemUserData;
        }

        public static /* synthetic */ Entity copy$default(Entity entity, String str, CatalogItemPostData catalogItemPostData, CatalogItemUserData catalogItemUserData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = entity.__typename;
            }
            if ((i & 2) != 0) {
                catalogItemPostData = entity.catalogItemPostData;
            }
            if ((i & 4) != 0) {
                catalogItemUserData = entity.catalogItemUserData;
            }
            return entity.copy(str, catalogItemPostData, catalogItemUserData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CatalogItemPostData getCatalogItemPostData() {
            return this.catalogItemPostData;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final CatalogItemUserData getCatalogItemUserData() {
            return this.catalogItemUserData;
        }

        public final Entity copy(String __typename, CatalogItemPostData catalogItemPostData, CatalogItemUserData catalogItemUserData) {
            __typename.getClass();
            return new Entity(__typename, catalogItemPostData, catalogItemUserData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Entity)) {
                return false;
            }
            Entity entity = (Entity) other;
            return g76.L(this.__typename, entity.__typename) && g76.L(this.catalogItemPostData, entity.catalogItemPostData) && g76.L(this.catalogItemUserData, entity.catalogItemUserData);
        }

        public final CatalogItemPostData getCatalogItemPostData() {
            return this.catalogItemPostData;
        }

        public final CatalogItemUserData getCatalogItemUserData() {
            return this.catalogItemUserData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            CatalogItemPostData catalogItemPostData = this.catalogItemPostData;
            int iHashCode2 = (iHashCode + (catalogItemPostData == null ? 0 : catalogItemPostData.hashCode())) * 31;
            CatalogItemUserData catalogItemUserData = this.catalogItemUserData;
            return iHashCode2 + (catalogItemUserData != null ? catalogItemUserData.hashCode() : 0);
        }

        public final String toString() {
            return "Entity(__typename=" + this.__typename + ", catalogItemPostData=" + this.catalogItemPostData + ", catalogItemUserData=" + this.catalogItemUserData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Item;", "", "__typename", "", "entity", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$Entity;", "catalogItemId", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/TagCuratedCatalogQuery$Entity;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getEntity", "()Lcom/medium/android/graphql/TagCuratedCatalogQuery$Entity;", "getCatalogItemId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Item {
        private final String __typename;
        private final String catalogItemId;
        private final Entity entity;

        public Item(String str, Entity entity, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.entity = entity;
            this.catalogItemId = str2;
        }

        public static /* synthetic */ Item copy$default(Item item, String str, Entity entity, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = item.__typename;
            }
            if ((i & 2) != 0) {
                entity = item.entity;
            }
            if ((i & 4) != 0) {
                str2 = item.catalogItemId;
            }
            return item.copy(str, entity, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Entity getEntity() {
            return this.entity;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        public final Item copy(String __typename, Entity entity, String catalogItemId) {
            __typename.getClass();
            catalogItemId.getClass();
            return new Item(__typename, entity, catalogItemId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item)) {
                return false;
            }
            Item item = (Item) other;
            return g76.L(this.__typename, item.__typename) && g76.L(this.entity, item.entity) && g76.L(this.catalogItemId, item.catalogItemId);
        }

        public final String getCatalogItemId() {
            return this.catalogItemId;
        }

        public final Entity getEntity() {
            return this.entity;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Entity entity = this.entity;
            return this.catalogItemId.hashCode() + ((iHashCode + (entity == null ? 0 : entity.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Entity entity = this.entity;
            String str2 = this.catalogItemId;
            StringBuilder sb = new StringBuilder("Item(__typename=");
            sb.append(str);
            sb.append(", entity=");
            sb.append(entity);
            sb.append(", catalogItemId=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$ItemsConnection;", "", "__typename", "", "items", "", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$Item;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getItems", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ItemsConnection {
        private final String __typename;
        private final List<Item> items;

        public ItemsConnection(String str, List<Item> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.items = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ItemsConnection copy$default(ItemsConnection itemsConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = itemsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = itemsConnection.items;
            }
            return itemsConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Item> component2() {
            return this.items;
        }

        public final ItemsConnection copy(String __typename, List<Item> items) {
            __typename.getClass();
            items.getClass();
            return new ItemsConnection(__typename, items);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ItemsConnection)) {
                return false;
            }
            ItemsConnection itemsConnection = (ItemsConnection) other;
            return g76.L(this.__typename, itemsConnection.__typename) && g76.L(this.items, itemsConnection.items);
        }

        public final List<Item> getItems() {
            return this.items;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.items.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("ItemsConnection(__typename=", this.__typename, ", items=", ")", this.items);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010\u001c\u001a\u00020\tHÆ\u0003J\t\u0010\u001d\u001a\u00020\u000bHÆ\u0003JG\u0010\u001e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000bHÆ\u0001J\u0013\u0010\u001f\u001a\u00020 2\b\u0010!\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\"\u001a\u00020#HÖ\u0001J\t\u0010$\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006%"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Node;", "", "__typename", "", "id", "name", "predefined", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "creator", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$Creator;", "itemsConnection", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$ItemsConnection;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/PredefinedCatalogType;Lcom/medium/android/graphql/TagCuratedCatalogQuery$Creator;Lcom/medium/android/graphql/TagCuratedCatalogQuery$ItemsConnection;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getPredefined", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getCreator", "()Lcom/medium/android/graphql/TagCuratedCatalogQuery$Creator;", "getItemsConnection", "()Lcom/medium/android/graphql/TagCuratedCatalogQuery$ItemsConnection;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final Creator creator;
        private final String id;
        private final ItemsConnection itemsConnection;
        private final String name;
        private final PredefinedCatalogType predefined;

        public Node(String str, String str2, String str3, PredefinedCatalogType predefinedCatalogType, Creator creator, ItemsConnection itemsConnection) {
            str.getClass();
            str2.getClass();
            str3.getClass();
            creator.getClass();
            itemsConnection.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.predefined = predefinedCatalogType;
            this.creator = creator;
            this.itemsConnection = itemsConnection;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, String str2, String str3, PredefinedCatalogType predefinedCatalogType, Creator creator, ItemsConnection itemsConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                str2 = node.id;
            }
            if ((i & 4) != 0) {
                str3 = node.name;
            }
            if ((i & 8) != 0) {
                predefinedCatalogType = node.predefined;
            }
            if ((i & 16) != 0) {
                creator = node.creator;
            }
            if ((i & 32) != 0) {
                itemsConnection = node.itemsConnection;
            }
            Creator creator2 = creator;
            ItemsConnection itemsConnection2 = itemsConnection;
            return node.copy(str, str2, str3, predefinedCatalogType, creator2, itemsConnection2);
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
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Creator getCreator() {
            return this.creator;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final ItemsConnection getItemsConnection() {
            return this.itemsConnection;
        }

        public final Node copy(String __typename, String id, String name, PredefinedCatalogType predefined, Creator creator, ItemsConnection itemsConnection) {
            __typename.getClass();
            id.getClass();
            name.getClass();
            creator.getClass();
            itemsConnection.getClass();
            return new Node(__typename, id, name, predefined, creator, itemsConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.id, node.id) && g76.L(this.name, node.name) && this.predefined == node.predefined && g76.L(this.creator, node.creator) && g76.L(this.itemsConnection, node.itemsConnection);
        }

        public final Creator getCreator() {
            return this.creator;
        }

        public final String getId() {
            return this.id;
        }

        public final ItemsConnection getItemsConnection() {
            return this.itemsConnection;
        }

        public final String getName() {
            return this.name;
        }

        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.name);
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            return this.itemsConnection.hashCode() + ((this.creator.hashCode() + ((iO + (predefinedCatalogType == null ? 0 : predefinedCatalogType.hashCode())) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            Creator creator = this.creator;
            ItemsConnection itemsConnection = this.itemsConnection;
            StringBuilder sbU = y30.u("Node(__typename=", str, ", id=", str2, ", name=");
            sbU.append(str3);
            sbU.append(", predefined=");
            sbU.append(predefinedCatalogType);
            sbU.append(", creator=");
            sbU.append(creator);
            sbU.append(", itemsConnection=");
            sbU.append(itemsConnection);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$TagFromSlug;", "", "__typename", "", "curatedLists", "Lcom/medium/android/graphql/TagCuratedCatalogQuery$CuratedLists;", "normalizedTagSlug", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/TagCuratedCatalogQuery$CuratedLists;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getCuratedLists", "()Lcom/medium/android/graphql/TagCuratedCatalogQuery$CuratedLists;", "getNormalizedTagSlug", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TagFromSlug {
        private final String __typename;
        private final CuratedLists curatedLists;
        private final String normalizedTagSlug;

        public TagFromSlug(String str, CuratedLists curatedLists, String str2) {
            str.getClass();
            curatedLists.getClass();
            str2.getClass();
            this.__typename = str;
            this.curatedLists = curatedLists;
            this.normalizedTagSlug = str2;
        }

        public static /* synthetic */ TagFromSlug copy$default(TagFromSlug tagFromSlug, String str, CuratedLists curatedLists, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tagFromSlug.__typename;
            }
            if ((i & 2) != 0) {
                curatedLists = tagFromSlug.curatedLists;
            }
            if ((i & 4) != 0) {
                str2 = tagFromSlug.normalizedTagSlug;
            }
            return tagFromSlug.copy(str, curatedLists, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final CuratedLists getCuratedLists() {
            return this.curatedLists;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final TagFromSlug copy(String __typename, CuratedLists curatedLists, String normalizedTagSlug) {
            __typename.getClass();
            curatedLists.getClass();
            normalizedTagSlug.getClass();
            return new TagFromSlug(__typename, curatedLists, normalizedTagSlug);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TagFromSlug)) {
                return false;
            }
            TagFromSlug tagFromSlug = (TagFromSlug) other;
            return g76.L(this.__typename, tagFromSlug.__typename) && g76.L(this.curatedLists, tagFromSlug.curatedLists) && g76.L(this.normalizedTagSlug, tagFromSlug.normalizedTagSlug);
        }

        public final CuratedLists getCuratedLists() {
            return this.curatedLists;
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.normalizedTagSlug.hashCode() + ((this.curatedLists.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            CuratedLists curatedLists = this.curatedLists;
            String str2 = this.normalizedTagSlug;
            StringBuilder sb = new StringBuilder("TagFromSlug(__typename=");
            sb.append(str);
            sb.append(", curatedLists=");
            sb.append(curatedLists);
            sb.append(", normalizedTagSlug=");
            return ka1.v(sb, str2, ")");
        }
    }

    public /* synthetic */ TagCuratedCatalogQuery(zv8 zv8Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var);
    }

    public static /* synthetic */ TagCuratedCatalogQuery copy$default(TagCuratedCatalogQuery tagCuratedCatalogQuery, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = tagCuratedCatalogQuery.tagSlug;
        }
        return tagCuratedCatalogQuery.copy(zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(TagCuratedCatalogQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getTagSlug() {
        return this.tagSlug;
    }

    public final TagCuratedCatalogQuery copy(zv8 tagSlug) {
        tagSlug.getClass();
        return new TagCuratedCatalogQuery(tagSlug);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query TagCuratedCatalog($tagSlug: String) { tagFromSlug(tagSlug: $tagSlug) { __typename curatedLists(first: 1) { __typename edges { __typename node { __typename id name predefined creator { __typename id name } itemsConnection(pagingOptions: { limit: 3 } ) { __typename items { __typename entity { __typename ...CatalogItemPostData ...CatalogItemUserData } catalogItemId } } } } } normalizedTagSlug } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof TagCuratedCatalogQuery) && g76.L(this.tagSlug, ((TagCuratedCatalogQuery) other).tagSlug);
    }

    public final zv8 getTagSlug() {
        return this.tagSlug;
    }

    public final int hashCode() {
        return this.tagSlug.hashCode();
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
        List<sx1> list = TagCuratedCatalogQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        TagCuratedCatalogQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "TagCuratedCatalogQuery(tagSlug=" + this.tagSlug + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/TagCuratedCatalogQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query TagCuratedCatalog($tagSlug: String) { tagFromSlug(tagSlug: $tagSlug) { __typename curatedLists(first: 1) { __typename edges { __typename node { __typename id name predefined creator { __typename id name } itemsConnection(pagingOptions: { limit: 3 } ) { __typename items { __typename entity { __typename ...CatalogItemPostData ...CatalogItemUserData } catalogItemId } } } } } normalizedTagSlug } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }  fragment CatalogItemPostData on Post { __typename ...PostPreviewData id }  fragment CatalogItemUserData on User { __typename id }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public TagCuratedCatalogQuery(zv8 zv8Var) {
        zv8Var.getClass();
        this.tagSlug = zv8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public TagCuratedCatalogQuery() {
        this(null, 1, 0 == true ? 1 : 0);
    }
}
