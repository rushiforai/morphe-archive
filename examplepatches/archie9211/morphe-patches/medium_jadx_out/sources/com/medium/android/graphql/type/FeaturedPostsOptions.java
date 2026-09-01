package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u000b\u0010\nJ4\u0010\f\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u0019\u0010\nR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0018\u001a\u0004\b\u001a\u0010\n¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/type/FeaturedPostsOptions;", "", "Lzv8;", "Lcom/medium/android/graphql/type/FeaturedPostsOrderBy;", "orderBy", "Lcom/medium/android/graphql/type/Sort;", "sort", "<init>", "(Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "copy", "(Lzv8;Lzv8;)Lcom/medium/android/graphql/type/FeaturedPostsOptions;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getOrderBy", "getSort", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class FeaturedPostsOptions {
    private final zv8 orderBy;
    private final zv8 sort;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ FeaturedPostsOptions(zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2);
    }

    public static /* synthetic */ FeaturedPostsOptions copy$default(FeaturedPostsOptions featuredPostsOptions, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = featuredPostsOptions.orderBy;
        }
        if ((i & 2) != 0) {
            zv8Var2 = featuredPostsOptions.sort;
        }
        return featuredPostsOptions.copy(zv8Var, zv8Var2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getOrderBy() {
        return this.orderBy;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getSort() {
        return this.sort;
    }

    public final FeaturedPostsOptions copy(zv8 orderBy, zv8 sort) {
        orderBy.getClass();
        sort.getClass();
        return new FeaturedPostsOptions(orderBy, sort);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof FeaturedPostsOptions)) {
            return false;
        }
        FeaturedPostsOptions featuredPostsOptions = (FeaturedPostsOptions) other;
        return g76.L(this.orderBy, featuredPostsOptions.orderBy) && g76.L(this.sort, featuredPostsOptions.sort);
    }

    public final zv8 getOrderBy() {
        return this.orderBy;
    }

    public final zv8 getSort() {
        return this.sort;
    }

    public final int hashCode() {
        return this.sort.hashCode() + (this.orderBy.hashCode() * 31);
    }

    public final String toString() {
        return "FeaturedPostsOptions(orderBy=" + this.orderBy + ", sort=" + this.sort + ")";
    }

    public FeaturedPostsOptions(zv8 zv8Var, zv8 zv8Var2) {
        zv8Var.getClass();
        zv8Var2.getClass();
        this.orderBy = zv8Var;
        this.sort = zv8Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public FeaturedPostsOptions() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
