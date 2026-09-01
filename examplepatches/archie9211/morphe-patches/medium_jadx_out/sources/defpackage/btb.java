package defpackage;

import com.medium.android.graphql.fragment.SearchCatalogResults;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class btb extends p92 {
    public c55 b;
    public SearchCatalogResults c;
    public Collection d;
    public Iterator e;
    public SearchCatalogResults.Item f;
    public Collection g;
    public int h;
    public int i;
    public int j;
    public int k;
    public int l;
    public int m;
    public /* synthetic */ Object n;
    public final /* synthetic */ ctb o;
    public int p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public btb(ctb ctbVar, p92 p92Var) {
        super(p92Var);
        this.o = ctbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.n = obj;
        this.p |= Integer.MIN_VALUE;
        Object objA = this.o.a(null, null, 0, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
