package defpackage;

import com.medium.android.graphql.UserActivitiesQuery;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y8e extends p92 {
    public c55 b;
    public UserActivitiesQuery.OnUserActivitiesConnection c;
    public Collection d;
    public Iterator e;
    public int f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;
    public int l;
    public /* synthetic */ Object m;
    public final /* synthetic */ c9e n;
    public int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y8e(c9e c9eVar, p92 p92Var) {
        super(p92Var);
        this.n = c9eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.m = obj;
        this.o |= Integer.MIN_VALUE;
        Object objA = this.n.a(null, 0, null, 0, null, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
