package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\fJ\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\fJ\u0010\u0010\u0010\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011JF\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001f\u0010\fR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b \u0010\fR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b!\u0010\fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\"\u001a\u0004\b#\u0010\u0011¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/fragment/NewsletterData;", "Lg15;", "", "__typename", "id", "name", "description", "Lcom/medium/android/graphql/fragment/NewsletterSubscriptionData;", "newsletterSubscriptionData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NewsletterSubscriptionData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "()Lcom/medium/android/graphql/fragment/NewsletterSubscriptionData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NewsletterSubscriptionData;)Lcom/medium/android/graphql/fragment/NewsletterData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "getDescription", "Lcom/medium/android/graphql/fragment/NewsletterSubscriptionData;", "getNewsletterSubscriptionData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class NewsletterData implements g15 {
    private final String __typename;
    private final String description;
    private final String id;
    private final String name;
    private final NewsletterSubscriptionData newsletterSubscriptionData;

    public NewsletterData(String str, String str2, String str3, String str4, NewsletterSubscriptionData newsletterSubscriptionData) {
        str.getClass();
        str2.getClass();
        newsletterSubscriptionData.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.description = str4;
        this.newsletterSubscriptionData = newsletterSubscriptionData;
    }

    public static /* synthetic */ NewsletterData copy$default(NewsletterData newsletterData, String str, String str2, String str3, String str4, NewsletterSubscriptionData newsletterSubscriptionData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = newsletterData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = newsletterData.id;
        }
        if ((i & 4) != 0) {
            str3 = newsletterData.name;
        }
        if ((i & 8) != 0) {
            str4 = newsletterData.description;
        }
        if ((i & 16) != 0) {
            newsletterSubscriptionData = newsletterData.newsletterSubscriptionData;
        }
        NewsletterSubscriptionData newsletterSubscriptionData2 = newsletterSubscriptionData;
        String str5 = str3;
        return newsletterData.copy(str, str2, str5, str4, newsletterSubscriptionData2);
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
    public final String getDescription() {
        return this.description;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final NewsletterSubscriptionData getNewsletterSubscriptionData() {
        return this.newsletterSubscriptionData;
    }

    public final NewsletterData copy(String __typename, String id, String name, String description, NewsletterSubscriptionData newsletterSubscriptionData) {
        __typename.getClass();
        id.getClass();
        newsletterSubscriptionData.getClass();
        return new NewsletterData(__typename, id, name, description, newsletterSubscriptionData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof NewsletterData)) {
            return false;
        }
        NewsletterData newsletterData = (NewsletterData) other;
        return g76.L(this.__typename, newsletterData.__typename) && g76.L(this.id, newsletterData.id) && g76.L(this.name, newsletterData.name) && g76.L(this.description, newsletterData.description) && g76.L(this.newsletterSubscriptionData, newsletterData.newsletterSubscriptionData);
    }

    public final String getDescription() {
        return this.description;
    }

    public final String getId() {
        return this.id;
    }

    public final String getName() {
        return this.name;
    }

    public final NewsletterSubscriptionData getNewsletterSubscriptionData() {
        return this.newsletterSubscriptionData;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.name;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.description;
        return this.newsletterSubscriptionData.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        String str4 = this.description;
        NewsletterSubscriptionData newsletterSubscriptionData = this.newsletterSubscriptionData;
        StringBuilder sbU = y30.u("NewsletterData(__typename=", str, ", id=", str2, ", name=");
        ka1.C(sbU, str3, ", description=", str4, ", newsletterSubscriptionData=");
        sbU.append(newsletterSubscriptionData);
        sbU.append(")");
        return sbU.toString();
    }
}
