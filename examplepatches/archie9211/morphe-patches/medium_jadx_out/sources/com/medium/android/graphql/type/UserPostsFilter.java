package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\b\b\u0086\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0018\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0007\u0010\bJ\"\u0010\t\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0001¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\f\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0012\u001a\u00020\u00032\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0012\u0010\u0013R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0014\u001a\u0004\b\u0015\u0010\b¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/type/UserPostsFilter;", "", "Lzv8;", "", "published", "<init>", "(Lzv8;)V", "component1", "()Lzv8;", "copy", "(Lzv8;)Lcom/medium/android/graphql/type/UserPostsFilter;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getPublished", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class UserPostsFilter {
    private final zv8 published;

    public /* synthetic */ UserPostsFilter(zv8 zv8Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var);
    }

    public static /* synthetic */ UserPostsFilter copy$default(UserPostsFilter userPostsFilter, zv8 zv8Var, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = userPostsFilter.published;
        }
        return userPostsFilter.copy(zv8Var);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getPublished() {
        return this.published;
    }

    public final UserPostsFilter copy(zv8 published) {
        published.getClass();
        return new UserPostsFilter(published);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof UserPostsFilter) && g76.L(this.published, ((UserPostsFilter) other).published);
    }

    public final zv8 getPublished() {
        return this.published;
    }

    public final int hashCode() {
        return this.published.hashCode();
    }

    public final String toString() {
        return "UserPostsFilter(published=" + this.published + ")";
    }

    public UserPostsFilter(zv8 zv8Var) {
        zv8Var.getClass();
        this.published = zv8Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public UserPostsFilter() {
        this(null, 1, 0 == true ? 1 : 0);
    }
}
