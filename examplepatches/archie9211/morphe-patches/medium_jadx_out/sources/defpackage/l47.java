package defpackage;

import com.medium.android.graphql.type.CatalogPagingOptionsInput;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l47 extends p92 {
    public CatalogPagingOptionsInput b;
    public /* synthetic */ Object c;
    public final /* synthetic */ m47 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l47(m47 m47Var, n92 n92Var) {
        super(n92Var);
        this.d = m47Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
