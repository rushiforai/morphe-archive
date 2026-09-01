package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r5e extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ o2b c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r5e(o2b o2bVar, p92 p92Var) {
        super(p92Var);
        this.c = o2bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws IOException {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objV = this.c.v(this);
        return objV == tb2.COROUTINE_SUSPENDED ? objV : new bjb(objV);
    }
}
