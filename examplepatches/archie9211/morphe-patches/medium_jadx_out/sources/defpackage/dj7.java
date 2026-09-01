package defpackage;

import com.medium.android.graphql.GetMatchedContactsQuery;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dj7 extends p92 {
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public int g;
    public int h;
    public c55 i;
    public GetMatchedContactsQuery.OnMatchedContactsConnection j;
    public Collection k;
    public Iterator l;
    public boolean m;
    public /* synthetic */ Object n;
    public final /* synthetic */ fj7 o;
    public int p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dj7(fj7 fj7Var, p92 p92Var) {
        super(p92Var);
        this.o = fj7Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.n = obj;
        this.p |= Integer.MIN_VALUE;
        Object objA = this.o.a(0, null, false, null, 0, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
