package com.medium.android.graphql.fragment;

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
@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0017\b\u0086\b\u0018\u00002\u00020\u0001:\u0004?@ABBe\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0015J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0015J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0015J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0015J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0012\u0010\u001c\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0012\u0010\u001e\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ\u0012\u0010 \u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0082\u0001\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u0010HÆ\u0001¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b&\u0010\u0015J\u0010\u0010(\u001a\u00020'HÖ\u0001¢\u0006\u0004\b(\u0010)J\u001a\u0010-\u001a\u00020,2\b\u0010+\u001a\u0004\u0018\u00010*HÖ\u0003¢\u0006\u0004\b-\u0010.R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010/\u001a\u0004\b0\u0010\u0015R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010/\u001a\u0004\b1\u0010\u0015R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010/\u001a\u0004\b2\u0010\u0015R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010/\u001a\u0004\b3\u0010\u0015R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010/\u001a\u0004\b4\u0010\u0015R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u00105\u001a\u0004\b6\u0010\u001bR\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u00107\u001a\u0004\b8\u0010\u001dR\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u00109\u001a\u0004\b:\u0010\u001fR\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010;\u001a\u0004\b<\u0010!R\u0017\u0010\u0011\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010=\u001a\u0004\b>\u0010#¨\u0006C"}, d2 = {"Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "Lg15;", "", "__typename", "id", "name", "imageId", "bio", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$Verifications;", "verifications", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$Membership;", "membership", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;", "socialStats", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$NewsletterV3;", "newsletterV3", "Lcom/medium/android/graphql/fragment/UserFollowData;", "userFollowData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData$Verifications;Lcom/medium/android/graphql/fragment/CreatorPreviewData$Membership;Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;Lcom/medium/android/graphql/fragment/CreatorPreviewData$NewsletterV3;Lcom/medium/android/graphql/fragment/UserFollowData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData$Verifications;", "component7", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData$Membership;", "component8", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;", "component9", "()Lcom/medium/android/graphql/fragment/CreatorPreviewData$NewsletterV3;", "component10", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/CreatorPreviewData$Verifications;Lcom/medium/android/graphql/fragment/CreatorPreviewData$Membership;Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;Lcom/medium/android/graphql/fragment/CreatorPreviewData$NewsletterV3;Lcom/medium/android/graphql/fragment/UserFollowData;)Lcom/medium/android/graphql/fragment/CreatorPreviewData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "getImageId", "getBio", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$Verifications;", "getVerifications", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$Membership;", "getMembership", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;", "getSocialStats", "Lcom/medium/android/graphql/fragment/CreatorPreviewData$NewsletterV3;", "getNewsletterV3", "Lcom/medium/android/graphql/fragment/UserFollowData;", "getUserFollowData", "Verifications", "Membership", "SocialStats", "NewsletterV3", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CreatorPreviewData implements g15 {
    private final String __typename;
    private final String bio;
    private final String id;
    private final String imageId;
    private final Membership membership;
    private final String name;
    private final NewsletterV3 newsletterV3;
    private final SocialStats socialStats;
    private final UserFollowData userFollowData;
    private final Verifications verifications;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/CreatorPreviewData$Membership;", "", "__typename", "", "membershipFragment", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "get__typename", "()Ljava/lang/String;", "getMembershipFragment", "()Lcom/medium/android/graphql/fragment/MembershipFragment;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/CreatorPreviewData$NewsletterV3;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class NewsletterV3 {
        private final String __typename;
        private final String id;

        public NewsletterV3(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ NewsletterV3 copy$default(NewsletterV3 newsletterV3, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = newsletterV3.__typename;
            }
            if ((i & 2) != 0) {
                str2 = newsletterV3.id;
            }
            return newsletterV3.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final NewsletterV3 copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new NewsletterV3(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NewsletterV3)) {
                return false;
            }
            NewsletterV3 newsletterV3 = (NewsletterV3) other;
            return g76.L(this.__typename, newsletterV3.__typename) && g76.L(this.id, newsletterV3.id);
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
            return ev6.y("NewsletterV3(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;", "", "__typename", "", "followerCount", "", "<init>", "(Ljava/lang/String;Ljava/lang/Long;)V", "get__typename", "()Ljava/lang/String;", "getFollowerCount", "()Ljava/lang/Long;", "Ljava/lang/Long;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Long;)Lcom/medium/android/graphql/fragment/CreatorPreviewData$SocialStats;", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SocialStats {
        private final String __typename;
        private final Long followerCount;

        public SocialStats(String str, Long l) {
            str.getClass();
            this.__typename = str;
            this.followerCount = l;
        }

        public static /* synthetic */ SocialStats copy$default(SocialStats socialStats, String str, Long l, int i, Object obj) {
            if ((i & 1) != 0) {
                str = socialStats.__typename;
            }
            if ((i & 2) != 0) {
                l = socialStats.followerCount;
            }
            return socialStats.copy(str, l);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Long getFollowerCount() {
            return this.followerCount;
        }

        public final SocialStats copy(String __typename, Long followerCount) {
            __typename.getClass();
            return new SocialStats(__typename, followerCount);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SocialStats)) {
                return false;
            }
            SocialStats socialStats = (SocialStats) other;
            return g76.L(this.__typename, socialStats.__typename) && g76.L(this.followerCount, socialStats.followerCount);
        }

        public final Long getFollowerCount() {
            return this.followerCount;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Long l = this.followerCount;
            return iHashCode + (l == null ? 0 : l.hashCode());
        }

        public final String toString() {
            return "SocialStats(__typename=" + this.__typename + ", followerCount=" + this.followerCount + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/CreatorPreviewData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public CreatorPreviewData(String str, String str2, String str3, String str4, String str5, Verifications verifications, Membership membership, SocialStats socialStats, NewsletterV3 newsletterV3, UserFollowData userFollowData) {
        str.getClass();
        str2.getClass();
        userFollowData.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.imageId = str4;
        this.bio = str5;
        this.verifications = verifications;
        this.membership = membership;
        this.socialStats = socialStats;
        this.newsletterV3 = newsletterV3;
        this.userFollowData = userFollowData;
    }

    public static /* synthetic */ CreatorPreviewData copy$default(CreatorPreviewData creatorPreviewData, String str, String str2, String str3, String str4, String str5, Verifications verifications, Membership membership, SocialStats socialStats, NewsletterV3 newsletterV3, UserFollowData userFollowData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = creatorPreviewData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = creatorPreviewData.id;
        }
        if ((i & 4) != 0) {
            str3 = creatorPreviewData.name;
        }
        if ((i & 8) != 0) {
            str4 = creatorPreviewData.imageId;
        }
        if ((i & 16) != 0) {
            str5 = creatorPreviewData.bio;
        }
        if ((i & 32) != 0) {
            verifications = creatorPreviewData.verifications;
        }
        if ((i & 64) != 0) {
            membership = creatorPreviewData.membership;
        }
        if ((i & 128) != 0) {
            socialStats = creatorPreviewData.socialStats;
        }
        if ((i & 256) != 0) {
            newsletterV3 = creatorPreviewData.newsletterV3;
        }
        if ((i & 512) != 0) {
            userFollowData = creatorPreviewData.userFollowData;
        }
        NewsletterV3 newsletterV32 = newsletterV3;
        UserFollowData userFollowData2 = userFollowData;
        Membership membership2 = membership;
        SocialStats socialStats2 = socialStats;
        String str6 = str5;
        Verifications verifications2 = verifications;
        return creatorPreviewData.copy(str, str2, str3, str4, str6, verifications2, membership2, socialStats2, newsletterV32, userFollowData2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final UserFollowData getUserFollowData() {
        return this.userFollowData;
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
    public final String getBio() {
        return this.bio;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Verifications getVerifications() {
        return this.verifications;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Membership getMembership() {
        return this.membership;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final SocialStats getSocialStats() {
        return this.socialStats;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final NewsletterV3 getNewsletterV3() {
        return this.newsletterV3;
    }

    public final CreatorPreviewData copy(String __typename, String id, String name, String imageId, String bio, Verifications verifications, Membership membership, SocialStats socialStats, NewsletterV3 newsletterV3, UserFollowData userFollowData) {
        __typename.getClass();
        id.getClass();
        userFollowData.getClass();
        return new CreatorPreviewData(__typename, id, name, imageId, bio, verifications, membership, socialStats, newsletterV3, userFollowData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreatorPreviewData)) {
            return false;
        }
        CreatorPreviewData creatorPreviewData = (CreatorPreviewData) other;
        return g76.L(this.__typename, creatorPreviewData.__typename) && g76.L(this.id, creatorPreviewData.id) && g76.L(this.name, creatorPreviewData.name) && g76.L(this.imageId, creatorPreviewData.imageId) && g76.L(this.bio, creatorPreviewData.bio) && g76.L(this.verifications, creatorPreviewData.verifications) && g76.L(this.membership, creatorPreviewData.membership) && g76.L(this.socialStats, creatorPreviewData.socialStats) && g76.L(this.newsletterV3, creatorPreviewData.newsletterV3) && g76.L(this.userFollowData, creatorPreviewData.userFollowData);
    }

    public final String getBio() {
        return this.bio;
    }

    public final String getId() {
        return this.id;
    }

    public final String getImageId() {
        return this.imageId;
    }

    public final Membership getMembership() {
        return this.membership;
    }

    public final String getName() {
        return this.name;
    }

    public final NewsletterV3 getNewsletterV3() {
        return this.newsletterV3;
    }

    public final SocialStats getSocialStats() {
        return this.socialStats;
    }

    public final UserFollowData getUserFollowData() {
        return this.userFollowData;
    }

    public final Verifications getVerifications() {
        return this.verifications;
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
        String str3 = this.bio;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Verifications verifications = this.verifications;
        int iHashCode4 = (iHashCode3 + (verifications == null ? 0 : verifications.hashCode())) * 31;
        Membership membership = this.membership;
        int iHashCode5 = (iHashCode4 + (membership == null ? 0 : membership.hashCode())) * 31;
        SocialStats socialStats = this.socialStats;
        int iHashCode6 = (iHashCode5 + (socialStats == null ? 0 : socialStats.hashCode())) * 31;
        NewsletterV3 newsletterV3 = this.newsletterV3;
        return this.userFollowData.hashCode() + ((iHashCode6 + (newsletterV3 != null ? newsletterV3.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        String str4 = this.imageId;
        String str5 = this.bio;
        Verifications verifications = this.verifications;
        Membership membership = this.membership;
        SocialStats socialStats = this.socialStats;
        NewsletterV3 newsletterV3 = this.newsletterV3;
        UserFollowData userFollowData = this.userFollowData;
        StringBuilder sbU = y30.u("CreatorPreviewData(__typename=", str, ", id=", str2, ", name=");
        ka1.C(sbU, str3, ", imageId=", str4, ", bio=");
        sbU.append(str5);
        sbU.append(", verifications=");
        sbU.append(verifications);
        sbU.append(", membership=");
        sbU.append(membership);
        sbU.append(", socialStats=");
        sbU.append(socialStats);
        sbU.append(", newsletterV3=");
        sbU.append(newsletterV3);
        sbU.append(", userFollowData=");
        sbU.append(userFollowData);
        sbU.append(")");
        return sbU.toString();
    }
}
