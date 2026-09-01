package defpackage;

import android.os.Build;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uw3 extends ht2 {
    public final /* synthetic */ wj r;

    public uw3(wj wjVar) {
        this.r = wjVar;
    }

    @Override // defpackage.ht2
    public final void x0(Throwable th) {
        ((yw3) this.r.a).f(th);
    }

    @Override // defpackage.ht2
    public final void y0(n0c n0cVar) {
        wj wjVar = this.r;
        wjVar.c = n0cVar;
        n0c n0cVar2 = (n0c) wjVar.c;
        yw3 yw3Var = (yw3) wjVar.a;
        wjVar.b = new ku3(n0cVar2, yw3Var.g, yw3Var.i, Build.VERSION.SDK_INT >= 34 ? ex3.a() : vv2.G());
        yw3 yw3Var2 = (yw3) wjVar.a;
        ArrayList arrayList = new ArrayList();
        yw3Var2.a.writeLock().lock();
        try {
            yw3Var2.c = 1;
            arrayList.addAll(yw3Var2.b);
            yw3Var2.b.clear();
            yw3Var2.a.writeLock().unlock();
            yw3Var2.d.post(new u41(arrayList, yw3Var2.c, (Throwable) null));
        } catch (Throwable th) {
            yw3Var2.a.writeLock().unlock();
            throw th;
        }
    }
}
