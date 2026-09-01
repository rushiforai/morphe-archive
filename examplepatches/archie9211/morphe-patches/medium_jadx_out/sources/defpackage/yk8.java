package defpackage;

import com.medium.android.graphql.NotificationsQuery;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yk8 extends p92 {
    public int b;
    public int c;
    public int d;
    public int e;
    public int f;
    public int g;
    public int h;
    public c55 i;
    public NotificationsQuery.NotificationsConnectionByActivityTypes j;
    public Collection k;
    public Iterator l;
    public /* synthetic */ Object m;
    public final /* synthetic */ zk8 n;
    public int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yk8(zk8 zk8Var, p92 p92Var) {
        super(p92Var);
        this.n = zk8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.m = obj;
        this.o |= Integer.MIN_VALUE;
        Object objA = this.n.a(0, null, null, null, 0, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
