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
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0017\b\u0086\b\u0018\u00002\u00020\u0001:\u0002EFBg\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u0002\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0017J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0017J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u0017J\u0012\u0010\u001b\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u0017J\u0010\u0010 \u001a\u00020\fHÆ\u0003¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\b$\u0010%J\u0010\u0010&\u001a\u00020\u0012HÆ\u0003¢\u0006\u0004\b&\u0010'J\u0086\u0001\u0010(\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\u000b\u001a\u00020\u00022\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u00102\b\b\u0002\u0010\u0013\u001a\u00020\u0012HÆ\u0001¢\u0006\u0004\b(\u0010)J\u0010\u0010*\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b*\u0010\u0017J\u0010\u0010,\u001a\u00020+HÖ\u0001¢\u0006\u0004\b,\u0010-J\u001a\u00101\u001a\u0002002\b\u0010/\u001a\u0004\u0018\u00010.HÖ\u0003¢\u0006\u0004\b1\u00102R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00103\u001a\u0004\b4\u0010\u0017R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00103\u001a\u0004\b5\u0010\u0017R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00103\u001a\u0004\b6\u0010\u0017R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u00103\u001a\u0004\b7\u0010\u0017R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u00108\u001a\u0004\b9\u0010\u001cR\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010:\u001a\u0004\b;\u0010\u001eR\u0017\u0010\u000b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u00103\u001a\u0004\b<\u0010\u0017R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010=\u001a\u0004\b>\u0010!R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010?\u001a\u0004\b@\u0010#R\u0017\u0010\u0011\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010A\u001a\u0004\bB\u0010%R\u0017\u0010\u0013\u001a\u00020\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010C\u001a\u0004\bD\u0010'¨\u0006G"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileData;", "Lg15;", "", "__typename", "imageId", "name", "username", "Lcom/medium/android/graphql/fragment/UserProfileData$Membership;", "membership", "Lcom/medium/android/graphql/fragment/UserProfileData$ViewerEdge;", "viewerEdge", "id", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "userNewsletterData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "userBlockData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "userMuteData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "userFollowData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserProfileData$Membership;Lcom/medium/android/graphql/fragment/UserProfileData$ViewerEdge;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserNewsletterData;Lcom/medium/android/graphql/fragment/UserBlockData;Lcom/medium/android/graphql/fragment/UserMuteData;Lcom/medium/android/graphql/fragment/UserFollowData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "()Lcom/medium/android/graphql/fragment/UserProfileData$Membership;", "component6", "()Lcom/medium/android/graphql/fragment/UserProfileData$ViewerEdge;", "component7", "component8", "()Lcom/medium/android/graphql/fragment/UserNewsletterData;", "component9", "()Lcom/medium/android/graphql/fragment/UserBlockData;", "component10", "()Lcom/medium/android/graphql/fragment/UserMuteData;", "component11", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserProfileData$Membership;Lcom/medium/android/graphql/fragment/UserProfileData$ViewerEdge;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserNewsletterData;Lcom/medium/android/graphql/fragment/UserBlockData;Lcom/medium/android/graphql/fragment/UserMuteData;Lcom/medium/android/graphql/fragment/UserFollowData;)Lcom/medium/android/graphql/fragment/UserProfileData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getImageId", "getName", "getUsername", "Lcom/medium/android/graphql/fragment/UserProfileData$Membership;", "getMembership", "Lcom/medium/android/graphql/fragment/UserProfileData$ViewerEdge;", "getViewerEdge", "getId", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "getUserNewsletterData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "getUserBlockData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "getUserMuteData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "getUserFollowData", "Membership", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserProfileData implements g15 {
    private final String __typename;
    private final String id;
    private final String imageId;
    private final Membership membership;
    private final String name;
    private final UserBlockData userBlockData;
    private final UserFollowData userFollowData;
    private final UserMuteData userMuteData;
    private final UserNewsletterData userNewsletterData;
    private final String username;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileData$Membership;", "", "__typename", "", "membershipFragment", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "get__typename", "()Ljava/lang/String;", "getMembershipFragment", "()Lcom/medium/android/graphql/fragment/MembershipFragment;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileData$ViewerEdge;", "", "__typename", "", "isUser", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public UserProfileData(String str, String str2, String str3, String str4, Membership membership, ViewerEdge viewerEdge, String str5, UserNewsletterData userNewsletterData, UserBlockData userBlockData, UserMuteData userMuteData, UserFollowData userFollowData) {
        str.getClass();
        viewerEdge.getClass();
        str5.getClass();
        userNewsletterData.getClass();
        userBlockData.getClass();
        userMuteData.getClass();
        userFollowData.getClass();
        this.__typename = str;
        this.imageId = str2;
        this.name = str3;
        this.username = str4;
        this.membership = membership;
        this.viewerEdge = viewerEdge;
        this.id = str5;
        this.userNewsletterData = userNewsletterData;
        this.userBlockData = userBlockData;
        this.userMuteData = userMuteData;
        this.userFollowData = userFollowData;
    }

    public static /* synthetic */ UserProfileData copy$default(UserProfileData userProfileData, String str, String str2, String str3, String str4, Membership membership, ViewerEdge viewerEdge, String str5, UserNewsletterData userNewsletterData, UserBlockData userBlockData, UserMuteData userMuteData, UserFollowData userFollowData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = userProfileData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = userProfileData.imageId;
        }
        if ((i & 4) != 0) {
            str3 = userProfileData.name;
        }
        if ((i & 8) != 0) {
            str4 = userProfileData.username;
        }
        if ((i & 16) != 0) {
            membership = userProfileData.membership;
        }
        if ((i & 32) != 0) {
            viewerEdge = userProfileData.viewerEdge;
        }
        if ((i & 64) != 0) {
            str5 = userProfileData.id;
        }
        if ((i & 128) != 0) {
            userNewsletterData = userProfileData.userNewsletterData;
        }
        if ((i & 256) != 0) {
            userBlockData = userProfileData.userBlockData;
        }
        if ((i & 512) != 0) {
            userMuteData = userProfileData.userMuteData;
        }
        if ((i & 1024) != 0) {
            userFollowData = userProfileData.userFollowData;
        }
        UserMuteData userMuteData2 = userMuteData;
        UserFollowData userFollowData2 = userFollowData;
        UserNewsletterData userNewsletterData2 = userNewsletterData;
        UserBlockData userBlockData2 = userBlockData;
        ViewerEdge viewerEdge2 = viewerEdge;
        String str6 = str5;
        Membership membership2 = membership;
        String str7 = str3;
        return userProfileData.copy(str, str2, str7, str4, membership2, viewerEdge2, str6, userNewsletterData2, userBlockData2, userMuteData2, userFollowData2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final UserMuteData getUserMuteData() {
        return this.userMuteData;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final UserFollowData getUserFollowData() {
        return this.userFollowData;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getImageId() {
        return this.imageId;
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
    public final Membership getMembership() {
        return this.membership;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final UserNewsletterData getUserNewsletterData() {
        return this.userNewsletterData;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final UserBlockData getUserBlockData() {
        return this.userBlockData;
    }

    public final UserProfileData copy(String __typename, String imageId, String name, String username, Membership membership, ViewerEdge viewerEdge, String id, UserNewsletterData userNewsletterData, UserBlockData userBlockData, UserMuteData userMuteData, UserFollowData userFollowData) {
        __typename.getClass();
        viewerEdge.getClass();
        id.getClass();
        userNewsletterData.getClass();
        userBlockData.getClass();
        userMuteData.getClass();
        userFollowData.getClass();
        return new UserProfileData(__typename, imageId, name, username, membership, viewerEdge, id, userNewsletterData, userBlockData, userMuteData, userFollowData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserProfileData)) {
            return false;
        }
        UserProfileData userProfileData = (UserProfileData) other;
        return g76.L(this.__typename, userProfileData.__typename) && g76.L(this.imageId, userProfileData.imageId) && g76.L(this.name, userProfileData.name) && g76.L(this.username, userProfileData.username) && g76.L(this.membership, userProfileData.membership) && g76.L(this.viewerEdge, userProfileData.viewerEdge) && g76.L(this.id, userProfileData.id) && g76.L(this.userNewsletterData, userProfileData.userNewsletterData) && g76.L(this.userBlockData, userProfileData.userBlockData) && g76.L(this.userMuteData, userProfileData.userMuteData) && g76.L(this.userFollowData, userProfileData.userFollowData);
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

    public final UserBlockData getUserBlockData() {
        return this.userBlockData;
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
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.imageId;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.username;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Membership membership = this.membership;
        return this.userFollowData.hashCode() + ((this.userMuteData.hashCode() + ((this.userBlockData.hashCode() + ((this.userNewsletterData.hashCode() + wgd.o((this.viewerEdge.hashCode() + ((iHashCode4 + (membership != null ? membership.hashCode() : 0)) * 31)) * 31, 31, this.id)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.imageId;
        String str3 = this.name;
        String str4 = this.username;
        Membership membership = this.membership;
        ViewerEdge viewerEdge = this.viewerEdge;
        String str5 = this.id;
        UserNewsletterData userNewsletterData = this.userNewsletterData;
        UserBlockData userBlockData = this.userBlockData;
        UserMuteData userMuteData = this.userMuteData;
        UserFollowData userFollowData = this.userFollowData;
        StringBuilder sbU = y30.u("UserProfileData(__typename=", str, ", imageId=", str2, ", name=");
        ka1.C(sbU, str3, ", username=", str4, ", membership=");
        sbU.append(membership);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(", id=");
        sbU.append(str5);
        sbU.append(", userNewsletterData=");
        sbU.append(userNewsletterData);
        sbU.append(", userBlockData=");
        sbU.append(userBlockData);
        sbU.append(", userMuteData=");
        sbU.append(userMuteData);
        sbU.append(", userFollowData=");
        sbU.append(userFollowData);
        sbU.append(")");
        return sbU.toString();
    }
}
