package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rc1 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ id1 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rc1(id1 id1Var, p92 p92Var) {
        super(p92Var);
        this.c = id1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Serializable serializableF = this.c.f(this);
        return serializableF == tb2.COROUTINE_SUSPENDED ? serializableF : new bjb(serializableF);
    }
}
