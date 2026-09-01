package com.medium.android.graphql.fragment;

import com.medium.android.graphql.fragment.PeopleSearchDataImpl_ResponseAdapter;
import com.medium.android.graphql.fragment.selections.PeopleSearchDataSelections;
import com.medium.android.graphql.type.People;
import defpackage.ae6;
import defpackage.b1e;
import defpackage.c8;
import defpackage.ey3;
import defpackage.i15;
import defpackage.k8;
import defpackage.n1b;
import defpackage.nx1;
import defpackage.sx1;
import defpackage.yl2;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004J\u001a\u0010\b\u001a\u00020\u00072\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0096\u0002¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016¢\u0006\u0004\b\u000b\u0010\fJ'\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0015\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001a¨\u0006\u001b"}, d2 = {"Lcom/medium/android/graphql/fragment/PeopleSearchDataImpl;", "Li15;", "Lcom/medium/android/graphql/fragment/PeopleSearchData;", "<init>", "()V", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "Lae6;", "writer", "Lyl2;", "customScalarAdapters", "withDefaultValues", "Lc1e;", "serializeVariables", "(Lae6;Lyl2;Z)V", "Lc8;", "adapter", "()Lc8;", "Lnx1;", "rootField", "()Lnx1;", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PeopleSearchDataImpl implements i15 {
    @Override // defpackage.m44
    public final c8 adapter() {
        return k8.c(PeopleSearchDataImpl_ResponseAdapter.PeopleSearchData.INSTANCE, true);
    }

    public final boolean equals(Object other) {
        return other != null && other.getClass() == PeopleSearchDataImpl.class;
    }

    public final int hashCode() {
        return n1b.a.b(PeopleSearchDataImpl.class).hashCode();
    }

    @Override // defpackage.m44
    public final nx1 rootField() {
        People.INSTANCE.getClass();
        b1e b1eVar = People.type;
        b1eVar.getClass();
        List<sx1> list = PeopleSearchDataSelections.INSTANCE.get__root();
        list.getClass();
        ey3 ey3Var = ey3.a;
        return new nx1("data", b1eVar, null, ey3Var, ey3Var, list);
    }

    @Override // defpackage.m44
    public final void serializeVariables(ae6 writer, yl2 customScalarAdapters, boolean withDefaultValues) {
        writer.getClass();
        customScalarAdapters.getClass();
    }
}
