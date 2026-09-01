package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001eB!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0012\u0010\f\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ0\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\r¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/fragment/CollectionNewsletterData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;", "newsletterV3", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;)Lcom/medium/android/graphql/fragment/CollectionNewsletterData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;", "getNewsletterV3", "NewsletterV3", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CollectionNewsletterData implements g15 {
    private final String __typename;
    private final String id;
    private final NewsletterV3 newsletterV3;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000eJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\bHÆ\u0003J8\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001¢\u0006\u0002\u0010\u0018J\u0013\u0010\u0019\u001a\u00020\u00052\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\u000f\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u001e"}, d2 = {"Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;", "", "__typename", "", "showPromo", "", "id", "newsletterData", "Lcom/medium/android/graphql/fragment/NewsletterData;", "<init>", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NewsletterData;)V", "get__typename", "()Ljava/lang/String;", "getShowPromo", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "getId", "getNewsletterData", "()Lcom/medium/android/graphql/fragment/NewsletterData;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NewsletterData;)Lcom/medium/android/graphql/fragment/CollectionNewsletterData$NewsletterV3;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class NewsletterV3 {
        private final String __typename;
        private final String id;
        private final NewsletterData newsletterData;
        private final Boolean showPromo;

        public NewsletterV3(String str, Boolean bool, String str2, NewsletterData newsletterData) {
            str.getClass();
            str2.getClass();
            newsletterData.getClass();
            this.__typename = str;
            this.showPromo = bool;
            this.id = str2;
            this.newsletterData = newsletterData;
        }

        public static /* synthetic */ NewsletterV3 copy$default(NewsletterV3 newsletterV3, String str, Boolean bool, String str2, NewsletterData newsletterData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = newsletterV3.__typename;
            }
            if ((i & 2) != 0) {
                bool = newsletterV3.showPromo;
            }
            if ((i & 4) != 0) {
                str2 = newsletterV3.id;
            }
            if ((i & 8) != 0) {
                newsletterData = newsletterV3.newsletterData;
            }
            return newsletterV3.copy(str, bool, str2, newsletterData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Boolean getShowPromo() {
            return this.showPromo;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final NewsletterData getNewsletterData() {
            return this.newsletterData;
        }

        public final NewsletterV3 copy(String __typename, Boolean showPromo, String id, NewsletterData newsletterData) {
            __typename.getClass();
            id.getClass();
            newsletterData.getClass();
            return new NewsletterV3(__typename, showPromo, id, newsletterData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NewsletterV3)) {
                return false;
            }
            NewsletterV3 newsletterV3 = (NewsletterV3) other;
            return g76.L(this.__typename, newsletterV3.__typename) && g76.L(this.showPromo, newsletterV3.showPromo) && g76.L(this.id, newsletterV3.id) && g76.L(this.newsletterData, newsletterV3.newsletterData);
        }

        public final String getId() {
            return this.id;
        }

        public final NewsletterData getNewsletterData() {
            return this.newsletterData;
        }

        public final Boolean getShowPromo() {
            return this.showPromo;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Boolean bool = this.showPromo;
            return this.newsletterData.hashCode() + wgd.o((iHashCode + (bool == null ? 0 : bool.hashCode())) * 31, 31, this.id);
        }

        public final String toString() {
            return "NewsletterV3(__typename=" + this.__typename + ", showPromo=" + this.showPromo + ", id=" + this.id + ", newsletterData=" + this.newsletterData + ")";
        }
    }

    public CollectionNewsletterData(String str, String str2, NewsletterV3 newsletterV3) {
        str.getClass();
        str2.getClass();
        this.__typename = str;
        this.id = str2;
        this.newsletterV3 = newsletterV3;
    }

    public static /* synthetic */ CollectionNewsletterData copy$default(CollectionNewsletterData collectionNewsletterData, String str, String str2, NewsletterV3 newsletterV3, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionNewsletterData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = collectionNewsletterData.id;
        }
        if ((i & 4) != 0) {
            newsletterV3 = collectionNewsletterData.newsletterV3;
        }
        return collectionNewsletterData.copy(str, str2, newsletterV3);
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
    public final NewsletterV3 getNewsletterV3() {
        return this.newsletterV3;
    }

    public final CollectionNewsletterData copy(String __typename, String id, NewsletterV3 newsletterV3) {
        __typename.getClass();
        id.getClass();
        return new CollectionNewsletterData(__typename, id, newsletterV3);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CollectionNewsletterData)) {
            return false;
        }
        CollectionNewsletterData collectionNewsletterData = (CollectionNewsletterData) other;
        return g76.L(this.__typename, collectionNewsletterData.__typename) && g76.L(this.id, collectionNewsletterData.id) && g76.L(this.newsletterV3, collectionNewsletterData.newsletterV3);
    }

    public final String getId() {
        return this.id;
    }

    public final NewsletterV3 getNewsletterV3() {
        return this.newsletterV3;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        NewsletterV3 newsletterV3 = this.newsletterV3;
        return iO + (newsletterV3 == null ? 0 : newsletterV3.hashCode());
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        NewsletterV3 newsletterV3 = this.newsletterV3;
        StringBuilder sbU = y30.u("CollectionNewsletterData(__typename=", str, ", id=", str2, ", newsletterV3=");
        sbU.append(newsletterV3);
        sbU.append(")");
        return sbU.toString();
    }
}
