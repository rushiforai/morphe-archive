package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vk2 extends p92 {
    public String b;
    public String c;
    public String d;
    public List e;
    public /* synthetic */ Object f;
    public final /* synthetic */ zk2 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vk2(zk2 zk2Var, p92 p92Var) {
        super(p92Var);
        this.g = zk2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objV = this.g.v(null, null, null, null, this);
        return objV == tb2.COROUTINE_SUSPENDED ? objV : new bjb(objV);
    }
}
