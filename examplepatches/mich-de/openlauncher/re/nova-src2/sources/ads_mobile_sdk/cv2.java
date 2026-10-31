package ads_mobile_sdk;

import android.os.Bundle;
import android.os.SystemClock;
import b.o;
import b.o2;
import c80.d;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import ni.w;
import t70.m0;

/* loaded from: classes.dex */
public final class cv2 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f2039a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f2040b;

    /* renamed from: c, reason: collision with root package name */
    public final jx2 f2041c;

    /* renamed from: d, reason: collision with root package name */
    public final zm1 f2042d;

    /* renamed from: e, reason: collision with root package name */
    public final o f2043e;

    /* renamed from: f, reason: collision with root package name */
    public final i8 f2044f;

    /* renamed from: g, reason: collision with root package name */
    public final int f2045g;

    /* renamed from: h, reason: collision with root package name */
    public long f2046h;

    /* renamed from: i, reason: collision with root package name */
    public d33 f2047i;

    /* renamed from: j, reason: collision with root package name */
    public final d f2048j;

    /* renamed from: k, reason: collision with root package name */
    public uu2[] f2049k;

    public cv2(t70.j0 backgroundScope, o2 clock, jx2 retryingUrlPinger, zm1 macroExpander, o internalAdLoadEventEmitter, i8 adSourceResponseInfoCollector, int i5) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(retryingUrlPinger, "retryingUrlPinger");
        Intrinsics.g(macroExpander, "macroExpander");
        Intrinsics.g(internalAdLoadEventEmitter, "internalAdLoadEventEmitter");
        Intrinsics.g(adSourceResponseInfoCollector, "adSourceResponseInfoCollector");
        this.f2039a = backgroundScope;
        this.f2040b = clock;
        this.f2041c = retryingUrlPinger;
        this.f2042d = macroExpander;
        this.f2043e = internalAdLoadEventEmitter;
        this.f2044f = adSourceResponseInfoCollector;
        this.f2045g = i5;
        Duration.f72038b.getClass();
        this.f2046h = 0L;
        this.f2048j = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(cv2 cv2Var, ContinuationImpl continuationImpl) {
        vu2 vu2Var;
        d dVar;
        if (continuationImpl instanceof vu2) {
            vu2Var = (vu2) continuationImpl;
            int i5 = vu2Var.f10904e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vu2Var.f10904e = i5 - Integer.MIN_VALUE;
            } else {
                vu2Var = new vu2(cv2Var, continuationImpl);
            }
        }
        Object obj = vu2Var.f10902c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vu2Var.f10904e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = cv2Var.f2048j;
            vu2Var.f10900a = cv2Var;
            vu2Var.f10901b = dVar;
            vu2Var.f10904e = 1;
            if (dVar.e(vu2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = vu2Var.f10901b;
            cv2 cv2Var2 = vu2Var.f10900a;
            ResultKt.b(obj);
            dVar = dVar2;
            cv2Var = cv2Var2;
        }
        try {
            uu2[] uu2VarArr = cv2Var.f2049k;
            if (uu2VarArr == null) {
                Intrinsics.m("results");
                throw null;
            }
            List listV0 = kotlin.collections.c.v0(uu2VarArr);
            dVar.g(null);
            return b70.g.f1(listV0, "_", null, null, 0, null, 62);
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00b8 A[Catch: all -> 0x00c3, TryCatch #0 {all -> 0x00c3, blocks: (B:29:0x00b4, B:31:0x00b8, B:33:0x00bc, B:35:0x00c0, B:39:0x00c8, B:45:0x00d4, B:42:0x00cd), top: B:91:0x00b4 }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0195  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01af  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) throws Throwable {
        wu2 wu2Var;
        cv2 cv2Var;
        Object obj;
        cv2 cv2Var2;
        long j11;
        Object obj2;
        Object obj3;
        uu2[] uu2VarArr;
        uu2 uu2Var;
        z1 z1Var;
        d33 d33Var;
        z1 z1Var2;
        cv2 cv2Var3;
        long j12;
        if (continuationImpl instanceof wu2) {
            wu2Var = (wu2) continuationImpl;
            int i5 = wu2Var.f11419f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wu2Var.f11419f = i5 - Integer.MIN_VALUE;
            } else {
                wu2Var = new wu2(this, continuationImpl);
            }
        }
        Object obj4 = wu2Var.f11417d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wu2Var.f11419f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj4);
                wu2Var.f11414a = this;
                d dVar = this.f2048j;
                wu2Var.f11415b = dVar;
                wu2Var.f11419f = 1;
                if (dVar.e(wu2Var) != coroutineSingletons) {
                    cv2Var = this;
                    obj = dVar;
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                Object obj5 = (c80.a) wu2Var.f11415b;
                cv2Var = wu2Var.f11414a;
                ResultKt.b(obj4);
                obj = obj5;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        if (i11 != 4) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        j12 = wu2Var.f11416c;
                        z1Var2 = (z1) wu2Var.f11415b;
                        cv2Var3 = wu2Var.f11414a;
                        ResultKt.b(obj4);
                        cv2Var3.a(b70.g.t1(z1Var2.f12375e, z1Var2.D), z1Var2, j12);
                        return Unit.f71706a;
                    }
                    long j13 = wu2Var.f11416c;
                    z1 z1Var3 = (z1) wu2Var.f11415b;
                    cv2 cv2Var4 = wu2Var.f11414a;
                    ResultKt.b(obj4);
                    z1Var = z1Var3;
                    j11 = j13;
                    cv2Var2 = cv2Var4;
                    o oVar = cv2Var2.f2043e;
                    d33Var = cv2Var2.f2047i;
                    if (d33Var == null) {
                        i8 i8Var = cv2Var2.f2044f;
                        ni.l lVar = i8Var.f4661e;
                        String adapterClassName = lVar != null ? lVar.getAdapterClassName() : null;
                        String str = i8Var.f4658b;
                        Bundle bundleA = i8Var.a(null);
                        ni.l lVar2 = i8Var.f4661e;
                        List adapterResponses = i8Var.f4662f;
                        Intrinsics.f(adapterResponses, "adapterResponses");
                        ni.g0 g0Var = new ni.g0(adapterClassName, str, bundleA, lVar2, adapterResponses);
                        wu2Var.f11414a = cv2Var2;
                        wu2Var.f11415b = z1Var;
                        wu2Var.f11416c = j11;
                        wu2Var.f11419f = 4;
                        if (oVar.a(d33Var, z1Var, g0Var, wu2Var) != coroutineSingletons) {
                            z1Var2 = z1Var;
                            cv2Var3 = cv2Var2;
                            j12 = j11;
                            cv2Var3.a(b70.g.t1(z1Var2.f12375e, z1Var2.D), z1Var2, j12);
                            return Unit.f71706a;
                        }
                        return coroutineSingletons;
                    }
                    Intrinsics.m("serverTransaction");
                    throw null;
                }
                j11 = wu2Var.f11416c;
                Object obj6 = (c80.a) wu2Var.f11415b;
                cv2Var2 = wu2Var.f11414a;
                ResultKt.b(obj4);
                obj2 = obj6;
                try {
                    uu2VarArr = cv2Var2.f2049k;
                    if (uu2VarArr == null) {
                        int length = uu2VarArr.length;
                        int i12 = 0;
                        while (true) {
                            if (i12 >= length) {
                                uu2Var = null;
                                break;
                            }
                            uu2Var = uu2VarArr[i12];
                            if ((uu2Var != null ? uu2Var.f10489b : null) == km0.f5781c) {
                                break;
                            }
                            i12++;
                        }
                        z1Var = uu2Var != null ? uu2Var.f10488a : null;
                        ((d) obj2).g(null);
                        if (z1Var != null) {
                            String str2 = z1Var.f12376e0;
                            String str3 = z1Var.f12373d;
                            i8 i8Var2 = cv2Var2.f2044f;
                            i8Var2.getClass();
                            Map map = i8Var2.f4663g;
                            if (((ni.l) map.get(str3)) != null) {
                                ni.l lVar3 = (ni.l) map.get(str3);
                                i8Var2.f4661e = lVar3;
                                int iIndexOf = i8Var2.f4662f.indexOf(lVar3);
                                List adapterResponses2 = i8Var2.f4662f;
                                Intrinsics.f(adapterResponses2, "adapterResponses");
                                i8Var2.f4662f = b70.g.B1(adapterResponses2, new IntRange(0, iIndexOf, 1));
                                jr0 jr0Var = i8Var2.f4657a;
                                jr0Var.getClass();
                                if (((Boolean) jr0Var.a("gads:multicall_response_id_fix:enabled", Boolean.TRUE, jn.a$10)).booleanValue() && !r70.k.U0(str2)) {
                                    i8Var2.f4658b = str2;
                                }
                                i8Var2.f4660d = z1Var.C0;
                            }
                            wu2Var.f11414a = cv2Var2;
                            wu2Var.f11415b = z1Var;
                            wu2Var.f11416c = j11;
                            wu2Var.f11419f = 3;
                            if (cv2Var2.a(j11, z1Var, wu2Var) != coroutineSingletons) {
                                o oVar2 = cv2Var2.f2043e;
                                d33Var = cv2Var2.f2047i;
                                if (d33Var == null) {
                                }
                            }
                            return coroutineSingletons;
                        }
                        d33 d33Var2 = cv2Var2.f2047i;
                        if (d33Var2 != null) {
                            cv2Var2.a(d33Var2.f2166b.f12428b.f4559m, (z1) null, j11);
                            return Unit.f71706a;
                        }
                        Intrinsics.m("serverTransaction");
                        throw null;
                    }
                    obj3 = null;
                    try {
                        Intrinsics.m("results");
                        throw null;
                    } catch (Throwable th2) {
                        th = th2;
                        ((d) obj2).g(obj3);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    obj3 = null;
                }
            }
            Duration.Companion companion = Duration.f72038b;
            cv2Var.f2040b.getClass();
            long jL = Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), cv2Var.f2046h);
            ((d) obj).g(null);
            d dVar2 = cv2Var.f2048j;
            wu2Var.f11414a = cv2Var;
            wu2Var.f11415b = dVar2;
            wu2Var.f11416c = jL;
            wu2Var.f11419f = 2;
            if (dVar2.e(wu2Var) != coroutineSingletons) {
                cv2Var2 = cv2Var;
                j11 = jL;
                obj2 = dVar2;
                uu2VarArr = cv2Var2.f2049k;
                if (uu2VarArr == null) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            ((d) obj).g(null);
            throw th4;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(d33 transaction, ContinuationImpl continuationImpl) {
        xu2 xu2Var;
        d dVar;
        cv2 cv2Var;
        if (continuationImpl instanceof xu2) {
            xu2Var = (xu2) continuationImpl;
            int i5 = xu2Var.f11843f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xu2Var.f11843f = i5 - Integer.MIN_VALUE;
            } else {
                xu2Var = new xu2(this, continuationImpl);
            }
        }
        Object obj = xu2Var.f11841d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xu2Var.f11843f;
        if (i11 == 0) {
            ResultKt.b(obj);
            this.f2047i = transaction;
            Duration.Companion companion = Duration.f72038b;
            this.f2040b.getClass();
            this.f2046h = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
            i8 i8Var = this.f2044f;
            i8Var.getClass();
            Map map = i8Var.f4663g;
            Intrinsics.g(transaction, "transaction");
            z23 z23Var = transaction.f2166b;
            hv hvVar = z23Var.f12428b;
            ArrayList arrayList = z23Var.f12427a;
            i8Var.f4659c = hvVar;
            jr0 jr0Var = i8Var.f4657a;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:multicall_response_id_fix:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                if (i8Var.f4658b == null) {
                    z1 z1Var = (z1) b70.g.Y0(arrayList);
                    i8Var.f4658b = z1Var != null ? z1Var.f12376e0 : null;
                }
            } else {
                z1 z1Var2 = (z1) b70.g.Y0(arrayList);
                i8Var.f4658b = z1Var2 != null ? z1Var2.f12376e0 : null;
            }
            String str = z23Var.f12428b.f4547a;
            if (!r70.k.U0(str)) {
                if (map.containsKey(str)) {
                    int iIndexOf = i8Var.f4662f.indexOf((ni.l) map.get(str));
                    i8Var.f4662f.remove(iIndexOf);
                    map.remove(str);
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        i8Var.a((z1) it.next(), iIndexOf);
                        iIndexOf++;
                    }
                }
            } else {
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    i8Var.a((z1) it2.next(), i8Var.f4662f.size());
                }
            }
            xu2Var.f11838a = this;
            xu2Var.f11839b = transaction;
            dVar = this.f2048j;
            xu2Var.f11840c = dVar;
            xu2Var.f11843f = 1;
            if (dVar.e(xu2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            cv2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = xu2Var.f11840c;
            d33 d33Var = xu2Var.f11839b;
            cv2Var = xu2Var.f11838a;
            ResultKt.b(obj);
            dVar = dVar2;
            transaction = d33Var;
        }
        try {
            cv2Var.f2049k = new uu2[transaction.f2166b.f12427a.size()];
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    public final void a(ArrayList arrayList, z1 z1Var, long j11) {
        d33 d33Var = this.f2047i;
        if (d33Var == null) {
            Intrinsics.m("serverTransaction");
            throw null;
        }
        if (d33Var.f2167c) {
            return;
        }
        yu2 yu2Var = new yu2(this, arrayList, z1Var, j11, null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f2039a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(yu2Var, null), 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b.a1 a1Var, z1 adConfiguration, long j11, ContinuationImpl continuationImpl) {
        zu2 zu2Var;
        d dVar;
        km0 km0Var;
        long j12;
        z1 z1Var;
        Integer num;
        cv2 cv2Var;
        w wVar;
        b.a1 renderResult = a1Var;
        if (continuationImpl instanceof zu2) {
            zu2Var = (zu2) continuationImpl;
            int i5 = zu2Var.f12680j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zu2Var.f12680j = i5 - Integer.MIN_VALUE;
            } else {
                zu2Var = new zu2(this, continuationImpl);
            }
        }
        Object obj = zu2Var.f12678h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zu2Var.f12680j;
        if (i11 == 0) {
            ResultKt.b(obj);
            i8 i8Var = this.f2044f;
            i8Var.getClass();
            Intrinsics.g(adConfiguration, "adConfiguration");
            Intrinsics.g(renderResult, "renderResult");
            if (renderResult instanceof xu0) {
                i8Var.a(adConfiguration, j11, null);
            } else if (renderResult instanceof su0) {
                i8Var.a(adConfiguration, j11, ((su0) renderResult).f9692c);
            } else if (renderResult instanceof pu0) {
                int i12 = ((pu0) renderResult).a().a().f78337a;
                sl0 sl0Var = sl0.f9598b;
                i8Var.a(adConfiguration, j11, new w(i12, "Internal error.", "com.google.android.libraries.ads.mobile.sdk"));
            }
            km0.f5780b.getClass();
            km0 km0VarB = lm.e.b(renderResult);
            su0 su0Var = renderResult instanceof su0 ? (su0) renderResult : null;
            Integer numB0 = (su0Var == null || (wVar = su0Var.f9692c) == null) ? null : wVar.b0();
            zu2Var.f12671a = this;
            zu2Var.f12672b = renderResult;
            zu2Var.f12673c = adConfiguration;
            zu2Var.f12674d = km0VarB;
            zu2Var.f12675e = numB0;
            dVar = this.f2048j;
            zu2Var.f12676f = dVar;
            zu2Var.f12677g = j11;
            zu2Var.f12680j = 1;
            if (dVar.e(zu2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            km0Var = km0VarB;
            j12 = j11;
            z1Var = adConfiguration;
            num = numB0;
            cv2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j13 = zu2Var.f12677g;
            d dVar2 = zu2Var.f12676f;
            Integer num2 = zu2Var.f12675e;
            km0 km0Var2 = zu2Var.f12674d;
            z1 z1Var2 = zu2Var.f12673c;
            b.a1 a1Var2 = zu2Var.f12672b;
            cv2 cv2Var2 = zu2Var.f12671a;
            ResultKt.b(obj);
            cv2Var = cv2Var2;
            j12 = j13;
            z1Var = z1Var2;
            num = num2;
            km0Var = km0Var2;
            dVar = dVar2;
            renderResult = a1Var2;
        }
        try {
            uu2[] uu2VarArr = cv2Var.f2049k;
            if (uu2VarArr != null) {
                uu2VarArr[z1Var.f12409w] = new uu2(z1Var, km0Var, j12, num);
                Unit unit = Unit.f71706a;
                dVar.g(null);
                if (renderResult instanceof pu0) {
                    Duration.Companion companion = Duration.f72038b;
                    cv2Var.f2040b.getClass();
                    cv2Var.a(z1Var.R, z1Var, Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), cv2Var.f2046h));
                }
                return unit;
            }
            Intrinsics.m("results");
            throw null;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(z1 z1Var, ContinuationImpl continuationImpl) {
        av2 av2Var;
        cv2 cv2Var;
        z1 z1Var2;
        d dVar;
        if (continuationImpl instanceof av2) {
            av2Var = (av2) continuationImpl;
            int i5 = av2Var.f1149f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                av2Var.f1149f = i5 - Integer.MIN_VALUE;
            } else {
                av2Var = new av2(this, continuationImpl);
            }
        }
        Object obj = av2Var.f1147d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = av2Var.f1149f;
        if (i11 == 0) {
            ResultKt.b(obj);
            av2Var.f1144a = this;
            av2Var.f1145b = z1Var;
            d dVar2 = this.f2048j;
            av2Var.f1146c = dVar2;
            av2Var.f1149f = 1;
            if (dVar2.e(av2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            cv2Var = this;
            z1Var2 = z1Var;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = av2Var.f1146c;
            z1 z1Var3 = av2Var.f1145b;
            cv2Var = av2Var.f1144a;
            ResultKt.b(obj);
            z1Var2 = z1Var3;
        }
        try {
            uu2[] uu2VarArr = cv2Var.f2049k;
            if (uu2VarArr != null) {
                int i12 = z1Var2.f12409w;
                lm.e eVar = km0.f5780b;
                Duration.f72038b.getClass();
                uu2VarArr[i12] = new uu2(z1Var2, km0.f5789k, 0L, null);
                return Unit.f71706a;
            }
            Intrinsics.m("results");
            throw null;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, z1 z1Var, ContinuationImpl continuationImpl) {
        bv2 bv2Var;
        d dVar;
        cv2 cv2Var;
        if (continuationImpl instanceof bv2) {
            bv2Var = (bv2) continuationImpl;
            int i5 = bv2Var.f1586g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bv2Var.f1586g = i5 - Integer.MIN_VALUE;
            } else {
                bv2Var = new bv2(this, continuationImpl);
            }
        }
        Object obj = bv2Var.f1584e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bv2Var.f1586g;
        if (i11 == 0) {
            ResultKt.b(obj);
            bv2Var.f1580a = this;
            bv2Var.f1581b = z1Var;
            dVar = this.f2048j;
            bv2Var.f1582c = dVar;
            bv2Var.f1583d = j11;
            bv2Var.f1586g = 1;
            if (dVar.e(bv2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            cv2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = bv2Var.f1583d;
            d dVar2 = bv2Var.f1582c;
            z1 z1Var2 = bv2Var.f1581b;
            cv2Var = bv2Var.f1580a;
            ResultKt.b(obj);
            dVar = dVar2;
            z1Var = z1Var2;
        }
        try {
            uu2[] uu2VarArr = cv2Var.f2049k;
            if (uu2VarArr != null) {
                int length = uu2VarArr.length;
                for (int i12 = z1Var.f12409w + 1; i12 < length; i12++) {
                    uu2[] uu2VarArr2 = cv2Var.f2049k;
                    if (uu2VarArr2 != null) {
                        uu2 uu2Var = uu2VarArr2[i12];
                        if ((uu2Var != null ? uu2Var.f10489b : null) == km0.f5781c) {
                            uu2Var.f10489b = km0.f5788j;
                            z1 z1Var3 = uu2Var.f10488a;
                            cv2Var.a(z1Var3.R, z1Var3, j11);
                        }
                    } else {
                        Intrinsics.m("results");
                        throw null;
                    }
                }
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return unit;
            }
            Intrinsics.m("results");
            throw null;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
