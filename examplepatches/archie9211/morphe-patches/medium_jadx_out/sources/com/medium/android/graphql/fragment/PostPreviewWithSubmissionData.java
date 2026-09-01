package com.medium.android.graphql.fragment;

import defpackage.g15;
import defpackage.g76;
import defpackage.wgd;
import defpackage.y30;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0010\u0010\u000e\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0007HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011J8\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0004\u001a\u00020\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0014\u0010\fJ\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018HÖ\u0003¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001d\u001a\u0004\b\u001e\u0010\fR\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001f\u0010\fR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b!\u0010\u000fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010\"\u001a\u0004\b#\u0010\u0011¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/fragment/PostPreviewWithSubmissionData;", "Lg15;", "", "__typename", "id", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "postPreviewData", "Lcom/medium/android/graphql/fragment/PostSubmissionData;", "postSubmissionData", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;Lcom/medium/android/graphql/fragment/PostSubmissionData;)V", "component1", "()Ljava/lang/String;", "component2", "component3", "()Lcom/medium/android/graphql/fragment/PostPreviewData;", "component4", "()Lcom/medium/android/graphql/fragment/PostSubmissionData;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/graphql/fragment/PostPreviewData;Lcom/medium/android/graphql/fragment/PostSubmissionData;)Lcom/medium/android/graphql/fragment/PostPreviewWithSubmissionData;", "toString", "", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "get__typename", "getId", "Lcom/medium/android/graphql/fragment/PostPreviewData;", "getPostPreviewData", "Lcom/medium/android/graphql/fragment/PostSubmissionData;", "getPostSubmissionData", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PostPreviewWithSubmissionData implements g15 {
    private final String __typename;
    private final String id;
    private final PostPreviewData postPreviewData;
    private final PostSubmissionData postSubmissionData;

    public PostPreviewWithSubmissionData(String str, String str2, PostPreviewData postPreviewData, PostSubmissionData postSubmissionData) {
        str.getClass();
        str2.getClass();
        postPreviewData.getClass();
        postSubmissionData.getClass();
        this.__typename = str;
        this.id = str2;
        this.postPreviewData = postPreviewData;
        this.postSubmissionData = postSubmissionData;
    }

    public static /* synthetic */ PostPreviewWithSubmissionData copy$default(PostPreviewWithSubmissionData postPreviewWithSubmissionData, String str, String str2, PostPreviewData postPreviewData, PostSubmissionData postSubmissionData, int i, Object obj) {
        if ((i & 1) != 0) {
            str = postPreviewWithSubmissionData.__typename;
        }
        if ((i & 2) != 0) {
            str2 = postPreviewWithSubmissionData.id;
        }
        if ((i & 4) != 0) {
            postPreviewData = postPreviewWithSubmissionData.postPreviewData;
        }
        if ((i & 8) != 0) {
            postSubmissionData = postPreviewWithSubmissionData.postSubmissionData;
        }
        return postPreviewWithSubmissionData.copy(str, str2, postPreviewData, postSubmissionData);
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
    public final PostPreviewData getPostPreviewData() {
        return this.postPreviewData;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final PostSubmissionData getPostSubmissionData() {
        return this.postSubmissionData;
    }

    public final PostPreviewWithSubmissionData copy(String __typename, String id, PostPreviewData postPreviewData, PostSubmissionData postSubmissionData) {
        __typename.getClass();
        id.getClass();
        postPreviewData.getClass();
        postSubmissionData.getClass();
        return new PostPreviewWithSubmissionData(__typename, id, postPreviewData, postSubmissionData);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PostPreviewWithSubmissionData)) {
            return false;
        }
        PostPreviewWithSubmissionData postPreviewWithSubmissionData = (PostPreviewWithSubmissionData) other;
        return g76.L(this.__typename, postPreviewWithSubmissionData.__typename) && g76.L(this.id, postPreviewWithSubmissionData.id) && g76.L(this.postPreviewData, postPreviewWithSubmissionData.postPreviewData) && g76.L(this.postSubmissionData, postPreviewWithSubmissionData.postSubmissionData);
    }

    public final String getId() {
        return this.id;
    }

    public final PostPreviewData getPostPreviewData() {
        return this.postPreviewData;
    }

    public final PostSubmissionData getPostSubmissionData() {
        return this.postSubmissionData;
    }

    public final String get__typename() {
        return this.__typename;
    }

    public final int hashCode() {
        return this.postSubmissionData.hashCode() + ((this.postPreviewData.hashCode() + wgd.o(this.__typename.hashCode() * 31, 31, this.id)) * 31);
    }

    public final String toString() {
        String str = this.__typename;
        String str2 = this.id;
        PostPreviewData postPreviewData = this.postPreviewData;
        PostSubmissionData postSubmissionData = this.postSubmissionData;
        StringBuilder sbU = y30.u("PostPreviewWithSubmissionData(__typename=", str, ", id=", str2, ", postPreviewData=");
        sbU.append(postPreviewData);
        sbU.append(", postSubmissionData=");
        sbU.append(postSubmissionData);
        sbU.append(")");
        return sbU.toString();
    }
}
