package com.medium.android.graphql.fragment;

import com.medium.android.graphql.fragment.EntityCatalogsConnectionDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.adapter.EntityCatalogsConnectionDataImpl_VariablesAdapter;
import com.medium.android.graphql.fragment.selections.EntityCatalogsConnectionDataSelections;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.EntityCatalogsConnection;
import defpackage.ae6;
import defpackage.c8;
import defpackage.ey3;
import defpackage.i15;
import defpackage.k8;
import defpackage.nx1;
import defpackage.sm8;
import defpackage.sx1;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0006\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J'\u0010\u000e\u001a\u00020\r2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000bH\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u0015\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u0018\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u0010\u0010\u001b\u001a\u00020\u001aHÖ\u0001¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u001e\u001a\u00020\u001dHÖ\u0001¢\u0006\u0004\b\u001e\u0010\u001fJ\u001a\u0010\"\u001a\u00020\u000b2\b\u0010!\u001a\u0004\u0018\u00010 HÖ\u0003¢\u0006\u0004\b\"\u0010#R\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010$\u001a\u0004\b%\u0010\u0017¨\u0006&"}, d2 = {"Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionDataImpl;", "Li15;", "Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionData;", "Lcom/medium/android/graphql/type/CatalogType;", "catalogType", "<init>", "(Lcom/medium/android/graphql/type/CatalogType;)V", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "component1", "()Lcom/medium/android/graphql/type/CatalogType;", "copy", "(Lcom/medium/android/graphql/type/CatalogType;)Lcom/medium/android/graphql/fragment/EntityCatalogsConnectionDataImpl;", "", "toString", "()Ljava/lang/String;", "", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/graphql/type/CatalogType;", "getCatalogType", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class EntityCatalogsConnectionDataImpl implements i15 {
    private final CatalogType catalogType;

    public EntityCatalogsConnectionDataImpl(CatalogType catalogType) {
        catalogType.getClass();
        this.catalogType = catalogType;
    }

    public static /* synthetic */ EntityCatalogsConnectionDataImpl copy$default(EntityCatalogsConnectionDataImpl entityCatalogsConnectionDataImpl, CatalogType catalogType, int i, Object obj) {
        if ((i & 1) != 0) {
            catalogType = entityCatalogsConnectionDataImpl.catalogType;
        }
        return entityCatalogsConnectionDataImpl.copy(catalogType);
    }

    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(EntityCatalogsConnectionDataImpl_ResponseAdapter.EntityCatalogsConnectionData.INSTANCE, false);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final CatalogType getCatalogType() {
        return this.catalogType;
    }

    public final EntityCatalogsConnectionDataImpl copy(CatalogType catalogType) {
        catalogType.getClass();
        return new EntityCatalogsConnectionDataImpl(catalogType);
    }

    public final boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof EntityCatalogsConnectionDataImpl) && this.catalogType == ((EntityCatalogsConnectionDataImpl) other).catalogType;
    }

    public final CatalogType getCatalogType() {
        return this.catalogType;
    }

    public final int hashCode() {
        return this.catalogType.hashCode();
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        EntityCatalogsConnection.INSTANCE.getClass();
        sm8 sm8Var = EntityCatalogsConnection.type;
        sm8Var.getClass();
        List<sx1> list = EntityCatalogsConnectionDataSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", sm8Var, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
        EntityCatalogsConnectionDataImpl_VariablesAdapter.INSTANCE.serializeVariables(writer, this, customScalarAdapters, withDefaultValues);
    }

    public final String toString() {
        return "EntityCatalogsConnectionDataImpl(catalogType=" + this.catalogType + ")";
    }
}
