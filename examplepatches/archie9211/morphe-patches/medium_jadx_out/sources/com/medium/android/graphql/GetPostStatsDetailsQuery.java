package com.medium.android.graphql;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.data.notification.YMl.DtuT;
import com.medium.android.graphql.adapter.GetPostStatsDetailsQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.GetPostStatsDetailsQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.selections.GetPostStatsDetailsQuerySelections;
import com.medium.android.graphql.type.PublicationFeaturingEventType;
import com.medium.android.graphql.type.Query;
import com.medium.android.graphql.type.ReferrerType;
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
import java.util.Currency;
import java.util.List;
import kotlin.Metadata;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u001f\b\u0086\b\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0019()*+,-./0123456789:;<=>?'B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\n\u0010\bJ'\u0010\u0012\u001a\u00020\u00112\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0015\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001a\u0010\bJ\u001a\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\bJ\u0010\u0010\u001f\u001a\u00020\u001eHÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u000f2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\b¨\u0006@"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery;", "Luqa;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Data;", "", "postId", "<init>", "(Ljava/lang/String;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "copy", "(Ljava/lang/String;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Companion", "Data", "PostResult", "OnPost", "PublicationFeaturingEventsConnection", "OnPublicationFeaturingEventsConnection", "Edge", "Node", "Publication", "ReadersTopicsV2", "Tag", "Referrer", "Earnings", "Total", "OnGraphqlEmptyId", "OnWithheldInCountry", "OnRemovedByUser", "OnUnavailableForLegalReasons", "OnUnauthorized", "OnPostSuspended", "OnAccountSuspended", "OnAccountDeleted", "OnBlocked", "OnBlocking", "PostStatsTotalBundle", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class GetPostStatsDetailsQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "ef5dc63871f49d082757030ceb7b42c00df644f3b89bd1d47d96a47e2e06e77d";
    public static final String OPERATION_NAME = "GetPostStatsDetailsQuery";
    private final String postId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0012\u0010\b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ&\u0010\f\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u0004HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\tR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u000b¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;", "postResult", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "postStatsTotalBundle", "<init>", "(Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;)V", "component1", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;", "component2", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "copy", "(Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;", "getPostResult", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "getPostStatsTotalBundle", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final PostResult postResult;
        private final PostStatsTotalBundle postStatsTotalBundle;

        public Data(PostResult postResult, PostStatsTotalBundle postStatsTotalBundle) {
            postStatsTotalBundle.getClass();
            this.postResult = postResult;
            this.postStatsTotalBundle = postStatsTotalBundle;
        }

        public static /* synthetic */ Data copy$default(Data data, PostResult postResult, PostStatsTotalBundle postStatsTotalBundle, int i, Object obj) {
            if ((i & 1) != 0) {
                postResult = data.postResult;
            }
            if ((i & 2) != 0) {
                postStatsTotalBundle = data.postStatsTotalBundle;
            }
            return data.copy(postResult, postStatsTotalBundle);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final PostResult getPostResult() {
            return this.postResult;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostStatsTotalBundle getPostStatsTotalBundle() {
            return this.postStatsTotalBundle;
        }

        public final Data copy(PostResult postResult, PostStatsTotalBundle postStatsTotalBundle) {
            postStatsTotalBundle.getClass();
            return new Data(postResult, postStatsTotalBundle);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Data)) {
                return false;
            }
            Data data = (Data) other;
            return g76.L(this.postResult, data.postResult) && g76.L(this.postStatsTotalBundle, data.postStatsTotalBundle);
        }

        public final PostResult getPostResult() {
            return this.postResult;
        }

        public final PostStatsTotalBundle getPostStatsTotalBundle() {
            return this.postStatsTotalBundle;
        }

        public final int hashCode() {
            PostResult postResult = this.postResult;
            return this.postStatsTotalBundle.hashCode() + ((postResult == null ? 0 : postResult.hashCode()) * 31);
        }

        public final String toString() {
            return "Data(postResult=" + this.postResult + ", postStatsTotalBundle=" + this.postStatsTotalBundle + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;", "", "__typename", "", "total", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;)V", "get__typename", "()Ljava/lang/String;", "getTotal", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Earnings {
        private final String __typename;
        private final Total total;

        public Earnings(String str, Total total) {
            str.getClass();
            total.getClass();
            this.__typename = str;
            this.total = total;
        }

        public static /* synthetic */ Earnings copy$default(Earnings earnings, String str, Total total, int i, Object obj) {
            if ((i & 1) != 0) {
                str = earnings.__typename;
            }
            if ((i & 2) != 0) {
                total = earnings.total;
            }
            return earnings.copy(str, total);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Total getTotal() {
            return this.total;
        }

        public final Earnings copy(String __typename, Total total) {
            __typename.getClass();
            total.getClass();
            return new Earnings(__typename, total);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Earnings)) {
                return false;
            }
            Earnings earnings = (Earnings) other;
            return g76.L(this.__typename, earnings.__typename) && g76.L(this.total, earnings.total);
        }

        public final Total getTotal() {
            return this.total;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.total.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Earnings(__typename=" + this.__typename + ", total=" + this.total + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0017\u001a\u00020\tHÆ\u0003J1\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u001dHÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Node;", "", "__typename", "", "publication", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;", "eventType", "Lcom/medium/android/graphql/type/PublicationFeaturingEventType;", "occurredAt", "", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;Lcom/medium/android/graphql/type/PublicationFeaturingEventType;J)V", "get__typename", "()Ljava/lang/String;", "getPublication", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;", "getEventType", "()Lcom/medium/android/graphql/type/PublicationFeaturingEventType;", "getOccurredAt", "()J", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final PublicationFeaturingEventType eventType;
        private final long occurredAt;
        private final Publication publication;

        public Node(String str, Publication publication, PublicationFeaturingEventType publicationFeaturingEventType, long j) {
            str.getClass();
            publication.getClass();
            publicationFeaturingEventType.getClass();
            this.__typename = str;
            this.publication = publication;
            this.eventType = publicationFeaturingEventType;
            this.occurredAt = j;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, Publication publication, PublicationFeaturingEventType publicationFeaturingEventType, long j, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                publication = node.publication;
            }
            if ((i & 4) != 0) {
                publicationFeaturingEventType = node.eventType;
            }
            if ((i & 8) != 0) {
                j = node.occurredAt;
            }
            PublicationFeaturingEventType publicationFeaturingEventType2 = publicationFeaturingEventType;
            return node.copy(str, publication, publicationFeaturingEventType2, j);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final PublicationFeaturingEventType getEventType() {
            return this.eventType;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final long getOccurredAt() {
            return this.occurredAt;
        }

        public final Node copy(String __typename, Publication publication, PublicationFeaturingEventType eventType, long occurredAt) {
            __typename.getClass();
            publication.getClass();
            eventType.getClass();
            return new Node(__typename, publication, eventType, occurredAt);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.publication, node.publication) && this.eventType == node.eventType && this.occurredAt == node.occurredAt;
        }

        public final PublicationFeaturingEventType getEventType() {
            return this.eventType;
        }

        public final long getOccurredAt() {
            return this.occurredAt;
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = (this.eventType.hashCode() + ((this.publication.hashCode() + (this.__typename.hashCode() * 31)) * 31)) * 31;
            long j = this.occurredAt;
            return iHashCode + ((int) (j ^ (j >>> 32)));
        }

        public final String toString() {
            return "Node(__typename=" + this.__typename + ", publication=" + this.publication + ", eventType=" + this.eventType + ", occurredAt=" + this.occurredAt + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAccountDeleted {
        private final String message;

        public OnAccountDeleted(String str) {
            this.message = str;
        }

        public static OnAccountDeleted copy$default(OnAccountDeleted onAccountDeleted, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAccountDeleted.message;
            }
            onAccountDeleted.getClass();
            return new OnAccountDeleted(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnAccountDeleted copy(String message) {
            return new OnAccountDeleted(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnAccountDeleted) && g76.L(this.message, ((OnAccountDeleted) other).message);
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
            return ev6.x("OnAccountDeleted(message=", this.message, DtuT.RMuYPVHHGuNW);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnAccountSuspended {
        private final String message;

        public OnAccountSuspended(String str) {
            this.message = str;
        }

        public static OnAccountSuspended copy$default(OnAccountSuspended onAccountSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onAccountSuspended.message;
            }
            onAccountSuspended.getClass();
            return new OnAccountSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnAccountSuspended copy(String message) {
            return new OnAccountSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnAccountSuspended) && g76.L(this.message, ((OnAccountSuspended) other).message);
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
            return ev6.x("OnAccountSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBlocked {
        private final String message;

        public OnBlocked(String str) {
            this.message = str;
        }

        public static OnBlocked copy$default(OnBlocked onBlocked, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBlocked.message;
            }
            onBlocked.getClass();
            return new OnBlocked(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBlocked copy(String message) {
            return new OnBlocked(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBlocked) && g76.L(this.message, ((OnBlocked) other).message);
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
            return ev6.x("OnBlocked(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnBlocking {
        private final String message;

        public OnBlocking(String str) {
            this.message = str;
        }

        public static OnBlocking copy$default(OnBlocking onBlocking, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onBlocking.message;
            }
            onBlocking.getClass();
            return new OnBlocking(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnBlocking copy(String message) {
            return new OnBlocking(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnBlocking) && g76.L(this.message, ((OnBlocking) other).message);
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
            return ev6.x("OnBlocking(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnGraphqlEmptyId {
        private final String message;

        public OnGraphqlEmptyId(String str) {
            this.message = str;
        }

        public static OnGraphqlEmptyId copy$default(OnGraphqlEmptyId onGraphqlEmptyId, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onGraphqlEmptyId.message;
            }
            onGraphqlEmptyId.getClass();
            return new OnGraphqlEmptyId(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnGraphqlEmptyId copy(String message) {
            return new OnGraphqlEmptyId(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnGraphqlEmptyId) && g76.L(this.message, ((OnGraphqlEmptyId) other).message);
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
            return ev6.x("OnGraphqlEmptyId(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B[\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t\u0012\u000e\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\t\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003¢\u0006\u0002\u0010\u0016J\t\u0010&\u001a\u00020\u0005HÆ\u0003J\u0010\u0010'\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u001aJ\u000f\u0010(\u001a\b\u0012\u0004\u0012\u00020\n0\tHÆ\u0003J\u0011\u0010)\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\tHÆ\u0003J\u000b\u0010*\u001a\u0004\u0018\u00010\u000eHÆ\u0003J\t\u0010+\u001a\u00020\u0010HÆ\u0003J\t\u0010,\u001a\u00020\u0012HÆ\u0003Jr\u0010-\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t2\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\t2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u0012HÆ\u0001¢\u0006\u0002\u0010.J\u0013\u0010/\u001a\u00020\u00072\b\u00100\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00101\u001a\u000202HÖ\u0001J\t\u00103\u001a\u00020\u0010HÖ\u0001R\u0015\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u0006\u0010\u001aR\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0019\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001dR\u0013\u0010\r\u001a\u0004\u0018\u00010\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u0011\u0010\u000f\u001a\u00020\u0010¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b#\u0010$¨\u00064"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;", "", "firstBoostedAt", "", "publicationFeaturingEventsConnection", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;", "isLocked", "", "readersTopicsV2", "", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$ReadersTopicsV2;", "referrers", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Referrer;", "earnings", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;", "id", "", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "(Ljava/lang/Long;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;Ljava/lang/Boolean;Ljava/util/List;Ljava/util/List;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "getFirstBoostedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getPublicationFeaturingEventsConnection", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getReadersTopicsV2", "()Ljava/util/List;", "getReferrers", "getEarnings", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;", "getId", "()Ljava/lang/String;", "getPostPreviewData", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "(Ljava/lang/Long;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;Ljava/lang/Boolean;Ljava/util/List;Ljava/util/List;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Earnings;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPost {
        private final Earnings earnings;
        private final Long firstBoostedAt;
        private final String id;
        private final Boolean isLocked;
        private final PostPreviewData postPreviewData;
        private final PublicationFeaturingEventsConnection publicationFeaturingEventsConnection;
        private final List<ReadersTopicsV2> readersTopicsV2;
        private final List<Referrer> referrers;

        public OnPost(Long l, PublicationFeaturingEventsConnection publicationFeaturingEventsConnection, Boolean bool, List<ReadersTopicsV2> list, List<Referrer> list2, Earnings earnings, String str, PostPreviewData postPreviewData) {
            publicationFeaturingEventsConnection.getClass();
            list.getClass();
            str.getClass();
            postPreviewData.getClass();
            this.firstBoostedAt = l;
            this.publicationFeaturingEventsConnection = publicationFeaturingEventsConnection;
            this.isLocked = bool;
            this.readersTopicsV2 = list;
            this.referrers = list2;
            this.earnings = earnings;
            this.id = str;
            this.postPreviewData = postPreviewData;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnPost copy$default(OnPost onPost, Long l, PublicationFeaturingEventsConnection publicationFeaturingEventsConnection, Boolean bool, List list, List list2, Earnings earnings, String str, PostPreviewData postPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                l = onPost.firstBoostedAt;
            }
            if ((i & 2) != 0) {
                publicationFeaturingEventsConnection = onPost.publicationFeaturingEventsConnection;
            }
            if ((i & 4) != 0) {
                bool = onPost.isLocked;
            }
            if ((i & 8) != 0) {
                list = onPost.readersTopicsV2;
            }
            if ((i & 16) != 0) {
                list2 = onPost.referrers;
            }
            if ((i & 32) != 0) {
                earnings = onPost.earnings;
            }
            if ((i & 64) != 0) {
                str = onPost.id;
            }
            if ((i & 128) != 0) {
                postPreviewData = onPost.postPreviewData;
            }
            String str2 = str;
            PostPreviewData postPreviewData2 = postPreviewData;
            List list3 = list2;
            Earnings earnings2 = earnings;
            return onPost.copy(l, publicationFeaturingEventsConnection, bool, list, list3, earnings2, str2, postPreviewData2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final Long getFirstBoostedAt() {
            return this.firstBoostedAt;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationFeaturingEventsConnection getPublicationFeaturingEventsConnection() {
            return this.publicationFeaturingEventsConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Boolean getIsLocked() {
            return this.isLocked;
        }

        public final List<ReadersTopicsV2> component4() {
            return this.readersTopicsV2;
        }

        public final List<Referrer> component5() {
            return this.referrers;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final Earnings getEarnings() {
            return this.earnings;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final OnPost copy(Long firstBoostedAt, PublicationFeaturingEventsConnection publicationFeaturingEventsConnection, Boolean isLocked, List<ReadersTopicsV2> readersTopicsV2, List<Referrer> referrers, Earnings earnings, String id, PostPreviewData postPreviewData) {
            publicationFeaturingEventsConnection.getClass();
            readersTopicsV2.getClass();
            id.getClass();
            postPreviewData.getClass();
            return new OnPost(firstBoostedAt, publicationFeaturingEventsConnection, isLocked, readersTopicsV2, referrers, earnings, id, postPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPost)) {
                return false;
            }
            OnPost onPost = (OnPost) other;
            return g76.L(this.firstBoostedAt, onPost.firstBoostedAt) && g76.L(this.publicationFeaturingEventsConnection, onPost.publicationFeaturingEventsConnection) && g76.L(this.isLocked, onPost.isLocked) && g76.L(this.readersTopicsV2, onPost.readersTopicsV2) && g76.L(this.referrers, onPost.referrers) && g76.L(this.earnings, onPost.earnings) && g76.L(this.id, onPost.id) && g76.L(this.postPreviewData, onPost.postPreviewData);
        }

        public final Earnings getEarnings() {
            return this.earnings;
        }

        public final Long getFirstBoostedAt() {
            return this.firstBoostedAt;
        }

        public final String getId() {
            return this.id;
        }

        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final PublicationFeaturingEventsConnection getPublicationFeaturingEventsConnection() {
            return this.publicationFeaturingEventsConnection;
        }

        public final List<ReadersTopicsV2> getReadersTopicsV2() {
            return this.readersTopicsV2;
        }

        public final List<Referrer> getReferrers() {
            return this.referrers;
        }

        public final int hashCode() {
            Long l = this.firstBoostedAt;
            int iHashCode = (this.publicationFeaturingEventsConnection.hashCode() + ((l == null ? 0 : l.hashCode()) * 31)) * 31;
            Boolean bool = this.isLocked;
            int iP = wgd.p((iHashCode + (bool == null ? 0 : bool.hashCode())) * 31, 31, this.readersTopicsV2);
            List<Referrer> list = this.referrers;
            int iHashCode2 = (iP + (list == null ? 0 : list.hashCode())) * 31;
            Earnings earnings = this.earnings;
            return this.postPreviewData.hashCode() + wgd.o((iHashCode2 + (earnings != null ? earnings.hashCode() : 0)) * 31, 31, this.id);
        }

        public final Boolean isLocked() {
            return this.isLocked;
        }

        public final String toString() {
            return AEVqIoD.nuuZsjYRjLqi + this.firstBoostedAt + ", publicationFeaturingEventsConnection=" + this.publicationFeaturingEventsConnection + ", isLocked=" + this.isLocked + ", readersTopicsV2=" + this.readersTopicsV2 + ", referrers=" + this.referrers + ", earnings=" + this.earnings + ", id=" + this.id + ", postPreviewData=" + this.postPreviewData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPostSuspended {
        private final String message;

        public OnPostSuspended(String str) {
            this.message = str;
        }

        public static OnPostSuspended copy$default(OnPostSuspended onPostSuspended, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPostSuspended.message;
            }
            onPostSuspended.getClass();
            return new OnPostSuspended(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnPostSuspended copy(String message) {
            return new OnPostSuspended(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPostSuspended) && g76.L(this.message, ((OnPostSuspended) other).message);
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
            return ev6.x("OnPostSuspended(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;", "", "edges", "", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Edge;", "<init>", "(Ljava/util/List;)V", "getEdges", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublicationFeaturingEventsConnection {
        private final List<Edge> edges;

        public OnPublicationFeaturingEventsConnection(List<Edge> list) {
            list.getClass();
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnPublicationFeaturingEventsConnection copy$default(OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnection, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onPublicationFeaturingEventsConnection.edges;
            }
            return onPublicationFeaturingEventsConnection.copy(list);
        }

        public final List<Edge> component1() {
            return this.edges;
        }

        public final OnPublicationFeaturingEventsConnection copy(List<Edge> edges) {
            edges.getClass();
            return new OnPublicationFeaturingEventsConnection(edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPublicationFeaturingEventsConnection) && g76.L(this.edges, ((OnPublicationFeaturingEventsConnection) other).edges);
        }

        public final List<Edge> getEdges() {
            return this.edges;
        }

        public final int hashCode() {
            return this.edges.hashCode();
        }

        public final String toString() {
            return ka1.t("OnPublicationFeaturingEventsConnection(edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnRemovedByUser {
        private final String message;

        public OnRemovedByUser(String str) {
            this.message = str;
        }

        public static OnRemovedByUser copy$default(OnRemovedByUser onRemovedByUser, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onRemovedByUser.message;
            }
            onRemovedByUser.getClass();
            return new OnRemovedByUser(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnRemovedByUser copy(String message) {
            return new OnRemovedByUser(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnRemovedByUser) && g76.L(this.message, ((OnRemovedByUser) other).message);
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
            return ev6.x("OnRemovedByUser(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUnavailableForLegalReasons {
        private final String message;

        public OnUnavailableForLegalReasons(String str) {
            this.message = str;
        }

        public static OnUnavailableForLegalReasons copy$default(OnUnavailableForLegalReasons onUnavailableForLegalReasons, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUnavailableForLegalReasons.message;
            }
            onUnavailableForLegalReasons.getClass();
            return new OnUnavailableForLegalReasons(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnUnavailableForLegalReasons copy(String message) {
            return new OnUnavailableForLegalReasons(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnUnavailableForLegalReasons) && g76.L(this.message, ((OnUnavailableForLegalReasons) other).message);
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
            return ev6.x("OnUnavailableForLegalReasons(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;", "", "message", "", "<init>", "(Ljava/lang/String;)V", "getMessage", "()Ljava/lang/String;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnWithheldInCountry {
        private final String message;

        public OnWithheldInCountry(String str) {
            this.message = str;
        }

        public static OnWithheldInCountry copy$default(OnWithheldInCountry onWithheldInCountry, String str, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onWithheldInCountry.message;
            }
            onWithheldInCountry.getClass();
            return new OnWithheldInCountry(str);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getMessage() {
            return this.message;
        }

        public final OnWithheldInCountry copy(String message) {
            return new OnWithheldInCountry(message);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnWithheldInCountry) && g76.L(this.message, ((OnWithheldInCountry) other).message);
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
            return ev6.x("OnWithheldInCountry(message=", this.message, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b(\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B}\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u001a\u0010\u001bJ\t\u00104\u001a\u00020\u0003HÆ\u0003J\u000b\u00105\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u00106\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u00107\u001a\u0004\u0018\u00010\tHÆ\u0003J\u000b\u00108\u001a\u0004\u0018\u00010\u000bHÆ\u0003J\u000b\u00109\u001a\u0004\u0018\u00010\rHÆ\u0003J\u000b\u0010:\u001a\u0004\u0018\u00010\u000fHÆ\u0003J\u000b\u0010;\u001a\u0004\u0018\u00010\u0011HÆ\u0003J\u000b\u0010<\u001a\u0004\u0018\u00010\u0013HÆ\u0003J\u000b\u0010=\u001a\u0004\u0018\u00010\u0015HÆ\u0003J\u000b\u0010>\u001a\u0004\u0018\u00010\u0017HÆ\u0003J\u000b\u0010?\u001a\u0004\u0018\u00010\u0019HÆ\u0003J\u0097\u0001\u0010@\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0019HÆ\u0001J\u0013\u0010A\u001a\u00020B2\b\u0010C\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010D\u001a\u00020EHÖ\u0001J\t\u0010F\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b \u0010!R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R\u0013\u0010\n\u001a\u0004\u0018\u00010\u000b¢\u0006\b\n\u0000\u001a\u0004\b$\u0010%R\u0013\u0010\f\u001a\u0004\u0018\u00010\r¢\u0006\b\n\u0000\u001a\u0004\b&\u0010'R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b(\u0010)R\u0013\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\b\n\u0000\u001a\u0004\b*\u0010+R\u0013\u0010\u0012\u001a\u0004\u0018\u00010\u0013¢\u0006\b\n\u0000\u001a\u0004\b,\u0010-R\u0013\u0010\u0014\u001a\u0004\u0018\u00010\u0015¢\u0006\b\n\u0000\u001a\u0004\b.\u0010/R\u0013\u0010\u0016\u001a\u0004\u0018\u00010\u0017¢\u0006\b\n\u0000\u001a\u0004\b0\u00101R\u0013\u0010\u0018\u001a\u0004\u0018\u00010\u0019¢\u0006\b\n\u0000\u001a\u0004\b2\u00103¨\u0006G"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostResult;", "", "__typename", "", "onPost", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;", "onGraphqlEmptyId", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;", "onWithheldInCountry", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;", "onRemovedByUser", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;", "onUnavailableForLegalReasons", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;", "onUnauthorized", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;", "onPostSuspended", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;", "onAccountSuspended", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;", "onAccountDeleted", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;", "onBlocked", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;", "onBlocking", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;)V", "get__typename", "()Ljava/lang/String;", "getOnPost", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPost;", "getOnGraphqlEmptyId", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnGraphqlEmptyId;", "getOnWithheldInCountry", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnWithheldInCountry;", "getOnRemovedByUser", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnRemovedByUser;", "getOnUnavailableForLegalReasons", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnavailableForLegalReasons;", "getOnUnauthorized", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnUnauthorized;", "getOnPostSuspended", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPostSuspended;", "getOnAccountSuspended", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountSuspended;", "getOnAccountDeleted", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnAccountDeleted;", "getOnBlocked", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocked;", "getOnBlocking", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnBlocking;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostResult {
        private final String __typename;
        private final OnAccountDeleted onAccountDeleted;
        private final OnAccountSuspended onAccountSuspended;
        private final OnBlocked onBlocked;
        private final OnBlocking onBlocking;
        private final OnGraphqlEmptyId onGraphqlEmptyId;
        private final OnPost onPost;
        private final OnPostSuspended onPostSuspended;
        private final OnRemovedByUser onRemovedByUser;
        private final OnUnauthorized onUnauthorized;
        private final OnUnavailableForLegalReasons onUnavailableForLegalReasons;
        private final OnWithheldInCountry onWithheldInCountry;

        public PostResult(String str, OnPost onPost, OnGraphqlEmptyId onGraphqlEmptyId, OnWithheldInCountry onWithheldInCountry, OnRemovedByUser onRemovedByUser, OnUnavailableForLegalReasons onUnavailableForLegalReasons, OnUnauthorized onUnauthorized, OnPostSuspended onPostSuspended, OnAccountSuspended onAccountSuspended, OnAccountDeleted onAccountDeleted, OnBlocked onBlocked, OnBlocking onBlocking) {
            str.getClass();
            this.__typename = str;
            this.onPost = onPost;
            this.onGraphqlEmptyId = onGraphqlEmptyId;
            this.onWithheldInCountry = onWithheldInCountry;
            this.onRemovedByUser = onRemovedByUser;
            this.onUnavailableForLegalReasons = onUnavailableForLegalReasons;
            this.onUnauthorized = onUnauthorized;
            this.onPostSuspended = onPostSuspended;
            this.onAccountSuspended = onAccountSuspended;
            this.onAccountDeleted = onAccountDeleted;
            this.onBlocked = onBlocked;
            this.onBlocking = onBlocking;
        }

        public static /* synthetic */ PostResult copy$default(PostResult postResult, String str, OnPost onPost, OnGraphqlEmptyId onGraphqlEmptyId, OnWithheldInCountry onWithheldInCountry, OnRemovedByUser onRemovedByUser, OnUnavailableForLegalReasons onUnavailableForLegalReasons, OnUnauthorized onUnauthorized, OnPostSuspended onPostSuspended, OnAccountSuspended onAccountSuspended, OnAccountDeleted onAccountDeleted, OnBlocked onBlocked, OnBlocking onBlocking, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postResult.__typename;
            }
            if ((i & 2) != 0) {
                onPost = postResult.onPost;
            }
            if ((i & 4) != 0) {
                onGraphqlEmptyId = postResult.onGraphqlEmptyId;
            }
            if ((i & 8) != 0) {
                onWithheldInCountry = postResult.onWithheldInCountry;
            }
            if ((i & 16) != 0) {
                onRemovedByUser = postResult.onRemovedByUser;
            }
            if ((i & 32) != 0) {
                onUnavailableForLegalReasons = postResult.onUnavailableForLegalReasons;
            }
            if ((i & 64) != 0) {
                onUnauthorized = postResult.onUnauthorized;
            }
            if ((i & 128) != 0) {
                onPostSuspended = postResult.onPostSuspended;
            }
            if ((i & 256) != 0) {
                onAccountSuspended = postResult.onAccountSuspended;
            }
            if ((i & 512) != 0) {
                onAccountDeleted = postResult.onAccountDeleted;
            }
            if ((i & 1024) != 0) {
                onBlocked = postResult.onBlocked;
            }
            if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
                onBlocking = postResult.onBlocking;
            }
            OnBlocked onBlocked2 = onBlocked;
            OnBlocking onBlocking2 = onBlocking;
            OnAccountSuspended onAccountSuspended2 = onAccountSuspended;
            OnAccountDeleted onAccountDeleted2 = onAccountDeleted;
            OnUnauthorized onUnauthorized2 = onUnauthorized;
            OnPostSuspended onPostSuspended2 = onPostSuspended;
            OnRemovedByUser onRemovedByUser2 = onRemovedByUser;
            OnUnavailableForLegalReasons onUnavailableForLegalReasons2 = onUnavailableForLegalReasons;
            return postResult.copy(str, onPost, onGraphqlEmptyId, onWithheldInCountry, onRemovedByUser2, onUnavailableForLegalReasons2, onUnauthorized2, onPostSuspended2, onAccountSuspended2, onAccountDeleted2, onBlocked2, onBlocking2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final OnAccountDeleted getOnAccountDeleted() {
            return this.onAccountDeleted;
        }

        /* JADX INFO: renamed from: component11, reason: from getter */
        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        /* JADX INFO: renamed from: component12, reason: from getter */
        public final OnBlocking getOnBlocking() {
            return this.onBlocking;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPost getOnPost() {
            return this.onPost;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final OnWithheldInCountry getOnWithheldInCountry() {
            return this.onWithheldInCountry;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final OnRemovedByUser getOnRemovedByUser() {
            return this.onRemovedByUser;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final OnUnavailableForLegalReasons getOnUnavailableForLegalReasons() {
            return this.onUnavailableForLegalReasons;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final OnPostSuspended getOnPostSuspended() {
            return this.onPostSuspended;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final PostResult copy(String __typename, OnPost onPost, OnGraphqlEmptyId onGraphqlEmptyId, OnWithheldInCountry onWithheldInCountry, OnRemovedByUser onRemovedByUser, OnUnavailableForLegalReasons onUnavailableForLegalReasons, OnUnauthorized onUnauthorized, OnPostSuspended onPostSuspended, OnAccountSuspended onAccountSuspended, OnAccountDeleted onAccountDeleted, OnBlocked onBlocked, OnBlocking onBlocking) {
            __typename.getClass();
            return new PostResult(__typename, onPost, onGraphqlEmptyId, onWithheldInCountry, onRemovedByUser, onUnavailableForLegalReasons, onUnauthorized, onPostSuspended, onAccountSuspended, onAccountDeleted, onBlocked, onBlocking);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostResult)) {
                return false;
            }
            PostResult postResult = (PostResult) other;
            return g76.L(this.__typename, postResult.__typename) && g76.L(this.onPost, postResult.onPost) && g76.L(this.onGraphqlEmptyId, postResult.onGraphqlEmptyId) && g76.L(this.onWithheldInCountry, postResult.onWithheldInCountry) && g76.L(this.onRemovedByUser, postResult.onRemovedByUser) && g76.L(this.onUnavailableForLegalReasons, postResult.onUnavailableForLegalReasons) && g76.L(this.onUnauthorized, postResult.onUnauthorized) && g76.L(this.onPostSuspended, postResult.onPostSuspended) && g76.L(this.onAccountSuspended, postResult.onAccountSuspended) && g76.L(this.onAccountDeleted, postResult.onAccountDeleted) && g76.L(this.onBlocked, postResult.onBlocked) && g76.L(this.onBlocking, postResult.onBlocking);
        }

        public final OnAccountDeleted getOnAccountDeleted() {
            return this.onAccountDeleted;
        }

        public final OnAccountSuspended getOnAccountSuspended() {
            return this.onAccountSuspended;
        }

        public final OnBlocked getOnBlocked() {
            return this.onBlocked;
        }

        public final OnBlocking getOnBlocking() {
            return this.onBlocking;
        }

        public final OnGraphqlEmptyId getOnGraphqlEmptyId() {
            return this.onGraphqlEmptyId;
        }

        public final OnPost getOnPost() {
            return this.onPost;
        }

        public final OnPostSuspended getOnPostSuspended() {
            return this.onPostSuspended;
        }

        public final OnRemovedByUser getOnRemovedByUser() {
            return this.onRemovedByUser;
        }

        public final OnUnauthorized getOnUnauthorized() {
            return this.onUnauthorized;
        }

        public final OnUnavailableForLegalReasons getOnUnavailableForLegalReasons() {
            return this.onUnavailableForLegalReasons;
        }

        public final OnWithheldInCountry getOnWithheldInCountry() {
            return this.onWithheldInCountry;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPost onPost = this.onPost;
            int iHashCode2 = (iHashCode + (onPost == null ? 0 : onPost.hashCode())) * 31;
            OnGraphqlEmptyId onGraphqlEmptyId = this.onGraphqlEmptyId;
            int iHashCode3 = (iHashCode2 + (onGraphqlEmptyId == null ? 0 : onGraphqlEmptyId.hashCode())) * 31;
            OnWithheldInCountry onWithheldInCountry = this.onWithheldInCountry;
            int iHashCode4 = (iHashCode3 + (onWithheldInCountry == null ? 0 : onWithheldInCountry.hashCode())) * 31;
            OnRemovedByUser onRemovedByUser = this.onRemovedByUser;
            int iHashCode5 = (iHashCode4 + (onRemovedByUser == null ? 0 : onRemovedByUser.hashCode())) * 31;
            OnUnavailableForLegalReasons onUnavailableForLegalReasons = this.onUnavailableForLegalReasons;
            int iHashCode6 = (iHashCode5 + (onUnavailableForLegalReasons == null ? 0 : onUnavailableForLegalReasons.hashCode())) * 31;
            OnUnauthorized onUnauthorized = this.onUnauthorized;
            int iHashCode7 = (iHashCode6 + (onUnauthorized == null ? 0 : onUnauthorized.hashCode())) * 31;
            OnPostSuspended onPostSuspended = this.onPostSuspended;
            int iHashCode8 = (iHashCode7 + (onPostSuspended == null ? 0 : onPostSuspended.hashCode())) * 31;
            OnAccountSuspended onAccountSuspended = this.onAccountSuspended;
            int iHashCode9 = (iHashCode8 + (onAccountSuspended == null ? 0 : onAccountSuspended.hashCode())) * 31;
            OnAccountDeleted onAccountDeleted = this.onAccountDeleted;
            int iHashCode10 = (iHashCode9 + (onAccountDeleted == null ? 0 : onAccountDeleted.hashCode())) * 31;
            OnBlocked onBlocked = this.onBlocked;
            int iHashCode11 = (iHashCode10 + (onBlocked == null ? 0 : onBlocked.hashCode())) * 31;
            OnBlocking onBlocking = this.onBlocking;
            return iHashCode11 + (onBlocking != null ? onBlocking.hashCode() : 0);
        }

        public final String toString() {
            return "PostResult(__typename=" + this.__typename + aJzfoQ.ZjZ + this.onPost + ", onGraphqlEmptyId=" + this.onGraphqlEmptyId + ", onWithheldInCountry=" + this.onWithheldInCountry + ", onRemovedByUser=" + this.onRemovedByUser + ", onUnavailableForLegalReasons=" + this.onUnavailableForLegalReasons + ", onUnauthorized=" + this.onUnauthorized + ", onPostSuspended=" + this.onPostSuspended + ", onAccountSuspended=" + this.onAccountSuspended + ", onAccountDeleted=" + this.onAccountDeleted + ", onBlocked=" + this.onBlocked + ", onBlocking=" + this.onBlocking + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0010\u0006\n\u0002\b%\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001Bs\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0005\u0012\u0006\u0010\t\u001a\u00020\u0005\u0012\u0006\u0010\n\u001a\u00020\u0005\u0012\u0006\u0010\u000b\u001a\u00020\u0005\u0012\u0006\u0010\f\u001a\u00020\u0005\u0012\u0006\u0010\r\u001a\u00020\u0005\u0012\u0006\u0010\u000e\u001a\u00020\u0005\u0012\u0006\u0010\u000f\u001a\u00020\u0005\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\u0012\u0010\u0013J\t\u0010'\u001a\u00020\u0003HÆ\u0003J\t\u0010(\u001a\u00020\u0005HÆ\u0003J\t\u0010)\u001a\u00020\u0005HÆ\u0003J\u0010\u0010*\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u001aJ\t\u0010+\u001a\u00020\u0005HÆ\u0003J\t\u0010,\u001a\u00020\u0005HÆ\u0003J\t\u0010-\u001a\u00020\u0005HÆ\u0003J\t\u0010.\u001a\u00020\u0005HÆ\u0003J\t\u0010/\u001a\u00020\u0005HÆ\u0003J\t\u00100\u001a\u00020\u0005HÆ\u0003J\t\u00101\u001a\u00020\u0005HÆ\u0003J\t\u00102\u001a\u00020\u0005HÆ\u0003J\u0010\u00103\u001a\u0004\u0018\u00010\u0011HÆ\u0003¢\u0006\u0002\u0010%J\u0094\u0001\u00104\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\u00052\b\b\u0002\u0010\n\u001a\u00020\u00052\b\b\u0002\u0010\u000b\u001a\u00020\u00052\b\b\u0002\u0010\f\u001a\u00020\u00052\b\b\u0002\u0010\r\u001a\u00020\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u00052\b\b\u0002\u0010\u000f\u001a\u00020\u00052\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0011HÆ\u0001¢\u0006\u0002\u00105J\u0013\u00106\u001a\u0002072\b\u00108\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u00109\u001a\u00020:HÖ\u0001J\t\u0010;\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0017R\u0015\u0010\u0007\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u0019\u0010\u001aR\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0017R\u0011\u0010\t\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0017R\u0011\u0010\n\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u0017R\u0011\u0010\u000b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010\u0017R\u0011\u0010\f\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b \u0010\u0017R\u0011\u0010\r\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\u0017R\u0011\u0010\u000e\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010\u0017R\u0011\u0010\u000f\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b#\u0010\u0017R\u0015\u0010\u0010\u001a\u0004\u0018\u00010\u0011¢\u0006\n\n\u0002\u0010&\u001a\u0004\b$\u0010%¨\u0006<"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "", "__typename", "", "viewViaAuthorFriendLinkCount", "", "viewViaPremiumFriendLinkCount", "presentationCount", "viewCount", "readCount", "followersGained", "followersLost", "subscribersGained", "subscribersLost", "netFollowerCount", "netSubscriberCount", "feedClickThroughRate", "", "<init>", "(Ljava/lang/String;JJLjava/lang/Long;JJJJJJJJLjava/lang/Double;)V", "get__typename", "()Ljava/lang/String;", "getViewViaAuthorFriendLinkCount", "()J", "getViewViaPremiumFriendLinkCount", "getPresentationCount", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getViewCount", "getReadCount", "getFollowersGained", "getFollowersLost", "getSubscribersGained", "getSubscribersLost", "getNetFollowerCount", "getNetSubscriberCount", "getFeedClickThroughRate", "()Ljava/lang/Double;", "Ljava/lang/Double;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "component13", "copy", "(Ljava/lang/String;JJLjava/lang/Long;JJJJJJJJLjava/lang/Double;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PostStatsTotalBundle;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostStatsTotalBundle {
        private final String __typename;
        private final Double feedClickThroughRate;
        private final long followersGained;
        private final long followersLost;
        private final long netFollowerCount;
        private final long netSubscriberCount;
        private final Long presentationCount;
        private final long readCount;
        private final long subscribersGained;
        private final long subscribersLost;
        private final long viewCount;
        private final long viewViaAuthorFriendLinkCount;
        private final long viewViaPremiumFriendLinkCount;

        public PostStatsTotalBundle(String str, long j, long j2, Long l, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10, Double d) {
            str.getClass();
            this.__typename = str;
            this.viewViaAuthorFriendLinkCount = j;
            this.viewViaPremiumFriendLinkCount = j2;
            this.presentationCount = l;
            this.viewCount = j3;
            this.readCount = j4;
            this.followersGained = j5;
            this.followersLost = j6;
            this.subscribersGained = j7;
            this.subscribersLost = j8;
            this.netFollowerCount = j9;
            this.netSubscriberCount = j10;
            this.feedClickThroughRate = d;
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component10, reason: from getter */
        public final long getSubscribersLost() {
            return this.subscribersLost;
        }

        /* JADX INFO: renamed from: component11, reason: from getter */
        public final long getNetFollowerCount() {
            return this.netFollowerCount;
        }

        /* JADX INFO: renamed from: component12, reason: from getter */
        public final long getNetSubscriberCount() {
            return this.netSubscriberCount;
        }

        /* JADX INFO: renamed from: component13, reason: from getter */
        public final Double getFeedClickThroughRate() {
            return this.feedClickThroughRate;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final long getViewViaAuthorFriendLinkCount() {
            return this.viewViaAuthorFriendLinkCount;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final long getViewViaPremiumFriendLinkCount() {
            return this.viewViaPremiumFriendLinkCount;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Long getPresentationCount() {
            return this.presentationCount;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final long getViewCount() {
            return this.viewCount;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final long getReadCount() {
            return this.readCount;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final long getFollowersGained() {
            return this.followersGained;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final long getFollowersLost() {
            return this.followersLost;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final long getSubscribersGained() {
            return this.subscribersGained;
        }

        public final PostStatsTotalBundle copy(String __typename, long viewViaAuthorFriendLinkCount, long viewViaPremiumFriendLinkCount, Long presentationCount, long viewCount, long readCount, long followersGained, long followersLost, long subscribersGained, long subscribersLost, long netFollowerCount, long netSubscriberCount, Double feedClickThroughRate) {
            __typename.getClass();
            return new PostStatsTotalBundle(__typename, viewViaAuthorFriendLinkCount, viewViaPremiumFriendLinkCount, presentationCount, viewCount, readCount, followersGained, followersLost, subscribersGained, subscribersLost, netFollowerCount, netSubscriberCount, feedClickThroughRate);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostStatsTotalBundle)) {
                return false;
            }
            PostStatsTotalBundle postStatsTotalBundle = (PostStatsTotalBundle) other;
            return g76.L(this.__typename, postStatsTotalBundle.__typename) && this.viewViaAuthorFriendLinkCount == postStatsTotalBundle.viewViaAuthorFriendLinkCount && this.viewViaPremiumFriendLinkCount == postStatsTotalBundle.viewViaPremiumFriendLinkCount && g76.L(this.presentationCount, postStatsTotalBundle.presentationCount) && this.viewCount == postStatsTotalBundle.viewCount && this.readCount == postStatsTotalBundle.readCount && this.followersGained == postStatsTotalBundle.followersGained && this.followersLost == postStatsTotalBundle.followersLost && this.subscribersGained == postStatsTotalBundle.subscribersGained && this.subscribersLost == postStatsTotalBundle.subscribersLost && this.netFollowerCount == postStatsTotalBundle.netFollowerCount && this.netSubscriberCount == postStatsTotalBundle.netSubscriberCount && g76.L(this.feedClickThroughRate, postStatsTotalBundle.feedClickThroughRate);
        }

        public final Double getFeedClickThroughRate() {
            return this.feedClickThroughRate;
        }

        public final long getFollowersGained() {
            return this.followersGained;
        }

        public final long getFollowersLost() {
            return this.followersLost;
        }

        public final long getNetFollowerCount() {
            return this.netFollowerCount;
        }

        public final long getNetSubscriberCount() {
            return this.netSubscriberCount;
        }

        public final Long getPresentationCount() {
            return this.presentationCount;
        }

        public final long getReadCount() {
            return this.readCount;
        }

        public final long getSubscribersGained() {
            return this.subscribersGained;
        }

        public final long getSubscribersLost() {
            return this.subscribersLost;
        }

        public final long getViewCount() {
            return this.viewCount;
        }

        public final long getViewViaAuthorFriendLinkCount() {
            return this.viewViaAuthorFriendLinkCount;
        }

        public final long getViewViaPremiumFriendLinkCount() {
            return this.viewViaPremiumFriendLinkCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            long j = this.viewViaAuthorFriendLinkCount;
            int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
            long j2 = this.viewViaPremiumFriendLinkCount;
            int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
            Long l = this.presentationCount;
            int iHashCode2 = l == null ? 0 : l.hashCode();
            long j3 = this.viewCount;
            int i3 = (((i2 + iHashCode2) * 31) + ((int) (j3 ^ (j3 >>> 32)))) * 31;
            long j4 = this.readCount;
            int i4 = (i3 + ((int) (j4 ^ (j4 >>> 32)))) * 31;
            long j5 = this.followersGained;
            int i5 = (i4 + ((int) (j5 ^ (j5 >>> 32)))) * 31;
            long j6 = this.followersLost;
            int i6 = (i5 + ((int) (j6 ^ (j6 >>> 32)))) * 31;
            long j7 = this.subscribersGained;
            int i7 = (i6 + ((int) (j7 ^ (j7 >>> 32)))) * 31;
            long j8 = this.subscribersLost;
            int i8 = (i7 + ((int) (j8 ^ (j8 >>> 32)))) * 31;
            long j9 = this.netFollowerCount;
            int i9 = (i8 + ((int) (j9 ^ (j9 >>> 32)))) * 31;
            long j10 = this.netSubscriberCount;
            int i10 = (i9 + ((int) (j10 ^ (j10 >>> 32)))) * 31;
            Double d = this.feedClickThroughRate;
            return i10 + (d != null ? d.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            long j = this.viewViaAuthorFriendLinkCount;
            long j2 = this.viewViaPremiumFriendLinkCount;
            Long l = this.presentationCount;
            long j3 = this.viewCount;
            long j4 = this.readCount;
            long j5 = this.followersGained;
            long j6 = this.followersLost;
            long j7 = this.subscribersGained;
            long j8 = this.subscribersLost;
            long j9 = this.netFollowerCount;
            long j10 = this.netSubscriberCount;
            Double d = this.feedClickThroughRate;
            StringBuilder sbI = ho2.I(j, "PostStatsTotalBundle(__typename=", str, ", viewViaAuthorFriendLinkCount=");
            wgd.y(sbI, ", viewViaPremiumFriendLinkCount=", j2, ", presentationCount=");
            sbI.append(l);
            sbI.append(", viewCount=");
            sbI.append(j3);
            wgd.y(sbI, ", readCount=", j4, ", followersGained=");
            sbI.append(j5);
            wgd.y(sbI, ", followersLost=", j6, pUlNWdybf.VsEZViupbZPSY);
            sbI.append(j7);
            wgd.y(sbI, ", subscribersLost=", j8, ", netFollowerCount=");
            sbI.append(j9);
            wgd.y(sbI, ", netSubscriberCount=", j10, ", feedClickThroughRate=");
            sbI.append(d);
            sbI.append(")");
            return sbI.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Publication;", "", "__typename", "", "name", "slug", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getName", "getSlug", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final String id;
        private final String name;
        private final String slug;

        public Publication(String str, String str2, String str3, String str4) {
            ho2.Q(str, str2, str3, str4);
            this.__typename = str;
            this.name = str2;
            this.slug = str3;
            this.id = str4;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, String str2, String str3, String str4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publication.name;
            }
            if ((i & 4) != 0) {
                str3 = publication.slug;
            }
            if ((i & 8) != 0) {
                str4 = publication.id;
            }
            return publication.copy(str, str2, str3, str4);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getSlug() {
            return this.slug;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, String name, String slug, String id) {
            __typename.getClass();
            name.getClass();
            slug.getClass();
            id.getClass();
            return new Publication(__typename, name, slug, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.name, publication.name) && g76.L(this.slug, publication.slug) && g76.L(this.id, publication.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String getSlug() {
            return this.slug;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.name), 31, this.slug);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.name;
            return km4.C(y30.u("Publication(__typename=", str, ", name=", str2, ", slug="), this.slug, ", id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$PublicationFeaturingEventsConnection;", "", "__typename", "", "onPublicationFeaturingEventsConnection", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;)V", "get__typename", "()Ljava/lang/String;", "getOnPublicationFeaturingEventsConnection", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$OnPublicationFeaturingEventsConnection;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PublicationFeaturingEventsConnection {
        private final String __typename;
        private final OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnection;

        public PublicationFeaturingEventsConnection(String str, OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnection) {
            str.getClass();
            this.__typename = str;
            this.onPublicationFeaturingEventsConnection = onPublicationFeaturingEventsConnection;
        }

        public static /* synthetic */ PublicationFeaturingEventsConnection copy$default(PublicationFeaturingEventsConnection publicationFeaturingEventsConnection, String str, OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publicationFeaturingEventsConnection.__typename;
            }
            if ((i & 2) != 0) {
                onPublicationFeaturingEventsConnection = publicationFeaturingEventsConnection.onPublicationFeaturingEventsConnection;
            }
            return publicationFeaturingEventsConnection.copy(str, onPublicationFeaturingEventsConnection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPublicationFeaturingEventsConnection getOnPublicationFeaturingEventsConnection() {
            return this.onPublicationFeaturingEventsConnection;
        }

        public final PublicationFeaturingEventsConnection copy(String __typename, OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnection) {
            __typename.getClass();
            return new PublicationFeaturingEventsConnection(__typename, onPublicationFeaturingEventsConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PublicationFeaturingEventsConnection)) {
                return false;
            }
            PublicationFeaturingEventsConnection publicationFeaturingEventsConnection = (PublicationFeaturingEventsConnection) other;
            return g76.L(this.__typename, publicationFeaturingEventsConnection.__typename) && g76.L(this.onPublicationFeaturingEventsConnection, publicationFeaturingEventsConnection.onPublicationFeaturingEventsConnection);
        }

        public final OnPublicationFeaturingEventsConnection getOnPublicationFeaturingEventsConnection() {
            return this.onPublicationFeaturingEventsConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPublicationFeaturingEventsConnection onPublicationFeaturingEventsConnection = this.onPublicationFeaturingEventsConnection;
            return iHashCode + (onPublicationFeaturingEventsConnection == null ? 0 : onPublicationFeaturingEventsConnection.hashCode());
        }

        public final String toString() {
            return "PublicationFeaturingEventsConnection(__typename=" + this.__typename + ", onPublicationFeaturingEventsConnection=" + this.onPublicationFeaturingEventsConnection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0007HÆ\u0003J'\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$ReadersTopicsV2;", "", "__typename", "", "tag", "Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;", "percentage", "", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;D)V", "get__typename", "()Ljava/lang/String;", "getTag", "()Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;", "getPercentage", "()D", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ReadersTopicsV2 {
        private final String __typename;
        private final double percentage;
        private final Tag tag;

        public ReadersTopicsV2(String str, Tag tag, double d) {
            str.getClass();
            tag.getClass();
            this.__typename = str;
            this.tag = tag;
            this.percentage = d;
        }

        public static /* synthetic */ ReadersTopicsV2 copy$default(ReadersTopicsV2 readersTopicsV2, String str, Tag tag, double d, int i, Object obj) {
            if ((i & 1) != 0) {
                str = readersTopicsV2.__typename;
            }
            if ((i & 2) != 0) {
                tag = readersTopicsV2.tag;
            }
            if ((i & 4) != 0) {
                d = readersTopicsV2.percentage;
            }
            return readersTopicsV2.copy(str, tag, d);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Tag getTag() {
            return this.tag;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final double getPercentage() {
            return this.percentage;
        }

        public final ReadersTopicsV2 copy(String __typename, Tag tag, double percentage) {
            __typename.getClass();
            tag.getClass();
            return new ReadersTopicsV2(__typename, tag, percentage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ReadersTopicsV2)) {
                return false;
            }
            ReadersTopicsV2 readersTopicsV2 = (ReadersTopicsV2) other;
            return g76.L(this.__typename, readersTopicsV2.__typename) && g76.L(this.tag, readersTopicsV2.tag) && Double.compare(this.percentage, readersTopicsV2.percentage) == 0;
        }

        public final double getPercentage() {
            return this.percentage;
        }

        public final Tag getTag() {
            return this.tag;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = (this.tag.hashCode() + (this.__typename.hashCode() * 31)) * 31;
            long jDoubleToLongBits = Double.doubleToLongBits(this.percentage);
            return iHashCode + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
        }

        public final String toString() {
            return "ReadersTopicsV2(__typename=" + this.__typename + ", tag=" + this.tag + ", percentage=" + this.percentage + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0010J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J<\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u0018J\u0013\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001c\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0011\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\f¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Referrer;", "", "__typename", "", "type", "Lcom/medium/android/graphql/type/ReferrerType;", "totalCount", "", "sourceIdentifier", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/ReferrerType;Ljava/lang/Integer;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getType", "()Lcom/medium/android/graphql/type/ReferrerType;", "getTotalCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getSourceIdentifier", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/type/ReferrerType;Ljava/lang/Integer;Ljava/lang/String;)Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Referrer;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Referrer {
        private final String __typename;
        private final String sourceIdentifier;
        private final Integer totalCount;
        private final ReferrerType type;

        public Referrer(String str, ReferrerType referrerType, Integer num, String str2) {
            str.getClass();
            this.__typename = str;
            this.type = referrerType;
            this.totalCount = num;
            this.sourceIdentifier = str2;
        }

        public static /* synthetic */ Referrer copy$default(Referrer referrer, String str, ReferrerType referrerType, Integer num, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = referrer.__typename;
            }
            if ((i & 2) != 0) {
                referrerType = referrer.type;
            }
            if ((i & 4) != 0) {
                num = referrer.totalCount;
            }
            if ((i & 8) != 0) {
                str2 = referrer.sourceIdentifier;
            }
            return referrer.copy(str, referrerType, num, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ReferrerType getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getTotalCount() {
            return this.totalCount;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getSourceIdentifier() {
            return this.sourceIdentifier;
        }

        public final Referrer copy(String __typename, ReferrerType type, Integer totalCount, String sourceIdentifier) {
            __typename.getClass();
            return new Referrer(__typename, type, totalCount, sourceIdentifier);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Referrer)) {
                return false;
            }
            Referrer referrer = (Referrer) other;
            return g76.L(this.__typename, referrer.__typename) && this.type == referrer.type && g76.L(this.totalCount, referrer.totalCount) && g76.L(this.sourceIdentifier, referrer.sourceIdentifier);
        }

        public final String getSourceIdentifier() {
            return this.sourceIdentifier;
        }

        public final Integer getTotalCount() {
            return this.totalCount;
        }

        public final ReferrerType getType() {
            return this.type;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            ReferrerType referrerType = this.type;
            int iHashCode2 = (iHashCode + (referrerType == null ? 0 : referrerType.hashCode())) * 31;
            Integer num = this.totalCount;
            int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
            String str = this.sourceIdentifier;
            return iHashCode3 + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            return "Referrer(__typename=" + this.__typename + ", type=" + this.type + ", totalCount=" + this.totalCount + ", sourceIdentifier=" + this.sourceIdentifier + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J3\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Tag;", "", "__typename", "", "id", "displayTitle", "normalizedTagSlug", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getDisplayTitle", "getNormalizedTagSlug", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Tag {
        private final String __typename;
        private final String displayTitle;
        private final String id;
        private final String normalizedTagSlug;

        public Tag(String str, String str2, String str3, String str4) {
            b09.I(str, str2, str4);
            this.__typename = str;
            this.id = str2;
            this.displayTitle = str3;
            this.normalizedTagSlug = str4;
        }

        public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, String str3, String str4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tag.id;
            }
            if ((i & 4) != 0) {
                str3 = tag.displayTitle;
            }
            if ((i & 8) != 0) {
                str4 = tag.normalizedTagSlug;
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
        public final String getDisplayTitle() {
            return this.displayTitle;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getNormalizedTagSlug() {
            return this.normalizedTagSlug;
        }

        public final Tag copy(String __typename, String id, String displayTitle, String normalizedTagSlug) {
            __typename.getClass();
            id.getClass();
            normalizedTagSlug.getClass();
            return new Tag(__typename, id, displayTitle, normalizedTagSlug);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) other;
            return g76.L(this.__typename, tag.__typename) && g76.L(this.id, tag.id) && g76.L(this.displayTitle, tag.displayTitle) && g76.L(this.normalizedTagSlug, tag.normalizedTagSlug);
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
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.displayTitle;
            return this.normalizedTagSlug.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return km4.C(y30.u("Tag(__typename=", str, ", id=", str2, ", displayTitle="), this.displayTitle, ", normalizedTagSlug=", this.normalizedTagSlug, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0007HÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Total;", "", "__typename", "", "currency", "Ljava/util/Currency;", "nanos", "", "units", "<init>", "(Ljava/lang/String;Ljava/util/Currency;II)V", "get__typename", "()Ljava/lang/String;", "getCurrency", "()Ljava/util/Currency;", "getNanos", "()I", "getUnits", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Total {
        private final String __typename;
        private final Currency currency;
        private final int nanos;
        private final int units;

        public Total(String str, Currency currency, int i, int i2) {
            str.getClass();
            currency.getClass();
            this.__typename = str;
            this.currency = currency;
            this.nanos = i;
            this.units = i2;
        }

        public static /* synthetic */ Total copy$default(Total total, String str, Currency currency, int i, int i2, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                str = total.__typename;
            }
            if ((i3 & 2) != 0) {
                currency = total.currency;
            }
            if ((i3 & 4) != 0) {
                i = total.nanos;
            }
            if ((i3 & 8) != 0) {
                i2 = total.units;
            }
            return total.copy(str, currency, i, i2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Currency getCurrency() {
            return this.currency;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final int getNanos() {
            return this.nanos;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final int getUnits() {
            return this.units;
        }

        public final Total copy(String __typename, Currency currency, int nanos, int units) {
            __typename.getClass();
            currency.getClass();
            return new Total(__typename, currency, nanos, units);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Total)) {
                return false;
            }
            Total total = (Total) other;
            return g76.L(this.__typename, total.__typename) && g76.L(this.currency, total.currency) && this.nanos == total.nanos && this.units == total.units;
        }

        public final Currency getCurrency() {
            return this.currency;
        }

        public final int getNanos() {
            return this.nanos;
        }

        public final int getUnits() {
            return this.units;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return ((((this.currency.hashCode() + (this.__typename.hashCode() * 31)) * 31) + this.nanos) * 31) + this.units;
        }

        public final String toString() {
            return "Total(__typename=" + this.__typename + ", currency=" + this.currency + ", nanos=" + this.nanos + ", units=" + this.units + ")";
        }
    }

    public GetPostStatsDetailsQuery(String str) {
        str.getClass();
        this.postId = str;
    }

    public static /* synthetic */ GetPostStatsDetailsQuery copy$default(GetPostStatsDetailsQuery getPostStatsDetailsQuery, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            str = getPostStatsDetailsQuery.postId;
        }
        return getPostStatsDetailsQuery.copy(str);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(GetPostStatsDetailsQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final GetPostStatsDetailsQuery copy(String postId) {
        postId.getClass();
        return new GetPostStatsDetailsQuery(postId);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query GetPostStatsDetailsQuery($postId: ID!) { postResult(id: $postId) { __typename ... on Post { ...PostPreviewData firstBoostedAt publicationFeaturingEventsConnection(first: 5, after: \"\") { __typename ... on PublicationFeaturingEventsConnection { edges { __typename node { __typename publication { __typename name slug id } eventType occurredAt } } } } isLocked readersTopicsV2 { __typename tag { __typename id displayTitle normalizedTagSlug } percentage } referrers { __typename type totalCount sourceIdentifier } earnings { __typename total { __typename currency: currencyCode nanos units } } id } ... on GraphqlEmptyId { message } ... on WithheldInCountry { message } ... on RemovedByUser { message } ... on UnavailableForLegalReasons { message } ... on Unauthorized { message } ... on PostSuspended { message } ... on AccountSuspended { message } ... on AccountDeleted { message } ... on Blocked { message } ... on Blocking { message } } postStatsTotalBundle(postStatsTotalBundleInput: { postId: $postId } ) { __typename viewViaAuthorFriendLinkCount viewViaPremiumFriendLinkCount presentationCount viewCount readCount followersGained followersLost subscribersGained subscribersLost netFollowerCount netSubscriberCount feedClickThroughRate } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof GetPostStatsDetailsQuery) && g76.L(this.postId, ((GetPostStatsDetailsQuery) other).postId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode();
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
        List<sx1> list = GetPostStatsDetailsQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        GetPostStatsDetailsQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return ev6.x("GetPostStatsDetailsQuery(postId=", this.postId, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/GetPostStatsDetailsQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query GetPostStatsDetailsQuery($postId: ID!) { postResult(id: $postId) { __typename ... on Post { ...PostPreviewData firstBoostedAt publicationFeaturingEventsConnection(first: 5, after: \"\") { __typename ... on PublicationFeaturingEventsConnection { edges { __typename node { __typename publication { __typename name slug id } eventType occurredAt } } } } isLocked readersTopicsV2 { __typename tag { __typename id displayTitle normalizedTagSlug } percentage } referrers { __typename type totalCount sourceIdentifier } earnings { __typename total { __typename currency: currencyCode nanos units } } id } ... on GraphqlEmptyId { message } ... on WithheldInCountry { message } ... on RemovedByUser { message } ... on UnavailableForLegalReasons { message } ... on Unauthorized { message } ... on PostSuspended { message } ... on AccountSuspended { message } ... on AccountDeleted { message } ... on Blocked { message } ... on Blocking { message } } postStatsTotalBundle(postStatsTotalBundleInput: { postId: $postId } ) { __typename viewViaAuthorFriendLinkCount viewViaPremiumFriendLinkCount presentationCount viewCount readCount followersGained followersLost subscribersGained subscribersLost netFollowerCount netSubscriberCount feedClickThroughRate } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }  fragment CollectionFollowData on Collection { __typename id name subscriberCount viewerEdge { __typename id isFollowing } }  fragment CollectionMuteData on Collection { __typename viewerEdge { __typename isEditor isMuting id } id }  fragment UserFollowData on User { __typename id name socialStats { __typename followingCount followerCount } viewerEdge { __typename id isFollowing } }  fragment UserMuteData on User { __typename id name viewerEdge { __typename id isMuting } }  fragment NewsletterSubscriptionData on NewsletterV3 { __typename id viewerEdge { __typename id isSubscribed } }  fragment NewsletterData on NewsletterV3 { __typename id name description ...NewsletterSubscriptionData }  fragment UserNewsletterData on User { __typename id newsletterV3 { __typename ...NewsletterData id } }  fragment PostClapsData on Post { __typename id totalClapCount: clapCount viewerEdge { __typename id clapCount } }  fragment ResponseCountData on Post { __typename id postResponses { __typename count } }  fragment PostVisibilityData on Post { __typename id collection { __typename id viewerEdge { __typename id isEditor canEditPosts canEditOwnPosts } } creator { __typename id } isLocked visibility isLimitedState }  fragment PostShareData on Post { __typename id title mediumUrl previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime visibility creator { __typename name username imageId hasSubdomain id } viewerEdge { __typename shareKey id } }  fragment PostFeaturingStatusData on Post { __typename id firstPublishedAt collection { __typename id name viewerEdge { __typename isEditor id } } isFeaturedInPublishedPublication }  fragment PostViewStateData on Post { __typename viewerEdge { __typename viewState { __typename viewedAt } id } id }  fragment PostRepostCountData on Post { __typename id repostCount }  fragment PostPreviewData on Post { __typename id title previewContent { __typename subtitle } previewImage { __typename ...ImageMetadataData id } readingTime pinnedByCreatorAt firstPublishedAt updatedAt latestPublishedVersion collection { __typename id name avatar { __typename id } viewerEdge { __typename isEditor id } ...CollectionFollowData ...CollectionMuteData } creator { __typename id name imageId viewerEdge { __typename isUser id } verifications { __typename isBookAuthor } ...UserFollowData ...UserMuteData ...UserNewsletterData } ...PostClapsData ...ResponseCountData ...PostVisibilityData ...PostShareData ...PostFeaturingStatusData ...PostViewStateData ...PostRepostCountData }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
