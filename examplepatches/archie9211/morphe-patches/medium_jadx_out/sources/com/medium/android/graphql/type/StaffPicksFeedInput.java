package com.medium.android.graphql.type;

import defpackage.g76;
import defpackage.gy2;
import defpackage.xv8;
import defpackage.zv8;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0086\b\u0018\u00002\u00020\u0001B!\u0012\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0002HÆ\u0003¢\u0006\u0004\b\t\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u000b\u0010\fJ,\u0010\r\u001a\u00020\u00002\u0010\b\u0002\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00022\b\b\u0002\u0010\u0006\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0012\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u001f\u0010\u0004\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u0019\u0010\nR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001b\u0010\f¨\u0006\u001c"}, d2 = {"Lcom/medium/android/graphql/type/StaffPicksFeedInput;", "", "Lzv8;", "", "catalogID", "Lcom/medium/android/graphql/type/PagingOptions;", "paging", "<init>", "(Lzv8;Lcom/medium/android/graphql/type/PagingOptions;)V", "component1", "()Lzv8;", "component2", "()Lcom/medium/android/graphql/type/PagingOptions;", "copy", "(Lzv8;Lcom/medium/android/graphql/type/PagingOptions;)Lcom/medium/android/graphql/type/StaffPicksFeedInput;", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getCatalogID", "Lcom/medium/android/graphql/type/PagingOptions;", "getPaging", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class StaffPicksFeedInput {
    private final zv8 catalogID;
    private final PagingOptions paging;

    public StaffPicksFeedInput(zv8 zv8Var, PagingOptions pagingOptions) {
        zv8Var.getClass();
        pagingOptions.getClass();
        this.catalogID = zv8Var;
        this.paging = pagingOptions;
    }

    public static /* synthetic */ StaffPicksFeedInput copy$default(StaffPicksFeedInput staffPicksFeedInput, zv8 zv8Var, PagingOptions pagingOptions, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = staffPicksFeedInput.catalogID;
        }
        if ((i & 2) != 0) {
            pagingOptions = staffPicksFeedInput.paging;
        }
        return staffPicksFeedInput.copy(zv8Var, pagingOptions);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getCatalogID() {
        return this.catalogID;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final PagingOptions getPaging() {
        return this.paging;
    }

    public final StaffPicksFeedInput copy(zv8 catalogID, PagingOptions paging) {
        catalogID.getClass();
        paging.getClass();
        return new StaffPicksFeedInput(catalogID, paging);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof StaffPicksFeedInput)) {
            return false;
        }
        StaffPicksFeedInput staffPicksFeedInput = (StaffPicksFeedInput) other;
        return g76.L(this.catalogID, staffPicksFeedInput.catalogID) && g76.L(this.paging, staffPicksFeedInput.paging);
    }

    public final zv8 getCatalogID() {
        return this.catalogID;
    }

    public final PagingOptions getPaging() {
        return this.paging;
    }

    public final int hashCode() {
        return this.paging.hashCode() + (this.catalogID.hashCode() * 31);
    }

    public final String toString() {
        return "StaffPicksFeedInput(catalogID=" + this.catalogID + ", paging=" + this.paging + ")";
    }

    public /* synthetic */ StaffPicksFeedInput(zv8 zv8Var, PagingOptions pagingOptions, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? xv8.a : zv8Var, pagingOptions);
    }
}
