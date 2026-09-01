package defpackage;

import com.medium.android.graphql.fragment.SearchCollectionResults;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dtb extends p92 {
    public c55 b;
    public SearchCollectionResults c;
    public Collection d;
    public Iterator e;
    public SearchCollectionResults.Item f;
    public Collection g;
    public int h;
    public int i;
    public int j;
    public int k;
    public int l;
    public int m;
    public /* synthetic */ Object n;
    public final /* synthetic */ etb o;
    public int p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dtb(etb etbVar, p92 p92Var) {
        super(p92Var);
        this.o = etbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.n = obj;
        this.p |= Integer.MIN_VALUE;
        Object objA = this.o.a(null, null, 0, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
