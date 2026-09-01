package defpackage;

import android.content.ComponentName;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.cloudmessaging.zzt;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yhc implements Handler.Callback {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ yhc(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    private final boolean a(Message message) {
        if (message.what != 0) {
            return false;
        }
        o2b o2bVar = (o2b) this.b;
        zhc zhcVar = (zhc) message.obj;
        synchronized (o2bVar.b) {
            if (((zhc) o2bVar.d) == zhcVar || ((zhc) o2bVar.e) == zhcVar) {
                o2bVar.f(zhcVar, 2);
            }
        }
        return true;
    }

    private final boolean b(Message message) {
        int i = message.arg1;
        if (Log.isLoggable("MessengerIpcClient", 3)) {
            Log.d("MessengerIpcClient", "Received response to request: " + i);
        }
        nhg nhgVar = (nhg) this.b;
        synchronized (nhgVar) {
            try {
                ojg ojgVar = (ojg) nhgVar.e.get(i);
                if (ojgVar == null) {
                    Log.w("MessengerIpcClient", "Received response for unknown request: " + i);
                    return true;
                }
                nhgVar.e.remove(i);
                nhgVar.c();
                Bundle data = message.getData();
                if (data.getBoolean("unsupported", false)) {
                    ojgVar.b(new zzt("Not supported by GmsCore", null));
                    return true;
                }
                switch (ojgVar.e) {
                    case 0:
                        if (data.getBoolean("ack", false)) {
                            ojgVar.c(null);
                            return true;
                        }
                        ojgVar.b(new zzt("Invalid response to one way request", null));
                        return true;
                    default:
                        Bundle bundle = data.getBundle("data");
                        if (bundle == null) {
                            bundle = Bundle.EMPTY;
                        }
                        ojgVar.c(bundle);
                        return true;
                }
            } finally {
            }
        }
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        switch (this.a) {
            case 0:
                return a(message);
            case 1:
                return b(message);
            default:
                int i = message.what;
                if (i != 0) {
                    if (i != 1) {
                        return false;
                    }
                    rig rigVar = (rig) this.b;
                    synchronized (rigVar.a) {
                        try {
                            gfg gfgVar = (gfg) message.obj;
                            egg eggVar = (egg) rigVar.a.get(gfgVar);
                            if (eggVar != null && eggVar.b == 3) {
                                String strValueOf = String.valueOf(gfgVar);
                                StringBuilder sb = new StringBuilder(strValueOf.length() + 47);
                                sb.append("Timeout waiting for ServiceConnection callback ");
                                sb.append(strValueOf);
                                Log.e("GmsClientSupervisor", sb.toString(), new Exception());
                                ComponentName componentName = eggVar.f;
                                if (componentName == null) {
                                    gfgVar.getClass();
                                    componentName = null;
                                }
                                if (componentName == null) {
                                    gfgVar.getClass();
                                    componentName = new ComponentName("com.google.android.gms", "unknown");
                                }
                                eggVar.onServiceDisconnected(componentName);
                            }
                        } finally {
                        }
                        break;
                    }
                } else {
                    rig rigVar2 = (rig) this.b;
                    synchronized (rigVar2.a) {
                        try {
                            gfg gfgVar2 = (gfg) message.obj;
                            egg eggVar2 = (egg) rigVar2.a.get(gfgVar2);
                            if (eggVar2 != null && eggVar2.a.isEmpty()) {
                                if (eggVar2.c) {
                                    gfg gfgVar3 = eggVar2.e;
                                    rig rigVar3 = eggVar2.g;
                                    rigVar3.c.removeMessages(1, gfgVar3);
                                    rigVar3.d.b(rigVar3.b, eggVar2);
                                    eggVar2.c = false;
                                    eggVar2.b = 2;
                                }
                                rigVar2.a.remove(gfgVar2);
                            }
                        } finally {
                        }
                        break;
                    }
                }
                return true;
        }
    }
}
