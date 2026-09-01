package defpackage;

import android.content.Context;
import android.content.ServiceConnection;
import android.os.HandlerThread;
import android.os.Looper;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rig {
    public static final Object g = new Object();
    public static rig h;
    public static HandlerThread i;
    public final HashMap a = new HashMap();
    public final Context b;
    public volatile tjf c;
    public final l42 d;
    public final long e;
    public final long f;

    public rig(Context context, Looper looper) {
        yhc yhcVar = new yhc(2, this);
        this.b = context.getApplicationContext();
        tjf tjfVar = new tjf(looper, yhcVar);
        Looper.getMainLooper();
        this.c = tjfVar;
        this.d = l42.a();
        this.e = 5000L;
        this.f = 300000L;
    }

    public static HandlerThread a() {
        synchronized (g) {
            try {
                HandlerThread handlerThread = i;
                if (handlerThread != null) {
                    return handlerThread;
                }
                HandlerThread handlerThread2 = new HandlerThread("GoogleApiHandler", 9);
                i = handlerThread2;
                handlerThread2.start();
                return i;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final h42 b(gfg gfgVar, w1g w1gVar, String str) {
        h42 h42VarA;
        HashMap map = this.a;
        synchronized (map) {
            try {
                egg eggVar = (egg) map.get(gfgVar);
                if (eggVar == null) {
                    eggVar = new egg(this, gfgVar);
                    eggVar.a.put(w1gVar, w1gVar);
                    h42VarA = eggVar.a(str, null);
                    map.put(gfgVar, eggVar);
                } else {
                    this.c.removeMessages(0, gfgVar);
                    if (eggVar.a.containsKey(w1gVar)) {
                        String string = gfgVar.toString();
                        StringBuilder sb = new StringBuilder(string.length() + 81);
                        sb.append("Trying to bind a GmsServiceConnection that was already connected before.  config=");
                        sb.append(string);
                        throw new IllegalStateException(sb.toString());
                    }
                    eggVar.a.put(w1gVar, w1gVar);
                    int i2 = eggVar.b;
                    if (i2 == 1) {
                        w1gVar.onServiceConnected(eggVar.f, eggVar.d);
                    } else if (i2 == 2) {
                        h42VarA = eggVar.a(str, null);
                    }
                    h42VarA = null;
                }
                if (eggVar.c) {
                    return h42.f;
                }
                if (h42VarA == null) {
                    h42VarA = new h42(-1, null, null);
                }
                return h42VarA;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void c(String str, ServiceConnection serviceConnection, boolean z) {
        gfg gfgVar = new gfg(str, z);
        vp7.q("ServiceConnection must not be null", serviceConnection);
        HashMap map = this.a;
        synchronized (map) {
            try {
                egg eggVar = (egg) map.get(gfgVar);
                if (eggVar == null) {
                    String string = gfgVar.toString();
                    StringBuilder sb = new StringBuilder(string.length() + 50);
                    sb.append("Nonexistent connection status for service config: ");
                    sb.append(string);
                    throw new IllegalStateException(sb.toString());
                }
                if (!eggVar.a.containsKey(serviceConnection)) {
                    String string2 = gfgVar.toString();
                    StringBuilder sb2 = new StringBuilder(string2.length() + 76);
                    sb2.append("Trying to unbind a GmsServiceConnection  that was not bound before.  config=");
                    sb2.append(string2);
                    throw new IllegalStateException(sb2.toString());
                }
                eggVar.a.remove(serviceConnection);
                if (eggVar.a.isEmpty()) {
                    this.c.sendMessageDelayed(this.c.obtainMessage(0, gfgVar), this.e);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
