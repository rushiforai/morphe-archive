package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zl9 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ gn9 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zl9(gn9 gn9Var, p92 p92Var) {
        super(p92Var);
        this.c = gn9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Serializable serializableB = this.c.b(null, this);
        return serializableB == tb2.COROUTINE_SUSPENDED ? serializableB : new bjb(serializableB);
    }
}
