package com.google.android.gms.measurement.internal;

import a5.n1;
import ab.z;
import ah.b;
import ah.d;
import ai.b3;
import ai.c2;
import ai.d2;
import ai.f0;
import ai.f3;
import ai.i2;
import ai.j2;
import ai.k1;
import ai.k2;
import ai.l1;
import ai.m0;
import ai.m1;
import ai.m2;
import ai.n2;
import ai.o0;
import ai.p2;
import ai.p4;
import ai.q4;
import ai.r0;
import ai.t2;
import ai.u;
import ai.x;
import ai.x2;
import ai.z2;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import android.text.TextUtils;
import b.kc;
import c10.a;
import com.google.android.gms.common.util.DynamiteApi;
import com.google.android.gms.internal.measurement.c7;
import com.google.android.gms.internal.measurement.f7;
import com.google.android.gms.internal.measurement.h7;
import com.google.android.gms.internal.measurement.k7;
import com.google.android.gms.internal.measurement.m7;
import com.google.android.gms.internal.measurement.zzdb;
import com.google.android.gms.internal.measurement.zzdd;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.tiktok.util.TTConst;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import mg.l;
import sg.w;
import z.e;

@DynamiteApi
/* loaded from: classes3.dex */
public class AppMeasurementDynamiteService extends c7 {

    /* renamed from: a, reason: collision with root package name */
    public m1 f33752a;

    /* renamed from: b, reason: collision with root package name */
    public final e f33753b;

    public AppMeasurementDynamiteService() {
        super("com.google.android.gms.measurement.api.internal.IAppMeasurementDynamiteService");
        this.f33752a = null;
        this.f33753b = new e(0);
    }

    public final void U() {
        if (this.f33752a == null) {
            throw new IllegalStateException("Attempting to perform action before initialize.");
        }
    }

