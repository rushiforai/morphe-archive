package defpackage;

import java.util.concurrent.ThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ax3 extends ht2 {
    public final /* synthetic */ ht2 r;
    public final /* synthetic */ ThreadPoolExecutor s;

    public ax3(ht2 ht2Var, ThreadPoolExecutor threadPoolExecutor) {
        this.r = ht2Var;
        this.s = threadPoolExecutor;
    }

    @Override // defpackage.ht2
    public final void x0(Throwable th) {
        ThreadPoolExecutor threadPoolExecutor = this.s;
        try {
            this.r.x0(th);
        } finally {
            threadPoolExecutor.shutdown();
        }
    }

    @Override // defpackage.ht2
    public final void y0(n0c n0cVar) {
        ThreadPoolExecutor threadPoolExecutor = this.s;
        try {
            this.r.y0(n0cVar);
        } finally {
            threadPoolExecutor.shutdown();
        }
    }
}
