package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000f\b\u0086\b\u0018\u00002\u00020\u0001:\u0001/BE\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0010J\u0012\u0010\u0013\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0010J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\\\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\f\u001a\u00020\u000bHÆ\u0001¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001c\u0010\u0010J\u0010\u0010\u001d\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u001a\u0010\"\u001a\u00020!2\b\u0010 \u001a\u0004\u0018\u00010\u001fHÖ\u0003¢\u0006\u0004\b\"\u0010#R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010$\u001a\u0004\b%\u0010\u0010R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010$\u001a\u0004\b&\u0010\u0010R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010$\u001a\u0004\b'\u0010\u0010R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010$\u001a\u0004\b(\u0010\u0010R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010)\u001a\u0004\b*\u0010\u0015R\u0019\u0010\n\u001a\u0004\u0018\u00010\t8\u0006¢\u0006\f\n\u0004\b\n\u0010+\u001a\u0004\b,\u0010\u0017R\u0017\u0010\f\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010-\u001a\u0004\b.\u0010\u0019¨\u00060"}, d2 = {"Lcom/medium/android/graphql/fragment/TagData;", "Lg15;", "", "__typename", "id", "normalizedTagSlug", "displayTitle", "", "followerCount", "", "postCount", "Lcom/medium/android/graphql/fragment/TagData$ViewerEdge;", "viewerEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/TagData$ViewerEdge;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "()Ljava/lang/Integer;", "component6", "()Ljava/lang/Long;", "component7", "()Lcom/medium/android/graphql/fragment/TagData$ViewerEdge;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Lcom/medium/android/graphql/fragment/TagData$ViewerEdge;)Lcom/medium/android/graphql/fragment/TagData;", "toString", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getNormalizedTagSlug", "getDisplayTitle", "Ljava/lang/Integer;", "getFollowerCount", "Ljava/lang/Long;", "getPostCount", "Lcom/medium/android/graphql/fragment/TagData$ViewerEdge;", "getViewerEdge", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class TagData implements g15 {
    private final String __typename;
    private final String displayTitle;
    private final Integer followerCount;
    private final String id;
    private final String normalizedTagSlug;
    private final Long postCount;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0006HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00062\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/TagData$ViewerEdge;", "", "__typename", "", "id", "isFollowing", "", "<init>", "(Ljava/lang/String;Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "getId", "()Z", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isFollowing;

        public ViewerEdge(String str, String str2, boolean z) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.isFollowing = z;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, String str2, boolean z, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                str2 = viewerEdge.id;
            }
            if ((i & 4) != 0) {
                z = viewerEdge.isFollowing;
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
        public final boolean getIsFollowing() {
            return this.isFollowing;
        }

        public final ViewerEdge copy(String __typename, String id, boolean isFollowing) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, id, isFollowing);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.id, viewerEdge.id) && this.isFollowing == viewerEdge.isFollowing;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return wgd.o(this.__typename.hashCode() * 31, 31, this.id) + (this.isFollowing ? 1231 : 1237);
        }

        public final boolean isFollowing() {
            return this.isFollowing;
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return lv8.t(y30.u("ViewerEdge(__typename=", str, ", id=", str2, ", isFollowing="), this.isFollowing, ")");
        }
    }

    public TagData(String str, String str2, String str3, String str4, Integer num, Long l, ViewerEdge viewerEdge) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        viewerEdge.getClass();
        this.__typename = str;
        this.id = str2;
        this.normalizedTagSlug = str3;
        this.displayTitle = str4;
        this.followerCount = num;
        this.postCount = l;
        this.viewerEdge = viewerEdge;
    }

    public static /* synthetic */ TagData copy$default(TagData tagData, String str, String str2, String str3, String str4, Integer num, Long l, ViewerEdge viewerEdge, int i, Object obj) {
        if ((i & 1) != 0) {
            str = tagData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = tagData.id;
        }
        if ((i & 4) != 0) {
            str3 = tagData.normalizedTagSlug;
        }
        if ((i & 8) != 0) {
            str4 = tagData.displayTitle;
        }
        if ((i & 16) != 0) {
            num = tagData.followerCount;
        }
        if ((i & 32) != 0) {
            l = tagData.postCount;
        }
        if ((i & 64) != 0) {
            viewerEdge = tagData.viewerEdge;
        }
        Long l2 = l;
        ViewerEdge viewerEdge2 = viewerEdge;
        Integer num2 = num;
        String str5 = str3;
        return tagData.copy(str, str2, str5, str4, num2, l2, viewerEdge2);
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

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final Integer getFollowerCount() {
        return this.followerCount;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Long getPostCount() {
        return this.postCount;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final TagData copy(String __typename, String id, String normalizedTagSlug, String displayTitle, Integer followerCount, Long postCount, ViewerEdge viewerEdge) {
        __typename.getClass();
        id.getClass();
        normalizedTagSlug.getClass();
        viewerEdge.getClass();
        return new TagData(__typename, id, normalizedTagSlug, displayTitle, followerCount, postCount, viewerEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof TagData)) {
            return false;
        }
        TagData tagData = (TagData) other;
        return g76.L(this.__typename, tagData.__typename) && g76.L(this.id, tagData.id) && g76.L(this.normalizedTagSlug, tagData.normalizedTagSlug) && g76.L(this.displayTitle, tagData.displayTitle) && g76.L(this.followerCount, tagData.followerCount) && g76.L(this.postCount, tagData.postCount) && g76.L(this.viewerEdge, tagData.viewerEdge);
    }

    public final String getDisplayTitle() {
        return this.displayTitle;
    }

    public final Integer getFollowerCount() {
        return this.followerCount;
    }

    public final String getId() {
        return this.id;
    }

    public final String getNormalizedTagSlug() {
        return this.normalizedTagSlug;
    }

    public final Long getPostCount() {
        return this.postCount;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.normalizedTagSlug);
        String str = this.displayTitle;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.followerCount;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Long l = this.postCount;
        return this.viewerEdge.hashCode() + ((iHashCode2 + (l != null ? l.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.normalizedTagSlug;
        String str4 = this.displayTitle;
        Integer num = this.followerCount;
        Long l = this.postCount;
        ViewerEdge viewerEdge = this.viewerEdge;
        StringBuilder sbU = y30.u("TagData(__typename=", str, ", id=", str2, ", normalizedTagSlug=");
        ka1.C(sbU, str3, ", displayTitle=", str4, ", followerCount=");
        sbU.append(num);
        sbU.append(", postCount=");
        sbU.append(l);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(")");
        return sbU.toString();
    }
}
