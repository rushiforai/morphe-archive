package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001:\u0001#B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J:\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00052\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001c\u001a\u0004\b\u001e\u0010\fR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001f\u001a\u0004\b \u0010\u000fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010!\u001a\u0004\b\"\u0010\u0011¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/fragment/PostRepostStateData;", "Lg15;", "", "__typename", "id", "", "allowReposts", "Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;", "viewerEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Ljava/lang/Boolean;", "component4", "()Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;)Lcom/medium/android/graphql/fragment/PostRepostStateData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Ljava/lang/Boolean;", "getAllowReposts", "Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;", "getViewerEdge", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostRepostStateData implements g15 {
    private final String __typename;
    private final Boolean allowReposts;
    private final String id;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0013\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0002\u0010\u000eJ\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J:\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u0016J\u0013\u0010\u0017\u001a\u00020\u00062\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000b¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;", "", "__typename", "", "id", "hasReposted", "", "repostNote", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getHasReposted", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getRepostNote", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/PostRepostStateData$ViewerEdge;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final Boolean hasReposted;
        private final String id;
        private final String repostNote;

        public ViewerEdge(String str, String str2, Boolean bool, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.hasReposted = bool;
            this.repostNote = str3;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, Boolean bool, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                bool = viewerEdge.hasReposted;
            }
            if ((i & 8) != 0) {
                str3 = viewerEdge.repostNote;
            }
            return viewerEdge.copy(str, str2, bool, str3);
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
        public final Boolean getHasReposted() {
            return this.hasReposted;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getRepostNote() {
            return this.repostNote;
        }

        public final ViewerEdge copy(String __typename, String id, Boolean hasReposted, String repostNote) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, hasReposted, repostNote);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && g76.L(this.hasReposted, viewerEdge.hasReposted) && g76.L(this.repostNote, viewerEdge.repostNote);
        }

        public final Boolean getHasReposted() {
            return this.hasReposted;
        }

        public final String getId() {
            return this.id;
        }

        public final String getRepostNote() {
            return this.repostNote;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            Boolean bool = this.hasReposted;
            int iHashCode = (iO + (bool == null ? 0 : bool.hashCode())) * 31;
            String str = this.repostNote;
            return iHashCode + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Boolean bool = this.hasReposted;
            String str3 = this.repostNote;
            StringBuilder sbU = y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", hasReposted=");
            sbU.append(bool);
            sbU.append(", repostNote=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PostRepostStateData(String str, String str2, Boolean bool, ViewerEdge viewerEdge) {
        str.getClass();
        str2.getClass();
        viewerEdge.getClass();
        this.__typename = str;
        this.id = str2;
        this.allowReposts = bool;
        this.viewerEdge = viewerEdge;
    }

    public static /* synthetic */ PostRepostStateData copy$default(PostRepostStateData postRepostStateData, String str, String str2, Boolean bool, ViewerEdge viewerEdge, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postRepostStateData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = postRepostStateData.id;
        }
        if ((i & 4) != 0) {
            bool = postRepostStateData.allowReposts;
        }
        if ((i & 8) != 0) {
            viewerEdge = postRepostStateData.viewerEdge;
        }
        return postRepostStateData.copy(str, str2, bool, viewerEdge);
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
    public final Boolean getAllowReposts() {
        return this.allowReposts;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final PostRepostStateData copy(String __typename, String id, Boolean allowReposts, ViewerEdge viewerEdge) {
        __typename.getClass();
        id.getClass();
        viewerEdge.getClass();
        return new PostRepostStateData(__typename, id, allowReposts, viewerEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostRepostStateData)) {
            return false;
        }
        PostRepostStateData postRepostStateData = (PostRepostStateData) other;
        return g76.L(this.__typename, postRepostStateData.__typename) && g76.L(this.id, postRepostStateData.id) && g76.L(this.allowReposts, postRepostStateData.allowReposts) && g76.L(this.viewerEdge, postRepostStateData.viewerEdge);
    }

    public final Boolean getAllowReposts() {
        return this.allowReposts;
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
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        Boolean bool = this.allowReposts;
        return this.viewerEdge.hashCode() + ((iO + (bool == null ? 0 : bool.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        Boolean bool = this.allowReposts;
        ViewerEdge viewerEdge = this.viewerEdge;
        StringBuilder sbU = y30.u("PostRepostStateData(__typename=", str, ", id=", str2, ", allowReposts=");
        sbU.append(bool);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(")");
        return sbU.toString();
    }
}
