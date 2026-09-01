package com.medium.android.graphql;

import com.medium.android.graphql.adapter.FollowedEntitiesQuery_ResponseAdapter;
import com.medium.android.graphql.adapter.FollowedEntitiesQuery_VariablesAdapter;
import com.medium.android.graphql.fragment.FollowedPublicationData;
import com.medium.android.graphql.fragment.FollowedWriterData;
import com.medium.android.graphql.fragment.PageInfoData;
import com.medium.android.graphql.selections.FollowedEntitiesQuerySelections;
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
import defpackage.xv8;
import defpackage.y30;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u0000\n\u0002\b\u0016\b\u0086\b\u0018\u0000 12\b\u0012\u0004\u0012\u00020\u00020\u0001:\f23456789:;<1B)\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\r\u0010\fJ\u000f\u0010\u000e\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u000e\u0010\fJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\fJ\u0010\u0010\u001f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u001f\u0010 J\u0018\u0010!\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0007HÆ\u0003¢\u0006\u0004\b!\u0010\"J6\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0007HÆ\u0001¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b%\u0010\fJ\u0010\u0010&\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b&\u0010 J\u001a\u0010)\u001a\u00020\u00132\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010+\u001a\u0004\b,\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010-\u001a\u0004\b.\u0010 R\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010/\u001a\u0004\b0\u0010\"¨\u0006="}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery;", "Luqa;", "Lcom/medium/android/graphql/FollowedEntitiesQuery$Data;", "", "userId", "", "first", "Lzv8;", "after", "<init>", "(Ljava/lang/String;ILzv8;)V", "id", "()Ljava/lang/String;", "document", "name", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "component2", "()I", "component3", "()Lzv8;", "copy", "(Ljava/lang/String;ILzv8;)Lcom/medium/android/graphql/FollowedEntitiesQuery;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "I", "getFirst", "Lzv8;", "getAfter", "Companion", "Data", "User", "ViewerEdge", "FollowedEntitiesConnection", "OnFollowedEntitiesConnection", "Edge", "Node", "Entity", "OnUser", "OnPublication", "PageInfo", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FollowedEntitiesQuery implements uqa {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    public static final String OPERATION_ID = "4a9c8c8dda3d29f32762d1e97429c28226177361f47c666a4c6ac081e20b8722";
    public static final String OPERATION_NAME = "FollowedEntitiesQuery";
    private final zv8 after;
    private final int first;
    private final String userId;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001c\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002HÆ\u0001¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u000b\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0015\u001a\u0004\b\u0016\u0010\u0007¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$Data;", "Lsqa;", "Lcom/medium/android/graphql/FollowedEntitiesQuery$User;", "user", "<init>", "(Lcom/medium/android/graphql/FollowedEntitiesQuery$User;)V", "component1", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$User;", "copy", "(Lcom/medium/android/graphql/FollowedEntitiesQuery$User;)Lcom/medium/android/graphql/FollowedEntitiesQuery$Data;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/FollowedEntitiesQuery$User;", "getUser", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Data implements sqa {
        private final User user;

        public Data(User user) {
            this.user = user;
        }

        public static Data copy$default(Data data, User user, int i, Object obj) {
            if ((i & 1) != 0) {
                user = data.user;
            }
            data.getClass();
            return new Data(user);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final User getUser() {
            return this.user;
        }

        public final Data copy(User user) {
            return new Data(user);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Data) && g76.L(this.user, ((Data) other).user);
        }

        public final User getUser() {
            return this.user;
        }

        public final int hashCode() {
            User user = this.user;
            if (user == null) {
                return 0;
            }
            return user.hashCode();
        }

        public final String toString() {
            return "Data(user=" + this.user + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0005HÆ\u0003J\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u0011J\t\u0010\u0018\u001a\u00020\tHÆ\u0003J8\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001¢\u0006\u0002\u0010\u001aJ\u0013\u0010\u001b\u001a\u00020\u00052\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0012\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$Edge;", "", "__typename", "", "hasUnread", "", "lastPublishedAt", "", "node", "Lcom/medium/android/graphql/FollowedEntitiesQuery$Node;", "<init>", "(Ljava/lang/String;ZLjava/lang/Long;Lcom/medium/android/graphql/FollowedEntitiesQuery$Node;)V", "get__typename", "()Ljava/lang/String;", "getHasUnread", "()Z", "getLastPublishedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getNode", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$Node;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;ZLjava/lang/Long;Lcom/medium/android/graphql/FollowedEntitiesQuery$Node;)Lcom/medium/android/graphql/FollowedEntitiesQuery$Edge;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Edge {
        private final String __typename;
        private final boolean hasUnread;
        private final Long lastPublishedAt;
        private final Node node;

        public Edge(String str, boolean z, Long l, Node node) {
            str.getClass();
            node.getClass();
            this.__typename = str;
            this.hasUnread = z;
            this.lastPublishedAt = l;
            this.node = node;
        }

        public static /* synthetic */ Edge copy$default(Edge edge, String str, boolean z, Long l, Node node, int i, Object obj) {
            if ((i & 1) != 0) {
                str = edge.__typename;
            }
            if ((i & 2) != 0) {
                z = edge.hasUnread;
            }
            if ((i & 4) != 0) {
                l = edge.lastPublishedAt;
            }
            if ((i & 8) != 0) {
                node = edge.node;
            }
            return edge.copy(str, z, l, node);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getHasUnread() {
            return this.hasUnread;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Long getLastPublishedAt() {
            return this.lastPublishedAt;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Node getNode() {
            return this.node;
        }

        public final Edge copy(String __typename, boolean hasUnread, Long lastPublishedAt, Node node) {
            __typename.getClass();
            node.getClass();
            return new Edge(__typename, hasUnread, lastPublishedAt, node);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Edge)) {
                return false;
            }
            Edge edge = (Edge) other;
            return g76.L(this.__typename, edge.__typename) && this.hasUnread == edge.hasUnread && g76.L(this.lastPublishedAt, edge.lastPublishedAt) && g76.L(this.node, edge.node);
        }

        public final boolean getHasUnread() {
            return this.hasUnread;
        }

        public final Long getLastPublishedAt() {
            return this.lastPublishedAt;
        }

        public final Node getNode() {
            return this.node;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = ((this.__typename.hashCode() * 31) + (this.hasUnread ? 1231 : 1237)) * 31;
            Long l = this.lastPublishedAt;
            return this.node.hashCode() + ((iHashCode + (l == null ? 0 : l.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.hasUnread;
            Long l = this.lastPublishedAt;
            Node node = this.node;
            StringBuilder sbD = ev6.D("Edge(__typename=", str, ", hasUnread=", ", lastPublishedAt=", z);
            sbD.append(l);
            sbD.append(", node=");
            sbD.append(node);
            sbD.append(")");
            return sbD.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007HÆ\u0003J+\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$Entity;", "", "__typename", "", "onUser", "Lcom/medium/android/graphql/FollowedEntitiesQuery$OnUser;", "onPublication", "Lcom/medium/android/graphql/FollowedEntitiesQuery$OnPublication;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedEntitiesQuery$OnUser;Lcom/medium/android/graphql/FollowedEntitiesQuery$OnPublication;)V", "get__typename", "()Ljava/lang/String;", "getOnUser", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$OnUser;", "getOnPublication", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$OnPublication;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Entity {
        private final String __typename;
        private final OnPublication onPublication;
        private final OnUser onUser;

        public Entity(String str, OnUser onUser, OnPublication onPublication) {
            str.getClass();
            this.__typename = str;
            this.onUser = onUser;
            this.onPublication = onPublication;
        }

        public static /* synthetic */ Entity copy$default(Entity entity, String str, OnUser onUser, OnPublication onPublication, int i, Object obj) {
            if ((i & 1) != 0) {
                str = entity.__typename;
            }
            if ((i & 2) != 0) {
                onUser = entity.onUser;
            }
            if ((i & 4) != 0) {
                onPublication = entity.onPublication;
            }
            return entity.copy(str, onUser, onPublication);
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

        public final Entity copy(String __typename, OnUser onUser, OnPublication onPublication) {
            __typename.getClass();
            return new Entity(__typename, onUser, onPublication);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Entity)) {
                return false;
            }
            Entity entity = (Entity) other;
            return g76.L(this.__typename, entity.__typename) && g76.L(this.onUser, entity.onUser) && g76.L(this.onPublication, entity.onPublication);
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
            return "Entity(__typename=" + this.__typename + ", onUser=" + this.onUser + ", onPublication=" + this.onPublication + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$FollowedEntitiesConnection;", "", "__typename", "", "onFollowedEntitiesConnection", "Lcom/medium/android/graphql/FollowedEntitiesQuery$OnFollowedEntitiesConnection;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedEntitiesQuery$OnFollowedEntitiesConnection;)V", "get__typename", "()Ljava/lang/String;", "getOnFollowedEntitiesConnection", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$OnFollowedEntitiesConnection;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FollowedEntitiesConnection {
        private final String __typename;
        private final OnFollowedEntitiesConnection onFollowedEntitiesConnection;

        public FollowedEntitiesConnection(String str, OnFollowedEntitiesConnection onFollowedEntitiesConnection) {
            str.getClass();
            onFollowedEntitiesConnection.getClass();
            this.__typename = str;
            this.onFollowedEntitiesConnection = onFollowedEntitiesConnection;
        }

        public static /* synthetic */ FollowedEntitiesConnection copy$default(FollowedEntitiesConnection followedEntitiesConnection, String str, OnFollowedEntitiesConnection onFollowedEntitiesConnection, int i, Object obj) {
            if ((i & 1) != 0) {
                str = followedEntitiesConnection.__typename;
            }
            if ((i & 2) != 0) {
                onFollowedEntitiesConnection = followedEntitiesConnection.onFollowedEntitiesConnection;
            }
            return followedEntitiesConnection.copy(str, onFollowedEntitiesConnection);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final OnFollowedEntitiesConnection getOnFollowedEntitiesConnection() {
            return this.onFollowedEntitiesConnection;
        }

        public final FollowedEntitiesConnection copy(String __typename, OnFollowedEntitiesConnection onFollowedEntitiesConnection) {
            __typename.getClass();
            onFollowedEntitiesConnection.getClass();
            return new FollowedEntitiesConnection(__typename, onFollowedEntitiesConnection);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FollowedEntitiesConnection)) {
                return false;
            }
            FollowedEntitiesConnection followedEntitiesConnection = (FollowedEntitiesConnection) other;
            return g76.L(this.__typename, followedEntitiesConnection.__typename) && g76.L(this.onFollowedEntitiesConnection, followedEntitiesConnection.onFollowedEntitiesConnection);
        }

        public final OnFollowedEntitiesConnection getOnFollowedEntitiesConnection() {
            return this.onFollowedEntitiesConnection;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.onFollowedEntitiesConnection.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "FollowedEntitiesConnection(__typename=" + this.__typename + ", onFollowedEntitiesConnection=" + this.onFollowedEntitiesConnection + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$Node;", "", "__typename", "", "entity", "Lcom/medium/android/graphql/FollowedEntitiesQuery$Entity;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedEntitiesQuery$Entity;)V", "get__typename", "()Ljava/lang/String;", "getEntity", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$Entity;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Node {
        private final String __typename;
        private final Entity entity;

        public Node(String str, Entity entity) {
            str.getClass();
            this.__typename = str;
            this.entity = entity;
        }

        public static /* synthetic */ Node copy$default(Node node, String str, Entity entity, int i, Object obj) {
            if ((i & 1) != 0) {
                str = node.__typename;
            }
            if ((i & 2) != 0) {
                entity = node.entity;
            }
            return node.copy(str, entity);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Entity getEntity() {
            return this.entity;
        }

        public final Node copy(String __typename, Entity entity) {
            __typename.getClass();
            return new Node(__typename, entity);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Node)) {
                return false;
            }
            Node node = (Node) other;
            return g76.L(this.__typename, node.__typename) && g76.L(this.entity, node.entity);
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
            return iHashCode + (entity == null ? 0 : entity.hashCode());
        }

        public final String toString() {
            return "Node(__typename=" + this.__typename + ", entity=" + this.entity + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0006HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$OnFollowedEntitiesConnection;", "", "edges", "", "Lcom/medium/android/graphql/FollowedEntitiesQuery$Edge;", "pageInfo", "Lcom/medium/android/graphql/FollowedEntitiesQuery$PageInfo;", "<init>", "(Ljava/util/List;Lcom/medium/android/graphql/FollowedEntitiesQuery$PageInfo;)V", "getEdges", "()Ljava/util/List;", "getPageInfo", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$PageInfo;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnFollowedEntitiesConnection {
        private final List<Edge> edges;
        private final PageInfo pageInfo;

        public OnFollowedEntitiesConnection(List<Edge> list, PageInfo pageInfo) {
            list.getClass();
            pageInfo.getClass();
            this.edges = list;
            this.pageInfo = pageInfo;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ OnFollowedEntitiesConnection copy$default(OnFollowedEntitiesConnection onFollowedEntitiesConnection, List list, PageInfo pageInfo, int i, Object obj) {
            if ((i & 1) != 0) {
                list = onFollowedEntitiesConnection.edges;
            }
            if ((i & 2) != 0) {
                pageInfo = onFollowedEntitiesConnection.pageInfo;
            }
            return onFollowedEntitiesConnection.copy(list, pageInfo);
        }

        public final List<Edge> component1() {
            return this.edges;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PageInfo getPageInfo() {
            return this.pageInfo;
        }

        public final OnFollowedEntitiesConnection copy(List<Edge> edges, PageInfo pageInfo) {
            edges.getClass();
            pageInfo.getClass();
            return new OnFollowedEntitiesConnection(edges, pageInfo);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnFollowedEntitiesConnection)) {
                return false;
            }
            OnFollowedEntitiesConnection onFollowedEntitiesConnection = (OnFollowedEntitiesConnection) other;
            return g76.L(this.edges, onFollowedEntitiesConnection.edges) && g76.L(this.pageInfo, onFollowedEntitiesConnection.pageInfo);
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
            return "OnFollowedEntitiesConnection(edges=" + this.edges + ", pageInfo=" + this.pageInfo + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$OnPublication;", "", "id", "", "followedPublicationData", "Lcom/medium/android/graphql/fragment/FollowedPublicationData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/FollowedPublicationData;)V", "getId", "()Ljava/lang/String;", "getFollowedPublicationData", "()Lcom/medium/android/graphql/fragment/FollowedPublicationData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnPublication {
        private final FollowedPublicationData followedPublicationData;
        private final String id;

        public OnPublication(String str, FollowedPublicationData followedPublicationData) {
            str.getClass();
            followedPublicationData.getClass();
            this.id = str;
            this.followedPublicationData = followedPublicationData;
        }

        public static /* synthetic */ OnPublication copy$default(OnPublication onPublication, String str, FollowedPublicationData followedPublicationData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onPublication.id;
            }
            if ((i & 2) != 0) {
                followedPublicationData = onPublication.followedPublicationData;
            }
            return onPublication.copy(str, followedPublicationData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final FollowedPublicationData getFollowedPublicationData() {
            return this.followedPublicationData;
        }

        public final OnPublication copy(String id, FollowedPublicationData followedPublicationData) {
            id.getClass();
            followedPublicationData.getClass();
            return new OnPublication(id, followedPublicationData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnPublication)) {
                return false;
            }
            OnPublication onPublication = (OnPublication) other;
            return g76.L(this.id, onPublication.id) && g76.L(this.followedPublicationData, onPublication.followedPublicationData);
        }

        public final FollowedPublicationData getFollowedPublicationData() {
            return this.followedPublicationData;
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.followedPublicationData.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnPublication(id=" + this.id + ", followedPublicationData=" + this.followedPublicationData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$OnUser;", "", "id", "", "followedWriterData", "Lcom/medium/android/graphql/fragment/FollowedWriterData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/FollowedWriterData;)V", "getId", "()Ljava/lang/String;", "getFollowedWriterData", "()Lcom/medium/android/graphql/fragment/FollowedWriterData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class OnUser {
        private final FollowedWriterData followedWriterData;
        private final String id;

        public OnUser(String str, FollowedWriterData followedWriterData) {
            str.getClass();
            followedWriterData.getClass();
            this.id = str;
            this.followedWriterData = followedWriterData;
        }

        public static /* synthetic */ OnUser copy$default(OnUser onUser, String str, FollowedWriterData followedWriterData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = onUser.id;
            }
            if ((i & 2) != 0) {
                followedWriterData = onUser.followedWriterData;
            }
            return onUser.copy(str, followedWriterData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final FollowedWriterData getFollowedWriterData() {
            return this.followedWriterData;
        }

        public final OnUser copy(String id, FollowedWriterData followedWriterData) {
            id.getClass();
            followedWriterData.getClass();
            return new OnUser(id, followedWriterData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OnUser)) {
                return false;
            }
            OnUser onUser = (OnUser) other;
            return g76.L(this.id, onUser.id) && g76.L(this.followedWriterData, onUser.followedWriterData);
        }

        public final FollowedWriterData getFollowedWriterData() {
            return this.followedWriterData;
        }

        public final String getId() {
            return this.id;
        }

        public final int hashCode() {
            return this.followedWriterData.hashCode() + (this.id.hashCode() * 31);
        }

        public final String toString() {
            return "OnUser(id=" + this.id + ", followedWriterData=" + this.followedWriterData + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$PageInfo;", "", "__typename", "", "pageInfoData", "Lcom/medium/android/graphql/fragment/PageInfoData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PageInfoData;)V", "get__typename", "()Ljava/lang/String;", "getPageInfoData", "()Lcom/medium/android/graphql/fragment/PageInfoData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$User;", "", "__typename", "", "viewerEdge", "Lcom/medium/android/graphql/FollowedEntitiesQuery$ViewerEdge;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedEntitiesQuery$ViewerEdge;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getViewerEdge", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$ViewerEdge;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final ViewerEdge viewerEdge;

        public User(String str, ViewerEdge viewerEdge, String str2) {
            str.getClass();
            viewerEdge.getClass();
            str2.getClass();
            this.__typename = str;
            this.viewerEdge = viewerEdge;
            this.id = str2;
        }

        public static /* synthetic */ User copy$default(User user, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                viewerEdge = user.viewerEdge;
            }
            if ((i & 4) != 0) {
                str2 = user.id;
            }
            return user.copy(str, viewerEdge, str2);
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

        public final User copy(String __typename, ViewerEdge viewerEdge, String id) {
            __typename.getClass();
            viewerEdge.getClass();
            id.getClass();
            return new User(__typename, viewerEdge, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.viewerEdge, user.viewerEdge) && g76.L(this.id, user.id);
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
            StringBuilder sb = new StringBuilder("User(__typename=");
            sb.append(str);
            sb.append(", viewerEdge=");
            sb.append(viewerEdge);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$ViewerEdge;", "", "__typename", "", "followedEntitiesConnection", "Lcom/medium/android/graphql/FollowedEntitiesQuery$FollowedEntitiesConnection;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/FollowedEntitiesQuery$FollowedEntitiesConnection;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFollowedEntitiesConnection", "()Lcom/medium/android/graphql/FollowedEntitiesQuery$FollowedEntitiesConnection;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final FollowedEntitiesConnection followedEntitiesConnection;
        private final String id;

        public ViewerEdge(String str, FollowedEntitiesConnection followedEntitiesConnection, String str2) {
            str.getClass();
            followedEntitiesConnection.getClass();
            str2.getClass();
            this.__typename = str;
            this.followedEntitiesConnection = followedEntitiesConnection;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, FollowedEntitiesConnection followedEntitiesConnection, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                followedEntitiesConnection = viewerEdge.followedEntitiesConnection;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, followedEntitiesConnection, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final FollowedEntitiesConnection getFollowedEntitiesConnection() {
            return this.followedEntitiesConnection;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, FollowedEntitiesConnection followedEntitiesConnection, String id) {
            __typename.getClass();
            followedEntitiesConnection.getClass();
            id.getClass();
            return new ViewerEdge(__typename, followedEntitiesConnection, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.followedEntitiesConnection, viewerEdge.followedEntitiesConnection) && g76.L(this.id, viewerEdge.id);
        }

        public final FollowedEntitiesConnection getFollowedEntitiesConnection() {
            return this.followedEntitiesConnection;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.followedEntitiesConnection.hashCode() + (this.__typename.hashCode() * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            FollowedEntitiesConnection followedEntitiesConnection = this.followedEntitiesConnection;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", followedEntitiesConnection=");
            sb.append(followedEntitiesConnection);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public FollowedEntitiesQuery(String str, int i, zv8 zv8Var) {
        str.getClass();
        zv8Var.getClass();
        this.userId = str;
        this.first = i;
        this.after = zv8Var;
    }

    public static /* synthetic */ FollowedEntitiesQuery copy$default(FollowedEntitiesQuery followedEntitiesQuery, String str, int i, zv8 zv8Var, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            str = followedEntitiesQuery.userId;
        }
        if ((i2 & 2) != 0) {
            i = followedEntitiesQuery.first;
        }
        if ((i2 & 4) != 0) {
            zv8Var = followedEntitiesQuery.after;
        }
        return followedEntitiesQuery.copy(str, i, zv8Var);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(FollowedEntitiesQuery_ResponseAdapter.Data.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getUserId() {
        return this.userId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getFirst() {
        return this.first;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getAfter() {
        return this.after;
    }

    public final FollowedEntitiesQuery copy(String userId, int first, zv8 after) {
        userId.getClass();
        after.getClass();
        return new FollowedEntitiesQuery(userId, first, after);
    }

    @Override // defpackage.hv8
    public final String document() {
        INSTANCE.getClass();
        return "query FollowedEntitiesQuery($userId: ID!, $first: Int!, $after: String) { user(id: $userId) { __typename viewerEdge { __typename followedEntitiesConnection(first: $first, after: $after, input: { orderBy: \"lastPublishedAt desc\" } ) { __typename ... on FollowedEntitiesConnection { edges { __typename hasUnread lastPublishedAt node { __typename entity { __typename ... on User { ...FollowedWriterData id } ... on Publication { ...FollowedPublicationData id } } } } pageInfo { __typename ...PageInfoData } } } id } id } }  fragment FollowedWriterData on User { __typename id writerName: name imageId homepagePostsConnection(paging: { limit: 1 } ) { __typename posts { __typename id } } }  fragment FollowedPublicationData on Publication { __typename id publicationName: name avatar { __typename id } postsConnection(first: 1, after: \"\", filter: { published: true } ) { __typename edges { __typename cursor } } }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof FollowedEntitiesQuery)) {
            return false;
        }
        FollowedEntitiesQuery followedEntitiesQuery = (FollowedEntitiesQuery) other;
        return g76.L(this.userId, followedEntitiesQuery.userId) && this.first == followedEntitiesQuery.first && g76.L(this.after, followedEntitiesQuery.after);
    }

    public final zv8 getAfter() {
        return this.after;
    }

    public final int getFirst() {
        return this.first;
    }

    public final String getUserId() {
        return this.userId;
    }

    public final int hashCode() {
        return this.after.hashCode() + (((this.userId.hashCode() * 31) + this.first) * 31);
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
        List<sx1> list = FollowedEntitiesQuerySelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8VarM, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        FollowedEntitiesQuery_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        String str = this.userId;
        int i = this.first;
        return km4.B(y30.t(i, "FollowedEntitiesQuery(userId=", str, ", first=", ", after="), this.after, ")");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u00058F¢\u0006\u0006\u001a\u0004\b\u0007\u0010\bR\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/medium/android/graphql/FollowedEntitiesQuery$Companion;", "", "<init>", "()V", "OPERATION_ID", "", "OPERATION_DOCUMENT", "getOPERATION_DOCUMENT", "()Ljava/lang/String;", "OPERATION_NAME", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final String getOPERATION_DOCUMENT() {
            return "query FollowedEntitiesQuery($userId: ID!, $first: Int!, $after: String) { user(id: $userId) { __typename viewerEdge { __typename followedEntitiesConnection(first: $first, after: $after, input: { orderBy: \"lastPublishedAt desc\" } ) { __typename ... on FollowedEntitiesConnection { edges { __typename hasUnread lastPublishedAt node { __typename entity { __typename ... on User { ...FollowedWriterData id } ... on Publication { ...FollowedPublicationData id } } } } pageInfo { __typename ...PageInfoData } } } id } id } }  fragment FollowedWriterData on User { __typename id writerName: name imageId homepagePostsConnection(paging: { limit: 1 } ) { __typename posts { __typename id } } }  fragment FollowedPublicationData on Publication { __typename id publicationName: name avatar { __typename id } postsConnection(first: 1, after: \"\", filter: { published: true } ) { __typename edges { __typename cursor } } }  fragment PageInfoData on PageInfoV2 { __typename endCursor hasNextPage }";
        }

        public Companion(gy2 gy2Var) {
        }
    }

    public /* synthetic */ FollowedEntitiesQuery(String str, int i, zv8 zv8Var, int i2, gy2 gy2Var) {
        this(str, i, (i2 & 4) != 0 ? xv8.a : zv8Var);
    }
}
