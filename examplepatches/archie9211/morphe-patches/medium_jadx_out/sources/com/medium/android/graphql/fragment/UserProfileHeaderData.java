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
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b#\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b'\b\u0086\b\u0018\u00002\u00020\u0001:\u0006fghijkB³\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\b\u0012\b\u0010\u0016\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0017\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0019\u001a\u00020\u0018\u0012\u0006\u0010\u001b\u001a\u00020\u001a\u0012\u0006\u0010\u001d\u001a\u00020\u001c\u0012\u0006\u0010\u001f\u001a\u00020\u001e¢\u0006\u0004\b \u0010!J\u0010\u0010\"\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\"\u0010#J\u0010\u0010$\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b$\u0010#J\u0012\u0010%\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b%\u0010#J\u0012\u0010&\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b&\u0010#J\u0012\u0010'\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b'\u0010#J\u0016\u0010(\u001a\b\u0012\u0004\u0012\u00020\u00020\bHÆ\u0003¢\u0006\u0004\b(\u0010)J\u0010\u0010*\u001a\u00020\nHÆ\u0003¢\u0006\u0004\b*\u0010+J\u0010\u0010,\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b,\u0010-J\u0012\u0010.\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b.\u0010/J\u0012\u00100\u001a\u0004\u0018\u00010\u0010HÆ\u0003¢\u0006\u0004\b0\u00101J\u0012\u00102\u001a\u0004\u0018\u00010\u0012HÆ\u0003¢\u0006\u0004\b2\u00103J\u0016\u00104\u001a\b\u0012\u0004\u0012\u00020\u00140\bHÆ\u0003¢\u0006\u0004\b4\u0010)J\u0012\u00105\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b5\u0010#J\u0012\u00106\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b6\u0010#J\u0010\u00107\u001a\u00020\u0018HÆ\u0003¢\u0006\u0004\b7\u00108J\u0010\u00109\u001a\u00020\u001aHÆ\u0003¢\u0006\u0004\b9\u0010:J\u0010\u0010;\u001a\u00020\u001cHÆ\u0003¢\u0006\u0004\b;\u0010<J\u0010\u0010=\u001a\u00020\u001eHÆ\u0003¢\u0006\u0004\b=\u0010>Jà\u0001\u0010?\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\n2\b\b\u0002\u0010\r\u001a\u00020\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\u000e\b\u0002\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\b2\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0019\u001a\u00020\u00182\b\b\u0002\u0010\u001b\u001a\u00020\u001a2\b\b\u0002\u0010\u001d\u001a\u00020\u001c2\b\b\u0002\u0010\u001f\u001a\u00020\u001eHÆ\u0001¢\u0006\u0004\b?\u0010@J\u0010\u0010A\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\bA\u0010#J\u0010\u0010C\u001a\u00020BHÖ\u0001¢\u0006\u0004\bC\u0010DJ\u001a\u0010G\u001a\u00020\n2\b\u0010F\u001a\u0004\u0018\u00010EHÖ\u0003¢\u0006\u0004\bG\u0010HR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010I\u001a\u0004\bJ\u0010#R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010I\u001a\u0004\bK\u0010#R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010I\u001a\u0004\bL\u0010#R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010I\u001a\u0004\bM\u0010#R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010I\u001a\u0004\bN\u0010#R\u001d\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010O\u001a\u0004\bP\u0010)R\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010Q\u001a\u0004\bR\u0010+R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010S\u001a\u0004\bT\u0010-R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010U\u001a\u0004\bV\u0010/R\u0019\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010W\u001a\u0004\bX\u00101R\u0019\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010Y\u001a\u0004\bZ\u00103R\u001d\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\b8\u0006¢\u0006\f\n\u0004\b\u0015\u0010O\u001a\u0004\b[\u0010)R\u0019\u0010\u0016\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0016\u0010I\u001a\u0004\b\\\u0010#R\u0019\u0010\u0017\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0017\u0010I\u001a\u0004\b]\u0010#R\u0017\u0010\u0019\u001a\u00020\u00188\u0006¢\u0006\f\n\u0004\b\u0019\u0010^\u001a\u0004\b_\u00108R\u0017\u0010\u001b\u001a\u00020\u001a8\u0006¢\u0006\f\n\u0004\b\u001b\u0010`\u001a\u0004\ba\u0010:R\u0017\u0010\u001d\u001a\u00020\u001c8\u0006¢\u0006\f\n\u0004\b\u001d\u0010b\u001a\u0004\bc\u0010<R\u0017\u0010\u001f\u001a\u00020\u001e8\u0006¢\u0006\f\n\u0004\b\u001f\u0010d\u001a\u0004\be\u0010>¨\u0006l"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData;", "Lg15;", "", "__typename", "id", "name", "imageId", "username", "", "pronouns", "", "hasSubdomain", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$ViewerEdge;", "viewerEdge", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Verifications;", "verifications", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$HomepagePostsConnection;", "homepagePostsConnection", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Membership;", "membership", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$AuthoredBook;", "authoredBooks", "bio", "aboutAsHtml", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "userNewsletterData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "userFollowData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "userMuteData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "userBlockData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLcom/medium/android/graphql/fragment/UserProfileHeaderData$ViewerEdge;Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Verifications;Lcom/medium/android/graphql/fragment/UserProfileHeaderData$HomepagePostsConnection;Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Membership;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserNewsletterData;Lcom/medium/android/graphql/fragment/UserFollowData;Lcom/medium/android/graphql/fragment/UserMuteData;Lcom/medium/android/graphql/fragment/UserBlockData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "()Ljava/util/List;", "component7", "()Z", "component8", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderData$ViewerEdge;", "component9", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Verifications;", "component10", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderData$HomepagePostsConnection;", "component11", "()Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Membership;", "component12", "component13", "component14", "component15", "()Lcom/medium/android/graphql/fragment/UserNewsletterData;", "component16", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "component17", "()Lcom/medium/android/graphql/fragment/UserMuteData;", "component18", "()Lcom/medium/android/graphql/fragment/UserBlockData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ZLcom/medium/android/graphql/fragment/UserProfileHeaderData$ViewerEdge;Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Verifications;Lcom/medium/android/graphql/fragment/UserProfileHeaderData$HomepagePostsConnection;Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Membership;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/UserNewsletterData;Lcom/medium/android/graphql/fragment/UserFollowData;Lcom/medium/android/graphql/fragment/UserMuteData;Lcom/medium/android/graphql/fragment/UserBlockData;)Lcom/medium/android/graphql/fragment/UserProfileHeaderData;", "toString", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "getImageId", "getUsername", "Ljava/util/List;", "getPronouns", "Z", "getHasSubdomain", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$ViewerEdge;", "getViewerEdge", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Verifications;", "getVerifications", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$HomepagePostsConnection;", "getHomepagePostsConnection", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Membership;", "getMembership", "getAuthoredBooks", "getBio", "getAboutAsHtml", "Lcom/medium/android/graphql/fragment/UserNewsletterData;", "getUserNewsletterData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "getUserFollowData", "Lcom/medium/android/graphql/fragment/UserMuteData;", "getUserMuteData", "Lcom/medium/android/graphql/fragment/UserBlockData;", "getUserBlockData", "ViewerEdge", "Verifications", "HomepagePostsConnection", "Membership", "AuthoredBook", "Post", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserProfileHeaderData implements g15 {
    private final String __typename;
    private final String aboutAsHtml;
    private final List<AuthoredBook> authoredBooks;
    private final String bio;
    private final boolean hasSubdomain;
    private final HomepagePostsConnection homepagePostsConnection;
    private final String id;
    private final String imageId;
    private final Membership membership;
    private final String name;
    private final List<String> pronouns;
    private final UserBlockData userBlockData;
    private final UserFollowData userFollowData;
    private final UserMuteData userMuteData;
    private final UserNewsletterData userNewsletterData;
    private final String username;
    private final Verifications verifications;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData$AuthoredBook;", "", "__typename", "", "title", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getTitle", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class AuthoredBook {
        private final String __typename;
        private final String title;

        public AuthoredBook(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.title = str2;
        }

        public static /* synthetic */ AuthoredBook copy$default(AuthoredBook authoredBook, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = authoredBook.__typename;
            }
            if ((i & 2) != 0) {
                str2 = authoredBook.title;
            }
            return authoredBook.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getTitle() {
            return this.title;
        }

        public final AuthoredBook copy(String __typename, String title) {
            __typename.getClass();
            title.getClass();
            return new AuthoredBook(__typename, title);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AuthoredBook)) {
                return false;
            }
            AuthoredBook authoredBook = (AuthoredBook) other;
            return g76.L(this.__typename, authoredBook.__typename) && g76.L(this.title, authoredBook.title);
        }

        public final String getTitle() {
            return this.title;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.title.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("AuthoredBook(__typename=", this.__typename, ", title=", this.title, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0011\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0003J%\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0019\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData$HomepagePostsConnection;", "", "__typename", "", "posts", "", "Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Post;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getPosts", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class HomepagePostsConnection {
        private final String __typename;
        private final List<Post> posts;

        public HomepagePostsConnection(String str, List<Post> list) {
            str.getClass();
            this.__typename = str;
            this.posts = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ HomepagePostsConnection copy$default(HomepagePostsConnection homepagePostsConnection, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = homepagePostsConnection.__typename;
            }
            if ((i & 2) != 0) {
                list = homepagePostsConnection.posts;
            }
            return homepagePostsConnection.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Post> component2() {
            return this.posts;
        }

        public final HomepagePostsConnection copy(String __typename, List<Post> posts) {
            __typename.getClass();
            return new HomepagePostsConnection(__typename, posts);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof HomepagePostsConnection)) {
                return false;
            }
            HomepagePostsConnection homepagePostsConnection = (HomepagePostsConnection) other;
            return g76.L(this.__typename, homepagePostsConnection.__typename) && g76.L(this.posts, homepagePostsConnection.posts);
        }

        public final List<Post> getPosts() {
            return this.posts;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            List<Post> list = this.posts;
            return iHashCode + (list == null ? 0 : list.hashCode());
        }

        public final String toString() {
            return ka1.s("HomepagePostsConnection(__typename=", this.__typename, ", posts=", ")", this.posts);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Membership;", "", "__typename", "", "membershipFragment", "Lcom/medium/android/graphql/fragment/MembershipFragment;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/MembershipFragment;)V", "get__typename", "()Ljava/lang/String;", "getMembershipFragment", "()Lcom/medium/android/graphql/fragment/MembershipFragment;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Post;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final String id;

        public Post(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            return post.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Post copy(String __typename, String id) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id);
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
            return ev6.y("Post(__typename=", this.__typename, ", id=", this.id, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u00052\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\n¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData$Verifications;", "", "__typename", "", "isBookAuthor", "", "<init>", "(Ljava/lang/String;Z)V", "get__typename", "()Ljava/lang/String;", "()Z", "component1", "component2", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0011\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J1\u0010\u0013\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0014\u001a\u00020\u00052\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000b¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/UserProfileHeaderData$ViewerEdge;", "", "__typename", "", "isUser", "", "hasList", "id", "<init>", "(Ljava/lang/String;ZZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getHasList", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final boolean hasList;
        private final String id;
        private final boolean isUser;

        public ViewerEdge(String str, boolean z, boolean z2, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.isUser = z;
            this.hasList = z2;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, boolean z, boolean z2, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                z = viewerEdge.isUser;
            }
            if ((i & 4) != 0) {
                z2 = viewerEdge.hasList;
            }
            if ((i & 8) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, z, z2, str2);
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
        public final boolean getHasList() {
            return this.hasList;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, boolean isUser, boolean hasList, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, isUser, hasList, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.isUser == viewerEdge.isUser && this.hasList == viewerEdge.hasList && g76.L(this.id, viewerEdge.id);
        }

        public final boolean getHasList() {
            return this.hasList;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + (((((this.__typename.hashCode() * 31) + (this.isUser ? 1231 : 1237)) * 31) + (this.hasList ? 1231 : 1237)) * 31);
        }

        public final boolean isUser() {
            return this.isUser;
        }

        public final String toString() {
            String str = this.__typename;
            boolean z = this.isUser;
            boolean z2 = this.hasList;
            String str2 = this.id;
            StringBuilder sbD = ev6.D("ViewerEdge(__typename=", str, ", isUser=", ", hasList=", z);
            sbD.append(z2);
            sbD.append(", id=");
            sbD.append(str2);
            sbD.append(")");
            return sbD.toString();
        }
    }

    public UserProfileHeaderData(String str, String str2, String str3, String str4, String str5, List<String> list, boolean z, ViewerEdge viewerEdge, Verifications verifications, HomepagePostsConnection homepagePostsConnection, Membership membership, List<AuthoredBook> list2, String str6, String str7, UserNewsletterData userNewsletterData, UserFollowData userFollowData, UserMuteData userMuteData, UserBlockData userBlockData) {
        str.getClass();
        str2.getClass();
        list.getClass();
        viewerEdge.getClass();
        list2.getClass();
        userNewsletterData.getClass();
        userFollowData.getClass();
        userMuteData.getClass();
        userBlockData.getClass();
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.imageId = str4;
        this.username = str5;
        this.pronouns = list;
        this.hasSubdomain = z;
        this.viewerEdge = viewerEdge;
        this.verifications = verifications;
        this.homepagePostsConnection = homepagePostsConnection;
        this.membership = membership;
        this.authoredBooks = list2;
        this.bio = str6;
        this.aboutAsHtml = str7;
        this.userNewsletterData = userNewsletterData;
        this.userFollowData = userFollowData;
        this.userMuteData = userMuteData;
        this.userBlockData = userBlockData;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ UserProfileHeaderData copy$default(UserProfileHeaderData userProfileHeaderData, String str, String str2, String str3, String str4, String str5, List list, boolean z, ViewerEdge viewerEdge, Verifications verifications, HomepagePostsConnection homepagePostsConnection, Membership membership, List list2, String str6, String str7, UserNewsletterData userNewsletterData, UserFollowData userFollowData, UserMuteData userMuteData, UserBlockData userBlockData, int i, Object obj) {
        UserBlockData userBlockData2;
        UserMuteData userMuteData2;
        String str8 = (i & 1) != 0 ? userProfileHeaderData.__typename : str;
        String str9 = (i & 2) != 0 ? userProfileHeaderData.id : str2;
        String str10 = (i & 4) != 0 ? userProfileHeaderData.name : str3;
        String str11 = (i & 8) != 0 ? userProfileHeaderData.imageId : str4;
        String str12 = (i & 16) != 0 ? userProfileHeaderData.username : str5;
        List list3 = (i & 32) != 0 ? userProfileHeaderData.pronouns : list;
        boolean z2 = (i & 64) != 0 ? userProfileHeaderData.hasSubdomain : z;
        ViewerEdge viewerEdge2 = (i & 128) != 0 ? userProfileHeaderData.viewerEdge : viewerEdge;
        Verifications verifications2 = (i & 256) != 0 ? userProfileHeaderData.verifications : verifications;
        HomepagePostsConnection homepagePostsConnection2 = (i & 512) != 0 ? userProfileHeaderData.homepagePostsConnection : homepagePostsConnection;
        Membership membership2 = (i & 1024) != 0 ? userProfileHeaderData.membership : membership;
        List list4 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? userProfileHeaderData.authoredBooks : list2;
        String str13 = (i & 4096) != 0 ? userProfileHeaderData.bio : str6;
        String str14 = (i & 8192) != 0 ? userProfileHeaderData.aboutAsHtml : str7;
        String str15 = str8;
        UserNewsletterData userNewsletterData2 = (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? userProfileHeaderData.userNewsletterData : userNewsletterData;
        UserFollowData userFollowData2 = (i & 32768) != 0 ? userProfileHeaderData.userFollowData : userFollowData;
        UserMuteData userMuteData3 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? userProfileHeaderData.userMuteData : userMuteData;
        if ((i & 131072) != 0) {
            userMuteData2 = userMuteData3;
            userBlockData2 = userProfileHeaderData.userBlockData;
        } else {
            userBlockData2 = userBlockData;
            userMuteData2 = userMuteData3;
        }
        return userProfileHeaderData.copy(str15, str9, str10, str11, str12, list3, z2, viewerEdge2, verifications2, homepagePostsConnection2, membership2, list4, str13, str14, userNewsletterData2, userFollowData2, userMuteData2, userBlockData2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final HomepagePostsConnection getHomepagePostsConnection() {
        return this.homepagePostsConnection;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final Membership getMembership() {
        return this.membership;
    }

    public final List<AuthoredBook> component12() {
        return this.authoredBooks;
    }

    /* JADX INFO: renamed from: component13, reason: from getter */
    public final String getBio() {
        return this.bio;
    }

    /* JADX INFO: renamed from: component14, reason: from getter */
    public final String getAboutAsHtml() {
        return this.aboutAsHtml;
    }

    /* JADX INFO: renamed from: component15, reason: from getter */
    public final UserNewsletterData getUserNewsletterData() {
        return this.userNewsletterData;
    }

    /* JADX INFO: renamed from: component16, reason: from getter */
    public final UserFollowData getUserFollowData() {
        return this.userFollowData;
    }

    /* JADX INFO: renamed from: component17, reason: from getter */
    public final UserMuteData getUserMuteData() {
        return this.userMuteData;
    }

    /* JADX INFO: renamed from: component18, reason: from getter */
    public final UserBlockData getUserBlockData() {
        return this.userBlockData;
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
    public final String getUsername() {
        return this.username;
    }

    public final List<String> component6() {
        return this.pronouns;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final boolean getHasSubdomain() {
        return this.hasSubdomain;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Verifications getVerifications() {
        return this.verifications;
    }

    public final UserProfileHeaderData copy(String __typename, String id, String name, String imageId, String username, List<String> pronouns, boolean hasSubdomain, ViewerEdge viewerEdge, Verifications verifications, HomepagePostsConnection homepagePostsConnection, Membership membership, List<AuthoredBook> authoredBooks, String bio, String aboutAsHtml, UserNewsletterData userNewsletterData, UserFollowData userFollowData, UserMuteData userMuteData, UserBlockData userBlockData) {
        __typename.getClass();
        id.getClass();
        pronouns.getClass();
        viewerEdge.getClass();
        authoredBooks.getClass();
        userNewsletterData.getClass();
        userFollowData.getClass();
        userMuteData.getClass();
        userBlockData.getClass();
        return new UserProfileHeaderData(__typename, id, name, imageId, username, pronouns, hasSubdomain, viewerEdge, verifications, homepagePostsConnection, membership, authoredBooks, bio, aboutAsHtml, userNewsletterData, userFollowData, userMuteData, userBlockData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserProfileHeaderData)) {
            return false;
        }
        UserProfileHeaderData userProfileHeaderData = (UserProfileHeaderData) other;
        return g76.L(this.__typename, userProfileHeaderData.__typename) && g76.L(this.id, userProfileHeaderData.id) && g76.L(this.name, userProfileHeaderData.name) && g76.L(this.imageId, userProfileHeaderData.imageId) && g76.L(this.username, userProfileHeaderData.username) && g76.L(this.pronouns, userProfileHeaderData.pronouns) && this.hasSubdomain == userProfileHeaderData.hasSubdomain && g76.L(this.viewerEdge, userProfileHeaderData.viewerEdge) && g76.L(this.verifications, userProfileHeaderData.verifications) && g76.L(this.homepagePostsConnection, userProfileHeaderData.homepagePostsConnection) && g76.L(this.membership, userProfileHeaderData.membership) && g76.L(this.authoredBooks, userProfileHeaderData.authoredBooks) && g76.L(this.bio, userProfileHeaderData.bio) && g76.L(this.aboutAsHtml, userProfileHeaderData.aboutAsHtml) && g76.L(this.userNewsletterData, userProfileHeaderData.userNewsletterData) && g76.L(this.userFollowData, userProfileHeaderData.userFollowData) && g76.L(this.userMuteData, userProfileHeaderData.userMuteData) && g76.L(this.userBlockData, userProfileHeaderData.userBlockData);
    }

    public final String getAboutAsHtml() {
        return this.aboutAsHtml;
    }

    public final List<AuthoredBook> getAuthoredBooks() {
        return this.authoredBooks;
    }

    public final String getBio() {
        return this.bio;
    }

    public final boolean getHasSubdomain() {
        return this.hasSubdomain;
    }

    public final HomepagePostsConnection getHomepagePostsConnection() {
        return this.homepagePostsConnection;
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

    public final List<String> getPronouns() {
        return this.pronouns;
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

    public final Verifications getVerifications() {
        return this.verifications;
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
        String str2 = this.imageId;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.username;
        int iHashCode3 = (this.viewerEdge.hashCode() + ((wgd.p((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.pronouns) + (this.hasSubdomain ? 1231 : 1237)) * 31)) * 31;
        Verifications verifications = this.verifications;
        int iHashCode4 = (iHashCode3 + (verifications == null ? 0 : verifications.hashCode())) * 31;
        HomepagePostsConnection homepagePostsConnection = this.homepagePostsConnection;
        int iHashCode5 = (iHashCode4 + (homepagePostsConnection == null ? 0 : homepagePostsConnection.hashCode())) * 31;
        Membership membership = this.membership;
        int iP = wgd.p((iHashCode5 + (membership == null ? 0 : membership.hashCode())) * 31, 31, this.authoredBooks);
        String str4 = this.bio;
        int iHashCode6 = (iP + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.aboutAsHtml;
        return this.userBlockData.hashCode() + ((this.userMuteData.hashCode() + ((this.userFollowData.hashCode() + ((this.userNewsletterData.hashCode() + ((iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        String str4 = this.imageId;
        String str5 = this.username;
        List<String> list = this.pronouns;
        boolean z = this.hasSubdomain;
        ViewerEdge viewerEdge = this.viewerEdge;
        Verifications verifications = this.verifications;
        HomepagePostsConnection homepagePostsConnection = this.homepagePostsConnection;
        Membership membership = this.membership;
        List<AuthoredBook> list2 = this.authoredBooks;
        String str6 = this.bio;
        String str7 = this.aboutAsHtml;
        UserNewsletterData userNewsletterData = this.userNewsletterData;
        UserFollowData userFollowData = this.userFollowData;
        UserMuteData userMuteData = this.userMuteData;
        UserBlockData userBlockData = this.userBlockData;
        StringBuilder sbU = y30.u("UserProfileHeaderData(__typename=", str, ", id=", str2, ", name=");
        ka1.C(sbU, str3, ", imageId=", str4, ", username=");
        sbU.append(str5);
        sbU.append(", pronouns=");
        sbU.append(list);
        sbU.append(", hasSubdomain=");
        sbU.append(z);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(", verifications=");
        sbU.append(verifications);
        sbU.append(", homepagePostsConnection=");
        sbU.append(homepagePostsConnection);
        sbU.append(", membership=");
        sbU.append(membership);
        sbU.append(", authoredBooks=");
        sbU.append(list2);
        sbU.append(", bio=");
        ka1.C(sbU, str6, ", aboutAsHtml=", str7, ", userNewsletterData=");
        sbU.append(userNewsletterData);
        sbU.append(", userFollowData=");
        sbU.append(userFollowData);
        sbU.append(", userMuteData=");
        sbU.append(userMuteData);
        sbU.append(", userBlockData=");
        sbU.append(userBlockData);
        sbU.append(")");
        return sbU.toString();
    }
}
