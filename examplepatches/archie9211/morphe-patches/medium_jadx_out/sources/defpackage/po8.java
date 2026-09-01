package defpackage;

import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class po8 extends p92 {
    public Collection b;
    public Iterator c;
    public Collection d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ yo8 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public po8(yo8 yo8Var, p92 p92Var) {
        super(p92Var);
        this.h = yo8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objE = this.h.e(this);
        return objE == tb2.COROUTINE_SUSPENDED ? objE : new bjb(objE);
    }
}
