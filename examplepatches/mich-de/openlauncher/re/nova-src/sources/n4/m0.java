package n4;

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
import android.util.Log;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/* loaded from: classes2.dex */
public final class m0 implements Handler.Callback, ServiceConnection {

    /* renamed from: a, reason: collision with root package name */
    public final Context f77831a;

    /* renamed from: b, reason: collision with root package name */
    public final Handler f77832b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f77833c = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    public Set f77834d = new HashSet();

    public m0(Context context) {
        this.f77831a = context;
        HandlerThread handlerThread = new HandlerThread("NotificationManagerCompat");
        handlerThread.start();
        this.f77832b = new Handler(handlerThread.getLooper(), this);
    }

    public final void d(l0 l0Var) {
        boolean z11;
        ArrayDeque arrayDeque = l0Var.f77829d;
        ComponentName componentName = l0Var.f77826a;
        if (Log.isLoggable("NotifManCompat", 3)) {
            Objects.toString(componentName);
            arrayDeque.size();
        }
        if (arrayDeque.isEmpty()) {
            return;
        }
        if (l0Var.f77827b) {
            z11 = true;
        } else {
            Intent component = new Intent("android.support.BIND_NOTIFICATION_SIDE_CHANNEL").setComponent(componentName);
            Context context = this.f77831a;
            boolean zBindService = context.bindService(component, this, 33);
            l0Var.f77827b = zBindService;
            if (zBindService) {
                l0Var.f77830e = 0;
            } else {
                Log.w("NotifManCompat", "Unable to bind to listener " + componentName);
                context.unbindService(this);
            }
            z11 = l0Var.f77827b;
        }
        if (!z11 || l0Var.f77828c == null) {
            e(l0Var);
            return;
        }
        while (true) {
            j0 j0Var = (j0) arrayDeque.peek();
            if (j0Var == null) {
                break;
            }
            try {
                if (Log.isLoggable("NotifManCompat", 3)) {
                    j0Var.toString();
                }
                j0Var.a(l0Var.f77828c);
                arrayDeque.remove();
            } catch (DeadObjectException unused) {
                if (Log.isLoggable("NotifManCompat", 3)) {
                    Objects.toString(componentName);
                }
            } catch (RemoteException e3) {
                Log.w("NotifManCompat", "RemoteException communicating with " + componentName, e3);
            }
        }
        if (arrayDeque.isEmpty()) {
            return;
        }
        e(l0Var);
    }

    public final void e(l0 l0Var) {
        ComponentName componentName = l0Var.f77826a;
        ArrayDeque arrayDeque = l0Var.f77829d;
        Handler handler = this.f77832b;
        if (handler.hasMessages(3, componentName)) {
            return;
        }
        int i5 = l0Var.f77830e + 1;
        l0Var.f77830e = i5;
        if (i5 <= 6) {
            handler.sendMessageDelayed(handler.obtainMessage(3, componentName), (1 << r4) * 1000);
            return;
        }
        Log.w("NotifManCompat", "Giving up on delivering " + arrayDeque.size() + " tasks to " + componentName + " after " + l0Var.f77830e + " retries");
        arrayDeque.clear();
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        d.c cVar = null;
        Context context = this.f77831a;
        HashMap map = this.f77833c;
        if (i5 == 0) {
            j0 j0Var = (j0) message.obj;
            Set setD = n0.d(context);
            if (!setD.equals(this.f77834d)) {
                this.f77834d = setD;
                List<ResolveInfo> listQueryIntentServices = context.getPackageManager().queryIntentServices(new Intent().setAction("android.support.BIND_NOTIFICATION_SIDE_CHANNEL"), 0);
                HashSet hashSet = new HashSet();
                for (ResolveInfo resolveInfo : listQueryIntentServices) {
                    if (((HashSet) setD).contains(resolveInfo.serviceInfo.packageName)) {
                        ServiceInfo serviceInfo = resolveInfo.serviceInfo;
                        ComponentName componentName = new ComponentName(serviceInfo.packageName, serviceInfo.name);
                        if (resolveInfo.serviceInfo.permission != null) {
                            Log.w("NotifManCompat", "Permission present on component " + componentName + ", not adding listener record.");
                        } else {
                            hashSet.add(componentName);
                        }
                    }
                }
                Iterator it = hashSet.iterator();
                while (it.hasNext()) {
                    ComponentName componentName2 = (ComponentName) it.next();
                    if (!map.containsKey(componentName2)) {
                        if (Log.isLoggable("NotifManCompat", 3)) {
                            Objects.toString(componentName2);
                        }
                        map.put(componentName2, new l0(componentName2));
                    }
                }
                Iterator it2 = map.entrySet().iterator();
                while (it2.hasNext()) {
                    Map.Entry entry = (Map.Entry) it2.next();
                    if (!hashSet.contains(entry.getKey())) {
                        if (Log.isLoggable("NotifManCompat", 3)) {
                            Objects.toString(entry.getKey());
                        }
                        l0 l0Var = (l0) entry.getValue();
                        if (l0Var.f77827b) {
                            context.unbindService(this);
                            l0Var.f77827b = false;
                        }
                        l0Var.f77828c = null;
                        it2.remove();
                    }
                }
            }
            for (l0 l0Var2 : map.values()) {
                l0Var2.f77829d.add(j0Var);
                d(l0Var2);
            }
        } else if (i5 == 1) {
            k0 k0Var = (k0) message.obj;
            ComponentName componentName3 = k0Var.f77816a;
            IBinder iBinder = k0Var.f77817b;
            l0 l0Var3 = (l0) map.get(componentName3);
            if (l0Var3 != null) {
                int i11 = d.b.f48673a;
                if (iBinder != null) {
                    IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface(d.c.Yo);
                    if (iInterfaceQueryLocalInterface == null || !(iInterfaceQueryLocalInterface instanceof d.c)) {
                        d.a aVar = new d.a();
                        aVar.f48672a = iBinder;
                        cVar = aVar;
                    } else {
                        cVar = (d.c) iInterfaceQueryLocalInterface;
                    }
                }
                l0Var3.f77828c = cVar;
                l0Var3.f77830e = 0;
                d(l0Var3);
                return true;
            }
        } else if (i5 == 2) {
            l0 l0Var4 = (l0) map.get((ComponentName) message.obj);
            if (l0Var4 != null) {
                if (l0Var4.f77827b) {
                    context.unbindService(this);
                    l0Var4.f77827b = false;
                }
                l0Var4.f77828c = null;
                return true;
            }
        } else {
            if (i5 != 3) {
                return false;
            }
            l0 l0Var5 = (l0) map.get((ComponentName) message.obj);
            if (l0Var5 != null) {
                d(l0Var5);
                return true;
            }
        }
        return true;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        if (Log.isLoggable("NotifManCompat", 3)) {
            Objects.toString(componentName);
        }
        this.f77832b.obtainMessage(1, new k0(componentName, iBinder)).sendToTarget();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        if (Log.isLoggable("NotifManCompat", 3)) {
            Objects.toString(componentName);
        }
        this.f77832b.obtainMessage(2, componentName).sendToTarget();
    }
}
