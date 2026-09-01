package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0018\b\u0086\b\u0018\u00002\u00020\u0001:\u0003ABCBY\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\b\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\u0006\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0016J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0016J\u0010\u0010\u0019\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001cJ\u0010\u0010\u001e\u001a\u00020\u000bHÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0010\u0010 \u001a\u00020\rHÆ\u0003¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u000fHÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0011HÆ\u0003¢\u0006\u0004\b$\u0010%Jv\u0010&\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\n\u001a\u00020\b2\b\b\u0002\u0010\f\u001a\u00020\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\r2\b\b\u0002\u0010\u0010\u001a\u00020\u000f2\b\b\u0002\u0010\u0012\u001a\u00020\u0011HÆ\u0001¢\u0006\u0004\b&\u0010'J\u0010\u0010(\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b(\u0010\u0016J\u0010\u0010*\u001a\u00020)HÖ\u0001¢\u0006\u0004\b*\u0010+J\u001a\u0010.\u001a\u00020\u00062\b\u0010-\u001a\u0004\u0018\u00010,HÖ\u0003¢\u0006\u0004\b.\u0010/R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00100\u001a\u0004\b1\u0010\u0016R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00100\u001a\u0004\b2\u0010\u0016R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00100\u001a\u0004\b3\u0010\u0016R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u00104\u001a\u0004\b5\u0010\u001aR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u00106\u001a\u0004\b7\u0010\u001cR\u0017\u0010\n\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\n\u00106\u001a\u0004\b8\u0010\u001cR\u0017\u0010\f\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b\f\u00109\u001a\u0004\b:\u0010\u001fR\u0017\u0010\u000e\u001a\u00020\r8\u0006¢\u0006\f\n\u0004\b\u000e\u0010;\u001a\u0004\b<\u0010!R\u0017\u0010\u0010\u001a\u00020\u000f8\u0006¢\u0006\f\n\u0004\b\u0010\u0010=\u001a\u0004\b>\u0010#R\u0017\u0010\u0012\u001a\u00020\u00118\u0006¢\u0006\f\n\u0004\b\u0012\u0010?\u001a\u0004\b@\u0010%¨\u0006D"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogDetailData;", "Lg15;", "", "__typename", "id", "description", "", "disallowResponses", "", "itemsLastInsertedAt", "responsesCount", "Lcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;", "viewerEdge", "Lcom/medium/android/graphql/fragment/CatalogDetailData$Creator;", "creator", "Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "catalogSummaryData", "Lcom/medium/android/graphql/fragment/CatalogClapsData;", "catalogClapsData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJJLcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;Lcom/medium/android/graphql/fragment/CatalogDetailData$Creator;Lcom/medium/android/graphql/fragment/CatalogSummaryData;Lcom/medium/android/graphql/fragment/CatalogClapsData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Z", "component5", "()J", "component6", "component7", "()Lcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;", "component8", "()Lcom/medium/android/graphql/fragment/CatalogDetailData$Creator;", "component9", "()Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "component10", "()Lcom/medium/android/graphql/fragment/CatalogClapsData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJJLcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;Lcom/medium/android/graphql/fragment/CatalogDetailData$Creator;Lcom/medium/android/graphql/fragment/CatalogSummaryData;Lcom/medium/android/graphql/fragment/CatalogClapsData;)Lcom/medium/android/graphql/fragment/CatalogDetailData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getDescription", "Z", "getDisallowResponses", "J", "getItemsLastInsertedAt", "getResponsesCount", "Lcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;", "getViewerEdge", "Lcom/medium/android/graphql/fragment/CatalogDetailData$Creator;", "getCreator", "Lcom/medium/android/graphql/fragment/CatalogSummaryData;", "getCatalogSummaryData", "Lcom/medium/android/graphql/fragment/CatalogClapsData;", "getCatalogClapsData", "ViewerEdge", "Creator", "Membership", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogDetailData implements g15 {
    private final String __typename;
    private final CatalogClapsData catalogClapsData;
    private final CatalogSummaryData catalogSummaryData;
    private final Creator creator;
    private final String description;
    private final boolean disallowResponses;
    private final String id;
    private final long itemsLastInsertedAt;
    private final long responsesCount;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J5\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogDetailData$Creator;", "", "__typename", "", "bio", "membership", "Lcom/medium/android/graphql/fragment/CatalogDetailData$Membership;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CatalogDetailData$Membership;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getBio", "getMembership", "()Lcom/medium/android/graphql/fragment/CatalogDetailData$Membership;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String bio;
        private final String id;
        private final Membership membership;

        public Creator(String str, String str2, Membership membership, String str3) {
            str.getClass();
            str3.getClass();
            this.__typename = str;
            this.bio = str2;
            this.membership = membership;
            this.id = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, Membership membership, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.bio;
            }
            if ((i & 4) != 0) {
                membership = creator.membership;
            }
            if ((i & 8) != 0) {
                str3 = creator.id;
            }
            return creator.copy(str, str2, membership, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getBio() {
            return this.bio;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Membership getMembership() {
            return this.membership;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Creator copy(String __typename, String bio, Membership membership, String id) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, bio, membership, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.bio, creator.bio) && g76.L(this.membership, creator.membership) && g76.L(this.id, creator.id);
        }

        public final String getBio() {
            return this.bio;
        }

        public final String getId() {
            return this.id;
        }

        public final Membership getMembership() {
            return this.membership;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            String str = this.bio;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            Membership membership = this.membership;
            return this.id.hashCode() + ((iHashCode2 + (membership != null ? membership.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.bio;
            Membership membership = this.membership;
            String str3 = this.id;
            StringBuilder sbU = y30.u("Creator(__typename=", str, ", bio=", str2, ", membership=");
            sbU.append(membership);
            sbU.append(", id=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogDetailData$Membership;", "", "__typename", "", "membershipFragment", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "get__typename", "()Ljava/lang/String;", "getMembershipFragment", "()Lcom/medium/android/graphql/fragment/MembershipFragment;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Membership {
        private final String __typename;
        private final MembershipFragment membershipFragment;

        public Membership(String str, MembershipFragment membershipFragment) {
            str.getClass();
            membershipFragment.getClass();
            this.__typename = str;
            this.membershipFragment = membershipFragment;
        }

        public static /* synthetic */ Membership copy$default(Membership membership, String str, MembershipFragment membershipFragment, int i, Object obj) {
            if ((i & 1) != 0) {
                str = membership.__typename;
            }
            if ((i & 2) != 0) {
                membershipFragment = membership.membershipFragment;
            }
            return membership.copy(str, membershipFragment);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MembershipFragment getMembershipFragment() {
            return this.membershipFragment;
        }

        public final Membership copy(String __typename, MembershipFragment membershipFragment) {
            __typename.getClass();
            membershipFragment.getClass();
            return new Membership(__typename, membershipFragment);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Membership)) {
                return false;
            }
            Membership membership = (Membership) other;
            return g76.L(this.__typename, membership.__typename) && g76.L(this.membershipFragment, membership.membershipFragment);
        }

        public final MembershipFragment getMembershipFragment() {
            return this.membershipFragment;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.membershipFragment.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Membership(__typename=" + this.__typename + ", membershipFragment=" + this.membershipFragment + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\fJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J.\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0013J\u0013\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0017\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\r\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;", "", "__typename", "", "followersCount", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getFollowersCount", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "getId", "component1", "component2", "component3", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/CatalogDetailData$ViewerEdge;", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final Integer followersCount;
        private final String id;

        public ViewerEdge(String str, Integer num, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.followersCount = num;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, Integer num, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                num = viewerEdge.followersCount;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, num, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getFollowersCount() {
            return this.followersCount;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, Integer followersCount, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, followersCount, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.followersCount, viewerEdge.followersCount) && g76.L(this.id, viewerEdge.id);
        }

        public final Integer getFollowersCount() {
            return this.followersCount;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Integer num = this.followersCount;
            return this.id.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            Integer num = this.followersCount;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", followersCount=");
            sb.append(num);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public CatalogDetailData(String str, String str2, String str3, boolean z, long j, long j2, ViewerEdge viewerEdge, Creator creator, CatalogSummaryData catalogSummaryData, CatalogClapsData catalogClapsData) {
        str.getClass();
        str2.getClass();
        viewerEdge.getClass();
        creator.getClass();
        catalogSummaryData.getClass();
        catalogClapsData.getClass();
        this.__typename = str;
        this.id = str2;
        this.description = str3;
        this.disallowResponses = z;
        this.itemsLastInsertedAt = j;
        this.responsesCount = j2;
        this.viewerEdge = viewerEdge;
        this.creator = creator;
        this.catalogSummaryData = catalogSummaryData;
        this.catalogClapsData = catalogClapsData;
    }

    public static /* synthetic */ CatalogDetailData copy$default(CatalogDetailData catalogDetailData, String str, String str2, String str3, boolean z, long j, long j2, ViewerEdge viewerEdge, Creator creator, CatalogSummaryData catalogSummaryData, CatalogClapsData catalogClapsData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = catalogDetailData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = catalogDetailData.id;
        }
        if ((i & 4) != 0) {
            str3 = catalogDetailData.description;
        }
        if ((i & 8) != 0) {
            z = catalogDetailData.disallowResponses;
        }
        if ((i & 16) != 0) {
            j = catalogDetailData.itemsLastInsertedAt;
        }
        if ((i & 32) != 0) {
            j2 = catalogDetailData.responsesCount;
        }
        if ((i & 64) != 0) {
            viewerEdge = catalogDetailData.viewerEdge;
        }
        if ((i & 128) != 0) {
            creator = catalogDetailData.creator;
        }
        if ((i & 256) != 0) {
            catalogSummaryData = catalogDetailData.catalogSummaryData;
        }
        if ((i & 512) != 0) {
            catalogClapsData = catalogDetailData.catalogClapsData;
        }
        long j3 = j2;
        long j4 = j;
        String str4 = str3;
        boolean z2 = z;
        return catalogDetailData.copy(str, str2, str4, z2, j4, j3, viewerEdge, creator, catalogSummaryData, catalogClapsData);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final CatalogClapsData getCatalogClapsData() {
        return this.catalogClapsData;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getDescription() {
        return this.description;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final boolean getDisallowResponses() {
        return this.disallowResponses;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final long getItemsLastInsertedAt() {
        return this.itemsLastInsertedAt;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final long getResponsesCount() {
        return this.responsesCount;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final Creator getCreator() {
        return this.creator;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final CatalogSummaryData getCatalogSummaryData() {
        return this.catalogSummaryData;
    }

    public final CatalogDetailData copy(String __typename, String id, String description, boolean disallowResponses, long itemsLastInsertedAt, long responsesCount, ViewerEdge viewerEdge, Creator creator, CatalogSummaryData catalogSummaryData, CatalogClapsData catalogClapsData) {
        __typename.getClass();
        id.getClass();
        viewerEdge.getClass();
        creator.getClass();
        catalogSummaryData.getClass();
        catalogClapsData.getClass();
        return new CatalogDetailData(__typename, id, description, disallowResponses, itemsLastInsertedAt, responsesCount, viewerEdge, creator, catalogSummaryData, catalogClapsData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogDetailData)) {
            return false;
        }
        CatalogDetailData catalogDetailData = (CatalogDetailData) other;
        return g76.L(this.__typename, catalogDetailData.__typename) && g76.L(this.id, catalogDetailData.id) && g76.L(this.description, catalogDetailData.description) && this.disallowResponses == catalogDetailData.disallowResponses && this.itemsLastInsertedAt == catalogDetailData.itemsLastInsertedAt && this.responsesCount == catalogDetailData.responsesCount && g76.L(this.viewerEdge, catalogDetailData.viewerEdge) && g76.L(this.creator, catalogDetailData.creator) && g76.L(this.catalogSummaryData, catalogDetailData.catalogSummaryData) && g76.L(this.catalogClapsData, catalogDetailData.catalogClapsData);
    }

    public final CatalogClapsData getCatalogClapsData() {
        return this.catalogClapsData;
    }

    public final CatalogSummaryData getCatalogSummaryData() {
        return this.catalogSummaryData;
    }

    public final Creator getCreator() {
        return this.creator;
    }

    public final String getDescription() {
        return this.description;
    }

    public final boolean getDisallowResponses() {
        return this.disallowResponses;
    }

    public final String getId() {
        return this.id;
    }

    public final long getItemsLastInsertedAt() {
        return this.itemsLastInsertedAt;
    }

    public final long getResponsesCount() {
        return this.responsesCount;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        String str = this.description;
        int iHashCode = (((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.disallowResponses ? 1231 : 1237)) * 31;
        long j = this.itemsLastInsertedAt;
        int i = (iHashCode + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.responsesCount;
        return this.catalogClapsData.hashCode() + ((this.catalogSummaryData.hashCode() + ((this.creator.hashCode() + ((this.viewerEdge.hashCode() + ((i + ((int) (j2 ^ (j2 >>> 32)))) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.description;
        boolean z = this.disallowResponses;
        long j = this.itemsLastInsertedAt;
        long j2 = this.responsesCount;
        ViewerEdge viewerEdge = this.viewerEdge;
        Creator creator = this.creator;
        CatalogSummaryData catalogSummaryData = this.catalogSummaryData;
        CatalogClapsData catalogClapsData = this.catalogClapsData;
        StringBuilder sbU = y30.u("CatalogDetailData(__typename=", str, ", id=", str2, ", description=");
        ka1.D(sbU, str3, ", disallowResponses=", z, ", itemsLastInsertedAt=");
        sbU.append(j);
        wgd.y(sbU, ", responsesCount=", j2, ", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(", creator=");
        sbU.append(creator);
        sbU.append(", catalogSummaryData=");
        sbU.append(catalogSummaryData);
        sbU.append(", catalogClapsData=");
        sbU.append(catalogClapsData);
        sbU.append(")");
        return sbU.toString();
    }
}
