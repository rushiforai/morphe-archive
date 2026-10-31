package ads_mobile_sdk;

import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import b.e6;
import b.fb;
import b.o2;
import b.t2;
import b.t7;
import c80.d;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.s1;

/* loaded from: classes2.dex */
public final class of1 {
    public final s1 A;
    public final AtomicBoolean B;
    public long C;

    /* renamed from: a, reason: collision with root package name */
    public final Context f7887a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f7888b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f7889c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f7890d;

    /* renamed from: e, reason: collision with root package name */
    public final b.w4 f7891e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f7892f;

    /* renamed from: g, reason: collision with root package name */
    public final kz2 f7893g;

    /* renamed from: h, reason: collision with root package name */
    public final aw f7894h;

    /* renamed from: i, reason: collision with root package name */
    public final sb f7895i;

    /* renamed from: j, reason: collision with root package name */
    public final ci3 f7896j;

    /* renamed from: k, reason: collision with root package name */
    public final e6 f7897k;

    /* renamed from: l, reason: collision with root package name */
    public final jr0 f7898l;

    /* renamed from: m, reason: collision with root package name */
    public final o2 f7899m;

    /* renamed from: p, reason: collision with root package name */
    public final sv2 f7900p;

    /* renamed from: r, reason: collision with root package name */
    public final e23 f7901r;

    /* renamed from: s, reason: collision with root package name */
    public final b41 f7902s;

    /* renamed from: t, reason: collision with root package name */
    public final b.w4 f7903t;

    /* renamed from: u, reason: collision with root package name */
    public final wj f7904u;

    /* renamed from: v, reason: collision with root package name */
    public final b.m5 f7905v;

    /* renamed from: w, reason: collision with root package name */
    public final b.w4 f7906w;

    /* renamed from: x, reason: collision with root package name */
    public final d f7907x;

    /* renamed from: y, reason: collision with root package name */
    public we1 f7908y;

    /* renamed from: z, reason: collision with root package name */
    public final s1 f7909z;

    public of1(Context context, t70.j0 backgroundScope, CoroutineContext backgroundContext, Set initializationTasks, b.w4 dependencyInjectors, Set postInitializationTasks, kz2 rootTraceCreator, aw concurrencyObjects, sb adapterInitializer, ci3 traceLogger, e6 httpClient, jr0 flags, o2 clock, b.w4 debugDialogManager, g0 activityTracker, sv2 requestConfigurationWrapper, b.w4 inspectorManager, e23 sdkCoreDataStore, b41 initializationConfigWrapper, b.w4 sdkCoreEngine, wj appState, b.m5 m5Var, b.w4 anrWatchdog) {
        Intrinsics.g(context, "context");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(backgroundContext, "backgroundContext");
        Intrinsics.g(initializationTasks, "initializationTasks");
        Intrinsics.g(dependencyInjectors, "dependencyInjectors");
        Intrinsics.g(postInitializationTasks, "postInitializationTasks");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(concurrencyObjects, "concurrencyObjects");
        Intrinsics.g(adapterInitializer, "adapterInitializer");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(debugDialogManager, "debugDialogManager");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(requestConfigurationWrapper, "requestConfigurationWrapper");
        Intrinsics.g(inspectorManager, "inspectorManager");
        Intrinsics.g(sdkCoreDataStore, "sdkCoreDataStore");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        Intrinsics.g(sdkCoreEngine, "sdkCoreEngine");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(anrWatchdog, "anrWatchdog");
        this.f7887a = context;
        this.f7888b = backgroundScope;
        this.f7889c = backgroundContext;
        this.f7890d = initializationTasks;
        this.f7891e = dependencyInjectors;
        this.f7892f = postInitializationTasks;
        this.f7893g = rootTraceCreator;
        this.f7894h = concurrencyObjects;
        this.f7895i = adapterInitializer;
        this.f7896j = traceLogger;
        this.f7897k = httpClient;
        this.f7898l = flags;
        this.f7899m = clock;
        this.f7900p = requestConfigurationWrapper;
        this.f7901r = sdkCoreDataStore;
        this.f7902s = initializationConfigWrapper;
        this.f7903t = sdkCoreEngine;
        this.f7904u = appState;
        this.f7905v = m5Var;
        this.f7906w = anrWatchdog;
        this.f7907x = new d();
        this.f7908y = we1.f11239a;
        this.f7909z = m0.c();
        this.A = m0.c();
        this.B = new AtomicBoolean(false);
        Duration.f72038b.getClass();
        this.C = 0L;
    }

