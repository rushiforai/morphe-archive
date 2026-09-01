package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Message;
import android.os.RemoteException;
import android.provider.Settings;
import android.util.Log;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class lj8 implements Handler.Callback, ServiceConnection {
    public final Context a;
    public final Handler b;
    public final HashMap c = new HashMap();
    public HashSet d = new HashSet();

    public lj8(Context context) {
        this.a = context;
        HandlerThread handlerThread = new HandlerThread("NotificationManagerCompat");
        handlerThread.start();
        this.b = new Handler(handlerThread.getLooper(), this);
    }

    public final void b(kj8 kj8Var) {
        ComponentName componentName = kj8Var.a;
        ArrayDeque arrayDeque = kj8Var.d;
        Handler handler = this.b;
        if (handler.hasMessages(3, componentName)) {
            return;
        }
        int i = kj8Var.e;
        int i2 = i + 1;
        kj8Var.e = i2;
        if (i2 <= 6) {
            int i3 = (1 << i) * PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
            if (Log.isLoggable("NotifManCompat", 3)) {
                Log.d("NotifManCompat", "Scheduling retry for " + i3 + " ms");
            }
            handler.sendMessageDelayed(handler.obtainMessage(3, componentName), i3);
            return;
        }
        Log.w("NotifManCompat", "Giving up on delivering " + arrayDeque.size() + " tasks to " + componentName + " after " + kj8Var.e + " retries");
        arrayDeque.clear();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (Log.isLoggable("NotifManCompat", 3)) {
            Log.d("NotifManCompat", "Connected to service " + componentName);
        }
        this.b.obtainMessage(1, new jj8(componentName, iBinder)).sendToTarget();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        if (Log.isLoggable("NotifManCompat", 3)) {
            Log.d("NotifManCompat", "Disconnected from service " + componentName);
        }
        this.b.obtainMessage(2, componentName).sendToTarget();
    }

    public final void a(kj8 kj8Var) {
        boolean z;
        ArrayDeque arrayDeque = kj8Var.d;
        ComponentName componentName = kj8Var.a;
        if (Log.isLoggable("NotifManCompat", 3)) {
            Log.d("NotifManCompat", "Processing component " + componentName + ", " + arrayDeque.size() + " queued tasks");
        }
        if (arrayDeque.isEmpty()) {
            return;
        }
        if (kj8Var.b) {
            z = true;
        } else {
            Intent component = new Intent("android.support.BIND_NOTIFICATION_SIDE_CHANNEL").setComponent(componentName);
            Context context = this.a;
            boolean zBindService = context.bindService(component, this, 33);
            kj8Var.b = zBindService;
            if (zBindService) {
                kj8Var.e = 0;
            } else {
                Log.w("NotifManCompat", uvlZTF.azwiryg + componentName);
                context.unbindService(this);
            }
            z = kj8Var.b;
        }
        if (!z || kj8Var.c == null) {
            b(kj8Var);
            return;
        }
        while (true) {
            ij8 ij8Var = (ij8) arrayDeque.peek();
            if (ij8Var == null) {
                break;
            }
            try {
                if (Log.isLoggable("NotifManCompat", 3)) {
                    Log.d("NotifManCompat", "Sending task " + ij8Var);
                }
                ij8Var.a(kj8Var.c);
                arrayDeque.remove();
            } catch (DeadObjectException unused) {
                if (Log.isLoggable("NotifManCompat", 3)) {
                    Log.d("NotifManCompat", "Remote service has died: " + componentName);
                }
            } catch (RemoteException e) {
                Log.w("NotifManCompat", "RemoteException communicating with " + componentName, e);
            }
        }
        if (arrayDeque.isEmpty()) {
            return;
        }
        b(kj8Var);
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        HashSet hashSet;
        int i = message.what;
        ou5 ou5Var = null;
        if (i == 0) {
            ij8 ij8Var = (ij8) message.obj;
            String string = Settings.Secure.getString(this.a.getContentResolver(), "enabled_notification_listeners");
            synchronized (mj8.c) {
                if (string != null) {
                    try {
                        if (!string.equals(mj8.d)) {
                            String[] strArrSplit = string.split(":", -1);
                            HashSet hashSet2 = new HashSet(strArrSplit.length);
                            for (String str : strArrSplit) {
                                ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(str);
                                if (componentNameUnflattenFromString != null) {
                                    hashSet2.add(componentNameUnflattenFromString.getPackageName());
                                }
                            }
                            mj8.e = hashSet2;
                            mj8.d = string;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                hashSet = mj8.e;
            }
            if (!hashSet.equals(this.d)) {
                this.d = hashSet;
                List<ResolveInfo> listQueryIntentServices = this.a.getPackageManager().queryIntentServices(new Intent().setAction("android.support.BIND_NOTIFICATION_SIDE_CHANNEL"), 0);
                HashSet<ComponentName> hashSet3 = new HashSet();
                for (ResolveInfo resolveInfo : listQueryIntentServices) {
                    if (hashSet.contains(resolveInfo.serviceInfo.packageName)) {
                        ServiceInfo serviceInfo = resolveInfo.serviceInfo;
                        ComponentName componentName = new ComponentName(serviceInfo.packageName, serviceInfo.name);
                        if (resolveInfo.serviceInfo.permission != null) {
                            Log.w("NotifManCompat", eoLmc.AfPhamAysReqxKH + componentName + ", not adding listener record.");
                        } else {
                            hashSet3.add(componentName);
                        }
                    }
                }
                for (ComponentName componentName2 : hashSet3) {
                    if (!this.c.containsKey(componentName2)) {
                        if (Log.isLoggable("NotifManCompat", 3)) {
                            Log.d("NotifManCompat", "Adding listener record for " + componentName2);
                        }
                        this.c.put(componentName2, new kj8(componentName2));
                    }
                }
                Iterator it2 = this.c.entrySet().iterator();
                while (it2.hasNext()) {
                    Map.Entry entry = (Map.Entry) it2.next();
                    if (!hashSet3.contains(entry.getKey())) {
                        if (Log.isLoggable("NotifManCompat", 3)) {
                            Log.d("NotifManCompat", "Removing listener record for " + entry.getKey());
                        }
                        kj8 kj8Var = (kj8) entry.getValue();
                        if (kj8Var.b) {
                            this.a.unbindService(this);
                            kj8Var.b = false;
                        }
                        kj8Var.c = null;
                        it2.remove();
                    }
                }
            }
            for (kj8 kj8Var2 : this.c.values()) {
                kj8Var2.d.add(ij8Var);
                a(kj8Var2);
            }
        } else if (i == 1) {
            jj8 jj8Var = (jj8) message.obj;
            ComponentName componentName3 = jj8Var.a;
            IBinder iBinder = jj8Var.b;
            kj8 kj8Var3 = (kj8) this.c.get(componentName3);
            if (kj8Var3 != null) {
                int i2 = nu5.e;
                if (iBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(ou5.c);
                    if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof ou5)) {
                        mu5 mu5Var = new mu5();
                        mu5Var.e = iBinder;
                        ou5Var = mu5Var;
                    } else {
                        ou5Var = (ou5) iInterfaceQueryLocalInterface;
                    }
                }
                kj8Var3.c = ou5Var;
                kj8Var3.e = 0;
                a(kj8Var3);
                return true;
            }
        } else if (i == 2) {
            kj8 kj8Var4 = (kj8) this.c.get((ComponentName) message.obj);
            if (kj8Var4 != null) {
                if (kj8Var4.b) {
                    this.a.unbindService(this);
                    kj8Var4.b = false;
                }
                kj8Var4.c = null;
                return true;
            }
        } else {
            if (i != 3) {
                return false;
            }
            kj8 kj8Var5 = (kj8) this.c.get((ComponentName) message.obj);
            if (kj8Var5 != null) {
                a(kj8Var5);
                return true;
            }
        }
        return true;
    }
}
