package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.ka1;
import defpackage.wgd;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000f\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0005HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00032\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\f¨\u0006\u0017"}, d2 = {"Lcom/medium/android/graphql/type/SetPostPublicationFeaturedInput;", "", "featured", "", "postId", "", "publicationId", "<init>", "(ZLjava/lang/String;Ljava/lang/String;)V", "getFeatured", "()Z", "getPostId", "()Ljava/lang/String;", "getPublicationId", "component1", "component2", "component3", "copy", "equals", "other", "hashCode", "", "toString", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class SetPostPublicationFeaturedInput {
    private final boolean featured;
    private final String postId;
    private final String publicationId;

    public SetPostPublicationFeaturedInput(boolean z, String str, String str2) {
        str.getClass();
        str2.getClass();
        this.featured = z;
        this.postId = str;
        this.publicationId = str2;
    }

    public static /* synthetic */ SetPostPublicationFeaturedInput copy$default(SetPostPublicationFeaturedInput setPostPublicationFeaturedInput, boolean z, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            z = setPostPublicationFeaturedInput.featured;
        }
        if ((i & 2) != 0) {
            str = setPostPublicationFeaturedInput.postId;
        }
        if ((i & 4) != 0) {
            str2 = setPostPublicationFeaturedInput.publicationId;
        }
        return setPostPublicationFeaturedInput.copy(z, str, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final boolean getFeatured() {
        return this.featured;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getPublicationId() {
        return this.publicationId;
    }

    public final SetPostPublicationFeaturedInput copy(boolean featured, String postId, String publicationId) {
        postId.getClass();
        publicationId.getClass();
        return new SetPostPublicationFeaturedInput(featured, postId, publicationId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SetPostPublicationFeaturedInput)) {
            return false;
        }
        SetPostPublicationFeaturedInput setPostPublicationFeaturedInput = (SetPostPublicationFeaturedInput) other;
        return this.featured == setPostPublicationFeaturedInput.featured && g76.L(this.postId, setPostPublicationFeaturedInput.postId) && g76.L(this.publicationId, setPostPublicationFeaturedInput.publicationId);
    }

    public final boolean getFeatured() {
        return this.featured;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final String getPublicationId() {
        return this.publicationId;
    }

    public final int hashCode() {
        return this.publicationId.hashCode() + wgd.o((this.featured ? 1231 : 1237) * 31, 31, this.postId);
    }

    public final String toString() {
        boolean z = this.featured;
        String str = this.postId;
        String str2 = this.publicationId;
        StringBuilder sb = new StringBuilder("SetPostPublicationFeaturedInput(featured=");
        sb.append(z);
        sb.append(", postId=");
        sb.append(str);
        sb.append(", publicationId=");
        return ka1.v(sb, str2, ")");
    }
}
