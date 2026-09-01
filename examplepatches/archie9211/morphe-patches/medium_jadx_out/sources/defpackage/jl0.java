package defpackage;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jl0 extends xa6 {
    public static final /* synthetic */ long h = m80.a.objectFieldOffset(jl0.class.getDeclaredField("_disposer$volatile"));
    private volatile /* synthetic */ Object _disposer$volatile;
    public final x51 e;
    public yh3 f;
    public final /* synthetic */ ll0 g;

    public jl0(ll0 ll0Var, x51 x51Var) {
        this.g = ll0Var;
        this.e = x51Var;
    }

    @Override // defpackage.xa6
    public final boolean l() {
        return false;
    }

    @Override // defpackage.xa6
    public final void m(Throwable th) throws DispatchException {
        x51 x51Var = this.e;
        if (th != null) {
            d1g d1gVarF = x51Var.F(new cy1(th, false), null);
            if (d1gVarF != null) {
                x51Var.t(d1gVarF);
                kl0 kl0Var = (kl0) m80.a.getObjectVolatile(this, h);
                if (kl0Var != null) {
                    kl0Var.a();
                    return;
                }
                return;
            }
            return;
        }
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = ll0.b;
        ll0 ll0Var = this.g;
        if (atomicIntegerFieldUpdater.decrementAndGet(ll0Var) == 0) {
            n33[] n33VarArr = ll0Var.a;
            ArrayList arrayList = new ArrayList(n33VarArr.length);
            for (n33 n33Var : n33VarArr) {
                arrayList.add(n33Var.p());
            }
            x51Var.resumeWith(arrayList);
        }
    }
}
