package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b40 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ c40 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b40(c40 c40Var, p92 p92Var) {
        super(p92Var);
        this.c = c40Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Serializable serializableA = this.c.a(null, null, this);
        return serializableA == tb2.COROUTINE_SUSPENDED ? serializableA : new bjb(serializableA);
    }
}
