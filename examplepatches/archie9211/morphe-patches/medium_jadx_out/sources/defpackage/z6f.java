package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.util.Log;
import java.util.ArrayDeque;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z6f implements ServiceConnection {
    public final Context a;
    public final Intent b;
    public final ScheduledThreadPoolExecutor c;
    public final ArrayDeque d;
    public x6f e;
    public boolean f;

    public z6f(Context context) {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1, new lv2("Firebase-FirebaseInstanceIdServiceConnection", 1));
        scheduledThreadPoolExecutor.setKeepAliveTime(40L, TimeUnit.SECONDS);
        scheduledThreadPoolExecutor.allowCoreThreadTimeOut(true);
        this.d = new ArrayDeque();
        this.f = false;
        Context applicationContext = context.getApplicationContext();
        this.a = applicationContext;
        this.b = new Intent("com.google.firebase.MESSAGING_EVENT").setPackage(applicationContext.getPackageName());
        this.c = scheduledThreadPoolExecutor;
    }

    public final synchronized void a() {
        try {
            if (Log.isLoggable("FirebaseMessaging", 3)) {
                Log.d("FirebaseMessaging", "flush queue called");
            }
            while (!this.d.isEmpty()) {
                if (Log.isLoggable("FirebaseMessaging", 3)) {
                    Log.d("FirebaseMessaging", "found intent to be delivered");
                }
                x6f x6fVar = this.e;
                if (x6fVar == null || !x6fVar.isBinderAlive()) {
                    c();
                    return;
                }
                if (Log.isLoggable("FirebaseMessaging", 3)) {
                    Log.d("FirebaseMessaging", "binder is alive, sending the intent.");
                }
                this.e.a((y6f) this.d.poll());
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized jrg b(Intent intent) {
        y6f y6fVar;
        try {
            if (Log.isLoggable("FirebaseMessaging", 3)) {
                Log.d("FirebaseMessaging", "new intent queued in the bind-strategy delivery");
            }
            y6fVar = new y6f(intent);
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = this.c;
            y6fVar.b.a.b(scheduledThreadPoolExecutor, new o19(15, scheduledThreadPoolExecutor.schedule(new b2a(11, y6fVar), 20L, TimeUnit.SECONDS)));
            this.d.add(y6fVar);
            a();
        } catch (Throwable th) {
            throw th;
        }
        return y6fVar.b.a;
    }

    public final void c() {
        z6f z6fVar;
        if (Log.isLoggable("FirebaseMessaging", 3)) {
            StringBuilder sb = new StringBuilder("binder is dead. start connection? ");
            sb.append(!this.f);
            Log.d("FirebaseMessaging", sb.toString());
        }
        if (this.f) {
            return;
        }
        this.f = true;
        try {
            l42 l42VarA = l42.a();
            Context context = this.a;
            z6fVar = this;
            try {
                if (l42VarA.c(context, context.getClass().getName(), this.b, z6fVar, 65, null)) {
                    return;
                } else {
                    Log.e("FirebaseMessaging", "binding to the service failed");
                }
            } catch (SecurityException e) {
                e = e;
                Log.e("FirebaseMessaging", "Exception while binding the service", e);
            }
        } catch (SecurityException e2) {
            e = e2;
            z6fVar = this;
        }
        z6fVar.f = false;
        while (true) {
            ArrayDeque arrayDeque = z6fVar.d;
            if (arrayDeque.isEmpty()) {
                return;
            } else {
                ((y6f) arrayDeque.poll()).b.d(null);
            }
        }
    }

    @Override // android.content.ServiceConnection
    public final synchronized void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        try {
            if (Log.isLoggable("FirebaseMessaging", 3)) {
                Log.d("FirebaseMessaging", "onServiceConnected: " + componentName);
            }
            this.f = false;
            if (iBinder instanceof x6f) {
                this.e = (x6f) iBinder;
                a();
                return;
            }
            Log.e("FirebaseMessaging", "Invalid service connection: " + iBinder);
            ArrayDeque arrayDeque = this.d;
            while (!arrayDeque.isEmpty()) {
                ((y6f) arrayDeque.poll()).b.d(null);
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        if (Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "onServiceDisconnected: " + componentName);
        }
        a();
    }
}
