package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.analytics.wYI.ivbZv;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class dag implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ nhg b;

    public /* synthetic */ dag(nhg nhgVar, int i) {
        this.a = i;
        this.b = nhgVar;
    }

    private final void a() {
        nhg nhgVar = this.b;
        synchronized (nhgVar) {
            if (nhgVar.a == 1) {
                nhgVar.a("Timed out while binding");
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.a) {
            case 0:
                break;
            case 1:
                a();
                return;
            default:
                this.b.a("Service disconnected");
                return;
        }
        while (true) {
            nhg nhgVar = this.b;
            synchronized (nhgVar) {
                try {
                    if (nhgVar.a != 2) {
                        return;
                    }
                    if (nhgVar.d.isEmpty()) {
                        nhgVar.c();
                        return;
                    }
                    ojg ojgVar = (ojg) nhgVar.d.poll();
                    nhgVar.e.put(ojgVar.a, ojgVar);
                    ((ScheduledExecutorService) nhgVar.f.c).schedule(new p0g(nhgVar, 27, ojgVar), 30L, TimeUnit.SECONDS);
                    if (Log.isLoggable("MessengerIpcClient", 3)) {
                        Log.d("MessengerIpcClient", "Sending ".concat(String.valueOf(ojgVar)));
                    }
                    opg opgVar = nhgVar.f;
                    Messenger messenger = nhgVar.b;
                    int i = ojgVar.c;
                    Context context = (Context) opgVar.b;
                    Message messageObtain = Message.obtain();
                    messageObtain.what = i;
                    messageObtain.arg1 = ojgVar.a;
                    messageObtain.replyTo = messenger;
                    Bundle bundle = new Bundle();
                    bundle.putBoolean(ivbZv.CTFmfiqnTaUAv, ojgVar.a());
                    bundle.putString("pkg", context.getPackageName());
                    bundle.putBundle("data", ojgVar.d);
                    messageObtain.setData(bundle);
                    try {
                        d2f d2fVar = nhgVar.c;
                        Messenger messenger2 = (Messenger) d2fVar.b;
                        if (messenger2 != null) {
                            messenger2.send(messageObtain);
                        } else {
                            i0g i0gVar = (i0g) d2fVar.c;
                            if (i0gVar == null) {
                                throw new IllegalStateException("Both messengers are null");
                            }
                            i0gVar.a.send(messageObtain);
                        }
                    } catch (RemoteException e) {
                        nhgVar.a(e.getMessage());
                    }
                } finally {
                }
            }
        }
    }
}
