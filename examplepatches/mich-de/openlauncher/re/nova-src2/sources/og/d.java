package og;

import android.content.Context;
import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.SparseArray;
import com.google.android.gms.cloudmessaging.zzd;
import java.util.ArrayDeque;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import mk.w;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80390a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f80391b;

    public /* synthetic */ d(e eVar, int i5) {
        this.f80390a = i5;
        this.f80391b = eVar;
    }

    @Override // java.lang.Runnable
    public final void run() throws RemoteException {
        switch (this.f80390a) {
            case 0:
                e eVar = this.f80391b;
                synchronized (eVar) {
                    if (eVar.f80392a == 1) {
                        eVar.e("Timed out while binding");
                    }
                }
                return;
            case 1:
                break;
            default:
                this.f80391b.e("Service disconnected");
                return;
        }
        while (true) {
            e eVar2 = this.f80391b;
            synchronized (eVar2) {
                try {
                    if (eVar2.f80392a != 2) {
                        return;
                    }
                    ArrayDeque arrayDeque = eVar2.f80395d;
                    if (arrayDeque.isEmpty()) {
                        eVar2.l();
                        return;
                    }
                    f fVar = (f) arrayDeque.poll();
                    SparseArray sparseArray = eVar2.f80396e;
                    int i5 = fVar.f80398a;
                    sparseArray.put(i5, fVar);
                    ((ScheduledExecutorService) eVar2.f80397f.f80408c).schedule(new w(13, eVar2, fVar), 30L, TimeUnit.SECONDS);
                    g gVar = eVar2.f80397f;
                    Messenger messenger = eVar2.f80393b;
                    int i11 = fVar.f80400c;
                    Message messageObtain = Message.obtain();
                    messageObtain.what = i11;
                    messageObtain.arg1 = i5;
                    messageObtain.replyTo = messenger;
                    Bundle bundle = new Bundle();
                    bundle.putBoolean("oneWay", fVar.a());
                    bundle.putString("pkg", ((Context) gVar.f80407b).getPackageName());
                    bundle.putBundle("data", fVar.f80401d);
                    messageObtain.setData(bundle);
                    try {
                        m.w wVar = eVar2.f80394c;
                        Messenger messenger2 = (Messenger) wVar.f75378b;
                        if (messenger2 != null) {
                            messenger2.send(messageObtain);
                        } else {
                            zzd zzdVar = (zzd) wVar.f75379c;
                            if (zzdVar == null) {
                                throw new IllegalStateException("Both messengers are null");
                            }
                            zzdVar.f31776a.send(messageObtain);
                        }
                    } catch (RemoteException e3) {
                        eVar2.e(e3.getMessage());
                    }
                } finally {
                }
            }
        }
    }
}
