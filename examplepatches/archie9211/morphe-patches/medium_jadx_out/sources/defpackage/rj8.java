package defpackage;

import com.medium.android.graphql.UnreadNotificationsCountQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rj8 extends p92 {
    public UnreadNotificationsCountQuery.Data b;
    public Object c;
    public /* synthetic */ Object d;
    public final /* synthetic */ uj8 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rj8(uj8 uj8Var, p92 p92Var) {
        super(p92Var);
        this.e = uj8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objB = this.e.b(this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
