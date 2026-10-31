package com.fyber.inneractive.sdk.util;

import android.app.KeyguardManager;
import android.content.Context;
import android.content.Intent;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final CopyOnWriteArrayList f31172a = new CopyOnWriteArrayList();

    /* renamed from: b, reason: collision with root package name */
    public boolean f31173b;

    /* renamed from: c, reason: collision with root package name */
    public Context f31174c;

    /* renamed from: d, reason: collision with root package name */
    public y f31175d;

    public static void a(b0 b0Var, Context context, Intent intent) {
        boolean zIsKeyguardLocked;
        synchronized (b0Var) {
            try {
                zIsKeyguardLocked = ((KeyguardManager) context.getSystemService("keyguard")).isKeyguardLocked();
            } catch (Exception unused) {
                IAlog.a("%sFailed to get lock screen status", IAlog.a(b0Var));
                zIsKeyguardLocked = false;
            }
            if ("android.intent.action.SCREEN_OFF".equals(intent.getAction())) {
                b0Var.f31173b = true;
            } else if (("android.intent.action.SCREEN_ON".equals(intent.getAction()) && !zIsKeyguardLocked) || "android.intent.action.USER_PRESENT".equals(intent.getAction())) {
                b0Var.f31173b = false;
            }
            IAlog.a("%sNew screen state is locked: %s. number of listeners: %d", IAlog.a(b0Var), Boolean.valueOf(b0Var.f31173b), Integer.valueOf(b0Var.f31172a.size()));
            Iterator it = b0Var.f31172a.iterator();
            while (it.hasNext()) {
                a0 a0Var = (a0) it.next();
                boolean z11 = b0Var.f31173b;
                com.fyber.inneractive.sdk.renderers.n nVar = (com.fyber.inneractive.sdk.renderers.n) a0Var;
                nVar.getClass();
                IAlog.a("%sgot onLockScreenStateChanged with: %s", IAlog.a(nVar), Boolean.valueOf(z11));
                if (z11) {
                    nVar.d(false);
                    com.fyber.inneractive.sdk.renderers.d dVar = nVar.f31007y;
                    if (dVar != null && dVar.f30978g) {
                        dVar.f30978g = false;
                        r.f31216b.removeCallbacks(dVar.f30981j);
                    }
                } else {
                    nVar.N();
                    com.fyber.inneractive.sdk.renderers.d dVar2 = nVar.f31007y;
                    if (dVar2 != null && !dVar2.f30979h && !dVar2.f30978g && dVar2.f30977f != 0) {
                        dVar2.f30977f = 0L;
                        dVar2.f30978g = true;
                        dVar2.a();
                    }
                }
            }
        }
    }

    public static void a() {
        b0 b0Var = z.f31254a;
        synchronized (b0Var) {
            if (b0Var.f31174c != null) {
                IAlog.a("%sremoving screen state receiver and destroying singleton", IAlog.a(b0Var));
                try {
                    b0Var.f31174c.unregisterReceiver(b0Var.f31175d);
                } catch (Exception unused) {
                }
                b0Var.f31174c = null;
                b0Var.f31175d = null;
                b0Var.f31172a.clear();
            }
        }
    }
}
