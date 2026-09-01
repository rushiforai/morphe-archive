package defpackage;

import com.medium.android.graphql.GetPubPostsStatsQuery;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j8a extends p92 {
    public c55 b;
    public GetPubPostsStatsQuery.PublicationPostsConnection c;
    public Collection d;
    public Iterator e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;
    public /* synthetic */ Object l;
    public final /* synthetic */ l8a m;
    public int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j8a(l8a l8aVar, p92 p92Var) {
        super(p92Var);
        this.m = l8aVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.l = obj;
        this.n |= Integer.MIN_VALUE;
        Object objA = this.m.a(null, null, null, 0, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
