package zy;

import android.os.Bundle;
import b10.r0;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.google.firebase.crashlytics.FirebaseCrashlytics;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import org.json.JSONException;
import t70.p2;
import w70.i2;
import w70.u1;
import xm.e;
import xm.j;
import xm.p;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public static FirebaseAnalytics f98824b;

    /* renamed from: c, reason: collision with root package name */
    public static wm.c f98825c;

    /* renamed from: d, reason: collision with root package name */
    public static FirebaseCrashlytics f98826d;

    /* renamed from: e, reason: collision with root package name */
    public static boolean f98827e;

    /* renamed from: h, reason: collision with root package name */
    public static final i2 f98830h;

    /* renamed from: i, reason: collision with root package name */
    public static final i2 f98831i;

    /* renamed from: a, reason: collision with root package name */
    public static final c f98823a = new c();

    /* renamed from: f, reason: collision with root package name */
    public static final ConcurrentLinkedQueue f98828f = new ConcurrentLinkedQueue();

    /* renamed from: g, reason: collision with root package name */
    public static final AtomicBoolean f98829g = new AtomicBoolean(false);

    static {
        i2 i2VarC = u1.c(Boolean.FALSE);
        f98830h = i2VarC;
        f98831i = i2VarC;
    }

    public static LinkedHashMap b() {
        p pVar;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        wm.c cVar = f98825c;
        if (cVar != null) {
            j jVar = cVar.f94605h;
            HashSet hashSet = new HashSet();
            xm.c cVar2 = jVar.f96141c;
            hashSet.addAll(j.b(cVar2));
            xm.c cVar3 = jVar.f96142d;
            hashSet.addAll(j.b(cVar3));
            HashMap map = new HashMap();
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                String str = (String) it.next();
                String strC = j.c(cVar2, str);
                if (strC != null) {
                    jVar.a(str, cVar2.c());
                    pVar = new p(strC, 2);
                } else {
                    String strC2 = j.c(cVar3, str);
                    if (strC2 != null) {
                        pVar = new p(strC2, 1);
                    } else {
                        j.d(str, "FirebaseRemoteConfigValue");
                        pVar = new p(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0);
                    }
                }
                map.put(str, pVar);
            }
            for (Map.Entry entry : map.entrySet()) {
                String str2 = (String) entry.getKey();
                p pVar2 = (p) entry.getValue();
                linkedHashMap.put(str2, pVar2.f96174b == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : pVar2.f96173a);
            }
        }
        return linkedHashMap;
    }

    public static boolean c(String str) {
        wm.c cVar = f98825c;
        if (cVar != null) {
            return cVar.a(str);
        }
        return false;
    }

    public static boolean d(String str, boolean z11) {
        wm.c cVar = f98825c;
        return cVar != null ? cVar.a(str) : z11;
    }

    public static double f(String str, double d5) {
        Double dValueOf;
        wm.c cVar = f98825c;
        if (cVar == null) {
            return d5;
        }
        j jVar = cVar.f94605h;
        xm.c cVar2 = jVar.f96141c;
        e eVarC = cVar2.c();
        Double dValueOf2 = null;
        if (eVarC == null) {
            dValueOf = null;
        } else {
            try {
                dValueOf = Double.valueOf(eVarC.f96110b.getDouble(str));
            } catch (JSONException unused) {
            }
        }
        if (dValueOf != null) {
            jVar.a(str, cVar2.c());
            return dValueOf.doubleValue();
        }
        e eVarC2 = jVar.f96142d.c();
        if (eVarC2 != null) {
            try {
                dValueOf2 = Double.valueOf(eVarC2.f96110b.getDouble(str));
            } catch (JSONException unused2) {
            }
        }
        if (dValueOf2 != null) {
            return dValueOf2.doubleValue();
        }
        j.d(str, "Double");
        return 0.0d;
    }

    public static int g(String str, int i5) {
        wm.c cVar = f98825c;
        int iB = (int) (cVar != null ? cVar.b(str) : i5);
        if (iB < 0) {
            return 0;
        }
        return iB;
    }

    public static String h(String str) {
        wm.c cVar = f98825c;
        return cVar != null ? cVar.c(str) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static void i(String str, Map map) {
        if (f98827e && f98829g.get()) {
            k(str, map);
            return;
        }
        ConcurrentLinkedQueue concurrentLinkedQueue = f98828f;
        if (concurrentLinkedQueue.size() < 100) {
            concurrentLinkedQueue.offer(new d(str, map != null ? MapsKt.s0(map) : null));
        }
    }

    public static void j(Throwable th2) {
        FirebaseCrashlytics firebaseCrashlytics = f98826d;
        if (firebaseCrashlytics != null) {
            firebaseCrashlytics.recordException(th2);
        }
    }

    public static void k(String str, Map map) {
        Bundle bundle = new Bundle();
        if (map != null) {
            for (Map.Entry entry : map.entrySet()) {
                String str2 = (String) entry.getKey();
                Object value = entry.getValue();
                if (value instanceof String) {
                    bundle.putString(str2, (String) value);
                } else if (value instanceof Long) {
                    bundle.putLong(str2, ((Number) value).longValue());
                } else if (value instanceof Double) {
                    bundle.putDouble(str2, ((Number) value).doubleValue());
                } else if (value instanceof Integer) {
                    bundle.putInt(str2, ((Number) value).intValue());
                } else if (value instanceof Boolean) {
                    bundle.putBoolean(str2, ((Boolean) value).booleanValue());
                }
            }
        }
        FirebaseAnalytics firebaseAnalytics = f98824b;
        if (firebaseAnalytics != null) {
            firebaseAnalytics.f34688a.w(str, bundle);
        }
    }

    public static void l(boolean z11, boolean z12, boolean z13, boolean z14) {
        FirebaseAnalytics firebaseAnalytics = f98824b;
        if (firebaseAnalytics != null) {
            xl.a aVar = xl.a.f96081b;
            xl.a aVar2 = xl.a.f96080a;
            xl.a aVar3 = z11 ? aVar2 : aVar;
            xl.b bVar = xl.b.f96084b;
            Pair pair = new Pair(bVar, aVar3);
            xl.a aVar4 = z12 ? aVar2 : aVar;
            xl.b bVar2 = xl.b.f96083a;
            Pair pair2 = new Pair(bVar2, aVar4);
            xl.a aVar5 = z13 ? aVar2 : aVar;
            xl.b bVar3 = xl.b.f96085c;
            Pair pair3 = new Pair(bVar3, aVar5);
            if (z14) {
                aVar = aVar2;
            }
            xl.b bVar4 = xl.b.f96086d;
            Map mapJ0 = MapsKt.j0(pair, pair2, pair3, new Pair(bVar4, aVar));
            Bundle bundle = new Bundle();
            xl.a aVar6 = (xl.a) mapJ0.get(bVar2);
            if (aVar6 != null) {
                int iOrdinal = aVar6.ordinal();
                if (iOrdinal == 0) {
                    bundle.putString("ad_storage", "granted");
                } else if (iOrdinal == 1) {
                    bundle.putString("ad_storage", "denied");
                }
            }
            xl.a aVar7 = (xl.a) mapJ0.get(bVar);
            if (aVar7 != null) {
                int iOrdinal2 = aVar7.ordinal();
                if (iOrdinal2 == 0) {
                    bundle.putString("analytics_storage", "granted");
                } else if (iOrdinal2 == 1) {
                    bundle.putString("analytics_storage", "denied");
                }
            }
            xl.a aVar8 = (xl.a) mapJ0.get(bVar3);
            if (aVar8 != null) {
                int iOrdinal3 = aVar8.ordinal();
                if (iOrdinal3 == 0) {
                    bundle.putString("ad_user_data", "granted");
                } else if (iOrdinal3 == 1) {
                    bundle.putString("ad_user_data", "denied");
                }
            }
            xl.a aVar9 = (xl.a) mapJ0.get(bVar4);
            if (aVar9 != null) {
                int iOrdinal4 = aVar9.ordinal();
                if (iOrdinal4 == 0) {
                    bundle.putString("ad_personalization", "granted");
                } else if (iOrdinal4 == 1) {
                    bundle.putString("ad_personalization", "denied");
                }
            }
            firebaseAnalytics.f34688a.G(bundle);
        }
    }

    public static void m(String str, String str2) {
        FirebaseAnalytics firebaseAnalytics = f98824b;
        if (firebaseAnalytics != null) {
            firebaseAnalytics.f34688a.z(null, str, str2, false);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        a aVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f98817v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f98817v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object objD = aVar.f98815t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f98817v;
        if (i11 == 0) {
            ResultKt.b(objD);
            if (((Boolean) f98830h.getValue()).booleanValue()) {
                return Unit.f71706a;
            }
            r0 r0Var = new r0(24);
            aVar.f98817v = 1;
            objD = p2.d(5000L, r0Var, aVar);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
        }
        if (((Boolean) objD) == null) {
            mc0.d.f76206a.n("awaitConfig timed out after 5s — proceeding with available defaults", new Object[0]);
            Unit unit = Unit.f71706a;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(String str, ContinuationImpl continuationImpl) {
        b bVar;
        c cVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f98822x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f98822x = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object obj = bVar.f98820v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f98822x;
        if (i11 == 0) {
            ResultKt.b(obj);
            bVar.f98818t = this;
            bVar.f98819u = str;
            bVar.f98822x = 1;
            if (a(bVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            cVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = bVar.f98819u;
            cVar = bVar.f98818t;
            ResultKt.b(obj);
        }
        cVar.getClass();
        return Boolean.valueOf(c(str));
    }
}