    public final void V(String str, f7 f7Var) {
        U();
        p4 p4Var = this.f33752a.f13141i;
        m1.j(p4Var);
        p4Var.q0(str, f7Var);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void beginAdUnitExposure(String str, long j11) throws RemoteException {
        U();
        u uVar = this.f33752a.n;
        m1.i(uVar);
        uVar.E(j11, str);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void clearConditionalUserProperty(String str, String str2, Bundle bundle) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.R(str, str2, bundle);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void clearMeasurementEnabled(long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.E();
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new z(6, t2Var, (Object) null));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void endAdUnitExposure(String str, long j11) throws RemoteException {
        U();
        u uVar = this.f33752a.n;
        m1.i(uVar);
        uVar.F(j11, str);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void generateEventId(f7 f7Var) throws RemoteException {
        U();
        p4 p4Var = this.f33752a.f13141i;
        m1.j(p4Var);
        long jB0 = p4Var.B0();
        U();
        p4 p4Var2 = this.f33752a.f13141i;
        m1.j(p4Var2);
        p4Var2.r0(f7Var, jB0);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getAppInstanceId(f7 f7Var) throws RemoteException {
        U();
        k1 k1Var = this.f33752a.f13139g;
        m1.l(k1Var);
        k1Var.M(new l1(this, f7Var, 0));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getCachedAppInstanceId(f7 f7Var) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        V((String) t2Var.f13341g.get(), f7Var);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getConditionalUserProperties(String str, String str2, f7 f7Var) throws RemoteException {
        U();
        k1 k1Var = this.f33752a.f13139g;
        m1.l(k1Var);
        k1Var.M(new n1(this, f7Var, str, str2, 5, false));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getCurrentScreenClass(f7 f7Var) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        f3 f3Var = ((m1) t2Var.f13368a).f13144l;
        m1.k(f3Var);
        b3 b3Var = f3Var.f12947c;
        V(b3Var != null ? b3Var.f12868b : null, f7Var);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getCurrentScreenName(f7 f7Var) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        f3 f3Var = ((m1) t2Var.f13368a).f13144l;
        m1.k(f3Var);
        b3 b3Var = f3Var.f12947c;
        V(b3Var != null ? b3Var.f12867a : null, f7Var);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getGmpAppId(f7 f7Var) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        V(t2Var.S(), f7Var);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getMaxUserProperties(String str, f7 f7Var) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        w.e(str);
        ((m1) t2Var.f13368a).getClass();
        U();
        p4 p4Var = this.f33752a.f13141i;
        m1.j(p4Var);
        p4Var.s0(f7Var, 25);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getSessionId(f7 f7Var) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new z(t2Var, f7Var));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getTestFlag(f7 f7Var, int i5) throws RemoteException {
        U();
        if (i5 == 0) {
            p4 p4Var = this.f33752a.f13141i;
            m1.j(p4Var);
            t2 t2Var = this.f33752a.f13145m;
            m1.k(t2Var);
            AtomicReference atomicReference = new AtomicReference();
            k1 k1Var = ((m1) t2Var.f13368a).f13139g;
            m1.l(k1Var);
            p4Var.q0((String) k1Var.N(atomicReference, 15000L, "String test flag value", new m2(t2Var, atomicReference, 1)), f7Var);
            return;
        }
        if (i5 == 1) {
            p4 p4Var2 = this.f33752a.f13141i;
            m1.j(p4Var2);
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            AtomicReference atomicReference2 = new AtomicReference();
            k1 k1Var2 = ((m1) t2Var2.f13368a).f13139g;
            m1.l(k1Var2);
            p4Var2.r0(f7Var, ((Long) k1Var2.N(atomicReference2, 15000L, "long test flag value", new m2(t2Var2, atomicReference2, 2))).longValue());
            return;
        }
        if (i5 == 2) {
            p4 p4Var3 = this.f33752a.f13141i;
            m1.j(p4Var3);
            t2 t2Var3 = this.f33752a.f13145m;
            m1.k(t2Var3);
            AtomicReference atomicReference3 = new AtomicReference();
            k1 k1Var3 = ((m1) t2Var3.f13368a).f13139g;
            m1.l(k1Var3);
            double dDoubleValue = ((Double) k1Var3.N(atomicReference3, 15000L, "double test flag value", new m2(t2Var3, atomicReference3, 4))).doubleValue();
            Bundle bundle = new Bundle();
            bundle.putDouble("r", dDoubleValue);
            try {
                f7Var.G(bundle);
                return;
            } catch (RemoteException e3) {
                o0 o0Var = ((m1) p4Var3.f13368a).f13138f;
                m1.l(o0Var);
                o0Var.f13193i.b(e3, "Error returning double value to wrapper");
                return;
            }
        }
        if (i5 == 3) {
            p4 p4Var4 = this.f33752a.f13141i;
            m1.j(p4Var4);
            t2 t2Var4 = this.f33752a.f13145m;
            m1.k(t2Var4);
            AtomicReference atomicReference4 = new AtomicReference();
            k1 k1Var4 = ((m1) t2Var4.f13368a).f13139g;
            m1.l(k1Var4);
            p4Var4.s0(f7Var, ((Integer) k1Var4.N(atomicReference4, 15000L, "int test flag value", new m2(t2Var4, atomicReference4, 3))).intValue());
            return;
        }
        if (i5 != 4) {
            return;
        }
        p4 p4Var5 = this.f33752a.f13141i;
        m1.j(p4Var5);
        t2 t2Var5 = this.f33752a.f13145m;
        m1.k(t2Var5);
        AtomicReference atomicReference5 = new AtomicReference();
        k1 k1Var5 = ((m1) t2Var5.f13368a).f13139g;
        m1.l(k1Var5);
        p4Var5.u0(f7Var, ((Boolean) k1Var5.N(atomicReference5, 15000L, "boolean test flag value", new m2(t2Var5, atomicReference5, 0))).booleanValue());
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void getUserProperties(String str, String str2, boolean z11, f7 f7Var) throws RemoteException {
        U();
        k1 k1Var = this.f33752a.f13139g;
        m1.l(k1Var);
        k1Var.M(new j2(this, f7Var, str, str2, z11));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void initForTests(Map map) throws RemoteException {
        U();
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void initialize(b bVar, zzdb zzdbVar, long j11) throws RemoteException {
        m1 m1Var = this.f33752a;
        if (m1Var == null) {
            Context context = (Context) d.V(bVar);
            w.h(context);
            this.f33752a = m1.r(context, zzdbVar, Long.valueOf(j11), null);
        } else {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13193i.a("Attempting to initialize multiple times");
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void initializeWithElapsedTime(b bVar, zzdb zzdbVar, long j11, long j12) {
        m1 m1Var = this.f33752a;
        if (m1Var == null) {
            Context context = (Context) d.V(bVar);
            w.h(context);
            this.f33752a = m1.r(context, zzdbVar, Long.valueOf(j11), Long.valueOf(j12));
        } else {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13193i.a("Attempting to initialize multiple times");
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void isDataCollectionEnabled(f7 f7Var) throws RemoteException {
        U();
        k1 k1Var = this.f33752a.f13139g;
        m1.l(k1Var);
        k1Var.M(new l1(this, f7Var, 1));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void logEvent(String str, String str2, Bundle bundle, boolean z11, boolean z12, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.I(str, str2, bundle, z11, z12, j11, 0L);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void logEventAndBundle(String str, String str2, Bundle bundle, f7 f7Var, long j11) throws RemoteException {
        U();
        w.e(str2);
        String str3 = true != this.f33752a.f13136d.O(null, x.f13417f1) ? "app" : TTConst.TRACK_TYPE_AUTO;
        (bundle != null ? new Bundle(bundle) : new Bundle()).putString("_o", str3);
        zzbh zzbhVar = new zzbh(str2, new zzbf(bundle), str3, j11, 0L);
        k1 k1Var = this.f33752a.f13139g;
        m1.l(k1Var);
        k1Var.M(new n1(this, f7Var, zzbhVar, str, 2, false));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void logEventWithElapsedTime(String str, String str2, Bundle bundle, boolean z11, boolean z12, long j11, long j12) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.I(str, str2, bundle, z11, z12, j11, j12);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void logHealthData(int i5, String str, b bVar, b bVar2, b bVar3) throws RemoteException {
        U();
        Object objV = bVar == null ? null : d.V(bVar);
        Object objV2 = bVar2 == null ? null : d.V(bVar2);
        Object objV3 = bVar3 != null ? d.V(bVar3) : null;
        o0 o0Var = this.f33752a.f13138f;
        m1.l(o0Var);
        o0Var.M(i5, true, false, str, objV, objV2, objV3);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityCreated(b bVar, Bundle bundle, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivityCreatedByScionActivityInfo(zzdd.b(activity), bundle, j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityCreatedByScionActivityInfo(zzdd zzddVar, Bundle bundle, long j11) {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        p2 p2Var = t2Var.f13337c;
        if (p2Var != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
            p2Var.i(zzddVar, bundle);
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityDestroyed(b bVar, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivityDestroyedByScionActivityInfo(zzdd.b(activity), j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityDestroyedByScionActivityInfo(zzdd zzddVar, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        p2 p2Var = t2Var.f13337c;
        if (p2Var != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
            p2Var.j(zzddVar);
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityPaused(b bVar, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivityPausedByScionActivityInfo(zzdd.b(activity), j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityPausedByScionActivityInfo(zzdd zzddVar, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        p2 p2Var = t2Var.f13337c;
        if (p2Var != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
            p2Var.k(zzddVar);
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityResumed(b bVar, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivityResumedByScionActivityInfo(zzdd.b(activity), j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityResumedByScionActivityInfo(zzdd zzddVar, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        p2 p2Var = t2Var.f13337c;
        if (p2Var != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
            p2Var.l(zzddVar);
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivitySaveInstanceState(b bVar, f7 f7Var, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivitySaveInstanceStateByScionActivityInfo(zzdd.b(activity), f7Var, j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivitySaveInstanceStateByScionActivityInfo(zzdd zzddVar, f7 f7Var, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        p2 p2Var = t2Var.f13337c;
        Bundle bundle = new Bundle();
        if (p2Var != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
            p2Var.m(zzddVar, bundle);
        }
        try {
            f7Var.G(bundle);
        } catch (RemoteException e3) {
            o0 o0Var = this.f33752a.f13138f;
            m1.l(o0Var);
            o0Var.f13193i.b(e3, "Error returning bundle value to wrapper");
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityStarted(b bVar, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivityStartedByScionActivityInfo(zzdd.b(activity), j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityStartedByScionActivityInfo(zzdd zzddVar, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        if (t2Var.f13337c != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityStopped(b bVar, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        onActivityStoppedByScionActivityInfo(zzdd.b(activity), j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void onActivityStoppedByScionActivityInfo(zzdd zzddVar, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        if (t2Var.f13337c != null) {
            t2 t2Var2 = this.f33752a.f13145m;
            m1.k(t2Var2);
            t2Var2.W();
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void performAction(Bundle bundle, f7 f7Var, long j11) throws RemoteException {
        U();
        f7Var.G(null);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void registerOnMeasurementEventListener(k7 k7Var) throws RemoteException {
        Object q4Var;
        U();
        e eVar = this.f33753b;
        synchronized (eVar) {
            try {
                q4Var = (d2) eVar.get(Integer.valueOf(k7Var.zzf()));
                if (q4Var == null) {
                    q4Var = new q4(this, k7Var);
                    eVar.put(Integer.valueOf(k7Var.zzf()), q4Var);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.E();
        if (t2Var.f13339e.add(q4Var)) {
            return;
        }
        o0 o0Var = ((m1) t2Var.f13368a).f13138f;
        m1.l(o0Var);
        o0Var.f13193i.a("OnEventListener already registered");
    }

    @Override // com.google.android.gms.internal.measurement.d7
    @Deprecated
    public void resetAnalyticsData(long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.f13341g.set(null);
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new k2(t2Var, j11, 1));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void resetAnalyticsDataWithElapsedTime(long j11, long j12) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.f13341g.set(null);
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new k2(t2Var, j11, 1));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void retrieveAndUploadBatches(h7 h7Var) throws MalformedURLException {
        z2 z2Var;
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.E();
        m1 m1Var = (m1) t2Var.f13368a;
        k1 k1Var = m1Var.f13139g;
        m1.l(k1Var);
        if (k1Var.J()) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13190f.a("Cannot retrieve and upload batches from analytics worker thread");
            return;
        }
        k1 k1Var2 = m1Var.f13139g;
        m1.l(k1Var2);
        if (Thread.currentThread() == k1Var2.f13070d) {
            o0 o0Var2 = m1Var.f13138f;
            m1.l(o0Var2);
            o0Var2.f13190f.a("Cannot retrieve and upload batches from analytics network thread");
            return;
        }
        if (kc.b()) {
            o0 o0Var3 = m1Var.f13138f;
            m1.l(o0Var3);
            o0Var3.f13190f.a("Cannot retrieve and upload batches from main thread");
            return;
        }
        o0 o0Var4 = m1Var.f13138f;
        m1.l(o0Var4);
        o0Var4.n.a("[sgtm] Started client-side batch upload work.");
        boolean z11 = false;
        int size = 0;
        int i5 = 0;
        while (!z11) {
            o0 o0Var5 = m1Var.f13138f;
            m1.l(o0Var5);
            o0Var5.n.a("[sgtm] Getting upload batches from service (FE)");
            AtomicReference atomicReference = new AtomicReference();
            k1 k1Var3 = m1Var.f13139g;
            m1.l(k1Var3);
            k1Var3.N(atomicReference, h.f42227c, "[sgtm] Getting upload batches", new m2(t2Var, atomicReference, 6, false));
            zzoq zzoqVar = (zzoq) atomicReference.get();
            if (zzoqVar == null) {
                break;
            }
            List list = zzoqVar.f33784f;
            if (list.isEmpty()) {
                break;
            }
            o0 o0Var6 = m1Var.f13138f;
            m1.l(o0Var6);
            o0Var6.n.b(Integer.valueOf(list.size()), "[sgtm] Retrieved upload batches. count");
            size += list.size();
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    z11 = false;
                    break;
                }
                zzom zzomVar = (zzom) it.next();
                try {
                    URL url = new URI(zzomVar.f33778h).toURL();
                    AtomicReference atomicReference2 = new AtomicReference();
                    f0 f0VarQ = ((m1) t2Var.f13368a).q();
                    f0VarQ.E();
                    w.h(f0VarQ.f12933g);
                    String str = f0VarQ.f12933g;
                    m1 m1Var2 = (m1) t2Var.f13368a;
                    o0 o0Var7 = m1Var2.f13138f;
                    m1.l(o0Var7);
                    m0 m0Var = o0Var7.n;
                    Long lValueOf = Long.valueOf(zzomVar.f33776f);
                    m0Var.d("[sgtm] Uploading data from app. row_id, url, uncompressed size", lValueOf, zzomVar.f33778h, Integer.valueOf(zzomVar.f33777g.length));
                    if (!TextUtils.isEmpty(zzomVar.f33782l)) {
                        o0 o0Var8 = m1Var2.f13138f;
                        m1.l(o0Var8);
                        o0Var8.n.c(lValueOf, "[sgtm] Uploading data from app. row_id", zzomVar.f33782l);
                    }
                    HashMap map = new HashMap();
                    Bundle bundle = zzomVar.f33779i;
                    for (String str2 : bundle.keySet()) {
                        String string = bundle.getString(str2);
                        if (!TextUtils.isEmpty(string)) {
                            map.put(str2, string);
                        }
                    }
                    x2 x2Var = m1Var2.o;
                    m1.l(x2Var);
                    byte[] bArr = zzomVar.f33777g;
                    l lVar = new l(7, t2Var, atomicReference2, zzomVar);
                    x2Var.F();
                    w.h(url);
                    w.h(bArr);
                    k1 k1Var4 = ((m1) x2Var.f13368a).f13139g;
                    m1.l(k1Var4);
                    k1Var4.P(new r0(x2Var, str, url, bArr, map, lVar));
                    try {
                        p4 p4Var = m1Var2.f13141i;
                        m1.j(p4Var);
                        m1 m1Var3 = (m1) p4Var.f13368a;
                        m1Var3.f13143k.getClass();
                        long jCurrentTimeMillis = System.currentTimeMillis() + 60000;
                        synchronized (atomicReference2) {
                            for (long jCurrentTimeMillis2 = 60000; atomicReference2.get() == null && jCurrentTimeMillis2 > 0; jCurrentTimeMillis2 = jCurrentTimeMillis - System.currentTimeMillis()) {
                                try {
                                    atomicReference2.wait(jCurrentTimeMillis2);
                                    m1Var3.f13143k.getClass();
                                } catch (Throwable th2) {
                                    throw th2;
                                }
                            }
                        }
                    } catch (InterruptedException unused) {
                        o0 o0Var9 = ((m1) t2Var.f13368a).f13138f;
                        m1.l(o0Var9);
                        o0Var9.f13193i.a("[sgtm] Interrupted waiting for uploading batch");
                    }
                    z2Var = atomicReference2.get() == null ? z2.UNKNOWN : (z2) atomicReference2.get();
                } catch (MalformedURLException | URISyntaxException e3) {
                    o0 o0Var10 = ((m1) t2Var.f13368a).f13138f;
                    m1.l(o0Var10);
                    o0Var10.f13190f.d("[sgtm] Bad upload url for row_id", zzomVar.f33778h, Long.valueOf(zzomVar.f33776f), e3);
                    z2Var = z2.FAILURE;
                }
                if (z2Var != z2.SUCCESS) {
                    if (z2Var == z2.BACKOFF) {
                        z11 = true;
                        break;
                    }
                } else {
                    i5++;
                }
            }
        }
        o0 o0Var11 = m1Var.f13138f;
        m1.l(o0Var11);
        o0Var11.n.c(Integer.valueOf(size), "[sgtm] Completed client-side batch upload work. total, success", Integer.valueOf(i5));
        try {
            h7Var.zze();
        } catch (RemoteException e11) {
            m1 m1Var4 = this.f33752a;
            w.h(m1Var4);
            o0 o0Var12 = m1Var4.f13138f;
            m1.l(o0Var12);
            o0Var12.f13193i.b(e11, "Failed to call IDynamiteUploadBatchesCallback");
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setConditionalUserProperty(Bundle bundle, long j11) throws RemoteException {
        U();
        if (bundle == null) {
            o0 o0Var = this.f33752a.f13138f;
            m1.l(o0Var);
            o0Var.f13190f.a("Conditional user property must not be null");
        } else {
            t2 t2Var = this.f33752a.f13145m;
            m1.k(t2Var);
            t2Var.Q(bundle, j11);
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setConsent(Bundle bundle, long j11) throws RemoteException {
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setConsentThirdParty(Bundle bundle, long j11) throws Throwable {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.X(bundle, -20, j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setCurrentScreen(b bVar, String str, String str2, long j11) throws RemoteException {
        U();
        Activity activity = (Activity) d.V(bVar);
        w.h(activity);
        setCurrentScreenByScionActivityInfo(zzdd.b(activity), str, str2, j11);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0087, code lost:
    
        if (r3 > 500) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00af, code lost:
    
        if (r3 > 500) goto L34;
     */
    @Override // com.google.android.gms.internal.measurement.d7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void setCurrentScreenByScionActivityInfo(zzdd zzddVar, String str, String str2, long j11) throws RemoteException {
        U();
        f3 f3Var = this.f33752a.f13144l;
        m1.k(f3Var);
        m1 m1Var = (m1) f3Var.f13368a;
        if (!m1Var.f13136d.S()) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13195k.a("setCurrentScreen cannot be called while screen reporting is disabled.");
            return;
        }
        b3 b3Var = f3Var.f12947c;
        if (b3Var == null) {
            o0 o0Var2 = m1Var.f13138f;
            m1.l(o0Var2);
            o0Var2.f13195k.a("setCurrentScreen cannot be called while no activity active");
            return;
        }
        ConcurrentHashMap concurrentHashMap = f3Var.f12950f;
        Integer numValueOf = Integer.valueOf(zzddVar.f33308f);
        if (concurrentHashMap.get(numValueOf) == null) {
            o0 o0Var3 = m1Var.f13138f;
            m1.l(o0Var3);
            o0Var3.f13195k.a("setCurrentScreen must be called with an activity in the activity lifecycle");
            return;
        }
        if (str2 == null) {
            str2 = f3Var.I(zzddVar.f33309g);
        }
        String str3 = b3Var.f12868b;
        String str4 = b3Var.f12867a;
        boolean zEquals = Objects.equals(str3, str2);
        boolean zEquals2 = Objects.equals(str4, str);
        if (zEquals && zEquals2) {
            o0 o0Var4 = m1Var.f13138f;
            m1.l(o0Var4);
            o0Var4.f13195k.a("setCurrentScreen cannot be called with the same class and name");
            return;
        }
        if (str != null) {
            if (str.length() > 0) {
                int length = str.length();
                m1Var.f13136d.getClass();
            }
            o0 o0Var5 = m1Var.f13138f;
            m1.l(o0Var5);
            o0Var5.f13195k.b(Integer.valueOf(str.length()), "Invalid screen name length in setCurrentScreen. Length");
            return;
        }
        if (str2 != null) {
            if (str2.length() > 0) {
                int length2 = str2.length();
                m1Var.f13136d.getClass();
            }
            o0 o0Var6 = m1Var.f13138f;
            m1.l(o0Var6);
            o0Var6.f13195k.b(Integer.valueOf(str2.length()), "Invalid class name length in setCurrentScreen. Length");
            return;
        }
        o0 o0Var7 = m1Var.f13138f;
        m1.l(o0Var7);
        o0Var7.n.c(str == null ? AbstractJsonLexerKt.NULL : str, "Setting current screen to name, class", str2);
        p4 p4Var = m1Var.f13141i;
        m1.j(p4Var);
        b3 b3Var2 = new b3(str, str2, p4Var.B0());
        concurrentHashMap.put(numValueOf, b3Var2);
        f3Var.L(zzddVar.f33309g, b3Var2, true);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setDataCollectionEnabled(boolean z11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.E();
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new i2(t2Var, z11));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setDefaultEventParameters(Bundle bundle) {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        Bundle bundle2 = bundle == null ? new Bundle() : new Bundle(bundle);
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new n2(t2Var, bundle2, 2));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setEventInterceptor(k7 k7Var) throws RemoteException {
        U();
        a aVar = new a(this, k7Var, false, 5);
        k1 k1Var = this.f33752a.f13139g;
        m1.l(k1Var);
        if (!k1Var.J()) {
            k1 k1Var2 = this.f33752a.f13139g;
            m1.l(k1Var2);
            k1Var2.M(new z(8, this, aVar));
            return;
        }
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.D();
        t2Var.E();
        c2 c2Var = t2Var.f13338d;
        if (aVar != c2Var) {
            w.j("EventInterceptor already set.", c2Var == null);
        }
        t2Var.f13338d = aVar;
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setInstanceIdProvider(m7 m7Var) throws RemoteException {
        U();
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setMeasurementEnabled(boolean z11, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        Boolean boolValueOf = Boolean.valueOf(z11);
        t2Var.E();
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new z(6, t2Var, boolValueOf));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setMinimumSessionDuration(long j11) throws RemoteException {
        U();
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setSessionTimeoutDuration(long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        k1 k1Var = ((m1) t2Var.f13368a).f13139g;
        m1.l(k1Var);
        k1Var.M(new k2(t2Var, j11, 0));
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setSgtmDebugInfo(Intent intent) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        m1 m1Var = (m1) t2Var.f13368a;
        Uri data = intent.getData();
        if (data == null) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13196l.a("Activity intent has no data. Preview Mode was not enabled.");
            return;
        }
        String queryParameter = data.getQueryParameter("sgtm_debug_enable");
        if (queryParameter == null || !queryParameter.equals("1")) {
            o0 o0Var2 = m1Var.f13138f;
            m1.l(o0Var2);
            o0Var2.f13196l.a("[sgtm] Preview Mode was not enabled.");
            m1Var.f13136d.f12897c = null;
            return;
        }
        String queryParameter2 = data.getQueryParameter("sgtm_preview_key");
        if (TextUtils.isEmpty(queryParameter2)) {
            return;
        }
        o0 o0Var3 = m1Var.f13138f;
        m1.l(o0Var3);
        o0Var3.f13196l.b(queryParameter2, "[sgtm] Preview Mode was enabled. Using the sgtmPreviewKey: ");
        m1Var.f13136d.f12897c = queryParameter2;
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setUserId(String str, long j11) throws RemoteException {
        U();
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        m1 m1Var = (m1) t2Var.f13368a;
        if (str != null && TextUtils.isEmpty(str)) {
            o0 o0Var = m1Var.f13138f;
            m1.l(o0Var);
            o0Var.f13193i.a("User ID must be non-empty or null");
        } else {
            k1 k1Var = m1Var.f13139g;
            m1.l(k1Var);
            k1Var.M(new z(t2Var, str, false, 10));
            t2Var.N(null, "_id", str, true, j11);
        }
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void setUserProperty(String str, String str2, b bVar, boolean z11, long j11) throws SecurityException, RemoteException {
        U();
        Object objV = d.V(bVar);
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.N(str, str2, objV, z11, j11);
    }

    @Override // com.google.android.gms.internal.measurement.d7
    public void unregisterOnMeasurementEventListener(k7 k7Var) throws RemoteException {
        Object q4Var;
        U();
        e eVar = this.f33753b;
        synchronized (eVar) {
            q4Var = (d2) eVar.remove(Integer.valueOf(k7Var.zzf()));
        }
        if (q4Var == null) {
            q4Var = new q4(this, k7Var);
        }
        t2 t2Var = this.f33752a.f13145m;
        m1.k(t2Var);
        t2Var.E();
        if (t2Var.f13339e.remove(q4Var)) {
            return;
        }
        o0 o0Var = ((m1) t2Var.f13368a).f13138f;
        m1.l(o0Var);
        o0Var.f13193i.a("OnEventListener had not been registered");
    }
}
