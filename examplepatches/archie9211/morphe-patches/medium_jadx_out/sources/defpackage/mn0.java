package defpackage;

import android.accounts.Account;
import android.content.AttributionSource;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.Scope;
import java.util.ArrayList;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class mn0 {
    public static final da4[] x = new da4[0];
    public volatile String a;
    public hlb b;
    public final Context c;
    public final rig d;
    public final wvf e;
    public final Object f;
    public final Object g;
    public alf h;
    public ln0 i;
    public IInterface j;
    public final ArrayList k;
    public w1g l;
    public int m;
    public final eoc n;
    public final qlb o;
    public final int p;
    public final String q;
    public volatile String r;
    public volatile md5 s;
    public h42 t;
    public boolean u;
    public volatile fag v;
    public final AtomicInteger w;

    public mn0(Context context, Looper looper, rig rigVar, int i, eoc eocVar, qlb qlbVar, String str) {
        Object obj = ae5.d;
        this.a = null;
        this.f = new Object();
        this.g = new Object();
        this.k = new ArrayList();
        this.m = 1;
        this.t = null;
        this.u = false;
        this.v = null;
        this.w = new AtomicInteger(0);
        vp7.q("Context must not be null", context);
        this.c = context;
        vp7.q("Looper must not be null", looper);
        this.d = rigVar;
        this.e = new wvf(this, looper);
        this.p = i;
        this.n = eocVar;
        this.o = qlbVar;
        this.q = str;
    }

    public abstract IInterface a(IBinder iBinder);

    public final void b() {
        this.w.incrementAndGet();
        ArrayList arrayList = this.k;
        synchronized (arrayList) {
            try {
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    ((ykf) arrayList.get(i)).d();
                }
                arrayList.clear();
            } catch (Throwable th) {
                throw th;
            }
        }
        synchronized (this.g) {
            this.h = null;
        }
        r(1, null);
    }

    public final void c(String str) {
        this.a = str;
        b();
    }

    public da4[] d() {
        return x;
    }

    public Bundle e() {
        return new Bundle();
    }

    public abstract int f();

    public final void g(ut5 ut5Var, Set set) {
        AttributionSource attributionSource;
        Bundle bundleE = e();
        String attributionTag = (Build.VERSION.SDK_INT < 31 || this.s == null || (attributionSource = (AttributionSource) this.s.b) == null || attributionSource.getAttributionTag() == null) ? this.r : attributionSource.getAttributionTag();
        String str = attributionTag;
        int i = this.p;
        int i2 = be5.a;
        Scope[] scopeArr = zb5.o;
        Bundle bundle = new Bundle();
        da4[] da4VarArr = zb5.p;
        zb5 zb5Var = new zb5(6, i, i2, null, null, scopeArr, bundle, null, da4VarArr, da4VarArr, true, 0, false, str);
        zb5Var.d = this.c.getPackageName();
        zb5Var.g = bundleE;
        if (set != null) {
            zb5Var.f = (Scope[]) set.toArray(new Scope[0]);
        }
        if (n()) {
            zb5Var.h = new Account("<<default account>>", "com.google");
            if (ut5Var != null) {
                zb5Var.e = ((dmg) ut5Var).e;
            }
        }
        zb5Var.i = x;
        zb5Var.j = d();
        if (o()) {
            zb5Var.m = true;
        }
        try {
            synchronized (this.g) {
                try {
                    alf alfVar = this.h;
                    if (alfVar != null) {
                        alfVar.a(new g0g(this, this.w.get()), zb5Var);
                    } else {
                        Log.w("GmsClient", "mServiceBroker is null, client disconnected");
                    }
                } finally {
                }
            }
        } catch (DeadObjectException e) {
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e);
            int i3 = this.w.get();
            wvf wvfVar = this.e;
            wvfVar.sendMessage(wvfVar.obtainMessage(6, i3, 3));
        } catch (RemoteException e2) {
            e = e2;
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e);
            int i4 = this.w.get();
            n3g n3gVar = new n3g(this, 8, null, null);
            wvf wvfVar2 = this.e;
            wvfVar2.sendMessage(wvfVar2.obtainMessage(1, i4, -1, n3gVar));
        } catch (SecurityException e3) {
            throw e3;
        } catch (RuntimeException e4) {
            e = e4;
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e);
            int i42 = this.w.get();
            n3g n3gVar2 = new n3g(this, 8, null, null);
            wvf wvfVar22 = this.e;
            wvfVar22.sendMessage(wvfVar22.obtainMessage(1, i42, -1, n3gVar2));
        }
    }

    public final IInterface h() {
        IInterface iInterface;
        synchronized (this.f) {
            try {
                if (this.m == 5) {
                    throw new DeadObjectException();
                }
                if (!l()) {
                    throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
                }
                iInterface = this.j;
                vp7.q("Client is connected but service is null", iInterface);
            } catch (Throwable th) {
                throw th;
            }
        }
        return iInterface;
    }

    public abstract String i();

    public abstract String j();

    public boolean k() {
        return f() >= 211700000;
    }

    public final boolean l() {
        boolean z;
        synchronized (this.f) {
            z = this.m == 4;
        }
        return z;
    }

    public final boolean m() {
        boolean z;
        synchronized (this.f) {
            int i = this.m;
            z = true;
            if (i != 2 && i != 3) {
                z = false;
            }
        }
        return z;
    }

    public boolean n() {
        return false;
    }

    public boolean o() {
        return this instanceof rib;
    }

    public final /* synthetic */ boolean p(int i, int i2, IInterface iInterface) {
        synchronized (this.f) {
            try {
                if (this.m != i) {
                    return false;
                }
                r(i2, iInterface);
                return true;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final /* synthetic */ void q() {
        int i;
        int i2;
        synchronized (this.f) {
            i = this.m;
        }
        if (i == 3) {
            this.u = true;
            i2 = 5;
        } else {
            i2 = 4;
        }
        wvf wvfVar = this.e;
        wvfVar.sendMessage(wvfVar.obtainMessage(i2, this.w.get(), 16));
    }

    public final void r(int i, IInterface iInterface) {
        hlb hlbVar;
        vp7.l((i == 4) == (iInterface != null));
        synchronized (this.f) {
            try {
                this.m = i;
                this.j = iInterface;
                Bundle bundle = null;
                if (i == 1) {
                    w1g w1gVar = this.l;
                    if (w1gVar != null) {
                        rig rigVar = this.d;
                        String str = this.b.b;
                        vp7.p(str);
                        this.b.getClass();
                        if (this.q == null) {
                            this.c.getClass();
                        }
                        rigVar.c(str, w1gVar, this.b.c);
                        this.l = null;
                    }
                } else if (i == 2 || i == 3) {
                    w1g w1gVar2 = this.l;
                    if (w1gVar2 != null && (hlbVar = this.b) != null) {
                        String str2 = hlbVar.b;
                        StringBuilder sb = new StringBuilder(String.valueOf(str2).length() + 70 + "com.google.android.gms".length());
                        sb.append("Calling connect() while still connected, missing disconnect() for ");
                        sb.append(str2);
                        sb.append(" on com.google.android.gms");
                        Log.e("GmsClient", sb.toString());
                        rig rigVar2 = this.d;
                        String str3 = this.b.b;
                        vp7.p(str3);
                        this.b.getClass();
                        if (this.q == null) {
                            this.c.getClass();
                        }
                        rigVar2.c(str3, w1gVar2, this.b.c);
                        this.w.incrementAndGet();
                    }
                    w1g w1gVar3 = new w1g(this, this.w.get());
                    this.l = w1gVar3;
                    String strJ = j();
                    boolean zK = k();
                    this.b = new hlb(2, strJ, zK);
                    if (zK && f() < 17895000) {
                        throw new IllegalStateException("Internal Error, the minimum apk version of this BaseGmsClient is too low to support dynamic lookup. Start service action: ".concat(String.valueOf(this.b.b)));
                    }
                    rig rigVar3 = this.d;
                    String str4 = this.b.b;
                    vp7.p(str4);
                    this.b.getClass();
                    String name = this.q;
                    if (name == null) {
                        name = this.c.getClass().getName();
                    }
                    h42 h42VarB = rigVar3.b(new gfg(str4, this.b.c), w1gVar3, name);
                    if (!(h42VarB.b == 0)) {
                        String str5 = this.b.b;
                        StringBuilder sb2 = new StringBuilder(String.valueOf(str5).length() + 34 + "com.google.android.gms".length());
                        sb2.append("unable to connect to service: ");
                        sb2.append(str5);
                        sb2.append(" on com.google.android.gms");
                        Log.w("GmsClient", sb2.toString());
                        int i2 = h42VarB.b;
                        if (i2 == -1) {
                            i2 = 16;
                        }
                        if (h42VarB.c != null) {
                            bundle = new Bundle();
                            bundle.putParcelable("pendingIntent", h42VarB.c);
                        }
                        int i3 = this.w.get();
                        q4g q4gVar = new q4g(this, i2, bundle);
                        wvf wvfVar = this.e;
                        wvfVar.sendMessage(wvfVar.obtainMessage(7, i3, -1, q4gVar));
                    }
                } else if (i == 4) {
                    vp7.p(iInterface);
                    System.currentTimeMillis();
                }
            } finally {
            }
        }
    }
}
