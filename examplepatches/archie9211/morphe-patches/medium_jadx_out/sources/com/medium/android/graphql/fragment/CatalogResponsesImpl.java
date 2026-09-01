package com.medium.android.graphql.fragment;

import com.medium.android.graphql.fragment.CatalogResponsesImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.adapter.CatalogResponsesImpl_VariablesAdapter;
import com.medium.android.graphql.fragment.selections.CatalogResponsesSelections;
import com.medium.android.graphql.type.Catalog;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.i15;
import defpackage.k8;
import defpackage.ka1;
import defpackage.km4;
import defpackage.lv8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.xv8;
import defpackage.yl2;
import defpackage.zv8;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0002\b\b\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001BC\u0012\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003\u0012\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0003\u0012\u0016\b\u0002\u0010\n\u001a\u0010\u0012\f\u0012\n\u0018\u00010\bj\u0004\u0018\u0001`\t0\u0003¢\u0006\u0004\b\u000b\u0010\fJ'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0018\u0010\u001c\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u0003HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0018\u0010\u001e\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0003HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001dJ\u001e\u0010\u001f\u001a\u0010\u0012\f\u0012\n\u0018\u00010\bj\u0004\u0018\u0001`\t0\u0003HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u001dJL\u0010 \u001a\u00020\u00002\u0010\b\u0002\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u00032\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00032\u0016\b\u0002\u0010\n\u001a\u0010\u0012\f\u0012\n\u0018\u00010\bj\u0004\u0018\u0001`\t0\u0003HÆ\u0001¢\u0006\u0004\b \u0010!J\u0010\u0010#\u001a\u00020\"HÖ\u0001¢\u0006\u0004\b#\u0010$J\u0010\u0010%\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b%\u0010&J\u001a\u0010)\u001a\u00020\u00112\b\u0010(\u001a\u0004\u0018\u00010'HÖ\u0003¢\u0006\u0004\b)\u0010*R\u001f\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00040\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010+\u001a\u0004\b,\u0010\u001dR\u001f\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u00038\u0006¢\u0006\f\n\u0004\b\u0007\u0010+\u001a\u0004\b-\u0010\u001dR%\u0010\n\u001a\u0010\u0012\f\u0012\n\u0018\u00010\bj\u0004\u0018\u0001`\t0\u00038\u0006¢\u0006\f\n\u0004\b\n\u0010+\u001a\u0004\b.\u0010\u001d¨\u0006/"}, d2 = {"Lcom/medium/android/graphql/fragment/CatalogResponsesImpl;", "Li15;", "Lcom/medium/android/graphql/fragment/CatalogResponses;", "Lzv8;", "Lcom/medium/android/graphql/type/PagingOptions;", "paging", "Lcom/medium/android/graphql/type/ResponseSortType;", "sortType", "", "Lcom/medium/android/graphql/PaginationLimit;", "threadedPostsLimit", "<init>", "(Lzv8;Lzv8;Lzv8;)V", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lzv8;", "component2", "component3", "copy", "(Lzv8;Lzv8;Lzv8;)Lcom/medium/android/graphql/fragment/CatalogResponsesImpl;", "", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lzv8;", "getPaging", "getSortType", "getThreadedPostsLimit", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CatalogResponsesImpl implements i15 {
    private final zv8 paging;
    private final zv8 sortType;
    private final zv8 threadedPostsLimit;

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ CatalogResponsesImpl(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i, gy2 gy2Var) {
        int i2 = i & 1;
        xv8 xv8Var = xv8.a;
        this(i2 != 0 ? xv8Var : zv8Var, (i & 2) != 0 ? xv8Var : zv8Var2, (i & 4) != 0 ? xv8Var : zv8Var3);
    }

    public static /* synthetic */ CatalogResponsesImpl copy$default(CatalogResponsesImpl catalogResponsesImpl, zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3, int i, Object obj) {
        if ((i & 1) != 0) {
            zv8Var = catalogResponsesImpl.paging;
        }
        if ((i & 2) != 0) {
            zv8Var2 = catalogResponsesImpl.sortType;
        }
        if ((i & 4) != 0) {
            zv8Var3 = catalogResponsesImpl.threadedPostsLimit;
        }
        return catalogResponsesImpl.copy(zv8Var, zv8Var2, zv8Var3);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(CatalogResponsesImpl_ResponseAdapter.CatalogResponses.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final zv8 getPaging() {
        return this.paging;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final zv8 getSortType() {
        return this.sortType;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final zv8 getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final CatalogResponsesImpl copy(zv8 paging, zv8 sortType, zv8 threadedPostsLimit) {
        paging.getClass();
        sortType.getClass();
        threadedPostsLimit.getClass();
        return new CatalogResponsesImpl(paging, sortType, threadedPostsLimit);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CatalogResponsesImpl)) {
            return false;
        }
        CatalogResponsesImpl catalogResponsesImpl = (CatalogResponsesImpl) other;
        return g76.L(this.paging, catalogResponsesImpl.paging) && g76.L(this.sortType, catalogResponsesImpl.sortType) && g76.L(this.threadedPostsLimit, catalogResponsesImpl.threadedPostsLimit);
    }

    public final zv8 getPaging() {
        return this.paging;
    }

    public final zv8 getSortType() {
        return this.sortType;
    }

    public final zv8 getThreadedPostsLimit() {
        return this.threadedPostsLimit;
    }

    public final int hashCode() {
        return this.threadedPostsLimit.hashCode() + lv8.h(this.sortType, this.paging.hashCode() * 31, 31);
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        Catalog.INSTANCE.getClass();
        sm8 sm8Var = Catalog.type;
        sm8Var.getClass();
        List<sx1> list = CatalogResponsesSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8Var, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        CatalogResponsesImpl_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        zv8 zv8Var = this.paging;
        zv8 zv8Var2 = this.sortType;
        return km4.B(ka1.w("CatalogResponsesImpl(paging=", zv8Var, ", sortType=", zv8Var2, ", threadedPostsLimit="), this.threadedPostsLimit, ")");
    }

    public CatalogResponsesImpl(zv8 zv8Var, zv8 zv8Var2, zv8 zv8Var3) {
        zv8Var.getClass();
        zv8Var2.getClass();
        zv8Var3.getClass();
        this.paging = zv8Var;
        this.sortType = zv8Var2;
        this.threadedPostsLimit = zv8Var3;
    }

    public CatalogResponsesImpl() {
        this(null, null, null, 7, null);
    }
}
