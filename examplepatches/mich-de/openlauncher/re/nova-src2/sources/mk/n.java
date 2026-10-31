package mk;

import android.content.Context;
import android.os.IInterface;
import android.util.Log;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final /* synthetic */ class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76458a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o f76459b;

    public /* synthetic */ n(o oVar, int i5) {
        this.f76458a = i5;
        this.f76459b = oVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f76458a) {
            case 0:
                o oVar = this.f76459b;
                if (((IInterface) oVar.f76470k) != null) {
                    if (Log.isLoggable("ServiceConnMgrImpl", 4)) {
                        Log.i("ServiceConnMgrImpl", "Unbind from service.");
                    }
                    Context context = (Context) oVar.f76462c;
                    kk.l lVar = (kk.l) oVar.f76469j;
                    lVar.getClass();
                    context.unbindService(lVar);
                    oVar.f76460a = false;
                    oVar.f76470k = null;
                    oVar.f76469j = null;
                    ArrayList arrayList = (ArrayList) oVar.f76464e;
                    synchronized (arrayList) {
                        arrayList.clear();
                    }
                    Log.i("ServiceConnMgrImpl", "notifyOnDisconnected in unbind()");
                    oVar.l();
                    return;
                }
                return;
            default:
                o oVar2 = this.f76459b;
                if (((IInterface) oVar2.f76470k) != null) {
                    oVar2.f76470k = null;
                    Log.i("ServiceConnMgrImpl", "notifyOnDisconnected in reportBinderDeath()");
                    oVar2.l();
                    return;
                }
                return;
        }
    }
}
