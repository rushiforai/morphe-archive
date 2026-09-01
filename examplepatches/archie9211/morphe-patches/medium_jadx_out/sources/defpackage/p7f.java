package defpackage;

import android.os.Looper;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p7f implements Executor {
    public final /* synthetic */ int a = 1;
    public final Object b;

    public p7f() {
        tjf tjfVar = new tjf(Looper.getMainLooper());
        Looper.getMainLooper();
        this.b = tjfVar;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((q7f) obj).c.post(runnable);
                break;
            default:
                ((tjf) obj).post(runnable);
                break;
        }
    }

    public p7f(q7f q7fVar) {
        this.b = q7fVar;
    }
}
