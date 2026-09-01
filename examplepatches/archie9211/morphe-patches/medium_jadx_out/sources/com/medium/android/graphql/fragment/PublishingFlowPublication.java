package com.medium.android.graphql.fragment;

import com.medium.android.graphql.type.PublicationStaffRole;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ho2;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0011\b\u0086\b\u0018\u00002\u00020\u0001:\u0003012BE\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0010J\u0010\u0010\u0013\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0010J\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\tHÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u000bHÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0019J\\\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00022\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000bHÆ\u0001¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001c\u0010\u0010J\u0010\u0010\u001e\u001a\u00020\u001dHÖ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u001a\u0010#\u001a\u00020\"2\b\u0010!\u001a\u0004\u0018\u00010 HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010%\u001a\u0004\b&\u0010\u0010R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b'\u0010\u0010R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010%\u001a\u0004\b(\u0010\u0010R\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010%\u001a\u0004\b)\u0010\u0010R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010*\u001a\u0004\b+\u0010\u0015R\u0019\u0010\n\u001a\u0004\u0018\u00010\t8\u0006¢\u0006\f\n\u0004\b\n\u0010,\u001a\u0004\b-\u0010\u0017R\u0019\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010.\u001a\u0004\b/\u0010\u0019¨\u00063"}, d2 = {"Lcom/medium/android/graphql/fragment/PublishingFlowPublication;", "Lg15;", "", "__typename", "id", "name", "slug", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication$Avatar;", "avatar", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication$ViewerEdge;", "viewerEdge", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;", "userEdge", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublishingFlowPublication$Avatar;Lcom/medium/android/graphql/fragment/PublishingFlowPublication$ViewerEdge;Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "()Lcom/medium/android/graphql/fragment/PublishingFlowPublication$Avatar;", "component6", "()Lcom/medium/android/graphql/fragment/PublishingFlowPublication$ViewerEdge;", "component7", "()Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PublishingFlowPublication$Avatar;Lcom/medium/android/graphql/fragment/PublishingFlowPublication$ViewerEdge;Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;)Lcom/medium/android/graphql/fragment/PublishingFlowPublication;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "getName", "getSlug", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication$Avatar;", "getAvatar", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication$ViewerEdge;", "getViewerEdge", "Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;", "getUserEdge", "Avatar", "ViewerEdge", "UserEdge", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublishingFlowPublication implements g15 {
    private final String __typename;
    private final Avatar avatar;
    private final String id;
    private final String name;
    private final String slug;
    private final UserEdge userEdge;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PublishingFlowPublication$Avatar;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0005HÆ\u0003¢\u0006\u0002\u0010\u000bJ$\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00052\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0015\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\n\n\u0002\u0010\f\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;", "", "__typename", "", "canSubmit", "", "<init>", "(Ljava/lang/String;Ljava/lang/Boolean;)V", "get__typename", "()Ljava/lang/String;", "getCanSubmit", "()Ljava/lang/Boolean;", "Ljava/lang/Boolean;", "component1", "component2", "copy", "(Ljava/lang/String;Ljava/lang/Boolean;)Lcom/medium/android/graphql/fragment/PublishingFlowPublication$UserEdge;", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class UserEdge {
        private final String __typename;
        private final Boolean canSubmit;

        public UserEdge(String str, Boolean bool) {
            str.getClass();
            this.__typename = str;
            this.canSubmit = bool;
        }

        public static /* synthetic */ UserEdge copy$default(UserEdge userEdge, String str, Boolean bool, int i, Object obj) {
            if ((i & 1) != 0) {
                str = userEdge.__typename;
            }
            if ((i & 2) != 0) {
                bool = userEdge.canSubmit;
            }
            return userEdge.copy(str, bool);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Boolean getCanSubmit() {
            return this.canSubmit;
        }

        public final UserEdge copy(String __typename, Boolean canSubmit) {
            __typename.getClass();
            return new UserEdge(__typename, canSubmit);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof UserEdge)) {
                return false;
            }
            UserEdge userEdge = (UserEdge) other;
            return g76.L(this.__typename, userEdge.__typename) && g76.L(this.canSubmit, userEdge.canSubmit);
        }

        public final Boolean getCanSubmit() {
            return this.canSubmit;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            Boolean bool = this.canSubmit;
            return iHashCode + (bool == null ? 0 : bool.hashCode());
        }

        public final String toString() {
            return "UserEdge(__typename=" + this.__typename + ", canSubmit=" + this.canSubmit + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/fragment/PublishingFlowPublication$ViewerEdge;", "", "__typename", "", "viewerStaffRole", "Lcom/medium/android/graphql/type/PublicationStaffRole;", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PublicationStaffRole;)V", "get__typename", "()Ljava/lang/String;", "getViewerStaffRole", "()Lcom/medium/android/graphql/type/PublicationStaffRole;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final PublicationStaffRole viewerStaffRole;

        public ViewerEdge(String str, PublicationStaffRole publicationStaffRole) {
            str.getClass();
            this.__typename = str;
            this.viewerStaffRole = publicationStaffRole;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, PublicationStaffRole publicationStaffRole, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                publicationStaffRole = viewerEdge.viewerStaffRole;
            }
            return viewerEdge.copy(str, publicationStaffRole);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationStaffRole getViewerStaffRole() {
            return this.viewerStaffRole;
        }

        public final ViewerEdge copy(String __typename, PublicationStaffRole viewerStaffRole) {
            __typename.getClass();
            return new ViewerEdge(__typename, viewerStaffRole);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && this.viewerStaffRole == viewerEdge.viewerStaffRole;
        }

        public final PublicationStaffRole getViewerStaffRole() {
            return this.viewerStaffRole;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            PublicationStaffRole publicationStaffRole = this.viewerStaffRole;
            return iHashCode + (publicationStaffRole == null ? 0 : publicationStaffRole.hashCode());
        }

        public final String toString() {
            return "ViewerEdge(__typename=" + this.__typename + ", viewerStaffRole=" + this.viewerStaffRole + ")";
        }
    }

    public PublishingFlowPublication(String str, String str2, String str3, String str4, Avatar avatar, ViewerEdge viewerEdge, UserEdge userEdge) {
        ho2.Q(str, str2, str3, str4);
        this.__typename = str;
        this.id = str2;
        this.name = str3;
        this.slug = str4;
        this.avatar = avatar;
        this.viewerEdge = viewerEdge;
        this.userEdge = userEdge;
    }

    public static /* synthetic */ PublishingFlowPublication copy$default(PublishingFlowPublication publishingFlowPublication, String str, String str2, String str3, String str4, Avatar avatar, ViewerEdge viewerEdge, UserEdge userEdge, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publishingFlowPublication.__typename;
        }
        if ((i & 2) != 0) {
            str2 = publishingFlowPublication.id;
        }
        if ((i & 4) != 0) {
            str3 = publishingFlowPublication.name;
        }
        if ((i & 8) != 0) {
            str4 = publishingFlowPublication.slug;
        }
        if ((i & 16) != 0) {
            avatar = publishingFlowPublication.avatar;
        }
        if ((i & 32) != 0) {
            viewerEdge = publishingFlowPublication.viewerEdge;
        }
        if ((i & 64) != 0) {
            userEdge = publishingFlowPublication.userEdge;
        }
        ViewerEdge viewerEdge2 = viewerEdge;
        UserEdge userEdge2 = userEdge;
        Avatar avatar2 = avatar;
        String str5 = str3;
        return publishingFlowPublication.copy(str, str2, str5, str4, avatar2, viewerEdge2, userEdge2);
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
    public final String getSlug() {
        return this.slug;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final Avatar getAvatar() {
        return this.avatar;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final UserEdge getUserEdge() {
        return this.userEdge;
    }

    public final PublishingFlowPublication copy(String __typename, String id, String name, String slug, Avatar avatar, ViewerEdge viewerEdge, UserEdge userEdge) {
        __typename.getClass();
        id.getClass();
        name.getClass();
        slug.getClass();
        return new PublishingFlowPublication(__typename, id, name, slug, avatar, viewerEdge, userEdge);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublishingFlowPublication)) {
            return false;
        }
        PublishingFlowPublication publishingFlowPublication = (PublishingFlowPublication) other;
        return g76.L(this.__typename, publishingFlowPublication.__typename) && g76.L(this.id, publishingFlowPublication.id) && g76.L(this.name, publishingFlowPublication.name) && g76.L(this.slug, publishingFlowPublication.slug) && g76.L(this.avatar, publishingFlowPublication.avatar) && g76.L(this.viewerEdge, publishingFlowPublication.viewerEdge) && g76.L(this.userEdge, publishingFlowPublication.userEdge);
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

    public final String getSlug() {
        return this.slug;
    }

    public final UserEdge getUserEdge() {
        return this.userEdge;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(wgd.o(this.__typename.hashCode() * 31, 31, this.id), 31, this.name), 31, this.slug);
        Avatar avatar = this.avatar;
        int iHashCode = (iO + (avatar == null ? 0 : avatar.hashCode())) * 31;
        ViewerEdge viewerEdge = this.viewerEdge;
        int iHashCode2 = (iHashCode + (viewerEdge == null ? 0 : viewerEdge.hashCode())) * 31;
        UserEdge userEdge = this.userEdge;
        return iHashCode2 + (userEdge != null ? userEdge.hashCode() : 0);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        String str3 = this.name;
        String str4 = this.slug;
        Avatar avatar = this.avatar;
        ViewerEdge viewerEdge = this.viewerEdge;
        UserEdge userEdge = this.userEdge;
        StringBuilder sbU = y30.u("PublishingFlowPublication(__typename=", str, ", id=", str2, ", name=");
        ka1.C(sbU, str3, ", slug=", str4, ", avatar=");
        sbU.append(avatar);
        sbU.append(", viewerEdge=");
        sbU.append(viewerEdge);
        sbU.append(", userEdge=");
        sbU.append(userEdge);
        sbU.append(")");
        return sbU.toString();
    }
}
