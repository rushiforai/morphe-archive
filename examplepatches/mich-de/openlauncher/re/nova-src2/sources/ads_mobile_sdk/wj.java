package ads_mobile_sdk;

import b.ed;
import b.o2;
import b.p8;
import b.qd;
import b70.h;
import c80.d;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.gson.Gson;
import hn.n;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.RandomAccess;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public final class wj {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f11293a;

    /* renamed from: b, reason: collision with root package name */
    public final ti f11294b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f11295c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f11296d;

    /* renamed from: f, reason: collision with root package name */
    public final d f11297f;

    /* renamed from: g, reason: collision with root package name */
    public qi f11298g;

    /* renamed from: h, reason: collision with root package name */
    public com.google.gson.r f11299h;

    public wj(CoroutineContext backgroundContext, ti appSettingsDataStore, o2 clock, jr0 flags) {
        Intrinsics.g(backgroundContext, "backgroundContext");
        Intrinsics.g(appSettingsDataStore, "appSettingsDataStore");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        this.f11293a = backgroundContext;
        this.f11294b = appSettingsDataStore;
        this.f11295c = clock;
        this.f11296d = flags;
        this.f11297f = new d();
        this.f11298g = qi.x();
        this.f11299h = new com.google.gson.r();
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a$1(wj wjVar, ContinuationImpl continuationImpl) {
        ej ejVar;
        d dVar;
        d dVar2;
        d dVar3;
        wj wjVar2;
        if (continuationImpl instanceof ej) {
            ejVar = (ej) continuationImpl;
            int i5 = ejVar.f2872e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ejVar.f2872e = i5 - Integer.MIN_VALUE;
            } else {
                ejVar = new ej(wjVar, continuationImpl);
            }
        }
        Object obj = ejVar.f2870c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ejVar.f2872e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = wjVar.f11297f;
                ejVar.f2868a = wjVar;
                ejVar.f2869b = dVar;
                ejVar.f2872e = 1;
                if (dVar.e(ejVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    dVar2 = ejVar.f2869b;
                    wjVar2 = ejVar.f2868a;
                    ResultKt.b(obj);
                    try {
                        qi qiVar = wjVar2.f11298g;
                        dVar2.g(null);
                        Intrinsics.d(qiVar);
                        return qiVar;
                    } finally {
                    }
                }
                wjVar = ejVar.f2868a;
                ResultKt.b(obj);
                dVar3 = wjVar.f11297f;
                ejVar.f2868a = wjVar;
                ejVar.f2869b = dVar3;
                ejVar.f2872e = 3;
                if (dVar3.e(ejVar) != coroutineSingletons) {
                    wjVar2 = wjVar;
                    dVar2 = dVar3;
                    qi qiVar2 = wjVar2.f11298g;
                    dVar2.g(null);
                    Intrinsics.d(qiVar2);
                    return qiVar2;
                }
                return coroutineSingletons;
            }
            d dVar4 = ejVar.f2869b;
            wj wjVar3 = ejVar.f2868a;
            ResultKt.b(obj);
            dVar = dVar4;
            wjVar = wjVar3;
            qi qiVar3 = wjVar.f11298g;
            dVar2.g(null);
            jr0 jr0Var = wjVar.f11296d;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:app_settings_expiry_check_in_getter:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                Intrinsics.d(qiVar3);
                ejVar.f2868a = wjVar;
                ejVar.f2869b = null;
                ejVar.f2872e = 2;
                if (wjVar.a(qiVar3, ejVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            dVar3 = wjVar.f11297f;
            ejVar.f2868a = wjVar;
            ejVar.f2869b = dVar3;
            ejVar.f2872e = 3;
            if (dVar3.e(ejVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(wj wjVar, ContinuationImpl continuationImpl) {
        fj fjVar;
        d dVar;
        d dVar2;
        wj wjVar2;
        d dVar3;
        if (continuationImpl instanceof fj) {
            fjVar = (fj) continuationImpl;
            int i5 = fjVar.f3365e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fjVar.f3365e = i5 - Integer.MIN_VALUE;
            } else {
                fjVar = new fj(wjVar, continuationImpl);
            }
        }
        Object obj = fjVar.f3363c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fjVar.f3365e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = wjVar.f11297f;
                fjVar.f3361a = wjVar;
                fjVar.f3362b = dVar;
                fjVar.f3365e = 1;
                if (dVar.e(fjVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    dVar3 = fjVar.f3362b;
                    wjVar2 = fjVar.f3361a;
                    ResultKt.b(obj);
                    try {
                        return wjVar2.f11299h;
                    } finally {
                    }
                }
                wjVar = fjVar.f3361a;
                ResultKt.b(obj);
                dVar2 = wjVar.f11297f;
                fjVar.f3361a = wjVar;
                fjVar.f3362b = dVar2;
                fjVar.f3365e = 3;
                if (dVar2.e(fjVar) != coroutineSingletons) {
                    wjVar2 = wjVar;
                    dVar3 = dVar2;
                    return wjVar2.f11299h;
                }
                return coroutineSingletons;
            }
            d dVar4 = fjVar.f3362b;
            wj wjVar3 = fjVar.f3361a;
            ResultKt.b(obj);
            dVar = dVar4;
            wjVar = wjVar3;
            qi qiVar = wjVar.f11298g;
            dVar.g(null);
            jr0 jr0Var = wjVar.f11296d;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:app_settings_expiry_check_in_getter:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                Intrinsics.d(qiVar);
                fjVar.f3361a = wjVar;
                fjVar.f3362b = null;
                fjVar.f3365e = 2;
                if (wjVar.a(qiVar, fjVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            dVar2 = wjVar.f11297f;
            fjVar.f3361a = wjVar;
            fjVar.f3362b = dVar2;
            fjVar.f3365e = 3;
            if (dVar2.e(fjVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        gj gjVar;
        wj wjVar;
        d dVar;
        if (continuationImpl instanceof gj) {
            gjVar = (gj) continuationImpl;
            int i5 = gjVar.f3859e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gjVar.f3859e = i5 - Integer.MIN_VALUE;
            } else {
                gjVar = new gj(this, continuationImpl);
            }
        }
        Object obj = gjVar.f3857c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gjVar.f3859e;
        if (i11 == 0) {
            ResultKt.b(obj);
            gjVar.f3855a = this;
            d dVar2 = this.f11297f;
            gjVar.f3856b = dVar2;
            gjVar.f3859e = 1;
            if (dVar2.e(gjVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            wjVar = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = gjVar.f3856b;
            wjVar = gjVar.f3855a;
            ResultKt.b(obj);
        }
        try {
            String strW = wjVar.f11298g.w();
            if (strW.length() == 0) {
                strW = null;
            }
            return strW;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x009f, code lost:
    
        if (r2 == null) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable c(String str, String str2, ContinuationImpl continuationImpl) {
        lj ljVar;
        wj wjVar;
        String str3;
        String str4;
        d dVar;
        if (continuationImpl instanceof lj) {
            ljVar = (lj) continuationImpl;
            int i5 = ljVar.f6247g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ljVar.f6247g = i5 - Integer.MIN_VALUE;
            } else {
                ljVar = new lj(this, continuationImpl);
            }
        }
        Object obj = ljVar.f6245e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ljVar.f6247g;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (str != null) {
                    Locale locale = Locale.ROOT;
                    String lowerCase = str2.toLowerCase(locale);
                    Intrinsics.f(lowerCase, "toLowerCase(...)");
                    String lowerCase2 = str.toLowerCase(locale);
                    Intrinsics.f(lowerCase2, "toLowerCase(...)");
                    ljVar.f6241a = this;
                    ljVar.f6242b = lowerCase;
                    ljVar.f6243c = lowerCase2;
                    d dVar2 = this.f11297f;
                    ljVar.f6244d = dVar2;
                    ljVar.f6247g = 1;
                    if (dVar2.e(ljVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    wjVar = this;
                    str3 = lowerCase;
                    str4 = lowerCase2;
                    dVar = dVar2;
                }
                return h.f17594a;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = ljVar.f6244d;
            str4 = ljVar.f6243c;
            str3 = ljVar.f6242b;
            wjVar = ljVar.f6241a;
            ResultKt.b(obj);
            qi qiVar = wjVar.f11298g;
            dVar.g(null);
            String strM = str4 + "," + str3;
            dp1 dp1Var = (dp1) qiVar.p().get(strM);
            if (dp1Var == null) {
                strM = b.u4.m(ed.g(qiVar, str4, str3), ",", str3);
                dp1Var = (dp1) qiVar.p().get(strM);
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (yn1 yn1Var : dp1Var.o()) {
                for (String str5 : yn1Var.o()) {
                    if (linkedHashMap.containsKey(str5)) {
                        zi3.a("Duplicate adapter (" + str5 + ") for ad unit + format " + strM);
                    } else {
                        Intrinsics.d(str5);
                        Map mapP = yn1Var.p();
                        Intrinsics.f(mapP, "getDataMap(...)");
                        linkedHashMap.put(str5, mapP);
                    }
                }
            }
            return linkedHashMap;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r6v1, types: [java.lang.Object, java.util.Map] */
    /* JADX WARN: Type inference failed for: r6v3, types: [java.lang.Object, java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable a(String str, String str2, ContinuationImpl continuationImpl) {
        hj hjVar;
        d dVar;
        wj wjVar;
        String str3;
        String adUnit;
        Map map;
        if (continuationImpl instanceof hj) {
            hjVar = (hj) continuationImpl;
            int i5 = hjVar.f4406g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hjVar.f4406g = i5 - Integer.MIN_VALUE;
            } else {
                hjVar = new hj(this, continuationImpl);
            }
        }
        Object objC = hjVar.f4404e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hjVar.f4406g;
        h hVar = h.f17594a;
        try {
            if (i11 == 0) {
                ResultKt.b(objC);
                Locale locale = Locale.ROOT;
                String lowerCase = str2.toLowerCase(locale);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                if (str == null) {
                    return hVar;
                }
                String lowerCase2 = str.toLowerCase(locale);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
                hjVar.f4400a = this;
                hjVar.f4401b = lowerCase;
                hjVar.f4402c = lowerCase2;
                dVar = this.f11297f;
                hjVar.f4403d = dVar;
                hjVar.f4406g = 1;
                if (dVar.e(hjVar) != coroutineSingletons) {
                    wjVar = this;
                    str3 = lowerCase;
                    adUnit = lowerCase2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                map = (Map) hjVar.f4400a;
                ResultKt.b(objC);
                MapBuilder mapBuilder = new MapBuilder();
                for (Map.Entry entry : ((Map) objC).entrySet()) {
                    String str4 = (String) entry.getKey();
                    Map map2 = (Map) entry.getValue();
                    ap apVar = (ap) map.get(str4);
                    if (apVar != null) {
                        qd qdVar = (qd) apVar.n();
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((ap) qdVar.f1095b).serverParameters_)), "getServerParametersMap(...)");
                        Intrinsics.g(map2, "map");
                        qdVar.b();
                        ((ap) qdVar.f1095b).p().putAll(map2);
                        mapBuilder.put(str4, (ap) qdVar.a());
                    }
                }
                for (Map.Entry entry2 : map.entrySet()) {
                    String str5 = (String) entry2.getKey();
                    ap apVar2 = (ap) entry2.getValue();
                    if (!mapBuilder.containsKey(str5) && apVar2.r()) {
                        mapBuilder.put(str5, apVar2);
                    }
                }
                return mapBuilder.b();
            }
            d dVar2 = hjVar.f4403d;
            adUnit = hjVar.f4402c;
            str3 = hjVar.f4401b;
            wjVar = (wj) hjVar.f4400a;
            ResultKt.b(objC);
            dVar = dVar2;
            qi qiVar = wjVar.f11298g;
            jr0 jr0Var = wjVar.f11296d;
            dVar.g(null);
            Intrinsics.d(qiVar);
            Intrinsics.g(adUnit, "adUnit");
            jr0Var.getClass();
            u uVar = u.a$7;
            Regex regex = new Regex((String) jr0Var.a("gads:ad_manager_ad_unit_pattern", "^\\/[0-9]*\\/.*|^\\/[0-9]*,[0-9]*\\/.*", uVar));
            Locale locale2 = Locale.ROOT;
            String lowerCase3 = adUnit.toLowerCase(locale2);
            Intrinsics.f(lowerCase3, "toLowerCase(...)");
            boolean zF = regex.f(lowerCase3);
            Regex regex2 = new Regex((String) jr0Var.a("gads:ad_mob_ad_unit_pattern", "^(ca-app-pub-[a-zA-Z0-9\\-]+)\\/([a-zA-Z0-9_\\-]+)(\\/.*)?$", uVar));
            String lowerCase4 = adUnit.toLowerCase(locale2);
            Intrinsics.f(lowerCase4, "toLowerCase(...)");
            boolean zF2 = regex2.f(lowerCase4);
            h hVar2 = hVar;
            if (zF) {
                ?? O = qiVar.o();
                Intrinsics.d(O);
                hVar2 = O;
            } else if (zF2) {
                ?? T = qiVar.t();
                Intrinsics.d(T);
                hVar2 = T;
            }
            hjVar.f4400a = hVar2;
            hjVar.f4401b = null;
            hjVar.f4402c = null;
            hjVar.f4403d = null;
            hjVar.f4406g = 2;
            objC = wjVar.c(adUnit, str3, hjVar);
            if (objC != coroutineSingletons) {
                map = hVar2;
                MapBuilder mapBuilder2 = new MapBuilder();
                while (r2.hasNext()) {
                }
                while (r0.hasNext()) {
                }
                return mapBuilder2.b();
            }
            return coroutineSingletons;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, ContinuationImpl continuationImpl) {
        kj kjVar;
        wj wjVar;
        String str3;
        String str4;
        d dVar;
        if (continuationImpl instanceof kj) {
            kjVar = (kj) continuationImpl;
            int i5 = kjVar.f5754g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kjVar.f5754g = i5 - Integer.MIN_VALUE;
            } else {
                kjVar = new kj(this, continuationImpl);
            }
        }
        Object obj = kjVar.f5752e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kjVar.f5754g;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (str == null) {
                return null;
            }
            Locale locale = Locale.ROOT;
            String lowerCase = str2.toLowerCase(locale);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            String lowerCase2 = str.toLowerCase(locale);
            Intrinsics.f(lowerCase2, "toLowerCase(...)");
            kjVar.f5748a = this;
            kjVar.f5749b = lowerCase;
            kjVar.f5750c = lowerCase2;
            d dVar2 = this.f11297f;
            kjVar.f5751d = dVar2;
            kjVar.f5754g = 1;
            if (dVar2.e(kjVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            wjVar = this;
            str3 = lowerCase;
            str4 = lowerCase2;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = kjVar.f5751d;
            str4 = kjVar.f5750c;
            str3 = kjVar.f5749b;
            wjVar = kjVar.f5748a;
            ResultKt.b(obj);
        }
        try {
            qi qiVar = wjVar.f11298g;
            dVar.g(null);
            String str5 = (String) qiVar.q().get(str4 + "," + str3);
            if (str5 != null) {
                return str5;
            }
            String strG = ed.g(qiVar, str4, str3);
            return qiVar.q().get(strG + "," + str3);
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a$1(ContinuationImpl continuationImpl) {
        ij ijVar;
        if (continuationImpl instanceof ij) {
            ijVar = (ij) continuationImpl;
            int i5 = ijVar.f4782e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ijVar.f4782e = i5 - Integer.MIN_VALUE;
            } else {
                ijVar = new ij(this, continuationImpl);
            }
        }
        Object objA$1 = ijVar.f4780c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ijVar.f4782e;
        if (i11 == 0) {
            ResultKt.b(objA$1);
            ijVar.f4782e = 1;
            objA$1 = a$1(this, ijVar);
            if (objA$1 == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA$1);
        }
        return ((qi) objA$1).s().keySet();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(wj wjVar, ContinuationImpl continuationImpl) {
        pj pjVar;
        d dVar;
        if (continuationImpl instanceof pj) {
            pjVar = (pj) continuationImpl;
            int i5 = pjVar.f8286e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pjVar.f8286e = i5 - Integer.MIN_VALUE;
            } else {
                pjVar = new pj(wjVar, continuationImpl);
            }
        }
        Object obj = pjVar.f8284c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pjVar.f8286e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = wjVar.f11297f;
            pjVar.f8282a = wjVar;
            pjVar.f8283b = dVar;
            pjVar.f8286e = 1;
            if (dVar.e(pjVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = pjVar.f8283b;
            wj wjVar2 = pjVar.f8282a;
            ResultKt.b(obj);
            dVar = dVar2;
            wjVar = wjVar2;
        }
        try {
            wjVar.f11296d.O();
            return false;
        } finally {
            dVar.g(null);
        }
    }

    public final boolean a(qi qiVar) {
        long jH;
        u uVar = u.a$3;
        String strU = qiVar.u();
        Intrinsics.f(strU, "getAppSettingsJson(...)");
        if (strU.length() == 0) {
            return true;
        }
        jr0 jr0Var = this.f11296d;
        jr0Var.getClass();
        if (((Boolean) jr0Var.a("gads:use_server_defined_cld_ttl:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
            Duration.Companion companion = Duration.f72038b;
            long jZ = qiVar.z();
            DurationUnit durationUnit = DurationUnit.f72046e;
            jH = DurationKt.h(jZ, durationUnit);
            companion.getClass();
            if (Duration.d(jH, 0L)) {
                jH = ((Duration) jr0Var.a("gads:sdk_defined_cld_ttl_secs", new Duration(DurationKt.g(-1, durationUnit)), uVar)).f72041a;
            }
        } else {
            Duration.Companion companion2 = Duration.f72038b;
            jH = ((Duration) jr0Var.a("gads:sdk_defined_cld_ttl_secs", ed.k(-1, DurationUnit.f72046e, "gads:sdk_defined_cld_ttl_secs"), uVar)).f72041a;
        }
        Duration.f72038b.getClass();
        if (Duration.c(jH, 0L) <= 0) {
            return true;
        }
        this.f11295c.getClass();
        return Duration.c(DurationKt.h(System.currentTimeMillis() - qiVar.y(), DurationUnit.f72045d), jH) <= 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(qi qiVar, ContinuationImpl continuationImpl) {
        qj qjVar;
        d dVar;
        wj wjVar;
        if (continuationImpl instanceof qj) {
            qjVar = (qj) continuationImpl;
            int i5 = qjVar.f8690e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qjVar.f8690e = i5 - Integer.MIN_VALUE;
            } else {
                qjVar = new qj(this, continuationImpl);
            }
        }
        Object obj = qjVar.f8688c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qjVar.f8690e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!a(qiVar)) {
                    qjVar.f8686a = this;
                    dVar = this.f11297f;
                    qjVar.f8687b = dVar;
                    qjVar.f8690e = 1;
                    if (dVar.e(qjVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    wjVar = this;
                }
                return Unit.f71706a;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = qjVar.f8687b;
            wjVar = qjVar.f8686a;
            ResultKt.b(obj);
            wjVar.f11298g = qi.x();
            wjVar.f11299h = new com.google.gson.r();
            Unit unit = Unit.f71706a;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:191:0x05b9, code lost:
    
        if (t70.m0.y(r2, r5, r3) == r4) goto L192;
     */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0582  */
    /* JADX WARN: Removed duplicated region for block: B:186:0x0585  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(wj wjVar, com.google.gson.r json, long j11, ContinuationImpl continuationImpl) {
        rj rjVar;
        rj rjVar2;
        CoroutineSingletons coroutineSingletons;
        int i5;
        int i11;
        Pair pair;
        qi qiVar;
        wj wjVar2;
        n nVarB;
        Pair pair2;
        Iterator it;
        String str;
        com.google.gson.p pVar;
        com.google.gson.p pVarV;
        if (continuationImpl instanceof rj) {
            rjVar = (rj) continuationImpl;
            int i12 = rjVar.f9205e;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                rjVar.f9205e = i12 - Integer.MIN_VALUE;
            } else {
                rjVar = new rj(wjVar, continuationImpl);
            }
        }
        Object obj = rjVar.f9203c;
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        int i13 = rjVar.f9205e;
        int i14 = 2;
        int i15 = 1;
        if (i13 == 0) {
            ResultKt.b(obj);
            Intrinsics.g(json, "json");
            try {
                if (mu0.a(2, "GoogleMobileAds")) {
                    Iterator it2 = mu0.a().c("AppSettings raw response: " + json).iterator();
                    while (true) {
                        vk.s sVar = (vk.s) it2;
                        if (!sVar.hasNext()) {
                            break;
                        }
                        Thread.currentThread().getClass();
                    }
                }
            } catch (Exception e3) {
                e = e3;
                rjVar2 = rjVar;
                coroutineSingletons = coroutineSingletons2;
                i5 = 2;
                i11 = 1;
            }
            if (d62.a(json)) {
                String strA = d62.a(json, "appSettingsJson");
                com.google.gson.r rVar = (com.google.gson.r) new Gson().fromJson(strA, com.google.gson.r.class);
                if (d62.a(rVar, "status", 0) != 1) {
                    com.google.gson.p pVarV2 = rVar.v("errorReason");
                    String strO = pVarV2 != null ? pVarV2.o() : null;
                    if (strO == null) {
                        strO = "status is not 1, was " + d62.a(rVar, "status", 0);
                    }
                    zi3.a(6, strO, null);
                } else {
                    long jG = d62.g(rVar, "cache_ttl_sec");
                    com.google.gson.r rVarX = rVar.x("common_settings");
                    com.google.gson.m mVarW = rVarX != null ? rVarX.w("loeid") : null;
                    ArrayList arrayList = new ArrayList();
                    if (mVarW != null) {
                        Iterator it3 = mVarW.f34793a.iterator();
                        int i16 = 0;
                        while (it3.hasNext()) {
                            Object next = it3.next();
                            int i17 = i16 + 1;
                            if (i16 >= 0) {
                                com.google.gson.p pVar2 = (com.google.gson.p) next;
                                Intrinsics.d(pVar2);
                                arrayList.add(Long.valueOf(pVar2.l()));
                                Unit unit = Unit.f71706a;
                                i16 = i17;
                            } else {
                                ul.b.e0();
                                throw null;
                            }
                        }
                    }
                    com.google.gson.r rVarX2 = rVar.x("ad_unit_patterns");
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    if (rVarX2 != null) {
                        Iterator it4 = ((hn.m) rVarX2.f34795a.entrySet()).iterator();
                        while (((hn.l) it4).hasNext()) {
                            try {
                                nVarB = ((hn.l) it4).b();
                                try {
                                    i5 = i14;
                                } catch (Exception e11) {
                                    e = e11;
                                    i5 = i14;
                                }
                            } catch (Exception e12) {
                                e = e12;
                                i5 = i14;
                            }
                            try {
                                String str2 = (String) nVarB.getKey();
                                com.google.gson.p pVar3 = (com.google.gson.p) nVarB.getValue();
                                Intrinsics.d(str2);
                                Intrinsics.d(pVar3);
                                d9 d9VarA = e41.a(pVar3.h());
                                if (d9VarA != null) {
                                    i11 = i15;
                                    try {
                                        pair2 = new Pair(str2, d9VarA);
                                    } catch (Exception e13) {
                                        e = e13;
                                        rjVar2 = rjVar;
                                        coroutineSingletons = coroutineSingletons2;
                                        zi3.a(e);
                                        pair = null;
                                        if (pair == null) {
                                        }
                                    }
                                } else {
                                    i11 = i15;
                                    pair2 = null;
                                }
                                if (pair2 != null) {
                                    linkedHashMap.put(pair2.f71683a, pair2.f71684b);
                                    Unit unit2 = Unit.f71706a;
                                }
                                i14 = i5;
                                i15 = i11;
                            } catch (Exception e14) {
                                e = e14;
                                i11 = i15;
                                rjVar2 = rjVar;
                                coroutineSingletons = coroutineSingletons2;
                                zi3.a(e);
                                pair = null;
                                if (pair == null) {
                                }
                            }
                        }
                    }
                    i5 = i14;
                    i11 = i15;
                    com.google.gson.m mVarW2 = rVar.w("ad_unit_id_settings");
                    LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                    if (mVarW2 != null) {
                        Iterator it5 = mVarW2.h().f34793a.iterator();
                        while (it5.hasNext()) {
                            com.google.gson.p pVar4 = (com.google.gson.p) it5.next();
                            Intrinsics.d(pVar4);
                            Pair pairB = e41.b(pVar4.j());
                            if (pairB != null) {
                                linkedHashMap2.put(pairB.f71683a, pairB.f71684b);
                                Unit unit3 = Unit.f71706a;
                            }
                        }
                    }
                    com.google.gson.m mVarW3 = rVar.w("ad_unit_id_settings");
                    LinkedHashMap linkedHashMap3 = new LinkedHashMap();
                    if (mVarW3 != null) {
                        Iterator it6 = mVarW3.h().f34793a.iterator();
                        while (it6.hasNext()) {
                            com.google.gson.p pVar5 = (com.google.gson.p) it6.next();
                            Intrinsics.d(pVar5);
                            Pair pairA = e41.a(pVar5.j());
                            if (pairA != null) {
                                linkedHashMap3.put(pairA.f71683a, pairA.f71684b);
                                Unit unit4 = Unit.f71706a;
                            }
                        }
                    }
                    com.google.gson.m mVarW4 = rVar.w("signal_adapters");
                    LinkedHashMap linkedHashMap4 = new LinkedHashMap();
                    if (mVarW4 != null) {
                        Iterator it7 = mVarW4.h().f34793a.iterator();
                        while (it7.hasNext()) {
                            com.google.gson.p pVar6 = (com.google.gson.p) it7.next();
                            Intrinsics.d(pVar6);
                            Pair pairH = e41.h(pVar6.j());
                            if (pairH != null) {
                                Iterator it8 = it7;
                                linkedHashMap4.put(pairH.f71683a, pairH.f71684b);
                                Unit unit5 = Unit.f71706a;
                                it7 = it8;
                            }
                        }
                    }
                    com.google.gson.m mVarW5 = rVar.w("adapter_settings");
                    LinkedHashMap linkedHashMap5 = new LinkedHashMap();
                    if (mVarW5 != null) {
                        Iterator it9 = mVarW5.h().f34793a.iterator();
                        while (it9.hasNext()) {
                            com.google.gson.p pVar7 = (com.google.gson.p) it9.next();
                            Intrinsics.d(pVar7);
                            Iterator it10 = it9;
                            com.google.gson.r rVarJ = pVar7.j();
                            com.google.gson.r rVar2 = rVarX;
                            Pair pairA2 = e41.a(rVarJ, InneractiveMediationNameConsts.ADMOB);
                            if (pairA2 != null) {
                                linkedHashMap5.put(pairA2.f71683a, pairA2.f71684b);
                                Unit unit6 = Unit.f71706a;
                            }
                            it9 = it10;
                            rVarX = rVar2;
                        }
                    }
                    com.google.gson.r rVar3 = rVarX;
                    com.google.gson.m mVarW6 = rVar.w("adapter_settings");
                    LinkedHashMap linkedHashMap6 = new LinkedHashMap();
                    if (mVarW6 != null) {
                        Iterator it11 = mVarW6.h().f34793a.iterator();
                        while (it11.hasNext()) {
                            com.google.gson.p pVar8 = (com.google.gson.p) it11.next();
                            Intrinsics.d(pVar8);
                            Iterator it12 = it11;
                            Pair pairA3 = e41.a(pVar8.j(), "ad_manager");
                            if (pairA3 != null) {
                                linkedHashMap6.put(pairA3.f71683a, pairA3.f71684b);
                                Unit unit7 = Unit.f71706a;
                            }
                            it11 = it12;
                        }
                    }
                    com.google.gson.p pVarV3 = rVar.v("initializer_settings");
                    com.google.gson.r rVarJ2 = pVarV3 != null ? pVarV3.j() : null;
                    com.google.gson.r rVarJ3 = (rVarJ2 == null || (pVarV = rVarJ2.v("config")) == null) ? null : pVarV.j();
                    if (rVarJ3 == null) {
                        rVarJ3 = new com.google.gson.r();
                    }
                    LinkedHashMap linkedHashMap7 = new LinkedHashMap();
                    Iterator it13 = ((hn.m) rVarJ3.f34795a.entrySet()).iterator();
                    while (((hn.l) it13).hasNext()) {
                        try {
                            n nVarB2 = ((hn.l) it13).b();
                            it = it13;
                            str = (String) nVarB2.getKey();
                            pVar = (com.google.gson.p) nVarB2.getValue();
                            Intrinsics.d(str);
                            Intrinsics.d(pVar);
                            coroutineSingletons = coroutineSingletons2;
                        } catch (Exception e15) {
                            e = e15;
                            coroutineSingletons = coroutineSingletons2;
                            rjVar2 = rjVar;
                            zi3.a(e);
                            pair = null;
                            if (pair == null) {
                            }
                        }
                        try {
                            oa oaVarE = e41.e(pVar.j());
                            Pair pair3 = oaVarE != null ? new Pair(str, oaVarE) : null;
                            if (pair3 != null) {
                                linkedHashMap7.put(pair3.f71683a, pair3.f71684b);
                                Unit unit8 = Unit.f71706a;
                            }
                            it13 = it;
                            coroutineSingletons2 = coroutineSingletons;
                        } catch (Exception e16) {
                            e = e16;
                            rjVar2 = rjVar;
                            zi3.a(e);
                            pair = null;
                            if (pair == null) {
                            }
                        }
                    }
                    coroutineSingletons = coroutineSingletons2;
                    p8 p8VarA = qi.A();
                    Intrinsics.f(p8VarA, "newBuilder(...)");
                    p8VarA.b();
                    qi qiVar2 = (qi) p8VarA.f1095b;
                    qiVar2.bitField0_ |= 1;
                    qiVar2.appSettingsVersion_ = 2;
                    p8VarA.b();
                    qi qiVar3 = (qi) p8VarA.f1095b;
                    qiVar3.bitField0_ |= 4;
                    rjVar2 = rjVar;
                    try {
                        qiVar3.lastUpdateTimeMs_ = j11;
                        p8VarA.b();
                        qi qiVar4 = (qi) p8VarA.f1095b;
                        qiVar4.bitField0_ |= 8;
                        qiVar4.serverCacheTtlSecs_ = jG;
                        p8VarA.b();
                        ((qi) p8VarA.f1095b).b(strA);
                        Intrinsics.f(Collections.unmodifiableList(((qi) p8VarA.f1095b).loggingOnlyExperimentIds_), "getLoggingOnlyExperimentIdsList(...)");
                        p8VarA.b();
                        qi qiVar5 = (qi) p8VarA.f1095b;
                        RandomAccess randomAccess = qiVar5.loggingOnlyExperimentIds_;
                        if (!((j) randomAccess).f5068a) {
                            wm1 wm1Var = (wm1) randomAccess;
                            qiVar5.loggingOnlyExperimentIds_ = wm1Var.a(wm1Var.f11337c * 2);
                        }
                        b.y2.a(arrayList, qiVar5.loggingOnlyExperimentIds_);
                        String string = rVar3 != null ? rVar3.toString() : null;
                        if (string == null) {
                            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        p8VarA.b();
                        ((qi) p8VarA.f1095b).c(string);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).adUnitPatterns_)), "getAdUnitPatternsMap(...)");
                        p8VarA.b();
                        qi qiVar6 = (qi) p8VarA.f1095b;
                        gn1 gn1Var = qiVar6.adUnitPatterns_;
                        if (!gn1Var.f4009a) {
                            qiVar6.adUnitPatterns_ = gn1Var.b();
                        }
                        qiVar6.adUnitPatterns_.putAll(linkedHashMap);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).signalAdapterConfigs_)), "getSignalAdapterConfigsMap(...)");
                        p8VarA.b();
                        qi qiVar7 = (qi) p8VarA.f1095b;
                        gn1 gn1Var2 = qiVar7.signalAdapterConfigs_;
                        if (!gn1Var2.f4009a) {
                            qiVar7.signalAdapterConfigs_ = gn1Var2.b();
                        }
                        qiVar7.signalAdapterConfigs_.putAll(linkedHashMap4);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).admobSignalAdapterConfigs_)), "getAdmobSignalAdapterConfigsMap(...)");
                        p8VarA.b();
                        qi qiVar8 = (qi) p8VarA.f1095b;
                        gn1 gn1Var3 = qiVar8.admobSignalAdapterConfigs_;
                        if (!gn1Var3.f4009a) {
                            qiVar8.admobSignalAdapterConfigs_ = gn1Var3.b();
                        }
                        qiVar8.admobSignalAdapterConfigs_.putAll(linkedHashMap5);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).adManagerSignalAdapterConfigs_)), "getAdManagerSignalAdapterConfigsMap(...)");
                        p8VarA.b();
                        qi qiVar9 = (qi) p8VarA.f1095b;
                        gn1 gn1Var4 = qiVar9.adManagerSignalAdapterConfigs_;
                        if (!gn1Var4.f4009a) {
                            qiVar9.adManagerSignalAdapterConfigs_ = gn1Var4.b();
                        }
                        qiVar9.adManagerSignalAdapterConfigs_.putAll(linkedHashMap6);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).adapterInitializationConfigs_)), "getAdapterInitializationConfigsMap(...)");
                        p8VarA.b();
                        qi qiVar10 = (qi) p8VarA.f1095b;
                        gn1 gn1Var5 = qiVar10.adapterInitializationConfigs_;
                        if (!gn1Var5.f4009a) {
                            qiVar10.adapterInitializationConfigs_ = gn1Var5.b();
                        }
                        qiVar10.adapterInitializationConfigs_.putAll(linkedHashMap7);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).adUnitAndFormatToRequestSignals_)), "getAdUnitAndFormatToRequestSignalsMap(...)");
                        p8VarA.b();
                        qi qiVar11 = (qi) p8VarA.f1095b;
                        gn1 gn1Var6 = qiVar11.adUnitAndFormatToRequestSignals_;
                        if (!gn1Var6.f4009a) {
                            qiVar11.adUnitAndFormatToRequestSignals_ = gn1Var6.b();
                        }
                        qiVar11.adUnitAndFormatToRequestSignals_.putAll(linkedHashMap2);
                        Intrinsics.f(Collections.unmodifiableMap(Collections.unmodifiableMap(((qi) p8VarA.f1095b).adUnitAndFormatToMediationConfigs_)), "getAdUnitAndFormatToMediationConfigsMap(...)");
                        p8VarA.b();
                        qi qiVar12 = (qi) p8VarA.f1095b;
                        gn1 gn1Var7 = qiVar12.adUnitAndFormatToMediationConfigs_;
                        if (!gn1Var7.f4009a) {
                            qiVar12.adUnitAndFormatToMediationConfigs_ = gn1Var7.b();
                        }
                        qiVar12.adUnitAndFormatToMediationConfigs_.putAll(linkedHashMap3);
                        pair = new Pair((qi) p8VarA.a(), rVar);
                    } catch (Exception e17) {
                        e = e17;
                        zi3.a(e);
                        pair = null;
                        if (pair == null) {
                        }
                    }
                    if (pair == null) {
                        return Unit.f71706a;
                    }
                    qiVar = (qi) pair.f71683a;
                    com.google.gson.r rVar4 = (com.google.gson.r) pair.f71684b;
                    rjVar = rjVar2;
                    rjVar.f9201a = wjVar;
                    rjVar.f9202b = qiVar;
                    rjVar.f9205e = i11;
                    coroutineSingletons2 = coroutineSingletons;
                    if (wjVar.a(qiVar, rVar4, rjVar) != coroutineSingletons2) {
                        wjVar2 = wjVar;
                    }
                    return coroutineSingletons2;
                }
            }
            rjVar2 = rjVar;
            coroutineSingletons = coroutineSingletons2;
            i5 = 2;
            i11 = 1;
            pair = null;
            if (pair == null) {
            }
        } else {
            if (i13 != 1) {
                if (i13 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            qiVar = rjVar.f9202b;
            wjVar2 = rjVar.f9201a;
            ResultKt.b(obj);
            i5 = 2;
        }
        CoroutineContext coroutineContext = wjVar2.f11293a;
        b00.e eVar = new b00.e(wjVar2, qiVar, null, 16);
        rjVar.f9201a = null;
        rjVar.f9202b = null;
        rjVar.f9205e = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(qi qiVar, com.google.gson.r rVar, ContinuationImpl continuationImpl) {
        tj tjVar;
        d dVar;
        wj wjVar;
        if (continuationImpl instanceof tj) {
            tjVar = (tj) continuationImpl;
            int i5 = tjVar.f9946g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tjVar.f9946g = i5 - Integer.MIN_VALUE;
            } else {
                tjVar = new tj(this, continuationImpl);
            }
        }
        Object obj = tjVar.f9944e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tjVar.f9946g;
        if (i11 == 0) {
            ResultKt.b(obj);
            tjVar.f9940a = this;
            tjVar.f9941b = qiVar;
            tjVar.f9942c = rVar;
            dVar = this.f11297f;
            tjVar.f9943d = dVar;
            tjVar.f9946g = 1;
            if (dVar.e(tjVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            wjVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = tjVar.f9943d;
            rVar = tjVar.f9942c;
            qi qiVar2 = tjVar.f9941b;
            wjVar = tjVar.f9940a;
            ResultKt.b(obj);
            dVar = dVar2;
            qiVar = qiVar2;
        }
        try {
            wjVar.f11298g = qiVar;
            wjVar.f11299h = rVar;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(wj wjVar, ContinuationImpl continuationImpl) {
        vj vjVar;
        d dVar;
        if (continuationImpl instanceof vj) {
            vjVar = (vj) continuationImpl;
            int i5 = vjVar.f10798f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vjVar.f10798f = i5 - Integer.MIN_VALUE;
            } else {
                vjVar = new vj(wjVar, continuationImpl);
            }
        }
        Object obj = vjVar.f10796d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vjVar.f10798f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = wjVar.f11297f;
            vjVar.f10794a = wjVar;
            vjVar.f10795b = dVar;
            vjVar.f10798f = 1;
            if (dVar.e(vjVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = vjVar.f10795b;
            wj wjVar2 = vjVar.f10794a;
            ResultKt.b(obj);
            dVar = dVar2;
            wjVar = wjVar2;
        }
        try {
            wjVar.getClass();
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
