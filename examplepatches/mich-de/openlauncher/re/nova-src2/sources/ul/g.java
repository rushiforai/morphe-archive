package ul;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.Trace;
import android.util.Log;
import bm.m;
import cm.l;
import com.google.firebase.FirebaseCommonRegistrar;
import com.google.firebase.components.ComponentDiscoveryService;
import com.google.firebase.concurrent.ExecutorsRegistrar;
import com.google.firebase.provider.FirebaseInitProvider;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import sg.w;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: k, reason: collision with root package name */
    public static final Object f91318k = new Object();

    /* renamed from: l, reason: collision with root package name */
    public static final z.e f91319l = new z.e(0);

    /* renamed from: a, reason: collision with root package name */
    public final Context f91320a;

    /* renamed from: b, reason: collision with root package name */
    public final String f91321b;

    /* renamed from: c, reason: collision with root package name */
    public final i f91322c;

    /* renamed from: d, reason: collision with root package name */
    public final bm.h f91323d;

    /* renamed from: g, reason: collision with root package name */
    public final m f91326g;

    /* renamed from: h, reason: collision with root package name */
    public final nm.c f91327h;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f91324e = new AtomicBoolean(false);

    /* renamed from: f, reason: collision with root package name */
    public final AtomicBoolean f91325f = new AtomicBoolean();

    /* renamed from: i, reason: collision with root package name */
    public final CopyOnWriteArrayList f91328i = new CopyOnWriteArrayList();

    /* renamed from: j, reason: collision with root package name */
    public final CopyOnWriteArrayList f91329j = new CopyOnWriteArrayList();

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.util.List] */
    public g(Context context, String str, i iVar) throws PackageManager.NameNotFoundException {
        ?? arrayList;
        int i5 = 0;
        this.f91320a = context;
        w.e(str);
        this.f91321b = str;
        this.f91322c = iVar;
        a aVar = FirebaseInitProvider.f34766a;
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
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(new bm.d((String) it.next(), i5));
        }
        Trace.endSection();
        Trace.beginSection("Runtime");
        l lVar = l.f20128a;
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        arrayList3.addAll(arrayList2);
        int i11 = 1;
        arrayList3.add(new bm.d(new FirebaseCommonRegistrar(), i11));
        arrayList3.add(new bm.d(new ExecutorsRegistrar(), i11));
        arrayList4.add(bm.b.c(context, Context.class, new Class[0]));
        arrayList4.add(bm.b.c(this, g.class, new Class[0]));
        arrayList4.add(bm.b.c(iVar, i.class, new Class[0]));
        lm.e eVar = new lm.e(21);
        if (w20.h.l(context) && FirebaseInitProvider.f34767b.get()) {
            arrayList4.add(bm.b.c(aVar, a.class, new Class[0]));
        }
        bm.h hVar = new bm.h(arrayList3, arrayList4, eVar);
        this.f91323d = hVar;
        Trace.endSection();
        this.f91326g = new m(new bm.g(2, this, context));
        this.f91327h = hVar.f(lm.d.class);
        d dVar = new d(this);
        a();
        if (this.f91324e.get()) {
            rg.c.f85862e.f85863a.get();
        }
        this.f91328i.add(dVar);
        Trace.endSection();
    }

    public static g c() {
        g gVar;
        synchronized (f91318k) {
            try {
                gVar = (g) f91319l.get("[DEFAULT]");
                if (gVar == null) {
                    throw new IllegalStateException("Default FirebaseApp is not initialized in this process " + ps.c.o() + ". Make sure to call FirebaseApp.initializeApp(Context) first.");
                }
                ((lm.d) gVar.f91327h.get()).b();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return gVar;
    }

    public static g f(Context context) {
        synchronized (f91318k) {
            try {
                if (f91319l.containsKey("[DEFAULT]")) {
                    return c();
                }
                i iVarA = i.a(context);
                if (iVarA == null) {
                    Log.w("FirebaseApp", "Default FirebaseApp failed to initialize because no default options were found. This usually means that com.google.gms:google-services was not applied to your gradle project.");
                    return null;
                }
                return g(context, iVarA);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static g g(Context context, i iVar) {
        g gVar;
        AtomicReference atomicReference = e.f91315a;
        if (context.getApplicationContext() instanceof Application) {
            Application application = (Application) context.getApplicationContext();
            AtomicReference atomicReference2 = e.f91315a;
            if (atomicReference2.get() == null) {
                e eVar = new e();
                while (true) {
                    if (atomicReference2.compareAndSet(null, eVar)) {
                        rg.c.b(application);
                        rg.c.f85862e.a(eVar);
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
        synchronized (f91318k) {
            z.e eVar2 = f91319l;
            w.j("FirebaseApp name [DEFAULT] already exists!", !eVar2.containsKey("[DEFAULT]"));
            w.i(context, "Application context cannot be null.");
            gVar = new g(context, "[DEFAULT]", iVar);
            eVar2.put("[DEFAULT]", gVar);
        }
        gVar.e();
        return gVar;
    }

    public final void a() {
        w.j("FirebaseApp was deleted", !this.f91325f.get());
    }

    public final Object b(Class cls) {
        a();
        return this.f91323d.a(cls);
    }

    public final String d() {
        StringBuilder sb2 = new StringBuilder();
        a();
        sb2.append(xg.b.c(this.f91321b.getBytes(Charset.defaultCharset())));
        sb2.append("+");
        a();
        sb2.append(xg.b.c(this.f91322c.f91336b.getBytes(Charset.defaultCharset())));
        return sb2.toString();
    }

    public final void e() {
        HashMap map;
        if (!w20.h.l(this.f91320a)) {
            StringBuilder sb2 = new StringBuilder("Device in Direct Boot Mode: postponing initialization of Firebase APIs for app ");
            a();
            sb2.append(this.f91321b);
            Log.i("FirebaseApp", sb2.toString());
            f.a(this.f91320a);
            return;
        }
        StringBuilder sb3 = new StringBuilder("Device unlocked: initializing all Firebase APIs for app ");
        a();
        sb3.append(this.f91321b);
        Log.i("FirebaseApp", sb3.toString());
        bm.h hVar = this.f91323d;
        a();
        boolean zEquals = "[DEFAULT]".equals(this.f91321b);
        AtomicReference atomicReference = hVar.f18082f;
        Boolean boolValueOf = Boolean.valueOf(zEquals);
        while (true) {
            if (atomicReference.compareAndSet(null, boolValueOf)) {
                synchronized (hVar) {
                    map = new HashMap(hVar.f18077a);
                }
                hVar.b(map, zEquals);
                break;
            } else if (atomicReference.get() != null) {
                break;
            }
        }
        ((lm.d) this.f91327h.get()).b();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        gVar.a();
        return this.f91321b.equals(gVar.f91321b);
    }

    public final boolean h() {
        boolean z11;
        a();
        sm.a aVar = (sm.a) this.f91326g.get();
        synchronized (aVar) {
            z11 = aVar.f87542b;
        }
        return z11;
    }

    public final int hashCode() {
        return this.f91321b.hashCode();
    }

    public final String toString() {
        og.i iVar = new og.i(this);
        iVar.c(this.f91321b, PendingUpgradeStore.KEY_NAME);
        iVar.c(this.f91322c, "options");
        return iVar.toString();
    }
}
