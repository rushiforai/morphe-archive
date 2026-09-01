package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.lv8;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\f\b\u0086\b\u0018\u00002\u00020\u0001B£\u0001\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00050\u0002\u0012\u0016\b\u0002\u0010\t\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0007j\u0004\u0018\u0001`\b0\u0002\u0012\u0010\b\u0002\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0002\u0012\u0010\b\u0002\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0002\u0012\u0010\b\u0002\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0010\b\u0002\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u0018\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0012\u0010\u0013J\u001e\u0010\u0014\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00050\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0013J\u001e\u0010\u0015\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0007j\u0004\u0018\u0001`\b0\u0002HÆ\u0003¢\u0006\u0004\b\u0015\u0010\u0013J\u0018\u0010\u0016\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0013J\u0018\u0010\u0017\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0013J\u0018\u0010\u0018\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u0002HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0013J\u0018\u0010\u0019\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0013J\u0018\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u0013J¬\u0001\u0010\u001b\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0016\b\u0002\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00050\u00022\u0016\b\u0002\u0010\t\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0007j\u0004\u0018\u0001`\b0\u00022\u0010\b\u0002\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00022\u0010\b\u0002\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u00022\u0010\b\u0002\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\u0010\b\u0002\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\"2\b\u0010!\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b#\u0010$R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010%\u001a\u0004\b&\u0010\u0013R%\u0010\u0006\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u00050\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010%\u001a\u0004\b'\u0010\u0013R%\u0010\t\u001a\u0010\u0012\f\u0012\n\u0018\u00010\u0007j\u0004\u0018\u0001`\b0\u00028\u0006¢\u0006\f\n\u0004\b\t\u0010%\u001a\u0004\b(\u0010\u0013R\u001f\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\n\u0010%\u001a\u0004\b)\u0010\u0013R\u001f\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u00028\u0006¢\u0006\f\n\u0004\b\u000b\u0010%\u001a\u0004\b*\u0010\u0013R\u001f\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\u00028\u0006¢\u0006\f\n\u0004\b\r\u0010%\u001a\u0004\b+\u0010\u0013R\u001f\u0010\u000e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u000e\u0010%\u001a\u0004\b,\u0010\u0013R\u001f\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u0010%\u001a\u0004\b-\u0010\u0013¨\u0006."}, d2 = {"Lcom/medium/android/graphql/type/PagingOptions;", "", "Lzv8;", "", "from", "", "ignoredIds", "", "Lcom/medium/android/graphql/PaginationLimit;", "limit", "order", "page", "", "since", "source", "to", "<init>", "(Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;)V", "component1", "()Lzv8;", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "(Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/type/PagingOptions;", "toString", "()Ljava/lang/String;", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getFrom", "getIgnoredIds", "getLimit", "getOrder", "getPage", "getSince", "getSource", "getTo", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PagingOptions {
    private final zv8 from;
    private final zv8 ignoredIds;
    private final zv8 limit;
    private final zv8 order;
    private final zv8 page;
    private final zv8 since;
    private final zv8 source;
    private final zv8 to;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ PagingOptions(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, zv8 zv8Var6, zv8 zv8Var7, zv8 zv8Var8, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3, (i & 8) != 0 ? xv8Var : zv8Var4, (i & 16) != 0 ? xv8Var : zv8Var5, (i & 32) != 0 ? xv8Var : zv8Var6, (i & 64) != 0 ? xv8Var : zv8Var7, (i & 128) != 0 ? xv8Var : zv8Var8);
    }

    public static /* synthetic */ PagingOptions copy$default(PagingOptions pagingOptions, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, zv8 zv8Var6, zv8 zv8Var7, zv8 zv8Var8, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = pagingOptions.from;
        }
        if ((i & 2) != 0) {
            zv8Var2 = pagingOptions.ignoredIds;
        }
        if ((i & 4) != 0) {
            zv8Var3 = pagingOptions.limit;
        }
        if ((i & 8) != 0) {
            zv8Var4 = pagingOptions.order;
        }
        if ((i & 16) != 0) {
            zv8Var5 = pagingOptions.page;
        }
        if ((i & 32) != 0) {
            zv8Var6 = pagingOptions.since;
        }
        if ((i & 64) != 0) {
            zv8Var7 = pagingOptions.source;
        }
        if ((i & 128) != 0) {
            zv8Var8 = pagingOptions.to;
        }
        zv8 zv8Var9 = zv8Var7;
        zv8 zv8Var10 = zv8Var8;
        zv8 zv8Var11 = zv8Var5;
        zv8 zv8Var12 = zv8Var6;
        return pagingOptions.copy(zv8Var, zv8Var2, zv8Var3, zv8Var4, zv8Var11, zv8Var12, zv8Var9, zv8Var10);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getFrom() {
        return this.from;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getIgnoredIds() {
        return this.ignoredIds;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getLimit() {
        return this.limit;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final zv8 getOrder() {
        return this.order;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final zv8 getPage() {
        return this.page;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final zv8 getSince() {
        return this.since;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final zv8 getSource() {
        return this.source;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final zv8 getTo() {
        return this.to;
    }

    public final PagingOptions copy(zv8 from, zv8 ignoredIds, zv8 limit, zv8 order, zv8 page, zv8 since, zv8 source, zv8 to) {
        from.getClass();
        ignoredIds.getClass();
        limit.getClass();
        order.getClass();
        page.getClass();
        since.getClass();
        source.getClass();
        to.getClass();
        return new PagingOptions(from, ignoredIds, limit, order, page, since, source, to);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PagingOptions)) {
            return false;
        }
        PagingOptions pagingOptions = (PagingOptions) other;
        return g76.L(this.from, pagingOptions.from) && g76.L(this.ignoredIds, pagingOptions.ignoredIds) && g76.L(this.limit, pagingOptions.limit) && g76.L(this.order, pagingOptions.order) && g76.L(this.page, pagingOptions.page) && g76.L(this.since, pagingOptions.since) && g76.L(this.source, pagingOptions.source) && g76.L(this.to, pagingOptions.to);
    }

    public final zv8 getFrom() {
        return this.from;
    }

    public final zv8 getIgnoredIds() {
        return this.ignoredIds;
    }

    public final zv8 getLimit() {
        return this.limit;
    }

    public final zv8 getOrder() {
        return this.order;
    }

    public final zv8 getPage() {
        return this.page;
    }

    public final zv8 getSince() {
        return this.since;
    }

    public final zv8 getSource() {
        return this.source;
    }

    public final zv8 getTo() {
        return this.to;
    }

    public final int hashCode() {
        return this.to.hashCode() + lv8.h(this.source, lv8.h(this.since, lv8.h(this.page, lv8.h(this.order, lv8.h(this.limit, lv8.h(this.ignoredIds, this.from.hashCode() * 31, 31), 31), 31), 31), 31), 31);
    }

    public final String toString() {
        zv8 zv8Var = this.from;
        zv8 zv8Var2 = this.ignoredIds;
        zv8 zv8Var3 = this.limit;
        zv8 zv8Var4 = this.order;
        zv8 zv8Var5 = this.page;
        zv8 zv8Var6 = this.since;
        zv8 zv8Var7 = this.source;
        zv8 zv8Var8 = this.to;
        StringBuilder sbW = ka1.w("PagingOptions(from=", zv8Var, ", ignoredIds=", zv8Var2, ", limit=");
        sbW.append(zv8Var3);
        sbW.append(", order=");
        sbW.append(zv8Var4);
        sbW.append(", page=");
        sbW.append(zv8Var5);
        sbW.append(", since=");
        sbW.append(zv8Var6);
        sbW.append(", source=");
        sbW.append(zv8Var7);
        sbW.append(", to=");
        sbW.append(zv8Var8);
        sbW.append(")");
        return sbW.toString();
    }

    public PagingOptions(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, zv8 zv8Var4, zv8 zv8Var5, zv8 zv8Var6, zv8 zv8Var7, zv8 zv8Var8) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        zv8Var4.getClass();
        zv8Var5.getClass();
        zv8Var6.getClass();
        zv8Var7.getClass();
        zv8Var8.getClass();
        this.from = zv8Var;
        this.ignoredIds = zv8Var2;
        this.limit = zv8Var3;
        this.order = zv8Var4;
        this.page = zv8Var5;
        this.since = zv8Var6;
        this.source = zv8Var7;
        this.to = zv8Var8;
    }

    public PagingOptions() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }
}
