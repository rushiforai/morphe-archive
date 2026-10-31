package sg;

import android.content.ComponentName;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

/* loaded from: classes.dex */
public final class f0 implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g0 f87430a;

    public /* synthetic */ f0(g0 g0Var) {
        this.f87430a = g0Var;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        if (i5 == 0) {
            g0 g0Var = this.f87430a;
            synchronized (g0Var.f87434a) {
                try {
                    d0 d0Var = (d0) message.obj;
                    e0 e0Var = (e0) g0Var.f87434a.get(d0Var);
                    if (e0Var != null && e0Var.f87422a.isEmpty()) {
                        if (e0Var.f87424c) {
                            d0 d0Var2 = e0Var.f87426e;
                            g0 g0Var2 = e0Var.f87428g;
                            g0Var2.f87436c.removeMessages(1, d0Var2);
                            g0Var2.f87437d.c(g0Var2.f87435b, e0Var);
                            e0Var.f87424c = false;
                            e0Var.f87423b = 2;
                        }
                        g0Var.f87434a.remove(d0Var);
                    }
                } finally {
                }
            }
            return true;
        }
        if (i5 != 1) {
            return false;
        }
        g0 g0Var3 = this.f87430a;
        synchronized (g0Var3.f87434a) {
            try {
                d0 d0Var3 = (d0) message.obj;
                e0 e0Var2 = (e0) g0Var3.f87434a.get(d0Var3);
                if (e0Var2 != null && e0Var2.f87423b == 3) {
                    String strValueOf = String.valueOf(d0Var3);
                    StringBuilder sb2 = new StringBuilder(strValueOf.length() + 47);
                    sb2.append("Timeout waiting for ServiceConnection callback ");
                    sb2.append(strValueOf);
                    Log.e("GmsClientSupervisor", sb2.toString(), new Exception());
                    ComponentName componentName = e0Var2.f87427f;
                    if (componentName == null) {
                        d0Var3.getClass();
                        componentName = null;
                    }
                    if (componentName == null) {
                        String str = d0Var3.f87420b;
                        w.h(str);
                        componentName = new ComponentName(str, "unknown");
                    }
                    e0Var2.onServiceDisconnected(componentName);
                }
            } finally {
            }
        }
        return true;
    }
}
