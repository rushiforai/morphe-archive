package ads_mobile_sdk;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import b.e4;
import b.fb;
import b.x0;
import b70.h;
import c80.d;
import com.google.gson.Gson;
import cw.l2;
import hn.o;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class pn implements x0 {

    /* renamed from: b, reason: collision with root package name */
    public final Context f8326b;

    /* renamed from: c, reason: collision with root package name */
    public final qq0 f8327c;

    /* renamed from: d, reason: collision with root package name */
    public final h70 f8328d;

    /* renamed from: e, reason: collision with root package name */
    public final e23 f8329e;

    /* renamed from: f, reason: collision with root package name */
    public final ti f8330f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f8331g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicBoolean f8332h;

    /* renamed from: i, reason: collision with root package name */
    public final d f8333i;

    /* renamed from: j, reason: collision with root package name */
    public com.google.gson.r f8334j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicReference f8335k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicReference f8336l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicReference f8337m;
    public final AtomicReference n;
    public final AtomicBoolean o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f8338p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f8339q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f8340r;

    public pn(Context applicationContext, qq0 flagDataStore, h70 csrbDataStore, e23 sdkCoreDataStore, ti appSettingsDataStore) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(flagDataStore, "flagDataStore");
        Intrinsics.g(csrbDataStore, "csrbDataStore");
        Intrinsics.g(sdkCoreDataStore, "sdkCoreDataStore");
        Intrinsics.g(appSettingsDataStore, "appSettingsDataStore");
        this.f8326b = applicationContext;
        this.f8327c = flagDataStore;
        this.f8328d = csrbDataStore;
        this.f8329e = sdkCoreDataStore;
        this.f8330f = appSettingsDataStore;
        this.f8331g = new AtomicBoolean(false);
        this.f8332h = new AtomicBoolean(false);
        this.f8333i = new d();
        e4 e4VarW = iz.w();
        Intrinsics.f(e4VarW, "newBuilder(...)");
        this.f8335k = new AtomicReference(new au(e4VarW, 11).a());
        b.m7 m7VarR = pb2.r();
        Intrinsics.f(m7VarR, "newBuilder(...)");
        this.f8336l = new AtomicReference(new au(m7VarR, 14).a());
        b.za zaVarR = uh2.r();
        Intrinsics.f(zaVarR, "newBuilder(...)");
        this.f8337m = new AtomicReference(fb.b(zaVarR).a());
        this.n = new AtomicReference(h.f17594a);
        this.o = new AtomicBoolean(false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00b8, code lost:
    
        if (r9 != r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0089 A[PHI: r8
      0x0089: PHI (r8v3 ads_mobile_sdk.pn) = (r8v2 ads_mobile_sdk.pn), (r8v10 ads_mobile_sdk.pn) binds: [B:27:0x0086, B:17:0x003f] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(pn pnVar, ContinuationImpl continuationImpl) {
        dn dnVar;
        e23 e23Var;
        Object objA;
        pnVar.getClass();
        if (continuationImpl instanceof dn) {
            dnVar = (dn) continuationImpl;
            int i5 = dnVar.f2568d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dnVar.f2568d = i5 - Integer.MIN_VALUE;
            } else {
                dnVar = new dn(pnVar, continuationImpl);
            }
        }
        Object obj = dnVar.f2566b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dnVar.f2568d;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            pnVar.f8339q = true;
            pnVar.f8334j = new com.google.gson.r();
            qq0 qq0Var = pnVar.f8327c;
            dnVar.f2565a = pnVar;
            dnVar.f2568d = 1;
            if (qq0Var.b(dnVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            pnVar = dnVar.f2565a;
            ResultKt.b(obj);
        } else {
            if (i11 == 2) {
                pnVar = dnVar.f2565a;
                ResultKt.b(obj);
                e23Var = pnVar.f8329e;
                dnVar.f2565a = pnVar;
                dnVar.f2568d = 3;
                e23Var.getClass();
                if (e23.a(e23Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, dnVar) != coroutineSingletons) {
                    ti tiVar = pnVar.f8330f;
                    dnVar.f2565a = pnVar;
                    dnVar.f2568d = 4;
                    tiVar.getClass();
                    qi qiVarX = qi.x();
                    Intrinsics.f(qiVarX, "getDefaultInstance(...)");
                    objA = ((t5.g) tiVar.f9929a.get()).a(new androidx.room.c(qiVarX, continuation, 14), dnVar);
                    if (objA != coroutineSingletons) {
                    }
                    if (objA != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            }
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                pnVar = dnVar.f2565a;
                ResultKt.b(obj);
                pnVar.o.set(false);
                zi3.a(6, "Flags were reset because too many sessions have passed without updating flags", null);
                return Unit.f71706a;
            }
            pnVar = dnVar.f2565a;
            ResultKt.b(obj);
            ti tiVar2 = pnVar.f8330f;
            dnVar.f2565a = pnVar;
            dnVar.f2568d = 4;
            tiVar2.getClass();
            qi qiVarX2 = qi.x();
            Intrinsics.f(qiVarX2, "getDefaultInstance(...)");
            objA = ((t5.g) tiVar2.f9929a.get()).a(new androidx.room.c(qiVarX2, continuation, 14), dnVar);
            if (objA != coroutineSingletons) {
                objA = Unit.f71706a;
            }
            if (objA != coroutineSingletons) {
                objA = Unit.f71706a;
            }
        }
        h70 h70Var = pnVar.f8328d;
        dnVar.f2565a = pnVar;
        dnVar.f2568d = 2;
        if (h70Var.a(dnVar) != coroutineSingletons) {
            e23Var = pnVar.f8329e;
            dnVar.f2565a = pnVar;
            dnVar.f2568d = 3;
            e23Var.getClass();
            if (e23.a(e23Var, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, dnVar) != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    public final Object b(String str, Function1 converter) {
        com.google.gson.r rVar;
        Intrinsics.g(converter, "converter");
        try {
            rVar = this.f8334j;
        } catch (Throwable unused) {
        }
        if (rVar == null) {
            Intrinsics.m("flagJson");
            throw null;
        }
        com.google.gson.p pVarV = rVar.v(str);
        if (pVarV == null) {
            return null;
        }
        return converter.invoke(pVarV);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00f3 A[EDGE_INSN: B:47:0x00f3->B:28:0x00f3 BREAK  A[LOOP:0: B:12:0x00b2->B:49:0x00b2], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final boolean a(pn pnVar, ActivityManager activityManager, com.google.gson.r rVar) {
        double dE;
        pnVar.getClass();
        Context context = pnVar.f8326b;
        Double dValueOf = Double.valueOf(2.0d);
        try {
            com.google.gson.p pVarV = rVar.v("gads:previous_exit_reason_reset_threshold");
            Intrinsics.f(pVarV, "get(...)");
            dValueOf = Double.valueOf(pVarV.e());
        } catch (Exception unused) {
        }
        double dMax = Math.max(1.0d, Math.min(dValueOf.doubleValue(), 10.0d));
        int i5 = ((int) dMax) * 2;
        Integer numValueOf = 10;
        try {
            com.google.gson.p pVarV2 = rVar.v("gads:previous_exit_reasons_to_scan");
            Intrinsics.f(pVarV2, "get(...)");
            numValueOf = Integer.valueOf(pVarV2.g());
        } catch (Exception unused2) {
        }
        int iMax = Math.max(1, Math.min(Math.max(i5, numValueOf.intValue()), 20));
        x0.f16025a.getClass();
        com.google.gson.r rVar2 = br0.f1506b;
        try {
            com.google.gson.p pVarV3 = rVar.v("gads:previous_exit_reason_values");
            Intrinsics.f(pVarV3, "get(...)");
            rVar2 = (com.google.gson.r) new Gson().fromJson(pVarV3.o(), com.google.gson.r.class);
        } catch (Exception unused3) {
        }
        Double dValueOf2 = Double.valueOf(0.25d);
        try {
            com.google.gson.p pVarV4 = rVar.v("gads:unspecified_exit_reason_value");
            Intrinsics.f(pVarV4, "get(...)");
            dValueOf2 = Double.valueOf(pVarV4.e());
        } catch (Exception unused4) {
        }
        double dMin = Math.min(1.0d, dValueOf2.doubleValue());
        List historicalProcessExitReasons = activityManager.getHistoricalProcessExitReasons(context.getPackageName(), 0, iMax);
        Intrinsics.f(historicalProcessExitReasons, "getHistoricalProcessExitReasons(...)");
        Iterator it = historicalProcessExitReasons.iterator();
        double d5 = 0.0d;
        while (it.hasNext()) {
            ApplicationExitInfo applicationExitInfoC = b.s.c(it.next());
            if (Intrinsics.b(applicationExitInfoC.getProcessName(), context.getPackageName())) {
                String key = String.valueOf(applicationExitInfoC.getReason());
                Intrinsics.g(key, "key");
                if (rVar2 != null) {
                    try {
                        dE = rVar2.v(key).e();
                    } catch (Exception unused5) {
                    }
                    d5 += dE;
                    if (dE >= 0.0d) {
                        break;
                    }
                    if (d5 >= dMax) {
                        return true;
                    }
                }
                dE = dMin;
                d5 += dE;
                if (dE >= 0.0d) {
                }
            }
        }
        return false;
    }

    public final Object a(String str, Function1 converter) {
        ci3 ci3Var;
        Intrinsics.g(converter, "converter");
        if (!this.f8331g.get()) {
            mu0.b("Flags have not been initialized!", null);
            IllegalStateException illegalStateException = new IllegalStateException("Flags have not been initialized!");
            illegalStateException.printStackTrace();
            hq hqVar = gq.f4020a;
            if (hqVar != hq.f4479b && hqVar != hq.f4480c) {
                if (hqVar == hq.f4478a && (ci3Var = l2.f48204a) != null) {
                    ci3Var.a("Flags have not been initialized!", (Throwable) illegalStateException);
                }
            } else {
                throw illegalStateException;
            }
        }
        return b(str, converter);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b7 A[Catch: all -> 0x006e, TRY_LEAVE, TryCatch #1 {all -> 0x006e, blocks: (B:38:0x0094, B:40:0x009e, B:42:0x00a8, B:44:0x00b7, B:47:0x00df, B:51:0x00ee, B:54:0x00fb, B:58:0x0109, B:60:0x010f, B:62:0x0115, B:64:0x011b, B:65:0x0161, B:67:0x0167, B:68:0x0186, B:25:0x0062, B:32:0x0076), top: B:77:0x0062 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0167 A[Catch: all -> 0x006e, LOOP:0: B:65:0x0161->B:67:0x0167, LOOP_END, TryCatch #1 {all -> 0x006e, blocks: (B:38:0x0094, B:40:0x009e, B:42:0x00a8, B:44:0x00b7, B:47:0x00df, B:51:0x00ee, B:54:0x00fb, B:58:0x0109, B:60:0x010f, B:62:0x0115, B:64:0x011b, B:65:0x0161, B:67:0x0167, B:68:0x0186, B:25:0x0062, B:32:0x0076), top: B:77:0x0062 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v10 */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v32, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r9v7 */
    /* JADX WARN: Type inference failed for: r9v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(a70 a70Var, ContinuationImpl continuationImpl) throws Throwable {
        in inVar;
        d dVar;
        pn pnVar;
        Throwable th2;
        ?? r92;
        d dVar2;
        pn pnVar2;
        String str;
        String str2;
        String str3;
        String str4;
        Iterator it;
        Map mapO;
        if (continuationImpl instanceof in) {
            inVar = (in) continuationImpl;
            int i5 = inVar.f4879f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                inVar.f4879f = i5 - Integer.MIN_VALUE;
            } else {
                inVar = new in(this, continuationImpl);
            }
        }
        Object obj = inVar.f4877d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = inVar.f4879f;
        if (i11 == 0) {
            ResultKt.b(obj);
            inVar.f4874a = this;
            inVar.f4875b = a70Var;
            dVar = this.f8333i;
            inVar.f4876c = dVar;
            inVar.f4879f = 1;
            if (dVar.e(inVar) != coroutineSingletons) {
                pnVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r92 = (c80.a) inVar.f4875b;
            pnVar2 = inVar.f4874a;
            try {
                ResultKt.b(obj);
                dVar2 = r92;
                a70 a70Var2 = (a70) obj;
                dVar = dVar2;
                a70Var = a70Var2;
                pnVar = pnVar2;
                if (a70Var.q().p() > 0 && a70Var.r().p() > 0) {
                    mapO = a70Var.o();
                    Intrinsics.f(mapO, "getConcatenatedSignalsMapMap(...)");
                    if (!mapO.isEmpty()) {
                        pnVar.f8336l.set(a70Var.q());
                        pnVar.f8337m.set(a70Var.r());
                        pnVar.n.set(a70Var.o());
                        pnVar.o.set(true);
                        Unit unit = Unit.f71706a;
                        dVar.g(null);
                        return unit;
                    }
                }
                str = (String) pnVar.b("test_pattern_matching_flag", jn.a$3);
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (str == null) {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                str3 = (String) pnVar.b("test_preprocessing_flag", jn.a$5);
                if (str3 == null) {
                    str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                str4 = (String) pnVar.b("test_concatenated_signals_flag", jn.f5311a);
                if (str4 == null) {
                    str2 = str4;
                }
                if (!r70.k.U0(str) && !r70.k.U0(str3) && !r70.k.U0(str2)) {
                    pnVar.f8336l.set(pb2.a(Base64.decode(str, 0)));
                    pnVar.f8337m.set(uh2.a(Base64.decode(str3, 0)));
                    AtomicReference atomicReference = pnVar.n;
                    o oVar = ((com.google.gson.r) new Gson().fromJson(str2, com.google.gson.r.class)).f34795a;
                    Intrinsics.f(oVar, "asMap(...)");
                    LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(oVar.f59936d));
                    it = ((hn.m) oVar.entrySet()).iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        linkedHashMap.put(((Map.Entry) next).getKey(), ((com.google.gson.p) ((Map.Entry) next).getValue()).k().o());
                    }
                    atomicReference.set(linkedHashMap);
                    pnVar.o.set(true);
                }
                r92 = dVar;
                Unit unit2 = Unit.f71706a;
                ((d) r92).g(null);
                return unit2;
            } catch (Throwable th3) {
                th2 = th3;
                ((d) r92).g(null);
                throw th2;
            }
        }
        d dVar3 = inVar.f4876c;
        a70 a70Var3 = (a70) inVar.f4875b;
        pnVar = inVar.f4874a;
        ResultKt.b(obj);
        dVar = dVar3;
        a70Var = a70Var3;
        if (a70Var == null) {
            try {
                if (!pnVar.o.get()) {
                }
                r92 = dVar;
                Unit unit22 = Unit.f71706a;
                ((d) r92).g(null);
                return unit22;
            } catch (Throwable th4) {
                d dVar4 = dVar;
                th2 = th4;
                r92 = dVar4;
                ((d) r92).g(null);
                throw th2;
            }
        }
        if (a70Var == null) {
            h70 h70Var = pnVar.f8328d;
            inVar.f4874a = pnVar;
            inVar.f4875b = dVar;
            inVar.f4876c = null;
            inVar.f4879f = 2;
            h70Var.getClass();
            Object objA = h70.a(h70Var, inVar);
            if (objA != coroutineSingletons) {
                d dVar5 = dVar;
                obj = objA;
                dVar2 = dVar5;
                pnVar2 = pnVar;
                a70 a70Var22 = (a70) obj;
                dVar = dVar2;
                a70Var = a70Var22;
                pnVar = pnVar2;
            }
            return coroutineSingletons;
        }
        if (a70Var.q().p() > 0) {
            mapO = a70Var.o();
            Intrinsics.f(mapO, "getConcatenatedSignalsMapMap(...)");
            if (!mapO.isEmpty()) {
            }
        }
        str = (String) pnVar.b("test_pattern_matching_flag", jn.a$3);
        str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str == null) {
        }
        str3 = (String) pnVar.b("test_preprocessing_flag", jn.a$5);
        if (str3 == null) {
        }
        str4 = (String) pnVar.b("test_concatenated_signals_flag", jn.f5311a);
        if (str4 == null) {
        }
        if (!r70.k.U0(str)) {
            pnVar.f8336l.set(pb2.a(Base64.decode(str, 0)));
            pnVar.f8337m.set(uh2.a(Base64.decode(str3, 0)));
            AtomicReference atomicReference2 = pnVar.n;
            o oVar2 = ((com.google.gson.r) new Gson().fromJson(str2, com.google.gson.r.class)).f34795a;
            Intrinsics.f(oVar2, "asMap(...)");
            LinkedHashMap linkedHashMap2 = new LinkedHashMap(b70.k.d0(oVar2.f59936d));
            it = ((hn.m) oVar2.entrySet()).iterator();
            while (it.hasNext()) {
            }
            atomicReference2.set(linkedHashMap2);
            pnVar.o.set(true);
        }
        r92 = dVar;
        Unit unit222 = Unit.f71706a;
        ((d) r92).g(null);
        return unit222;
    }

    public final void a() {
        SharedPreferences sharedPreferences = this.f8326b.getSharedPreferences("GoogleMobileAds", 0);
        if (Intrinsics.b(b("gads:initialize_webview_before_dagger", jn.a$6), Boolean.TRUE)) {
            Intrinsics.d(sharedPreferences);
            SharedPreferences.Editor editorEdit = sharedPreferences.edit();
            Integer num = (Integer) b("gads:initialize_webview_before_dagger:count", jn.a$7);
            editorEdit.putInt("early_webview_init_count", num != null ? num.intValue() : 5);
            editorEdit.apply();
            String str = (String) b("gads:initialize_webview_before_dagger:profiles", jn.a$8);
            if (str == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (r70.k.U0(str)) {
                return;
            }
            SharedPreferences.Editor editorEdit2 = sharedPreferences.edit();
            editorEdit2.putString("early_webview_init_profiles", str);
            editorEdit2.apply();
            return;
        }
        Intrinsics.d(sharedPreferences);
        SharedPreferences.Editor editorEdit3 = sharedPreferences.edit();
        editorEdit3.remove("early_webview_init_count");
        editorEdit3.remove("early_webview_init_profiles");
        editorEdit3.apply();
    }
}
