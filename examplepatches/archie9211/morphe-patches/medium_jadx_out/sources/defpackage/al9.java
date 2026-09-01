package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class al9 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ gl9 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public al9(gl9 gl9Var, p92 p92Var) {
        super(p92Var);
        this.c = gl9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Serializable serializableH = this.c.h(null, null, this);
        return serializableH == tb2.COROUTINE_SUSPENDED ? serializableH : new bjb(serializableH);
    }
}
