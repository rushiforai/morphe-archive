package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Looper;
import android.os.Messenger;
import android.util.Log;
import android.util.SparseArray;
import com.google.android.gms.cloudmessaging.zzt;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nhg implements ServiceConnection {
    public int a = 0;
    public final Messenger b;
    public d2f c;
    public final ArrayDeque d;
    public final SparseArray e;
    public final /* synthetic */ opg f;

    public nhg(opg opgVar) {
        this.f = opgVar;
        tjf tjfVar = new tjf(Looper.getMainLooper(), new yhc(1, this));
        Looper.getMainLooper();
        this.b = new Messenger(tjfVar);
        this.d = new ArrayDeque();
        this.e = new SparseArray();
    }

    public final synchronized void a(String str) {
        b(str, null);
    }

    public final synchronized void b(String str, SecurityException securityException) {
        try {
            if (Log.isLoggable("MessengerIpcClient", 3)) {
                Log.d("MessengerIpcClient", "Disconnected: ".concat(String.valueOf(str)));
            }
            int i = this.a;
            if (i == 0) {
                throw new IllegalStateException();
            }
            if (i != 1 && i != 2) {
                if (i != 3) {
                    return;
                }
                this.a = 4;
                return;
            }
            if (Log.isLoggable("MessengerIpcClient", 2)) {
                Log.v("MessengerIpcClient", "Unbinding service");
            }
            this.a = 4;
            l42.a().b((Context) this.f.b, this);
            zzt zztVar = new zzt(str, securityException);
            Iterator it2 = this.d.iterator();
            while (it2.hasNext()) {
                ((ojg) it2.next()).b(zztVar);
            }
            this.d.clear();
            int i2 = 0;
            while (true) {
                int size = this.e.size();
                SparseArray sparseArray = this.e;
                if (i2 >= size) {
                    sparseArray.clear();
                    return;
                } else {
                    ((ojg) sparseArray.valueAt(i2)).b(zztVar);
                    i2++;
                }
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void c() {
        try {
            if (this.a == 2 && this.d.isEmpty() && this.e.size() == 0) {
                if (Log.isLoggable("MessengerIpcClient", 2)) {
                    Log.v("MessengerIpcClient", "Finished handling requests, unbinding");
                }
                this.a = 3;
                l42.a().b((Context) this.f.b, this);
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized boolean d(ojg ojgVar) throws Throwable {
        nhg nhgVar;
        Throwable th;
        int i;
        try {
            try {
                i = this.a;
                try {
                } catch (Throwable th2) {
                    th = th2;
                    nhgVar = this;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (Throwable th4) {
            th = th4;
            nhgVar = this;
        }
        if (i != 0) {
            if (i == 1) {
                this.d.add(ojgVar);
                return true;
            }
            int i2 = 0;
            if (i != 2) {
                return false;
            }
            this.d.add(ojgVar);
            ((ScheduledExecutorService) this.f.c).execute(new dag(this, i2));
            return true;
        }
        this.d.add(ojgVar);
        try {
            if (this.a == 0) {
                if (Log.isLoggable("MessengerIpcClient", 2)) {
                    Log.v("MessengerIpcClient", "Starting bind to GmsCore");
                }
                this.a = 1;
                Intent intent = new Intent("com.google.android.c2dm.intent.REGISTER");
                intent.setPackage("com.google.android.gms");
                try {
                    l42 l42VarA = l42.a();
                    try {
                        Context context = (Context) this.f.b;
                        try {
                            nhgVar = this;
                            try {
                                try {
                                    if (l42VarA.c(context, context.getClass().getName(), intent, nhgVar, 1, null)) {
                                        ((ScheduledExecutorService) nhgVar.f.c).schedule(new dag(nhgVar, 1), 30L, TimeUnit.SECONDS);
                                    } else {
                                        nhgVar.a("Unable to bind to service");
                                    }
                                } catch (Throwable th5) {
                                    th = th5;
                                }
                            } catch (SecurityException e) {
                                e = e;
                                nhgVar.b("Unable to bind to service", e);
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            nhgVar = this;
                        }
                    } catch (Throwable th7) {
                        th = th7;
                        nhgVar = this;
                    }
                } catch (SecurityException e2) {
                    e = e2;
                    nhgVar = this;
                }
                return true;
            }
            nhgVar = this;
            try {
                throw new IllegalStateException();
            } catch (Throwable th8) {
                th = th8;
            }
        } catch (Throwable th9) {
            th = th9;
        }
        th = th;
        throw th;
        th = th;
        throw th;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (Log.isLoggable("MessengerIpcClient", 2)) {
            Log.v("MessengerIpcClient", "Service connected");
        }
        ((ScheduledExecutorService) this.f.c).execute(new p0g(this, 24, iBinder));
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        int i = 2;
        if (Log.isLoggable("MessengerIpcClient", 2)) {
            Log.v("MessengerIpcClient", "Service disconnected");
        }
        ((ScheduledExecutorService) this.f.c).execute(new dag(this, i));
    }
}
