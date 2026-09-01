package com.medium.android.graphql.fragment;

import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.graphql.type.MarkupType;
import com.medium.android.graphql.type.PredefinedCatalogType;
import defpackage.b09;
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
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b \n\u0002\u0010\u0000\n\u0002\b+\b\u0086\b\u0018\u00002\u00020\u0001:\u0010UVWXYZ[\\]^_`abcdB\u0085\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\u000e\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u001eJ\u0010\u0010 \u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u001eJ\u0010\u0010!\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b#\u0010$J\u0012\u0010%\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0012\u0010'\u001a\u0004\u0018\u00010\fHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0012\u0010)\u001a\u0004\u0018\u00010\u000eHÆ\u0003¢\u0006\u0004\b)\u0010*J\u0012\u0010+\u001a\u0004\u0018\u00010\u0010HÆ\u0003¢\u0006\u0004\b+\u0010,J\u0012\u0010-\u001a\u0004\u0018\u00010\u0012HÆ\u0003¢\u0006\u0004\b-\u0010.J\u0012\u0010/\u001a\u0004\u0018\u00010\u0014HÆ\u0003¢\u0006\u0004\b/\u00100J\u0012\u00101\u001a\u0004\u0018\u00010\u0016HÆ\u0003¢\u0006\u0004\b1\u00102J\u0018\u00103\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018HÆ\u0003¢\u0006\u0004\b3\u00104J¨\u0001\u00105\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\u0010\b\u0002\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018HÆ\u0001¢\u0006\u0004\b5\u00106J\u0010\u00107\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b7\u0010\u001eJ\u0010\u00108\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b8\u00109J\u001a\u0010<\u001a\u00020\u00062\b\u0010;\u001a\u0004\u0018\u00010:HÖ\u0003¢\u0006\u0004\b<\u0010=R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010>\u001a\u0004\b?\u0010\u001eR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010>\u001a\u0004\b@\u0010\u001eR\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010>\u001a\u0004\bA\u0010\u001eR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010B\u001a\u0004\b\u0007\u0010\"R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010C\u001a\u0004\bD\u0010$R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010E\u001a\u0004\bF\u0010&R\u0019\u0010\r\u001a\u0004\u0018\u00010\f8\u0006¢\u0006\f\n\u0004\b\r\u0010G\u001a\u0004\bH\u0010(R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010I\u001a\u0004\bJ\u0010*R\u0019\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010K\u001a\u0004\bL\u0010,R\u0019\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006¢\u0006\f\n\u0004\b\u0013\u0010M\u001a\u0004\bN\u0010.R\u0019\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006¢\u0006\f\n\u0004\b\u0015\u0010O\u001a\u0004\bP\u00100R\u0019\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006¢\u0006\f\n\u0004\b\u0017\u0010Q\u001a\u0004\bR\u00102R\u001f\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u00188\u0006¢\u0006\f\n\u0004\b\u001a\u0010S\u001a\u0004\bT\u00104¨\u0006e"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData;", "Lg15;", "", "__typename", "notificationName", "notificationType", "", "isUnread", "", "occurredAt", "", "milestoneArg", "Lcom/medium/android/graphql/fragment/NotificationData$Post;", "post", "Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;", "responsePost", "Lcom/medium/android/graphql/fragment/NotificationData$Quote;", "quote", "Lcom/medium/android/graphql/fragment/NotificationData$Actor;", "actor", "Lcom/medium/android/graphql/fragment/NotificationData$Catalog;", "catalog", "Lcom/medium/android/graphql/fragment/NotificationData$Collection;", "collection", "", "Lcom/medium/android/graphql/fragment/NotificationData$RollupItem;", "rollupItems", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJLjava/lang/Integer;Lcom/medium/android/graphql/fragment/NotificationData$Post;Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;Lcom/medium/android/graphql/fragment/NotificationData$Quote;Lcom/medium/android/graphql/fragment/NotificationData$Actor;Lcom/medium/android/graphql/fragment/NotificationData$Catalog;Lcom/medium/android/graphql/fragment/NotificationData$Collection;Ljava/util/List;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "()Z", "component5", "()J", "component6", "()Ljava/lang/Integer;", "component7", "()Lcom/medium/android/graphql/fragment/NotificationData$Post;", "component8", "()Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;", "component9", "()Lcom/medium/android/graphql/fragment/NotificationData$Quote;", "component10", "()Lcom/medium/android/graphql/fragment/NotificationData$Actor;", "component11", "()Lcom/medium/android/graphql/fragment/NotificationData$Catalog;", "component12", "()Lcom/medium/android/graphql/fragment/NotificationData$Collection;", "component13", "()Ljava/util/List;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJLjava/lang/Integer;Lcom/medium/android/graphql/fragment/NotificationData$Post;Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;Lcom/medium/android/graphql/fragment/NotificationData$Quote;Lcom/medium/android/graphql/fragment/NotificationData$Actor;Lcom/medium/android/graphql/fragment/NotificationData$Catalog;Lcom/medium/android/graphql/fragment/NotificationData$Collection;Ljava/util/List;)Lcom/medium/android/graphql/fragment/NotificationData;", "toString", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getNotificationName", "getNotificationType", "Z", "J", "getOccurredAt", "Ljava/lang/Integer;", "getMilestoneArg", "Lcom/medium/android/graphql/fragment/NotificationData$Post;", "getPost", "Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;", "getResponsePost", "Lcom/medium/android/graphql/fragment/NotificationData$Quote;", "getQuote", "Lcom/medium/android/graphql/fragment/NotificationData$Actor;", "getActor", "Lcom/medium/android/graphql/fragment/NotificationData$Catalog;", "getCatalog", "Lcom/medium/android/graphql/fragment/NotificationData$Collection;", "getCollection", "Ljava/util/List;", "getRollupItems", "Post", "ResponsePost", "Quote", "Actor", "Catalog", "Collection", "RollupItem", "Creator", "Content", "BodyModel", "Paragraph", "Markup", "NewsletterV3", "Creator1", "Avatar", "ViewerEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class NotificationData implements g15 {
    private final String __typename;
    private final Actor actor;
    private final Catalog catalog;
    private final Collection collection;
    private final boolean isUnread;
    private final Integer milestoneArg;
    private final String notificationName;
    private final String notificationType;
    private final long occurredAt;
    private final Post post;
    private final Quote quote;
    private final ResponsePost responsePost;
    private final List<RollupItem> rollupItems;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\n\u001a\u00020\u000b¢\u0006\u0004\b\f\u0010\rJ\t\u0010\u0018\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001c\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001d\u001a\u0004\u0018\u00010\tHÆ\u0003J\t\u0010\u001e\u001a\u00020\u000bHÆ\u0003JW\u0010\u001f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\n\u001a\u00020\u000bHÆ\u0001J\u0013\u0010 \u001a\u00020!2\b\u0010\"\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010#\u001a\u00020$HÖ\u0001J\t\u0010%\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u000fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u000fR\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Actor;", "", "__typename", "", "id", "imageId", "name", "bio", "newsletterV3", "Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;", "userFollowData", "Lcom/medium/android/graphql/fragment/UserFollowData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;Lcom/medium/android/graphql/fragment/UserFollowData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageId", "getName", "getBio", "getNewsletterV3", "()Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;", "getUserFollowData", "()Lcom/medium/android/graphql/fragment/UserFollowData;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Actor {
        private final String __typename;
        private final String bio;
        private final String id;
        private final String imageId;
        private final String name;
        private final NewsletterV3 newsletterV3;
        private final UserFollowData userFollowData;

        public Actor(String str, String str2, String str3, String str4, String str5, NewsletterV3 newsletterV3, UserFollowData userFollowData) {
            str.getClass();
            str2.getClass();
            userFollowData.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageId = str3;
            this.name = str4;
            this.bio = str5;
            this.newsletterV3 = newsletterV3;
            this.userFollowData = userFollowData;
        }

        public static /* synthetic */ Actor copy$default(Actor actor, String str, String str2, String str3, String str4, String str5, NewsletterV3 newsletterV3, UserFollowData userFollowData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = actor.__typename;
            }
            if ((i & 2) != 0) {
                str2 = actor.id;
            }
            if ((i & 4) != 0) {
                str3 = actor.imageId;
            }
            if ((i & 8) != 0) {
                str4 = actor.name;
            }
            if ((i & 16) != 0) {
                str5 = actor.bio;
            }
            if ((i & 32) != 0) {
                newsletterV3 = actor.newsletterV3;
            }
            if ((i & 64) != 0) {
                userFollowData = actor.userFollowData;
            }
            NewsletterV3 newsletterV32 = newsletterV3;
            UserFollowData userFollowData2 = userFollowData;
            String str6 = str5;
            String str7 = str3;
            return actor.copy(str, str2, str7, str4, str6, newsletterV32, userFollowData2);
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
        public final String getImageId() {
            return this.imageId;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final String getBio() {
            return this.bio;
        }

        /* JADX INFO: renamed from: component6, reason: from getter */
        public final NewsletterV3 getNewsletterV3() {
            return this.newsletterV3;
        }

        /* JADX INFO: renamed from: component7, reason: from getter */
        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final Actor copy(String __typename, String id, String imageId, String name, String bio, NewsletterV3 newsletterV3, UserFollowData userFollowData) {
            __typename.getClass();
            id.getClass();
            userFollowData.getClass();
            return new Actor(__typename, id, imageId, name, bio, newsletterV3, userFollowData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Actor)) {
                return false;
            }
            Actor actor = (Actor) other;
            return g76.L(this.__typename, actor.__typename) && g76.L(this.id, actor.id) && g76.L(this.imageId, actor.imageId) && g76.L(this.name, actor.name) && g76.L(this.bio, actor.bio) && g76.L(this.newsletterV3, actor.newsletterV3) && g76.L(this.userFollowData, actor.userFollowData);
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

        public final String getName() {
            return this.name;
        }

        public final NewsletterV3 getNewsletterV3() {
            return this.newsletterV3;
        }

        public final UserFollowData getUserFollowData() {
            return this.userFollowData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.imageId;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.name;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.bio;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            NewsletterV3 newsletterV3 = this.newsletterV3;
            return this.userFollowData.hashCode() + ((iHashCode3 + (newsletterV3 != null ? newsletterV3.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.imageId;
            String str4 = this.name;
            String str5 = this.bio;
            NewsletterV3 newsletterV3 = this.newsletterV3;
            UserFollowData userFollowData = this.userFollowData;
            StringBuilder sbU = y30.u(Plbho.BQPLQfqBiWcVMD, str, ", id=", str2, ", imageId=");
            ka1.C(sbU, str3, ", name=", str4, ", bio=");
            sbU.append(str5);
            sbU.append(", newsletterV3=");
            sbU.append(newsletterV3);
            sbU.append(", userFollowData=");
            sbU.append(userFollowData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Avatar;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J#\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;", "", "__typename", "", "paragraphs", "", "Lcom/medium/android/graphql/fragment/NotificationData$Paragraph;", "<init>", "(Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getParagraphs", "()Ljava/util/List;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BodyModel {
        private final String __typename;
        private final List<Paragraph> paragraphs;

        public BodyModel(String str, List<Paragraph> list) {
            str.getClass();
            list.getClass();
            this.__typename = str;
            this.paragraphs = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ BodyModel copy$default(BodyModel bodyModel, String str, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = bodyModel.__typename;
            }
            if ((i & 2) != 0) {
                list = bodyModel.paragraphs;
            }
            return bodyModel.copy(str, list);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        public final List<Paragraph> component2() {
            return this.paragraphs;
        }

        public final BodyModel copy(String __typename, List<Paragraph> paragraphs) {
            __typename.getClass();
            paragraphs.getClass();
            return new BodyModel(__typename, paragraphs);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BodyModel)) {
                return false;
            }
            BodyModel bodyModel = (BodyModel) other;
            return g76.L(this.__typename, bodyModel.__typename) && g76.L(this.paragraphs, bodyModel.paragraphs);
        }

        public final List<Paragraph> getParagraphs() {
            return this.paragraphs;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.paragraphs.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ka1.s("BodyModel(__typename=", this.__typename, ", paragraphs=", ")", this.paragraphs);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010\u0018\u001a\u00020\tHÆ\u0003J=\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Catalog;", "", "__typename", "", "id", "name", "predefined", "Lcom/medium/android/graphql/type/PredefinedCatalogType;", "creator", "Lcom/medium/android/graphql/fragment/NotificationData$Creator1;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/type/PredefinedCatalogType;Lcom/medium/android/graphql/fragment/NotificationData$Creator1;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getPredefined", "()Lcom/medium/android/graphql/type/PredefinedCatalogType;", "getCreator", "()Lcom/medium/android/graphql/fragment/NotificationData$Creator1;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Catalog {
        private final String __typename;
        private final Creator1 creator;
        private final String id;
        private final String name;
        private final PredefinedCatalogType predefined;

        public Catalog(String str, String str2, String str3, PredefinedCatalogType predefinedCatalogType, Creator1 creator1) {
            str.getClass();
            str2.getClass();
            str3.getClass();
            creator1.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.predefined = predefinedCatalogType;
            this.creator = creator1;
        }

        public static /* synthetic */ Catalog copy$default(Catalog catalog, String str, String str2, String str3, PredefinedCatalogType predefinedCatalogType, Creator1 creator1, int i, Object obj) {
            if ((i & 1) != 0) {
                str = catalog.__typename;
            }
            if ((i & 2) != 0) {
                str2 = catalog.id;
            }
            if ((i & 4) != 0) {
                str3 = catalog.name;
            }
            if ((i & 8) != 0) {
                predefinedCatalogType = catalog.predefined;
            }
            if ((i & 16) != 0) {
                creator1 = catalog.creator;
            }
            Creator1 creator12 = creator1;
            String str4 = str3;
            return catalog.copy(str, str2, str4, predefinedCatalogType, creator12);
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
        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Creator1 getCreator() {
            return this.creator;
        }

        public final Catalog copy(String __typename, String id, String name, PredefinedCatalogType predefined, Creator1 creator) {
            __typename.getClass();
            id.getClass();
            name.getClass();
            creator.getClass();
            return new Catalog(__typename, id, name, predefined, creator);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Catalog)) {
                return false;
            }
            Catalog catalog = (Catalog) other;
            return g76.L(this.__typename, catalog.__typename) && g76.L(this.id, catalog.id) && g76.L(this.name, catalog.name) && this.predefined == catalog.predefined && g76.L(this.creator, catalog.creator);
        }

        public final Creator1 getCreator() {
            return this.creator;
        }

        public final String getId() {
            return this.id;
        }

        public final String getName() {
            return this.name;
        }

        public final PredefinedCatalogType getPredefined() {
            return this.predefined;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.name);
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            return this.creator.hashCode() + ((iO + (predefinedCatalogType == null ? 0 : predefinedCatalogType.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            PredefinedCatalogType predefinedCatalogType = this.predefined;
            Creator1 creator1 = this.creator;
            StringBuilder sbU = y30.u("Catalog(__typename=", str, ", id=", str2, ", name=");
            sbU.append(str3);
            sbU.append(", predefined=");
            sbU.append(predefinedCatalogType);
            sbU.append(", creator=");
            sbU.append(creator1);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010\u0018\u001a\u00020\tHÆ\u0003J?\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u001eHÖ\u0001J\t\u0010\u001f\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006 "}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Collection;", "", "__typename", "", "id", "name", "avatar", "Lcom/medium/android/graphql/fragment/NotificationData$Avatar;", "viewerEdge", "Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData$Avatar;Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getAvatar", "()Lcom/medium/android/graphql/fragment/NotificationData$Avatar;", "getViewerEdge", "()Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Collection {
        private final String __typename;
        private final Avatar avatar;
        private final String id;
        private final String name;
        private final ViewerEdge viewerEdge;

        public Collection(String str, String str2, String str3, Avatar avatar, ViewerEdge viewerEdge) {
            str.getClass();
            str2.getClass();
            viewerEdge.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.avatar = avatar;
            this.viewerEdge = viewerEdge;
        }

        public static /* synthetic */ Collection copy$default(Collection collection, String str, String str2, String str3, Avatar avatar, ViewerEdge viewerEdge, int i, Object obj) {
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
            ViewerEdge viewerEdge2 = viewerEdge;
            String str4 = str3;
            return collection.copy(str, str2, str4, avatar, viewerEdge2);
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

        public final Collection copy(String __typename, String id, String name, Avatar avatar, ViewerEdge viewerEdge) {
            __typename.getClass();
            id.getClass();
            viewerEdge.getClass();
            return new Collection(__typename, id, name, avatar, viewerEdge);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Collection)) {
                return false;
            }
            Collection collection = (Collection) other;
            return g76.L(this.__typename, collection.__typename) && g76.L(this.id, collection.id) && g76.L(this.name, collection.name) && g76.L(this.avatar, collection.avatar) && g76.L(this.viewerEdge, collection.viewerEdge);
        }

        public final Avatar getAvatar() {
            return this.avatar;
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
            return this.viewerEdge.hashCode() + ((iHashCode + (avatar != null ? avatar.hashCode() : 0)) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.name;
            Avatar avatar = this.avatar;
            ViewerEdge viewerEdge = this.viewerEdge;
            StringBuilder sbU = y30.u("Collection(__typename=", str, ", id=", str2, ", name=");
            sbU.append(str3);
            sbU.append(", avatar=");
            sbU.append(avatar);
            sbU.append(", viewerEdge=");
            sbU.append(viewerEdge);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Content;", "", "__typename", "", "bodyModel", "Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;)V", "get__typename", "()Ljava/lang/String;", "getBodyModel", "()Lcom/medium/android/graphql/fragment/NotificationData$BodyModel;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Content {
        private final String __typename;
        private final BodyModel bodyModel;

        public Content(String str, BodyModel bodyModel) {
            str.getClass();
            bodyModel.getClass();
            this.__typename = str;
            this.bodyModel = bodyModel;
        }

        public static /* synthetic */ Content copy$default(Content content, String str, BodyModel bodyModel, int i, Object obj) {
            if ((i & 1) != 0) {
                str = content.__typename;
            }
            if ((i & 2) != 0) {
                bodyModel = content.bodyModel;
            }
            return content.copy(str, bodyModel);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final BodyModel getBodyModel() {
            return this.bodyModel;
        }

        public final Content copy(String __typename, BodyModel bodyModel) {
            __typename.getClass();
            bodyModel.getClass();
            return new Content(__typename, bodyModel);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Content)) {
                return false;
            }
            Content content = (Content) other;
            return g76.L(this.__typename, content.__typename) && g76.L(this.bodyModel, content.bodyModel);
        }

        public final BodyModel getBodyModel() {
            return this.bodyModel;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.bodyModel.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return "Content(__typename=" + this.__typename + ", bodyModel=" + this.bodyModel + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0003HÆ\u0003J)\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Creator;", "", "__typename", "", "id", "imageId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getImageId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator {
        private final String __typename;
        private final String id;
        private final String imageId;

        public Creator(String str, String str2, String str3) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.imageId = str3;
        }

        public static /* synthetic */ Creator copy$default(Creator creator, String str, String str2, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator.id;
            }
            if ((i & 4) != 0) {
                str3 = creator.imageId;
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
        public final String getImageId() {
            return this.imageId;
        }

        public final Creator copy(String __typename, String id, String imageId) {
            __typename.getClass();
            id.getClass();
            return new Creator(__typename, id, imageId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator)) {
                return false;
            }
            Creator creator = (Creator) other;
            return g76.L(this.__typename, creator.__typename) && g76.L(this.id, creator.id) && g76.L(this.imageId, creator.imageId);
        }

        public final String getId() {
            return this.id;
        }

        public final String getImageId() {
            return this.imageId;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.imageId;
            return iO + (str == null ? 0 : str.hashCode());
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return ka1.v(y30.u("Creator(__typename=", str, ", id=", str2, ", imageId="), this.imageId, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0003HÆ\u0003J5\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Creator1;", "", "__typename", "", "id", "name", "imageId", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "getName", "getImageId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Creator1 {
        private final String __typename;
        private final String id;
        private final String imageId;
        private final String name;

        public Creator1(String str, String str2, String str3, String str4) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.name = str3;
            this.imageId = str4;
        }

        public static /* synthetic */ Creator1 copy$default(Creator1 creator1, String str, String str2, String str3, String str4, int i, Object obj) {
            if ((i & 1) != 0) {
                str = creator1.__typename;
            }
            if ((i & 2) != 0) {
                str2 = creator1.id;
            }
            if ((i & 4) != 0) {
                str3 = creator1.name;
            }
            if ((i & 8) != 0) {
                str4 = creator1.imageId;
            }
            return creator1.copy(str, str2, str3, str4);
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

        public final Creator1 copy(String __typename, String id, String name, String imageId) {
            __typename.getClass();
            id.getClass();
            return new Creator1(__typename, id, name, imageId);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Creator1)) {
                return false;
            }
            Creator1 creator1 = (Creator1) other;
            return g76.L(this.__typename, creator1.__typename) && g76.L(this.id, creator1.id) && g76.L(this.name, creator1.name) && g76.L(this.imageId, creator1.imageId);
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

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.name;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.imageId;
            return iHashCode + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            return km4.C(y30.u("Creator1(__typename=", str, ", id=", str2, ", name="), this.name, ", imageId=", this.imageId, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0007HÆ\u0003J3\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Markup;", "", "__typename", "", "type", "Lcom/medium/android/graphql/type/MarkupType;", "start", "", "end", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/MarkupType;II)V", "get__typename", "()Ljava/lang/String;", "getType", "()Lcom/medium/android/graphql/type/MarkupType;", "getStart", "()I", "getEnd", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Markup {
        private final String __typename;
        private final int end;
        private final int start;
        private final MarkupType type;

        public Markup(String str, MarkupType markupType, int i, int i2) {
            str.getClass();
            this.__typename = str;
            this.type = markupType;
            this.start = i;
            this.end = i2;
        }

        public static /* synthetic */ Markup copy$default(Markup markup, String str, MarkupType markupType, int i, int i2, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                str = markup.__typename;
            }
            if ((i3 & 2) != 0) {
                markupType = markup.type;
            }
            if ((i3 & 4) != 0) {
                i = markup.start;
            }
            if ((i3 & 8) != 0) {
                i2 = markup.end;
            }
            return markup.copy(str, markupType, i, i2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MarkupType getType() {
            return this.type;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final int getStart() {
            return this.start;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final int getEnd() {
            return this.end;
        }

        public final Markup copy(String __typename, MarkupType type, int start, int end) {
            __typename.getClass();
            return new Markup(__typename, type, start, end);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Markup)) {
                return false;
            }
            Markup markup = (Markup) other;
            return g76.L(this.__typename, markup.__typename) && this.type == markup.type && this.start == markup.start && this.end == markup.end;
        }

        public final int getEnd() {
            return this.end;
        }

        public final int getStart() {
            return this.start;
        }

        public final MarkupType getType() {
            return this.type;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MarkupType markupType = this.type;
            return ((((iHashCode + (markupType == null ? 0 : markupType.hashCode())) * 31) + this.start) * 31) + this.end;
        }

        public final String toString() {
            return "Markup(__typename=" + this.__typename + ", type=" + this.type + ", start=" + this.start + ", end=" + this.end + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$NewsletterV3;", "", "__typename", "", "id", "newsletterData", "Lcom/medium/android/graphql/fragment/NewsletterData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NewsletterData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getNewsletterData", "()Lcom/medium/android/graphql/fragment/NewsletterData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class NewsletterV3 {
        private final String __typename;
        private final String id;
        private final NewsletterData newsletterData;

        public NewsletterV3(String str, String str2, NewsletterData newsletterData) {
            str.getClass();
            str2.getClass();
            newsletterData.getClass();
            this.__typename = str;
            this.id = str2;
            this.newsletterData = newsletterData;
        }

        public static /* synthetic */ NewsletterV3 copy$default(NewsletterV3 newsletterV3, String str, String str2, NewsletterData newsletterData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = newsletterV3.__typename;
            }
            if ((i & 2) != 0) {
                str2 = newsletterV3.id;
            }
            if ((i & 4) != 0) {
                newsletterData = newsletterV3.newsletterData;
            }
            return newsletterV3.copy(str, str2, newsletterData);
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
        public final NewsletterData getNewsletterData() {
            return this.newsletterData;
        }

        public final NewsletterV3 copy(String __typename, String id, NewsletterData newsletterData) {
            __typename.getClass();
            id.getClass();
            newsletterData.getClass();
            return new NewsletterV3(__typename, id, newsletterData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof NewsletterV3)) {
                return false;
            }
            NewsletterV3 newsletterV3 = (NewsletterV3) other;
            return g76.L(this.__typename, newsletterV3.__typename) && g76.L(this.id, newsletterV3.id) && g76.L(this.newsletterData, newsletterV3.newsletterData);
        }

        public final String getId() {
            return this.id;
        }

        public final NewsletterData getNewsletterData() {
            return this.newsletterData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.newsletterData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            NewsletterData newsletterData = this.newsletterData;
            StringBuilder sbU = y30.u("NewsletterV3(__typename=", str, ", id=", str2, ", newsletterData=");
            sbU.append(newsletterData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0003J9\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007HÆ\u0001J\u0013\u0010\u0016\u001a\u00020\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Paragraph;", "", "__typename", "", "id", "text", "markups", "", "Lcom/medium/android/graphql/fragment/NotificationData$Markup;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "get__typename", "()Ljava/lang/String;", "getId", "getText", "getMarkups", "()Ljava/util/List;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Paragraph {
        private final String __typename;
        private final String id;
        private final List<Markup> markups;
        private final String text;

        public Paragraph(String str, String str2, String str3, List<Markup> list) {
            str.getClass();
            str2.getClass();
            list.getClass();
            this.__typename = str;
            this.id = str2;
            this.text = str3;
            this.markups = list;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Paragraph copy$default(Paragraph paragraph, String str, String str2, String str3, List list, int i, Object obj) {
            if ((i & 1) != 0) {
                str = paragraph.__typename;
            }
            if ((i & 2) != 0) {
                str2 = paragraph.id;
            }
            if ((i & 4) != 0) {
                str3 = paragraph.text;
            }
            if ((i & 8) != 0) {
                list = paragraph.markups;
            }
            return paragraph.copy(str, str2, str3, list);
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
        public final String getText() {
            return this.text;
        }

        public final List<Markup> component4() {
            return this.markups;
        }

        public final Paragraph copy(String __typename, String id, String text, List<Markup> markups) {
            __typename.getClass();
            id.getClass();
            markups.getClass();
            return new Paragraph(__typename, id, text, markups);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Paragraph)) {
                return false;
            }
            Paragraph paragraph = (Paragraph) other;
            return g76.L(this.__typename, paragraph.__typename) && g76.L(this.id, paragraph.id) && g76.L(this.text, paragraph.text) && g76.L(this.markups, paragraph.markups);
        }

        public final String getId() {
            return this.id;
        }

        public final List<Markup> getMarkups() {
            return this.markups;
        }

        public final String getText() {
            return this.text;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.text;
            return this.markups.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.text;
            List<Markup> list = this.markups;
            StringBuilder sbU = y30.u("Paragraph(__typename=", str, ", id=", str2, ", text=");
            sbU.append(str3);
            sbU.append(", markups=");
            sbU.append(list);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0007HÆ\u0003J5\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Post;", "", "__typename", "", "id", "title", "creator", "Lcom/medium/android/graphql/fragment/NotificationData$Creator;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData$Creator;)V", "get__typename", "()Ljava/lang/String;", "getId", "getTitle", "getCreator", "()Lcom/medium/android/graphql/fragment/NotificationData$Creator;", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Post {
        private final String __typename;
        private final Creator creator;
        private final String id;
        private final String title;

        public Post(String str, String str2, String str3, Creator creator) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.id = str2;
            this.title = str3;
            this.creator = creator;
        }

        public static /* synthetic */ Post copy$default(Post post, String str, String str2, String str3, Creator creator, int i, Object obj) {
            if ((i & 1) != 0) {
                str = post.__typename;
            }
            if ((i & 2) != 0) {
                str2 = post.id;
            }
            if ((i & 4) != 0) {
                str3 = post.title;
            }
            if ((i & 8) != 0) {
                creator = post.creator;
            }
            return post.copy(str, str2, str3, creator);
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
        public final String getTitle() {
            return this.title;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final Creator getCreator() {
            return this.creator;
        }

        public final Post copy(String __typename, String id, String title, Creator creator) {
            __typename.getClass();
            id.getClass();
            return new Post(__typename, id, title, creator);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Post)) {
                return false;
            }
            Post post = (Post) other;
            return g76.L(this.__typename, post.__typename) && g76.L(this.id, post.id) && g76.L(this.title, post.title) && g76.L(this.creator, post.creator);
        }

        public final Creator getCreator() {
            return this.creator;
        }

        public final String getId() {
            return this.id;
        }

        public final String getTitle() {
            return this.title;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.id);
            String str = this.title;
            int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
            Creator creator = this.creator;
            return iHashCode + (creator != null ? creator.hashCode() : 0);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            String str3 = this.title;
            Creator creator = this.creator;
            StringBuilder sbU = y30.u("Post(__typename=", str, ", id=", str2, ", title=");
            sbU.append(str3);
            sbU.append(", creator=");
            sbU.append(creator);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$Quote;", "", "__typename", "", "id", "highlightData", "Lcom/medium/android/graphql/fragment/HighlightData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/HighlightData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getHighlightData", "()Lcom/medium/android/graphql/fragment/HighlightData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Quote {
        private final String __typename;
        private final HighlightData highlightData;
        private final String id;

        public Quote(String str, String str2, HighlightData highlightData) {
            str.getClass();
            str2.getClass();
            highlightData.getClass();
            this.__typename = str;
            this.id = str2;
            this.highlightData = highlightData;
        }

        public static /* synthetic */ Quote copy$default(Quote quote, String str, String str2, HighlightData highlightData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = quote.__typename;
            }
            if ((i & 2) != 0) {
                str2 = quote.id;
            }
            if ((i & 4) != 0) {
                highlightData = quote.highlightData;
            }
            return quote.copy(str, str2, highlightData);
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
        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final Quote copy(String __typename, String id, HighlightData highlightData) {
            __typename.getClass();
            id.getClass();
            highlightData.getClass();
            return new Quote(__typename, id, highlightData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Quote)) {
                return false;
            }
            Quote quote = (Quote) other;
            return g76.L(this.__typename, quote.__typename) && g76.L(this.id, quote.id) && g76.L(this.highlightData, quote.highlightData);
        }

        public final HighlightData getHighlightData() {
            return this.highlightData;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.highlightData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            HighlightData highlightData = this.highlightData;
            StringBuilder sbU = y30.u("Quote(__typename=", str, ", id=", str2, ", highlightData=");
            sbU.append(highlightData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$ResponsePost;", "", "__typename", "", "id", "content", "Lcom/medium/android/graphql/fragment/NotificationData$Content;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/NotificationData$Content;)V", "get__typename", "()Ljava/lang/String;", "getId", "getContent", "()Lcom/medium/android/graphql/fragment/NotificationData$Content;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ResponsePost {
        private final String __typename;
        private final Content content;
        private final String id;

        public ResponsePost(String str, String str2, Content content) {
            str.getClass();
            str2.getClass();
            content.getClass();
            this.__typename = str;
            this.id = str2;
            this.content = content;
        }

        public static /* synthetic */ ResponsePost copy$default(ResponsePost responsePost, String str, String str2, Content content, int i, Object obj) {
            if ((i & 1) != 0) {
                str = responsePost.__typename;
            }
            if ((i & 2) != 0) {
                str2 = responsePost.id;
            }
            if ((i & 4) != 0) {
                content = responsePost.content;
            }
            return responsePost.copy(str, str2, content);
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
        public final Content getContent() {
            return this.content;
        }

        public final ResponsePost copy(String __typename, String id, Content content) {
            __typename.getClass();
            id.getClass();
            content.getClass();
            return new ResponsePost(__typename, id, content);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ResponsePost)) {
                return false;
            }
            ResponsePost responsePost = (ResponsePost) other;
            return g76.L(this.__typename, responsePost.__typename) && g76.L(this.id, responsePost.id) && g76.L(this.content, responsePost.content);
        }

        public final Content getContent() {
            return this.content;
        }

        public final String getId() {
            return this.id;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.content.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            Content content = this.content;
            StringBuilder sbU = y30.u("ResponsePost(__typename=", str, ", id=", str2, ", content=");
            sbU.append(content);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$RollupItem;", "", "__typename", "", "notificationName", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getNotificationName", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class RollupItem {
        private final String __typename;
        private final String notificationName;

        public RollupItem(String str, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.notificationName = str2;
        }

        public static /* synthetic */ RollupItem copy$default(RollupItem rollupItem, String str, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = rollupItem.__typename;
            }
            if ((i & 2) != 0) {
                str2 = rollupItem.notificationName;
            }
            return rollupItem.copy(str, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getNotificationName() {
            return this.notificationName;
        }

        public final RollupItem copy(String __typename, String notificationName) {
            __typename.getClass();
            notificationName.getClass();
            return new RollupItem(__typename, notificationName);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof RollupItem)) {
                return false;
            }
            RollupItem rollupItem = (RollupItem) other;
            return g76.L(this.__typename, rollupItem.__typename) && g76.L(this.notificationName, rollupItem.notificationName);
        }

        public final String getNotificationName() {
            return this.notificationName;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.notificationName.hashCode() + (this.__typename.hashCode() * 31);
        }

        public final String toString() {
            return ev6.y("RollupItem(__typename=", this.__typename, ", notificationName=", this.notificationName, ")");
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0005HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J'\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\n¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/NotificationData$ViewerEdge;", "", "__typename", "", "isEditor", "", "id", "<init>", "(Ljava/lang/String;ZLjava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "()Z", "getId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public NotificationData(String str, String str2, String str3, boolean z, long j, Integer num, Post post, ResponsePost responsePost, Quote quote, Actor actor, Catalog catalog, Collection collection, List<RollupItem> list) {
        b09.I(str, str2, str3);
        this.__typename = str;
        this.notificationName = str2;
        this.notificationType = str3;
        this.isUnread = z;
        this.occurredAt = j;
        this.milestoneArg = num;
        this.post = post;
        this.responsePost = responsePost;
        this.quote = quote;
        this.actor = actor;
        this.catalog = catalog;
        this.collection = collection;
        this.rollupItems = list;
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final Actor getActor() {
        return this.actor;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final Catalog getCatalog() {
        return this.catalog;
    }

    /* JADX INFO: renamed from: component12, reason: from getter */
    public final Collection getCollection() {
        return this.collection;
    }

    public final List<RollupItem> component13() {
        return this.rollupItems;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getNotificationName() {
        return this.notificationName;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getNotificationType() {
        return this.notificationType;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final boolean getIsUnread() {
        return this.isUnread;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final long getOccurredAt() {
        return this.occurredAt;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final Integer getMilestoneArg() {
        return this.milestoneArg;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final Post getPost() {
        return this.post;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final ResponsePost getResponsePost() {
        return this.responsePost;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final Quote getQuote() {
        return this.quote;
    }

    public final NotificationData copy(String __typename, String notificationName, String notificationType, boolean isUnread, long occurredAt, Integer milestoneArg, Post post, ResponsePost responsePost, Quote quote, Actor actor, Catalog catalog, Collection collection, List<RollupItem> rollupItems) {
        __typename.getClass();
        notificationName.getClass();
        notificationType.getClass();
        return new NotificationData(__typename, notificationName, notificationType, isUnread, occurredAt, milestoneArg, post, responsePost, quote, actor, catalog, collection, rollupItems);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof NotificationData)) {
            return false;
        }
        NotificationData notificationData = (NotificationData) other;
        return g76.L(this.__typename, notificationData.__typename) && g76.L(this.notificationName, notificationData.notificationName) && g76.L(this.notificationType, notificationData.notificationType) && this.isUnread == notificationData.isUnread && this.occurredAt == notificationData.occurredAt && g76.L(this.milestoneArg, notificationData.milestoneArg) && g76.L(this.post, notificationData.post) && g76.L(this.responsePost, notificationData.responsePost) && g76.L(this.quote, notificationData.quote) && g76.L(this.actor, notificationData.actor) && g76.L(this.catalog, notificationData.catalog) && g76.L(this.collection, notificationData.collection) && g76.L(this.rollupItems, notificationData.rollupItems);
    }

    public final Actor getActor() {
        return this.actor;
    }

    public final Catalog getCatalog() {
        return this.catalog;
    }

    public final Collection getCollection() {
        return this.collection;
    }

    public final Integer getMilestoneArg() {
        return this.milestoneArg;
    }

    public final String getNotificationName() {
        return this.notificationName;
    }

    public final String getNotificationType() {
        return this.notificationType;
    }

    public final long getOccurredAt() {
        return this.occurredAt;
    }

    public final Post getPost() {
        return this.post;
    }

    public final Quote getQuote() {
        return this.quote;
    }

    public final ResponsePost getResponsePost() {
        return this.responsePost;
    }

    public final List<RollupItem> getRollupItems() {
        return this.rollupItems;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = (wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.notificationName), 31, this.notificationType) + (this.isUnread ? 1231 : 1237)) * 31;
        long j = this.occurredAt;
        int i = (iO + ((int) (j ^ (j >>> 32)))) * 31;
        Integer num = this.milestoneArg;
        int iHashCode = (i + (num == null ? 0 : num.hashCode())) * 31;
        Post post = this.post;
        int iHashCode2 = (iHashCode + (post == null ? 0 : post.hashCode())) * 31;
        ResponsePost responsePost = this.responsePost;
        int iHashCode3 = (iHashCode2 + (responsePost == null ? 0 : responsePost.hashCode())) * 31;
        Quote quote = this.quote;
        int iHashCode4 = (iHashCode3 + (quote == null ? 0 : quote.hashCode())) * 31;
        Actor actor = this.actor;
        int iHashCode5 = (iHashCode4 + (actor == null ? 0 : actor.hashCode())) * 31;
        Catalog catalog = this.catalog;
        int iHashCode6 = (iHashCode5 + (catalog == null ? 0 : catalog.hashCode())) * 31;
        Collection collection = this.collection;
        int iHashCode7 = (iHashCode6 + (collection == null ? 0 : collection.hashCode())) * 31;
        List<RollupItem> list = this.rollupItems;
        return iHashCode7 + (list != null ? list.hashCode() : 0);
    }

    public final boolean isUnread() {
        return this.isUnread;
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.notificationName;
        String str3 = this.notificationType;
        boolean z = this.isUnread;
        long j = this.occurredAt;
        Integer num = this.milestoneArg;
        Post post = this.post;
        ResponsePost responsePost = this.responsePost;
        Quote quote = this.quote;
        Actor actor = this.actor;
        Catalog catalog = this.catalog;
        Collection collection = this.collection;
        List<RollupItem> list = this.rollupItems;
        StringBuilder sbU = y30.u("NotificationData(__typename=", str, ", notificationName=", str2, ", notificationType=");
        ka1.D(sbU, str3, ", isUnread=", z, ", occurredAt=");
        sbU.append(j);
        sbU.append(", milestoneArg=");
        sbU.append(num);
        sbU.append(", post=");
        sbU.append(post);
        sbU.append(", responsePost=");
        sbU.append(responsePost);
        sbU.append(", quote=");
        sbU.append(quote);
        sbU.append(", actor=");
        sbU.append(actor);
        sbU.append(", catalog=");
        sbU.append(catalog);
        sbU.append(", collection=");
        sbU.append(collection);
        sbU.append(", rollupItems=");
        sbU.append(list);
        sbU.append(")");
        return sbU.toString();
    }
}
