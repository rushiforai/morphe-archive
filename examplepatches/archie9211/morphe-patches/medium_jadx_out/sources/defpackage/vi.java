package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vi extends p92 {
    public c55 b;
    public pya c;
    public List d;
    public Iterator e;
    public int f;
    public int g;
    public int h;
    public /* synthetic */ Object i;
    public final /* synthetic */ wi j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vi(wi wiVar, p92 p92Var) {
        super(p92Var);
        this.j = wiVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        Object objA = this.j.a(null, null, null, 0, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
