package com.medium.android.graphql;

import com.medium.android.graphql.adapter.OnboardingStarterPackQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.OnboardingStarterPackQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.selections.OnboardingStarterPackQuerySelections;
import com.medium.android.graphql.type.OnboardingStarterPackInput;
import com.medium.android.graphql.type.Query;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ev6;
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
import defpackage.y30;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0002\b$\b\u0086\b\u0018\u0000 -2\b\u0012\u0004\u0012\u00020\u00020\u0001:\u001c./0123456789:;<=>?@ABCDEFGH-B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\n\u001a\u00020\tH\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\tH\u0016¢\u0006\u0004\b\f\u0010\u000bJ\u000f\u0010\r\u001a\u00020\tH\u0016¢\u0006\u0004\b\r\u0010\u000bJ'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J$\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b#\u0010\u000bJ\u0010\u0010$\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b$\u0010 J\u001a\u0010'\u001a\u00020\u00122\b\u0010&\u001a\u0004\u0018\u00010%HÖ\u0003¢\u0006\u0004\b'\u0010(R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010)\u001a\u0004\b*\u0010\u001eR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010+\u001a\u0004\b,\u0010 ¨\u0006I"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery;", "Luqa;", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Data;", "Lcom/medium/android/graphql/type/OnboardingStarterPackInput;", "input", "", "popularPostsLimit", "<init>", "(Lcom/medium/android/graphql/type/OnboardingStarterPackInput;I)V", "", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/OnboardingStarterPackInput;", "component2", "()I", "copy", "(Lcom/medium/android/graphql/type/OnboardingStarterPackInput;I)Lcom/medium/android/graphql/OnboardingStarterPackQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/OnboardingStarterPackInput;", "getInput", "I", "getPopularPostsLimit", "Companion", "Data", "OnboardingStarterPack", "OnStarterPack", "WriterConnection", "RecommendedPublisher", "OnUser", "Verifications", "SocialStats", "PopularPosts", "OnPopularPosts", "Post", "PreviewImage", "OnPublication", "Avatar", "FollowGraph", "Writers", "Edge", "Node", "User", "Editors", "Edge1", "Node1", "User1", "PopularPosts1", "OnPopularPosts1", "Post1", "PreviewImage1", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class OnboardingStarterPackQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "6c15f65ab99c1e8c9c56db540a1cde34fff8f702e0400168a83c4ac2a4aaee91";
    public static final String OPERATION_NAME = "OnboardingStarterPackQuery";
    private final OnboardingStarterPackInput input;
    private final int popularPostsLimit;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Avatar;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001a\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnboardingStarterPack;", "onboardingStarterPack", "<init>", "(Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnboardingStarterPack;)V", "component1", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnboardingStarterPack;", "copy", "(Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnboardingStarterPack;)Lcom/medium/android/graphql/OnboardingStarterPackQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnboardingStarterPack;", "getOnboardingStarterPack", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final OnboardingStarterPack onboardingStarterPack;

        public Data(OnboardingStarterPack onboardingStarterPack) {
            onboardingStarterPack.getClass();
            this.onboardingStarterPack = onboardingStarterPack;
        }

        public static /* synthetic */ Data copy$default(Data data, OnboardingStarterPack onboardingStarterPack, int i, Object obj) {
            if ((i & 1) != 0) {
                onboardingStarterPack = data.onboardingStarterPack;
            }
            return data.copy(onboardingStarterPack);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final OnboardingStarterPack getOnboardingStarterPack() {
            return this.onboardingStarterPack;
        }

        public final Data copy(OnboardingStarterPack onboardingStarterPack) {
            onboardingStarterPack.getClass();
            return new Data(onboardingStarterPack);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.onboardingStarterPack, ((Data) other).onboardingStarterPack);
        }

        public final OnboardingStarterPack getOnboardingStarterPack() {
            return this.onboardingStarterPack;
        }

        public final int hashCode() {
            return this.onboardingStarterPack.hashCode();
        }

        public final String toString() {
            return "Data(onboardingStarterPack=" + this.onboardingStarterPack + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Edge;", "", "__typename", "", "node", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Edge1;", "", "__typename", "", "node", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node1;)V", "get__typename", "()Ljava/lang/String;", "getNode", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Editors;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Edge1;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Editors {
        private final String __typename;
        private final List<Edge1> edges;

        public Editors(String str, List<Edge1> list) {
            str.getClass();
            this.__typename = str;
            this.edges = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Editors copy$default(Editors editors, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = editors.__typename;
            }
            if ((i & 2) != 0) {
                list = editors.edges;
            }
            return editors.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Edge1> component2() {
            return this.edges;
        }

        public final Editors copy(String __typename, List<Edge1> edges) {
            __typename.getClass();
            return new Editors(__typename, edges);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Editors)) {
                return false;
            }
            Editors editors = (Editors) other;
            return g76.L(this.__typename, editors.__typename) && g76.L(this.edges, editors.edges);
        }

        public final List<Edge1> getEdges() {
            return this.edges;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<Edge1> list = this.edges;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            return ka1.s("Editors(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$FollowGraph;", "", "__typename", "", "followerCount", "", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;)V", "get__typename", "()Ljava/lang/String;", "getFollowerCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Integer;)Lcom/medium/android/graphql/OnboardingStarterPackQuery$FollowGraph;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node;", "", "__typename", "", "user", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$User;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$User;)V", "get__typename", "()Ljava/lang/String;", "getUser", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$User;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
            return "Node(__typename=" + this.__typename + ", user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Node1;", "", "__typename", "", "user", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$User1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$User1;)V", "get__typename", "()Ljava/lang/String;", "getUser", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$User1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node1 {
        private final String __typename;
        private final User1 user;

        public Node1(String str, User1 user1) {
            str.getClass();
            user1.getClass();
            this.__typename = str;
            this.user = user1;
        }

        public static /* synthetic */ Node1 copy$default(Node1 node1, String str, User1 user1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node1.__typename;
            }
            if ((i & 2) != 0) {
                user1 = node1.user;
            }
            return node1.copy(str, user1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final User1 getUser() {
            return this.user;
        }

        public final Node1 copy(String __typename, User1 user) {
            __typename.getClass();
            user.getClass();
            return new Node1(__typename, user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node1)) {
                return false;
            }
            Node1 node1 = (Node1) other;
            return g76.L(this.__typename, node1.__typename) && g76.L(this.user, node1.user);
        }

        public final User1 getUser() {
            return this.user;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.user.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Node1(__typename=" + this.__typename + ", user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts;", "", "posts", "", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Post;", "<init>", "(Ljava/util/List;)V", "getPosts", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPopularPosts {
        private final List<Post> posts;

        public OnPopularPosts(List<Post> list) {
            list.getClass();
            this.posts = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnPopularPosts copy$default(OnPopularPosts onPopularPosts, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onPopularPosts.posts;
            }
            return onPopularPosts.copy(list);
        }

        public final List<Post> component1() {
            return this.posts;
        }

        public final OnPopularPosts copy(List<Post> posts) {
            posts.getClass();
            return new OnPopularPosts(posts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPopularPosts) && g76.L(this.posts, ((OnPopularPosts) other).posts);
        }

        public final List<Post> getPosts() {
            return this.posts;
        }

        public final int hashCode() {
            return this.posts.hashCode();
        }

        public final String toString() {
            return ka1.t("OnPopularPosts(posts=", ")", this.posts);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\u0019\u0010\n\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0001J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts1;", "", "posts", "", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Post1;", "<init>", "(Ljava/util/List;)V", "getPosts", "()Ljava/util/List;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPopularPosts1 {
        private final List<Post1> posts;

        public OnPopularPosts1(List<Post1> list) {
            list.getClass();
            this.posts = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnPopularPosts1 copy$default(OnPopularPosts1 onPopularPosts1, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onPopularPosts1.posts;
            }
            return onPopularPosts1.copy(list);
        }

        public final List<Post1> component1() {
            return this.posts;
        }

        public final OnPopularPosts1 copy(List<Post1> posts) {
            posts.getClass();
            return new OnPopularPosts1(posts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof OnPopularPosts1) && g76.L(this.posts, ((OnPopularPosts1) other).posts);
        }

        public final List<Post1> getPosts() {
            return this.posts;
        }

        public final int hashCode() {
            return this.posts.hashCode();
        }

        public final String toString() {
            return ka1.t("OnPopularPosts1(posts=", ")", this.posts);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001a\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BK\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\r\u0012\u0006\u0010\u000e\u001a\u00020\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\t\u0010!\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010$\u001a\u00020\tHÆ\u0003J\t\u0010%\u001a\u00020\u000bHÆ\u0003J\t\u0010&\u001a\u00020\rHÆ\u0003J\t\u0010'\u001a\u00020\u000fHÆ\u0003J]\u0010(\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000fHÆ\u0001J\u0013\u0010)\u001a\u00020*2\b\u0010+\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010,\u001a\u00020-HÖ\u0001J\t\u0010.\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0013R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0013R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001f¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPublication;", "", "id", "", "name", "description", "avatar", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Avatar;", "followGraph", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$FollowGraph;", "writers", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Writers;", "editors", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Editors;", "popularPosts", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts1;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$Avatar;Lcom/medium/android/graphql/OnboardingStarterPackQuery$FollowGraph;Lcom/medium/android/graphql/OnboardingStarterPackQuery$Writers;Lcom/medium/android/graphql/OnboardingStarterPackQuery$Editors;Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts1;)V", "getId", "()Ljava/lang/String;", "getName", "getDescription", "getAvatar", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$Avatar;", "getFollowGraph", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$FollowGraph;", "getWriters", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$Writers;", "getEditors", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$Editors;", "getPopularPosts", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts1;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublication {
        private final Avatar avatar;
        private final String description;
        private final Editors editors;
        private final FollowGraph followGraph;
        private final String id;
        private final String name;
        private final PopularPosts1 popularPosts;
        private final Writers writers;

        public OnPublication(String str, String str2, String str3, Avatar avatar, FollowGraph followGraph, Writers writers, Editors editors, PopularPosts1 popularPosts1) {
            str.getClass();
            str2.getClass();
            followGraph.getClass();
            writers.getClass();
            editors.getClass();
            popularPosts1.getClass();
            this.id = str;
            this.name = str2;
            this.description = str3;
            this.avatar = avatar;
            this.followGraph = followGraph;
            this.writers = writers;
            this.editors = editors;
            this.popularPosts = popularPosts1;
        }

        public static /* synthetic */ OnPublication copy$default(OnPublication onPublication, String str, String str2, String str3, Avatar avatar, FollowGraph followGraph, Writers writers, Editors editors, PopularPosts1 popularPosts1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPublication.id;
            }
            if ((i & 2) != 0) {
                str2 = onPublication.name;
            }
            if ((i & 4) != 0) {
                str3 = onPublication.description;
            }
            if ((i & 8) != 0) {
                avatar = onPublication.avatar;
            }
            if ((i & 16) != 0) {
                followGraph = onPublication.followGraph;
            }
            if ((i & 32) != 0) {
                writers = onPublication.writers;
            }
            if ((i & 64) != 0) {
                editors = onPublication.editors;
            }
            if ((i & 128) != 0) {
                popularPosts1 = onPublication.popularPosts;
            }
            Editors editors2 = editors;
            PopularPosts1 popularPosts12 = popularPosts1;
            FollowGraph followGraph2 = followGraph;
            Writers writers2 = writers;
            return onPublication.copy(str, str2, str3, avatar, followGraph2, writers2, editors2, popularPosts12);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getDescription() {
            return this.description;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Avatar getAvatar() {
            return this.avatar;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final FollowGraph getFollowGraph() {
            return this.followGraph;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final Writers getWriters() {
            return this.writers;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final Editors getEditors() {
            return this.editors;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final PopularPosts1 getPopularPosts() {
            return this.popularPosts;
        }

        public final OnPublication copy(String id, String name, String description, Avatar avatar, FollowGraph followGraph, Writers writers, Editors editors, PopularPosts1 popularPosts) {
            id.getClass();
            name.getClass();
            followGraph.getClass();
            writers.getClass();
            editors.getClass();
            popularPosts.getClass();
            return new OnPublication(id, name, description, avatar, followGraph, writers, editors, popularPosts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPublication)) {
                return false;
            }
            OnPublication onPublication = (OnPublication) other;
            return g76.L(this.id, onPublication.id) && g76.L(this.name, onPublication.name) && g76.L(this.description, onPublication.description) && g76.L(this.avatar, onPublication.avatar) && g76.L(this.followGraph, onPublication.followGraph) && g76.L(this.writers, onPublication.writers) && g76.L(this.editors, onPublication.editors) && g76.L(this.popularPosts, onPublication.popularPosts);
        }

        public final Avatar getAvatar() {
            return this.avatar;
        }

        public final String getDescription() {
            return this.description;
        }

        public final Editors getEditors() {
            return this.editors;
        }

        public final FollowGraph getFollowGraph() {
            return this.followGraph;
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final PopularPosts1 getPopularPosts() {
            return this.popularPosts;
        }

        public final Writers getWriters() {
            return this.writers;
        }

        public final int hashCode() {
            int iO = wgd.o(this.id.hashCode() * 31, 31, this.name);
            String str = this.description;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            Avatar avatar = this.avatar;
            return this.popularPosts.hashCode() + ((this.editors.hashCode() + ((this.writers.hashCode() + ((this.followGraph.hashCode() + ((iHashCode + (avatar != null ? avatar.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.name;
            String str3 = this.description;
            Avatar avatar = this.avatar;
            FollowGraph followGraph = this.followGraph;
            Writers writers = this.writers;
            Editors editors = this.editors;
            PopularPosts1 popularPosts1 = this.popularPosts;
            StringBuilder sbU = y30.u("OnPublication(id=", str, ", name=", str2, ", description=");
            sbU.append(str3);
            sbU.append(", avatar=");
            sbU.append(avatar);
            sbU.append(", followGraph=");
            sbU.append(followGraph);
            sbU.append(", writers=");
            sbU.append(writers);
            sbU.append(", editors=");
            sbU.append(editors);
            sbU.append(", popularPosts=");
            sbU.append(popularPosts1);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0006¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006HÆ\u0003J\u000f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\t0\u0006HÆ\u0003J=\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u00062\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0006HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\b\u001a\b\u0012\u0004\u0012\u00020\t0\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnStarterPack;", "", "id", "", "categoryName", "writerConnections", "", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$WriterConnection;", "recommendedPublishers", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$RecommendedPublisher;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V", "getId", "()Ljava/lang/String;", "getCategoryName", "getWriterConnections", "()Ljava/util/List;", "getRecommendedPublishers", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnStarterPack {
        private final String categoryName;
        private final String id;
        private final List<RecommendedPublisher> recommendedPublishers;
        private final List<WriterConnection> writerConnections;

        public OnStarterPack(String str, String str2, List<WriterConnection> list, List<RecommendedPublisher> list2) {
            str.getClass();
            str2.getClass();
            list.getClass();
            list2.getClass();
            this.id = str;
            this.categoryName = str2;
            this.writerConnections = list;
            this.recommendedPublishers = list2;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnStarterPack copy$default(OnStarterPack onStarterPack, String str, String str2, List list, List list2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onStarterPack.id;
            }
            if ((i & 2) != 0) {
                str2 = onStarterPack.categoryName;
            }
            if ((i & 4) != 0) {
                list = onStarterPack.writerConnections;
            }
            if ((i & 8) != 0) {
                list2 = onStarterPack.recommendedPublishers;
            }
            return onStarterPack.copy(str, str2, list, list2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getCategoryName() {
            return this.categoryName;
        }

        public final List<WriterConnection> component3() {
            return this.writerConnections;
        }

        public final List<RecommendedPublisher> component4() {
            return this.recommendedPublishers;
        }

        public final OnStarterPack copy(String id, String categoryName, List<WriterConnection> writerConnections, List<RecommendedPublisher> recommendedPublishers) {
            id.getClass();
            categoryName.getClass();
            writerConnections.getClass();
            recommendedPublishers.getClass();
            return new OnStarterPack(id, categoryName, writerConnections, recommendedPublishers);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnStarterPack)) {
                return false;
            }
            OnStarterPack onStarterPack = (OnStarterPack) other;
            return g76.L(this.id, onStarterPack.id) && g76.L(this.categoryName, onStarterPack.categoryName) && g76.L(this.writerConnections, onStarterPack.writerConnections) && g76.L(this.recommendedPublishers, onStarterPack.recommendedPublishers);
        }

        public final String getCategoryName() {
            return this.categoryName;
        }

        public final String getId() {
            return this.id;
        }

        public final List<RecommendedPublisher> getRecommendedPublishers() {
            return this.recommendedPublishers;
        }

        public final List<WriterConnection> getWriterConnections() {
            return this.writerConnections;
        }

        public final int hashCode() {
            return this.recommendedPublishers.hashCode() + wgd.p(wgd.o(this.id.hashCode() * 31, 31, this.categoryName), 31, this.writerConnections);
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.categoryName;
            List<WriterConnection> list = this.writerConnections;
            List<RecommendedPublisher> list2 = this.recommendedPublishers;
            StringBuilder sbU = y30.u("OnStarterPack(id=", str, ", categoryName=", str2, ", writerConnections=");
            sbU.append(list);
            sbU.append(", recommendedPublishers=");
            sbU.append(list2);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BI\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\bHÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\nHÆ\u0003J\t\u0010 \u001a\u00020\fHÆ\u0003JY\u0010!\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\u000b\u001a\u00020\fHÆ\u0001J\u0013\u0010\"\u001a\u00020#2\b\u0010$\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010%\u001a\u00020&HÖ\u0001J\t\u0010'\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0010R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0010R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019¨\u0006("}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnUser;", "", "id", "", "userName", "imageId", "bio", "verifications", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Verifications;", "socialStats", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$SocialStats;", "popularPosts", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$Verifications;Lcom/medium/android/graphql/OnboardingStarterPackQuery$SocialStats;Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts;)V", "getId", "()Ljava/lang/String;", "getUserName", "getImageId", "getBio", "getVerifications", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$Verifications;", "getSocialStats", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$SocialStats;", "getPopularPosts", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final String bio;
        private final String id;
        private final String imageId;
        private final PopularPosts popularPosts;
        private final SocialStats socialStats;
        private final String userName;
        private final Verifications verifications;

        public OnUser(String str, String str2, String str3, String str4, Verifications verifications, SocialStats socialStats, PopularPosts popularPosts) {
            str.getClass();
            popularPosts.getClass();
            this.id = str;
            this.userName = str2;
            this.imageId = str3;
            this.bio = str4;
            this.verifications = verifications;
            this.socialStats = socialStats;
            this.popularPosts = popularPosts;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, String str, String str2, String str3, String str4, Verifications verifications, SocialStats socialStats, PopularPosts popularPosts, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUser.id;
            }
            if ((i & 2) != 0) {
                str2 = onUser.userName;
            }
            if ((i & 4) != 0) {
                str3 = onUser.imageId;
            }
            if ((i & 8) != 0) {
                str4 = onUser.bio;
            }
            if ((i & 16) != 0) {
                verifications = onUser.verifications;
            }
            if ((i & 32) != 0) {
                socialStats = onUser.socialStats;
            }
            if ((i & 64) != 0) {
                popularPosts = onUser.popularPosts;
            }
            SocialStats socialStats2 = socialStats;
            PopularPosts popularPosts2 = popularPosts;
            Verifications verifications2 = verifications;
            String str5 = str3;
            return onUser.copy(str, str2, str5, str4, verifications2, socialStats2, popularPosts2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getUserName() {
            return this.userName;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getBio() {
            return this.bio;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Verifications getVerifications() {
            return this.verifications;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final SocialStats getSocialStats() {
            return this.socialStats;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final PopularPosts getPopularPosts() {
            return this.popularPosts;
        }

        public final OnUser copy(String id, String userName, String imageId, String bio, Verifications verifications, SocialStats socialStats, PopularPosts popularPosts) {
            id.getClass();
            popularPosts.getClass();
            return new OnUser(id, userName, imageId, bio, verifications, socialStats, popularPosts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.id, onUser.id) && g76.L(this.userName, onUser.userName) && g76.L(this.imageId, onUser.imageId) && g76.L(this.bio, onUser.bio) && g76.L(this.verifications, onUser.verifications) && g76.L(this.socialStats, onUser.socialStats) && g76.L(this.popularPosts, onUser.popularPosts);
        }

        public final String getBio() {
            return this.bio;
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final PopularPosts getPopularPosts() {
            return this.popularPosts;
        }

        public final SocialStats getSocialStats() {
            return this.socialStats;
        }

        public final String getUserName() {
            return this.userName;
        }

        public final Verifications getVerifications() {
            return this.verifications;
        }

        public final int hashCode() {
            int iHashCode = this.id.hashCode() * 31;
            String str = this.userName;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.imageId;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.bio;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            Verifications verifications = this.verifications;
            int iHashCode5 = (iHashCode4 + (verifications == null ? 0 : verifications.hashCode())) * 31;
            SocialStats socialStats = this.socialStats;
            return this.popularPosts.hashCode() + ((iHashCode5 + (socialStats != null ? socialStats.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.id;
            String str2 = this.userName;
            String str3 = this.imageId;
            String str4 = this.bio;
            Verifications verifications = this.verifications;
            SocialStats socialStats = this.socialStats;
            PopularPosts popularPosts = this.popularPosts;
            StringBuilder sbU = y30.u("OnUser(id=", str, ", userName=", str2, ", imageId=");
            ka1.C(sbU, str3, ", bio=", str4, ", verifications=");
            sbU.append(verifications);
            sbU.append(", socialStats=");
            sbU.append(socialStats);
            sbU.append(", popularPosts=");
            sbU.append(popularPosts);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnboardingStarterPack;", "", "__typename", "", "onStarterPack", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnStarterPack;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnStarterPack;)V", "get__typename", "()Ljava/lang/String;", "getOnStarterPack", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnStarterPack;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnboardingStarterPack {
        private final String __typename;
        private final OnStarterPack onStarterPack;

        public OnboardingStarterPack(String str, OnStarterPack onStarterPack) {
            str.getClass();
            this.__typename = str;
            this.onStarterPack = onStarterPack;
        }

        public static /* synthetic */ OnboardingStarterPack copy$default(OnboardingStarterPack onboardingStarterPack, String str, OnStarterPack onStarterPack, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onboardingStarterPack.__typename;
            }
            if ((i & 2) != 0) {
                onStarterPack = onboardingStarterPack.onStarterPack;
            }
            return onboardingStarterPack.copy(str, onStarterPack);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnStarterPack getOnStarterPack() {
            return this.onStarterPack;
        }

        public final OnboardingStarterPack copy(String __typename, OnStarterPack onStarterPack) {
            __typename.getClass();
            return new OnboardingStarterPack(__typename, onStarterPack);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnboardingStarterPack)) {
                return false;
            }
            OnboardingStarterPack onboardingStarterPack = (OnboardingStarterPack) other;
            return g76.L(this.__typename, onboardingStarterPack.__typename) && g76.L(this.onStarterPack, onboardingStarterPack.onStarterPack);
        }

        public final OnStarterPack getOnStarterPack() {
            return this.onStarterPack;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnStarterPack onStarterPack = this.onStarterPack;
            return iHashCode + (onStarterPack == null ? 0 : onStarterPack.hashCode());
        }

        public final String toString() {
            return "OnboardingStarterPack(__typename=" + this.__typename + ", onStarterPack=" + this.onStarterPack + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts;", "", "__typename", "", "onPopularPosts", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts;)V", "get__typename", "()Ljava/lang/String;", "getOnPopularPosts", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PopularPosts {
        private final String __typename;
        private final OnPopularPosts onPopularPosts;

        public PopularPosts(String str, OnPopularPosts onPopularPosts) {
            str.getClass();
            this.__typename = str;
            this.onPopularPosts = onPopularPosts;
        }

        public static /* synthetic */ PopularPosts copy$default(PopularPosts popularPosts, String str, OnPopularPosts onPopularPosts, int i, Object obj) {
            if ((i & 1) != 0) {
                str = popularPosts.__typename;
            }
            if ((i & 2) != 0) {
                onPopularPosts = popularPosts.onPopularPosts;
            }
            return popularPosts.copy(str, onPopularPosts);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPopularPosts getOnPopularPosts() {
            return this.onPopularPosts;
        }

        public final PopularPosts copy(String __typename, OnPopularPosts onPopularPosts) {
            __typename.getClass();
            return new PopularPosts(__typename, onPopularPosts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PopularPosts)) {
                return false;
            }
            PopularPosts popularPosts = (PopularPosts) other;
            return g76.L(this.__typename, popularPosts.__typename) && g76.L(this.onPopularPosts, popularPosts.onPopularPosts);
        }

        public final OnPopularPosts getOnPopularPosts() {
            return this.onPopularPosts;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPopularPosts onPopularPosts = this.onPopularPosts;
            return iHashCode + (onPopularPosts == null ? 0 : onPopularPosts.hashCode());
        }

        public final String toString() {
            return "PopularPosts(__typename=" + this.__typename + ", onPopularPosts=" + this.onPopularPosts + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$PopularPosts1;", "", "__typename", "", "onPopularPosts", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts1;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts1;)V", "get__typename", "()Ljava/lang/String;", "getOnPopularPosts", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPopularPosts1;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PopularPosts1 {
        private final String __typename;
        private final OnPopularPosts1 onPopularPosts;

        public PopularPosts1(String str, OnPopularPosts1 onPopularPosts1) {
            str.getClass();
            this.__typename = str;
            this.onPopularPosts = onPopularPosts1;
        }

        public static /* synthetic */ PopularPosts1 copy$default(PopularPosts1 popularPosts1, String str, OnPopularPosts1 onPopularPosts1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = popularPosts1.__typename;
            }
            if ((i & 2) != 0) {
                onPopularPosts1 = popularPosts1.onPopularPosts;
            }
            return popularPosts1.copy(str, onPopularPosts1);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnPopularPosts1 getOnPopularPosts() {
            return this.onPopularPosts;
        }

        public final PopularPosts1 copy(String __typename, OnPopularPosts1 onPopularPosts) {
            __typename.getClass();
            return new PopularPosts1(__typename, onPopularPosts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PopularPosts1)) {
                return false;
            }
            PopularPosts1 popularPosts1 = (PopularPosts1) other;
            return g76.L(this.__typename, popularPosts1.__typename) && g76.L(this.onPopularPosts, popularPosts1.onPopularPosts);
        }

        public final OnPopularPosts1 getOnPopularPosts() {
            return this.onPopularPosts;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            OnPopularPosts1 onPopularPosts1 = this.onPopularPosts;
            return iHashCode + (onPopularPosts1 == null ? 0 : onPopularPosts1.hashCode());
        }

        public final String toString() {
            return "PopularPosts1(__typename=" + this.__typename + ", onPopularPosts=" + this.onPopularPosts + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0007HÆ\u0003J5\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Post;", "", "__typename", "", "id", "title", "previewImage", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage;)V", "get__typename", "()Ljava/lang/String;", "getId", "getTitle", "getPreviewImage", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final PreviewImage previewImage;
        private final String title;

        public Post(String str, String str2, String str3, PreviewImage previewImage) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.title = str3;
            this.previewImage = previewImage;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, String str3, PreviewImage previewImage, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                str3 = post.title;
            }
            if ((i & 8) != 0) {
                previewImage = post.previewImage;
            }
            return post.copy(str, str2, str3, previewImage);
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
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PreviewImage getPreviewImage() {
            return this.previewImage;
        }

        public final Post copy(String __typename, String id, String title, PreviewImage previewImage) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, id, title, previewImage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.title, post.title) && g76.L(this.previewImage, post.previewImage);
        }

        public final String getId() {
            return this.id;
        }

        public final PreviewImage getPreviewImage() {
            return this.previewImage;
        }

        public final String getTitle() {
            return this.title;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.title;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            PreviewImage previewImage = this.previewImage;
            return iHashCode + (previewImage != null ? previewImage.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.title;
            PreviewImage previewImage = this.previewImage;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", title=");
            sbU.append(str3);
            sbU.append(", previewImage=");
            sbU.append(previewImage);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0007HÆ\u0003J5\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Post1;", "", "__typename", "", "id", "title", "previewImage", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage1;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage1;)V", "get__typename", "()Ljava/lang/String;", "getId", "getTitle", "getPreviewImage", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage1;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post1 {
        private final String __typename;
        private final String id;
        private final PreviewImage1 previewImage;
        private final String title;

        public Post1(String str, String str2, String str3, PreviewImage1 previewImage1) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.title = str3;
            this.previewImage = previewImage1;
        }

        public static /* synthetic */ Post1 copy$default(Post1 post1, String str, String str2, String str3, PreviewImage1 previewImage1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post1.id;
            }
            if ((i & 4) != 0) {
                str3 = post1.title;
            }
            if ((i & 8) != 0) {
                previewImage1 = post1.previewImage;
            }
            return post1.copy(str, str2, str3, previewImage1);
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
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final PreviewImage1 getPreviewImage() {
            return this.previewImage;
        }

        public final Post1 copy(String __typename, String id, String title, PreviewImage1 previewImage) {
            __typename.getClass();
            id.getClass();
            return new Post1(__typename, id, title, previewImage);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post1)) {
                return false;
            }
            Post1 post1 = (Post1) other;
            return g76.L(this.__typename, post1.__typename) && g76.L(this.id, post1.id) && g76.L(this.title, post1.title) && g76.L(this.previewImage, post1.previewImage);
        }

        public final String getId() {
            return this.id;
        }

        public final PreviewImage1 getPreviewImage() {
            return this.previewImage;
        }

        public final String getTitle() {
            return this.title;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.title;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            PreviewImage1 previewImage1 = this.previewImage;
            return iHashCode + (previewImage1 != null ? previewImage1.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.title;
            PreviewImage1 previewImage1 = this.previewImage;
            StringBuilder sbU = y30.u("Post1(__typename=", str, ", id=", str2, ", title=");
            sbU.append(str3);
            sbU.append(", previewImage=");
            sbU.append(previewImage1);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewImage {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public PreviewImage(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ PreviewImage copy$default(PreviewImage previewImage, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewImage.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewImage.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = previewImage.imageMetadataData;
            }
            return previewImage.copy(str, str2, imageMetadataData);
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
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final PreviewImage copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new PreviewImage(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewImage)) {
                return false;
            }
            PreviewImage previewImage = (PreviewImage) other;
            return g76.L(this.__typename, previewImage.__typename) && g76.L(this.id, previewImage.id) && g76.L(this.imageMetadataData, previewImage.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("PreviewImage(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$PreviewImage1;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewImage1 {
        private final String __typename;
        private final String id;
        private final ImageMetadataData imageMetadataData;

        public PreviewImage1(String str, String str2, ImageMetadataData imageMetadataData) {
            str.getClass();
            str2.getClass();
            imageMetadataData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageMetadataData = imageMetadataData;
        }

        public static /* synthetic */ PreviewImage1 copy$default(PreviewImage1 previewImage1, String str, String str2, ImageMetadataData imageMetadataData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewImage1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewImage1.id;
            }
            if ((i & 4) != 0) {
                imageMetadataData = previewImage1.imageMetadataData;
            }
            return previewImage1.copy(str, str2, imageMetadataData);
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
        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final PreviewImage1 copy(String __typename, String id, ImageMetadataData imageMetadataData) {
            __typename.getClass();
            id.getClass();
            imageMetadataData.getClass();
            return new PreviewImage1(__typename, id, imageMetadataData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewImage1)) {
                return false;
            }
            PreviewImage1 previewImage1 = (PreviewImage1) other;
            return g76.L(this.__typename, previewImage1.__typename) && g76.L(this.id, previewImage1.id) && g76.L(this.imageMetadataData, previewImage1.imageMetadataData);
        }

        public final String getId() {
            return this.id;
        }

        public final ImageMetadataData getImageMetadataData() {
            return this.imageMetadataData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.imageMetadataData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            ImageMetadataData imageMetadataData = this.imageMetadataData;
            StringBuilder sbU = y30.u("PreviewImage1(__typename=", str, ", id=", str2, ", imageMetadataData=");
            sbU.append(imageMetadataData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$RecommendedPublisher;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnUser;", "onPublication", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPublication;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnUser;Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPublication;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnUser;", "getOnPublication", "()Lcom/medium/android/graphql/OnboardingStarterPackQuery$OnPublication;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RecommendedPublisher {
        private final String __typename;
        private final OnPublication onPublication;
        private final OnUser onUser;

        public RecommendedPublisher(String str, OnUser onUser, OnPublication onPublication) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
            this.onPublication = onPublication;
        }

        public static /* synthetic */ RecommendedPublisher copy$default(RecommendedPublisher recommendedPublisher, String str, OnUser onUser, OnPublication onPublication, int i, Object obj) {
            if ((i & 1) != 0) {
                str = recommendedPublisher.__typename;
            }
            if ((i & 2) != 0) {
                onUser = recommendedPublisher.onUser;
            }
            if ((i & 4) != 0) {
                onPublication = recommendedPublisher.onPublication;
            }
            return recommendedPublisher.copy(str, onUser, onPublication);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnUser getOnUser() {
            return this.onUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final OnPublication getOnPublication() {
            return this.onPublication;
        }

        public final RecommendedPublisher copy(String __typename, OnUser onUser, OnPublication onPublication) {
            __typename.getClass();
            return new RecommendedPublisher(__typename, onUser, onPublication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RecommendedPublisher)) {
                return false;
            }
            RecommendedPublisher recommendedPublisher = (RecommendedPublisher) other;
            return g76.L(this.__typename, recommendedPublisher.__typename) && g76.L(this.onUser, recommendedPublisher.onUser) && g76.L(this.onPublication, recommendedPublisher.onPublication);
        }

        public final OnPublication getOnPublication() {
            return this.onPublication;
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
            int iHashCode2 = (iHashCode + (onUser == null ? 0 : onUser.hashCode())) * 31;
            OnPublication onPublication = this.onPublication;
            return iHashCode2 + (onPublication != null ? onPublication.hashCode() : 0);
        }

        public final String toString() {
            return "RecommendedPublisher(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onPublication=" + this.onPublication + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$SocialStats;", "", "__typename", "", "followerCount", "", "<init>", "(Ljava/lang/String;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getFollowerCount", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Long;)Lcom/medium/android/graphql/OnboardingStarterPackQuery$SocialStats;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SocialStats {
        private final String __typename;
        private final Long followerCount;

        public SocialStats(String str, Long l) {
            str.getClass();
            this.__typename = str;
            this.followerCount = l;
        }

        public static /* synthetic */ SocialStats copy$default(SocialStats socialStats, String str, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = socialStats.__typename;
            }
            if ((i & 2) != 0) {
                l = socialStats.followerCount;
            }
            return socialStats.copy(str, l);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getFollowerCount() {
            return this.followerCount;
        }

        public final SocialStats copy(String __typename, Long followerCount) {
            __typename.getClass();
            return new SocialStats(__typename, followerCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SocialStats)) {
                return false;
            }
            SocialStats socialStats = (SocialStats) other;
            return g76.L(this.__typename, socialStats.__typename) && g76.L(this.followerCount, socialStats.followerCount);
        }

        public final Long getFollowerCount() {
            return this.followerCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.followerCount;
            return iHashCode + (l == null ? 0 : l.hashCode());
        }

        public final String toString() {
            return "SocialStats(__typename=" + this.__typename + ", followerCount=" + this.followerCount + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$User;", "", "__typename", "", "id", "imageId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final String imageId;

        public User(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageId = str3;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.id;
            }
            if ((i & 4) != 0) {
                str3 = user.imageId;
            }
            return user.copy(str, str2, str3);
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
        public final String getImageId() {
            return this.imageId;
        }

        public final User copy(String __typename, String id, String imageId) {
            __typename.getClass();
            id.getClass();
            return new User(__typename, id, imageId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.id, user.id) && g76.L(this.imageId, user.imageId);
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
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.imageId;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("User(__typename=", str, ", id=", str2, ", imageId="), this.imageId, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$User1;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User1 {
        private final String __typename;
        private final String id;

        public User1(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ User1 copy$default(User1 user1, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user1.id;
            }
            return user1.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final User1 copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new User1(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User1)) {
                return false;
            }
            User1 user1 = (User1) other;
            return g76.L(this.__typename, user1.__typename) && g76.L(this.id, user1.id);
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
            return ev6.y("User1(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Verifications {
        private final String __typename;
        private final boolean isBookAuthor;

        public Verifications(String str, boolean z) {
            str.getClass();
            this.__typename = str;
            this.isBookAuthor = z;
        }

        public static /* synthetic */ Verifications copy$default(Verifications verifications, String str, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = verifications.__typename;
            }
            if ((i & 2) != 0) {
                z = verifications.isBookAuthor;
            }
            return verifications.copy(str, z);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsBookAuthor() {
            return this.isBookAuthor;
        }

        public final Verifications copy(String __typename, boolean isBookAuthor) {
            __typename.getClass();
            return new Verifications(__typename, isBookAuthor);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Verifications)) {
                return false;
            }
            Verifications verifications = (Verifications) other;
            return g76.L(this.__typename, verifications.__typename) && this.isBookAuthor == verifications.isBookAuthor;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return (this.__typename.hashCode() * 31) + (this.isBookAuthor ? 1231 : 1237);
        }

        public final boolean isBookAuthor() {
            return this.isBookAuthor;
        }

        public final String toString() {
            return km4.z("Verifications(__typename=", this.__typename, ", isBookAuthor=", ")", this.isBookAuthor);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$WriterConnection;", "", "__typename", "", "imageId", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getImageId", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class WriterConnection {
        private final String __typename;
        private final String id;
        private final String imageId;

        public WriterConnection(String str, String str2, String str3) {
            str.getClass();
            str3.getClass();
            this.__typename = str;
            this.imageId = str2;
            this.id = str3;
        }

        public static /* synthetic */ WriterConnection copy$default(WriterConnection writerConnection, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = writerConnection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = writerConnection.imageId;
            }
            if ((i & 4) != 0) {
                str3 = writerConnection.id;
            }
            return writerConnection.copy(str, str2, str3);
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

        public final WriterConnection copy(String __typename, String imageId, String id) {
            __typename.getClass();
            id.getClass();
            return new WriterConnection(__typename, imageId, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof WriterConnection)) {
                return false;
            }
            WriterConnection writerConnection = (WriterConnection) other;
            return g76.L(this.__typename, writerConnection.__typename) && g76.L(this.imageId, writerConnection.imageId) && g76.L(this.id, writerConnection.id);
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
            return ka1.v(y30.u("WriterConnection(__typename=", str, ", imageId=", str2, ", id="), this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Writers;", "", "__typename", "", "edges", "", "Lcom/medium/android/graphql/OnboardingStarterPackQuery$Edge;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getEdges", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Writers {
        private final String __typename;
        private final List<Edge> edges;

        public Writers(String str, List<Edge> list) {
            str.getClass();
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
            int iHashCode = this.__typename.hashCode() * 31;
            List<Edge> list = this.edges;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            return ka1.s("Writers(__typename=", this.__typename, ", edges=", ")", this.edges);
        }
    }

    public OnboardingStarterPackQuery(OnboardingStarterPackInput onboardingStarterPackInput, int i) {
        onboardingStarterPackInput.getClass();
        this.input = onboardingStarterPackInput;
        this.popularPostsLimit = i;
    }

    public static /* synthetic */ OnboardingStarterPackQuery copy$default(OnboardingStarterPackQuery onboardingStarterPackQuery, OnboardingStarterPackInput onboardingStarterPackInput, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            onboardingStarterPackInput = onboardingStarterPackQuery.input;
        }
        if ((i2 & 2) != 0) {
            i = onboardingStarterPackQuery.popularPostsLimit;
        }
        return onboardingStarterPackQuery.copy(onboardingStarterPackInput, i);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(OnboardingStarterPackQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final OnboardingStarterPackInput getInput() {
        return this.input;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getPopularPostsLimit() {
        return this.popularPostsLimit;
    }

    public final OnboardingStarterPackQuery copy(OnboardingStarterPackInput input, int popularPostsLimit) {
        input.getClass();
        return new OnboardingStarterPackQuery(input, popularPostsLimit);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query OnboardingStarterPackQuery($input: OnboardingStarterPackInput!, $popularPostsLimit: Int!) { onboardingStarterPack(input: $input) { __typename ... on StarterPack { id categoryName writerConnections { __typename imageId id } recommendedPublishers { __typename ... on User { id userName: name imageId bio verifications { __typename isBookAuthor } socialStats { __typename followerCount } popularPosts(input: { limit: $popularPostsLimit } ) { __typename ... on PopularPosts { posts { __typename id title previewImage { __typename ...ImageMetadataData id } } } } } ... on Publication { id name description avatar { __typename id } followGraph { __typename followerCount } writers: mastheadConnection(first: 8, after: \"\", opts: { filterRoles: [WRITER] } ) { __typename edges { __typename node { __typename user { __typename id imageId } } } } editors: mastheadConnection(first: 10, after: \"\", opts: { filterRoles: [EDITOR] } ) { __typename edges { __typename node { __typename user { __typename id } } } } popularPosts(input: { limit: $popularPostsLimit } ) { __typename ... on PopularPosts { posts { __typename id title previewImage { __typename ...ImageMetadataData id } } } } } } } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof OnboardingStarterPackQuery)) {
            return false;
        }
        OnboardingStarterPackQuery onboardingStarterPackQuery = (OnboardingStarterPackQuery) other;
        return g76.L(this.input, onboardingStarterPackQuery.input) && this.popularPostsLimit == onboardingStarterPackQuery.popularPostsLimit;
    }

    public final OnboardingStarterPackInput getInput() {
        return this.input;
    }

    public final int getPopularPostsLimit() {
        return this.popularPostsLimit;
    }

    public final int hashCode() {
        return (this.input.hashCode() * 31) + this.popularPostsLimit;
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
        List<sx1> list = OnboardingStarterPackQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        OnboardingStarterPackQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "OnboardingStarterPackQuery(input=" + this.input + ", popularPostsLimit=" + this.popularPostsLimit + ")";
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/OnboardingStarterPackQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query OnboardingStarterPackQuery($input: OnboardingStarterPackInput!, $popularPostsLimit: Int!) { onboardingStarterPack(input: $input) { __typename ... on StarterPack { id categoryName writerConnections { __typename imageId id } recommendedPublishers { __typename ... on User { id userName: name imageId bio verifications { __typename isBookAuthor } socialStats { __typename followerCount } popularPosts(input: { limit: $popularPostsLimit } ) { __typename ... on PopularPosts { posts { __typename id title previewImage { __typename ...ImageMetadataData id } } } } } ... on Publication { id name description avatar { __typename id } followGraph { __typename followerCount } writers: mastheadConnection(first: 8, after: \"\", opts: { filterRoles: [WRITER] } ) { __typename edges { __typename node { __typename user { __typename id imageId } } } } editors: mastheadConnection(first: 10, after: \"\", opts: { filterRoles: [EDITOR] } ) { __typename edges { __typename node { __typename user { __typename id } } } } popularPosts(input: { limit: $popularPostsLimit } ) { __typename ... on PopularPosts { posts { __typename id title previewImage { __typename ...ImageMetadataData id } } } } } } } } }  fragment ImageMetadataData on ImageMetadata { __typename id originalWidth originalHeight focusPercentX focusPercentY alt }";
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
