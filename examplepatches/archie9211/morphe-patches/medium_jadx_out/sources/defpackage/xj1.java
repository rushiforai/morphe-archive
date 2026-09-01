package defpackage;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xj1 extends yj1 {
    public static final /* synthetic */ AtomicIntegerFieldUpdater f = AtomicIntegerFieldUpdater.newUpdater(xj1.class, "consumed$volatile");
    private volatile /* synthetic */ int consumed$volatile;
    public final wj1 d;
    public final boolean e;

    public /* synthetic */ xj1(wj1 wj1Var, boolean z) {
        this(wj1Var, z, zx3.a, -3, nz0.SUSPEND);
    }

    @Override // defpackage.yj1, defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        if (this.b == -3) {
            boolean z = this.e;
            if (z && f.getAndSet(this, 1) == 1) {
                ygf.f("ReceiveChannel.consumeAsFlow can be collected just once");
                return null;
            }
            Object objW = bgf.w(do4Var, this.d, z, n92Var);
            if (objW == tb2.COROUTINE_SUSPENDED) {
                return objW;
            }
        } else {
            Object objB = super.b(do4Var, n92Var);
            if (objB == tb2.COROUTINE_SUSPENDED) {
                return objB;
            }
        }
        return c1e.a;
    }

    @Override // defpackage.yj1
    public final String d() {
        return "channel=" + this.d;
    }

    @Override // defpackage.yj1
    public final Object e(l2a l2aVar, n92 n92Var) throws Throwable {
        Object objW = bgf.w(new hzb(l2aVar), this.d, this.e, n92Var);
        return objW == tb2.COROUTINE_SUSPENDED ? objW : c1e.a;
    }

    @Override // defpackage.yj1
    public final yj1 f(ib2 ib2Var, int i, nz0 nz0Var) {
        return new xj1(this.d, this.e, ib2Var, i, nz0Var);
    }

    @Override // defpackage.yj1
    public final bo4 i() {
        return new xj1(this.d, this.e);
    }

    @Override // defpackage.yj1
    public final wj1 j(sb2 sb2Var) {
        if (!this.e || f.getAndSet(this, 1) != 1) {
            return this.b == -3 ? this.d : super.j(sb2Var);
        }
        ygf.f("ReceiveChannel.consumeAsFlow can be collected just once");
        return null;
    }

    public xj1(wj1 wj1Var, boolean z, ib2 ib2Var, int i, nz0 nz0Var) {
        super(ib2Var, i, nz0Var);
        this.d = wj1Var;
        this.e = z;
    }
}
