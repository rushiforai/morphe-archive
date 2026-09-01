package defpackage;

import android.app.Notification;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import androidx.work.impl.foreground.SystemForegroundService;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o6d implements yq8, t44 {
    public static final String j = d87.k("SystemFgDispatcher");
    public final m7f a;
    public final xfd b;
    public final Object c = new Object();
    public h7f d;
    public final LinkedHashMap e;
    public final HashMap f;
    public final HashMap g;
    public final ru h;
    public SystemForegroundService i;

    public o6d(Context context) {
        m7f m7fVarF = m7f.f(context);
        this.a = m7fVarF;
        this.b = m7fVarF.d;
        this.d = null;
        this.e = new LinkedHashMap();
        this.g = new HashMap();
        this.f = new HashMap();
        this.h = new ru(m7fVarF.j);
        m7fVarF.f.a(this);
    }

    public static Intent c(Context context, h7f h7fVar, k05 k05Var) {
        Intent intent = new Intent(context, (Class<?>) SystemForegroundService.class);
        intent.setAction("ACTION_START_FOREGROUND");
        intent.putExtra("KEY_WORKSPEC_ID", h7fVar.a);
        intent.putExtra("KEY_GENERATION", h7fVar.b);
        intent.putExtra("KEY_NOTIFICATION_ID", k05Var.a);
        intent.putExtra("KEY_FOREGROUND_SERVICE_TYPE", k05Var.b);
        intent.putExtra("KEY_NOTIFICATION", k05Var.c);
        return intent;
    }

    @Override // defpackage.yq8
    public final void a(c8f c8fVar, m72 m72Var) {
        if (m72Var instanceof l72) {
            String str = c8fVar.a;
            d87.h().d(j, "Constraints unmet for WorkSpec " + str);
            h7f h7fVarW = il7.w(c8fVar);
            int i = ((l72) m72Var).a;
            m7f m7fVar = this.a;
            ((q7f) m7fVar.d).a(new yrc(m7fVar.f, new unc(h7fVarW), true, i));
        }
    }

    @Override // defpackage.t44
    public final void b(h7f h7fVar, boolean z) {
        Map.Entry entry;
        synchronized (this.c) {
            try {
                va6 va6Var = ((c8f) this.f.remove(h7fVar)) != null ? (va6) this.g.remove(h7fVar) : null;
                if (va6Var != null) {
                    va6Var.m(null);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        k05 k05Var = (k05) this.e.remove(h7fVar);
        if (h7fVar.equals(this.d)) {
            if (this.e.size() > 0) {
                Iterator it2 = this.e.entrySet().iterator();
                Object next = it2.next();
                while (true) {
                    entry = (Map.Entry) next;
                    if (!it2.hasNext()) {
                        break;
                    } else {
                        next = it2.next();
                    }
                }
                this.d = (h7f) entry.getKey();
                if (this.i != null) {
                    k05 k05Var2 = (k05) entry.getValue();
                    SystemForegroundService systemForegroundService = this.i;
                    int i = k05Var2.a;
                    int i2 = k05Var2.b;
                    Notification notification = k05Var2.c;
                    systemForegroundService.getClass();
                    int i3 = Build.VERSION.SDK_INT;
                    if (i3 >= 31) {
                        nm.I(systemForegroundService, i, notification, i2);
                    } else if (i3 >= 29) {
                        nm.G(systemForegroundService, i, notification, i2);
                    } else {
                        systemForegroundService.startForeground(i, notification);
                    }
                    this.i.d.cancel(k05Var2.a);
                }
            } else {
                this.d = null;
            }
        }
        SystemForegroundService systemForegroundService2 = this.i;
        if (k05Var == null || systemForegroundService2 == null) {
            return;
        }
        d87.h().d(j, "Removing Notification (id: " + k05Var.a + ", workSpecId: " + h7fVar + ", notificationType: " + k05Var.b);
        systemForegroundService2.d.cancel(k05Var.a);
    }

    public final void d(Intent intent) {
        if (this.i == null) {
            ygf.f("handleNotify was called on the destroyed dispatcher");
            return;
        }
        int i = 0;
        int intExtra = intent.getIntExtra("KEY_NOTIFICATION_ID", 0);
        int intExtra2 = intent.getIntExtra("KEY_FOREGROUND_SERVICE_TYPE", 0);
        String stringExtra = intent.getStringExtra("KEY_WORKSPEC_ID");
        h7f h7fVar = new h7f(stringExtra, intent.getIntExtra("KEY_GENERATION", 0));
        Notification notification = (Notification) intent.getParcelableExtra("KEY_NOTIFICATION");
        d87.h().d(j, "Notifying with (id:" + intExtra + ", workSpecId: " + stringExtra + ", notificationType :" + intExtra2 + ")");
        if (notification == null) {
            ay0.e("Notification passed in the intent was null.");
            return;
        }
        k05 k05Var = new k05(intExtra, notification, intExtra2);
        LinkedHashMap linkedHashMap = this.e;
        linkedHashMap.put(h7fVar, k05Var);
        k05 k05Var2 = (k05) linkedHashMap.get(this.d);
        if (k05Var2 == null) {
            this.d = h7fVar;
        } else {
            this.i.d.notify(intExtra, notification);
            if (Build.VERSION.SDK_INT >= 29) {
                Iterator it2 = linkedHashMap.entrySet().iterator();
                while (it2.hasNext()) {
                    i |= ((k05) ((Map.Entry) it2.next()).getValue()).b;
                }
                k05Var = new k05(k05Var2.a, k05Var2.c, i);
            } else {
                k05Var = k05Var2;
            }
        }
        SystemForegroundService systemForegroundService = this.i;
        int i2 = k05Var.a;
        int i3 = k05Var.b;
        Notification notification2 = k05Var.c;
        systemForegroundService.getClass();
        int i4 = Build.VERSION.SDK_INT;
        if (i4 >= 31) {
            nm.I(systemForegroundService, i2, notification2, i3);
        } else if (i4 >= 29) {
            nm.G(systemForegroundService, i2, notification2, i3);
        } else {
            systemForegroundService.startForeground(i2, notification2);
        }
    }

    public final void e() {
        this.i = null;
        synchronized (this.c) {
            try {
                Iterator it2 = this.g.values().iterator();
                while (it2.hasNext()) {
                    ((va6) it2.next()).m(null);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        this.a.f.g(this);
    }

    public final void f(int i, int i2) {
        d87.h().j(j, "Foreground service timed out, FGS type: " + i2);
        for (Map.Entry entry : this.e.entrySet()) {
            if (((k05) entry.getValue()).b == i2) {
                h7f h7fVar = (h7f) entry.getKey();
                m7f m7fVar = this.a;
                ((q7f) m7fVar.d).a(new yrc(m7fVar.f, new unc(h7fVar), true, -128));
            }
        }
        SystemForegroundService systemForegroundService = this.i;
        if (systemForegroundService != null) {
            systemForegroundService.b = true;
            d87.h().d(SystemForegroundService.e, "Shutting down.");
            if (Build.VERSION.SDK_INT >= 26) {
                systemForegroundService.stopForeground(true);
            }
            systemForegroundService.stopSelf(i);
        }
    }
}
