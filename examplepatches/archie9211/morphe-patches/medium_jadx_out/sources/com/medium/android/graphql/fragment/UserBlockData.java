package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001:\u0001!B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\n\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\f\u0010\u000bJ\u0012\u0010\r\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\u000bJ\u0010\u0010\u000e\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ:\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u0006HÆ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u000bJ\u0010\u0010\u0014\u001a\u00020\u0013HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\u000bR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001b\u001a\u0004\b\u001d\u0010\u000bR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001e\u0010\u000bR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b \u0010\u000f¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/fragment/UserBlockData;", "Lg15;", "", "__typename", "id", "name", "Lcom/medium/android/graphql/fragment/UserBlockData$ViewerEdge;", "viewerEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserBlockData$ViewerEdge;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/graphql/fragment/UserBlockData$ViewerEdge;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserBlockData$ViewerEdge;)Lcom/medium/android/graphql/fragment/UserBlockData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "Lcom/medium/android/graphql/fragment/UserBlockData$ViewerEdge;", "getViewerEdge", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserBlockData implements g15 {
    private final String __typename;
    private final String id;
    private final String name;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0006HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00062\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/UserBlockData$ViewerEdge;", "", "__typename", "", "id", "isBlocking", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getId", "()Z", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isBlocking;

        public ViewerEdge(String str, String str2, boolean z) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.isBlocking = z;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                z = viewerEdge.isBlocking;
            }
            return viewerEdge.copy(str, str2, z);
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
        public final boolean getIsBlocking() {
            return this.isBlocking;
        }

        public final ViewerEdge copy(String __typename, String id, boolean isBlocking) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, isBlocking);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && this.isBlocking == viewerEdge.isBlocking;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return wgd.o(this.__typename.hashCode() * 31, 31, this.id) + (this.isBlocking ? 1231 : 1237);
        }

        public final boolean isBlocking() {
            return this.isBlocking;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return lv8.t(y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", isBlocking="), this.isBlocking, ")");
        }
    }

    public UserBlockData(String str, String str2, String str3, ViewerEdge viewerEdge) {
        str.getClass();
        str2.getClass();
        viewerEdge.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.viewerEdge = viewerEdge;
    }

    public static /* synthetic */ UserBlockData copy$default(UserBlockData userBlockData, String str, String str2, String str3, ViewerEdge viewerEdge, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userBlockData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = userBlockData.id;
        }
        if ((i & 4) != 0) {
            str3 = userBlockData.name;
        }
        if ((i & 8) != 0) {
            viewerEdge = userBlockData.viewerEdge;
        }
        return userBlockData.copy(str, str2, str3, viewerEdge);
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
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final UserBlockData copy(String __typename, String id, String name, ViewerEdge viewerEdge) {
        __typename.getClass();
        id.getClass();
        viewerEdge.getClass();
        return new UserBlockData(__typename, id, name, viewerEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserBlockData)) {
            return false;
        }
        UserBlockData userBlockData = (UserBlockData) other;
        return g76.L(this.__typename, userBlockData.__typename) && g76.L(this.id, userBlockData.id) && g76.L(this.name, userBlockData.name) && g76.L(this.viewerEdge, userBlockData.viewerEdge);
    }

    public final String getId() {
        return this.id;
    }

    public final String getName() {
        return this.name;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.name;
        return this.viewerEdge.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        ViewerEdge viewerEdge = this.viewerEdge;
        StringBuilder sbU = y30.u("UserBlockData(__typename=", str, ", id=", str2, ", name=");
        sbU.append(str3);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(")");
        return sbU.toString();
    }
}
