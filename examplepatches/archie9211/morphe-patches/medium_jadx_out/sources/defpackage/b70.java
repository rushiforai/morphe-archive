package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b70 implements Executor {
    public final /* synthetic */ int a;

    public /* synthetic */ b70(int i) {
        this.a = i;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.a) {
            case 0:
                c70.N().f.g.execute(runnable);
                break;
            default:
                runnable.run();
                break;
        }
    }
}
