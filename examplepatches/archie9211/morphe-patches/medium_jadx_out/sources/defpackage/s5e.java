package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s5e extends p92 {
    public Iterator b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ t5e e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s5e(t5e t5eVar, p92 p92Var) {
        super(p92Var);
        this.e = t5eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objA = this.e.a(null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
