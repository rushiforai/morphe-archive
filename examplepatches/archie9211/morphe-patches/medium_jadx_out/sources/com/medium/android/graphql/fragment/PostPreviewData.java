package com.medium.android.graphql.fragment;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.km4;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000x\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b'\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b,\b\u0086\b\u0018\u00002\u00020\u0001:\brstuvwxyB±\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\f\u0012\u0006\u0010\u0010\u001a\u00020\u0002\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\u0006\u0010\u0016\u001a\u00020\u0015\u0012\u0006\u0010\u0018\u001a\u00020\u0017\u0012\u0006\u0010\u001a\u001a\u00020\u0019\u0012\u0006\u0010\u001c\u001a\u00020\u001b\u0012\u0006\u0010\u001e\u001a\u00020\u001d\u0012\u0006\u0010 \u001a\u00020\u001f\u0012\u0006\u0010\"\u001a\u00020!¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b'\u0010&J\u0012\u0010(\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b(\u0010&J\u0012\u0010)\u001a\u0004\u0018\u00010\u0006HÆ\u0003¢\u0006\u0004\b)\u0010*J\u0012\u0010+\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b+\u0010,J\u0012\u0010-\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b-\u0010.J\u0012\u0010/\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b/\u00100J\u0012\u00101\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b1\u00100J\u0012\u00102\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b2\u00100J\u0010\u00103\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b3\u0010&J\u0012\u00104\u001a\u0004\u0018\u00010\u0011HÆ\u0003¢\u0006\u0004\b4\u00105J\u0012\u00106\u001a\u0004\u0018\u00010\u0013HÆ\u0003¢\u0006\u0004\b6\u00107J\u0010\u00108\u001a\u00020\u0015HÆ\u0003¢\u0006\u0004\b8\u00109J\u0010\u0010:\u001a\u00020\u0017HÆ\u0003¢\u0006\u0004\b:\u0010;J\u0010\u0010<\u001a\u00020\u0019HÆ\u0003¢\u0006\u0004\b<\u0010=J\u0010\u0010>\u001a\u00020\u001bHÆ\u0003¢\u0006\u0004\b>\u0010?J\u0010\u0010@\u001a\u00020\u001dHÆ\u0003¢\u0006\u0004\b@\u0010AJ\u0010\u0010B\u001a\u00020\u001fHÆ\u0003¢\u0006\u0004\bB\u0010CJ\u0010\u0010D\u001a\u00020!HÆ\u0003¢\u0006\u0004\bD\u0010EJà\u0001\u0010F\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u0010\u001a\u00020\u00022\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\b\b\u0002\u0010\u0016\u001a\u00020\u00152\b\b\u0002\u0010\u0018\u001a\u00020\u00172\b\b\u0002\u0010\u001a\u001a\u00020\u00192\b\b\u0002\u0010\u001c\u001a\u00020\u001b2\b\b\u0002\u0010\u001e\u001a\u00020\u001d2\b\b\u0002\u0010 \u001a\u00020\u001f2\b\b\u0002\u0010\"\u001a\u00020!HÆ\u0001¢\u0006\u0004\bF\u0010GJ\u0010\u0010H\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\bH\u0010&J\u0010\u0010J\u001a\u00020IHÖ\u0001¢\u0006\u0004\bJ\u0010KJ\u001a\u0010O\u001a\u00020N2\b\u0010M\u001a\u0004\u0018\u00010LHÖ\u0003¢\u0006\u0004\bO\u0010PR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010Q\u001a\u0004\bR\u0010&R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010Q\u001a\u0004\bS\u0010&R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010Q\u001a\u0004\bT\u0010&R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010U\u001a\u0004\bV\u0010*R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010W\u001a\u0004\bX\u0010,R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010Y\u001a\u0004\bZ\u0010.R\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u0010[\u001a\u0004\b\\\u00100R\u0019\u0010\u000e\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\u000e\u0010[\u001a\u0004\b]\u00100R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\u000f\u0010[\u001a\u0004\b^\u00100R\u0017\u0010\u0010\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0010\u0010Q\u001a\u0004\b_\u0010&R\u0019\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010`\u001a\u0004\ba\u00105R\u0019\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006¢\u0006\f\n\u0004\b\u0014\u0010b\u001a\u0004\bc\u00107R\u0017\u0010\u0016\u001a\u00020\u00158\u0006¢\u0006\f\n\u0004\b\u0016\u0010d\u001a\u0004\be\u00109R\u0017\u0010\u0018\u001a\u00020\u00178\u0006¢\u0006\f\n\u0004\b\u0018\u0010f\u001a\u0004\bg\u0010;R\u0017\u0010\u001a\u001a\u00020\u00198\u0006¢\u0006\f\n\u0004\b\u001a\u0010h\u001a\u0004\bi\u0010=R\u0017\u0010\u001c\u001a\u00020\u001b8\u0006¢\u0006\f\n\u0004\b\u001c\u0010j\u001a\u0004\bk\u0010?R\u0017\u0010\u001e\u001a\u00020\u001d8\u0006¢\u0006\f\n\u0004\b\u001e\u0010l\u001a\u0004\bm\u0010AR\u0017\u0010 \u001a\u00020\u001f8\u0006¢\u0006\f\n\u0004\b \u0010n\u001a\u0004\bo\u0010CR\u0017\u0010\"\u001a\u00020!8\u0006¢\u0006\f\n\u0004\b\"\u0010p\u001a\u0004\bq\u0010E¨\u0006z"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData;", "Lg15;", "", "__typename", "id", "title", "Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;", "previewContent", "Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;", "previewImage", "", "readingTime", "", "pinnedByCreatorAt", "firstPublishedAt", "updatedAt", "latestPublishedVersion", "Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;", "collection", "Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;", "creator", "Lcom/medium/android/graphql/fragment/PostClapsData;", "postClapsData", "Lcom/medium/android/graphql/fragment/ResponseCountData;", "responseCountData", "Lcom/medium/android/graphql/fragment/PostVisibilityData;", "postVisibilityData", "Lcom/medium/android/graphql/fragment/PostShareData;", "postShareData", "Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;", "postFeaturingStatusData", "Lcom/medium/android/graphql/fragment/PostViewStateData;", "postViewStateData", "Lcom/medium/android/graphql/fragment/PostRepostCountData;", "postRepostCountData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;Ljava/lang/Double;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;Lcom/medium/android/graphql/fragment/PostClapsData;Lcom/medium/android/graphql/fragment/ResponseCountData;Lcom/medium/android/graphql/fragment/PostVisibilityData;Lcom/medium/android/graphql/fragment/PostShareData;Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;Lcom/medium/android/graphql/fragment/PostViewStateData;Lcom/medium/android/graphql/fragment/PostRepostCountData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;", "component5", "()Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;", "component6", "()Ljava/lang/Double;", "component7", "()Ljava/lang/Long;", "component8", "component9", "component10", "component11", "()Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;", "component12", "()Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;", "component13", "()Lcom/medium/android/graphql/fragment/PostClapsData;", "component14", "()Lcom/medium/android/graphql/fragment/ResponseCountData;", "component15", "()Lcom/medium/android/graphql/fragment/PostVisibilityData;", "component16", "()Lcom/medium/android/graphql/fragment/PostShareData;", "component17", "()Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;", "component18", "()Lcom/medium/android/graphql/fragment/PostViewStateData;", "component19", "()Lcom/medium/android/graphql/fragment/PostRepostCountData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;Ljava/lang/Double;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;Lcom/medium/android/graphql/fragment/PostClapsData;Lcom/medium/android/graphql/fragment/ResponseCountData;Lcom/medium/android/graphql/fragment/PostVisibilityData;Lcom/medium/android/graphql/fragment/PostShareData;Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;Lcom/medium/android/graphql/fragment/PostViewStateData;Lcom/medium/android/graphql/fragment/PostRepostCountData;)Lcom/medium/android/graphql/fragment/PostPreviewData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getTitle", "Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;", "getPreviewContent", "Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;", "getPreviewImage", "Ljava/lang/Double;", "getReadingTime", "Ljava/lang/Long;", "getPinnedByCreatorAt", "getFirstPublishedAt", "getUpdatedAt", "getLatestPublishedVersion", "Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;", "getCollection", "Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;", "getCreator", "Lcom/medium/android/graphql/fragment/PostClapsData;", "getPostClapsData", "Lcom/medium/android/graphql/fragment/ResponseCountData;", "getResponseCountData", "Lcom/medium/android/graphql/fragment/PostVisibilityData;", "getPostVisibilityData", "Lcom/medium/android/graphql/fragment/PostShareData;", "getPostShareData", "Lcom/medium/android/graphql/fragment/PostFeaturingStatusData;", "getPostFeaturingStatusData", "Lcom/medium/android/graphql/fragment/PostViewStateData;", "getPostViewStateData", "Lcom/medium/android/graphql/fragment/PostRepostCountData;", "getPostRepostCountData", "PreviewContent", "PreviewImage", "Collection", "Creator", "Avatar", "ViewerEdge", "ViewerEdge1", "Verifications", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostPreviewData implements g15 {
    private final String __typename;
    private final Collection collection;
    private final Creator creator;
    private final Long firstPublishedAt;
    private final String id;
    private final String latestPublishedVersion;
    private final Long pinnedByCreatorAt;
    private final PostClapsData postClapsData;
    private final PostFeaturingStatusData postFeaturingStatusData;
    private final PostRepostCountData postRepostCountData;
    private final PostShareData postShareData;
    private final PostViewStateData postViewStateData;
    private final PostVisibilityData postVisibilityData;
    private final PreviewContent previewContent;
    private final PreviewImage previewImage;
    private final Double readingTime;
    private final ResponseCountData responseCountData;
    private final String title;
    private final Long updatedAt;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BC\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010 \u001a\u00020\tHÆ\u0003J\t\u0010!\u001a\u00020\u000bHÆ\u0003J\t\u0010\"\u001a\u00020\rHÆ\u0003JS\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\rHÆ\u0001J\u0013\u0010$\u001a\u00020%2\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020(HÖ\u0001J\t\u0010)\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001b¨\u0006*"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$Collection;", "", "__typename", "", "id", "name", "avatar", "Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;", "viewerEdge", "Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;", "collectionFollowData", "Lcom/medium/android/graphql/fragment/CollectionFollowData;", "collectionMuteData", "Lcom/medium/android/graphql/fragment/CollectionMuteData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;Lcom/medium/android/graphql/fragment/CollectionFollowData;Lcom/medium/android/graphql/fragment/CollectionMuteData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getAvatar", "()Lcom/medium/android/graphql/fragment/PostPreviewData$Avatar;", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;", "getCollectionFollowData", "()Lcom/medium/android/graphql/fragment/CollectionFollowData;", "getCollectionMuteData", "()Lcom/medium/android/graphql/fragment/CollectionMuteData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Collection {
        private final String __typename;
        private final Avatar avatar;
        private final CollectionFollowData collectionFollowData;
        private final CollectionMuteData collectionMuteData;
        private final String id;
        private final String name;
        private final ViewerEdge viewerEdge;

        public Collection(String str, String str2, String str3, Avatar avatar, ViewerEdge viewerEdge, CollectionFollowData collectionFollowData, CollectionMuteData collectionMuteData) {
            str.getClass();
            str2.getClass();
            viewerEdge.getClass();
            collectionFollowData.getClass();
            collectionMuteData.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.avatar = avatar;
            this.viewerEdge = viewerEdge;
            this.collectionFollowData = collectionFollowData;
            this.collectionMuteData = collectionMuteData;
        }

        public static /* synthetic */ Collection copy$default(Collection collection, String str, String str2, String str3, Avatar avatar, ViewerEdge viewerEdge, CollectionFollowData collectionFollowData, CollectionMuteData collectionMuteData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = collection.__typename;
            }
            if ((i & 2) != 0) {
                str2 = collection.id;
            }
            if ((i & 4) != 0) {
                str3 = collection.name;
            }
            if ((i & 8) != 0) {
                avatar = collection.avatar;
            }
            if ((i & 16) != 0) {
                viewerEdge = collection.viewerEdge;
            }
            if ((i & 32) != 0) {
                collectionFollowData = collection.collectionFollowData;
            }
            if ((i & 64) != 0) {
                collectionMuteData = collection.collectionMuteData;
            }
            CollectionFollowData collectionFollowData2 = collectionFollowData;
            CollectionMuteData collectionMuteData2 = collectionMuteData;
            ViewerEdge viewerEdge2 = viewerEdge;
            String str4 = str3;
            return collection.copy(str, str2, str4, avatar, viewerEdge2, collectionFollowData2, collectionMuteData2);
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
        public final Avatar getAvatar() {
            return this.avatar;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final ViewerEdge getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final CollectionFollowData getCollectionFollowData() {
            return this.collectionFollowData;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final CollectionMuteData getCollectionMuteData() {
            return this.collectionMuteData;
        }

        public final Collection copy(String __typename, String id, String name, Avatar avatar, ViewerEdge viewerEdge, CollectionFollowData collectionFollowData, CollectionMuteData collectionMuteData) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            collectionFollowData.getClass();
            collectionMuteData.getClass();
            return new Collection(__typename, id, name, avatar, viewerEdge, collectionFollowData, collectionMuteData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Collection)) {
                return false;
            }
            Collection collection = (Collection) other;
            return g76.L(this.__typename, collection.__typename) && g76.L(this.id, collection.id) && g76.L(this.name, collection.name) && g76.L(this.avatar, collection.avatar) && g76.L(this.viewerEdge, collection.viewerEdge) && g76.L(this.collectionFollowData, collection.collectionFollowData) && g76.L(this.collectionMuteData, collection.collectionMuteData);
        }

        public final Avatar getAvatar() {
            return this.avatar;
        }

        public final CollectionFollowData getCollectionFollowData() {
            return this.collectionFollowData;
        }

        public final CollectionMuteData getCollectionMuteData() {
            return this.collectionMuteData;
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
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            Avatar avatar = this.avatar;
            return this.collectionMuteData.hashCode() + ((this.collectionFollowData.hashCode() + ((this.viewerEdge.hashCode() + ((iHashCode + (avatar != null ? avatar.hashCode() : 0)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            Avatar avatar = this.avatar;
            ViewerEdge viewerEdge = this.viewerEdge;
            CollectionFollowData collectionFollowData = this.collectionFollowData;
            CollectionMuteData collectionMuteData = this.collectionMuteData;
            StringBuilder sbU = y30.u("Collection(__typename=", str, ", id=", str2, ", name=");
            sbU.append(str3);
            sbU.append(", avatar=");
            sbU.append(avatar);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(", collectionFollowData=");
            sbU.append(collectionFollowData);
            sbU.append(", collectionMuteData=");
            sbU.append(collectionMuteData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BU\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\t\u0010\"\u001a\u00020\u0003HÆ\u0003J\t\u0010#\u001a\u00020\u0003HÆ\u0003J\u000b\u0010$\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010&\u001a\u00020\bHÆ\u0003J\u000b\u0010'\u001a\u0004\u0018\u00010\nHÆ\u0003J\t\u0010(\u001a\u00020\fHÆ\u0003J\t\u0010)\u001a\u00020\u000eHÆ\u0003J\t\u0010*\u001a\u00020\u0010HÆ\u0003Ji\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u0010HÆ\u0001J\u0013\u0010,\u001a\u00020-2\b\u0010.\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010/\u001a\u000200HÖ\u0001J\t\u00101\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0014R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0014R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0014R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0013\u0010\t\u001a\u0004\u0018\u00010\n¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0011\u0010\u000b\u001a\u00020\f¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u001dR\u0011\u0010\r\u001a\u00020\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010\u001fR\u0011\u0010\u000f\u001a\u00020\u0010¢\u0006\b\n\u0000\u001a\u0004\b \u0010!¨\u00062"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$Creator;", "", "__typename", "", "id", "name", "imageId", "viewerEdge", "Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;", "verifications", "Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;", "userFollowData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "userMuteData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "userNewsletterData", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;Lcom/medium/android/graphql/fragment/UserFollowData;Lcom/medium/android/graphql/fragment/UserMuteData;Lcom/medium/android/graphql/fragment/UserNewsletterData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getImageId", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;", "getVerifications", "()Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;", "getUserFollowData", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "getUserMuteData", "()Lcom/medium/android/graphql/fragment/UserMuteData;", "getUserNewsletterData", "()Lcom/medium/android/graphql/fragment/UserNewsletterData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final String name;
        private final UserFollowData userFollowData;
        private final UserMuteData userMuteData;
        private final UserNewsletterData userNewsletterData;
        private final Verifications verifications;
        private final ViewerEdge1 viewerEdge;

        public Creator(String str, String str2, String str3, String str4, ViewerEdge1 viewerEdge1, Verifications verifications, UserFollowData userFollowData, UserMuteData userMuteData, UserNewsletterData userNewsletterData) {
            str.getClass();
            str2.getClass();
            viewerEdge1.getClass();
            userFollowData.getClass();
            userMuteData.getClass();
            userNewsletterData.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.imageId = str4;
            this.viewerEdge = viewerEdge1;
            this.verifications = verifications;
            this.userFollowData = userFollowData;
            this.userMuteData = userMuteData;
            this.userNewsletterData = userNewsletterData;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, String str4, ViewerEdge1 viewerEdge1, Verifications verifications, UserFollowData userFollowData, UserMuteData userMuteData, UserNewsletterData userNewsletterData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            if ((i & 8) != 0) {
                str4 = creator.imageId;
            }
            if ((i & 16) != 0) {
                viewerEdge1 = creator.viewerEdge;
            }
            if ((i & 32) != 0) {
                verifications = creator.verifications;
            }
            if ((i & 64) != 0) {
                userFollowData = creator.userFollowData;
            }
            if ((i & 128) != 0) {
                userMuteData = creator.userMuteData;
            }
            if ((i & 256) != 0) {
                userNewsletterData = creator.userNewsletterData;
            }
            UserMuteData userMuteData2 = userMuteData;
            UserNewsletterData userNewsletterData2 = userNewsletterData;
            Verifications verifications2 = verifications;
            UserFollowData userFollowData2 = userFollowData;
            ViewerEdge1 viewerEdge12 = viewerEdge1;
            String str5 = str3;
            return creator.copy(str, str2, str5, str4, viewerEdge12, verifications2, userFollowData2, userMuteData2, userNewsletterData2);
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
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final ViewerEdge1 getViewerEdge() {
            return this.viewerEdge;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final Verifications getVerifications() {
            return this.verifications;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        /* JADX INFO: renamed from: component8, reason: from getter */
        public final UserMuteData getUserMuteData() {
            return this.userMuteData;
        }

        /* JADX INFO: renamed from: component9, reason: from getter */
        public final UserNewsletterData getUserNewsletterData() {
            return this.userNewsletterData;
        }

        public final Creator copy(String __typename, String id, String name, String imageId, ViewerEdge1 viewerEdge, Verifications verifications, UserFollowData userFollowData, UserMuteData userMuteData, UserNewsletterData userNewsletterData) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            userFollowData.getClass();
            userMuteData.getClass();
            userNewsletterData.getClass();
            return new Creator(__typename, id, name, imageId, viewerEdge, verifications, userFollowData, userMuteData, userNewsletterData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name) && g76.L(this.imageId, creator.imageId) && g76.L(this.viewerEdge, creator.viewerEdge) && g76.L(this.verifications, creator.verifications) && g76.L(this.userFollowData, creator.userFollowData) && g76.L(this.userMuteData, creator.userMuteData) && g76.L(this.userNewsletterData, creator.userNewsletterData);
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

        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final UserMuteData getUserMuteData() {
            return this.userMuteData;
        }

        public final UserNewsletterData getUserNewsletterData() {
            return this.userNewsletterData;
        }

        public final Verifications getVerifications() {
            return this.verifications;
        }

        public final ViewerEdge1 getViewerEdge() {
            return this.viewerEdge;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.imageId;
            int iHashCode2 = (this.viewerEdge.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
            Verifications verifications = this.verifications;
            return this.userNewsletterData.hashCode() + ((this.userMuteData.hashCode() + ((this.userFollowData.hashCode() + ((iHashCode2 + (verifications != null ? verifications.hashCode() : 0)) * 31)) * 31)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.imageId;
            ViewerEdge1 viewerEdge1 = this.viewerEdge;
            Verifications verifications = this.verifications;
            UserFollowData userFollowData = this.userFollowData;
            UserMuteData userMuteData = this.userMuteData;
            UserNewsletterData userNewsletterData = this.userNewsletterData;
            StringBuilder sbU = y30.u("Creator(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", imageId=", str4, ", viewerEdge=");
            sbU.append(viewerEdge1);
            sbU.append(", verifications=");
            sbU.append(verifications);
            sbU.append(", userFollowData=");
            sbU.append(userFollowData);
            sbU.append(", userMuteData=");
            sbU.append(userMuteData);
            sbU.append(", userNewsletterData=");
            sbU.append(userNewsletterData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u001f\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewContent;", "", "__typename", "", "subtitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getSubtitle", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class PreviewContent {
        private final String __typename;
        private final String subtitle;

        public PreviewContent(String str, String str2) {
            str.getClass();
            this.__typename = str;
            this.subtitle = str2;
        }

        public static /* synthetic */ PreviewContent copy$default(PreviewContent previewContent, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = previewContent.__typename;
            }
            if ((i & 2) != 0) {
                str2 = previewContent.subtitle;
            }
            return previewContent.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getSubtitle() {
            return this.subtitle;
        }

        public final PreviewContent copy(String __typename, String subtitle) {
            __typename.getClass();
            return new PreviewContent(__typename, subtitle);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof PreviewContent)) {
                return false;
            }
            PreviewContent previewContent = (PreviewContent) other;
            return g76.L(this.__typename, previewContent.__typename) && g76.L(this.subtitle, previewContent.subtitle);
        }

        public final String getSubtitle() {
            return this.subtitle;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.subtitle;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            return ev6.y("PreviewContent(__typename=", this.__typename, ", subtitle=", this.subtitle, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$PreviewImage;", "", "__typename", "", "id", "imageMetadataData", "Lcom/medium/android/graphql/fragment/ImageMetadataData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/ImageMetadataData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageMetadataData", "()Lcom/medium/android/graphql/fragment/ImageMetadataData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge;", "", "__typename", "", "isEditor", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final boolean isEditor;

        public ViewerEdge(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isEditor = z;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge.isEditor;
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
        public final boolean getIsEditor() {
            return this.isEditor;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, boolean isEditor, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, isEditor, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.isEditor == viewerEdge.isEditor && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (((this.__typename.hashCode() * 31) + (this.isEditor ? 1231 : 1237)) * 31);
        }

        public final boolean isEditor() {
            return this.isEditor;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isEditor;
            return ka1.v(ev6.D("ViewerEdge(__typename=", str, ", isEditor=", ", id=", z), this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewData$ViewerEdge1;", "", "__typename", "", "isUser", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge1 {
        private final String __typename;
        private final String id;
        private final boolean isUser;

        public ViewerEdge1(String str, boolean z, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isUser = z;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge1 copy$default(ViewerEdge1 viewerEdge1, String str, boolean z, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge1.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge1.isUser;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge1.id;
            }
            return viewerEdge1.copy(str, z, str2);
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

        public final ViewerEdge1 copy(String __typename, boolean isUser, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge1(__typename, isUser, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge1)) {
                return false;
            }
            ViewerEdge1 viewerEdge1 = (ViewerEdge1) other;
            return g76.L(this.__typename, viewerEdge1.__typename) && this.isUser == viewerEdge1.isUser && g76.L(this.id, viewerEdge1.id);
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
            return ka1.v(ev6.D("ViewerEdge1(__typename=", str, ", isUser=", ", id=", z), this.id, ")");
        }
    }

    public PostPreviewData(String str, String str2, String str3, PreviewContent previewContent, PreviewImage previewImage, Double d, Long l, Long l2, Long l3, String str4, Collection collection, Creator creator, PostClapsData postClapsData, ResponseCountData responseCountData, PostVisibilityData postVisibilityData, PostShareData postShareData, PostFeaturingStatusData postFeaturingStatusData, PostViewStateData postViewStateData, PostRepostCountData postRepostCountData) {
        str.getClass();
        str2.getClass();
        str4.getClass();
        postClapsData.getClass();
        responseCountData.getClass();
        postVisibilityData.getClass();
        postShareData.getClass();
        postFeaturingStatusData.getClass();
        postViewStateData.getClass();
        postRepostCountData.getClass();
        this.__typename = str;
        this.id = str2;
        this.title = str3;
        this.previewContent = previewContent;
        this.previewImage = previewImage;
        this.readingTime = d;
        this.pinnedByCreatorAt = l;
        this.firstPublishedAt = l2;
        this.updatedAt = l3;
        this.latestPublishedVersion = str4;
        this.collection = collection;
        this.creator = creator;
        this.postClapsData = postClapsData;
        this.responseCountData = responseCountData;
        this.postVisibilityData = postVisibilityData;
        this.postShareData = postShareData;
        this.postFeaturingStatusData = postFeaturingStatusData;
        this.postViewStateData = postViewStateData;
        this.postRepostCountData = postRepostCountData;
    }

    public static /* synthetic */ PostPreviewData copy$default(PostPreviewData postPreviewData, String str, String str2, String str3, PreviewContent previewContent, PreviewImage previewImage, Double d, Long l, Long l2, Long l3, String str4, Collection collection, Creator creator, PostClapsData postClapsData, ResponseCountData responseCountData, PostVisibilityData postVisibilityData, PostShareData postShareData, PostFeaturingStatusData postFeaturingStatusData, PostViewStateData postViewStateData, PostRepostCountData postRepostCountData, int i, Object obj) {
        PostRepostCountData postRepostCountData2;
        PostViewStateData postViewStateData2;
        String str5 = (i & 1) != 0 ? postPreviewData.__typename : str;
        String str6 = (i & 2) != 0 ? postPreviewData.id : str2;
        String str7 = (i & 4) != 0 ? postPreviewData.title : str3;
        PreviewContent previewContent2 = (i & 8) != 0 ? postPreviewData.previewContent : previewContent;
        PreviewImage previewImage2 = (i & 16) != 0 ? postPreviewData.previewImage : previewImage;
        Double d2 = (i & 32) != 0 ? postPreviewData.readingTime : d;
        Long l4 = (i & 64) != 0 ? postPreviewData.pinnedByCreatorAt : l;
        Long l5 = (i & 128) != 0 ? postPreviewData.firstPublishedAt : l2;
        Long l6 = (i & 256) != 0 ? postPreviewData.updatedAt : l3;
        String str8 = (i & 512) != 0 ? postPreviewData.latestPublishedVersion : str4;
        Collection collection2 = (i & 1024) != 0 ? postPreviewData.collection : collection;
        Creator creator2 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? postPreviewData.creator : creator;
        PostClapsData postClapsData2 = (i & 4096) != 0 ? postPreviewData.postClapsData : postClapsData;
        ResponseCountData responseCountData2 = (i & 8192) != 0 ? postPreviewData.responseCountData : responseCountData;
        String str9 = str5;
        PostVisibilityData postVisibilityData2 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? postPreviewData.postVisibilityData : postVisibilityData;
        PostShareData postShareData2 = (i & 32768) != 0 ? postPreviewData.postShareData : postShareData;
        PostFeaturingStatusData postFeaturingStatusData2 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? postPreviewData.postFeaturingStatusData : postFeaturingStatusData;
        PostViewStateData postViewStateData3 = (i & 131072) != 0 ? postPreviewData.postViewStateData : postViewStateData;
        if ((i & 262144) != 0) {
            postViewStateData2 = postViewStateData3;
            postRepostCountData2 = postPreviewData.postRepostCountData;
        } else {
            postRepostCountData2 = postRepostCountData;
            postViewStateData2 = postViewStateData3;
        }
        return postPreviewData.copy(str9, str6, str7, previewContent2, previewImage2, d2, l4, l5, l6, str8, collection2, creator2, postClapsData2, responseCountData2, postVisibilityData2, postShareData2, postFeaturingStatusData2, postViewStateData2, postRepostCountData2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final String getLatestPublishedVersion() {
        return this.latestPublishedVersion;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final Collection getCollection() {
        return this.collection;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final PostClapsData getPostClapsData() {
        return this.postClapsData;
    }

    /* JADX INFO: renamed from: component14, reason: from getter */
    public final ResponseCountData getResponseCountData() {
        return this.responseCountData;
    }

    /* JADX INFO: renamed from: component15, reason: from getter */
    public final PostVisibilityData getPostVisibilityData() {
        return this.postVisibilityData;
    }

    /* JADX INFO: renamed from: component16, reason: from getter */
    public final PostShareData getPostShareData() {
        return this.postShareData;
    }

    /* JADX INFO: renamed from: component17, reason: from getter */
    public final PostFeaturingStatusData getPostFeaturingStatusData() {
        return this.postFeaturingStatusData;
    }

    /* JADX INFO: renamed from: component18, reason: from getter */
    public final PostViewStateData getPostViewStateData() {
        return this.postViewStateData;
    }

    /* JADX INFO: renamed from: component19, reason: from getter */
    public final PostRepostCountData getPostRepostCountData() {
        return this.postRepostCountData;
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
    public final PreviewContent getPreviewContent() {
        return this.previewContent;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final PreviewImage getPreviewImage() {
        return this.previewImage;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Double getReadingTime() {
        return this.readingTime;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Long getPinnedByCreatorAt() {
        return this.pinnedByCreatorAt;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Long getUpdatedAt() {
        return this.updatedAt;
    }

    public final PostPreviewData copy(String __typename, String id, String title, PreviewContent previewContent, PreviewImage previewImage, Double readingTime, Long pinnedByCreatorAt, Long firstPublishedAt, Long updatedAt, String latestPublishedVersion, Collection collection, Creator creator, PostClapsData postClapsData, ResponseCountData responseCountData, PostVisibilityData postVisibilityData, PostShareData postShareData, PostFeaturingStatusData postFeaturingStatusData, PostViewStateData postViewStateData, PostRepostCountData postRepostCountData) {
        __typename.getClass();
        id.getClass();
        latestPublishedVersion.getClass();
        postClapsData.getClass();
        responseCountData.getClass();
        postVisibilityData.getClass();
        postShareData.getClass();
        postFeaturingStatusData.getClass();
        postViewStateData.getClass();
        postRepostCountData.getClass();
        return new PostPreviewData(__typename, id, title, previewContent, previewImage, readingTime, pinnedByCreatorAt, firstPublishedAt, updatedAt, latestPublishedVersion, collection, creator, postClapsData, responseCountData, postVisibilityData, postShareData, postFeaturingStatusData, postViewStateData, postRepostCountData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostPreviewData)) {
            return false;
        }
        PostPreviewData postPreviewData = (PostPreviewData) other;
        return g76.L(this.__typename, postPreviewData.__typename) && g76.L(this.id, postPreviewData.id) && g76.L(this.title, postPreviewData.title) && g76.L(this.previewContent, postPreviewData.previewContent) && g76.L(this.previewImage, postPreviewData.previewImage) && g76.L(this.readingTime, postPreviewData.readingTime) && g76.L(this.pinnedByCreatorAt, postPreviewData.pinnedByCreatorAt) && g76.L(this.firstPublishedAt, postPreviewData.firstPublishedAt) && g76.L(this.updatedAt, postPreviewData.updatedAt) && g76.L(this.latestPublishedVersion, postPreviewData.latestPublishedVersion) && g76.L(this.collection, postPreviewData.collection) && g76.L(this.creator, postPreviewData.creator) && g76.L(this.postClapsData, postPreviewData.postClapsData) && g76.L(this.responseCountData, postPreviewData.responseCountData) && g76.L(this.postVisibilityData, postPreviewData.postVisibilityData) && g76.L(this.postShareData, postPreviewData.postShareData) && g76.L(this.postFeaturingStatusData, postPreviewData.postFeaturingStatusData) && g76.L(this.postViewStateData, postPreviewData.postViewStateData) && g76.L(this.postRepostCountData, postPreviewData.postRepostCountData);
    }

    public final Collection getCollection() {
        return this.collection;
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final Long getFirstPublishedAt() {
        return this.firstPublishedAt;
    }

    public final String getId() {
        return this.id;
    }

    public final String getLatestPublishedVersion() {
        return this.latestPublishedVersion;
    }

    public final Long getPinnedByCreatorAt() {
        return this.pinnedByCreatorAt;
    }

    public final PostClapsData getPostClapsData() {
        return this.postClapsData;
    }

    public final PostFeaturingStatusData getPostFeaturingStatusData() {
        return this.postFeaturingStatusData;
    }

    public final PostRepostCountData getPostRepostCountData() {
        return this.postRepostCountData;
    }

    public final PostShareData getPostShareData() {
        return this.postShareData;
    }

    public final PostViewStateData getPostViewStateData() {
        return this.postViewStateData;
    }

    public final PostVisibilityData getPostVisibilityData() {
        return this.postVisibilityData;
    }

    public final PreviewContent getPreviewContent() {
        return this.previewContent;
    }

    public final PreviewImage getPreviewImage() {
        return this.previewImage;
    }

    public final Double getReadingTime() {
        return this.readingTime;
    }

    public final ResponseCountData getResponseCountData() {
        return this.responseCountData;
    }

    public final String getTitle() {
        return this.title;
    }

    public final Long getUpdatedAt() {
        return this.updatedAt;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.title;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        PreviewContent previewContent = this.previewContent;
        int iHashCode2 = (iHashCode + (previewContent == null ? 0 : previewContent.hashCode())) * 31;
        PreviewImage previewImage = this.previewImage;
        int iHashCode3 = (iHashCode2 + (previewImage == null ? 0 : previewImage.hashCode())) * 31;
        Double d = this.readingTime;
        int iHashCode4 = (iHashCode3 + (d == null ? 0 : d.hashCode())) * 31;
        Long l = this.pinnedByCreatorAt;
        int iHashCode5 = (iHashCode4 + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.firstPublishedAt;
        int iHashCode6 = (iHashCode5 + (l2 == null ? 0 : l2.hashCode())) * 31;
        Long l3 = this.updatedAt;
        int iO2 = wgd.o((iHashCode6 + (l3 == null ? 0 : l3.hashCode())) * 31, 31, this.latestPublishedVersion);
        Collection collection = this.collection;
        int iHashCode7 = (iO2 + (collection == null ? 0 : collection.hashCode())) * 31;
        Creator creator = this.creator;
        return this.postRepostCountData.hashCode() + ((this.postViewStateData.hashCode() + ((this.postFeaturingStatusData.hashCode() + ((this.postShareData.hashCode() + ((this.postVisibilityData.hashCode() + ((this.responseCountData.hashCode() + ((this.postClapsData.hashCode() + ((iHashCode7 + (creator != null ? creator.hashCode() : 0)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.title;
        PreviewContent previewContent = this.previewContent;
        PreviewImage previewImage = this.previewImage;
        Double d = this.readingTime;
        Long l = this.pinnedByCreatorAt;
        Long l2 = this.firstPublishedAt;
        Long l3 = this.updatedAt;
        String str4 = this.latestPublishedVersion;
        Collection collection = this.collection;
        Creator creator = this.creator;
        PostClapsData postClapsData = this.postClapsData;
        ResponseCountData responseCountData = this.responseCountData;
        PostVisibilityData postVisibilityData = this.postVisibilityData;
        PostShareData postShareData = this.postShareData;
        PostFeaturingStatusData postFeaturingStatusData = this.postFeaturingStatusData;
        PostViewStateData postViewStateData = this.postViewStateData;
        PostRepostCountData postRepostCountData = this.postRepostCountData;
        StringBuilder sbU = y30.u("PostPreviewData(__typename=", str, ", id=", str2, ", title=");
        sbU.append(str3);
        sbU.append(", previewContent=");
        sbU.append(previewContent);
        sbU.append(", previewImage=");
        sbU.append(previewImage);
        sbU.append(", readingTime=");
        sbU.append(d);
        sbU.append(", pinnedByCreatorAt=");
        sbU.append(l);
        sbU.append(", firstPublishedAt=");
        sbU.append(l2);
        sbU.append(", updatedAt=");
        sbU.append(l3);
        sbU.append(", latestPublishedVersion=");
        sbU.append(str4);
        sbU.append(", collection=");
        sbU.append(collection);
        sbU.append(", creator=");
        sbU.append(creator);
        sbU.append(", postClapsData=");
        sbU.append(postClapsData);
        sbU.append(", responseCountData=");
        sbU.append(responseCountData);
        sbU.append(", postVisibilityData=");
        sbU.append(postVisibilityData);
        sbU.append(", postShareData=");
        sbU.append(postShareData);
        sbU.append(", postFeaturingStatusData=");
        sbU.append(postFeaturingStatusData);
        sbU.append(", postViewStateData=");
        sbU.append(postViewStateData);
        sbU.append(", postRepostCountData=");
        sbU.append(postRepostCountData);
        sbU.append(")");
        return sbU.toString();
    }
}
