package defpackage;

import java.util.concurrent.ScheduledFuture;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p51 implements q51 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ p51(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.q51
    public final void b(Throwable th) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((ScheduledFuture) obj).cancel(false);
                break;
            case 1:
                ((x45) obj).invoke(th);
                break;
            default:
                ((yh3) obj).dispose();
                break;
        }
    }

    public final String toString() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return "CancelFutureOnCancel[" + ((ScheduledFuture) obj) + ']';
            case 1:
                return "CancelHandler.UserSupplied[" + ((x45) obj).getClass().getSimpleName() + '@' + vv2.I(this) + ']';
            default:
                return "DisposeOnCancel[" + ((yh3) obj) + ']';
        }
    }
}
