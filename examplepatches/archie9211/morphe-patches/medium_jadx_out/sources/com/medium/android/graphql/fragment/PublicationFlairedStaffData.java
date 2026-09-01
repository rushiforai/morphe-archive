package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0086\b\u0018\u00002\u00020\u0001:\u0001\u001eB!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0012\u0010\u000b\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ\u0010\u0010\f\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\f\u0010\rJ0\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001d\u0010\r¨\u0006\u001f"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "Lg15;", "", "__typename", "title", "Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData$User;", "user", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData$User;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData$User;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData$User;)Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getTitle", "Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData$User;", "getUser", "User", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationFlairedStaffData implements g15 {
    private final String __typename;
    private final String title;
    private final User user;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PublicationFlairedStaffData$User;", "", "__typename", "", "id", "publicationStaffData", "Lcom/medium/android/graphql/fragment/PublicationStaffData;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublicationStaffData;)V", "get__typename", "()Ljava/lang/String;", "getId", "getPublicationStaffData", "()Lcom/medium/android/graphql/fragment/PublicationStaffData;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class User {
        private final String __typename;
        private final String id;
        private final PublicationStaffData publicationStaffData;

        public User(String str, String str2, PublicationStaffData publicationStaffData) {
            str.getClass();
            str2.getClass();
            publicationStaffData.getClass();
            this.__typename = str;
            this.id = str2;
            this.publicationStaffData = publicationStaffData;
        }

        public static /* synthetic */ User copy$default(User user, String str, String str2, PublicationStaffData publicationStaffData, int i, Object obj) {
            if ((i & 1) != 0) {
                str = user.__typename;
            }
            if ((i & 2) != 0) {
                str2 = user.id;
            }
            if ((i & 4) != 0) {
                publicationStaffData = user.publicationStaffData;
            }
            return user.copy(str, str2, publicationStaffData);
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
        public final PublicationStaffData getPublicationStaffData() {
            return this.publicationStaffData;
        }

        public final User copy(String __typename, String id, PublicationStaffData publicationStaffData) {
            __typename.getClass();
            id.getClass();
            publicationStaffData.getClass();
            return new User(__typename, id, publicationStaffData);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof User)) {
                return false;
            }
            User user = (User) other;
            return g76.L(this.__typename, user.__typename) && g76.L(this.id, user.id) && g76.L(this.publicationStaffData, user.publicationStaffData);
        }

        public final String getId() {
            return this.id;
        }

        public final PublicationStaffData getPublicationStaffData() {
            return this.publicationStaffData;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.publicationStaffData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.id;
            PublicationStaffData publicationStaffData = this.publicationStaffData;
            StringBuilder sbU = y30.u("User(__typename=", str, ", id=", str2, ", publicationStaffData=");
            sbU.append(publicationStaffData);
            sbU.append(")");
            return sbU.toString();
        }
    }

    public PublicationFlairedStaffData(String str, String str2, User user) {
        str.getClass();
        user.getClass();
        this.__typename = str;
        this.title = str2;
        this.user = user;
    }

    public static /* synthetic */ PublicationFlairedStaffData copy$default(PublicationFlairedStaffData publicationFlairedStaffData, String str, String str2, User user, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publicationFlairedStaffData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = publicationFlairedStaffData.title;
        }
        if ((i & 4) != 0) {
            user = publicationFlairedStaffData.user;
        }
        return publicationFlairedStaffData.copy(str, str2, user);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final User getUser() {
        return this.user;
    }

    public final PublicationFlairedStaffData copy(String __typename, String title, User user) {
        __typename.getClass();
        user.getClass();
        return new PublicationFlairedStaffData(__typename, title, user);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationFlairedStaffData)) {
            return false;
        }
        PublicationFlairedStaffData publicationFlairedStaffData = (PublicationFlairedStaffData) other;
        return g76.L(this.__typename, publicationFlairedStaffData.__typename) && g76.L(this.title, publicationFlairedStaffData.title) && g76.L(this.user, publicationFlairedStaffData.user);
    }

    public final String getTitle() {
        return this.title;
    }

    public final User getUser() {
        return this.user;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iHashCode = this.__typename.hashCode() * 31;
        String str = this.title;
        return this.user.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.title;
        User user = this.user;
        StringBuilder sbU = y30.u("PublicationFlairedStaffData(__typename=", str, ", title=", str2, ", user=");
        sbU.append(user);
        sbU.append(")");
        return sbU.toString();
    }
}
