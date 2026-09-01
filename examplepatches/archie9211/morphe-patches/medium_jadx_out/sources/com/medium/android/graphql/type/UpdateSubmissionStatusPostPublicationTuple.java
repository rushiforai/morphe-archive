package com.medium.android.graphql.type;

import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/type/UpdateSubmissionStatusPostPublicationTuple;", "", "postId", "", "publicationId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getPostId", "()Ljava/lang/String;", "getPublicationId", "component1", "component2", "copy", "equals", "", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UpdateSubmissionStatusPostPublicationTuple {
    private final String postId;
    private final String publicationId;

    public UpdateSubmissionStatusPostPublicationTuple(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.postId = str;
        this.publicationId = str2;
    }

    public static /* synthetic */ UpdateSubmissionStatusPostPublicationTuple copy$default(UpdateSubmissionStatusPostPublicationTuple updateSubmissionStatusPostPublicationTuple, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = updateSubmissionStatusPostPublicationTuple.postId;
        }
        if ((i & 2) != 0) {
            str2 = updateSubmissionStatusPostPublicationTuple.publicationId;
        }
        return updateSubmissionStatusPostPublicationTuple.copy(str, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    public final UpdateSubmissionStatusPostPublicationTuple copy(String postId, String publicationId) {
        postId.getClass();
        publicationId.getClass();
        return new UpdateSubmissionStatusPostPublicationTuple(postId, publicationId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UpdateSubmissionStatusPostPublicationTuple)) {
            return false;
        }
        UpdateSubmissionStatusPostPublicationTuple updateSubmissionStatusPostPublicationTuple = (UpdateSubmissionStatusPostPublicationTuple) other;
        return g76.L(this.postId, updateSubmissionStatusPostPublicationTuple.postId) && g76.L(this.publicationId, updateSubmissionStatusPostPublicationTuple.publicationId);
    }

    public final String getPostId() {
        return this.postId;
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return this.publicationId.hashCode() + (this.postId.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("UpdateSubmissionStatusPostPublicationTuple(postId=", this.postId, ", publicationId=", this.publicationId, ")");
    }
}
