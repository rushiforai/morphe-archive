package defpackage;

import android.os.CancellationSignal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xg2 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ CancellationSignal b;

    public /* synthetic */ xg2(CancellationSignal cancellationSignal, int i) {
        this.a = i;
        this.b = cancellationSignal;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        CancellationSignal cancellationSignal = this.b;
        switch (i) {
            case 0:
                cancellationSignal.cancel();
                break;
            default:
                cancellationSignal.cancel();
                break;
        }
        return c1eVar;
    }
}
