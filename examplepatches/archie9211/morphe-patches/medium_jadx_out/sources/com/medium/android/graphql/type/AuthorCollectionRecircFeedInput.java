package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.z73;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\r\b\u0086\b\u0018\u00002\u00020\u0001B;\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\u0003¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\r\u0010\fJ\u0010\u0010\u000e\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u0011JH\u0010\u0012\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0011J\u0010\u0010\u0016\u001a\u00020\u0015HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR(\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0004\u0010\u001c\u0012\u0004\b\u001e\u0010\u001f\u001a\u0004\b\u001d\u0010\fR(\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0005\u0010\u001c\u0012\u0004\b!\u0010\u001f\u001a\u0004\b \u0010\fR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\"\u001a\u0004\b#\u0010\u000fR\u0017\u0010\b\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\b\u0010$\u001a\u0004\b%\u0010\u0011¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/type/AuthorCollectionRecircFeedInput;", "", "Lzv8;", "", "authorId", "collectionId", "Lcom/medium/android/graphql/type/PagingOptions;", "paging", "postId", "<init>", "(Lzv8;Lzv8;Lcom/medium/android/graphql/type/PagingOptions;Ljava/lang/String;)V", "component1", "()Lzv8;", "component2", "component3", "()Lcom/medium/android/graphql/type/PagingOptions;", "component4", "()Ljava/lang/String;", "copy", "(Lzv8;Lzv8;Lcom/medium/android/graphql/type/PagingOptions;Ljava/lang/String;)Lcom/medium/android/graphql/type/AuthorCollectionRecircFeedInput;", "toString", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getAuthorId", "getAuthorId$annotations", "()V", "getCollectionId", "getCollectionId$annotations", "Lcom/medium/android/graphql/type/PagingOptions;", "getPaging", "Ljava/lang/String;", "getPostId", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class AuthorCollectionRecircFeedInput {
    private final zv8 authorId;
    private final zv8 collectionId;
    private final PagingOptions paging;
    private final String postId;

    public AuthorCollectionRecircFeedInput(zv8 zv8Var, zv8 zv8Var2, PagingOptions pagingOptions, String str) {
        zv8Var.getClass();
        zv8Var2.getClass();
        pagingOptions.getClass();
        str.getClass();
        this.authorId = zv8Var;
        this.collectionId = zv8Var2;
        this.paging = pagingOptions;
        this.postId = str;
    }

    public static /* synthetic */ AuthorCollectionRecircFeedInput copy$default(AuthorCollectionRecircFeedInput authorCollectionRecircFeedInput, zv8 zv8Var, zv8 zv8Var2, PagingOptions pagingOptions, String str, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = authorCollectionRecircFeedInput.authorId;
        }
        if ((i & 2) != 0) {
            zv8Var2 = authorCollectionRecircFeedInput.collectionId;
        }
        if ((i & 4) != 0) {
            pagingOptions = authorCollectionRecircFeedInput.paging;
        }
        if ((i & 8) != 0) {
            str = authorCollectionRecircFeedInput.postId;
        }
        return authorCollectionRecircFeedInput.copy(zv8Var, zv8Var2, pagingOptions, str);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getAuthorId() {
        return this.authorId;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getCollectionId() {
        return this.collectionId;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final PagingOptions getPaging() {
        return this.paging;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getPostId() {
        return this.postId;
    }

    public final AuthorCollectionRecircFeedInput copy(zv8 authorId, zv8 collectionId, PagingOptions paging, String postId) {
        authorId.getClass();
        collectionId.getClass();
        paging.getClass();
        postId.getClass();
        return new AuthorCollectionRecircFeedInput(authorId, collectionId, paging, postId);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AuthorCollectionRecircFeedInput)) {
            return false;
        }
        AuthorCollectionRecircFeedInput authorCollectionRecircFeedInput = (AuthorCollectionRecircFeedInput) other;
        return g76.L(this.authorId, authorCollectionRecircFeedInput.authorId) && g76.L(this.collectionId, authorCollectionRecircFeedInput.collectionId) && g76.L(this.paging, authorCollectionRecircFeedInput.paging) && g76.L(this.postId, authorCollectionRecircFeedInput.postId);
    }

    public final zv8 getAuthorId() {
        return this.authorId;
    }

    public final zv8 getCollectionId() {
        return this.collectionId;
    }

    public final PagingOptions getPaging() {
        return this.paging;
    }

    public final String getPostId() {
        return this.postId;
    }

    public final int hashCode() {
        return this.postId.hashCode() + ((this.paging.hashCode() + lv8.h(this.collectionId, this.authorId.hashCode() * 31, 31)) * 31);
    }

    public final String toString() {
        zv8 zv8Var = this.authorId;
        zv8 zv8Var2 = this.collectionId;
        PagingOptions pagingOptions = this.paging;
        String str = this.postId;
        StringBuilder sbW = ka1.w("AuthorCollectionRecircFeedInput(authorId=", zv8Var, ", collectionId=", zv8Var2, ", paging=");
        sbW.append(pagingOptions);
        sbW.append(", postId=");
        sbW.append(str);
        sbW.append(")");
        return sbW.toString();
    }

    @z73
    public static /* synthetic */ void getAuthorId$annotations() {
    }

    @z73
    public static /* synthetic */ void getCollectionId$annotations() {
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ AuthorCollectionRecircFeedInput(zv8 zv8Var, zv8 zv8Var2, PagingOptions pagingOptions, String str, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, pagingOptions, str);
    }
}
