package rg;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Looper;
import androidx.fragment.app.h1;
import androidx.fragment.app.m0;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.internal.zza;
import com.google.android.gms.common.api.internal.zzd;
import com.google.android.gms.internal.measurement.z6;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class n implements DialogInterface.OnCancelListener {

    /* renamed from: a, reason: collision with root package name */
    public final Object f85895a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f85896b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicReference f85897c;

    /* renamed from: d, reason: collision with root package name */
    public final z6 f85898d;

    /* renamed from: e, reason: collision with root package name */
    public final pg.b f85899e;

    /* renamed from: f, reason: collision with root package name */
    public final z.f f85900f;

    /* renamed from: g, reason: collision with root package name */
    public final e f85901g;

    public n(h hVar, e eVar) {
        pg.b bVar = pg.b.f82559e;
        this.f85895a = hVar;
        this.f85897c = new AtomicReference(null);
        this.f85898d = new z6(Looper.getMainLooper(), 1);
        this.f85899e = bVar;
        this.f85900f = new z.f(0);
        this.f85901g = eVar;
        hVar.c(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0027 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void d(Activity activity, e eVar, a aVar) {
        h hVar;
        sg.w.i(activity, "Activity must not be null");
        if (activity instanceof m0) {
            m0 m0Var = (m0) activity;
            WeakHashMap weakHashMap = zzd.f31827b;
            h1 supportFragmentManager = m0Var.getSupportFragmentManager();
            WeakHashMap weakHashMap2 = zzd.f31827b;
            WeakReference weakReference = (WeakReference) weakHashMap2.get(m0Var);
            if (weakReference != null) {
                h hVar2 = (zzd) weakReference.get();
                hVar = hVar2;
                if (hVar2 == null) {
                    try {
                        zzd zzdVar = (zzd) supportFragmentManager.E("SLifecycleFragmentImpl");
                        if (zzdVar != null) {
                            boolean zIsRemoving = zzdVar.isRemoving();
                            zzd zzdVar2 = zzdVar;
                            if (zIsRemoving) {
                                zzd zzdVar3 = new zzd();
                                androidx.fragment.app.a aVar2 = new androidx.fragment.app.a(supportFragmentManager);
                                aVar2.e(0, zzdVar3, "SLifecycleFragmentImpl", 1);
                                aVar2.l(true, true);
                                zzdVar2 = zzdVar3;
                            }
                            weakHashMap2.put(m0Var, new WeakReference(zzdVar2));
                            hVar = zzdVar2;
                        }
                    } catch (ClassCastException e3) {
                        throw new IllegalStateException("Fragment with tag SLifecycleFragmentImpl is not a SupportLifecycleFragmentImpl", e3);
                    }
                }
            }
        } else {
            WeakHashMap weakHashMap3 = zza.f31825b;
            WeakReference weakReference2 = (WeakReference) weakHashMap3.get(activity);
            if (weakReference2 != null) {
                h hVar3 = (zza) weakReference2.get();
                hVar = hVar3;
                if (hVar3 == null) {
                    try {
                        zza zzaVar = (zza) activity.getFragmentManager().findFragmentByTag("LifecycleFragmentImpl");
                        if (zzaVar == null || zzaVar.isRemoving()) {
                            zzaVar = new zza();
                            activity.getFragmentManager().beginTransaction().add(zzaVar, "LifecycleFragmentImpl").commitAllowingStateLoss();
                        }
                        h hVar4 = zzaVar;
                        weakHashMap3.put(activity, new WeakReference(hVar4));
                        hVar = hVar4;
                    } catch (ClassCastException e11) {
                        throw new IllegalStateException("Fragment with tag LifecycleFragmentImpl is not a LifecycleFragmentImpl", e11);
                    }
                }
            }
        }
        n nVarA = hVar.a();
        if (nVarA == null) {
            Object obj = pg.b.f82558d;
            nVarA = new n(hVar, eVar);
        }
        nVarA.f85900f.add(aVar);
        eVar.e(nVarA);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, rg.h] */
    public final Activity a() {
        Activity activityF = this.f85895a.f();
        sg.w.h(activityF);
        return activityF;
    }

    public final void b(Bundle bundle) {
        if (bundle != null) {
            this.f85897c.set(bundle.getBoolean("resolving_error", false) ? new d0(new ConnectionResult(bundle.getInt("failed_status"), (PendingIntent) bundle.getParcelable("failed_resolution"), null), bundle.getInt("failed_client_id", -1)) : null);
        }
    }

    public final void c() {
        this.f85896b = false;
        e eVar = this.f85901g;
        eVar.getClass();
        synchronized (e.f85872r) {
            try {
                if (eVar.f85884k == this) {
                    eVar.f85884k = null;
                    eVar.f85885l.clear();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final z.f e() {
        return this.f85900f;
    }

    public final void f() {
        if (this.f85900f.isEmpty()) {
            return;
        }
        this.f85901g.e(this);
    }

    public final void g(ConnectionResult connectionResult, int i5) {
        AtomicReference atomicReference;
        d0 d0Var = new d0(connectionResult, i5);
        do {
            atomicReference = this.f85897c;
            if (atomicReference.compareAndSet(null, d0Var)) {
                this.f85898d.post(new mk.w((Object) this, (Object) d0Var, false, 18));
                return;
            }
        } while (atomicReference.get() == null);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public final void onCancel(DialogInterface dialogInterface) {
        ConnectionResult connectionResult = new ConnectionResult(13, null, null);
        AtomicReference atomicReference = this.f85897c;
        d0 d0Var = (d0) atomicReference.get();
        int i5 = d0Var == null ? -1 : d0Var.f85868a;
        atomicReference.set(null);
        this.f85901g.h(connectionResult, i5);
    }
}
