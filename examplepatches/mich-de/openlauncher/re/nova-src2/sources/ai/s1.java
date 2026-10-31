package ai;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.consent_sdk.zzg;
import com.google.android.gms.internal.measurement.f7;
import com.google.android.gms.measurement.internal.zzr;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.Queue;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final /* synthetic */ class s1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f13292a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f13293b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f13294c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f13295d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f13296e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f13297f;

    public /* synthetic */ s1(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i5) {
        this.f13292a = i5;
        this.f13295d = obj;
        this.f13294c = obj2;
        this.f13296e = obj3;
        this.f13297f = obj4;
        this.f13293b = obj5;
    }

    /* JADX WARN: Type inference failed for: r3v19, types: [java.lang.Object, java.util.Map] */
    @Override // java.lang.Runnable
    public final void run() {
        AtomicReference atomicReference;
        p3 p3Var;
        a0 a0Var;
        p4 p4Var;
        a0 a0Var2;
        String str;
        switch (this.f13292a) {
            case 0:
                t1 t1Var = (t1) this.f13295d;
                zzr zzrVar = (zzr) this.f13294c;
                Bundle bundle = (Bundle) this.f13296e;
                c0 c0Var = (c0) this.f13297f;
                String str2 = (String) this.f13293b;
                j4 j4Var = t1Var.f13334a;
                j4Var.V();
                try {
                    c0Var.n(j4Var.d0(bundle, zzrVar));
                    return;
                } catch (RemoteException e3) {
                    j4Var.b().f13190f.c(str2, "Failed to return trigger URIs for app", e3);
                    return;
                }
            case 1:
                AtomicReference atomicReference2 = (AtomicReference) this.f13295d;
                synchronized (atomicReference2) {
                    try {
                        try {
                            p3Var = (p3) this.f13297f;
                            a0Var = p3Var.f13230d;
                        } catch (RemoteException e11) {
                            o0 o0Var = ((m1) ((p3) this.f13297f).f13368a).f13138f;
                            m1.l(o0Var);
                            o0Var.f13190f.d("(legacy) Failed to get conditional properties; remote exception", null, (String) this.f13293b, e11);
                            ((AtomicReference) this.f13295d).set(Collections.EMPTY_LIST);
                            atomicReference = (AtomicReference) this.f13295d;
                        }
                        if (a0Var == null) {
                            o0 o0Var2 = ((m1) p3Var.f13368a).f13138f;
                            m1.l(o0Var2);
                            o0Var2.f13190f.d("(legacy) Failed to get conditional properties; not connected to service", null, (String) this.f13293b, (String) this.f13296e);
                            atomicReference2.set(Collections.EMPTY_LIST);
                            atomicReference2.notify();
                            return;
                        }
                        if (TextUtils.isEmpty(null)) {
                            atomicReference2.set(a0Var.R((String) this.f13293b, (String) this.f13296e, (zzr) this.f13294c));
                        } else {
                            atomicReference2.set(a0Var.d(null, (String) this.f13293b, (String) this.f13296e));
                        }
                        p3Var.Q();
                        atomicReference = (AtomicReference) this.f13295d;
                        atomicReference.notify();
                        return;
                    } catch (Throwable th2) {
                        ((AtomicReference) this.f13295d).notify();
                        throw th2;
                    }
                }
            case 2:
                f7 f7Var = (f7) this.f13296e;
                String str3 = (String) this.f13295d;
                String str4 = (String) this.f13293b;
                p3 p3Var2 = (p3) this.f13297f;
                ArrayList arrayList = new ArrayList();
                try {
                    try {
                        a0Var2 = p3Var2.f13230d;
                    } catch (RemoteException e12) {
                        o0 o0Var3 = ((m1) p3Var2.f13368a).f13138f;
                        m1.l(o0Var3);
                        o0Var3.f13190f.d("Failed to get conditional properties; remote exception", str4, str3, e12);
                    }
                    if (a0Var2 != null) {
                        arrayList = p4.x0(a0Var2.R(str4, str3, (zzr) this.f13294c));
                        p3Var2.Q();
                        p4Var = ((m1) p3Var2.f13368a).f13141i;
                        m1.j(p4Var);
                        p4Var.w0(f7Var, arrayList);
                        return;
                    }
                    m1 m1Var = (m1) p3Var2.f13368a;
                    o0 o0Var4 = m1Var.f13138f;
                    m1.l(o0Var4);
                    o0Var4.f13190f.c(str4, "Failed to get conditional properties; not connected to service", str3);
                    p4Var = m1Var.f13141i;
                    m1.j(p4Var);
                    p4Var.w0(f7Var, arrayList);
                    return;
                } catch (Throwable th3) {
                    p4 p4Var2 = ((m1) p3Var2.f13368a).f13141i;
                    m1.j(p4Var2);
                    p4Var2.w0(f7Var, arrayList);
                    throw th3;
                }
            case 3:
                com.google.android.gms.internal.consent_sdk.d dVar = (com.google.android.gms.internal.consent_sdk.d) this.f13295d;
                Handler handler = (Handler) dVar.f32027b;
                com.google.android.gms.internal.consent_sdk.d0 d0Var = (com.google.android.gms.internal.consent_sdk.d0) dVar.f32034i;
                Activity activity = (Activity) this.f13294c;
                o2.f fVar = (o2.f) this.f13296e;
                uk.b bVar = (uk.b) this.f13297f;
                final uk.a aVar = (uk.a) this.f13293b;
                try {
                    fVar.getClass();
                    Log.i("UserMessagingPlatform", "Use new ConsentDebugSettings.Builder().addTestDeviceHashedId(\"" + com.google.android.gms.internal.consent_sdk.e0.m0((Application) dVar.f32026a) + "\") to set this as a debug device.");
                    com.google.android.gms.internal.consent_sdk.b0 b0VarC = dVar.c(((x7.c) dVar.f32031f).m(activity, fVar));
                    x7.n nVar = (x7.n) dVar.f32032g;
                    com.google.android.gms.internal.consent_sdk.a aVarN = new ja.d(nVar, b0VarC, (com.google.android.gms.internal.consent_sdk.d0) nVar.f95152d).n();
                    com.google.android.gms.internal.consent_sdk.h hVar = (com.google.android.gms.internal.consent_sdk.h) dVar.f32029d;
                    hVar.f32082b.edit().putInt("consent_status", aVarN.f31984b).commit();
                    int i5 = aVarN.f31985c;
                    SharedPreferences.Editor editorEdit = hVar.f32082b.edit();
                    if (i5 == 1) {
                        str = "UNKNOWN";
                    } else if (i5 == 2) {
                        str = "NOT_REQUIRED";
                    } else {
                        if (i5 != 3) {
                            throw null;
                        }
                        str = "REQUIRED";
                    }
                    editorEdit.putString("privacy_options_requirement_status", str).commit();
                    ((com.google.android.gms.internal.consent_sdk.p) dVar.f32030e).f32208c.set((com.google.android.gms.internal.consent_sdk.q) aVarN.f31986d);
                    d0Var.a((Queue) d0Var.f32040f.get(), 8, 9, null);
                    ((com.google.android.gms.internal.consent_sdk.v0) dVar.f32033h).f32267a.execute(new ab.y(12, dVar, bVar, aVarN, false));
                    return;
                } catch (zzg e13) {
                    d0Var.a((Queue) d0Var.f32040f.get(), 8, 9, b.c0.m("RequestConsentUpdate exception. Error: ", e13.getMessage(), ", cause: ", String.valueOf(e13.getCause())));
                    final int i11 = 0;
                    handler.post(new Runnable() { // from class: com.google.android.gms.internal.consent_sdk.d6
                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (i11) {
                                case 0:
                                    aVar.e(e13.a());
                                    break;
                                default:
                                    aVar.e(e13.a());
                                    break;
                            }
                        }
                    });
                    return;
                } catch (RuntimeException e14) {
                    d0Var.a((Queue) d0Var.f32040f.get(), 8, 9, "RequestConsentUpdate RuntimeException. ".concat(String.valueOf(e14.getMessage())));
                    final int i12 = 1;
                    final zzg zzgVar = new zzg(1, "Caught exception when trying to request consent info update: ".concat(String.valueOf(Log.getStackTraceString(e14))));
                    handler.post(new Runnable() { // from class: com.google.android.gms.internal.consent_sdk.d6
                        @Override // java.lang.Runnable
                        public final void run() {
                            switch (i12) {
                                case 0:
                                    aVar.e(zzgVar.a());
                                    break;
                                default:
                                    aVar.e(zzgVar.a());
                                    break;
                            }
                        }
                    });
                    return;
                }
            case 4:
                ((mk.j) this.f13295d).f76446f.d();
                ((Activity) this.f13294c).startActivityForResult(ex.i.R((String) this.f13293b, (String) this.f13296e, this.f13297f), 0);
                return;
            default:
                try {
                    if (!(((z7.j) this.f13295d).f98296a instanceof z7.a)) {
                        String string = ((UUID) this.f13294c).toString();
                        x7.q qVarL = ((y7.s) this.f13293b).f96772c.l(string);
                        if (qVarL == null || fq.c.a(qVarL.f95172b)) {
                            throw new IllegalStateException("Calls to setForegroundAsync() must complete before a ListenableWorker signals completion of work by returning an instance of Result.");
                        }
                        ((p7.h) ((y7.s) this.f13293b).f96771b).h(string, (o7.i) this.f13296e);
                        ((Context) this.f13297f).startService(w7.b.b((Context) this.f13297f, w.b.j(qVarL), (o7.i) this.f13296e));
                    }
                    ((z7.j) this.f13295d).j(null);
                    return;
                } catch (Throwable th4) {
                    ((z7.j) this.f13295d).k(th4);
                    return;
                }
        }
    }

    public /* synthetic */ s1(mk.j jVar, Activity activity, String str, String str2, Map map) {
        this.f13292a = 4;
        this.f13295d = jVar;
        this.f13294c = activity;
        this.f13293b = str;
        this.f13296e = str2;
        this.f13297f = map;
    }

    public s1(p3 p3Var, String str, String str2, zzr zzrVar, f7 f7Var) {
        this.f13292a = 2;
        this.f13293b = str;
        this.f13295d = str2;
        this.f13294c = zzrVar;
        this.f13296e = f7Var;
        this.f13297f = p3Var;
    }

    public s1(p3 p3Var, AtomicReference atomicReference, String str, String str2, zzr zzrVar) {
        this.f13292a = 1;
        this.f13295d = atomicReference;
        this.f13293b = str;
        this.f13296e = str2;
        this.f13294c = zzrVar;
        this.f13297f = p3Var;
    }

    public s1(y7.s sVar, z7.j jVar, UUID uuid, o7.i iVar, Context context) {
        this.f13292a = 5;
        this.f13293b = sVar;
        this.f13295d = jVar;
        this.f13294c = uuid;
        this.f13296e = iVar;
        this.f13297f = context;
    }
}
