package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qs3 extends p92 {
    public o33 b;
    public Object c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ ht3 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qs3(ht3 ht3Var, p92 p92Var) {
        super(p92Var);
        this.f = ht3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        Serializable serializableE = this.f.e(null, this);
        return serializableE == tb2.COROUTINE_SUSPENDED ? serializableE : new bjb(serializableE);
    }
}
