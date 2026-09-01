package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001B+\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u0018\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\b\u0010\tJ\u0018\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\n\u0010\tJ4\u0010\u000b\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0001¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u000e\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0011\u001a\u00020\u0010HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u001a\u0004\b\u0018\u0010\tR\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0017\u001a\u0004\b\u0019\u0010\t¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/type/PublicationPostsBetweenFilter;", "", "Lzv8;", "", "end", "start", "<init>", "(Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "copy", "(Lzv8;Lzv8;)Lcom/medium/android/graphql/type/PublicationPostsBetweenFilter;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getEnd", "getStart", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PublicationPostsBetweenFilter {
    private final zv8 end;
    private final zv8 start;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ PublicationPostsBetweenFilter(zv8 zv8Var, zv8 zv8Var2, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2);
    }

    public static /* synthetic */ PublicationPostsBetweenFilter copy$default(PublicationPostsBetweenFilter publicationPostsBetweenFilter, zv8 zv8Var, zv8 zv8Var2, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = publicationPostsBetweenFilter.end;
        }
        if ((i & 2) != 0) {
            zv8Var2 = publicationPostsBetweenFilter.start;
        }
        return publicationPostsBetweenFilter.copy(zv8Var, zv8Var2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getEnd() {
        return this.end;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getStart() {
        return this.start;
    }

    public final PublicationPostsBetweenFilter copy(zv8 end, zv8 start) {
        end.getClass();
        start.getClass();
        return new PublicationPostsBetweenFilter(end, start);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PublicationPostsBetweenFilter)) {
            return false;
        }
        PublicationPostsBetweenFilter publicationPostsBetweenFilter = (PublicationPostsBetweenFilter) other;
        return g76.L(this.end, publicationPostsBetweenFilter.end) && g76.L(this.start, publicationPostsBetweenFilter.start);
    }

    public final zv8 getEnd() {
        return this.end;
    }

    public final zv8 getStart() {
        return this.start;
    }

    public final int hashCode() {
        return this.start.hashCode() + (this.end.hashCode() * 31);
    }

    public final String toString() {
        return "PublicationPostsBetweenFilter(end=" + this.end + ", start=" + this.start + ")";
    }

    public PublicationPostsBetweenFilter(zv8 zv8Var, zv8 zv8Var2) {
        zv8Var.getClass();
        zv8Var2.getClass();
        this.end = zv8Var;
        this.start = zv8Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public PublicationPostsBetweenFilter() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
