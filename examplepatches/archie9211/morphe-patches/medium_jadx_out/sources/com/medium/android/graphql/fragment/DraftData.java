package com.medium.android.graphql.fragment;

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
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0013\b\u0086\b\u0018\u00002\u00020\u0001:\u0003345BY\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\n\u001a\u00020\t\u0012\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00020\u000b¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J\u0012\u0010\u0015\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0012J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0012J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\u0016\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\f0\u000bHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0016\u0010\u001c\u001a\b\u0012\u0004\u0012\u00020\u00020\u000bHÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001bJr\u0010\u001d\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\n\u001a\u00020\t2\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\u000e\b\u0002\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00020\u000bHÆ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001f\u0010\u0012J\u0010\u0010!\u001a\u00020 HÖ\u0001¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\t2\b\u0010$\u001a\u0004\u0018\u00010#HÖ\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010'\u001a\u0004\b(\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010)\u001a\u0004\b*\u0010\u0014R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010'\u001a\u0004\b+\u0010\u0012R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010'\u001a\u0004\b,\u0010\u0012R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\b\u0010'\u001a\u0004\b-\u0010\u0012R\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010.\u001a\u0004\b/\u0010\u0019R\u001d\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b8\u0006¢\u0006\f\n\u0004\b\r\u00100\u001a\u0004\b1\u0010\u001bR\u001d\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00020\u000b8\u0006¢\u0006\f\n\u0004\b\u000e\u00100\u001a\u0004\b2\u0010\u001b¨\u00066"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/DraftData$Creator;", "creator", "title", "featuredImageId", "subtitle", "", "curationEligible", "", "Lcom/medium/android/graphql/fragment/DraftData$Tag;", "tags", "imageIds", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/DraftData$Creator;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/DraftData$Creator;", "component3", "component4", "component5", "component6", "()Z", "component7", "()Ljava/util/List;", "component8", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/DraftData$Creator;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;)Lcom/medium/android/graphql/fragment/DraftData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/DraftData$Creator;", "getCreator", "getTitle", "getFeaturedImageId", "getSubtitle", "Z", "getCurationEligible", "Ljava/util/List;", "getTags", "getImageIds", "Creator", "Tag", "NewsletterV3", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class DraftData implements g15 {
    private final String __typename;
    private final Creator creator;
    private final boolean curationEligible;
    private final String featuredImageId;
    private final List<String> imageIds;
    private final String subtitle;
    private final List<Tag> tags;
    private final String title;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\bHÆ\u0003JA\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\bHÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftData$Creator;", "", "__typename", "", "id", "name", "imageId", "newsletterV3", "Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getImageId", "getNewsletterV3", "()Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final String name;
        private final NewsletterV3 newsletterV3;

        public Creator(String str, String str2, String str3, String str4, NewsletterV3 newsletterV3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.imageId = str4;
            this.newsletterV3 = newsletterV3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, String str4, NewsletterV3 newsletterV3, int i, Object obj) {
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
                newsletterV3 = creator.newsletterV3;
            }
            NewsletterV3 newsletterV32 = newsletterV3;
            String str5 = str3;
            return creator.copy(str, str2, str5, str4, newsletterV32);
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
        public final NewsletterV3 getNewsletterV3() {
            return this.newsletterV3;
        }

        public final Creator copy(String __typename, String id, String name, String imageId, NewsletterV3 newsletterV3) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name, imageId, newsletterV3);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name) && g76.L(this.imageId, creator.imageId) && g76.L(this.newsletterV3, creator.newsletterV3);
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

        public final NewsletterV3 getNewsletterV3() {
            return this.newsletterV3;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.imageId;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            NewsletterV3 newsletterV3 = this.newsletterV3;
            return iHashCode2 + (newsletterV3 != null ? newsletterV3.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            String str4 = this.imageId;
            NewsletterV3 newsletterV3 = this.newsletterV3;
            StringBuilder sbU = y30.u("Creator(__typename=", str, ", id=", str2, ", name=");
            ka1.C(sbU, str3, ", imageId=", str4, ", newsletterV3=");
            sbU.append(newsletterV3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;", "", "__typename", "", "subscribersCount", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getSubscribersCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getId", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/DraftData$NewsletterV3;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class NewsletterV3 {
        private final String __typename;
        private final String id;
        private final Integer subscribersCount;

        public NewsletterV3(String str, Integer num, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.subscribersCount = num;
            this.id = str2;
        }

        public static /* synthetic */ NewsletterV3 copy$default(NewsletterV3 newsletterV3, String str, Integer num, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = newsletterV3.__typename;
            }
            if ((i & 2) != 0) {
                num = newsletterV3.subscribersCount;
            }
            if ((i & 4) != 0) {
                str2 = newsletterV3.id;
            }
            return newsletterV3.copy(str, num, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getSubscribersCount() {
            return this.subscribersCount;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final NewsletterV3 copy(String __typename, Integer subscribersCount, String id) {
            __typename.getClass();
            id.getClass();
            return new NewsletterV3(__typename, subscribersCount, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NewsletterV3)) {
                return false;
            }
            NewsletterV3 newsletterV3 = (NewsletterV3) other;
            return g76.L(this.__typename, newsletterV3.__typename) && g76.L(this.subscribersCount, newsletterV3.subscribersCount) && g76.L(this.id, newsletterV3.id);
        }

        public final String getId() {
            return this.id;
        }

        public final Integer getSubscribersCount() {
            return this.subscribersCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.subscribersCount;
            return this.id.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Integer num = this.subscribersCount;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("NewsletterV3(__typename=");
            sb.append(str);
            sb.append(", subscribersCount=");
            sb.append(num);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/DraftData$Tag;", "", "__typename", "", "normalizedTagSlug", "tagData", "Lcom/medium/android/graphql/fragment/TagData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/TagData;)V", "get__typename", "()Ljava/lang/String;", "getNormalizedTagSlug", "getTagData", "()Lcom/medium/android/graphql/fragment/TagData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Tag {
        private final String __typename;
        private final String normalizedTagSlug;
        private final TagData tagData;

        public Tag(String str, String str2, TagData tagData) {
            lv8.C(str, str2, tagData);
            this.__typename = str;
            this.normalizedTagSlug = str2;
            this.tagData = tagData;
        }

        public static /* synthetic */ Tag copy$default(Tag tag, String str, String str2, TagData tagData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = tag.__typename;
            }
            if ((i & 2) != 0) {
                str2 = tag.normalizedTagSlug;
            }
            if ((i & 4) != 0) {
                tagData = tag.tagData;
            }
            return tag.copy(str, str2, tagData);
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

        public final Tag copy(String __typename, String normalizedTagSlug, TagData tagData) {
            __typename.getClass();
            normalizedTagSlug.getClass();
            tagData.getClass();
            return new Tag(__typename, normalizedTagSlug, tagData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Tag)) {
                return false;
            }
            Tag tag = (Tag) other;
            return g76.L(this.__typename, tag.__typename) && g76.L(this.normalizedTagSlug, tag.normalizedTagSlug) && g76.L(this.tagData, tag.tagData);
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
            StringBuilder sbU = y30.u("Tag(__typename=", str, ", normalizedTagSlug=", str2, ", tagData=");
            sbU.append(tagData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public DraftData(String str, Creator creator, String str2, String str3, String str4, boolean z, List<Tag> list, List<String> list2) {
        str.getClass();
        creator.getClass();
        list.getClass();
        list2.getClass();
        this.__typename = str;
        this.creator = creator;
        this.title = str2;
        this.featuredImageId = str3;
        this.subtitle = str4;
        this.curationEligible = z;
        this.tags = list;
        this.imageIds = list2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DraftData copy$default(DraftData draftData, String str, Creator creator, String str2, String str3, String str4, boolean z, List list, List list2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = draftData.__typename;
        }
        if ((i & 2) != 0) {
            creator = draftData.creator;
        }
        if ((i & 4) != 0) {
            str2 = draftData.title;
        }
        if ((i & 8) != 0) {
            str3 = draftData.featuredImageId;
        }
        if ((i & 16) != 0) {
            str4 = draftData.subtitle;
        }
        if ((i & 32) != 0) {
            z = draftData.curationEligible;
        }
        if ((i & 64) != 0) {
            list = draftData.tags;
        }
        if ((i & 128) != 0) {
            list2 = draftData.imageIds;
        }
        List list3 = list;
        List list4 = list2;
        String str5 = str4;
        boolean z2 = z;
        return draftData.copy(str, creator, str2, str3, str5, z2, list3, list4);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getFeaturedImageId() {
        return this.featuredImageId;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getSubtitle() {
        return this.subtitle;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final boolean getCurationEligible() {
        return this.curationEligible;
    }

    public final List<Tag> component7() {
        return this.tags;
    }

    public final List<String> component8() {
        return this.imageIds;
    }

    public final DraftData copy(String __typename, Creator creator, String title, String featuredImageId, String subtitle, boolean curationEligible, List<Tag> tags, List<String> imageIds) {
        __typename.getClass();
        creator.getClass();
        tags.getClass();
        imageIds.getClass();
        return new DraftData(__typename, creator, title, featuredImageId, subtitle, curationEligible, tags, imageIds);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DraftData)) {
            return false;
        }
        DraftData draftData = (DraftData) other;
        return g76.L(this.__typename, draftData.__typename) && g76.L(this.creator, draftData.creator) && g76.L(this.title, draftData.title) && g76.L(this.featuredImageId, draftData.featuredImageId) && g76.L(this.subtitle, draftData.subtitle) && this.curationEligible == draftData.curationEligible && g76.L(this.tags, draftData.tags) && g76.L(this.imageIds, draftData.imageIds);
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final boolean getCurationEligible() {
        return this.curationEligible;
    }

    public final String getFeaturedImageId() {
        return this.featuredImageId;
    }

    public final List<String> getImageIds() {
        return this.imageIds;
    }

    public final String getSubtitle() {
        return this.subtitle;
    }

    public final List<Tag> getTags() {
        return this.tags;
    }

    public final String getTitle() {
        return this.title;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = (this.creator.hashCode() + (this.__typename.hashCode() * 31)) * 31;
        String str = this.title;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.featuredImageId;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.subtitle;
        return this.imageIds.hashCode() + wgd.p((((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 31) + (this.curationEligible ? 1231 : 1237)) * 31, 31, this.tags);
    }

    public final String toString() {
        String str = this.__typename;
        Creator creator = this.creator;
        String str2 = this.title;
        String str3 = this.featuredImageId;
        String str4 = this.subtitle;
        boolean z = this.curationEligible;
        List<Tag> list = this.tags;
        List<String> list2 = this.imageIds;
        StringBuilder sb = new StringBuilder("DraftData(__typename=");
        sb.append(str);
        sb.append(", creator=");
        sb.append(creator);
        sb.append(", title=");
        ka1.C(sb, str2, ", featuredImageId=", str3, ", subtitle=");
        ka1.D(sb, str4, ", curationEligible=", z, ", tags=");
        sb.append(list);
        sb.append(", imageIds=");
        sb.append(list2);
        sb.append(")");
        return sb.toString();
    }
}