    /* JADX WARN: Code restructure failed: missing block: B:131:0x0223, code lost:
    
        if (r0.K(r2) == r3) goto L132;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01da A[Catch: all -> 0x01e6, TryCatch #3 {all -> 0x01e6, blocks: (B:103:0x01d3, B:105:0x01da, B:107:0x01de, B:109:0x01e2, B:112:0x01e9, B:114:0x01ed, B:116:0x01f1, B:118:0x01f5, B:119:0x01f6, B:120:0x01fb, B:121:0x01fc, B:122:0x0203, B:123:0x0204, B:124:0x020b, B:125:0x020c), top: B:142:0x01d3 }] */
    /* JADX WARN: Removed duplicated region for block: B:125:0x020c A[Catch: all -> 0x01e6, TRY_LEAVE, TryCatch #3 {all -> 0x01e6, blocks: (B:103:0x01d3, B:105:0x01da, B:107:0x01de, B:109:0x01e2, B:112:0x01e9, B:114:0x01ed, B:116:0x01f1, B:118:0x01f5, B:119:0x01f6, B:120:0x01fb, B:121:0x01fc, B:122:0x0203, B:123:0x0204, B:124:0x020b, B:125:0x020c), top: B:142:0x01d3 }] */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0127  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0177 A[Catch: all -> 0x0183, TryCatch #2 {all -> 0x0183, blocks: (B:64:0x0170, B:66:0x0177, B:68:0x017b, B:70:0x017f, B:73:0x0186, B:75:0x018a, B:77:0x018e, B:79:0x0192, B:80:0x0193, B:81:0x0198, B:82:0x0199, B:83:0x01a0, B:84:0x01a1, B:85:0x01a8, B:86:0x01a9), top: B:141:0x0170 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01a9 A[Catch: all -> 0x0183, TRY_LEAVE, TryCatch #2 {all -> 0x0183, blocks: (B:64:0x0170, B:66:0x0177, B:68:0x017b, B:70:0x017f, B:73:0x0186, B:75:0x018a, B:77:0x018e, B:79:0x0192, B:80:0x0193, B:81:0x0198, B:82:0x0199, B:83:0x01a0, B:84:0x01a1, B:85:0x01a8, B:86:0x01a9), top: B:141:0x0170 }] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v30, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v36 */
    /* JADX WARN: Type inference failed for: r2v37 */
    /* JADX WARN: Type inference failed for: r4v0, types: [int] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v16, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r4v20 */
    /* JADX WARN: Type inference failed for: r4v21 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(pi.c cVar, ContinuationImpl continuationImpl) {
        ye1 ye1Var;
        Ref.BooleanRef booleanRef;
        pi.c cVar2;
        of1 of1Var;
        d dVar;
        pi.c cVar3;
        Ref.BooleanRef booleanRef2;
        th3 th3VarA;
        Closeable closeable;
        th3 th3Var;
        em2 em2VarA;
        Closeable closeable2;
        Object obj;
        ?? r22;
        if (continuationImpl instanceof ye1) {
            ye1Var = (ye1) continuationImpl;
            int i5 = ye1Var.f12020g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ye1Var.f12020g = i5 - Integer.MIN_VALUE;
            } else {
                ye1Var = new ye1(this, continuationImpl);
            }
        }
        Object obj2 = ye1Var.f12018e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r42 = ye1Var.f12020g;
        Continuation continuation = null;
        try {
            if (r42 == 0) {
                ResultKt.b(obj2);
                booleanRef = new Ref.BooleanRef();
                d dVar2 = this.f7907x;
                ye1Var.f12014a = this;
                cVar2 = cVar;
                ye1Var.f12015b = cVar2;
                ye1Var.f12016c = booleanRef;
                ye1Var.f12017d = dVar2;
                ye1Var.f12020g = 1;
                if (dVar2.e(ye1Var) != coroutineSingletons) {
                    of1Var = this;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (r42 == 1) {
                ?? r43 = ye1Var.f12017d;
                Ref.BooleanRef booleanRef3 = ye1Var.f12016c;
                pi.c cVar4 = (pi.c) ye1Var.f12015b;
                of1Var = (of1) ye1Var.f12014a;
                ResultKt.b(obj2);
                booleanRef = booleanRef3;
                cVar2 = cVar4;
                dVar = r43;
            } else {
                if (r42 == 2) {
                    Object obj3 = ye1Var.f12017d;
                    booleanRef2 = ye1Var.f12016c;
                    cVar3 = (pi.c) ye1Var.f12015b;
                    of1Var = (of1) ye1Var.f12014a;
                    ResultKt.b(obj2);
                    obj = obj3;
                    Duration.Companion companion = Duration.f72038b;
                    of1Var.f7899m.getClass();
                    of1Var.C = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
                    of1Var.f7899m.getClass();
                    t2.f15989f = System.currentTimeMillis();
                    of1Var.f7908y = we1.f11240b;
                    booleanRef = booleanRef2;
                    cVar2 = cVar3;
                    r42 = obj;
                    Unit unit = Unit.f71706a;
                    ((d) r42).g(null);
                    t70.j0 j0Var = of1Var.f7888b;
                    ar.a aVar = new ar.a(of1Var, cVar2, continuation, 16);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
                    if (booleanRef.f71859a) {
                        kz2 kz2Var = of1Var.f7893g;
                        wv0 wv0Var = wv0.CUI_NAME_SDKINIT;
                        EmptyList emptyList = EmptyList.f71733a;
                        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                        if (ji3.b().f4777a == null) {
                            em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                            try {
                                ye1Var.f12014a = em2VarA;
                                ye1Var.f12015b = em2VarA;
                                ye1Var.f12016c = null;
                                ye1Var.f12017d = null;
                                ye1Var.f12020g = 3;
                                if (of1Var.a(ye1Var) != coroutineSingletons) {
                                    em2 em2Var = em2VarA;
                                    closeable2 = em2Var;
                                    r22 = em2Var;
                                    Unit unit2 = Unit.f71706a;
                                    CloseableKt.a(closeable2, null);
                                    return Unit.f71706a;
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                closeable2 = em2VarA;
                                em2VarA.b(th);
                                if (!(th instanceof b.a4)) {
                                    throw th;
                                }
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    em2VarA.a(th);
                                }
                                if (th instanceof TimeoutCancellationException) {
                                    throw new lw0(th);
                                }
                                if (th instanceof CancellationException) {
                                    throw new du0(th);
                                }
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                        } else {
                            th3VarA = ji3.a(wv0Var, emptyList, true);
                            try {
                                ye1Var.f12014a = th3VarA;
                                ye1Var.f12015b = th3VarA;
                                ye1Var.f12016c = null;
                                ye1Var.f12017d = null;
                                ye1Var.f12020g = 4;
                                if (of1Var.a(ye1Var) != coroutineSingletons) {
                                    th3Var = th3VarA;
                                    closeable = th3Var;
                                    Unit unit3 = Unit.f71706a;
                                    CloseableKt.a(closeable, null);
                                    return Unit.f71706a;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                closeable = th3VarA;
                                th3VarA.b(th);
                                if (!(th instanceof b.a4)) {
                                    throw th;
                                }
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    th3VarA.a(th);
                                }
                                if (th instanceof TimeoutCancellationException) {
                                    throw new lw0(th);
                                }
                                if (th instanceof CancellationException) {
                                    throw new du0(th);
                                }
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                        }
                    } else {
                        s1 s1Var = of1Var.f7909z;
                        ye1Var.f12014a = null;
                        ye1Var.f12015b = null;
                        ye1Var.f12016c = null;
                        ye1Var.f12017d = null;
                        ye1Var.f12020g = 5;
                    }
                    return coroutineSingletons;
                }
                if (r42 == 3) {
                    closeable2 = (Closeable) ye1Var.f12015b;
                    r22 = (th3) ye1Var.f12014a;
                    try {
                        ResultKt.b(obj2);
                        r22 = r22;
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(closeable2, null);
                        return Unit.f71706a;
                    } catch (Throwable th4) {
                        th = th4;
                        em2VarA = r22;
                        try {
                            em2VarA.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        } finally {
                        }
                    }
                } else {
                    if (r42 != 4) {
                        if (r42 != 5) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj2);
                        return Unit.f71706a;
                    }
                    closeable = (Closeable) ye1Var.f12015b;
                    th3Var = (th3) ye1Var.f12014a;
                    try {
                        ResultKt.b(obj2);
                        Unit unit32 = Unit.f71706a;
                        CloseableKt.a(closeable, null);
                        return Unit.f71706a;
                    } catch (Throwable th5) {
                        th = th5;
                        th3VarA = th3Var;
                        try {
                            th3VarA.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        } finally {
                            try {
                                throw th;
                            } finally {
                            }
                        }
                    }
                }
            }
            we1 we1Var = of1Var.f7908y;
            if (we1Var != we1.f11240b && we1Var != we1.f11241c) {
                booleanRef.f71859a = true;
                sb sbVar = of1Var.f7895i;
                List list = sb.A;
                va vaVarH = fb.h(pi.a.f82595b, "The Google Mobile Ads SDK is still initializing.", 4);
                ye1Var.f12014a = of1Var;
                ye1Var.f12015b = cVar2;
                ye1Var.f12016c = booleanRef;
                ye1Var.f12017d = dVar;
                ye1Var.f12020g = 2;
                sbVar.getClass();
                if (sb.a(sbVar, vaVarH, ye1Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                cVar3 = cVar2;
                booleanRef2 = booleanRef;
                obj = dVar;
                Duration.Companion companion2 = Duration.f72038b;
                of1Var.f7899m.getClass();
                of1Var.C = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
                of1Var.f7899m.getClass();
                t2.f15989f = System.currentTimeMillis();
                of1Var.f7908y = we1.f11240b;
                booleanRef = booleanRef2;
                cVar2 = cVar3;
                r42 = obj;
                Unit unit4 = Unit.f71706a;
                ((d) r42).g(null);
                t70.j0 j0Var2 = of1Var.f7888b;
                ar.a aVar2 = new ar.a(of1Var, cVar2, continuation, 16);
                EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var2, "<this>");
                Intrinsics.g(context2, "context");
                m0.t(j0Var2, context2, null, new ar.a(aVar2, null), 2);
                if (booleanRef.f71859a) {
                }
                return coroutineSingletons;
            }
            mu0.c("MobileAds.initialize was called already, any different settings will be ignored.", null);
            r42 = dVar;
            Unit unit42 = Unit.f71706a;
            ((d) r42).g(null);
            t70.j0 j0Var22 = of1Var.f7888b;
            ar.a aVar22 = new ar.a(of1Var, cVar2, continuation, 16);
            EmptyCoroutineContext context22 = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var22, "<this>");
            Intrinsics.g(context22, "context");
            m0.t(j0Var22, context22, null, new ar.a(aVar22, null), 2);
            if (booleanRef.f71859a) {
            }
            return coroutineSingletons;
        } catch (Throwable th6) {
            ((d) r42).g(null);
            throw th6;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x00ce, code lost:
    
        if (ads_mobile_sdk.wj.a(r13, (kotlin.coroutines.jvm.internal.ContinuationImpl) r0) == r1) goto L62;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00bd A[Catch: all -> 0x0072, TRY_LEAVE, TryCatch #1 {all -> 0x0072, blocks: (B:33:0x006e, B:49:0x00b5, B:51:0x00bd, B:38:0x007a, B:46:0x00a5), top: B:107:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0137 A[Catch: all -> 0x003b, TRY_LEAVE, TryCatch #7 {all -> 0x003b, blocks: (B:16:0x0036, B:64:0x0131, B:66:0x0137), top: B:116:0x0036 }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0156 A[Catch: all -> 0x0162, TryCatch #3 {all -> 0x0162, blocks: (B:74:0x014f, B:76:0x0156, B:78:0x015a, B:80:0x015e, B:83:0x0164, B:85:0x0168, B:87:0x016c, B:89:0x0170, B:90:0x0171, B:91:0x0176, B:92:0x0177, B:93:0x017e, B:94:0x017f, B:95:0x0186, B:96:0x0187), top: B:111:0x014f, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0187 A[Catch: all -> 0x0162, TRY_LEAVE, TryCatch #3 {all -> 0x0162, blocks: (B:74:0x014f, B:76:0x0156, B:78:0x015a, B:80:0x015e, B:83:0x0164, B:85:0x0168, B:87:0x016c, B:89:0x0170, B:90:0x0171, B:91:0x0176, B:92:0x0177, B:93:0x017e, B:94:0x017f, B:95:0x0186, B:96:0x0187), top: B:111:0x014f, outer: #4 }] */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v11 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v15, types: [ads_mobile_sdk.of1] */
    /* JADX WARN: Type inference failed for: r0v17, types: [ads_mobile_sdk.of1] */
    /* JADX WARN: Type inference failed for: r0v2, types: [ads_mobile_sdk.ef1, kotlin.coroutines.Continuation, kotlin.coroutines.jvm.internal.ContinuationImpl] */
    /* JADX WARN: Type inference failed for: r0v20 */
    /* JADX WARN: Type inference failed for: r0v21 */
    /* JADX WARN: Type inference failed for: r0v22 */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5, types: [ads_mobile_sdk.of1] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r13v21, types: [b.e6] */
    /* JADX WARN: Type inference failed for: r13v27, types: [ads_mobile_sdk.ag, ads_mobile_sdk.c61] */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v17, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v22 */
    /* JADX WARN: Type inference failed for: r2v24 */
    /* JADX WARN: Type inference failed for: r2v25 */
    /* JADX WARN: Type inference failed for: r2v26 */
    /* JADX WARN: Type inference failed for: r2v27, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v3, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v31, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v32 */
    /* JADX WARN: Type inference failed for: r2v37 */
    /* JADX WARN: Type inference failed for: r2v38 */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v4, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r9v10 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v3, types: [ads_mobile_sdk.of1] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) throws Throwable {
        ?? ef1Var;
        Closeable closeable;
        ?? r22;
        ?? r92;
        th3 th3Var;
        th3 th3Var2;
        of1 of1Var;
        th3 th3Var3;
        of1 of1Var2;
        Closeable closeable2;
        ?? r13;
        th3 th3Var4;
        of1 of1Var3;
        Closeable closeable3;
        b.a1 a1Var;
        if (continuationImpl instanceof ef1) {
            ef1 ef1Var2 = (ef1) continuationImpl;
            int i5 = ef1Var2.f2862f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ef1Var2.f2862f = i5 - Integer.MIN_VALUE;
                ef1Var = ef1Var2;
            } else {
                ef1Var = new ef1(this, continuationImpl);
            }
        }
        Object objF = ef1Var.f2860d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r23 = ef1Var.f2862f;
        ?? r72 = 1;
        Continuation continuation = null;
        try {
            try {
                if (r23 == 0) {
                    ResultKt.b(objF);
                    try {
                        th3 th3VarA = ji3.a(wv0.CUI_NAME_SDKINIT_LOAD_FLAGS, EmptyList.f71733a, true);
                        try {
                            jr0 jr0Var = this.f7898l;
                            CoroutineContext coroutineContext = this.f7889c;
                            t70.j0 j0Var = this.f7888b;
                            ef1Var.f2857a = this;
                            ef1Var.f2858b = th3VarA;
                            ef1Var.f2859c = th3VarA;
                            ef1Var.f2862f = 1;
                            jr0Var.getClass();
                            if (jr0.a(jr0Var, coroutineContext, j0Var, ef1Var) != coroutineSingletons) {
                                r92 = this;
                                th3 th3Var5 = th3VarA;
                                th3Var = th3Var5;
                                th3Var2 = th3Var5;
                            }
                            return coroutineSingletons;
                        } catch (Throwable th2) {
                            closeable = th3VarA;
                            r22 = closeable;
                            th = th2;
                            ef1Var = this;
                            r22.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        ef1Var = this;
                        ef1Var.A.j0();
                        throw th;
                    }
                } else if (r23 == 1) {
                    ?? r24 = ef1Var.f2859c;
                    th3 th3Var6 = ef1Var.f2858b;
                    of1 of1Var4 = ef1Var.f2857a;
                    ResultKt.b(objF);
                    th3Var2 = r24;
                    th3Var = th3Var6;
                    r92 = of1Var4;
                } else {
                    if (r23 == 2) {
                        Closeable closeable4 = ef1Var.f2859c;
                        th3 th3Var7 = ef1Var.f2858b;
                        of1 of1Var5 = ef1Var.f2857a;
                        ResultKt.b(objF);
                        r23 = closeable4;
                        r72 = th3Var7;
                        of1Var = of1Var5;
                        if (of1Var.f7898l.O()) {
                            wj wjVar = of1Var.f7904u;
                            ef1Var.f2857a = of1Var;
                            ef1Var.f2858b = r72;
                            ef1Var.f2859c = r23;
                            ef1Var.f2862f = 3;
                            wjVar.getClass();
                        }
                        th3Var3 = r72;
                        of1Var2 = of1Var;
                        closeable2 = r23;
                        t70.j0 j0Var2 = of1Var2.f7888b;
                        a60.d dVar = new a60.d(of1Var2, continuation, 5);
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var2, "<this>");
                        Intrinsics.g(context, "context");
                        m0.t(j0Var2, context, null, new ar.a(dVar, null), 2);
                        jr0 flags = of1Var2.f7898l;
                        Intrinsics.g(flags, "flags");
                        fg.a.f55128a = flags;
                        r13 = of1Var2.f7897k;
                        ef1Var.f2857a = of1Var2;
                        ef1Var.f2858b = th3Var3;
                        ef1Var.f2859c = closeable2;
                        ef1Var.f2862f = 4;
                        if (r13.a(ef1Var) != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    }
                    if (r23 == 3) {
                        closeable2 = ef1Var.f2859c;
                        th3Var3 = ef1Var.f2858b;
                        of1Var2 = ef1Var.f2857a;
                        try {
                            ResultKt.b(objF);
                            closeable2 = closeable2;
                            t70.j0 j0Var22 = of1Var2.f7888b;
                            a60.d dVar2 = new a60.d(of1Var2, continuation, 5);
                            EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                            Intrinsics.g(j0Var22, "<this>");
                            Intrinsics.g(context2, "context");
                            m0.t(j0Var22, context2, null, new ar.a(dVar2, null), 2);
                            jr0 flags2 = of1Var2.f7898l;
                            Intrinsics.g(flags2, "flags");
                            fg.a.f55128a = flags2;
                            r13 = of1Var2.f7897k;
                            ef1Var.f2857a = of1Var2;
                            ef1Var.f2858b = th3Var3;
                            ef1Var.f2859c = closeable2;
                            ef1Var.f2862f = 4;
                            if (r13.a(ef1Var) != coroutineSingletons) {
                                th3Var4 = th3Var3;
                                of1Var3 = of1Var2;
                                closeable3 = closeable2;
                                of1Var3.f7896j.a(of1Var3.f7888b);
                                ?? r132 = (ag) of1Var3.f7906w.get();
                                ef1Var.f2857a = of1Var3;
                                ef1Var.f2858b = th3Var4;
                                ef1Var.f2859c = closeable3;
                                ef1Var.f2862f = 5;
                                objF = r132.f(ef1Var);
                                if (objF != coroutineSingletons) {
                                }
                            }
                            return coroutineSingletons;
                        } catch (Throwable th4) {
                            th = th4;
                            closeable = closeable2;
                            r22 = th3Var3;
                            ef1Var = of1Var2;
                            r22.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                    } else {
                        if (r23 == 4) {
                            closeable3 = ef1Var.f2859c;
                            th3Var4 = ef1Var.f2858b;
                            of1Var3 = ef1Var.f2857a;
                            try {
                                ResultKt.b(objF);
                                closeable3 = closeable3;
                                of1Var3.f7896j.a(of1Var3.f7888b);
                                ?? r1322 = (ag) of1Var3.f7906w.get();
                                ef1Var.f2857a = of1Var3;
                                ef1Var.f2858b = th3Var4;
                                ef1Var.f2859c = closeable3;
                                ef1Var.f2862f = 5;
                                objF = r1322.f(ef1Var);
                                if (objF != coroutineSingletons) {
                                    closeable = closeable3;
                                    r22 = th3Var4;
                                    ef1Var = of1Var3;
                                    a1Var = (b.a1) objF;
                                    if (a1Var instanceof pu0) {
                                    }
                                    CloseableKt.a(closeable, null);
                                    ef1Var.A.j0();
                                    return Unit.f71706a;
                                }
                                return coroutineSingletons;
                            } catch (Throwable th5) {
                                th = th5;
                                closeable = closeable3;
                                r22 = th3Var4;
                                ef1Var = of1Var3;
                                r22.b(th);
                                if (!(th instanceof b.a4)) {
                                    throw th;
                                }
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    r22.a(th);
                                }
                                if (th instanceof TimeoutCancellationException) {
                                    throw new lw0(th);
                                }
                                if (th instanceof CancellationException) {
                                    throw new du0(th);
                                }
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                        }
                        if (r23 != 5) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        closeable = ef1Var.f2859c;
                        r22 = ef1Var.f2858b;
                        ef1Var = ef1Var.f2857a;
                        try {
                            ResultKt.b(objF);
                            ef1Var = ef1Var;
                            r22 = r22;
                            a1Var = (b.a1) objF;
                            if (a1Var instanceof pu0) {
                                zi3.a((pu0) a1Var, false);
                            }
                            CloseableKt.a(closeable, null);
                            ef1Var.A.j0();
                            return Unit.f71706a;
                        } catch (Throwable th6) {
                            th = th6;
                            try {
                                r22.b(th);
                                if (!(th instanceof b.a4)) {
                                }
                            } finally {
                            }
                        }
                    }
                }
                ef1Var.f2857a = r92;
                ef1Var.f2858b = th3Var;
                ef1Var.f2859c = th3Var2;
                ef1Var.f2862f = 2;
                Object objC = r92.c(ef1Var);
                r23 = th3Var2;
                r72 = th3Var;
                of1Var = r92;
                if (objC != coroutineSingletons) {
                    if (of1Var.f7898l.O()) {
                    }
                    th3Var3 = r72;
                    of1Var2 = of1Var;
                    closeable2 = r23;
                    t70.j0 j0Var222 = of1Var2.f7888b;
                    a60.d dVar22 = new a60.d(of1Var2, continuation, 5);
                    EmptyCoroutineContext context22 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var222, "<this>");
                    Intrinsics.g(context22, "context");
                    m0.t(j0Var222, context22, null, new ar.a(dVar22, null), 2);
                    jr0 flags22 = of1Var2.f7898l;
                    Intrinsics.g(flags22, "flags");
                    fg.a.f55128a = flags22;
                    r13 = of1Var2.f7897k;
                    ef1Var.f2857a = of1Var2;
                    ef1Var.f2858b = th3Var3;
                    ef1Var.f2859c = closeable2;
                    ef1Var.f2862f = 4;
                    if (r13.a(ef1Var) != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th7) {
                th = th7;
                closeable = r23;
                r22 = r72;
                ef1Var = of1Var;
            }
        } catch (Throwable th8) {
            th = th8;
            ef1Var.A.j0();
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0080, code lost:
    
        if (ads_mobile_sdk.wj.a(r6, r0) == r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        lf1 lf1Var;
        of1 of1Var;
        if (continuationImpl instanceof lf1) {
            lf1Var = (lf1) continuationImpl;
            int i5 = lf1Var.f6229d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lf1Var.f6229d = i5 - Integer.MIN_VALUE;
            } else {
                lf1Var = new lf1(this, continuationImpl);
            }
        }
        Object objC = lf1Var.f6227b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lf1Var.f6229d;
        if (i11 == 0) {
            ResultKt.b(objC);
            lf1Var.f6226a = this;
            lf1Var.f6229d = 1;
            wj wjVar = this.f7904u;
            wjVar.getClass();
            objC = wj.c(wjVar, lf1Var);
            if (objC != coroutineSingletons) {
                of1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
            return Unit.f71706a;
        }
        of1Var = lf1Var.f6226a;
        ResultKt.b(objC);
        if (((Boolean) objC).booleanValue()) {
            ((wa3) of1Var.f7905v.get()).getClass();
            ((zj1) of1Var.f7903t.get()).getClass();
        }
        if (!of1Var.f7898l.O()) {
            return Unit.f71706a;
        }
        wj wjVar2 = of1Var.f7904u;
        lf1Var.f6226a = null;
        lf1Var.f6229d = 2;
        wjVar2.getClass();
    }

    /* JADX WARN: Code restructure failed: missing block: B:102:0x02d3, code lost:
    
        if (r2.a(r10, r5) != r6) goto L104;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x00a5, code lost:
    
        if (r1.K(r5) == r6) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00b3, code lost:
    
        if (r14.b(r5) == r6) goto L103;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00b7, code lost:
    
        r7 = r14;
     */
    /* JADX WARN: Removed duplicated region for block: B:100:0x02a3 A[LOOP:0: B:98:0x029d->B:100:0x02a3, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0091 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0253  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x026e  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0289  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        af1 af1Var;
        Iterator it;
        of1 of1Var;
        int i5;
        boolean z11;
        boolean z12;
        of1 of1Var2;
        Collection collection;
        Iterable iterable;
        Iterator it2;
        of1 of1Var3;
        Iterable iterable2;
        Iterator it3;
        jn jnVar = jn.a$15;
        if (continuationImpl instanceof af1) {
            af1Var = (af1) continuationImpl;
            int i11 = af1Var.f954e;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                af1Var.f954e = i11 - Integer.MIN_VALUE;
            } else {
                af1Var = new af1(this, continuationImpl);
            }
        }
        Object objF = af1Var.f952c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (af1Var.f954e) {
            case 0:
                ResultKt.b(objF);
                it = ((Set) this.f7891e.get()).iterator();
                of1Var = this;
                while (true) {
                    if (!it.hasNext()) {
                        t7 t7Var = (t7) it.next();
                        af1Var.f950a = of1Var;
                        af1Var.f951b = it;
                        af1Var.f954e = 1;
                        if (t7Var.a() == coroutineSingletons) {
                        }
                    } else if (!of1Var.B.compareAndSet(false, true)) {
                        s1 s1Var = of1Var.A;
                        af1Var.f950a = of1Var;
                        af1Var.f951b = null;
                        af1Var.f954e = 2;
                        break;
                    } else {
                        af1Var.f950a = of1Var;
                        af1Var.f951b = null;
                        af1Var.f954e = 3;
                        break;
                    }
                }
                return coroutineSingletons;
            case 1:
                it = (Iterator) af1Var.f951b;
                of1Var = af1Var.f950a;
                ResultKt.b(objF);
                while (true) {
                    if (!it.hasNext()) {
                    }
                }
                return coroutineSingletons;
            case 2:
            case 3:
                of1 of1Var4 = af1Var.f950a;
                ResultKt.b(objF);
                aw awVar = of1Var4.f7894h;
                t70.j0 j0Var = of1Var4.f7888b;
                jr0 flags = of1Var4.f7898l;
                awVar.getClass();
                i5 = 5;
                io.sentry.internal.debugmeta.c cVar = awVar.f1158g;
                b41 b41Var = awVar.f1152a;
                Intrinsics.g(flags, "flags");
                x7.u uVarA = b41Var.a();
                int iIntValue = uVarA != null ? ((Bundle) uVarA.f95210c).getInt("background_worker_threads", 0) : 0;
                x7.u uVarA2 = b41Var.a();
                int iIntValue2 = uVarA2 != null ? ((Bundle) uVarA2.f95210c).getInt("loader_worker_threads", 0) : 0;
                Boolean bool = Boolean.TRUE;
                jn jnVar2 = jn.a$10;
                if (!((Boolean) flags.a("gad:enable_custom_thread_pool_configuration", bool, jnVar2)).booleanValue() || iIntValue <= 0) {
                    iIntValue = ((Number) flags.a("gad:min_background_worker_threads", 10, jnVar)).intValue();
                }
                if (!((Boolean) flags.a("gad:enable_custom_thread_pool_configuration", bool, jnVar2)).booleanValue() || iIntValue2 <= 0) {
                    iIntValue2 = ((Number) flags.a("gad:min_loader_worker_threads", 5, jnVar)).intValue();
                }
                ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) awVar.f1156e.f67327a;
                int iMax = Math.max(2, Math.min(iIntValue2, Runtime.getRuntime().availableProcessors()));
                int i12 = aw.f1151k;
                t2.G(threadPoolExecutor, iMax, flags);
                ThreadPoolExecutor threadPoolExecutor2 = (ThreadPoolExecutor) awVar.f1153b.f67327a;
                int iMax2 = Math.max(2, Math.min(iIntValue, Runtime.getRuntime().availableProcessors()));
                int i13 = aw.f1151k;
                t2.G(threadPoolExecutor2, iMax2, flags);
                ThreadPoolExecutor threadPoolExecutor3 = (ThreadPoolExecutor) cVar.f67327a;
                int iMax3 = Math.max(2, Math.min(((Number) flags.a("gad:min_background_worker_threads", 10, jnVar)).intValue(), Runtime.getRuntime().availableProcessors()));
                int i14 = aw.f1151k;
                t2.G(threadPoolExecutor3, iMax3, flags);
                ((hh3) cVar.f67328b).f4389b = Integer.valueOf(((Number) flags.a("gads:webview_initialization_thread_priority_offset", 0, jnVar)).intValue());
                Set set = of1Var4.f7890d;
                ArrayList arrayList = new ArrayList();
                ArrayList arrayList2 = new ArrayList();
                for (Object obj : set) {
                    if (((d61) obj).f2191b) {
                        arrayList.add(obj);
                    } else {
                        arrayList2.add(obj);
                    }
                }
                ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
                Iterator it4 = arrayList.iterator();
                while (it4.hasNext()) {
                    arrayList3.add(m0.e(j0Var, null, new cf1((d61) it4.next(), null, 1), 3));
                }
                z11 = true;
                ArrayList arrayList4 = new ArrayList(b70.c.u0(arrayList2, 10));
                Iterator it5 = arrayList2.iterator();
                while (it5.hasNext()) {
                    arrayList4.add(m0.e(j0Var, null, new cf1((d61) it5.next(), null, 0), 3));
                }
                z12 = false;
                af1Var.f950a = of1Var4;
                af1Var.f951b = arrayList4;
                af1Var.f954e = 4;
                objF = m0.f(arrayList3, af1Var);
                if (objF != coroutineSingletons) {
                    of1Var2 = of1Var4;
                    collection = arrayList4;
                    iterable = (Iterable) objF;
                    if ((iterable instanceof Collection) || !((Collection) iterable).isEmpty()) {
                        it2 = iterable.iterator();
                        while (it2.hasNext()) {
                            if (((b.a1) it2.next()) instanceof pu0) {
                                of1Var3 = of1Var2;
                                for (b.c2 c2Var : of1Var3.f7892f) {
                                    t70.j0 j0Var2 = of1Var3.f7888b;
                                    a60.a aVar = new a60.a(c2Var, null, 2);
                                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                                    Intrinsics.g(j0Var2, "<this>");
                                    Intrinsics.g(context, "context");
                                    m0.t(j0Var2, context, null, new ar.a(aVar, null), 2);
                                }
                                af1Var.f950a = null;
                                af1Var.f951b = null;
                                af1Var.f954e = 6;
                                break;
                            }
                        }
                    }
                    af1Var.f950a = of1Var2;
                    af1Var.f951b = null;
                    af1Var.f954e = i5;
                    objF = m0.f(collection, af1Var);
                    if (objF != coroutineSingletons) {
                        of1Var3 = of1Var2;
                        iterable2 = (Iterable) objF;
                        if ((iterable2 instanceof Collection) || !((Collection) iterable2).isEmpty()) {
                            it3 = iterable2.iterator();
                            while (it3.hasNext()) {
                                if (((b.a1) it3.next()) instanceof pu0) {
                                    of1Var2 = of1Var3;
                                    of1Var3 = of1Var2;
                                    while (r1.hasNext()) {
                                    }
                                    af1Var.f950a = null;
                                    af1Var.f951b = null;
                                    af1Var.f954e = 6;
                                }
                            }
                        }
                        z12 = z11;
                        while (r1.hasNext()) {
                        }
                        af1Var.f950a = null;
                        af1Var.f951b = null;
                        af1Var.f954e = 6;
                    }
                }
                return coroutineSingletons;
            case 4:
                Collection collection2 = (List) af1Var.f951b;
                of1Var2 = af1Var.f950a;
                ResultKt.b(objF);
                z11 = true;
                z12 = false;
                i5 = 5;
                collection = collection2;
                iterable = (Iterable) objF;
                if (iterable instanceof Collection) {
                    break;
                }
                it2 = iterable.iterator();
                while (it2.hasNext()) {
                }
                af1Var.f950a = of1Var2;
                af1Var.f951b = null;
                af1Var.f954e = i5;
                objF = m0.f(collection, af1Var);
                if (objF != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                of1Var3 = af1Var.f950a;
                ResultKt.b(objF);
                z11 = true;
                z12 = false;
                iterable2 = (Iterable) objF;
                if (iterable2 instanceof Collection) {
                    break;
                }
                it3 = iterable2.iterator();
                while (it3.hasNext()) {
                }
                z12 = z11;
                while (r1.hasNext()) {
                }
                af1Var.f950a = null;
                af1Var.f951b = null;
                af1Var.f954e = 6;
                break;
            case 6:
                ResultKt.b(objF);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v10, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        hf1 hf1Var;
        d dVar;
        of1 of1Var;
        Throwable th2;
        c80.a aVar;
        va vaVarE;
        of1 of1Var2;
        if (continuationImpl instanceof hf1) {
            hf1Var = (hf1) continuationImpl;
            int i5 = hf1Var.f4377f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hf1Var.f4377f = i5 - Integer.MIN_VALUE;
            } else {
                hf1Var = new hf1(this, continuationImpl);
            }
        }
        Object obj = hf1Var.f4375d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hf1Var.f4377f;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                hf1Var.f4372a = this;
                dVar = this.f7907x;
                hf1Var.f4373b = dVar;
                hf1Var.f4374c = z11;
                hf1Var.f4377f = 1;
                if (dVar.e(hf1Var) != coroutineSingletons) {
                    of1Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = hf1Var.f4373b;
                of1Var2 = hf1Var.f4372a;
                try {
                    ResultKt.b(obj);
                    Unit unit = Unit.f71706a;
                    ((d) aVar).g(null);
                    t70.j0 j0Var = of1Var2.f7888b;
                    androidx.room.c cVar = new androidx.room.c(of1Var2, continuation, 8);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(cVar, null), 2);
                    of1Var2.f7899m.getClass();
                    t2.f15990g = System.currentTimeMillis();
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((d) aVar).g(null);
                    throw th2;
                }
            }
            z11 = hf1Var.f4374c;
            ?? r22 = hf1Var.f4373b;
            of1Var = hf1Var.f4372a;
            ResultKt.b(obj);
            dVar = r22;
            of1Var.f7908y = we1.f11241c;
            Duration.Companion companion = Duration.f72038b;
            of1Var.f7899m.getClass();
            long jL = Duration.l(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), of1Var.C);
            of1Var.f7909z.j0();
            int iH = (int) Duration.h(jL);
            sb sbVar = of1Var.f7895i;
            if (z11) {
                List list = sb.A;
                vaVarE = fb.e(pi.a.f82596c, "The Google Mobile Ads SDK has successfully initialized.", iH);
            } else {
                List list2 = sb.A;
                vaVarE = fb.e(pi.a.f82598e, "The Google Mobile Ads SDK has failed to initialize. Ad loading may be impacted.", iH);
            }
            hf1Var.f4372a = of1Var;
            hf1Var.f4373b = dVar;
            hf1Var.f4377f = 2;
            sbVar.getClass();
            if (sb.a(sbVar, vaVarE, hf1Var) != coroutineSingletons) {
                aVar = dVar;
                of1Var2 = of1Var;
                Unit unit2 = Unit.f71706a;
                ((d) aVar).g(null);
                t70.j0 j0Var2 = of1Var2.f7888b;
                androidx.room.c cVar2 = new androidx.room.c(of1Var2, continuation, 8);
                EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var2, "<this>");
                Intrinsics.g(context2, "context");
                m0.t(j0Var2, context2, null, new ar.a(cVar2, null), 2);
                of1Var2.f7899m.getClass();
                t2.f15990g = System.currentTimeMillis();
                return unit2;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            d dVar2 = dVar;
            th2 = th4;
            aVar = dVar2;
            ((d) aVar).g(null);
            throw th2;
        }
    }

    public final void a(Function1 function1) {
        b00.e eVar = new b00.e(this, function1, (Continuation) null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f7888b;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(eVar, null), 2);
    }
}
