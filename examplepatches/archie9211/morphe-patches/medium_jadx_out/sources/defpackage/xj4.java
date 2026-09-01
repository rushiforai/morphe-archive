package defpackage;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.Trace;
import android.text.TextUtils;
import android.util.Log;
import com.google.firebase.FirebaseCommonRegistrar;
import com.google.firebase.components.ComponentDiscoveryService;
import com.google.firebase.concurrent.ExecutorsRegistrar;
import com.google.firebase.provider.FirebaseInitProvider;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class xj4 {
    public static final Object k = new Object();
    public static final y70 l = new y70(0);
    public final Context a;
    public final String b;
    public final nk4 c;
    public final jz1 d;
    public final wq6 g;
    public final h8a h;
    public final AtomicBoolean e = new AtomicBoolean(false);
    public final AtomicBoolean f = new AtomicBoolean();
    public final CopyOnWriteArrayList i = new CopyOnWriteArrayList();
    public final CopyOnWriteArrayList j = new CopyOnWriteArrayList();

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.util.List] */
    public xj4(Context context, String str, nk4 nk4Var) {
        ?? arrayList;
        int i = 0;
        this.a = context;
        vp7.n(str);
        this.b = str;
        this.c = nk4Var;
        ek0 ek0Var = FirebaseInitProvider.a;
        Trace.beginSection("Firebase");
        Trace.beginSection("ComponentDiscovery");
        ArrayList arrayList2 = new ArrayList();
        Bundle bundle = null;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null) {
                Log.w("ComponentDiscovery", "Context has no PackageManager.");
            } else {
                ServiceInfo serviceInfo = packageManager.getServiceInfo(new ComponentName(context, (Class<?>) ComponentDiscoveryService.class), 128);
                if (serviceInfo == null) {
                    Log.w("ComponentDiscovery", ComponentDiscoveryService.class + " has no service info.");
                } else {
                    bundle = serviceInfo.metaData;
                }
            }
        } catch (PackageManager.NameNotFoundException unused) {
            Log.w("ComponentDiscovery", "Application info not found.");
        }
        if (bundle == null) {
            Log.w("ComponentDiscovery", "Could not retrieve metadata, returning empty list of registrars.");
            arrayList = Collections.EMPTY_LIST;
        } else {
            arrayList = new ArrayList();
            for (String str2 : bundle.keySet()) {
                if ("com.google.firebase.components.ComponentRegistrar".equals(bundle.get(str2)) && str2.startsWith("com.google.firebase.components:")) {
                    arrayList.add(str2.substring(31));
                }
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(new cz1(i, (String) it2.next()));
        }
        Trace.endSection();
        Trace.beginSection("Runtime");
        pzd pzdVar = pzd.INSTANCE;
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        arrayList3.addAll(arrayList2);
        int i2 = 1;
        arrayList3.add(new cz1(i2, new FirebaseCommonRegistrar()));
        arrayList3.add(new cz1(i2, new ExecutorsRegistrar()));
        arrayList4.add(iy1.c(context, Context.class, new Class[0]));
        arrayList4.add(iy1.c(this, xj4.class, new Class[0]));
        arrayList4.add(iy1.c(nk4Var, nk4.class, new Class[0]));
        xsa xsaVar = new xsa(13);
        if (hk7.A(context) && FirebaseInitProvider.b.get()) {
            arrayList4.add(iy1.c(ek0Var, ek0.class, new Class[0]));
        }
        jz1 jz1Var = new jz1(pzdVar, arrayList3, arrayList4, xsaVar);
        this.d = jz1Var;
        Trace.endSection();
        this.g = new wq6(new iz1(this, 2, context));
        this.h = jz1Var.e(fz2.class);
        uj4 uj4Var = new uj4(this);
        a();
        if (this.e.get()) {
            qm0.e.a.get();
        }
        this.i.add(uj4Var);
        Trace.endSection();
    }

    public static ArrayList c() {
        ArrayList arrayList = new ArrayList();
        synchronized (k) {
            try {
                for (xj4 xj4Var : (w70) l.values()) {
                    xj4Var.a();
                    arrayList.add(xj4Var.b);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public static xj4 d() {
        xj4 xj4Var;
        synchronized (k) {
            try {
                xj4Var = (xj4) l.get("[DEFAULT]");
                if (xj4Var == null) {
                    throw new IllegalStateException("Default FirebaseApp is not initialized in this process " + uy.m() + ". Make sure to call FirebaseApp.initializeApp(Context) first.");
                }
                ((fz2) xj4Var.h.get()).b();
            } catch (Throwable th) {
                throw th;
            }
        }
        return xj4Var;
    }

    public static xj4 e(String str) {
        xj4 xj4Var;
        String str2;
        synchronized (k) {
            try {
                xj4Var = (xj4) l.get(str.trim());
                if (xj4Var == null) {
                    ArrayList arrayListC = c();
                    if (arrayListC.isEmpty()) {
                        str2 = "";
                    } else {
                        str2 = "Available app names: " + TextUtils.join(", ", arrayListC);
                    }
                    throw new IllegalStateException("FirebaseApp with name " + str + " doesn't exist. " + str2);
                }
                ((fz2) xj4Var.h.get()).b();
            } finally {
            }
        }
        return xj4Var;
    }

    public static xj4 i(Context context, nk4 nk4Var) {
        xj4 xj4Var;
        AtomicReference atomicReference = vj4.a;
        if (context.getApplicationContext() instanceof Application) {
            Application application = (Application) context.getApplicationContext();
            AtomicReference atomicReference2 = vj4.a;
            if (atomicReference2.get() == null) {
                vj4 vj4Var = new vj4();
                while (true) {
                    if (atomicReference2.compareAndSet(null, vj4Var)) {
                        qm0.b(application);
                        qm0.e.a(vj4Var);
                        break;
                    }
                    if (atomicReference2.get() != null) {
                        break;
                    }
                }
            }
        }
        if (context.getApplicationContext() != null) {
            context = context.getApplicationContext();
        }
        synchronized (k) {
            y70 y70Var = l;
            vp7.r("FirebaseApp name [DEFAULT] already exists!", !y70Var.containsKey("[DEFAULT]"));
            vp7.q("Application context cannot be null.", context);
            xj4Var = new xj4(context, "[DEFAULT]", nk4Var);
            y70Var.put("[DEFAULT]", xj4Var);
        }
        xj4Var.g();
        return xj4Var;
    }

    public final void a() {
        vp7.r("FirebaseApp was deleted", !this.f.get());
    }

    public final Object b(Class cls) {
        a();
        return this.d.c(cls);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof xj4)) {
            return false;
        }
        xj4 xj4Var = (xj4) obj;
        xj4Var.a();
        return this.b.equals(xj4Var.b);
    }

    public final String f() {
        StringBuilder sb = new StringBuilder();
        a();
        sb.append(op8.U(this.b.getBytes(Charset.defaultCharset())));
        sb.append("+");
        a();
        sb.append(op8.U(this.c.b.getBytes(Charset.defaultCharset())));
        return sb.toString();
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    public final boolean j() {
        boolean z;
        a();
        gt2 gt2Var = (gt2) this.g.get();
        synchronized (gt2Var) {
            z = gt2Var.a;
        }
        return z;
    }

    public final String toString() {
        hx4 hx4Var = new hx4((Object) this);
        hx4Var.a("name", this.b);
        hx4Var.a("options", this.c);
        return hx4Var.toString();
    }

    public static xj4 h(Context context) {
        synchronized (k) {
            try {
                if (l.containsKey(AEVqIoD.qapHYCdP)) {
                    return d();
                }
                nk4 nk4VarA = nk4.a(context);
                if (nk4VarA == null) {
                    Log.w("FirebaseApp", "Default FirebaseApp failed to initialize because no default options were found. This usually means that com.google.gms:google-services was not applied to your gradle project.");
                    return null;
                }
                return i(context, nk4VarA);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void g() {
        HashMap map;
        if (!hk7.A(this.a)) {
            StringBuilder sb = new StringBuilder("Device in Direct Boot Mode: postponing initialization of Firebase APIs for app ");
            a();
            sb.append(this.b);
            Log.i("FirebaseApp", sb.toString());
            Context context = this.a;
            AtomicReference atomicReference = wj4.b;
            if (atomicReference.get() == null) {
                wj4 wj4Var = new wj4(context);
                while (!atomicReference.compareAndSet(null, wj4Var)) {
                    if (atomicReference.get() != null) {
                        return;
                    }
                }
                context.registerReceiver(wj4Var, new IntentFilter(JWcjNoweKCnTr.khMNPj));
                return;
            }
            return;
        }
        StringBuilder sb2 = new StringBuilder("Device unlocked: initializing all Firebase APIs for app ");
        a();
        sb2.append(this.b);
        Log.i("FirebaseApp", sb2.toString());
        jz1 jz1Var = this.d;
        a();
        boolean zEquals = "[DEFAULT]".equals(this.b);
        AtomicReference atomicReference2 = (AtomicReference) jz1Var.g;
        Boolean boolValueOf = Boolean.valueOf(zEquals);
        while (true) {
            if (atomicReference2.compareAndSet(null, boolValueOf)) {
                synchronized (jz1Var) {
                    map = new HashMap((HashMap) jz1Var.b);
                }
                jz1Var.t(map, zEquals);
                break;
            } else if (atomicReference2.get() != null) {
                break;
            }
        }
        ((fz2) this.h.get()).b();
    }
}
