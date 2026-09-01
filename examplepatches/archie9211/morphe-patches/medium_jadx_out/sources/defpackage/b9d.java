package defpackage;

import com.medium.android.graphql.TagPostsQuery;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b9d extends p92 {
    public c55 b;
    public TagPostsQuery.Posts c;
    public Collection d;
    public Iterator e;
    public Collection f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;
    public int l;
    public /* synthetic */ Object m;
    public final /* synthetic */ c9d n;
    public int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b9d(c9d c9dVar, p92 p92Var) {
        super(p92Var);
        this.n = c9dVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.m = obj;
        this.o |= Integer.MIN_VALUE;
        Object objA = this.n.a(0, 0, null, this, null, null, null);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
