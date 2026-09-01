package defpackage;

import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class ka6 implements Runnable {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ n0c b;

    public /* synthetic */ ka6(n0c n0cVar) {
        this.b = n0cVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        n0c n0cVar = this.b;
        switch (i) {
            case 0:
                na6 na6Var = (na6) n0cVar.e;
                n0cVar.W();
                na6Var.H.z.decrementAndGet();
                break;
            default:
                try {
                    ((na6) n0cVar.e).J.P(r0.I, n0cVar.u());
                } catch (RuntimeException e) {
                    int i2 = na6.O;
                    Log.i("na6", "Error while trying to log CronetTrafficInfo: ", e);
                    return;
                }
                break;
        }
    }

    public /* synthetic */ ka6(n0c n0cVar, mq7 mq7Var) {
        this.b = n0cVar;
    }
}
