package com.medium.android.graphql.fragment;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import defpackage.b09;
import defpackage.ev6;
import defpackage.g15;
import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001:\u0004\u001e\u001f !B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\t\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\nJ.\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u0002HÆ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\nJ\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\nR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001d\u0010\n¨\u0006\""}, d2 = {"Lcom/medium/android/graphql/fragment/PostSubmissionData;", "Lg15;", "", "__typename", "Lcom/medium/android/graphql/fragment/PostSubmissionData$ViewerEdge;", "viewerEdge", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostSubmissionData$ViewerEdge;Ljava/lang/String;)V", "component1", "()Ljava/lang/String;", "component2", "()Lcom/medium/android/graphql/fragment/PostSubmissionData$ViewerEdge;", "component3", "copy", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostSubmissionData$ViewerEdge;Ljava/lang/String;)Lcom/medium/android/graphql/fragment/PostSubmissionData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "Lcom/medium/android/graphql/fragment/PostSubmissionData$ViewerEdge;", "getViewerEdge", "getId", "ViewerEdge", "MostRecentSubmission", "Publication", "Avatar", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostSubmissionData implements g15 {
    private final String __typename;
    private final String id;
    private final ViewerEdge viewerEdge;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/fragment/PostSubmissionData$Avatar;", "", "__typename", "", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
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
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u001bHÖ\u0001J\t\u0010\u001c\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001d"}, d2 = {"Lcom/medium/android/graphql/fragment/PostSubmissionData$MostRecentSubmission;", "", "__typename", "", "status", "Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "publication", "Lcom/medium/android/graphql/fragment/PostSubmissionData$Publication;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/type/PublicationSubmissionStatus;Lcom/medium/android/graphql/fragment/PostSubmissionData$Publication;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getStatus", "()Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "getPublication", "()Lcom/medium/android/graphql/fragment/PostSubmissionData$Publication;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class MostRecentSubmission {
        private final String __typename;
        private final String id;
        private final Publication publication;
        private final PublicationSubmissionStatus status;

        public MostRecentSubmission(String str, PublicationSubmissionStatus publicationSubmissionStatus, Publication publication, String str2) {
            str.getClass();
            publicationSubmissionStatus.getClass();
            publication.getClass();
            str2.getClass();
            this.__typename = str;
            this.status = publicationSubmissionStatus;
            this.publication = publication;
            this.id = str2;
        }

        public static /* synthetic */ MostRecentSubmission copy$default(MostRecentSubmission mostRecentSubmission, String str, PublicationSubmissionStatus publicationSubmissionStatus, Publication publication, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = mostRecentSubmission.__typename;
            }
            if ((i & 2) != 0) {
                publicationSubmissionStatus = mostRecentSubmission.status;
            }
            if ((i & 4) != 0) {
                publication = mostRecentSubmission.publication;
            }
            if ((i & 8) != 0) {
                str2 = mostRecentSubmission.id;
            }
            return mostRecentSubmission.copy(str, publicationSubmissionStatus, publication, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final PublicationSubmissionStatus getStatus() {
            return this.status;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Publication getPublication() {
            return this.publication;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final MostRecentSubmission copy(String __typename, PublicationSubmissionStatus status, Publication publication, String id) {
            __typename.getClass();
            status.getClass();
            publication.getClass();
            id.getClass();
            return new MostRecentSubmission(__typename, status, publication, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof MostRecentSubmission)) {
                return false;
            }
            MostRecentSubmission mostRecentSubmission = (MostRecentSubmission) other;
            return g76.L(this.__typename, mostRecentSubmission.__typename) && this.status == mostRecentSubmission.status && g76.L(this.publication, mostRecentSubmission.publication) && g76.L(this.id, mostRecentSubmission.id);
        }

        public final String getId() {
            return this.id;
        }

        public final Publication getPublication() {
            return this.publication;
        }

        public final PublicationSubmissionStatus getStatus() {
            return this.status;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            return this.id.hashCode() + ((this.publication.hashCode() + ((this.status.hashCode() + (this.__typename.hashCode() * 31)) * 31)) * 31);
        }

        public final String toString() {
            return "MostRecentSubmission(__typename=" + this.__typename + ", status=" + this.status + ", publication=" + this.publication + ", id=" + this.id + ")";
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0006HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J3\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0015\u001a\u00020\u00162\b\u0010\u0017\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0018\u001a\u00020\u0019HÖ\u0001J\t\u0010\u001a\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000b¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/PostSubmissionData$Publication;", "", "__typename", "", "name", "avatar", "Lcom/medium/android/graphql/fragment/PostSubmissionData$Avatar;", "id", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostSubmissionData$Avatar;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getName", "getAvatar", "()Lcom/medium/android/graphql/fragment/PostSubmissionData$Avatar;", "getId", "component1", "component2", "component3", "component4", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class Publication {
        private final String __typename;
        private final Avatar avatar;
        private final String id;
        private final String name;

        public Publication(String str, String str2, Avatar avatar, String str3) {
            b09.I(str, str2, str3);
            this.__typename = str;
            this.name = str2;
            this.avatar = avatar;
            this.id = str3;
        }

        public static /* synthetic */ Publication copy$default(Publication publication, String str, String str2, Avatar avatar, String str3, int i, Object obj) {
            if ((i & 1) != 0) {
                str = publication.__typename;
            }
            if ((i & 2) != 0) {
                str2 = publication.name;
            }
            if ((i & 4) != 0) {
                avatar = publication.avatar;
            }
            if ((i & 8) != 0) {
                str3 = publication.id;
            }
            return publication.copy(str, str2, avatar, str3);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final String getName() {
            return this.name;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Avatar getAvatar() {
            return this.avatar;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final Publication copy(String __typename, String name, Avatar avatar, String id) {
            __typename.getClass();
            name.getClass();
            id.getClass();
            return new Publication(__typename, name, avatar, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Publication)) {
                return false;
            }
            Publication publication = (Publication) other;
            return g76.L(this.__typename, publication.__typename) && g76.L(this.name, publication.name) && g76.L(this.avatar, publication.avatar) && g76.L(this.id, publication.id);
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

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iO = wgd.o(this.__typename.hashCode() * 31, 31, this.name);
            Avatar avatar = this.avatar;
            return this.id.hashCode() + ((iO + (avatar == null ? 0 : avatar.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            String str2 = this.name;
            Avatar avatar = this.avatar;
            String str3 = this.id;
            StringBuilder sbU = y30.u("Publication(__typename=", str, ", name=", str2, ", avatar=");
            sbU.append(avatar);
            sbU.append(", id=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J)\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0018"}, d2 = {"Lcom/medium/android/graphql/fragment/PostSubmissionData$ViewerEdge;", "", "__typename", "", "mostRecentSubmission", "Lcom/medium/android/graphql/fragment/PostSubmissionData$MostRecentSubmission;", "id", "<init>", "(Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostSubmissionData$MostRecentSubmission;Ljava/lang/String;)V", "get__typename", "()Ljava/lang/String;", "getMostRecentSubmission", "()Lcom/medium/android/graphql/fragment/PostSubmissionData$MostRecentSubmission;", "getId", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class ViewerEdge {
        private final String __typename;
        private final String id;
        private final MostRecentSubmission mostRecentSubmission;

        public ViewerEdge(String str, MostRecentSubmission mostRecentSubmission, String str2) {
            str.getClass();
            str2.getClass();
            this.__typename = str;
            this.mostRecentSubmission = mostRecentSubmission;
            this.id = str2;
        }

        public static /* synthetic */ ViewerEdge copy$default(ViewerEdge viewerEdge, String str, MostRecentSubmission mostRecentSubmission, String str2, int i, Object obj) {
            if ((i & 1) != 0) {
                str = viewerEdge.__typename;
            }
            if ((i & 2) != 0) {
                mostRecentSubmission = viewerEdge.mostRecentSubmission;
            }
            if ((i & 4) != 0) {
                str2 = viewerEdge.id;
            }
            return viewerEdge.copy(str, mostRecentSubmission, str2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String get__typename() {
            return this.__typename;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final MostRecentSubmission getMostRecentSubmission() {
            return this.mostRecentSubmission;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final String getId() {
            return this.id;
        }

        public final ViewerEdge copy(String __typename, MostRecentSubmission mostRecentSubmission, String id) {
            __typename.getClass();
            id.getClass();
            return new ViewerEdge(__typename, mostRecentSubmission, id);
        }

        public final boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ViewerEdge)) {
                return false;
            }
            ViewerEdge viewerEdge = (ViewerEdge) other;
            return g76.L(this.__typename, viewerEdge.__typename) && g76.L(this.mostRecentSubmission, viewerEdge.mostRecentSubmission) && g76.L(this.id, viewerEdge.id);
        }

        public final String getId() {
            return this.id;
        }

        public final MostRecentSubmission getMostRecentSubmission() {
            return this.mostRecentSubmission;
        }

        public final String get__typename() {
            return this.__typename;
        }

        public final int hashCode() {
            int iHashCode = this.__typename.hashCode() * 31;
            MostRecentSubmission mostRecentSubmission = this.mostRecentSubmission;
            return this.id.hashCode() + ((iHashCode + (mostRecentSubmission == null ? 0 : mostRecentSubmission.hashCode())) * 31);
        }

        public final String toString() {
            String str = this.__typename;
            MostRecentSubmission mostRecentSubmission = this.mostRecentSubmission;
            String str2 = this.id;
            StringBuilder sb = new StringBuilder("ViewerEdge(__typename=");
            sb.append(str);
            sb.append(", mostRecentSubmission=");
            sb.append(mostRecentSubmission);
            sb.append(", id=");
            return ka1.v(sb, str2, ")");
        }
    }

    public PostSubmissionData(String str, ViewerEdge viewerEdge, String str2) {
        str.getClass();
        viewerEdge.getClass();
        str2.getClass();
        this.__typename = str;
        this.viewerEdge = viewerEdge;
        this.id = str2;
    }

    public static /* synthetic */ PostSubmissionData copy$default(PostSubmissionData postSubmissionData, String str, ViewerEdge viewerEdge, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postSubmissionData.__typename;
        }
        if ((i & 2) != 0) {
            viewerEdge = postSubmissionData.viewerEdge;
        }
        if ((i & 4) != 0) {
            str2 = postSubmissionData.id;
        }
        return postSubmissionData.copy(str, viewerEdge, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String get__typename() {
        return this.__typename;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final PostSubmissionData copy(String __typename, ViewerEdge viewerEdge, String id) {
        __typename.getClass();
        viewerEdge.getClass();
        id.getClass();
        return new PostSubmissionData(__typename, viewerEdge, id);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostSubmissionData)) {
            return false;
        }
        PostSubmissionData postSubmissionData = (PostSubmissionData) other;
        return g76.L(this.__typename, postSubmissionData.__typename) && g76.L(this.viewerEdge, postSubmissionData.viewerEdge) && g76.L(this.id, postSubmissionData.id);
    }

    public final String getId() {
        return this.id;
    }

    public final ViewerEdge getViewerEdge() {
        return this.viewerEdge;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.id.hashCode() + ((this.viewerEdge.hashCode() + (this.__typename.hashCode() * 31)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        ViewerEdge viewerEdge = this.viewerEdge;
        String str2 = this.id;
        StringBuilder sb = new StringBuilder("PostSubmissionData(__typename=");
        sb.append(str);
        sb.append(", viewerEdge=");
        sb.append(viewerEdge);
        sb.append(", id=");
        return ka1.v(sb, str2, ZVsviyDAr.gXcrXyjisDTVEg);
    }
}
