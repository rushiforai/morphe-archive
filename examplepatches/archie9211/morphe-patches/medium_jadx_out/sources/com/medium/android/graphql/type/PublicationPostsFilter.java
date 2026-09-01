package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\r\n\u0002\u0010\b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001Bg\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002\u0012\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002\u0012\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\n\u0018\u00010\t0\u0002¢\u0006\u0004\b\f\u0010\rJ\u0018\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u000e\u0010\u000fJ\u0018\u0010\u0010\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u0010\u0010\u000fJ\u0018\u0010\u0011\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u000fJ\u0018\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u000fJ\u001e\u0010\u0013\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\n\u0018\u00010\t0\u0002HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u000fJp\u0010\u0014\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00022\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00022\u0010\b\u0002\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00022\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\n\u0018\u00010\t0\u0002HÆ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0019\u001a\u00020\u0018HÖ\u0001¢\u0006\u0004\b\u0019\u0010\u001aJ\u001a\u0010\u001c\u001a\u00020\u00052\b\u0010\u001b\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001e\u001a\u0004\b\u001f\u0010\u000fR\u001f\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u001a\u0004\b \u0010\u000fR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001e\u001a\u0004\b!\u0010\u000fR\u001f\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\b\u0010\u001e\u001a\u0004\b\"\u0010\u000fR%\u0010\u000b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\n\u0018\u00010\t0\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u001e\u001a\u0004\b#\u0010\u000f¨\u0006$"}, d2 = {"Lcom/medium/android/graphql/type/PublicationPostsFilter;", "", "Lzv8;", "Lcom/medium/android/graphql/type/PublicationPostsBetweenFilter;", "between", "", "includeUnlisted", "onlyUnlisted", "published", "", "", "tags", "<init>", "(Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "component3", "component4", "component5", "copy", "(Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/PublicationPostsFilter;", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getBetween", "getIncludeUnlisted", "getOnlyUnlisted", "getPublished", "getTags", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationPostsFilter {
    private final zv8 between;
    private final zv8 includeUnlisted;
    private final zv8 onlyUnlisted;
    private final zv8 published;
    private final zv8 tags;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ PublicationPostsFilter(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3, (i & 8) != 0 ? xv8Var : zv8Var4, (i & 16) != 0 ? xv8Var : zv8Var5);
    }

    public static /* synthetic */ PublicationPostsFilter copy$default(PublicationPostsFilter publicationPostsFilter, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = publicationPostsFilter.between;
        }
        if ((i & 2) != 0) {
            zv8Var2 = publicationPostsFilter.includeUnlisted;
        }
        if ((i & 4) != 0) {
            zv8Var3 = publicationPostsFilter.onlyUnlisted;
        }
        if ((i & 8) != 0) {
            zv8Var4 = publicationPostsFilter.published;
        }
        if ((i & 16) != 0) {
            zv8Var5 = publicationPostsFilter.tags;
        }
        zv8 zv8Var6 = zv8Var5;
        zv8 zv8Var7 = zv8Var3;
        return publicationPostsFilter.copy(zv8Var, zv8Var2, zv8Var7, zv8Var4, zv8Var6);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getBetween() {
        return this.between;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getIncludeUnlisted() {
        return this.includeUnlisted;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getOnlyUnlisted() {
        return this.onlyUnlisted;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getPublished() {
        return this.published;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getTags() {
        return this.tags;
    }

    public final PublicationPostsFilter copy(zv8 between, zv8 includeUnlisted, zv8 onlyUnlisted, zv8 published, zv8 tags) {
        between.getClass();
        includeUnlisted.getClass();
        onlyUnlisted.getClass();
        published.getClass();
        tags.getClass();
        return new PublicationPostsFilter(between, includeUnlisted, onlyUnlisted, published, tags);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationPostsFilter)) {
            return false;
        }
        PublicationPostsFilter publicationPostsFilter = (PublicationPostsFilter) other;
        return g76.L(this.between, publicationPostsFilter.between) && g76.L(this.includeUnlisted, publicationPostsFilter.includeUnlisted) && g76.L(this.onlyUnlisted, publicationPostsFilter.onlyUnlisted) && g76.L(this.published, publicationPostsFilter.published) && g76.L(this.tags, publicationPostsFilter.tags);
    }

    public final zv8 getBetween() {
        return this.between;
    }

    public final zv8 getIncludeUnlisted() {
        return this.includeUnlisted;
    }

    public final zv8 getOnlyUnlisted() {
        return this.onlyUnlisted;
    }

    public final zv8 getPublished() {
        return this.published;
    }

    public final zv8 getTags() {
        return this.tags;
    }

    public final int hashCode() {
        return this.tags.hashCode() + lv8.h(this.published, lv8.h(this.onlyUnlisted, lv8.h(this.includeUnlisted, this.between.hashCode() * 31, 31), 31), 31);
    }

    public final String toString() {
        zv8 zv8Var = this.between;
        zv8 zv8Var2 = this.includeUnlisted;
        zv8 zv8Var3 = this.onlyUnlisted;
        zv8 zv8Var4 = this.published;
        zv8 zv8Var5 = this.tags;
        StringBuilder sbW = ka1.w("PublicationPostsFilter(between=", zv8Var, ", includeUnlisted=", zv8Var2, ", onlyUnlisted=");
        sbW.append(zv8Var3);
        sbW.append(", published=");
        sbW.append(zv8Var4);
        sbW.append(", tags=");
        return km4.B(sbW, zv8Var5, ")");
    }

    public PublicationPostsFilter(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        zv8Var4.getClass();
        zv8Var5.getClass();
        this.between = zv8Var;
        this.includeUnlisted = zv8Var2;
        this.onlyUnlisted = zv8Var3;
        this.published = zv8Var4;
        this.tags = zv8Var5;
    }

    public PublicationPostsFilter() {
        this(null, null, null, null, null, 31, null);
    }
}
