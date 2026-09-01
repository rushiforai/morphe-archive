package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.PostFeedReason;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0014\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0015\b\u0086\b\u0018\u00002\u00020\u0001:\u0006234567BK\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0012\u0010\u0012\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0011J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0015J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJb\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\fHÆ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001e\u0010\u0011J\u0010\u0010\u001f\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010$\u001a\u00020#2\b\u0010\"\u001a\u0004\u0018\u00010!HÖ\u0003¢\u0006\u0004\b$\u0010%R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010&\u001a\u0004\b'\u0010\u0011R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010(\u001a\u0004\b)\u0010\u0013R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010*\u001a\u0004\b+\u0010\u0015R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010,\u001a\u0004\b-\u0010\u0017R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\n\u0010&\u001a\u0004\b.\u0010\u0011R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u000b\u0010*\u001a\u0004\b/\u0010\u0015R\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u00100\u001a\u0004\b1\u0010\u001b¨\u00068"}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$Post;", "post", "", "reason", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$PostProviderExplanation;", "postProviderExplanation", "feedId", "moduleSourceEncoding", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;", "feedRepost", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HomeFeedItemData$Post;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/HomeFeedItemData$PostProviderExplanation;Ljava/lang/String;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/HomeFeedItemData$Post;", "component3", "()Ljava/lang/Integer;", "component4", "()Lcom/medium/android/graphql/fragment/HomeFeedItemData$PostProviderExplanation;", "component5", "component6", "component7", "()Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/HomeFeedItemData$Post;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/HomeFeedItemData$PostProviderExplanation;Ljava/lang/String;Ljava/lang/Integer;Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;)Lcom/medium/android/graphql/fragment/HomeFeedItemData;", "toString", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$Post;", "getPost", "Ljava/lang/Integer;", "getReason", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$PostProviderExplanation;", "getPostProviderExplanation", "getFeedId", "getModuleSourceEncoding", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;", "getFeedRepost", "Post", "PostProviderExplanation", "FeedRepost", "TagObject", "InteractedUser", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class HomeFeedItemData implements g15 {
    private final String __typename;
    private final String feedId;
    private final FeedRepost feedRepost;
    private final Integer moduleSourceEncoding;
    private final Post post;
    private final PostProviderExplanation postProviderExplanation;
    private final Integer reason;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J0\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0018HÖ\u0001J\t\u0010\u0019\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;", "", "__typename", "", "repostedAt", "", "note", "<init>", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getRepostedAt", "()Ljava/lang/Long;", "Ljava/lang/Long;", "getNote", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/HomeFeedItemData$FeedRepost;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class FeedRepost {
        private final String __typename;
        private final String note;
        private final Long repostedAt;

        public FeedRepost(String str, Long l, String str2) {
            str.getClass();
            this.__typename = str;
            this.repostedAt = l;
            this.note = str2;
        }

        public static /* synthetic */ FeedRepost copy$default(FeedRepost feedRepost, String str, Long l, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = feedRepost.__typename;
            }
            if ((i & 2) != 0) {
                l = feedRepost.repostedAt;
            }
            if ((i & 4) != 0) {
                str2 = feedRepost.note;
            }
            return feedRepost.copy(str, l, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getRepostedAt() {
            return this.repostedAt;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getNote() {
            return this.note;
        }

        public final FeedRepost copy(String __typename, Long repostedAt, String note) {
            __typename.getClass();
            return new FeedRepost(__typename, repostedAt, note);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof FeedRepost)) {
                return false;
            }
            FeedRepost feedRepost = (FeedRepost) other;
            return g76.L(this.__typename, feedRepost.__typename) && g76.L(this.repostedAt, feedRepost.repostedAt) && g76.L(this.note, feedRepost.note);
        }

        public final String getNote() {
            return this.note;
        }

        public final Long getRepostedAt() {
            return this.repostedAt;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.repostedAt;
            int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
            String str = this.note;
            return iHashCode2 + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            Long l = this.repostedAt;
            String str2 = this.note;
            StringBuilder sb = new StringBuilder("FeedRepost(__typename=");
            sb.append(str);
            sb.append(", repostedAt=");
            sb.append(l);
            sb.append(", note=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B=\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\tHÆ\u0003JK\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001e\u001a\u00020\u001fHÖ\u0001J\t\u0010 \u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\rR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\rR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006!"}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData$InteractedUser;", "", "__typename", "", "id", "name", "username", "imageId", "viewerEdge", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$ViewerEdge;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/HomeFeedItemData$ViewerEdge;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getUsername", "getImageId", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/HomeFeedItemData$ViewerEdge;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class InteractedUser {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final String name;
        private final String username;
        private final ViewerEdge viewerEdge;

        public InteractedUser(String str, String str2, String str3, String str4, String str5, ViewerEdge viewerEdge) {
            str.getClass();
            str2.getClass();
            viewerEdge.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.username = str4;
            this.imageId = str5;
            this.viewerEdge = viewerEdge;
        }

        public static /* synthetic */ InteractedUser copy$default(InteractedUser interactedUser, String str, String str2, String str3, String str4, String str5, ViewerEdge viewerEdge, int i, Object obj) {
            if ((i & 1) != 0) {
                str = interactedUser.__typename;
            }
            if ((i & 2) != 0) {
                str2 = interactedUser.id;
            }
            if ((i & 4) != 0) {
                str3 = interactedUser.name;
            }
            if ((i & 8) != 0) {
                str4 = interactedUser.username;
            }
            if ((i & 16) != 0) {
                str5 = interactedUser.imageId;
            }
            if ((i & 32) != 0) {
                viewerEdge = interactedUser.viewerEdge;
            }
            String str6 = str5;
            ViewerEdge viewerEdge2 = viewerEdge;
            return interactedUser.copy(str, str2, str3, str4, str6, viewerEdge2);
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
        public final String getUsername() {
            return this.username;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        public final InteractedUser copy(String __typename, String id, String name, String username, String imageId, ViewerEdge viewerEdge) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            return new InteractedUser(__typename, id, name, username, imageId, viewerEdge);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof InteractedUser)) {
                return false;
            }
            InteractedUser interactedUser = (InteractedUser) other;
            return g76.L(this.__typename, interactedUser.__typename) && g76.L(this.id, interactedUser.id) && g76.L(this.name, interactedUser.name) && g76.L(this.username, interactedUser.username) && g76.L(this.imageId, interactedUser.imageId) && g76.L(this.viewerEdge, interactedUser.viewerEdge);
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String getName() {
            return this.name;
        }

        public final String getUsername() {
            return this.username;
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
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.username;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.imageId;
            return this.viewerEdge.hashCode() + ((iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.username;
            String str5 = this.imageId;
            ViewerEdge viewerEdge = this.viewerEdge;
            StringBuilder sbU = y30.u("InteractedUser(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", username=", str4, ", imageId=");
            sbU.append(str5);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData$Post;", "", "__typename", "", "id", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPostPreviewData", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;
        private final PostPreviewData postPreviewData;

        public Post(String str, String str2, PostPreviewData postPreviewData) {
            y30.B(str, str2, postPreviewData);
            this.__typename = str;
            this.id = str2;
            this.postPreviewData = postPreviewData;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, PostPreviewData postPreviewData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                postPreviewData = post.postPreviewData;
            }
            return post.copy(str, str2, postPreviewData);
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
        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final Post copy(String __typename, String id, PostPreviewData postPreviewData) {
            __typename.getClass();
            id.getClass();
            postPreviewData.getClass();
            return new Post(__typename, id, postPreviewData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.postPreviewData, post.postPreviewData);
        }

        public final String getId() {
            return this.id;
        }

        public final PostPreviewData getPostPreviewData() {
            return this.postPreviewData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return y30.q(y30.u("Post(__typename=", str, ", id=", str2, ", postPreviewData="), this.postPreviewData, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0010\u0010\b\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\t¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u0013\u0010\u0018\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\tHÆ\u0003J?\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0012\b\u0002\u0010\b\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\tHÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u001b\u0010\b\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\n\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData$PostProviderExplanation;", "", "__typename", "", "reason", "Lcom/medium/android/graphql/type/PostFeedReason;", "tagObject", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$TagObject;", "interactedUsers", "", "Lcom/medium/android/graphql/fragment/HomeFeedItemData$InteractedUser;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PostFeedReason;Lcom/medium/android/graphql/fragment/HomeFeedItemData$TagObject;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getReason", "()Lcom/medium/android/graphql/type/PostFeedReason;", "getTagObject", "()Lcom/medium/android/graphql/fragment/HomeFeedItemData$TagObject;", "getInteractedUsers", "()Ljava/util/List;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PostProviderExplanation {
        private final String __typename;
        private final List<InteractedUser> interactedUsers;
        private final PostFeedReason reason;
        private final TagObject tagObject;

        public PostProviderExplanation(String str, PostFeedReason postFeedReason, TagObject tagObject, List<InteractedUser> list) {
            str.getClass();
            this.__typename = str;
            this.reason = postFeedReason;
            this.tagObject = tagObject;
            this.interactedUsers = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ PostProviderExplanation copy$default(PostProviderExplanation postProviderExplanation, String str, PostFeedReason postFeedReason, TagObject tagObject, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = postProviderExplanation.__typename;
            }
            if ((i & 2) != 0) {
                postFeedReason = postProviderExplanation.reason;
            }
            if ((i & 4) != 0) {
                tagObject = postProviderExplanation.tagObject;
            }
            if ((i & 8) != 0) {
                list = postProviderExplanation.interactedUsers;
            }
            return postProviderExplanation.copy(str, postFeedReason, tagObject, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PostFeedReason getReason() {
            return this.reason;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final TagObject getTagObject() {
            return this.tagObject;
        }

        public final List<InteractedUser> component4() {
            return this.interactedUsers;
        }

        public final PostProviderExplanation copy(String __typename, PostFeedReason reason, TagObject tagObject, List<InteractedUser> interactedUsers) {
            __typename.getClass();
            return new PostProviderExplanation(__typename, reason, tagObject, interactedUsers);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PostProviderExplanation)) {
                return false;
            }
            PostProviderExplanation postProviderExplanation = (PostProviderExplanation) other;
            return g76.L(this.__typename, postProviderExplanation.__typename) && this.reason == postProviderExplanation.reason && g76.L(this.tagObject, postProviderExplanation.tagObject) && g76.L(this.interactedUsers, postProviderExplanation.interactedUsers);
        }

        public final List<InteractedUser> getInteractedUsers() {
            return this.interactedUsers;
        }

        public final PostFeedReason getReason() {
            return this.reason;
        }

        public final TagObject getTagObject() {
            return this.tagObject;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            PostFeedReason postFeedReason = this.reason;
            int iHashCode2 = (iHashCode + (postFeedReason == null ? 0 : postFeedReason.hashCode())) * 31;
            TagObject tagObject = this.tagObject;
            int iHashCode3 = (iHashCode2 + (tagObject == null ? 0 : tagObject.hashCode())) * 31;
            List<InteractedUser> list = this.interactedUsers;
            return iHashCode3 + (list != null ? list.hashCode() : 0);
        }

        public final String toString() {
            return "PostProviderExplanation(__typename=" + this.__typename + ", reason=" + this.reason + ", tagObject=" + this.tagObject + ", interactedUsers=" + this.interactedUsers + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData$TagObject;", "", "__typename", "", "normalizedTagSlug", "tagData", "Lcom/medium/android/graphql/fragment/TagData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagData", "()Lcom/medium/android/graphql/fragment/TagData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class TagObject {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagData tagData;

        public TagObject(String str, String str2, TagData tagData) {
            lv8.C(str, str2, tagData);
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagData = tagData;
        }

        public static /* synthetic */ TagObject copy$default(TagObject tagObject, String str, String str2, TagData tagData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tagObject.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tagObject.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagData = tagObject.tagData;
            }
            return tagObject.copy(str, str2, tagData);
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

        public final TagObject copy(String __typename, String normalizedTagSlug, TagData tagData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagData.getClass();
            return new TagObject(__typename, normalizedTagSlug, tagData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof TagObject)) {
                return false;
            }
            TagObject tagObject = (TagObject) other;
            return g76.L(this.__typename, tagObject.__typename) && g76.L(this.normalizedTagSlug, tagObject.normalizedTagSlug) && g76.L(this.tagData, tagObject.tagData);
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
            StringBuilder sbU = y30.u("TagObject(__typename=", str, ", normalizedTagSlug=", str2, ", tagData=");
            sbU.append(tagData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/HomeFeedItemData$ViewerEdge;", "", "__typename", "", "isUser", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isUser;

        public ViewerEdge(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isUser = z;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge.isUser;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, z, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final boolean getIsUser() {
            return this.isUser;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, boolean isUser, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, isUser, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.isUser == viewerEdge.isUser && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (((this.__typename.hashCode() * 31) + (this.isUser ? 1231 : 1237)) * 31);
        }

        public final boolean isUser() {
            return this.isUser;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isUser;
            return ka1.v(ev6.D("ViewerEdge(__typename=", str, ", isUser=", ", id=", z), this.id, ")");
        }
    }

    public HomeFeedItemData(String str, Post post, Integer num, PostProviderExplanation postProviderExplanation, String str2, Integer num2, FeedRepost feedRepost) {
        str.getClass();
        this.__typename = str;
        this.post = post;
        this.reason = num;
        this.postProviderExplanation = postProviderExplanation;
        this.feedId = str2;
        this.moduleSourceEncoding = num2;
        this.feedRepost = feedRepost;
    }

    public static /* synthetic */ HomeFeedItemData copy$default(HomeFeedItemData homeFeedItemData, String str, Post post, Integer num, PostProviderExplanation postProviderExplanation, String str2, Integer num2, FeedRepost feedRepost, int i, Object obj) {
        if ((i & 1) != 0) {
            str = homeFeedItemData.__typename;
        }
        if ((i & 2) != 0) {
            post = homeFeedItemData.post;
        }
        if ((i & 4) != 0) {
            num = homeFeedItemData.reason;
        }
        if ((i & 8) != 0) {
            postProviderExplanation = homeFeedItemData.postProviderExplanation;
        }
        if ((i & 16) != 0) {
            str2 = homeFeedItemData.feedId;
        }
        if ((i & 32) != 0) {
            num2 = homeFeedItemData.moduleSourceEncoding;
        }
        if ((i & 64) != 0) {
            feedRepost = homeFeedItemData.feedRepost;
        }
        Integer num3 = num2;
        FeedRepost feedRepost2 = feedRepost;
        String str3 = str2;
        Integer num4 = num;
        return homeFeedItemData.copy(str, post, num4, postProviderExplanation, str3, num3, feedRepost2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final Post getPost() {
        return this.post;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final Integer getReason() {
        return this.reason;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final PostProviderExplanation getPostProviderExplanation() {
        return this.postProviderExplanation;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getFeedId() {
        return this.feedId;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Integer getModuleSourceEncoding() {
        return this.moduleSourceEncoding;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final FeedRepost getFeedRepost() {
        return this.feedRepost;
    }

    public final HomeFeedItemData copy(String __typename, Post post, Integer reason, PostProviderExplanation postProviderExplanation, String feedId, Integer moduleSourceEncoding, FeedRepost feedRepost) {
        __typename.getClass();
        return new HomeFeedItemData(__typename, post, reason, postProviderExplanation, feedId, moduleSourceEncoding, feedRepost);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HomeFeedItemData)) {
            return false;
        }
        HomeFeedItemData homeFeedItemData = (HomeFeedItemData) other;
        return g76.L(this.__typename, homeFeedItemData.__typename) && g76.L(this.post, homeFeedItemData.post) && g76.L(this.reason, homeFeedItemData.reason) && g76.L(this.postProviderExplanation, homeFeedItemData.postProviderExplanation) && g76.L(this.feedId, homeFeedItemData.feedId) && g76.L(this.moduleSourceEncoding, homeFeedItemData.moduleSourceEncoding) && g76.L(this.feedRepost, homeFeedItemData.feedRepost);
    }

    public final String getFeedId() {
        return this.feedId;
    }

    public final FeedRepost getFeedRepost() {
        return this.feedRepost;
    }

    public final Integer getModuleSourceEncoding() {
        return this.moduleSourceEncoding;
    }

    public final Post getPost() {
        return this.post;
    }

    public final PostProviderExplanation getPostProviderExplanation() {
        return this.postProviderExplanation;
    }

    public final Integer getReason() {
        return this.reason;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        Post post = this.post;
        int iHashCode2 = (iHashCode + (post == null ? 0 : post.hashCode())) * 31;
        Integer num = this.reason;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        PostProviderExplanation postProviderExplanation = this.postProviderExplanation;
        int iHashCode4 = (iHashCode3 + (postProviderExplanation == null ? 0 : postProviderExplanation.hashCode())) * 31;
        String str = this.feedId;
        int iHashCode5 = (iHashCode4 + (str == null ? 0 : str.hashCode())) * 31;
        Integer num2 = this.moduleSourceEncoding;
        int iHashCode6 = (iHashCode5 + (num2 == null ? 0 : num2.hashCode())) * 31;
        FeedRepost feedRepost = this.feedRepost;
        return iHashCode6 + (feedRepost != null ? feedRepost.hashCode() : 0);
    }

    public final String toString() {
        return "HomeFeedItemData(__typename=" + this.__typename + ", post=" + this.post + ", reason=" + this.reason + ", postProviderExplanation=" + this.postProviderExplanation + ", feedId=" + this.feedId + ", moduleSourceEncoding=" + this.moduleSourceEncoding + ", feedRepost=" + this.feedRepost + ")";
    }
}
