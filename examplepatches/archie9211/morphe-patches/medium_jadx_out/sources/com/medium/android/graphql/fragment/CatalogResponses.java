package com.medium.android.graphql.fragment;

import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0012\b\u0086\b\u0018\u00002\u00020\u0001:\u000223BA\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0013J\u0010\u0010\u0015\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0018J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u0011JX\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\r\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001e\u0010\u0011J\u0010\u0010 \u001a\u00020\u001fHÖ\u0001¢\u0006\u0004\b \u0010!J\u001a\u0010$\u001a\u00020\u00042\b\u0010#\u001a\u0004\u0018\u00010\"HÖ\u0003¢\u0006\u0004\b$\u0010%R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010&\u001a\u0004\b'\u0010\u0011R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010(\u001a\u0004\b)\u0010\u0013R\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010(\u001a\u0004\b*\u0010\u0013R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010+\u001a\u0004\b,\u0010\u0016R\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010-\u001a\u0004\b.\u0010\u0018R\u0019\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010/\u001a\u0004\b0\u0010\u001aR\u0017\u0010\r\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\r\u0010&\u001a\u0004\b1\u0010\u0011¨\u00064"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponses;", "Lg15;", "", "__typename", "", "responsesLocked", "disallowResponses", "", "responsesCount", "Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;", "creator", "Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;", "threadedCatalogResponses", "id", "<init>", "(Ljava/lang/String;ZZJLcom/medium/android/graphql/fragment/CatalogResponses$Creator;Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "()Z", "component3", "component4", "()J", "component5", "()Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;", "component6", "()Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;", "component7", "copy", "(Ljava/lang/String;ZZJLcom/medium/android/graphql/fragment/CatalogResponses$Creator;Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CatalogResponses;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Z", "getResponsesLocked", "getDisallowResponses", "J", "getResponsesCount", "Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;", "getCreator", "Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;", "getThreadedCatalogResponses", "getId", "Creator", "ThreadedCatalogResponses", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogResponses implements g15 {
    private final String __typename;
    private final Creator creator;
    private final boolean disallowResponses;
    private final String id;
    private final long responsesCount;
    private final boolean responsesLocked;
    private final ThreadedCatalogResponses threadedCatalogResponses;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponses$Creator;", "", "__typename", "", "id", "name", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String name;

        public Creator(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.name;
            }
            return creator.copy(str, str2, str3);
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

        public final Creator copy(String __typename, String id, String name) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, name);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.name, creator.name);
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Creator(__typename=", str, ", id=", str2, ", name="), this.name, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponses$ThreadedCatalogResponses;", "", "__typename", "", "responseCatalogThreadData", "Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData;)V", "get__typename", "()Ljava/lang/String;", "getResponseCatalogThreadData", "()Lcom/medium/android/graphql/fragment/ResponseCatalogThreadData;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ThreadedCatalogResponses {
        private final String __typename;
        private final ResponseCatalogThreadData responseCatalogThreadData;

        public ThreadedCatalogResponses(String str, ResponseCatalogThreadData responseCatalogThreadData) {
            str.getClass();
            responseCatalogThreadData.getClass();
            this.__typename = str;
            this.responseCatalogThreadData = responseCatalogThreadData;
        }

        public static /* synthetic */ ThreadedCatalogResponses copy$default(ThreadedCatalogResponses threadedCatalogResponses, String str, ResponseCatalogThreadData responseCatalogThreadData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = threadedCatalogResponses.__typename;
            }
            if ((i & 2) != 0) {
                responseCatalogThreadData = threadedCatalogResponses.responseCatalogThreadData;
            }
            return threadedCatalogResponses.copy(str, responseCatalogThreadData);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final ResponseCatalogThreadData getResponseCatalogThreadData() {
            return this.responseCatalogThreadData;
        }

        public final ThreadedCatalogResponses copy(String __typename, ResponseCatalogThreadData responseCatalogThreadData) {
            __typename.getClass();
            responseCatalogThreadData.getClass();
            return new ThreadedCatalogResponses(__typename, responseCatalogThreadData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ThreadedCatalogResponses)) {
                return false;
            }
            ThreadedCatalogResponses threadedCatalogResponses = (ThreadedCatalogResponses) other;
            return g76.L(this.__typename, threadedCatalogResponses.__typename) && g76.L(this.responseCatalogThreadData, threadedCatalogResponses.responseCatalogThreadData);
        }

        public final ResponseCatalogThreadData getResponseCatalogThreadData() {
            return this.responseCatalogThreadData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.responseCatalogThreadData.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "ThreadedCatalogResponses(__typename=" + this.__typename + ", responseCatalogThreadData=" + this.responseCatalogThreadData + ")";
        }
    }

    public CatalogResponses(String str, boolean z, boolean z2, long j, Creator creator, ThreadedCatalogResponses threadedCatalogResponses, String str2) {
        str.getClass();
        creator.getClass();
        str2.getClass();
        this.__typename = str;
        this.responsesLocked = z;
        this.disallowResponses = z2;
        this.responsesCount = j;
        this.creator = creator;
        this.threadedCatalogResponses = threadedCatalogResponses;
        this.id = str2;
    }

    public static /* synthetic */ CatalogResponses copy$default(CatalogResponses catalogResponses, String str, boolean z, boolean z2, long j, Creator creator, ThreadedCatalogResponses threadedCatalogResponses, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogResponses.__typename;
        }
        if ((i & 2) != 0) {
            z = catalogResponses.responsesLocked;
        }
        if ((i & 4) != 0) {
            z2 = catalogResponses.disallowResponses;
        }
        if ((i & 8) != 0) {
            j = catalogResponses.responsesCount;
        }
        if ((i & 16) != 0) {
            creator = catalogResponses.creator;
        }
        if ((i & 32) != 0) {
            threadedCatalogResponses = catalogResponses.threadedCatalogResponses;
        }
        if ((i & 64) != 0) {
            str2 = catalogResponses.id;
        }
        String str3 = str2;
        Creator creator2 = creator;
        long j2 = j;
        boolean z3 = z2;
        return catalogResponses.copy(str, z, z3, j2, creator2, threadedCatalogResponses, str3);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final boolean getResponsesLocked() {
        return this.responsesLocked;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final boolean getDisallowResponses() {
        return this.disallowResponses;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final long getResponsesCount() {
        return this.responsesCount;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final ThreadedCatalogResponses getThreadedCatalogResponses() {
        return this.threadedCatalogResponses;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final CatalogResponses copy(String __typename, boolean responsesLocked, boolean disallowResponses, long responsesCount, Creator creator, ThreadedCatalogResponses threadedCatalogResponses, String id) {
        __typename.getClass();
        creator.getClass();
        id.getClass();
        return new CatalogResponses(__typename, responsesLocked, disallowResponses, responsesCount, creator, threadedCatalogResponses, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogResponses)) {
            return false;
        }
        CatalogResponses catalogResponses = (CatalogResponses) other;
        return g76.L(this.__typename, catalogResponses.__typename) && this.responsesLocked == catalogResponses.responsesLocked && this.disallowResponses == catalogResponses.disallowResponses && this.responsesCount == catalogResponses.responsesCount && g76.L(this.creator, catalogResponses.creator) && g76.L(this.threadedCatalogResponses, catalogResponses.threadedCatalogResponses) && g76.L(this.id, catalogResponses.id);
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final boolean getDisallowResponses() {
        return this.disallowResponses;
    }

    public final String getId() {
        return this.id;
    }

    public final long getResponsesCount() {
        return this.responsesCount;
    }

    public final boolean getResponsesLocked() {
        return this.responsesLocked;
    }

    public final ThreadedCatalogResponses getThreadedCatalogResponses() {
        return this.threadedCatalogResponses;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = ((this.__typename.hashCode() * 31) + (this.responsesLocked ? 1231 : 1237)) * 31;
        int i = this.disallowResponses ? 1231 : 1237;
        long j = this.responsesCount;
        int iHashCode2 = (this.creator.hashCode() + ((((iHashCode + i) * 31) + ((int) (j ^ (j >>> 32)))) * 31)) * 31;
        ThreadedCatalogResponses threadedCatalogResponses = this.threadedCatalogResponses;
        return this.id.hashCode() + ((iHashCode2 + (threadedCatalogResponses == null ? 0 : threadedCatalogResponses.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        boolean z = this.responsesLocked;
        boolean z2 = this.disallowResponses;
        long j = this.responsesCount;
        Creator creator = this.creator;
        ThreadedCatalogResponses threadedCatalogResponses = this.threadedCatalogResponses;
        String str2 = this.id;
        StringBuilder sbD = ev6.D("CatalogResponses(__typename=", str, ", responsesLocked=", ", disallowResponses=", z);
        sbD.append(z2);
        sbD.append(", responsesCount=");
        sbD.append(j);
        sbD.append(", creator=");
        sbD.append(creator);
        sbD.append(", threadedCatalogResponses=");
        sbD.append(threadedCatalogResponses);
        return y30.s(sbD, ", id=", str2, ")");
    }
}
