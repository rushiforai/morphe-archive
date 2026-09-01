package com.medium.android.graphql;

import com.medium.android.graphql.adapter.PublicationAboutQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.PublicationAboutQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PublicationFlairedStaffData;
import com.medium.android.graphql.selections.PublicationAboutQuerySelections;
import com.medium.android.graphql.type.PublicationNavigationItemDestination;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.b09;
import defpackage.c8;
import defpackage.ev6;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ho2;
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
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0002\b\u001c\b\u0086\b\u0018\u0000 .2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0013/0123456789:;<=>?@.B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0005¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u000bJ\u0010\u0010\u001e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b \u0010\u001fJ.\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010$\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b$\u0010\u001fJ\u001a\u0010'\u001a\u00020\u00122\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u000bR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010\u001fR\u0017\u0010\u0007\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0007\u0010+\u001a\u0004\b-\u0010\u001f¨\u0006A"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery;", "Luqa;", "Lcom/medium/android/graphql/PublicationAboutQuery$Data;", "", "publicationId", "", "firstEditors", "firstWriters", "<init>", "(Ljava/lang/String;II)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()I", "component3", "copy", "(Ljava/lang/String;II)Lcom/medium/android/graphql/PublicationAboutQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPublicationId", "I", "getFirstEditors", "getFirstWriters", "Companion", "Data", "Publication", "SocialNavigationItem", "Icon", "Editors", "Edge", "Node", "PageInfo", "Writers", "Edge1", "Node1", "PageInfo1", "AboutPage", "Section", "OnPublicationFormattedTextSection", "Content", "OnPublicationTagSetSection", "Tag", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationAboutQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "b0cbe692117043f0ca82909f9921d6a1796e1f43d92bc85cc930502a5e2aa824";
    public static final String OPERATION_NAME = "PublicationAboutQuery";
    private final int firstEditors;
    private final int firstWriters;
    private final String publicationId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$AboutPage;", "", "__typename", "", "sections", "", "Lcom/medium/android/graphql/PublicationAboutQuery$Section;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getSections", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AboutPage {
        private final String __typename;
        private final List<Section> sections;

        public AboutPage(String str, List<Section> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.sections = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ AboutPage copy$default(AboutPage aboutPage, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = aboutPage.__typename;
            }
            if ((i & 2) != 0) {
                list = aboutPage.sections;
            }
            return aboutPage.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Section> component2() {
            return this.sections;
        }

        public final AboutPage copy(String __typename, List<Section> sections) {
            __typename.getClass();
            sections.getClass();
            return new AboutPage(__typename, sections);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AboutPage)) {
                return false;
            }
            AboutPage aboutPage = (AboutPage) other;
            return g76.L(this.__typename, aboutPage.__typename) && g76.L(this.sections, aboutPage.sections);
        }

        public final List<Section> getSections() {
            return this.sections;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.sections.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("AboutPage(__typename=", this.__typename, ", sections=", ")", this.sections);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Content;", "", "__typename", "", "plaintext", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getPlaintext", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Content {
        private final String __typename;
        private final String plaintext;

        public Content(String str, String str2) {
            str.getClass();
            this.__typename = str;
            this.plaintext = str2;
        }

        public static /* synthetic */ Content copy$default(Content content, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = content.__typename;
            }
            if ((i & 2) != 0) {
                str2 = content.plaintext;
            }
            return content.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getPlaintext() {
            return this.plaintext;
        }

        public final Content copy(String __typename, String plaintext) {
            __typename.getClass();
            return new Content(__typename, plaintext);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Content)) {
                return false;
            }
            Content content = (Content) other;
            return g76.L(this.__typename, content.__typename) && g76.L(this.plaintext, content.plaintext);
        }

        public final String getPlaintext() {
            return this.plaintext;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.plaintext;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return ev6.y("Content(__typename=", this.__typename, ", plaintext=", this.plaintext, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/PublicationAboutQuery$Publication;", "publication", "<init>", "(Lcom/medium/android/graphql/PublicationAboutQuery$Publication;)V", "component1", "()Lcom/medium/android/graphql/PublicationAboutQuery$Publication;", "copy", "(Lcom/medium/android/graphql/PublicationAboutQuery$Publication;)Lcom/medium/android/graphql/PublicationAboutQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/PublicationAboutQuery$Publication;", "getPublication", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/PublicationAboutQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationAboutQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/PublicationAboutQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Edge1;", "", "__typename", "", "node", "Lcom/medium/android/graphql/PublicationAboutQuery$Node1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationAboutQuery$Node1;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/PublicationAboutQuery$Node1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Editors;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/PublicationAboutQuery$Edge;", "pageInfo", "Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "getPageInfo", "()Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Editors {
        private final String __typename;
        private final List<Edge> edges;
        private final PageInfo pageInfo;

        public Editors(String str, List<Edge> list, PageInfo pageInfo) {
            str.getClass();
            pageInfo.getClass();
            this.__typename = str;
            this.edges = list;
            this.pageInfo = pageInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Editors copy$default(Editors editors, String str, List list, PageInfo pageInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                str = editors.__typename;
            }
            if ((i & 2) != 0) {
                list = editors.edges;
            }
            if ((i & 4) != 0) {
                pageInfo = editors.pageInfo;
            }
            return editors.copy(str, list, pageInfo);
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

        public final Editors copy(String __typename, List<Edge> edges, PageInfo pageInfo) {
            __typename.getClass();
            pageInfo.getClass();
            return new Editors(__typename, edges, pageInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Editors)) {
                return false;
            }
            Editors editors = (Editors) other;
            return g76.L(this.__typename, editors.__typename) && g76.L(this.edges, editors.edges) && g76.L(this.pageInfo, editors.pageInfo);
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
            StringBuilder sbE = b09.E("Editors(__typename=", str, ", edges=", ", pageInfo=", list);
            sbE.append(pageInfo);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Icon;", "", "__typename", "", "id", "alt", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getAlt", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Icon {
        private final String __typename;
        private final String alt;
        private final String id;

        public Icon(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.alt = str3;
        }

        public static /* synthetic */ Icon copy$default(Icon icon, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = icon.__typename;
            }
            if ((i & 2) != 0) {
                str2 = icon.id;
            }
            if ((i & 4) != 0) {
                str3 = icon.alt;
            }
            return icon.copy(str, str2, str3);
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
        public final String getAlt() {
            return this.alt;
        }

        public final Icon copy(String __typename, String id, String alt) {
            __typename.getClass();
            id.getClass();
            return new Icon(__typename, id, alt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Icon)) {
                return false;
            }
            Icon icon = (Icon) other;
            return g76.L(this.__typename, icon.__typename) && g76.L(this.id, icon.id) && g76.L(this.alt, icon.alt);
        }

        public final String getAlt() {
            return this.alt;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.alt;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Icon(__typename=", str, ", id=", str2, ", alt="), this.alt, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Node;", "", "__typename", "", "publicationFlairedStaffData", "Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;)V", "get__typename", "()Ljava/lang/String;", "getPublicationFlairedStaffData", "()Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Node1;", "", "__typename", "", "publicationFlairedStaffData", "Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;)V", "get__typename", "()Ljava/lang/String;", "getPublicationFlairedStaffData", "()Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node1 {
        private final String __typename;
        private final PublicationFlairedStaffData publicationFlairedStaffData;

        public Node1(String str, PublicationFlairedStaffData publicationFlairedStaffData) {
            str.getClass();
            publicationFlairedStaffData.getClass();
            this.__typename = str;
            this.publicationFlairedStaffData = publicationFlairedStaffData;
        }

        public static /* synthetic */ Node1 copy$default(Node1 node1, String str, PublicationFlairedStaffData publicationFlairedStaffData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node1.__typename;
            }
            if ((i & 2) != 0) {
                publicationFlairedStaffData = node1.publicationFlairedStaffData;
            }
            return node1.copy(str, publicationFlairedStaffData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationFlairedStaffData getPublicationFlairedStaffData() {
            return this.publicationFlairedStaffData;
        }

        public final Node1 copy(String __typename, PublicationFlairedStaffData publicationFlairedStaffData) {
            __typename.getClass();
            publicationFlairedStaffData.getClass();
            return new Node1(__typename, publicationFlairedStaffData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node1)) {
                return false;
            }
            Node1 node1 = (Node1) other;
            return g76.L(this.__typename, node1.__typename) && g76.L(this.publicationFlairedStaffData, node1.publicationFlairedStaffData);
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
            return "Node1(__typename=" + this.__typename + ", publicationFlairedStaffData=" + this.publicationFlairedStaffData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationFormattedTextSection;", "", "content", "Lcom/medium/android/graphql/PublicationAboutQuery$Content;", "<init>", "(Lcom/medium/android/graphql/PublicationAboutQuery$Content;)V", "getContent", "()Lcom/medium/android/graphql/PublicationAboutQuery$Content;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationFormattedTextSection {
        private final Content content;

        public OnPublicationFormattedTextSection(Content content) {
            content.getClass();
            this.content = content;
        }

        public static /* synthetic */ OnPublicationFormattedTextSection copy$default(OnPublicationFormattedTextSection onPublicationFormattedTextSection, Content content, int i, Object obj) {
            if ((i & 1) != 0) {
                content = onPublicationFormattedTextSection.content;
            }
            return onPublicationFormattedTextSection.copy(content);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Content getContent() {
            return this.content;
        }

        public final OnPublicationFormattedTextSection copy(Content content) {
            content.getClass();
            return new OnPublicationFormattedTextSection(content);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPublicationFormattedTextSection) && g76.L(this.content, ((OnPublicationFormattedTextSection) other).content);
        }

        public final Content getContent() {
            return this.content;
        }

        public final int hashCode() {
            return this.content.hashCode();
        }

        public final String toString() {
            return "OnPublicationFormattedTextSection(content=" + this.content + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0011\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0019\u0010\u0005\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationTagSetSection;", "", "id", "", "title", "tags", "", "Lcom/medium/android/graphql/PublicationAboutQuery$Tag;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getId", "()Ljava/lang/String;", "getTitle", "getTags", "()Ljava/util/List;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationTagSetSection {
        private final String id;
        private final List<Tag> tags;
        private final String title;

        public OnPublicationTagSetSection(String str, String str2, List<Tag> list) {
            str.getClass();
            this.id = str;
            this.title = str2;
            this.tags = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnPublicationTagSetSection copy$default(OnPublicationTagSetSection onPublicationTagSetSection, String str, String str2, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPublicationTagSetSection.id;
            }
            if ((i & 2) != 0) {
                str2 = onPublicationTagSetSection.title;
            }
            if ((i & 4) != 0) {
                list = onPublicationTagSetSection.tags;
            }
            return onPublicationTagSetSection.copy(str, str2, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        public final List<Tag> component3() {
            return this.tags;
        }

        public final OnPublicationTagSetSection copy(String id, String title, List<Tag> tags) {
            id.getClass();
            return new OnPublicationTagSetSection(id, title, tags);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPublicationTagSetSection)) {
                return false;
            }
            OnPublicationTagSetSection onPublicationTagSetSection = (OnPublicationTagSetSection) other;
            return g76.L(this.id, onPublicationTagSetSection.id) && g76.L(this.title, onPublicationTagSetSection.title) && g76.L(this.tags, onPublicationTagSetSection.tags);
        }

        public final String getId() {
            return this.id;
        }

        public final List<Tag> getTags() {
            return this.tags;
        }

        public final String getTitle() {
            return this.title;
        }

        public final int hashCode() {
            int iHashCode = this.id.hashCode() * 31;
            String str = this.title;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            List<Tag> list = this.tags;
            return iHashCode2 + (list != null ? list.hashCode() : 0);
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.title;
            return b09.B(y30.u("OnPublicationTagSetSection(id=", str, ", title=", str2, ", tags="), this.tags, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo;", "", "__typename", "", "hasNextPage", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getHasNextPage", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PageInfo {
        private final String __typename;
        private final boolean hasNextPage;

        public PageInfo(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.hasNextPage = z;
        }

        public static /* synthetic */ PageInfo copy$default(PageInfo pageInfo, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pageInfo.__typename;
            }
            if ((i & 2) != 0) {
                z = pageInfo.hasNextPage;
            }
            return pageInfo.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getHasNextPage() {
            return this.hasNextPage;
        }

        public final PageInfo copy(String __typename, boolean hasNextPage) {
            __typename.getClass();
            return new PageInfo(__typename, hasNextPage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PageInfo)) {
                return false;
            }
            PageInfo pageInfo = (PageInfo) other;
            return g76.L(this.__typename, pageInfo.__typename) && this.hasNextPage == pageInfo.hasNextPage;
        }

        public final boolean getHasNextPage() {
            return this.hasNextPage;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.hasNextPage ? 1231 : 1237);
        }

        public final String toString() {
            return km4.z("PageInfo(__typename=", this.__typename, ", hasNextPage=", ")", this.hasNextPage);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo1;", "", "__typename", "", "hasNextPage", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getHasNextPage", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PageInfo1 {
        private final String __typename;
        private final boolean hasNextPage;

        public PageInfo1(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.hasNextPage = z;
        }

        public static /* synthetic */ PageInfo1 copy$default(PageInfo1 pageInfo1, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = pageInfo1.__typename;
            }
            if ((i & 2) != 0) {
                z = pageInfo1.hasNextPage;
            }
            return pageInfo1.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getHasNextPage() {
            return this.hasNextPage;
        }

        public final PageInfo1 copy(String __typename, boolean hasNextPage) {
            __typename.getClass();
            return new PageInfo1(__typename, hasNextPage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PageInfo1)) {
                return false;
            }
            PageInfo1 pageInfo1 = (PageInfo1) other;
            return g76.L(this.__typename, pageInfo1.__typename) && this.hasNextPage == pageInfo1.hasNextPage;
        }

        public final boolean getHasNextPage() {
            return this.hasNextPage;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.hasNextPage ? 1231 : 1237);
        }

        public final String toString() {
            return km4.z("PageInfo1(__typename=", this.__typename, ", hasNextPage=", ")", this.hasNextPage);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B=\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0006\u0010\r\u001a\u00020\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\u001d\u001a\u00020\bHÆ\u0003J\t\u0010\u001e\u001a\u00020\nHÆ\u0003J\t\u0010\u001f\u001a\u00020\fHÆ\u0003J\t\u0010 \u001a\u00020\u0003HÆ\u0003JK\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\"\u001a\u00020#2\b\u0010$\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010%\u001a\u00020&HÖ\u0001J\t\u0010'\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\r\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0011¨\u0006("}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Publication;", "", "__typename", "", "socialNavigationItems", "", "Lcom/medium/android/graphql/PublicationAboutQuery$SocialNavigationItem;", "editors", "Lcom/medium/android/graphql/PublicationAboutQuery$Editors;", "writers", "Lcom/medium/android/graphql/PublicationAboutQuery$Writers;", "aboutPage", "Lcom/medium/android/graphql/PublicationAboutQuery$AboutPage;", "id", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/PublicationAboutQuery$Editors;Lcom/medium/android/graphql/PublicationAboutQuery$Writers;Lcom/medium/android/graphql/PublicationAboutQuery$AboutPage;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getSocialNavigationItems", "()Ljava/util/List;", "getEditors", "()Lcom/medium/android/graphql/PublicationAboutQuery$Editors;", "getWriters", "()Lcom/medium/android/graphql/PublicationAboutQuery$Writers;", "getAboutPage", "()Lcom/medium/android/graphql/PublicationAboutQuery$AboutPage;", "getId", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final AboutPage aboutPage;
        private final Editors editors;
        private final String id;
        private final List<SocialNavigationItem> socialNavigationItems;
        private final Writers writers;

        public Publication(String str, List<SocialNavigationItem> list, Editors editors, Writers writers, AboutPage aboutPage, String str2) {
            str.getClass();
            list.getClass();
            editors.getClass();
            writers.getClass();
            aboutPage.getClass();
            str2.getClass();
            this.__typename = str;
            this.socialNavigationItems = list;
            this.editors = editors;
            this.writers = writers;
            this.aboutPage = aboutPage;
            this.id = str2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Publication copy$default(Publication publication, String str, List list, Editors editors, Writers writers, AboutPage aboutPage, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                list = publication.socialNavigationItems;
            }
            if ((i & 4) != 0) {
                editors = publication.editors;
            }
            if ((i & 8) != 0) {
                writers = publication.writers;
            }
            if ((i & 16) != 0) {
                aboutPage = publication.aboutPage;
            }
            if ((i & 32) != 0) {
                str2 = publication.id;
            }
            AboutPage aboutPage2 = aboutPage;
            String str3 = str2;
            return publication.copy(str, list, editors, writers, aboutPage2, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<SocialNavigationItem> component2() {
            return this.socialNavigationItems;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Editors getEditors() {
            return this.editors;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Writers getWriters() {
            return this.writers;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final AboutPage getAboutPage() {
            return this.aboutPage;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, List<SocialNavigationItem> socialNavigationItems, Editors editors, Writers writers, AboutPage aboutPage, String id) {
            __typename.getClass();
            socialNavigationItems.getClass();
            editors.getClass();
            writers.getClass();
            aboutPage.getClass();
            id.getClass();
            return new Publication(__typename, socialNavigationItems, editors, writers, aboutPage, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.socialNavigationItems, publication.socialNavigationItems) && g76.L(this.editors, publication.editors) && g76.L(this.writers, publication.writers) && g76.L(this.aboutPage, publication.aboutPage) && g76.L(this.id, publication.id);
        }

        public final AboutPage getAboutPage() {
            return this.aboutPage;
        }

        public final Editors getEditors() {
            return this.editors;
        }

        public final String getId() {
            return this.id;
        }

        public final List<SocialNavigationItem> getSocialNavigationItems() {
            return this.socialNavigationItems;
        }

        public final Writers getWriters() {
            return this.writers;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.aboutPage.hashCode() + ((this.writers.hashCode() + ((this.editors.hashCode() + wgd.p(this.__typename.hashCode() * 31, 31, this.socialNavigationItems)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            List<SocialNavigationItem> list = this.socialNavigationItems;
            Editors editors = this.editors;
            Writers writers = this.writers;
            AboutPage aboutPage = this.aboutPage;
            String str2 = this.id;
            StringBuilder sbE = b09.E("Publication(__typename=", str, ", socialNavigationItems=", ", editors=", list);
            sbE.append(editors);
            sbE.append(", writers=");
            sbE.append(writers);
            sbE.append(", aboutPage=");
            sbE.append(aboutPage);
            sbE.append(", id=");
            sbE.append(str2);
            sbE.append(")");
            return sbE.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Section;", "", "__typename", "", "onPublicationFormattedTextSection", "Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationFormattedTextSection;", "onPublicationTagSetSection", "Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationTagSetSection;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationFormattedTextSection;Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationTagSetSection;)V", "get__typename", "()Ljava/lang/String;", "getOnPublicationFormattedTextSection", "()Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationFormattedTextSection;", "getOnPublicationTagSetSection", "()Lcom/medium/android/graphql/PublicationAboutQuery$OnPublicationTagSetSection;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Section {
        private final String __typename;
        private final OnPublicationFormattedTextSection onPublicationFormattedTextSection;
        private final OnPublicationTagSetSection onPublicationTagSetSection;

        public Section(String str, OnPublicationFormattedTextSection onPublicationFormattedTextSection, OnPublicationTagSetSection onPublicationTagSetSection) {
            str.getClass();
            this.__typename = str;
            this.onPublicationFormattedTextSection = onPublicationFormattedTextSection;
            this.onPublicationTagSetSection = onPublicationTagSetSection;
        }

        public static /* synthetic */ Section copy$default(Section section, String str, OnPublicationFormattedTextSection onPublicationFormattedTextSection, OnPublicationTagSetSection onPublicationTagSetSection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = section.__typename;
            }
            if ((i & 2) != 0) {
                onPublicationFormattedTextSection = section.onPublicationFormattedTextSection;
            }
            if ((i & 4) != 0) {
                onPublicationTagSetSection = section.onPublicationTagSetSection;
            }
            return section.copy(str, onPublicationFormattedTextSection, onPublicationTagSetSection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPublicationFormattedTextSection getOnPublicationFormattedTextSection() {
            return this.onPublicationFormattedTextSection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnPublicationTagSetSection getOnPublicationTagSetSection() {
            return this.onPublicationTagSetSection;
        }

        public final Section copy(String __typename, OnPublicationFormattedTextSection onPublicationFormattedTextSection, OnPublicationTagSetSection onPublicationTagSetSection) {
            __typename.getClass();
            return new Section(__typename, onPublicationFormattedTextSection, onPublicationTagSetSection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Section)) {
                return false;
            }
            Section section = (Section) other;
            return g76.L(this.__typename, section.__typename) && g76.L(this.onPublicationFormattedTextSection, section.onPublicationFormattedTextSection) && g76.L(this.onPublicationTagSetSection, section.onPublicationTagSetSection);
        }

        public final OnPublicationFormattedTextSection getOnPublicationFormattedTextSection() {
            return this.onPublicationFormattedTextSection;
        }

        public final OnPublicationTagSetSection getOnPublicationTagSetSection() {
            return this.onPublicationTagSetSection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPublicationFormattedTextSection onPublicationFormattedTextSection = this.onPublicationFormattedTextSection;
            int iHashCode2 = (iHashCode + (onPublicationFormattedTextSection == null ? 0 : onPublicationFormattedTextSection.hashCode())) * 31;
            OnPublicationTagSetSection onPublicationTagSetSection = this.onPublicationTagSetSection;
            return iHashCode2 + (onPublicationTagSetSection != null ? onPublicationTagSetSection.hashCode() : 0);
        }

        public final String toString() {
            return "Section(__typename=" + this.__typename + ", onPublicationFormattedTextSection=" + this.onPublicationFormattedTextSection + ", onPublicationTagSetSection=" + this.onPublicationTagSetSection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J3\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$SocialNavigationItem;", "", "__typename", "", "icon", "Lcom/medium/android/graphql/PublicationAboutQuery$Icon;", "value", "destination", "Lcom/medium/android/graphql/type/PublicationNavigationItemDestination;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/PublicationAboutQuery$Icon;Ljava/lang/String;Lcom/medium/android/graphql/type/PublicationNavigationItemDestination;)V", "get__typename", "()Ljava/lang/String;", "getIcon", "()Lcom/medium/android/graphql/PublicationAboutQuery$Icon;", "getValue", "getDestination", "()Lcom/medium/android/graphql/type/PublicationNavigationItemDestination;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SocialNavigationItem {
        private final String __typename;
        private final PublicationNavigationItemDestination destination;
        private final Icon icon;
        private final String value;

        public SocialNavigationItem(String str, Icon icon, String str2, PublicationNavigationItemDestination publicationNavigationItemDestination) {
            str.getClass();
            str2.getClass();
            publicationNavigationItemDestination.getClass();
            this.__typename = str;
            this.icon = icon;
            this.value = str2;
            this.destination = publicationNavigationItemDestination;
        }

        public static /* synthetic */ SocialNavigationItem copy$default(SocialNavigationItem socialNavigationItem, String str, Icon icon, String str2, PublicationNavigationItemDestination publicationNavigationItemDestination, int i, Object obj) {
            if ((i & 1) != 0) {
                str = socialNavigationItem.__typename;
            }
            if ((i & 2) != 0) {
                icon = socialNavigationItem.icon;
            }
            if ((i & 4) != 0) {
                str2 = socialNavigationItem.value;
            }
            if ((i & 8) != 0) {
                publicationNavigationItemDestination = socialNavigationItem.destination;
            }
            return socialNavigationItem.copy(str, icon, str2, publicationNavigationItemDestination);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Icon getIcon() {
            return this.icon;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getValue() {
            return this.value;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PublicationNavigationItemDestination getDestination() {
            return this.destination;
        }

        public final SocialNavigationItem copy(String __typename, Icon icon, String value, PublicationNavigationItemDestination destination) {
            __typename.getClass();
            value.getClass();
            destination.getClass();
            return new SocialNavigationItem(__typename, icon, value, destination);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SocialNavigationItem)) {
                return false;
            }
            SocialNavigationItem socialNavigationItem = (SocialNavigationItem) other;
            return g76.L(this.__typename, socialNavigationItem.__typename) && g76.L(this.icon, socialNavigationItem.icon) && g76.L(this.value, socialNavigationItem.value) && this.destination == socialNavigationItem.destination;
        }

        public final PublicationNavigationItemDestination getDestination() {
            return this.destination;
        }

        public final Icon getIcon() {
            return this.icon;
        }

        public final String getValue() {
            return this.value;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Icon icon = this.icon;
            return this.destination.hashCode() + wgd.o((iHashCode + (icon == null ? 0 : icon.hashCode())) * 31, 31, this.value);
        }

        public final String toString() {
            return "SocialNavigationItem(__typename=" + this.__typename + ", icon=" + this.icon + ", value=" + this.value + ", destination=" + this.destination + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J3\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Tag;", "", "__typename", "", "id", "normalizedTagSlug", "displayTitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getNormalizedTagSlug", "getDisplayTitle", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Tag {
        private final String __typename;
        private final String displayTitle;
        private final String id;
        private final String normalizedTagSlug;

        public Tag(String str, String str2, String str3, String str4) {
            b09.I(str, str2, str3);
            this.__typename = str;
            this.id = str2;
            this.normalizedTagSlug = str3;
            this.displayTitle = str4;
        }

        public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, String str3, String str4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tag.id;
            }
            if ((i & 4) != 0) {
                str3 = tag.normalizedTagSlug;
            }
            if ((i & 8) != 0) {
                str4 = tag.displayTitle;
            }
            return tag.copy(str, str2, str3, str4);
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
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getDisplayTitle() {
            return this.displayTitle;
        }

        public final Tag copy(String __typename, String id, String normalizedTagSlug, String displayTitle) {
            __typename.getClass();
            id.getClass();
            normalizedTagSlug.getClass();
            return new Tag(__typename, id, normalizedTagSlug, displayTitle);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) other;
            return g76.L(this.__typename, tag.__typename) && g76.L(this.id, tag.id) && g76.L(this.normalizedTagSlug, tag.normalizedTagSlug) && g76.L(this.displayTitle, tag.displayTitle);
        }

        public final String getDisplayTitle() {
            return this.displayTitle;
        }

        public final String getId() {
            return this.id;
        }

        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.normalizedTagSlug);
            String str = this.displayTitle;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return km4.C(y30.u("Tag(__typename=", str, ", id=", str2, ", normalizedTagSlug="), this.normalizedTagSlug, ", displayTitle=", this.displayTitle, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0013\u001a\u00020\bHÆ\u0003J/\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Writers;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/PublicationAboutQuery$Edge1;", "pageInfo", "Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo1;", "<init>", "(Ljava/lang/String;Ljava/util/List;Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo1;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "getPageInfo", "()Lcom/medium/android/graphql/PublicationAboutQuery$PageInfo1;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Writers {
        private final String __typename;
        private final List<Edge1> edges;
        private final PageInfo1 pageInfo;

        public Writers(String str, List<Edge1> list, PageInfo1 pageInfo1) {
            str.getClass();
            pageInfo1.getClass();
            this.__typename = str;
            this.edges = list;
            this.pageInfo = pageInfo1;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Writers copy$default(Writers writers, String str, List list, PageInfo1 pageInfo1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = writers.__typename;
            }
            if ((i & 2) != 0) {
                list = writers.edges;
            }
            if ((i & 4) != 0) {
                pageInfo1 = writers.pageInfo;
            }
            return writers.copy(str, list, pageInfo1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge1> component2() {
            return this.edges;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PageInfo1 getPageInfo() {
            return this.pageInfo;
        }

        public final Writers copy(String __typename, List<Edge1> edges, PageInfo1 pageInfo) {
            __typename.getClass();
            pageInfo.getClass();
            return new Writers(__typename, edges, pageInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Writers)) {
                return false;
            }
            Writers writers = (Writers) other;
            return g76.L(this.__typename, writers.__typename) && g76.L(this.edges, writers.edges) && g76.L(this.pageInfo, writers.pageInfo);
        }

        public final List<Edge1> getEdges() {
            return this.edges;
        }

        public final PageInfo1 getPageInfo() {
            return this.pageInfo;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<Edge1> list = this.edges;
            return this.pageInfo.hashCode() + ((iHashCode + (list == null ? 0 : list.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            List<Edge1> list = this.edges;
            PageInfo1 pageInfo1 = this.pageInfo;
            StringBuilder sbE = b09.E("Writers(__typename=", str, ", edges=", ", pageInfo=", list);
            sbE.append(pageInfo1);
            sbE.append(")");
            return sbE.toString();
        }
    }

    public PublicationAboutQuery(String str, int i, int i2) {
        str.getClass();
        this.publicationId = str;
        this.firstEditors = i;
        this.firstWriters = i2;
    }

    public static /* synthetic */ PublicationAboutQuery copy$default(PublicationAboutQuery publicationAboutQuery, String str, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            str = publicationAboutQuery.publicationId;
        }
        if ((i3 & 2) != 0) {
            i = publicationAboutQuery.firstEditors;
        }
        if ((i3 & 4) != 0) {
            i2 = publicationAboutQuery.firstWriters;
        }
        return publicationAboutQuery.copy(str, i, i2);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PublicationAboutQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getFirstEditors() {
        return this.firstEditors;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final int getFirstWriters() {
        return this.firstWriters;
    }

    public final PublicationAboutQuery copy(String publicationId, int firstEditors, int firstWriters) {
        publicationId.getClass();
        return new PublicationAboutQuery(publicationId, firstEditors, firstWriters);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query PublicationAboutQuery($publicationId: String!, $firstEditors: Int!, $firstWriters: Int!) { publication(id: $publicationId) { __typename socialNavigationItems { __typename icon { __typename id alt } value destination } editors: mastheadConnection(first: $firstEditors, after: \"\", opts: { filterRoles: [EDITOR] } ) { __typename edges { __typename node { __typename ...PublicationFlairedStaffData } } pageInfo { __typename hasNextPage } } writers: mastheadConnection(first: $firstWriters, after: \"\", opts: { filterRoles: [WRITER] } ) { __typename edges { __typename node { __typename ...PublicationFlairedStaffData } } pageInfo { __typename hasNextPage } } aboutPage { __typename sections { __typename ... on PublicationFormattedTextSection { content { __typename plaintext } } ... on PublicationTagSetSection { id title tags { __typename id normalizedTagSlug displayTitle } } } } id } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment PublicationStaffData on User { __typename id name bio imageId ...UserFollowData membership { __typename ...membershipFragment } newsletterV3 { __typename id } }  fragment PublicationFlairedStaffData on PublicationFlairedUser { __typename title user { __typename ...PublicationStaffData id } }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationAboutQuery)) {
            return false;
        }
        PublicationAboutQuery publicationAboutQuery = (PublicationAboutQuery) other;
        return g76.L(this.publicationId, publicationAboutQuery.publicationId) && this.firstEditors == publicationAboutQuery.firstEditors && this.firstWriters == publicationAboutQuery.firstWriters;
    }

    public final int getFirstEditors() {
        return this.firstEditors;
    }

    public final int getFirstWriters() {
        return this.firstWriters;
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return (((this.publicationId.hashCode() * 31) + this.firstEditors) * 31) + this.firstWriters;
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
        List<sx1> list = PublicationAboutQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        PublicationAboutQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.publicationId;
        int i = this.firstEditors;
        return ho2.H(y30.t(i, "PublicationAboutQuery(publicationId=", str, ", firstEditors=", ", firstWriters="), this.firstWriters, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/PublicationAboutQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query PublicationAboutQuery($publicationId: String!, $firstEditors: Int!, $firstWriters: Int!) { publication(id: $publicationId) { __typename socialNavigationItems { __typename icon { __typename id alt } value destination } editors: mastheadConnection(first: $firstEditors, after: \"\", opts: { filterRoles: [EDITOR] } ) { __typename edges { __typename node { __typename ...PublicationFlairedStaffData } } pageInfo { __typename hasNextPage } } writers: mastheadConnection(first: $firstWriters, after: \"\", opts: { filterRoles: [WRITER] } ) { __typename edges { __typename node { __typename ...PublicationFlairedStaffData } } pageInfo { __typename hasNextPage } } aboutPage { __typename sections { __typename ... on PublicationFormattedTextSection { content { __typename plaintext } } ... on PublicationTagSetSection { id title tags { __typename id normalizedTagSlug displayTitle } } } } id } }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment membershipFragment on Membership { __typename tier memberSince friendSince }  fragment PublicationStaffData on User { __typename id name bio imageId ...UserFollowData membership { __typename ...membershipFragment } newsletterV3 { __typename id } }  fragment PublicationFlairedStaffData on PublicationFlairedUser { __typename title user { __typename ...PublicationStaffData id } }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
