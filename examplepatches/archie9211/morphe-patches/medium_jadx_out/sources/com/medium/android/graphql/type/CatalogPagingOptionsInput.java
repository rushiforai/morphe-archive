package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ,\u0010\r\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0005HÖ\u0001¢\u0006\u0004\b\u0012\u0010\fJ\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u001a\u0004\b\u0018\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001a\u0010\f¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "", "Lzv8;", "Lcom/medium/android/graphql/type/CatalogPagingCursorInput;", "cursor", "", "limit", "<init>", "(Lzv8;I)V", "component1", "()Lzv8;", "component2", "()I", "copy", "(Lzv8;I)Lcom/medium/android/graphql/type/CatalogPagingOptionsInput;", "", "toString", "()Ljava/lang/String;", "hashCode", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getCursor", "I", "getLimit", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogPagingOptionsInput {
    private final zv8 cursor;
    private final int limit;

    public CatalogPagingOptionsInput(zv8 zv8Var, int i) {
        zv8Var.getClass();
        this.cursor = zv8Var;
        this.limit = i;
    }

    public static /* synthetic */ CatalogPagingOptionsInput copy$default(CatalogPagingOptionsInput catalogPagingOptionsInput, zv8 zv8Var, int i, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            zv8Var = catalogPagingOptionsInput.cursor;
        }
        if ((i2 & 2) != 0) {
            i = catalogPagingOptionsInput.limit;
        }
        return catalogPagingOptionsInput.copy(zv8Var, i);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getCursor() {
        return this.cursor;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final int getLimit() {
        return this.limit;
    }

    public final CatalogPagingOptionsInput copy(zv8 cursor, int limit) {
        cursor.getClass();
        return new CatalogPagingOptionsInput(cursor, limit);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogPagingOptionsInput)) {
            return false;
        }
        CatalogPagingOptionsInput catalogPagingOptionsInput = (CatalogPagingOptionsInput) other;
        return g76.L(this.cursor, catalogPagingOptionsInput.cursor) && this.limit == catalogPagingOptionsInput.limit;
    }

    public final zv8 getCursor() {
        return this.cursor;
    }

    public final int getLimit() {
        return this.limit;
    }

    public final int hashCode() {
        return (this.cursor.hashCode() * 31) + this.limit;
    }

    public final String toString() {
        return "CatalogPagingOptionsInput(cursor=" + this.cursor + ", limit=" + this.limit + ")";
    }

    public /* synthetic */ CatalogPagingOptionsInput(zv8 zv8Var, int i, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? xv8.a : zv8Var, i);
    }
}
