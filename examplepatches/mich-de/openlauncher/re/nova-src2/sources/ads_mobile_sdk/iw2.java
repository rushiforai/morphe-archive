package ads_mobile_sdk;

import android.os.SystemClock;
import b.k9;
import b.o2;
import c80.d;
import java.util.HashSet;
import java.util.LinkedHashMap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes2.dex */
public final class iw2 {

    /* renamed from: a, reason: collision with root package name */
    public final o2 f4985a;

    /* renamed from: b, reason: collision with root package name */
    public final d f4986b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f4987c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f4988d;

    /* renamed from: e, reason: collision with root package name */
    public final HashSet f4989e;

    public iw2(o2 clock) {
        Intrinsics.g(clock, "clock");
        this.f4985a = clock;
        this.f4986b = new d();
        this.f4987c = new LinkedHashMap();
        this.f4988d = new LinkedHashMap();
        this.f4989e = new HashSet();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Enum a(iw2 iw2Var, String str, qw2 qw2Var, ContinuationImpl continuationImpl) {
        cw2 cw2Var;
        String strA;
        d dVar;
        if (continuationImpl instanceof cw2) {
            cw2Var = (cw2) continuationImpl;
            int i5 = cw2Var.f2087f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cw2Var.f2087f = i5 - Integer.MIN_VALUE;
            } else {
                cw2Var = new cw2(iw2Var, continuationImpl);
            }
        }
        Object obj = cw2Var.f2085d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cw2Var.f2087f;
        if (i11 == 0) {
            ResultKt.b(obj);
            iw2Var.getClass();
            strA = a(qw2Var, str);
            if (strA == null) {
                return im0.f4866c;
            }
            dVar = iw2Var.f4986b;
            cw2Var.f2082a = iw2Var;
            cw2Var.f2083b = strA;
            cw2Var.f2084c = dVar;
            cw2Var.f2087f = 1;
            if (dVar.e(cw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = cw2Var.f2084c;
            strA = cw2Var.f2083b;
            iw2 iw2Var2 = cw2Var.f2082a;
            ResultKt.b(obj);
            dVar = dVar2;
            iw2Var = iw2Var2;
        }
        try {
            jh3 jh3Var = (jh3) iw2Var.f4988d.get(strA);
            im0 im0Var = jh3Var != null ? jh3Var.f5243e : im0.f4866c;
            dVar.g(null);
            return im0Var;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(iw2 iw2Var, String str, qw2 qw2Var, ContinuationImpl continuationImpl) {
        dw2 dw2Var;
        String strA;
        d dVar;
        if (continuationImpl instanceof dw2) {
            dw2Var = (dw2) continuationImpl;
            int i5 = dw2Var.f2664f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dw2Var.f2664f = i5 - Integer.MIN_VALUE;
            } else {
                dw2Var = new dw2(iw2Var, continuationImpl);
            }
        }
        Object obj = dw2Var.f2662d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dw2Var.f2664f;
        if (i11 == 0) {
            ResultKt.b(obj);
            strA = a(qw2Var, str);
            if (strA == null) {
                return Boolean.FALSE;
            }
            dVar = iw2Var.f4986b;
            dw2Var.f2659a = iw2Var;
            dw2Var.f2660b = strA;
            dw2Var.f2661c = dVar;
            dw2Var.f2664f = 1;
            if (dVar.e(dw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = dw2Var.f2661c;
            strA = dw2Var.f2660b;
            iw2 iw2Var2 = dw2Var.f2659a;
            ResultKt.b(obj);
            dVar = dVar2;
            iw2Var = iw2Var2;
        }
        try {
            return Boolean.valueOf(iw2Var.f4988d.containsKey(strA));
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(iw2 iw2Var, String str, qw2 qw2Var, ContinuationImpl continuationImpl) {
        ew2 ew2Var;
        String strA;
        iw2 iw2Var2;
        d dVar;
        if (continuationImpl instanceof ew2) {
            ew2Var = (ew2) continuationImpl;
            int i5 = ew2Var.f3081f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ew2Var.f3081f = i5 - Integer.MIN_VALUE;
            } else {
                ew2Var = new ew2(iw2Var, continuationImpl);
            }
        }
        Object obj = ew2Var.f3079d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ew2Var.f3081f;
        if (i11 == 0) {
            ResultKt.b(obj);
            iw2Var.getClass();
            strA = a(qw2Var, str);
            if (strA == null) {
                return Unit.f71706a;
            }
            d dVar2 = iw2Var.f4986b;
            ew2Var.f3076a = iw2Var;
            ew2Var.f3077b = strA;
            ew2Var.f3078c = dVar2;
            ew2Var.f3081f = 1;
            if (dVar2.e(ew2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            iw2Var2 = iw2Var;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = ew2Var.f3078c;
            strA = ew2Var.f3077b;
            iw2Var2 = ew2Var.f3076a;
            ResultKt.b(obj);
        }
        try {
            iw2Var2.f4987c.remove(strA);
            iw2Var2.f4989e.remove(strA);
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(iw2 iw2Var, String str, qw2 qw2Var, ContinuationImpl continuationImpl) {
        fw2 fw2Var;
        String strA;
        d dVar;
        Integer num;
        if (continuationImpl instanceof fw2) {
            fw2Var = (fw2) continuationImpl;
            int i5 = fw2Var.f3534f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fw2Var.f3534f = i5 - Integer.MIN_VALUE;
            } else {
                fw2Var = new fw2(iw2Var, continuationImpl);
            }
        }
        Object obj = fw2Var.f3532d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fw2Var.f3534f;
        if (i11 == 0) {
            ResultKt.b(obj);
            iw2Var.getClass();
            strA = a(qw2Var, str);
            if (strA == null) {
                return Unit.f71706a;
            }
            dVar = iw2Var.f4986b;
            fw2Var.f3529a = iw2Var;
            fw2Var.f3530b = strA;
            fw2Var.f3531c = dVar;
            fw2Var.f3534f = 1;
            if (dVar.e(fw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = fw2Var.f3531c;
            strA = fw2Var.f3530b;
            iw2 iw2Var2 = fw2Var.f3529a;
            ResultKt.b(obj);
            dVar = dVar2;
            iw2Var = iw2Var2;
        }
        try {
            jh3 jh3Var = (jh3) iw2Var.f4988d.get(strA);
            if (jh3Var == null) {
                return Unit.f71706a;
            }
            int iIntValue = jh3Var.f5239a;
            if (iw2Var.f4989e.contains(strA) && (num = jh3Var.f5240b) != null) {
                iIntValue = num.intValue();
            }
            if (iIntValue < 0) {
                iIntValue = 0;
            }
            if (iIntValue <= 0) {
                return Unit.f71706a;
            }
            LinkedHashMap linkedHashMap = iw2Var.f4987c;
            Object arrayDeque = linkedHashMap.get(strA);
            if (arrayDeque == null) {
                arrayDeque = new ArrayDeque();
                linkedHashMap.put(strA, arrayDeque);
            }
            ArrayDeque arrayDeque2 = (ArrayDeque) arrayDeque;
            iw2Var.f4985a.getClass();
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            arrayDeque2.addLast(new Long(jElapsedRealtime));
            long jH = jElapsedRealtime - Duration.h(jh3Var.f5241c);
            while (!arrayDeque2.isEmpty() && (arrayDeque2.f71724c > iIntValue || ((Number) arrayDeque2.first()).longValue() < jH)) {
                b70.d.F0(arrayDeque2);
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Comparable e(iw2 iw2Var, String str, qw2 qw2Var, ContinuationImpl continuationImpl) {
        gw2 gw2Var;
        String strA;
        d dVar;
        Integer num;
        if (continuationImpl instanceof gw2) {
            gw2Var = (gw2) continuationImpl;
            int i5 = gw2Var.f4108f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gw2Var.f4108f = i5 - Integer.MIN_VALUE;
            } else {
                gw2Var = new gw2(iw2Var, continuationImpl);
            }
        }
        Object obj = gw2Var.f4106d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gw2Var.f4108f;
        if (i11 == 0) {
            ResultKt.b(obj);
            strA = a(qw2Var, str);
            if (strA == null) {
                Duration.f72038b.getClass();
                return new Duration(0L);
            }
            dVar = iw2Var.f4986b;
            gw2Var.f4103a = iw2Var;
            gw2Var.f4104b = strA;
            gw2Var.f4105c = dVar;
            gw2Var.f4108f = 1;
            if (dVar.e(gw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = gw2Var.f4105c;
            strA = gw2Var.f4104b;
            iw2 iw2Var2 = gw2Var.f4103a;
            ResultKt.b(obj);
            dVar = dVar2;
            iw2Var = iw2Var2;
        }
        try {
            LinkedHashMap linkedHashMap = iw2Var.f4987c;
            HashSet hashSet = iw2Var.f4989e;
            ArrayDeque arrayDeque = (ArrayDeque) linkedHashMap.get(strA);
            if (arrayDeque != null && !arrayDeque.isEmpty()) {
                jh3 jh3Var = (jh3) iw2Var.f4988d.get(strA);
                if (jh3Var == null) {
                    Duration.f72038b.getClass();
                    return new Duration(0L);
                }
                int iIntValue = jh3Var.f5239a;
                if (hashSet.contains(strA) && (num = jh3Var.f5240b) != null) {
                    iIntValue = num.intValue();
                }
                if (iIntValue < 0) {
                    iIntValue = 0;
                }
                iw2Var.f4985a.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime() - Duration.h(jh3Var.f5241c);
                while (!arrayDeque.isEmpty() && (arrayDeque.f71724c > iIntValue || ((Number) arrayDeque.first()).longValue() < jElapsedRealtime)) {
                    b70.d.F0(arrayDeque);
                }
                if (iIntValue <= 0 || arrayDeque.f71724c < iIntValue) {
                    Duration.f72038b.getClass();
                    return new Duration(0L);
                }
                hashSet.add(strA);
                return new Duration(jh3Var.f5242d);
            }
            Duration.f72038b.getClass();
            return new Duration(0L);
        } finally {
            dVar.g(null);
        }
    }

    public static String a(qw2 qw2Var, String str) {
        if (str == null || str.length() == 0 || qw2Var == null) {
            return null;
        }
        return qw2Var + "#" + str;
    }

    public final Comparable b(qw2 qw2Var, String str, l32 l32Var) {
        return e(this, str, qw2Var, l32Var);
    }

    public final Object a(qw2 qw2Var, String str, l32 l32Var) {
        return b(this, str, qw2Var, l32Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(iw2 iw2Var, com.google.gson.r rVar, String str, qw2 qw2Var, ContinuationImpl continuationImpl) {
        hw2 hw2Var;
        String strA;
        d dVar;
        if (continuationImpl instanceof hw2) {
            hw2Var = (hw2) continuationImpl;
            int i5 = hw2Var.f4575g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hw2Var.f4575g = i5 - Integer.MIN_VALUE;
            } else {
                hw2Var = new hw2(iw2Var, continuationImpl);
            }
        }
        Object obj = hw2Var.f4573e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hw2Var.f4575g;
        if (i11 == 0) {
            ResultKt.b(obj);
            iw2Var.getClass();
            strA = a(qw2Var, str);
            if (strA == null) {
                return Unit.f71706a;
            }
            dVar = iw2Var.f4986b;
            hw2Var.f4569a = iw2Var;
            hw2Var.f4570b = rVar;
            hw2Var.f4571c = strA;
            hw2Var.f4572d = dVar;
            hw2Var.f4575g = 1;
            if (dVar.e(hw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = hw2Var.f4572d;
            String str2 = hw2Var.f4571c;
            com.google.gson.r rVar2 = hw2Var.f4570b;
            iw2 iw2Var2 = hw2Var.f4569a;
            ResultKt.b(obj);
            dVar = dVar2;
            iw2Var = iw2Var2;
            strA = str2;
            rVar = rVar2;
        }
        try {
            jh3 jh3VarG = k9.g(rVar);
            if (jh3VarG == null) {
                iw2Var.f4988d.remove(strA);
            } else {
                iw2Var.f4988d.put(strA, jh3VarG);
                Unit unit = Unit.f71706a;
            }
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
