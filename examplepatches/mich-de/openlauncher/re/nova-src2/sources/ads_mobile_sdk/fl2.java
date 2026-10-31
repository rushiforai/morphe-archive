package ads_mobile_sdk;

import b.c0;
import b.ed;
import b.k9;
import b.o2;
import b.x;
import b4.i;
import c80.d;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import ni.a0;
import t70.m0;
import t70.s1;
import t70.t0;
import t70.x1;
import ui.o;

/* loaded from: classes.dex */
public final class fl2 extends c61 implements b.db, x {
    public final LinkedHashMap A;
    public final LinkedHashMap B;
    public final LinkedHashMap C;
    public final LinkedHashMap D;
    public boolean E;
    public final LinkedHashMap F;
    public boolean G;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f3405c;

    /* renamed from: d, reason: collision with root package name */
    public final ci3 f3406d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f3407e;

    /* renamed from: f, reason: collision with root package name */
    public final o2 f3408f;

    /* renamed from: g, reason: collision with root package name */
    public final jr0 f3409g;

    /* renamed from: h, reason: collision with root package name */
    public final b.m6 f3410h;

    /* renamed from: i, reason: collision with root package name */
    public final cb0 f3411i;

    /* renamed from: j, reason: collision with root package name */
    public final cb0 f3412j;

    /* renamed from: k, reason: collision with root package name */
    public final cb0 f3413k;

    /* renamed from: l, reason: collision with root package name */
    public final cb0 f3414l;

    /* renamed from: m, reason: collision with root package name */
    public final cb0 f3415m;
    public final q43 o;

    /* renamed from: p, reason: collision with root package name */
    public final d f3416p;

    /* renamed from: q, reason: collision with root package name */
    public x1 f3417q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f3418r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f3419s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f3420t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f3421u;

    /* renamed from: v, reason: collision with root package name */
    public long f3422v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f3423w;

    /* renamed from: x, reason: collision with root package name */
    public long f3424x;

    /* renamed from: y, reason: collision with root package name */
    public final LinkedHashMap f3425y;

    /* renamed from: z, reason: collision with root package name */
    public final LinkedHashMap f3426z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fl2(t70.j0 backgroundScope, ci3 traceLogger, kz2 rootTraceCreator, o2 clock, jr0 flags, b.m6 randomGenerator, cb0 appOpenComponentProvider, cb0 bannerComponentProvider, cb0 interstitialComponentProvider, cb0 nativeComponentProvider, cb0 rewardedComponentProvider, cb0 cb0Var, q43 sharedSettingsDataStore) {
        super((wv0) null, 3);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(randomGenerator, "randomGenerator");
        Intrinsics.g(appOpenComponentProvider, "appOpenComponentProvider");
        Intrinsics.g(bannerComponentProvider, "bannerComponentProvider");
        Intrinsics.g(interstitialComponentProvider, "interstitialComponentProvider");
        Intrinsics.g(nativeComponentProvider, "nativeComponentProvider");
        Intrinsics.g(rewardedComponentProvider, "rewardedComponentProvider");
        Intrinsics.g(sharedSettingsDataStore, "sharedSettingsDataStore");
        this.f3405c = backgroundScope;
        this.f3406d = traceLogger;
        this.f3407e = rootTraceCreator;
        this.f3408f = clock;
        this.f3409g = flags;
        this.f3410h = randomGenerator;
        this.f3411i = appOpenComponentProvider;
        this.f3412j = bannerComponentProvider;
        this.f3413k = interstitialComponentProvider;
        this.f3414l = nativeComponentProvider;
        this.f3415m = rewardedComponentProvider;
        this.o = sharedSettingsDataStore;
        this.f3416p = new d();
        s1 s1VarC = m0.c();
        s1VarC.j0();
        this.f3417q = s1VarC;
        this.f3418r = true;
        this.f3419s = true;
        this.f3420t = true;
        this.f3421u = true;
        Duration.f72038b.getClass();
        this.f3422v = 0L;
        this.f3423w = true;
        this.f3424x = 0L;
        this.f3425y = new LinkedHashMap();
        this.f3426z = new LinkedHashMap();
        this.A = new LinkedHashMap();
        this.B = new LinkedHashMap();
        this.C = new LinkedHashMap();
        this.D = new LinkedHashMap();
        this.F = new LinkedHashMap();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Path cross not found for [B:34:0x00d7, B:69:0x017d], limit reached: 169 */
    /* JADX WARN: Path cross not found for [B:69:0x017d, B:34:0x00d7], limit reached: 169 */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0272 A[Catch: all -> 0x024c, TRY_LEAVE, TryCatch #7 {all -> 0x024c, blocks: (B:93:0x0239, B:95:0x0240, B:97:0x0244, B:99:0x0248, B:102:0x024f, B:104:0x0253, B:106:0x0257, B:108:0x025b, B:109:0x025c, B:110:0x0261, B:111:0x0262, B:112:0x0269, B:113:0x026a, B:114:0x0271, B:115:0x0272), top: B:178:0x0239 }] */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02b3 A[Catch: all -> 0x02bf, TryCatch #9 {all -> 0x02bf, blocks: (B:129:0x02ac, B:131:0x02b3, B:133:0x02b7, B:135:0x02bb, B:138:0x02c2, B:140:0x02c6, B:142:0x02ca, B:144:0x02ce, B:145:0x02cf, B:146:0x02d4, B:147:0x02d5, B:148:0x02dc, B:149:0x02dd, B:150:0x02e4, B:151:0x02e5), top: B:181:0x02ac }] */
    /* JADX WARN: Removed duplicated region for block: B:151:0x02e5 A[Catch: all -> 0x02bf, TRY_LEAVE, TryCatch #9 {all -> 0x02bf, blocks: (B:129:0x02ac, B:131:0x02b3, B:133:0x02b7, B:135:0x02bb, B:138:0x02c2, B:140:0x02c6, B:142:0x02ca, B:144:0x02ce, B:145:0x02cf, B:146:0x02d4, B:147:0x02d5, B:148:0x02dc, B:149:0x02dd, B:150:0x02e4, B:151:0x02e5), top: B:181:0x02ac }] */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0045 A[PHI: r0 r2 r14 r15
      0x0045: PHI (r0v21 ads_mobile_sdk.sj2) = (r0v2 ads_mobile_sdk.sj2), (r0v27 ads_mobile_sdk.sj2) binds: [B:14:0x003a, B:58:0x0156] A[DONT_GENERATE, DONT_INLINE]
      0x0045: PHI (r2v29 ads_mobile_sdk.fl2) = (r2v17 ads_mobile_sdk.fl2), (r2v31 ads_mobile_sdk.fl2) binds: [B:14:0x003a, B:58:0x0156] A[DONT_GENERATE, DONT_INLINE]
      0x0045: PHI (r14v45 java.util.List) = (r14v18 java.util.List), (r14v47 java.util.List) binds: [B:14:0x003a, B:58:0x0156] A[DONT_GENERATE, DONT_INLINE]
      0x0045: PHI (r15v45 java.lang.Object) = (r15v1 java.lang.Object), (r15v50 java.lang.Object) binds: [B:14:0x003a, B:58:0x0156] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:179:0x010f A[EXC_TOP_SPLITTER, PHI: r0 r5 r14 r15
      0x010f: PHI (r0v29 ads_mobile_sdk.sj2) = (r0v2 ads_mobile_sdk.sj2), (r0v31 ads_mobile_sdk.sj2) binds: [B:31:0x00b6, B:42:0x010b] A[DONT_GENERATE, DONT_INLINE]
      0x010f: PHI (r5v13 ads_mobile_sdk.fl2) = (r5v2 ads_mobile_sdk.fl2), (r5v14 ads_mobile_sdk.fl2) binds: [B:31:0x00b6, B:42:0x010b] A[DONT_GENERATE, DONT_INLINE]
      0x010f: PHI (r14v49 c80.a) = (r14v67 c80.a), (r14v68 c80.a) binds: [B:31:0x00b6, B:42:0x010b] A[DONT_GENERATE, DONT_INLINE]
      0x010f: PHI (r15v57 java.util.ArrayList) = (r15v2 java.util.ArrayList), (r15v61 java.util.ArrayList) binds: [B:31:0x00b6, B:42:0x010b] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0164  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01a6 A[PHI: r0 r5 r15
      0x01a6: PHI (r0v20 ads_mobile_sdk.sj2) = (r0v28 ads_mobile_sdk.sj2), (r0v29 ads_mobile_sdk.sj2) binds: [B:53:0x0135, B:46:0x0116] A[DONT_GENERATE, DONT_INLINE]
      0x01a6: PHI (r5v9 ads_mobile_sdk.fl2) = (r5v12 ads_mobile_sdk.fl2), (r5v13 ads_mobile_sdk.fl2) binds: [B:53:0x0135, B:46:0x0116] A[DONT_GENERATE, DONT_INLINE]
      0x01a6: PHI (r15v43 java.util.ArrayList) = (r15v56 java.util.ArrayList), (r15v57 java.util.ArrayList) binds: [B:53:0x0135, B:46:0x0116] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0240 A[Catch: all -> 0x024c, TryCatch #7 {all -> 0x024c, blocks: (B:93:0x0239, B:95:0x0240, B:97:0x0244, B:99:0x0248, B:102:0x024f, B:104:0x0253, B:106:0x0257, B:108:0x025b, B:109:0x025c, B:110:0x0261, B:111:0x0262, B:112:0x0269, B:113:0x026a, B:114:0x0271, B:115:0x0272), top: B:178:0x0239 }] */
    /* JADX WARN: Type inference failed for: r2v18, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v21, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v25 */
    /* JADX WARN: Type inference failed for: r2v27 */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v43 */
    /* JADX WARN: Type inference failed for: r2v45 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:68:0x017b -> B:34:0x00d7). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:70:0x01a2 -> B:34:0x00d7). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(fl2 fl2Var, ContinuationImpl continuationImpl) {
        sj2 sj2Var;
        c80.a aVar;
        fl2 fl2Var2;
        ArrayList arrayListB;
        List list;
        fl2 fl2Var3;
        List list2;
        fl2 fl2Var4;
        int iIntValue;
        int i5;
        cc2 cc2Var;
        Closeable closeable;
        Closeable closeable2;
        cc2 cc2Var2;
        Closeable closeable3;
        Closeable closeable4;
        TimeoutCancellationException timeoutCancellationException;
        ?? r22;
        TimeoutCancellationException timeoutCancellationException2;
        ?? r23;
        Object objA;
        Object obj;
        c80.a aVar2;
        Object objE;
        if (continuationImpl instanceof sj2) {
            sj2Var = (sj2) continuationImpl;
            int i11 = sj2Var.f9585h;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                sj2Var.f9585h = i11 - Integer.MIN_VALUE;
            } else {
                sj2Var = new sj2(fl2Var, continuationImpl);
            }
        }
        Object objK = sj2Var.f9583f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (sj2Var.f9585h) {
            case 0:
                ResultKt.b(objK);
                if (m0.q(sj2Var.getContext())) {
                    d dVar = fl2Var.f3416p;
                    sj2Var.f9578a = fl2Var;
                    sj2Var.f9579b = dVar;
                    sj2Var.f9585h = 1;
                    if (dVar.e(sj2Var) != coroutineSingletons) {
                        fl2Var2 = fl2Var;
                        aVar = dVar;
                        try {
                            arrayListB = fl2Var2.b();
                            ((d) aVar).g(null);
                            d dVar2 = fl2Var2.f3416p;
                            sj2Var.f9578a = fl2Var2;
                            sj2Var.f9579b = arrayListB;
                            sj2Var.f9580c = dVar2;
                            sj2Var.f9585h = 2;
                            objE = dVar2.e(sj2Var);
                            aVar2 = dVar2;
                            if (objE != coroutineSingletons) {
                                try {
                                    if (fl2Var2.E) {
                                        sj2Var.f9578a = fl2Var2;
                                        sj2Var.f9579b = arrayListB;
                                        sj2Var.f9580c = null;
                                        sj2Var.f9585h = 3;
                                        Object objB = fl2Var2.b(arrayListB, (f5) null, sj2Var);
                                        if (objB != coroutineSingletons) {
                                            ArrayList arrayList = arrayListB;
                                            objK = objB;
                                            list = arrayList;
                                            fl2Var3 = fl2Var2;
                                            if (((Boolean) objK).booleanValue()) {
                                                arrayListB = list;
                                                fl2Var2 = fl2Var3;
                                                sj2Var.f9578a = fl2Var2;
                                                sj2Var.f9579b = arrayListB;
                                                sj2Var.f9580c = null;
                                                sj2Var.f9585h = 4;
                                                objA = fl2Var2.a(arrayListB, sj2Var);
                                                if (objA != coroutineSingletons) {
                                                    fl2Var4 = fl2Var2;
                                                    list2 = arrayListB;
                                                    objK = objA;
                                                    iIntValue = ((Number) objK).intValue();
                                                    sj2Var.f9578a = fl2Var4;
                                                    sj2Var.f9579b = list2;
                                                    sj2Var.f9581d = iIntValue;
                                                    sj2Var.f9582e = iIntValue;
                                                    sj2Var.f9585h = 5;
                                                    objK = fl2Var4.k(sj2Var);
                                                    if (objK != coroutineSingletons) {
                                                        i5 = iIntValue;
                                                        sj2 sj2Var2 = sj2Var;
                                                        List list3 = list2;
                                                        fl2 fl2Var5 = fl2Var4;
                                                        if (iIntValue >= ((Number) objK).intValue()) {
                                                            kz2 kz2Var = fl2Var5.f3407e;
                                                            wv0 wv0Var = wv0.CUI_NAME_CENTRALIZED_MANAGER_LIMIT_REACHED;
                                                            EmptyList emptyList = EmptyList.f71733a;
                                                            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                                                            if (ji3.b().f4777a == null) {
                                                                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                                                                try {
                                                                    cc2 cc2VarE = ji3.a().e();
                                                                    sj2Var2.f9578a = em2VarA;
                                                                    sj2Var2.f9579b = em2VarA;
                                                                    sj2Var2.f9580c = cc2VarE;
                                                                    sj2Var2.f9585h = 6;
                                                                    Object objA2 = fl2Var5.a((f5) null, list3, i5, (Integer) null, (Boolean) null, sj2Var2);
                                                                    if (objA2 != coroutineSingletons) {
                                                                        closeable = em2VarA;
                                                                        closeable2 = closeable;
                                                                        cc2Var = cc2VarE;
                                                                        objK = objA2;
                                                                        cc2Var.L = (vr) objK;
                                                                        Unit unit = Unit.f71706a;
                                                                        CloseableKt.a(closeable, null);
                                                                    }
                                                                } catch (Throwable th2) {
                                                                    closeable = em2VarA;
                                                                    r23 = closeable;
                                                                    timeoutCancellationException2 = th2;
                                                                    try {
                                                                        r23.b(timeoutCancellationException2);
                                                                        if (!(timeoutCancellationException2 instanceof b.a4)) {
                                                                        }
                                                                    } finally {
                                                                    }
                                                                }
                                                            } else {
                                                                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                                                                try {
                                                                    cc2 cc2VarE2 = ji3.a().e();
                                                                    sj2Var2.f9578a = th3VarA;
                                                                    sj2Var2.f9579b = th3VarA;
                                                                    sj2Var2.f9580c = cc2VarE2;
                                                                    sj2Var2.f9585h = 7;
                                                                    Object objA3 = fl2Var5.a((f5) null, list3, i5, (Integer) null, (Boolean) null, sj2Var2);
                                                                    if (objA3 != coroutineSingletons) {
                                                                        closeable3 = th3VarA;
                                                                        closeable4 = closeable3;
                                                                        cc2Var2 = cc2VarE2;
                                                                        objK = objA3;
                                                                        cc2Var2.L = (vr) objK;
                                                                        Unit unit2 = Unit.f71706a;
                                                                        CloseableKt.a(closeable3, null);
                                                                    }
                                                                } catch (Throwable th3) {
                                                                    closeable3 = th3VarA;
                                                                    r22 = closeable3;
                                                                    timeoutCancellationException = th3;
                                                                    try {
                                                                        r22.b(timeoutCancellationException);
                                                                        if (!(timeoutCancellationException instanceof b.a4)) {
                                                                            throw timeoutCancellationException;
                                                                        }
                                                                        if (!(timeoutCancellationException instanceof TimeoutCancellationException) && !(timeoutCancellationException instanceof CancellationException)) {
                                                                            r22.a(timeoutCancellationException);
                                                                        }
                                                                        if (timeoutCancellationException instanceof TimeoutCancellationException) {
                                                                            throw new lw0(timeoutCancellationException);
                                                                        }
                                                                        if (timeoutCancellationException instanceof CancellationException) {
                                                                            throw new du0(timeoutCancellationException);
                                                                        }
                                                                        if (timeoutCancellationException instanceof dv0) {
                                                                            throw timeoutCancellationException;
                                                                        }
                                                                        throw new iu0(timeoutCancellationException);
                                                                    } finally {
                                                                        try {
                                                                            throw th;
                                                                        } finally {
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            } else {
                                                sj2Var.f9578a = fl2Var3;
                                                sj2Var.f9579b = list;
                                                sj2Var.f9585h = 8;
                                                objK = fl2Var3.b(list, sj2Var);
                                                if (objK != coroutineSingletons) {
                                                    sj2Var.f9578a = fl2Var3;
                                                    sj2Var.f9579b = list;
                                                    sj2Var.f9585h = 9;
                                                    objK = fl2Var3.b(list, (f5) objK, sj2Var);
                                                    if (objK != coroutineSingletons) {
                                                        obj = objK;
                                                        List list4 = list;
                                                        fl2Var = fl2Var3;
                                                        sj2 sj2Var3 = sj2Var;
                                                        if (((Boolean) obj).booleanValue()) {
                                                            sj2Var3.f9578a = fl2Var;
                                                            sj2Var3.f9579b = null;
                                                            sj2Var3.f9585h = 10;
                                                            objK = fl2Var.c(list4, (f5) null, sj2Var3);
                                                            if (objK != coroutineSingletons) {
                                                                sj2Var = sj2Var3;
                                                                if (!((Boolean) objK).booleanValue()) {
                                                                    jr0 jr0Var = fl2Var.f3409g;
                                                                    jr0Var.getClass();
                                                                    Duration.Companion companion = Duration.f72038b;
                                                                    long j11 = ((Duration) jr0Var.a("gads:centralized_preload_manager:next_ad_delay", ed.k(5000, DurationUnit.f72045d, "gads:centralized_preload_manager:next_ad_delay"), u.a$1)).f72041a;
                                                                    sj2Var.f9578a = fl2Var;
                                                                    sj2Var.f9585h = 11;
                                                                    if (t0.c(j11, sj2Var) != coroutineSingletons) {
                                                                    }
                                                                }
                                                                if (m0.q(sj2Var.getContext())) {
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        sj2Var.f9578a = fl2Var2;
                                        sj2Var.f9579b = arrayListB;
                                        sj2Var.f9580c = null;
                                        sj2Var.f9585h = 4;
                                        objA = fl2Var2.a(arrayListB, sj2Var);
                                        if (objA != coroutineSingletons) {
                                        }
                                    }
                                } finally {
                                }
                            }
                        } finally {
                        }
                    }
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            case 1:
                aVar = (c80.a) sj2Var.f9579b;
                fl2 fl2Var6 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                fl2Var2 = fl2Var6;
                arrayListB = fl2Var2.b();
                ((d) aVar).g(null);
                d dVar22 = fl2Var2.f3416p;
                sj2Var.f9578a = fl2Var2;
                sj2Var.f9579b = arrayListB;
                sj2Var.f9580c = dVar22;
                sj2Var.f9585h = 2;
                objE = dVar22.e(sj2Var);
                aVar2 = dVar22;
                if (objE != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 2:
                c80.a aVar3 = (c80.a) sj2Var.f9580c;
                ?? r24 = (List) sj2Var.f9579b;
                fl2Var2 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                arrayListB = r24;
                aVar2 = aVar3;
                if (fl2Var2.E) {
                }
                return coroutineSingletons;
            case 3:
                list = (List) sj2Var.f9579b;
                fl2Var3 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                if (((Boolean) objK).booleanValue()) {
                }
                break;
            case 4:
                List list5 = (List) sj2Var.f9579b;
                fl2 fl2Var7 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                list2 = list5;
                fl2Var4 = fl2Var7;
                iIntValue = ((Number) objK).intValue();
                sj2Var.f9578a = fl2Var4;
                sj2Var.f9579b = list2;
                sj2Var.f9581d = iIntValue;
                sj2Var.f9582e = iIntValue;
                sj2Var.f9585h = 5;
                objK = fl2Var4.k(sj2Var);
                if (objK != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                iIntValue = sj2Var.f9582e;
                int i12 = sj2Var.f9581d;
                list2 = (List) sj2Var.f9579b;
                fl2Var4 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                i5 = i12;
                sj2 sj2Var22 = sj2Var;
                List list32 = list2;
                fl2 fl2Var52 = fl2Var4;
                if (iIntValue >= ((Number) objK).intValue()) {
                }
                return Unit.f71706a;
            case 6:
                cc2Var = (cc2) sj2Var.f9580c;
                closeable = (Closeable) sj2Var.f9579b;
                closeable2 = (th3) sj2Var.f9578a;
                try {
                    ResultKt.b(objK);
                    closeable2 = closeable2;
                    cc2Var.L = (vr) objK;
                    Unit unit3 = Unit.f71706a;
                    CloseableKt.a(closeable, null);
                    return Unit.f71706a;
                } catch (Throwable th4) {
                    timeoutCancellationException2 = th4;
                    r23 = closeable2;
                    r23.b(timeoutCancellationException2);
                    if (!(timeoutCancellationException2 instanceof b.a4)) {
                        throw timeoutCancellationException2;
                    }
                    if (!(timeoutCancellationException2 instanceof TimeoutCancellationException) && !(timeoutCancellationException2 instanceof CancellationException)) {
                        r23.a(timeoutCancellationException2);
                    }
                    if (timeoutCancellationException2 instanceof TimeoutCancellationException) {
                        throw new lw0(timeoutCancellationException2);
                    }
                    if (timeoutCancellationException2 instanceof CancellationException) {
                        throw new du0(timeoutCancellationException2);
                    }
                    if (timeoutCancellationException2 instanceof dv0) {
                        throw timeoutCancellationException2;
                    }
                    throw new iu0(timeoutCancellationException2);
                }
            case 7:
                cc2Var2 = (cc2) sj2Var.f9580c;
                closeable3 = (Closeable) sj2Var.f9579b;
                closeable4 = (th3) sj2Var.f9578a;
                try {
                    ResultKt.b(objK);
                    closeable4 = closeable4;
                    cc2Var2.L = (vr) objK;
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(closeable3, null);
                    return Unit.f71706a;
                } catch (Throwable th5) {
                    timeoutCancellationException = th5;
                    r22 = closeable4;
                    r22.b(timeoutCancellationException);
                    if (!(timeoutCancellationException instanceof b.a4)) {
                    }
                }
                break;
            case 8:
                list = (List) sj2Var.f9579b;
                fl2Var3 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                sj2Var.f9578a = fl2Var3;
                sj2Var.f9579b = list;
                sj2Var.f9585h = 9;
                objK = fl2Var3.b(list, (f5) objK, sj2Var);
                if (objK != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 9:
                list = (List) sj2Var.f9579b;
                fl2Var3 = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                obj = objK;
                List list42 = list;
                fl2Var = fl2Var3;
                sj2 sj2Var32 = sj2Var;
                if (((Boolean) obj).booleanValue()) {
                }
                return Unit.f71706a;
            case 10:
                fl2Var = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                if (!((Boolean) objK).booleanValue()) {
                }
                if (m0.q(sj2Var.getContext())) {
                }
                return Unit.f71706a;
            case 11:
                fl2Var = (fl2) sj2Var.f9578a;
                ResultKt.b(objK);
                if (m0.q(sj2Var.getContext())) {
                }
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(fl2 fl2Var, String str, a0 a0Var, ni.z zVar, ContinuationImpl continuationImpl) throws Throwable {
        fk2 fk2Var;
        fl2 fl2Var2;
        String str2;
        a0 a0Var2;
        d dVar;
        ni.z zVar2;
        if (continuationImpl instanceof fk2) {
            fk2Var = (fk2) continuationImpl;
            int i5 = fk2Var.f3384j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fk2Var.f3384j = i5 - Integer.MIN_VALUE;
            } else {
                fk2Var = new fk2(fl2Var, continuationImpl);
            }
        }
        Object obj = fk2Var.f3382h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fk2Var.f3384j;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = fl2Var.f3416p;
                fk2Var.f3375a = fl2Var;
                fk2Var.f3376b = str;
                fk2Var.f3377c = a0Var;
                fk2Var.f3378d = zVar;
                fk2Var.f3379e = dVar2;
                fk2Var.f3380f = fl2Var;
                fk2Var.f3381g = str;
                fk2Var.f3384j = 1;
                if (dVar2.e(fk2Var) != coroutineSingletons) {
                    fl2Var2 = fl2Var;
                    str2 = str;
                    a0Var2 = a0Var;
                    dVar = dVar2;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str = fk2Var.f3381g;
            fl2Var = fk2Var.f3380f;
            dVar = fk2Var.f3379e;
            zVar = fk2Var.f3378d;
            a0 a0Var3 = fk2Var.f3377c;
            String str3 = fk2Var.f3376b;
            fl2Var2 = fk2Var.f3375a;
            ResultKt.b(obj);
            a0Var2 = a0Var3;
            str2 = str3;
            LinkedHashMap linkedHashMap = fl2Var2.A;
            dVar.g(null);
            ik2 ik2Var = new ik2(fl2Var2, str2, a0Var2, zVar2, null, 0);
            fk2Var.f3375a = null;
            fk2Var.f3376b = null;
            fk2Var.f3377c = null;
            fk2Var.f3378d = null;
            fk2Var.f3379e = null;
            fk2Var.f3380f = null;
            fk2Var.f3381g = null;
            fk2Var.f3384j = 2;
            Object objA = fl2Var.a(str, linkedHashMap, ik2Var, fk2Var);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
        zVar2 = zVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(fl2 fl2Var, String str, a0 a0Var, ni.z zVar, ContinuationImpl continuationImpl) throws Throwable {
        pk2 pk2Var;
        fl2 fl2Var2;
        String str2;
        a0 a0Var2;
        d dVar;
        ni.z zVar2;
        if (continuationImpl instanceof pk2) {
            pk2Var = (pk2) continuationImpl;
            int i5 = pk2Var.f8311j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pk2Var.f8311j = i5 - Integer.MIN_VALUE;
            } else {
                pk2Var = new pk2(fl2Var, continuationImpl);
            }
        }
        Object obj = pk2Var.f8309h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pk2Var.f8311j;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = fl2Var.f3416p;
                pk2Var.f8302a = fl2Var;
                pk2Var.f8303b = str;
                pk2Var.f8304c = a0Var;
                pk2Var.f8305d = zVar;
                pk2Var.f8306e = dVar2;
                pk2Var.f8307f = fl2Var;
                pk2Var.f8308g = str;
                pk2Var.f8311j = 1;
                if (dVar2.e(pk2Var) != coroutineSingletons) {
                    fl2Var2 = fl2Var;
                    str2 = str;
                    a0Var2 = a0Var;
                    dVar = dVar2;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str = pk2Var.f8308g;
            fl2Var = pk2Var.f8307f;
            dVar = pk2Var.f8306e;
            zVar = pk2Var.f8305d;
            a0 a0Var3 = pk2Var.f8304c;
            String str3 = pk2Var.f8303b;
            fl2Var2 = pk2Var.f8302a;
            ResultKt.b(obj);
            a0Var2 = a0Var3;
            str2 = str3;
            LinkedHashMap linkedHashMap = fl2Var2.D;
            dVar.g(null);
            ik2 ik2Var = new ik2(fl2Var2, str2, a0Var2, zVar2, null, 1);
            pk2Var.f8302a = null;
            pk2Var.f8303b = null;
            pk2Var.f8304c = null;
            pk2Var.f8305d = null;
            pk2Var.f8306e = null;
            pk2Var.f8307f = null;
            pk2Var.f8308g = null;
            pk2Var.f8311j = 2;
            Object objA = fl2Var.a(str, linkedHashMap, ik2Var, pk2Var);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
        zVar2 = zVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(fl2 fl2Var, String str, a0 a0Var, ni.z zVar, ContinuationImpl continuationImpl) throws Throwable {
        tk2 tk2Var;
        fl2 fl2Var2;
        String str2;
        a0 a0Var2;
        d dVar;
        ni.z zVar2;
        if (continuationImpl instanceof tk2) {
            tk2Var = (tk2) continuationImpl;
            int i5 = tk2Var.f9983j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tk2Var.f9983j = i5 - Integer.MIN_VALUE;
            } else {
                tk2Var = new tk2(fl2Var, continuationImpl);
            }
        }
        Object obj = tk2Var.f9981h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tk2Var.f9983j;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = fl2Var.f3416p;
                tk2Var.f9974a = fl2Var;
                tk2Var.f9975b = str;
                tk2Var.f9976c = a0Var;
                tk2Var.f9977d = zVar;
                tk2Var.f9978e = dVar2;
                tk2Var.f9979f = fl2Var;
                tk2Var.f9980g = str;
                tk2Var.f9983j = 1;
                if (dVar2.e(tk2Var) != coroutineSingletons) {
                    fl2Var2 = fl2Var;
                    str2 = str;
                    a0Var2 = a0Var;
                    dVar = dVar2;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str = tk2Var.f9980g;
            fl2Var = tk2Var.f9979f;
            dVar = tk2Var.f9978e;
            zVar = tk2Var.f9977d;
            a0 a0Var3 = tk2Var.f9976c;
            String str3 = tk2Var.f9975b;
            fl2Var2 = tk2Var.f9974a;
            ResultKt.b(obj);
            a0Var2 = a0Var3;
            str2 = str3;
            LinkedHashMap linkedHashMap = fl2Var2.C;
            dVar.g(null);
            ak2 ak2Var = new ak2(fl2Var2, str2, a0Var2, zVar2, null, 1);
            tk2Var.f9974a = null;
            tk2Var.f9975b = null;
            tk2Var.f9976c = null;
            tk2Var.f9977d = null;
            tk2Var.f9978e = null;
            tk2Var.f9979f = null;
            tk2Var.f9980g = null;
            tk2Var.f9983j = 2;
            Object objA = fl2Var.a(str, linkedHashMap, ak2Var, tk2Var);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
        zVar2 = zVar;
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object k(Continuation continuation) {
        xi2 xi2Var;
        fl2 fl2Var;
        if (continuation instanceof xi2) {
            xi2Var = (xi2) continuation;
            int i5 = xi2Var.f11731d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xi2Var.f11731d = i5 - Integer.MIN_VALUE;
            } else {
                xi2Var = new xi2(this, (ContinuationImpl) continuation);
            }
        }
        Object objB = xi2Var.f11729b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xi2Var.f11731d;
        if (i11 == 0) {
            ResultKt.b(objB);
            xi2Var.f11728a = this;
            xi2Var.f11731d = 1;
            q43 q43Var = this.o;
            q43Var.getClass();
            objB = q43.b(q43Var, xi2Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            fl2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fl2Var = xi2Var.f11728a;
            ResultKt.b(objB);
        }
        int iIntValue = ((Number) objB).intValue();
        jr0 jr0Var = fl2Var.f3409g;
        jr0Var.getClass();
        if (!((Boolean) jr0Var.a("gads:use_server_provided_total_ad_limit:enabled", Boolean.TRUE, jn.a$10)).booleanValue() || iIntValue <= 0) {
            jr0 jr0Var2 = fl2Var.f3409g;
            iIntValue = ((Number) jr0Var2.a("gads:preloaded_ads:upper_bound", k9.q(jr0Var2, "gads:preloaded_ads:upper_bound", 15), jn.a$15)).intValue();
        }
        return new Integer(iIntValue);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:110:0x01f5  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x021c A[Catch: all -> 0x0228, TryCatch #5 {all -> 0x0228, blocks: (B:121:0x0215, B:123:0x021c, B:125:0x0220, B:127:0x0224, B:130:0x022b, B:132:0x022f, B:134:0x0233, B:136:0x0237, B:137:0x0238, B:138:0x023d, B:139:0x023e, B:140:0x0245, B:141:0x0246, B:142:0x024d, B:143:0x024e), top: B:161:0x0215, outer: #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:143:0x024e A[Catch: all -> 0x0228, TRY_LEAVE, TryCatch #5 {all -> 0x0228, blocks: (B:121:0x0215, B:123:0x021c, B:125:0x0220, B:127:0x0224, B:130:0x022b, B:132:0x022f, B:134:0x0233, B:136:0x0237, B:137:0x0238, B:138:0x023d, B:139:0x023e, B:140:0x0245, B:141:0x0246, B:142:0x024d, B:143:0x024e), top: B:161:0x0215, outer: #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0170 A[Catch: all -> 0x017c, TryCatch #12 {all -> 0x017c, blocks: (B:72:0x0169, B:74:0x0170, B:76:0x0174, B:78:0x0178, B:81:0x017f, B:83:0x0183, B:85:0x0187, B:87:0x018b, B:88:0x018c, B:89:0x0191, B:90:0x0192, B:91:0x0199, B:92:0x019a, B:93:0x01a1, B:94:0x01a2), top: B:172:0x0169, outer: #6 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01a2 A[Catch: all -> 0x017c, TRY_LEAVE, TryCatch #12 {all -> 0x017c, blocks: (B:72:0x0169, B:74:0x0170, B:76:0x0174, B:78:0x0178, B:81:0x017f, B:83:0x0183, B:85:0x0187, B:87:0x018b, B:88:0x018c, B:89:0x0191, B:90:0x0192, B:91:0x0199, B:92:0x019a, B:93:0x01a1, B:94:0x01a2), top: B:172:0x0169, outer: #6 }] */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v15 */
    /* JADX WARN: Type inference failed for: r5v16 */
    /* JADX WARN: Type inference failed for: r5v17 */
    /* JADX WARN: Type inference failed for: r5v18 */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r5v23 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v25 */
    /* JADX WARN: Type inference failed for: r5v26 */
    /* JADX WARN: Type inference failed for: r5v27 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v31, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r5v34, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r5v36 */
    /* JADX WARN: Type inference failed for: r5v37 */
    /* JADX WARN: Type inference failed for: r5v38 */
    /* JADX WARN: Type inference failed for: r5v39 */
    /* JADX WARN: Type inference failed for: r5v40 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r7v3, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r7v4, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r8v5, types: [ads_mobile_sdk.th3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object r(ContinuationImpl continuationImpl) throws Throwable {
        jj2 jj2Var;
        c80.a aVar;
        fl2 fl2Var;
        th3 th3VarA;
        Closeable closeable;
        th3 th3Var;
        th3 th3Var2;
        c80.a aVar2;
        cc2 cc2Var;
        ArrayList arrayList;
        Closeable closeable2;
        em2 em2Var;
        em2 em2Var2;
        c80.a aVar3;
        cc2 cc2Var2;
        ArrayList arrayList2;
        th3 th3Var3;
        cc2 cc2Var3;
        cc2 cc2Var4;
        if (continuationImpl instanceof jj2) {
            jj2Var = (jj2) continuationImpl;
            int i5 = jj2Var.f5268i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jj2Var.f5268i = i5 - Integer.MIN_VALUE;
            } else {
                jj2Var = new jj2(this, continuationImpl);
            }
        }
        jj2 jj2Var2 = jj2Var;
        Object objA = jj2Var2.f5266g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jj2Var2.f5268i;
        ?? r52 = 4;
        ?? r53 = 4;
        try {
            try {
            } catch (Throwable th2) {
                th = th2;
                aVar = r52;
                r53 = aVar;
                ((d) r53).g(null);
                throw th;
            }
            try {
                if (i11 == 0) {
                    ResultKt.b(objA);
                    d dVar = this.f3416p;
                    jj2Var2.f5260a = this;
                    jj2Var2.f5261b = dVar;
                    jj2Var2.f5268i = 1;
                    if (dVar.e(jj2Var2) != coroutineSingletons) {
                        aVar = dVar;
                        fl2Var = this;
                    }
                    return coroutineSingletons;
                }
                if (i11 == 1) {
                    c80.a aVar4 = (c80.a) jj2Var2.f5261b;
                    fl2 fl2Var2 = (fl2) jj2Var2.f5260a;
                    ResultKt.b(objA);
                    aVar = aVar4;
                    fl2Var = fl2Var2;
                } else if (i11 == 2) {
                    fl2Var = jj2Var2.f5265f;
                    ArrayList arrayList3 = jj2Var2.f5264e;
                    cc2 cc2Var5 = jj2Var2.f5263d;
                    ?? r72 = jj2Var2.f5262c;
                    ?? r82 = (th3) jj2Var2.f5261b;
                    aVar = (c80.a) jj2Var2.f5260a;
                    try {
                        ResultKt.b(objA);
                        em2Var = r72;
                        em2Var2 = r82;
                        aVar3 = aVar;
                        cc2Var2 = cc2Var5;
                        arrayList2 = arrayList3;
                        try {
                            int iIntValue = ((Number) objA).intValue();
                            jj2Var2.f5260a = aVar3;
                            jj2Var2.f5261b = em2Var2;
                            jj2Var2.f5262c = em2Var;
                            jj2Var2.f5263d = cc2Var2;
                            jj2Var2.f5264e = null;
                            jj2Var2.f5265f = null;
                            jj2Var2.f5268i = 3;
                            objA = fl2Var.a((f5) null, arrayList2, iIntValue, (Integer) null, (Boolean) null, jj2Var2);
                            if (objA != coroutineSingletons) {
                                cc2Var3 = cc2Var2;
                                closeable2 = em2Var;
                                th3Var3 = em2Var2;
                                r52 = aVar3;
                                cc2Var3.L = (vr) objA;
                                Unit unit = Unit.f71706a;
                                CloseableKt.a(closeable2, null);
                                r53 = r52;
                                d dVar2 = r53;
                                Unit unit2 = Unit.f71706a;
                                dVar2.g(null);
                                return unit2;
                            }
                            return coroutineSingletons;
                        } catch (Throwable th3) {
                            th = th3;
                            closeable2 = em2Var;
                            th3Var3 = em2Var2;
                            r52 = aVar3;
                            th3Var3.b(th);
                            if (!(th instanceof b.a4)) {
                                throw th;
                            }
                            if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                th3Var3.a(th);
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
                    } catch (Throwable th4) {
                        th = th4;
                        closeable2 = r72;
                        th3Var3 = r82;
                        r52 = aVar;
                        th3Var3.b(th);
                        if (!(th instanceof b.a4)) {
                        }
                    }
                } else if (i11 == 3) {
                    cc2Var3 = jj2Var2.f5263d;
                    closeable2 = jj2Var2.f5262c;
                    th3Var3 = (th3) jj2Var2.f5261b;
                    r52 = (c80.a) jj2Var2.f5260a;
                    try {
                        ResultKt.b(objA);
                        th3Var3 = th3Var3;
                        r52 = r52;
                        cc2Var3.L = (vr) objA;
                        Unit unit3 = Unit.f71706a;
                        CloseableKt.a(closeable2, null);
                        r53 = r52;
                        d dVar22 = r53;
                        Unit unit22 = Unit.f71706a;
                        dVar22.g(null);
                        return unit22;
                    } catch (Throwable th5) {
                        th = th5;
                        try {
                            th3Var3.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        } catch (Throwable th6) {
                        }
                    }
                } else {
                    if (i11 != 4) {
                        if (i11 != 5) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        cc2Var4 = jj2Var2.f5263d;
                        closeable = jj2Var2.f5262c;
                        th3VarA = (th3) jj2Var2.f5261b;
                        r52 = (c80.a) jj2Var2.f5260a;
                        try {
                            ResultKt.b(objA);
                            r52 = r52;
                            cc2Var4.L = (vr) objA;
                            Unit unit4 = Unit.f71706a;
                            CloseableKt.a(closeable, null);
                            r53 = r52;
                            d dVar222 = r53;
                            Unit unit222 = Unit.f71706a;
                            dVar222.g(null);
                            return unit222;
                        } catch (Throwable th7) {
                            th = th7;
                            try {
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
                            } finally {
                                try {
                                    throw th;
                                } finally {
                                    CloseableKt.a(closeable, th);
                                }
                            }
                        }
                    }
                    fl2Var = jj2Var2.f5265f;
                    arrayList = jj2Var2.f5264e;
                    cc2 cc2Var6 = jj2Var2.f5263d;
                    ?? r73 = jj2Var2.f5262c;
                    th3 th3Var4 = (th3) jj2Var2.f5261b;
                    aVar = (c80.a) jj2Var2.f5260a;
                    try {
                        ResultKt.b(objA);
                        th3Var = r73;
                        th3Var2 = th3Var4;
                        aVar2 = aVar;
                        cc2Var = cc2Var6;
                    } catch (Throwable th8) {
                        th = th8;
                        closeable = r73;
                        th3VarA = th3Var4;
                        r52 = aVar;
                        th3VarA.b(th);
                        if (!(th instanceof b.a4)) {
                        }
                    }
                    try {
                        int iIntValue2 = ((Number) objA).intValue();
                        jj2Var2.f5260a = aVar2;
                        jj2Var2.f5261b = th3Var2;
                        jj2Var2.f5262c = th3Var;
                        jj2Var2.f5263d = cc2Var;
                        jj2Var2.f5264e = null;
                        jj2Var2.f5265f = null;
                        jj2Var2.f5268i = 5;
                        objA = fl2Var.a((f5) null, arrayList, iIntValue2, (Integer) null, (Boolean) null, jj2Var2);
                        if (objA != coroutineSingletons) {
                            cc2Var4 = cc2Var;
                            closeable = th3Var;
                            th3VarA = th3Var2;
                            r52 = aVar2;
                            cc2Var4.L = (vr) objA;
                            Unit unit42 = Unit.f71706a;
                            CloseableKt.a(closeable, null);
                            r53 = r52;
                            d dVar2222 = r53;
                            Unit unit2222 = Unit.f71706a;
                            dVar2222.g(null);
                            return unit2222;
                        }
                        return coroutineSingletons;
                    } catch (Throwable th9) {
                        th = th9;
                        closeable = th3Var;
                        th3VarA = th3Var2;
                        r52 = aVar2;
                        th3VarA.b(th);
                        if (!(th instanceof b.a4)) {
                        }
                    }
                }
                if (fl2Var.E) {
                    Unit unit5 = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit5;
                }
                fl2Var.E = true;
                ArrayList arrayListB = fl2Var.b();
                kz2 kz2Var = fl2Var.f3407e;
                wv0 wv0Var = wv0.CUI_NAME_CENTRALIZED_MANAGER_PAUSE_FOR_AD_SHOW;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                if (ji3.b().f4777a == null) {
                    em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        cc2 cc2VarE = ji3.a().e();
                        jj2Var2.f5260a = aVar;
                        jj2Var2.f5261b = em2VarA;
                        jj2Var2.f5262c = em2VarA;
                        jj2Var2.f5263d = cc2VarE;
                        jj2Var2.f5264e = arrayListB;
                        jj2Var2.f5265f = fl2Var;
                        jj2Var2.f5268i = 2;
                        Object objA2 = fl2Var.a(arrayListB, jj2Var2);
                        if (objA2 != coroutineSingletons) {
                            em2Var = em2VarA;
                            em2Var2 = em2Var;
                            aVar3 = aVar;
                            cc2Var2 = cc2VarE;
                            arrayList2 = arrayListB;
                            objA = objA2;
                            int iIntValue3 = ((Number) objA).intValue();
                            jj2Var2.f5260a = aVar3;
                            jj2Var2.f5261b = em2Var2;
                            jj2Var2.f5262c = em2Var;
                            jj2Var2.f5263d = cc2Var2;
                            jj2Var2.f5264e = null;
                            jj2Var2.f5265f = null;
                            jj2Var2.f5268i = 3;
                            objA = fl2Var.a((f5) null, arrayList2, iIntValue3, (Integer) null, (Boolean) null, jj2Var2);
                            if (objA != coroutineSingletons) {
                            }
                        }
                    } catch (Throwable th10) {
                        th = th10;
                        closeable2 = em2VarA;
                        th3Var3 = em2VarA;
                        r52 = aVar;
                        th3Var3.b(th);
                        if (!(th instanceof b.a4)) {
                        }
                    }
                } else {
                    th3VarA = ji3.a(wv0Var, emptyList, true);
                    try {
                        cc2 cc2VarE2 = ji3.a().e();
                        jj2Var2.f5260a = aVar;
                        jj2Var2.f5261b = th3VarA;
                        jj2Var2.f5262c = th3VarA;
                        jj2Var2.f5263d = cc2VarE2;
                        jj2Var2.f5264e = arrayListB;
                        jj2Var2.f5265f = fl2Var;
                        jj2Var2.f5268i = 4;
                        Object objA3 = fl2Var.a(arrayListB, jj2Var2);
                        if (objA3 != coroutineSingletons) {
                            th3Var = th3VarA;
                            th3Var2 = th3Var;
                            aVar2 = aVar;
                            cc2Var = cc2VarE2;
                            arrayList = arrayListB;
                            objA = objA3;
                            int iIntValue22 = ((Number) objA).intValue();
                            jj2Var2.f5260a = aVar2;
                            jj2Var2.f5261b = th3Var2;
                            jj2Var2.f5262c = th3Var;
                            jj2Var2.f5263d = cc2Var;
                            jj2Var2.f5264e = null;
                            jj2Var2.f5265f = null;
                            jj2Var2.f5268i = 5;
                            objA = fl2Var.a((f5) null, arrayList, iIntValue22, (Integer) null, (Boolean) null, jj2Var2);
                            if (objA != coroutineSingletons) {
                            }
                        }
                    } catch (Throwable th11) {
                        th = th11;
                        closeable = th3VarA;
                        r52 = aVar;
                        th3VarA.b(th);
                        if (!(th instanceof b.a4)) {
                        }
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th12) {
                th = th12;
                r53 = aVar;
                ((d) r53).g(null);
                throw th;
            }
        } catch (Throwable th13) {
            th = th13;
            ((d) r53).g(null);
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object s(ContinuationImpl continuationImpl) {
        dl2 dl2Var;
        fl2 fl2Var;
        d dVar;
        if (continuationImpl instanceof dl2) {
            dl2Var = (dl2) continuationImpl;
            int i5 = dl2Var.f2564e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dl2Var.f2564e = i5 - Integer.MIN_VALUE;
            } else {
                dl2Var = new dl2(this, continuationImpl);
            }
        }
        Object obj = dl2Var.f2562c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dl2Var.f2564e;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!this.G) {
                return Unit.f71706a;
            }
            dl2Var.f2560a = this;
            d dVar2 = this.f3416p;
            dl2Var.f2561b = dVar2;
            dl2Var.f2564e = 1;
            if (dVar2.e(dl2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            fl2Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = dl2Var.f2561b;
            fl2Var = dl2Var.f2560a;
            ResultKt.b(obj);
        }
        Continuation continuation = null;
        try {
            if (!fl2Var.f3417q.b()) {
                t70.j0 j0Var = fl2Var.f3405c;
                a60.a aVar = new a60.a(fl2Var, continuation, 6);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                fl2Var.f3417q = m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0090 -> B:28:0x0095). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(List list, f5 f5Var, ContinuationImpl continuationImpl) {
        ti2 ti2Var;
        Iterator it;
        fl2 fl2Var;
        ti2 ti2Var2;
        f5 f5Var2;
        int i5;
        List list2;
        int i11;
        f5 f5Var3;
        fl2 fl2Var2;
        fl2 fl2Var3;
        if (continuationImpl instanceof ti2) {
            ti2Var = (ti2) continuationImpl;
            int i12 = ti2Var.f9937h;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                ti2Var.f9937h = i12 - Integer.MIN_VALUE;
            } else {
                ti2Var = new ti2(this, continuationImpl);
            }
        }
        Object objC = ti2Var.f9935f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = ti2Var.f9937h;
        boolean z11 = false;
        if (i13 == 0) {
            ResultKt.b(objC);
            it = list.iterator();
            fl2Var = this;
            ti2Var2 = ti2Var;
            f5Var2 = f5Var;
            i5 = 0;
            if (it.hasNext()) {
            }
        }
        if (i13 != 1) {
            if (i13 != 2) {
                if (i13 != 3) {
                    if (i13 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objC);
                    return objC;
                }
                i11 = ti2Var.f9934e;
                f5Var3 = ti2Var.f9932c;
                list2 = ti2Var.f9931b;
                fl2Var3 = ti2Var.f9930a;
                ResultKt.b(objC);
                if (i11 < ((Number) objC).intValue()) {
                    ti2Var.f9930a = null;
                    ti2Var.f9931b = null;
                    ti2Var.f9932c = null;
                    ti2Var.f9937h = 4;
                    Object objA = fl2Var3.a(list2, f5Var3, ti2Var);
                    return objA == coroutineSingletons ? coroutineSingletons : objA;
                }
                return Boolean.valueOf(z11);
            }
            i11 = ti2Var.f9934e;
            f5Var3 = ti2Var.f9932c;
            list2 = ti2Var.f9931b;
            fl2Var2 = ti2Var.f9930a;
            ResultKt.b(objC);
            if (((Boolean) objC).booleanValue()) {
                ti2Var.f9930a = fl2Var2;
                ti2Var.f9931b = list2;
                ti2Var.f9932c = f5Var3;
                ti2Var.f9934e = i11;
                ti2Var.f9937h = 3;
                objC = fl2Var2.k(ti2Var);
                if (objC != coroutineSingletons) {
                    fl2Var3 = fl2Var2;
                    if (i11 < ((Number) objC).intValue()) {
                    }
                    return Boolean.valueOf(z11);
                }
            }
            z11 = true;
            return Boolean.valueOf(z11);
        }
        int i14 = ti2Var.f9934e;
        Iterator it2 = ti2Var.f9933d;
        f5 f5Var4 = ti2Var.f9932c;
        List list3 = ti2Var.f9931b;
        fl2Var = ti2Var.f9930a;
        ResultKt.b(objC);
        ti2Var2 = ti2Var;
        f5Var2 = f5Var4;
        int iIntValue = i14 + ((Number) objC).intValue();
        it = it2;
        i5 = iIntValue;
        list = list3;
        if (it.hasNext()) {
            f5 f5Var5 = (f5) it.next();
            ti2Var2.f9930a = fl2Var;
            ti2Var2.f9931b = list;
            ti2Var2.f9932c = f5Var2;
            ti2Var2.f9933d = it;
            ti2Var2.f9934e = i5;
            ti2Var2.f9937h = 1;
            Object objA2 = f5Var5.a(ti2Var2);
            if (objA2 != coroutineSingletons) {
                list3 = list;
                i14 = i5;
                it2 = it;
                objC = objA2;
                int iIntValue2 = i14 + ((Number) objC).intValue();
                it = it2;
                i5 = iIntValue2;
                list = list3;
                if (it.hasNext()) {
                    ti2Var2.f9930a = fl2Var;
                    ti2Var2.f9931b = list;
                    ti2Var2.f9932c = f5Var2;
                    ti2Var2.f9933d = null;
                    ti2Var2.f9934e = i5;
                    ti2Var2.f9937h = 2;
                    objC = fl2Var.c(list, f5Var2, ti2Var2);
                    if (objC != coroutineSingletons) {
                        ti2 ti2Var3 = ti2Var2;
                        list2 = list;
                        i11 = i5;
                        f5Var3 = f5Var2;
                        ti2Var = ti2Var3;
                        fl2Var2 = fl2Var;
                        if (((Boolean) objC).booleanValue()) {
                        }
                    }
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0068 A[PHI: r9
      0x0068: PHI (r9v8 java.util.Iterator) = (r9v3 java.util.Iterator), (r9v10 java.util.Iterator) binds: [B:25:0x0064, B:43:0x00ae] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x00a0 -> B:38:0x00a1). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(List list, f5 f5Var, ContinuationImpl continuationImpl) {
        zi2 zi2Var;
        Iterator it;
        Iterator it2;
        f5 f5Var2;
        boolean z11;
        if (continuationImpl instanceof zi2) {
            zi2Var = (zi2) continuationImpl;
            int i5 = zi2Var.f12547e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zi2Var.f12547e = i5 - Integer.MIN_VALUE;
            } else {
                zi2Var = new zi2(this, continuationImpl);
            }
        }
        Object objD = zi2Var.f12545c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zi2Var.f12547e;
        boolean z12 = false;
        if (i11 == 0) {
            ArrayList arrayListX = c0.x(objD);
            for (Object obj : list) {
                if (!Intrinsics.b((f5) obj, f5Var)) {
                    arrayListX.add(obj);
                }
            }
            if (!arrayListX.isEmpty()) {
                it = arrayListX.iterator();
                if (it.hasNext()) {
                }
            }
            return Boolean.valueOf(z12);
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = zi2Var.f12543a;
            ResultKt.b(objD);
            if (((Boolean) objD).booleanValue()) {
                it = it;
                z11 = false;
            } else {
                z11 = true;
            }
            if (z11) {
                z12 = true;
            } else if (it.hasNext()) {
                f5 f5Var3 = (f5) it.next();
                zi2Var.f12543a = it;
                zi2Var.f12544b = f5Var3;
                zi2Var.f12547e = 1;
                f5Var3.getClass();
                objD = f5.f(f5Var3, zi2Var);
                if (objD != coroutineSingletons) {
                    it2 = it;
                    f5Var2 = f5Var3;
                    if (((Number) objD).intValue() != 0) {
                        zi2Var.f12543a = it2;
                        zi2Var.f12544b = null;
                        zi2Var.f12547e = 2;
                        f5Var2.getClass();
                        objD = f5.d(f5Var2, zi2Var);
                        if (objD != coroutineSingletons) {
                            it = it2;
                            if (((Boolean) objD).booleanValue()) {
                            }
                            if (z11) {
                            }
                        }
                    } else {
                        it = it2;
                        z11 = false;
                        if (z11) {
                        }
                    }
                }
                return coroutineSingletons;
            }
            return Boolean.valueOf(z12);
        }
        f5Var2 = zi2Var.f12544b;
        it2 = zi2Var.f12543a;
        ResultKt.b(objD);
        if (((Number) objD).intValue() != 0) {
        }
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) {
        return a(this, j11, suspendLambda);
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0068, code lost:
    
        if (r13.e(r0) == r1) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(fl2 fl2Var, long j11, ContinuationImpl continuationImpl) {
        hj2 hj2Var;
        ArrayList arrayList;
        d dVar;
        Iterator it;
        long j12;
        if (continuationImpl instanceof hj2) {
            hj2Var = (hj2) continuationImpl;
            int i5 = hj2Var.f4413g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hj2Var.f4413g = i5 - Integer.MIN_VALUE;
            } else {
                hj2Var = new hj2(fl2Var, continuationImpl);
            }
        }
        Object obj = hj2Var.f4411e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hj2Var.f4413g;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!fl2Var.f3418r) {
                    return Unit.f71706a;
                }
                arrayList = new ArrayList();
                dVar = fl2Var.f3416p;
                hj2Var.f4407a = fl2Var;
                hj2Var.f4408b = arrayList;
                hj2Var.f4409c = dVar;
                hj2Var.f4410d = j11;
                hj2Var.f4413g = 1;
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    j12 = hj2Var.f4410d;
                    it = (Iterator) hj2Var.f4407a;
                    ResultKt.b(obj);
                    while (it.hasNext()) {
                        f5 f5Var = (f5) it.next();
                        hj2Var.f4407a = it;
                        hj2Var.f4408b = null;
                        hj2Var.f4409c = null;
                        hj2Var.f4410d = j12;
                        hj2Var.f4413g = 2;
                        f5Var.getClass();
                        if (f5.j(f5Var, hj2Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                    return Unit.f71706a;
                }
                j11 = hj2Var.f4410d;
                d dVar2 = hj2Var.f4409c;
                arrayList = hj2Var.f4408b;
                fl2 fl2Var2 = (fl2) hj2Var.f4407a;
                ResultKt.b(obj);
                dVar = dVar2;
                fl2Var = fl2Var2;
            }
            if (Duration.c(j11, fl2Var.f3424x) > 0 && fl2Var.f3423w) {
                fl2Var.f3423w = false;
                fl2Var.f3424x = j11;
                arrayList.addAll(fl2Var.a((Function1) null));
                dVar.g(null);
                if (!arrayList.isEmpty()) {
                    it = arrayList.iterator();
                    j12 = j11;
                    while (it.hasNext()) {
                    }
                }
                return Unit.f71706a;
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    public final ArrayList b() {
        i70.a aVar = qw2.n;
        ArrayList arrayList = new ArrayList();
        aVar.getClass();
        b70.a aVar2 = new b70.a(aVar);
        while (aVar2.hasNext()) {
            LinkedHashMap linkedHashMapA = a((qw2) aVar2.next());
            Collection collectionValues = linkedHashMapA != null ? linkedHashMapA.values() : null;
            if (collectionValues != null) {
                arrayList.add(collectionValues);
            }
        }
        return b70.c.v0(arrayList);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0072, code lost:
    
        if (r12.e(r0) == r1) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00c9, code lost:
    
        if (r2.s(r0) == r1) goto L41;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00bd A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(fl2 fl2Var, long j11, ContinuationImpl continuationImpl) {
        gj2 gj2Var;
        List arrayList;
        d dVar;
        fl2 fl2Var2;
        long j12;
        Iterator it;
        if (continuationImpl instanceof gj2) {
            gj2Var = (gj2) continuationImpl;
            int i5 = gj2Var.f3869g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gj2Var.f3869g = i5 - Integer.MIN_VALUE;
            } else {
                gj2Var = new gj2(fl2Var, continuationImpl);
            }
        }
        Object obj = gj2Var.f3867e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gj2Var.f3869g;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!fl2Var.f3418r) {
                    return Unit.f71706a;
                }
                arrayList = new ArrayList();
                dVar = fl2Var.f3416p;
                gj2Var.f3863a = fl2Var;
                gj2Var.f3864b = arrayList;
                gj2Var.f3865c = dVar;
                gj2Var.f3866d = j11;
                gj2Var.f3869g = 1;
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        if (i11 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    j12 = gj2Var.f3866d;
                    it = (Iterator) gj2Var.f3864b;
                    fl2Var2 = gj2Var.f3863a;
                    ResultKt.b(obj);
                    while (true) {
                        if (!it.hasNext()) {
                            f5 f5Var = (f5) it.next();
                            gj2Var.f3863a = fl2Var2;
                            gj2Var.f3864b = it;
                            gj2Var.f3865c = null;
                            gj2Var.f3866d = j12;
                            gj2Var.f3869g = 2;
                            f5Var.getClass();
                            if (f5.i(f5Var, gj2Var) == coroutineSingletons) {
                                break;
                            }
                        } else {
                            gj2Var.f3863a = null;
                            gj2Var.f3864b = null;
                            gj2Var.f3865c = null;
                            gj2Var.f3869g = 3;
                        }
                    }
                    return coroutineSingletons;
                }
                j11 = gj2Var.f3866d;
                d dVar2 = gj2Var.f3865c;
                arrayList = (List) gj2Var.f3864b;
                fl2 fl2Var3 = gj2Var.f3863a;
                ResultKt.b(obj);
                dVar = dVar2;
                fl2Var = fl2Var3;
            }
            if (Duration.c(j11, fl2Var.f3424x) > 0 && !fl2Var.f3423w) {
                fl2Var.f3423w = true;
                fl2Var.f3424x = j11;
                arrayList.addAll(fl2Var.a((Function1) null));
                dVar.g(null);
                if (arrayList.isEmpty()) {
                    return Unit.f71706a;
                }
                Iterator it2 = arrayList.iterator();
                fl2Var2 = fl2Var;
                j12 = j11;
                it = it2;
                while (true) {
                    if (!it.hasNext()) {
                    }
                }
                return coroutineSingletons;
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) {
        return b(this, j11, suspendLambda);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0072, code lost:
    
        if (r12.e(r0) == r1) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00cf, code lost:
    
        if (r2.s(r0) == r1) goto L41;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00c3 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(fl2 fl2Var, long j11, ContinuationImpl continuationImpl) {
        ej2 ej2Var;
        List arrayList;
        d dVar;
        fl2 fl2Var2;
        long j12;
        Iterator it;
        if (continuationImpl instanceof ej2) {
            ej2Var = (ej2) continuationImpl;
            int i5 = ej2Var.f2894g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ej2Var.f2894g = i5 - Integer.MIN_VALUE;
            } else {
                ej2Var = new ej2(fl2Var, continuationImpl);
            }
        }
        Object obj = ej2Var.f2892e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ej2Var.f2894g;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!fl2Var.f3419s) {
                    return Unit.f71706a;
                }
                arrayList = new ArrayList();
                dVar = fl2Var.f3416p;
                ej2Var.f2888a = fl2Var;
                ej2Var.f2889b = arrayList;
                ej2Var.f2890c = dVar;
                ej2Var.f2891d = j11;
                ej2Var.f2894g = 1;
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        if (i11 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    j12 = ej2Var.f2891d;
                    it = (Iterator) ej2Var.f2889b;
                    fl2Var2 = ej2Var.f2888a;
                    ResultKt.b(obj);
                    while (true) {
                        if (!it.hasNext()) {
                            f5 f5Var = (f5) it.next();
                            ej2Var.f2888a = fl2Var2;
                            ej2Var.f2889b = it;
                            ej2Var.f2890c = null;
                            ej2Var.f2891d = j12;
                            ej2Var.f2894g = 2;
                            f5Var.getClass();
                            if (f5.h(f5Var, ej2Var) == coroutineSingletons) {
                                break;
                            }
                        } else {
                            ej2Var.f2888a = null;
                            ej2Var.f2889b = null;
                            ej2Var.f2890c = null;
                            ej2Var.f2894g = 3;
                        }
                    }
                    return coroutineSingletons;
                }
                j11 = ej2Var.f2891d;
                d dVar2 = ej2Var.f2890c;
                arrayList = (List) ej2Var.f2889b;
                fl2 fl2Var3 = ej2Var.f2888a;
                ResultKt.b(obj);
                dVar = dVar2;
                fl2Var = fl2Var3;
            }
            if (Duration.c(j11, fl2Var.f3422v) > 0 && !fl2Var.f3421u) {
                fl2Var.f3421u = true;
                fl2Var.f3422v = j11;
                arrayList.addAll(fl2Var.a(new dj2(fl2Var, 1)));
                dVar.g(null);
                if (arrayList.isEmpty()) {
                    return Unit.f71706a;
                }
                Iterator it2 = arrayList.iterator();
                fl2Var2 = fl2Var;
                j12 = j11;
                it = it2;
                while (true) {
                    if (!it.hasNext()) {
                    }
                }
                return coroutineSingletons;
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.x
    public final Object c(long j11, i iVar) {
        return d(this, j11, iVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0085, code lost:
    
        if (r12 == r1) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0115 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0085 -> B:24:0x0089). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x00f6 -> B:42:0x00f9). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(List list, ContinuationImpl continuationImpl) {
        wj2 wj2Var;
        Iterator it;
        Collection collection;
        Object obj;
        Iterator it2;
        int i5;
        Object obj2;
        Iterator it3;
        Comparable d5;
        Object objF;
        if (continuationImpl instanceof wj2) {
            wj2Var = (wj2) continuationImpl;
            int i11 = wj2Var.f11312h;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                wj2Var.f11312h = i11 - Integer.MIN_VALUE;
            } else {
                wj2Var = new wj2(this, continuationImpl);
            }
        }
        Object objD = wj2Var.f11310f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = wj2Var.f11312h;
        if (i12 == 0) {
            ArrayList arrayListX = c0.x(objD);
            it = list.iterator();
            collection = arrayListX;
            if (!it.hasNext()) {
            }
            return coroutineSingletons;
        }
        if (i12 == 1) {
            Object next = wj2Var.f11307c;
            it = (Iterator) wj2Var.f11306b;
            collection = (Collection) wj2Var.f11305a;
            ResultKt.b(objD);
            if (((Boolean) objD).booleanValue()) {
                collection.add(next);
            }
            if (!it.hasNext()) {
                next = it.next();
                f5 f5Var = (f5) next;
                wj2Var.f11305a = collection;
                wj2Var.f11306b = it;
                wj2Var.f11307c = next;
                wj2Var.f11312h = 1;
                f5Var.getClass();
                objD = f5.d(f5Var, wj2Var);
            } else {
                Iterator it4 = ((List) collection).iterator();
                if (!it4.hasNext()) {
                    return null;
                }
                Object next2 = it4.next();
                if (!it4.hasNext()) {
                    return next2;
                }
                f5 f5Var2 = (f5) next2;
                int i13 = f5Var2.o;
                wj2Var.f11305a = it4;
                wj2Var.f11306b = next2;
                wj2Var.f11307c = null;
                wj2Var.f11309e = i13;
                wj2Var.f11312h = 2;
                Object objF2 = f5.f(f5Var2, wj2Var);
                if (objF2 != coroutineSingletons) {
                    obj = next2;
                    objD = objF2;
                    it2 = it4;
                    i5 = i13;
                    obj2 = obj;
                    it3 = it2;
                    d5 = new Double(((Number) objD).intValue() / i5);
                    next = it3.next();
                    f5 f5Var3 = (f5) next;
                    int i14 = f5Var3.o;
                    wj2Var.f11305a = it3;
                    wj2Var.f11306b = obj2;
                    wj2Var.f11307c = d5;
                    wj2Var.f11308d = next;
                    wj2Var.f11309e = i14;
                    wj2Var.f11312h = 3;
                    objF = f5.f(f5Var3, wj2Var);
                    if (objF != coroutineSingletons) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i12 == 2) {
            i5 = wj2Var.f11309e;
            obj = wj2Var.f11306b;
            it2 = (Iterator) wj2Var.f11305a;
            ResultKt.b(objD);
            obj2 = obj;
            it3 = it2;
            d5 = new Double(((Number) objD).intValue() / i5);
            next = it3.next();
            f5 f5Var32 = (f5) next;
            int i142 = f5Var32.o;
            wj2Var.f11305a = it3;
            wj2Var.f11306b = obj2;
            wj2Var.f11307c = d5;
            wj2Var.f11308d = next;
            wj2Var.f11309e = i142;
            wj2Var.f11312h = 3;
            objF = f5.f(f5Var32, wj2Var);
            if (objF != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i12 != 3) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        int i15 = wj2Var.f11309e;
        Object next3 = wj2Var.f11308d;
        d5 = (Comparable) wj2Var.f11307c;
        obj2 = wj2Var.f11306b;
        it3 = (Iterator) wj2Var.f11305a;
        ResultKt.b(objD);
        Double d11 = new Double(((Number) objD).intValue() / i15);
        if (d5.compareTo(d11) > 0) {
            d5 = d11;
            obj2 = next3;
        }
        if (!it3.hasNext()) {
            return obj2;
        }
        next3 = it3.next();
        f5 f5Var322 = (f5) next3;
        int i1422 = f5Var322.o;
        wj2Var.f11305a = it3;
        wj2Var.f11306b = obj2;
        wj2Var.f11307c = d5;
        wj2Var.f11308d = next3;
        wj2Var.f11309e = i1422;
        wj2Var.f11312h = 3;
        objF = f5.f(f5Var322, wj2Var);
        if (objF != coroutineSingletons) {
            objD = objF;
            i15 = i1422;
            Double d112 = new Double(((Number) objD).intValue() / i15);
            if (d5.compareTo(d112) > 0) {
            }
            if (!it3.hasNext()) {
            }
            next3 = it3.next();
            f5 f5Var3222 = (f5) next3;
            int i14222 = f5Var3222.o;
            wj2Var.f11305a = it3;
            wj2Var.f11306b = obj2;
            wj2Var.f11307c = d5;
            wj2Var.f11308d = next3;
            wj2Var.f11309e = i14222;
            wj2Var.f11312h = 3;
            objF = f5.f(f5Var3222, wj2Var);
            if (objF != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0224  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0225  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0241  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0259 A[Catch: all -> 0x0265, TryCatch #1 {all -> 0x0265, blocks: (B:122:0x0252, B:124:0x0259, B:126:0x025d, B:128:0x0261, B:131:0x0268, B:133:0x026c, B:135:0x0270, B:137:0x0274, B:138:0x0275, B:139:0x027a, B:140:0x027b, B:141:0x0282, B:142:0x0283, B:143:0x028a, B:144:0x028b), top: B:151:0x0252 }] */
    /* JADX WARN: Removed duplicated region for block: B:144:0x028b A[Catch: all -> 0x0265, TRY_LEAVE, TryCatch #1 {all -> 0x0265, blocks: (B:122:0x0252, B:124:0x0259, B:126:0x025d, B:128:0x0261, B:131:0x0268, B:133:0x026c, B:135:0x0270, B:137:0x0274, B:138:0x0275, B:139:0x027a, B:140:0x027b, B:141:0x0282, B:142:0x0283, B:143:0x028a, B:144:0x028b), top: B:151:0x0252 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00f5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0169  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01a0 A[Catch: all -> 0x01ac, TryCatch #3 {all -> 0x01ac, blocks: (B:74:0x0199, B:76:0x01a0, B:78:0x01a4, B:80:0x01a8, B:83:0x01af, B:85:0x01b3, B:87:0x01b7, B:89:0x01bb, B:90:0x01bc, B:91:0x01c1, B:92:0x01c2, B:93:0x01c9, B:94:0x01ca, B:95:0x01d1, B:96:0x01d2), top: B:154:0x0199 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01d2 A[Catch: all -> 0x01ac, TRY_LEAVE, TryCatch #3 {all -> 0x01ac, blocks: (B:74:0x0199, B:76:0x01a0, B:78:0x01a4, B:80:0x01a8, B:83:0x01af, B:85:0x01b3, B:87:0x01b7, B:89:0x01bb, B:90:0x01bc, B:91:0x01c1, B:92:0x01c2, B:93:0x01c9, B:94:0x01ca, B:95:0x01d1, B:96:0x01d2), top: B:154:0x0199 }] */
    /* JADX WARN: Type inference failed for: r4v27 */
    /* JADX WARN: Type inference failed for: r4v29 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v33, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v35, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v37 */
    /* JADX WARN: Type inference failed for: r5v11, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r5v12, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v3, types: [ads_mobile_sdk.em2, java.io.Closeable, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v7 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /* JADX WARN: Type inference failed for: r7v8, types: [java.io.Closeable] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(List list, ContinuationImpl continuationImpl) {
        tj2 tj2Var;
        fl2 fl2Var;
        f5 f5Var;
        th3 th3VarA;
        Closeable closeable;
        List list2;
        cc2 cc2Var;
        f5 f5Var2;
        th3 th3Var;
        th3 th3Var2;
        f5 f5Var3;
        ?? A;
        Closeable closeable2;
        List list3;
        cc2 cc2Var2;
        f5 f5Var4;
        Closeable closeable3;
        Closeable closeable4;
        f5 f5Var5;
        Object objA;
        Object obj;
        cc2 cc2Var3;
        f5 f5Var6;
        Closeable closeable5;
        Closeable closeable6;
        Object objA2;
        Object obj2;
        cc2 cc2Var4;
        f5 f5Var7;
        Closeable closeable7;
        th3 th3Var3;
        List list4 = list;
        if (continuationImpl instanceof tj2) {
            tj2Var = (tj2) continuationImpl;
            int i5 = tj2Var.f9960j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tj2Var.f9960j = i5 - Integer.MIN_VALUE;
            } else {
                tj2Var = new tj2(this, continuationImpl);
            }
        }
        tj2 tj2Var2 = tj2Var;
        Object objC = tj2Var2.f9958h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        switch (tj2Var2.f9960j) {
            case 0:
                ResultKt.b(objC);
                tj2Var2.f9951a = this;
                tj2Var2.f9952b = list4;
                tj2Var2.f9960j = 1;
                objC = c(list4, tj2Var2);
                if (objC != coroutineSingletons) {
                    fl2Var = this;
                    f5Var = (f5) objC;
                    if (f5Var != null) {
                        return null;
                    }
                    kz2 kz2Var = fl2Var.f3407e;
                    wv0 wv0Var = wv0.CUI_NAME_CENTRALIZED_MANAGER_PRELOAD;
                    EmptyList emptyList = EmptyList.f71733a;
                    mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                    if (ji3.b().f4777a == null) {
                        A = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                        try {
                            cc2 cc2VarE = ji3.a().e();
                            tj2Var2.f9951a = f5Var;
                            tj2Var2.f9952b = A;
                            tj2Var2.f9953c = A;
                            tj2Var2.f9954d = cc2VarE;
                            tj2Var2.f9955e = list4;
                            tj2Var2.f9956f = f5Var;
                            tj2Var2.f9957g = fl2Var;
                            tj2Var2.f9960j = 2;
                            Object objA3 = fl2Var.a(list4, tj2Var2);
                            if (objA3 != coroutineSingletons) {
                                list3 = list4;
                                cc2Var2 = cc2VarE;
                                f5Var4 = f5Var;
                                closeable3 = A;
                                closeable4 = closeable3;
                                f5Var5 = f5Var4;
                                objC = objA3;
                                try {
                                    int iIntValue = ((Number) objC).intValue();
                                    tj2Var2.f9951a = f5Var4;
                                    tj2Var2.f9952b = closeable4;
                                    tj2Var2.f9953c = closeable3;
                                    tj2Var2.f9954d = cc2Var2;
                                    tj2Var2.f9955e = null;
                                    tj2Var2.f9956f = null;
                                    tj2Var2.f9957g = null;
                                    tj2Var2.f9960j = 3;
                                    objA = fl2Var.a(f5Var5, list3, iIntValue, (Integer) null, (Boolean) null, tj2Var2);
                                    if (objA == coroutineSingletons) {
                                        obj = objA;
                                        cc2Var3 = cc2Var2;
                                        f5Var6 = f5Var4;
                                        cc2Var3.L = (vr) obj;
                                        tj2Var2.f9951a = f5Var6;
                                        tj2Var2.f9952b = closeable4;
                                        tj2Var2.f9953c = closeable3;
                                        tj2Var2.f9954d = null;
                                        tj2Var2.f9960j = 4;
                                        f5Var6.getClass();
                                        if (f5.c(f5Var6, tj2Var2) != coroutineSingletons) {
                                            closeable5 = closeable3;
                                            closeable6 = closeable4;
                                            Unit unit = Unit.f71706a;
                                            CloseableKt.a(closeable5, null);
                                            return f5Var6;
                                        }
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                    closeable2 = closeable3;
                                    A = closeable4;
                                    try {
                                        A.b(th);
                                        if (!(th instanceof b.a4)) {
                                        }
                                    } finally {
                                    }
                                }
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            closeable2 = A;
                            A.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                    } else {
                        th3VarA = ji3.a(wv0Var, emptyList, true);
                        try {
                            cc2 cc2VarE2 = ji3.a().e();
                            tj2Var2.f9951a = f5Var;
                            tj2Var2.f9952b = th3VarA;
                            tj2Var2.f9953c = th3VarA;
                            tj2Var2.f9954d = cc2VarE2;
                            tj2Var2.f9955e = list4;
                            tj2Var2.f9956f = f5Var;
                            tj2Var2.f9957g = fl2Var;
                            tj2Var2.f9960j = 5;
                            Object objA4 = fl2Var.a(list4, tj2Var2);
                            if (objA4 != coroutineSingletons) {
                                list2 = list4;
                                cc2Var = cc2VarE2;
                                f5Var2 = f5Var;
                                th3Var = th3VarA;
                                th3Var2 = th3Var;
                                f5Var3 = f5Var2;
                                objC = objA4;
                                try {
                                    int iIntValue2 = ((Number) objC).intValue();
                                    tj2Var2.f9951a = f5Var2;
                                    tj2Var2.f9952b = th3Var2;
                                    tj2Var2.f9953c = th3Var;
                                    tj2Var2.f9954d = cc2Var;
                                    tj2Var2.f9955e = null;
                                    tj2Var2.f9956f = null;
                                    tj2Var2.f9957g = null;
                                    tj2Var2.f9960j = 6;
                                    objA2 = fl2Var.a(f5Var3, list2, iIntValue2, (Integer) null, (Boolean) null, tj2Var2);
                                    if (objA2 == coroutineSingletons) {
                                        obj2 = objA2;
                                        cc2Var4 = cc2Var;
                                        f5Var7 = f5Var2;
                                        cc2Var4.L = (vr) obj2;
                                        tj2Var2.f9951a = f5Var7;
                                        tj2Var2.f9952b = th3Var2;
                                        tj2Var2.f9953c = th3Var;
                                        tj2Var2.f9954d = null;
                                        tj2Var2.f9960j = 7;
                                        f5Var7.getClass();
                                        if (f5.c(f5Var7, tj2Var2) != coroutineSingletons) {
                                            closeable7 = th3Var;
                                            th3Var3 = th3Var2;
                                            Unit unit2 = Unit.f71706a;
                                            CloseableKt.a(closeable7, null);
                                            return f5Var7;
                                        }
                                    }
                                } catch (Throwable th4) {
                                    th = th4;
                                    closeable = th3Var;
                                    th3VarA = th3Var2;
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
                        } catch (Throwable th5) {
                            th = th5;
                            closeable = th3VarA;
                            th3VarA.b(th);
                            if (!(th instanceof b.a4)) {
                            }
                        }
                    }
                }
                return coroutineSingletons;
            case 1:
                list4 = (List) tj2Var2.f9952b;
                fl2Var = (fl2) tj2Var2.f9951a;
                ResultKt.b(objC);
                f5Var = (f5) objC;
                if (f5Var != null) {
                }
                break;
            case 2:
                fl2 fl2Var2 = tj2Var2.f9957g;
                f5 f5Var8 = tj2Var2.f9956f;
                List list5 = tj2Var2.f9955e;
                cc2 cc2Var5 = tj2Var2.f9954d;
                Closeable closeable8 = tj2Var2.f9953c;
                th3 th3Var4 = (th3) tj2Var2.f9952b;
                f5 f5Var9 = (f5) tj2Var2.f9951a;
                try {
                    ResultKt.b(objC);
                    fl2Var = fl2Var2;
                    cc2Var2 = cc2Var5;
                    list3 = list5;
                    f5Var5 = f5Var8;
                    closeable3 = closeable8;
                    closeable4 = th3Var4;
                    f5Var4 = f5Var9;
                    int iIntValue3 = ((Number) objC).intValue();
                    tj2Var2.f9951a = f5Var4;
                    tj2Var2.f9952b = closeable4;
                    tj2Var2.f9953c = closeable3;
                    tj2Var2.f9954d = cc2Var2;
                    tj2Var2.f9955e = null;
                    tj2Var2.f9956f = null;
                    tj2Var2.f9957g = null;
                    tj2Var2.f9960j = 3;
                    objA = fl2Var.a(f5Var5, list3, iIntValue3, (Integer) null, (Boolean) null, tj2Var2);
                    if (objA == coroutineSingletons) {
                    }
                } catch (Throwable th6) {
                    th = th6;
                    closeable2 = closeable8;
                    A = th3Var4;
                    A.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
                break;
            case 3:
                cc2 cc2Var6 = tj2Var2.f9954d;
                closeable2 = tj2Var2.f9953c;
                A = (th3) tj2Var2.f9952b;
                f5 f5Var10 = (f5) tj2Var2.f9951a;
                try {
                    ResultKt.b(objC);
                    closeable3 = closeable2;
                    closeable4 = A;
                    obj = objC;
                    cc2Var3 = cc2Var6;
                    f5Var6 = f5Var10;
                    cc2Var3.L = (vr) obj;
                    tj2Var2.f9951a = f5Var6;
                    tj2Var2.f9952b = closeable4;
                    tj2Var2.f9953c = closeable3;
                    tj2Var2.f9954d = null;
                    tj2Var2.f9960j = 4;
                    f5Var6.getClass();
                    if (f5.c(f5Var6, tj2Var2) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                } catch (Throwable th7) {
                    th = th7;
                    A.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            A.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            case 4:
                closeable5 = tj2Var2.f9953c;
                closeable6 = (th3) tj2Var2.f9952b;
                f5Var6 = (f5) tj2Var2.f9951a;
                try {
                    ResultKt.b(objC);
                    Unit unit3 = Unit.f71706a;
                    CloseableKt.a(closeable5, null);
                    return f5Var6;
                } catch (Throwable th8) {
                    th = th8;
                    A = closeable6;
                    closeable2 = closeable5;
                    A.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
                break;
            case 5:
                fl2 fl2Var3 = tj2Var2.f9957g;
                f5 f5Var11 = tj2Var2.f9956f;
                List list6 = tj2Var2.f9955e;
                cc2 cc2Var7 = tj2Var2.f9954d;
                ?? r72 = tj2Var2.f9953c;
                th3 th3Var5 = (th3) tj2Var2.f9952b;
                f5 f5Var12 = (f5) tj2Var2.f9951a;
                try {
                    ResultKt.b(objC);
                    fl2Var = fl2Var3;
                    cc2Var = cc2Var7;
                    list2 = list6;
                    f5Var3 = f5Var11;
                    th3Var = r72;
                    th3Var2 = th3Var5;
                    f5Var2 = f5Var12;
                    int iIntValue22 = ((Number) objC).intValue();
                    tj2Var2.f9951a = f5Var2;
                    tj2Var2.f9952b = th3Var2;
                    tj2Var2.f9953c = th3Var;
                    tj2Var2.f9954d = cc2Var;
                    tj2Var2.f9955e = null;
                    tj2Var2.f9956f = null;
                    tj2Var2.f9957g = null;
                    tj2Var2.f9960j = 6;
                    objA2 = fl2Var.a(f5Var3, list2, iIntValue22, (Integer) null, (Boolean) null, tj2Var2);
                    if (objA2 == coroutineSingletons) {
                    }
                } catch (Throwable th9) {
                    th = th9;
                    closeable = r72;
                    th3VarA = th3Var5;
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
                break;
            case 6:
                cc2 cc2Var8 = tj2Var2.f9954d;
                closeable = tj2Var2.f9953c;
                th3VarA = (th3) tj2Var2.f9952b;
                f5 f5Var13 = (f5) tj2Var2.f9951a;
                try {
                    ResultKt.b(objC);
                    th3Var = closeable;
                    th3Var2 = th3VarA;
                    obj2 = objC;
                    cc2Var4 = cc2Var8;
                    f5Var7 = f5Var13;
                    cc2Var4.L = (vr) obj2;
                    tj2Var2.f9951a = f5Var7;
                    tj2Var2.f9952b = th3Var2;
                    tj2Var2.f9953c = th3Var;
                    tj2Var2.f9954d = null;
                    tj2Var2.f9960j = 7;
                    f5Var7.getClass();
                    if (f5.c(f5Var7, tj2Var2) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                } catch (Throwable th10) {
                    th = th10;
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
                break;
            case 7:
                closeable7 = tj2Var2.f9953c;
                th3Var3 = (th3) tj2Var2.f9952b;
                f5Var7 = (f5) tj2Var2.f9951a;
                try {
                    ResultKt.b(objC);
                    Unit unit22 = Unit.f71706a;
                    CloseableKt.a(closeable7, null);
                    return f5Var7;
                } catch (Throwable th11) {
                    th = th11;
                    th3VarA = th3Var3;
                    closeable = closeable7;
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3VarA.a(th);
                        }
                        if (!(th instanceof TimeoutCancellationException)) {
                            if (!(th instanceof CancellationException)) {
                                if (th instanceof dv0) {
                                    throw th;
                                }
                                throw new iu0(th);
                            }
                            throw new du0(th);
                        }
                        throw new lw0(th);
                    }
                    throw th;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(fl2 fl2Var, String str, a0 a0Var, ni.z zVar, ContinuationImpl continuationImpl) throws Throwable {
        xj2 xj2Var;
        fl2 fl2Var2;
        String str2;
        a0 a0Var2;
        d dVar;
        ni.z zVar2;
        if (continuationImpl instanceof xj2) {
            xj2Var = (xj2) continuationImpl;
            int i5 = xj2Var.f11754j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xj2Var.f11754j = i5 - Integer.MIN_VALUE;
            } else {
                xj2Var = new xj2(fl2Var, continuationImpl);
            }
        }
        Object obj = xj2Var.f11752h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xj2Var.f11754j;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = fl2Var.f3416p;
                xj2Var.f11745a = fl2Var;
                xj2Var.f11746b = str;
                xj2Var.f11747c = a0Var;
                xj2Var.f11748d = zVar;
                xj2Var.f11749e = dVar2;
                xj2Var.f11750f = fl2Var;
                xj2Var.f11751g = str;
                xj2Var.f11754j = 1;
                if (dVar2.e(xj2Var) != coroutineSingletons) {
                    fl2Var2 = fl2Var;
                    str2 = str;
                    a0Var2 = a0Var;
                    dVar = dVar2;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str = xj2Var.f11751g;
            fl2Var = xj2Var.f11750f;
            dVar = xj2Var.f11749e;
            zVar = xj2Var.f11748d;
            a0 a0Var3 = xj2Var.f11747c;
            String str3 = xj2Var.f11746b;
            fl2Var2 = xj2Var.f11745a;
            ResultKt.b(obj);
            a0Var2 = a0Var3;
            str2 = str3;
            LinkedHashMap linkedHashMap = fl2Var2.f3425y;
            dVar.g(null);
            ak2 ak2Var = new ak2(fl2Var2, str2, a0Var2, zVar2, null, 0);
            xj2Var.f11745a = null;
            xj2Var.f11746b = null;
            xj2Var.f11747c = null;
            xj2Var.f11748d = null;
            xj2Var.f11749e = null;
            xj2Var.f11750f = null;
            xj2Var.f11751g = null;
            xj2Var.f11754j = 2;
            Object objA = fl2Var.a(str, linkedHashMap, ak2Var, xj2Var);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
        zVar2 = zVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(mi.g gVar, ni.z zVar, a0 a0Var, fl2 fl2Var, String str, ContinuationImpl continuationImpl) throws Throwable {
        bk2 bk2Var;
        mi.g gVar2;
        fl2 fl2Var2;
        String str2;
        String str3;
        d dVar;
        a0 a0Var2;
        ni.z zVar2;
        fl2 fl2Var3 = fl2Var;
        if (continuationImpl instanceof bk2) {
            bk2Var = (bk2) continuationImpl;
            int i5 = bk2Var.f1455k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bk2Var.f1455k = i5 - Integer.MIN_VALUE;
            } else {
                bk2Var = new bk2(fl2Var3, continuationImpl);
            }
        }
        Object obj = bk2Var.f1453i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bk2Var.f1455k;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = fl2Var3.f3416p;
                bk2Var.f1445a = fl2Var3;
                bk2Var.f1446b = str;
                bk2Var.f1447c = a0Var;
                bk2Var.f1448d = gVar;
                bk2Var.f1449e = zVar;
                bk2Var.f1450f = dVar2;
                bk2Var.f1451g = fl2Var3;
                bk2Var.f1452h = str;
                bk2Var.f1455k = 1;
                if (dVar2.e(bk2Var) != coroutineSingletons) {
                    gVar2 = gVar;
                    fl2Var2 = fl2Var3;
                    str2 = str;
                    str3 = str2;
                    dVar = dVar2;
                    a0Var2 = a0Var;
                    zVar2 = zVar;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str2 = bk2Var.f1452h;
            fl2Var3 = bk2Var.f1451g;
            dVar = bk2Var.f1450f;
            ni.z zVar3 = bk2Var.f1449e;
            mi.g gVar3 = bk2Var.f1448d;
            a0 a0Var3 = bk2Var.f1447c;
            String str4 = bk2Var.f1446b;
            fl2 fl2Var4 = bk2Var.f1445a;
            ResultKt.b(obj);
            a0Var2 = a0Var3;
            str3 = str4;
            fl2Var2 = fl2Var4;
            zVar2 = zVar3;
            gVar2 = gVar3;
            LinkedHashMap linkedHashMap = fl2Var2.f3426z;
            dVar.g(null);
            ek2 ek2Var = new ek2(gVar2, zVar2, a0Var2, fl2Var2, str3, (Continuation) null);
            bk2Var.f1445a = null;
            bk2Var.f1446b = null;
            bk2Var.f1447c = null;
            bk2Var.f1448d = null;
            bk2Var.f1449e = null;
            bk2Var.f1450f = null;
            bk2Var.f1451g = null;
            bk2Var.f1452h = null;
            bk2Var.f1455k = 2;
            Object objA = fl2Var3.a(str2, linkedHashMap, ek2Var, bk2Var);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(ni.z zVar, a0 a0Var, fl2 fl2Var, o oVar, String str, ContinuationImpl continuationImpl) throws Throwable {
        jk2 jk2Var;
        ni.z zVar2;
        fl2 fl2Var2;
        String str2;
        String str3;
        d dVar;
        a0 a0Var2;
        o oVar2;
        fl2 fl2Var3 = fl2Var;
        if (continuationImpl instanceof jk2) {
            jk2Var = (jk2) continuationImpl;
            int i5 = jk2Var.f5285k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jk2Var.f5285k = i5 - Integer.MIN_VALUE;
            } else {
                jk2Var = new jk2(fl2Var3, continuationImpl);
            }
        }
        Object obj = jk2Var.f5283i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jk2Var.f5285k;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = fl2Var3.f3416p;
                jk2Var.f5275a = fl2Var3;
                jk2Var.f5276b = str;
                jk2Var.f5277c = a0Var;
                jk2Var.f5278d = oVar;
                jk2Var.f5279e = zVar;
                jk2Var.f5280f = dVar2;
                jk2Var.f5281g = fl2Var3;
                jk2Var.f5282h = str;
                jk2Var.f5285k = 1;
                if (dVar2.e(jk2Var) != coroutineSingletons) {
                    zVar2 = zVar;
                    fl2Var2 = fl2Var3;
                    str2 = str;
                    str3 = str2;
                    dVar = dVar2;
                    a0Var2 = a0Var;
                    oVar2 = oVar;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            str2 = jk2Var.f5282h;
            fl2Var3 = jk2Var.f5281g;
            dVar = jk2Var.f5280f;
            ni.z zVar3 = jk2Var.f5279e;
            o oVar3 = jk2Var.f5278d;
            a0 a0Var3 = jk2Var.f5277c;
            String str4 = jk2Var.f5276b;
            fl2 fl2Var4 = jk2Var.f5275a;
            ResultKt.b(obj);
            oVar2 = oVar3;
            str3 = str4;
            fl2Var2 = fl2Var4;
            zVar2 = zVar3;
            a0Var2 = a0Var3;
            LinkedHashMap linkedHashMap = fl2Var2.B;
            dVar.g(null);
            ek2 ek2Var = new ek2(zVar2, a0Var2, fl2Var2, oVar2, str3, (Continuation) null);
            jk2Var.f5275a = null;
            jk2Var.f5276b = null;
            jk2Var.f5277c = null;
            jk2Var.f5278d = null;
            jk2Var.f5279e = null;
            jk2Var.f5280f = null;
            jk2Var.f5281g = null;
            jk2Var.f5282h = null;
            jk2Var.f5285k = 2;
            Object objA = fl2Var3.a(str2, linkedHashMap, ek2Var, jk2Var);
            return objA == coroutineSingletons ? coroutineSingletons : objA;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x007b, code lost:
    
        if (((java.lang.Boolean) r8).booleanValue() == false) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0072 -> B:29:0x0075). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(List list, f5 f5Var, ContinuationImpl continuationImpl) {
        si2 si2Var;
        Iterator it;
        if (continuationImpl instanceof si2) {
            si2Var = (si2) continuationImpl;
            int i5 = si2Var.f9576d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                si2Var.f9576d = i5 - Integer.MIN_VALUE;
            } else {
                si2Var = new si2(this, continuationImpl);
            }
        }
        Object objD = si2Var.f9574b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = si2Var.f9576d;
        boolean z11 = true;
        if (i11 == 0) {
            ArrayList arrayListX = c0.x(objD);
            for (Object obj : list) {
                if (!Intrinsics.b((f5) obj, f5Var)) {
                    arrayListX.add(obj);
                }
            }
            if (!arrayListX.isEmpty()) {
                it = arrayListX.iterator();
                if (it.hasNext()) {
                    f5 f5Var2 = (f5) it.next();
                    si2Var.f9573a = it;
                    si2Var.f9576d = 1;
                    f5Var2.getClass();
                    objD = f5.d(f5Var2, si2Var);
                    if (objD == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
            }
            z11 = false;
            return Boolean.valueOf(z11);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        it = si2Var.f9573a;
        ResultKt.b(objD);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(fl2 fl2Var, ContinuationImpl continuationImpl) {
        vj2 vj2Var;
        d dVar;
        if (continuationImpl instanceof vj2) {
            vj2Var = (vj2) continuationImpl;
            int i5 = vj2Var.f10808e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vj2Var.f10808e = i5 - Integer.MIN_VALUE;
            } else {
                vj2Var = new vj2(fl2Var, continuationImpl);
            }
        }
        Object obj = vj2Var.f10806c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vj2Var.f10808e;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = fl2Var.f3409g;
            jr0Var.getClass();
            Boolean bool = Boolean.FALSE;
            jn jnVar = jn.a$10;
            fl2Var.f3418r = ((Boolean) jr0Var.a("gads:preload:bind_to_online:enabled", bool, jnVar)).booleanValue();
            jr0Var.getClass();
            fl2Var.f3419s = ((Boolean) jr0Var.a("gads:preload:bind_on_foreground", bool, jnVar)).booleanValue();
            fl2Var.f3420t = ((Boolean) jr0Var.a("gads:preload_app_open_in_background", bool, jnVar)).booleanValue();
            fl2Var.G = ((Boolean) jr0Var.a("gads:centralized_preload_manager:enabled", bool, jnVar)).booleanValue();
            dVar = fl2Var.f3416p;
            vj2Var.f10804a = fl2Var;
            vj2Var.f10805b = dVar;
            vj2Var.f10808e = 1;
            if (dVar.e(vj2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = vj2Var.f10805b;
            fl2 fl2Var2 = vj2Var.f10804a;
            ResultKt.b(obj);
            dVar = dVar2;
            fl2Var = fl2Var2;
        }
        try {
            if (!fl2Var.f3418r) {
                fl2Var.f3423w = true;
            }
            if (!fl2Var.f3419s) {
                fl2Var.f3421u = true;
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return new xu0(unit);
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x016c  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(f5 f5Var, List list, int i5, Integer num, Boolean bool, ContinuationImpl continuationImpl) {
        ui2 ui2Var;
        wr wrVar;
        List list2;
        Object obj;
        wr wrVar2;
        Boolean bool2;
        Integer num2;
        wr wrVar3;
        xv0 xv0Var;
        Boolean bool3;
        wr wrVar4;
        f5 f5Var2;
        wr wrVar5;
        int iIntValue;
        wr wrVar6;
        wr wrVar7;
        wr wrVar8;
        boolean zBooleanValue;
        if (continuationImpl instanceof ui2) {
            ui2Var = (ui2) continuationImpl;
            int i11 = ui2Var.f10356k;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                ui2Var.f10356k = i11 - Integer.MIN_VALUE;
            } else {
                ui2Var = new ui2(this, continuationImpl);
            }
        }
        Object objE = ui2Var.f10354i;
        Object obj2 = CoroutineSingletons.f71806a;
        int i12 = ui2Var.f10356k;
        if (i12 == 0) {
            ResultKt.b(objE);
            b.pb pbVarO = vr.o();
            Intrinsics.f(pbVarO, "newBuilder(...)");
            wrVar = new wr(pbVarO);
            ui2Var.f10346a = f5Var;
            ui2Var.f10347b = list;
            ui2Var.f10348c = num;
            ui2Var.f10349d = bool;
            ui2Var.f10350e = wrVar;
            ui2Var.f10351f = wrVar;
            ui2Var.f10352g = wrVar;
            ui2Var.f10353h = i5;
            ui2Var.f10356k = 1;
            Object objK = k(ui2Var);
            if (objK != obj2) {
                list2 = list;
                obj = objK;
                wrVar2 = wrVar;
                bool2 = bool;
                num2 = num;
                wrVar3 = wrVar2;
            }
            return obj2;
        }
        if (i12 != 1) {
            if (i12 != 2) {
                if (i12 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                wrVar7 = (wr) ui2Var.f10347b;
                wrVar8 = (wr) ui2Var.f10346a;
                ResultKt.b(objE);
                wrVar3 = wrVar8;
                wrVar2 = wrVar7;
                zBooleanValue = ((Boolean) objE).booleanValue();
                b.pb pbVar = wrVar2.f11367a;
                pbVar.b();
                ((vr) pbVar.f1095b).preloaderInFlight_ = zBooleanValue;
                return (vr) wrVar3.f11367a.a();
            }
            wrVar5 = ui2Var.f10350e;
            f5Var2 = (f5) ui2Var.f10349d;
            wrVar4 = (wr) ui2Var.f10348c;
            wrVar3 = (wr) ui2Var.f10347b;
            bool3 = (Boolean) ui2Var.f10346a;
            ResultKt.b(objE);
            iIntValue = ((Number) objE).intValue();
            wr wrVar9 = wrVar4;
            wrVar6 = wrVar5;
            f5Var = f5Var2;
            wrVar2 = wrVar9;
            b.pb pbVar2 = wrVar6.f11367a;
            pbVar2.b();
            ((vr) pbVar2.f1095b).preloaderNumAdsAvailable_ = iIntValue;
            if (bool3 != null) {
                zBooleanValue = bool3.booleanValue();
                b.pb pbVar3 = wrVar2.f11367a;
                pbVar3.b();
                ((vr) pbVar3.f1095b).preloaderInFlight_ = zBooleanValue;
                return (vr) wrVar3.f11367a.a();
            }
            ui2Var.f10346a = wrVar3;
            ui2Var.f10347b = wrVar2;
            ui2Var.f10348c = null;
            ui2Var.f10349d = null;
            ui2Var.f10350e = null;
            ui2Var.f10351f = null;
            ui2Var.f10352g = null;
            ui2Var.f10356k = 3;
            f5Var.getClass();
            objE = f5.e(f5Var, ui2Var);
            if (objE != obj2) {
                wrVar7 = wrVar2;
                wrVar8 = wrVar3;
                wrVar3 = wrVar8;
                wrVar2 = wrVar7;
                zBooleanValue = ((Boolean) objE).booleanValue();
                b.pb pbVar32 = wrVar2.f11367a;
                pbVar32.b();
                ((vr) pbVar32.f1095b).preloaderInFlight_ = zBooleanValue;
                return (vr) wrVar3.f11367a.a();
            }
            return obj2;
        }
        i5 = ui2Var.f10353h;
        wr wrVar10 = ui2Var.f10352g;
        wrVar2 = ui2Var.f10351f;
        wrVar3 = ui2Var.f10350e;
        Boolean bool4 = (Boolean) ui2Var.f10349d;
        Integer num3 = (Integer) ui2Var.f10348c;
        list2 = (List) ui2Var.f10347b;
        f5 f5Var3 = (f5) ui2Var.f10346a;
        ResultKt.b(objE);
        wrVar = wrVar10;
        f5Var = f5Var3;
        obj = objE;
        bool2 = bool4;
        num2 = num3;
        int iIntValue2 = ((Number) obj).intValue();
        b.pb pbVar4 = wrVar.f11367a;
        pbVar4.b();
        ((vr) pbVar4.f1095b).totalInflightAdLimit_ = iIntValue2;
        b.pb pbVar5 = wrVar2.f11367a;
        pbVar5.b();
        ((vr) pbVar5.f1095b).numPreloadedAds_ = i5;
        int size = list2.size();
        pbVar5.b();
        ((vr) pbVar5.f1095b).numPreloaders_ = size;
        if (f5Var != null) {
            switch (f5Var.f3167k.ordinal()) {
                case 0:
                    xv0Var = xv0.FORMAT_UNKNOWN;
                    break;
                case 1:
                    xv0Var = xv0.FORMAT_APP_OPEN;
                    break;
                case 2:
                    xv0Var = xv0.FORMAT_BANNER;
                    break;
                case 3:
                    xv0Var = xv0.FORMAT_ICON;
                    break;
                case 4:
                    xv0Var = xv0.FORMAT_INTERSTITIAL;
                    break;
                case 5:
                    xv0Var = xv0.FORMAT_NATIVE;
                    break;
                case 6:
                    xv0Var = xv0.FORMAT_REWARDED;
                    break;
                case 7:
                    xv0Var = xv0.FORMAT_REWARDED_INTERSTITIAL;
                    break;
                case 8:
                    xv0Var = xv0.FORMAT_SWIPEABLE_INTERSTITIAL;
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
            pbVar5.b();
            vr vrVar = (vr) pbVar5.f1095b;
            vrVar.getClass();
            vrVar.preloaderFormat_ = xv0Var.getNumber();
            String value = f5Var.f3159b;
            Intrinsics.g(value, "value");
            pbVar5.b();
            ((vr) pbVar5.f1095b).b(value);
            int i13 = f5Var.o;
            pbVar5.b();
            ((vr) pbVar5.f1095b).preloaderMaxBufferSize_ = i13;
            if (num2 != null) {
                int iIntValue3 = num2.intValue();
                bool3 = bool2;
                iIntValue = iIntValue3;
                wrVar6 = wrVar2;
                b.pb pbVar22 = wrVar6.f11367a;
                pbVar22.b();
                ((vr) pbVar22.f1095b).preloaderNumAdsAvailable_ = iIntValue;
                if (bool3 != null) {
                }
            } else {
                ui2Var.f10346a = bool2;
                ui2Var.f10347b = wrVar3;
                ui2Var.f10348c = wrVar2;
                ui2Var.f10349d = f5Var;
                ui2Var.f10350e = wrVar2;
                ui2Var.f10351f = null;
                ui2Var.f10352g = null;
                ui2Var.f10356k = 2;
                Object objF = f5.f(f5Var, ui2Var);
                if (objF != obj2) {
                    bool3 = bool2;
                    objE = objF;
                    wrVar4 = wrVar2;
                    f5Var2 = f5Var;
                    wrVar5 = wrVar4;
                    iIntValue = ((Number) objE).intValue();
                    wr wrVar92 = wrVar4;
                    wrVar6 = wrVar5;
                    f5Var = f5Var2;
                    wrVar2 = wrVar92;
                    b.pb pbVar222 = wrVar6.f11367a;
                    pbVar222.b();
                    ((vr) pbVar222.f1095b).preloaderNumAdsAvailable_ = iIntValue;
                    if (bool3 != null) {
                    }
                }
                return obj2;
            }
        }
        return (vr) wrVar3.f11367a.a();
    }

    public final LinkedHashMap a(qw2 qw2Var) {
        switch (qw2Var.ordinal()) {
            case 1:
                return this.f3425y;
            case 2:
                return this.f3426z;
            case 3:
            default:
                return null;
            case 4:
                return this.A;
            case 5:
                return this.B;
            case 6:
                return this.C;
            case 7:
                return this.D;
            case 8:
                return this.F;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0053 -> B:20:0x0056). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(List list, ContinuationImpl continuationImpl) {
        yi2 yi2Var;
        Iterator it;
        int iIntValue;
        if (continuationImpl instanceof yi2) {
            yi2Var = (yi2) continuationImpl;
            int i5 = yi2Var.f12034e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yi2Var.f12034e = i5 - Integer.MIN_VALUE;
            } else {
                yi2Var = new yi2(this, continuationImpl);
            }
        }
        Object objA = yi2Var.f12032c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yi2Var.f12034e;
        if (i11 == 0) {
            ResultKt.b(objA);
            it = list.iterator();
            iIntValue = 0;
            if (it.hasNext()) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            iIntValue = yi2Var.f12031b;
            it = yi2Var.f12030a;
            ResultKt.b(objA);
            iIntValue += ((Number) objA).intValue();
            if (it.hasNext()) {
                f5 f5Var = (f5) it.next();
                yi2Var.f12030a = it;
                yi2Var.f12031b = iIntValue;
                yi2Var.f12034e = 1;
                objA = f5Var.a(yi2Var);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
                iIntValue += ((Number) objA).intValue();
                if (it.hasNext()) {
                    return new Integer(iIntValue);
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0072, code lost:
    
        if (r12.e(r0) == r1) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00d0, code lost:
    
        if (r2.s(r0) == r1) goto L41;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00c4 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(fl2 fl2Var, long j11, ContinuationImpl continuationImpl) {
        cj2 cj2Var;
        List arrayList;
        d dVar;
        fl2 fl2Var2;
        long j12;
        Iterator it;
        if (continuationImpl instanceof cj2) {
            cj2Var = (cj2) continuationImpl;
            int i5 = cj2Var.f1910g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cj2Var.f1910g = i5 - Integer.MIN_VALUE;
            } else {
                cj2Var = new cj2(fl2Var, continuationImpl);
            }
        }
        Object obj = cj2Var.f1908e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cj2Var.f1910g;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (!fl2Var.f3419s) {
                    return Unit.f71706a;
                }
                arrayList = new ArrayList();
                dVar = fl2Var.f3416p;
                cj2Var.f1904a = fl2Var;
                cj2Var.f1905b = arrayList;
                cj2Var.f1906c = dVar;
                cj2Var.f1907d = j11;
                cj2Var.f1910g = 1;
            } else {
                if (i11 != 1) {
                    if (i11 != 2) {
                        if (i11 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    j12 = cj2Var.f1907d;
                    it = (Iterator) cj2Var.f1905b;
                    fl2Var2 = cj2Var.f1904a;
                    ResultKt.b(obj);
                    while (true) {
                        if (!it.hasNext()) {
                            f5 f5Var = (f5) it.next();
                            cj2Var.f1904a = fl2Var2;
                            cj2Var.f1905b = it;
                            cj2Var.f1906c = null;
                            cj2Var.f1907d = j12;
                            cj2Var.f1910g = 2;
                            f5Var.getClass();
                            if (f5.g(f5Var, cj2Var) == coroutineSingletons) {
                                break;
                            }
                        } else {
                            cj2Var.f1904a = null;
                            cj2Var.f1905b = null;
                            cj2Var.f1906c = null;
                            cj2Var.f1910g = 3;
                        }
                    }
                    return coroutineSingletons;
                }
                j11 = cj2Var.f1907d;
                d dVar2 = cj2Var.f1906c;
                arrayList = (List) cj2Var.f1905b;
                fl2 fl2Var3 = cj2Var.f1904a;
                ResultKt.b(obj);
                dVar = dVar2;
                fl2Var = fl2Var3;
            }
            if (Duration.c(j11, fl2Var.f3422v) > 0 && fl2Var.f3421u) {
                fl2Var.f3421u = false;
                fl2Var.f3422v = j11;
                arrayList.addAll(fl2Var.a(new dj2(fl2Var, 0)));
                dVar.g(null);
                if (arrayList.isEmpty()) {
                    return Unit.f71706a;
                }
                Iterator it2 = arrayList.iterator();
                fl2Var2 = fl2Var;
                j12 = j11;
                it = it2;
                while (true) {
                    if (!it.hasNext()) {
                    }
                }
                return coroutineSingletons;
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.x
    public final Object a(long j11, i iVar) {
        return c(this, j11, iVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:110:0x022f, code lost:
    
        if (r4.s(r7) != r0) goto L112;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:106:0x020c  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0246 A[Catch: all -> 0x0252, TryCatch #7 {all -> 0x0252, blocks: (B:118:0x023f, B:120:0x0246, B:122:0x024a, B:124:0x024e, B:127:0x0255, B:129:0x0259, B:131:0x025d, B:133:0x0261, B:134:0x0262, B:135:0x0267, B:136:0x0268, B:137:0x026f, B:138:0x0270, B:139:0x0277, B:140:0x0278), top: B:162:0x023f, outer: #11 }] */
    /* JADX WARN: Removed duplicated region for block: B:140:0x0278 A[Catch: all -> 0x0252, TRY_LEAVE, TryCatch #7 {all -> 0x0252, blocks: (B:118:0x023f, B:120:0x0246, B:122:0x024a, B:124:0x024e, B:127:0x0255, B:129:0x0259, B:131:0x025d, B:133:0x0261, B:134:0x0262, B:135:0x0267, B:136:0x0268, B:137:0x026f, B:138:0x0270, B:139:0x0277, B:140:0x0278), top: B:162:0x023f, outer: #11 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00d6 A[Catch: all -> 0x00de, TRY_LEAVE, TryCatch #14 {all -> 0x00de, blocks: (B:41:0x00d2, B:43:0x00d6, B:48:0x00e2, B:50:0x010d, B:98:0x01bf), top: B:173:0x00d2 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00e2 A[Catch: all -> 0x00de, TRY_ENTER, TryCatch #14 {all -> 0x00de, blocks: (B:41:0x00d2, B:43:0x00d6, B:48:0x00e2, B:50:0x010d, B:98:0x01bf), top: B:173:0x00d2 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0180 A[Catch: all -> 0x018c, TryCatch #5 {all -> 0x018c, blocks: (B:68:0x0179, B:70:0x0180, B:72:0x0184, B:74:0x0188, B:77:0x018f, B:79:0x0193, B:81:0x0197, B:83:0x019b, B:84:0x019c, B:85:0x01a1, B:86:0x01a2, B:87:0x01a9, B:88:0x01aa, B:89:0x01b1, B:90:0x01b2), top: B:159:0x0179, outer: #11 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01b2 A[Catch: all -> 0x018c, TRY_LEAVE, TryCatch #5 {all -> 0x018c, blocks: (B:68:0x0179, B:70:0x0180, B:72:0x0184, B:74:0x0188, B:77:0x018f, B:79:0x0193, B:81:0x0197, B:83:0x019b, B:84:0x019c, B:85:0x01a1, B:86:0x01a2, B:87:0x01a9, B:88:0x01aa, B:89:0x01b1, B:90:0x01b2), top: B:159:0x0179, outer: #11 }] */
    /* JADX WARN: Type inference failed for: r14v12, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v19, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v22 */
    /* JADX WARN: Type inference failed for: r1v27 */
    /* JADX WARN: Type inference failed for: r1v28, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v29, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r1v32 */
    /* JADX WARN: Type inference failed for: r1v35 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v16 */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v19, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r3v22 */
    /* JADX WARN: Type inference failed for: r3v23, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r3v27 */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r3v32, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r3v35 */
    /* JADX WARN: Type inference failed for: r3v39 */
    /* JADX WARN: Type inference failed for: r4v10, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r5v3, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r5v6, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(wv0 wv0Var, ContinuationImpl continuationImpl) {
        uj2 uj2Var;
        Throwable th2;
        d dVar;
        wv0 wv0Var2;
        fl2 fl2Var;
        ArrayList arrayListB;
        TimeoutCancellationException timeoutCancellationException;
        th3 th3Var;
        cc2 cc2VarE;
        fl2 fl2Var2;
        d dVar2;
        th3 th3Var2;
        th3 th3Var3;
        fl2 fl2Var3;
        TimeoutCancellationException timeoutCancellationException2;
        th3 th3Var4;
        cc2 cc2VarE2;
        fl2 fl2Var4;
        d dVar3;
        em2 em2Var;
        em2 em2Var2;
        fl2 fl2Var5;
        cc2 cc2Var;
        em2 em2Var3;
        ?? r12;
        ?? r32;
        fl2 fl2Var6;
        cc2 cc2Var2;
        th3 th3Var5;
        ?? r13;
        ?? r33;
        d dVar4;
        if (continuationImpl instanceof uj2) {
            uj2Var = (uj2) continuationImpl;
            int i5 = uj2Var.f10377j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uj2Var.f10377j = i5 - Integer.MIN_VALUE;
            } else {
                uj2Var = new uj2(this, continuationImpl);
            }
        }
        uj2 uj2Var2 = uj2Var;
        Object objA = uj2Var2.f10375h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        d dVar5 = null;
        d dVar6 = null;
        try {
            try {
                switch (uj2Var2.f10377j) {
                    case 0:
                        ResultKt.b(objA);
                        dVar = this.f3416p;
                        uj2Var2.f10368a = this;
                        uj2Var2.f10369b = wv0Var;
                        uj2Var2.f10370c = dVar;
                        uj2Var2.f10377j = 1;
                        if (dVar.e(uj2Var2) != coroutineSingletons) {
                            wv0Var2 = wv0Var;
                            fl2Var = this;
                            try {
                                if (fl2Var.E) {
                                    Unit unit = Unit.f71706a;
                                    dVar.g(null);
                                    return unit;
                                }
                                fl2Var.E = false;
                                arrayListB = fl2Var.b();
                                kz2 kz2Var = fl2Var.f3407e;
                                EmptyList emptyList = EmptyList.f71733a;
                                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                                if (ji3.b().f4777a == null) {
                                    em2 em2VarA = kz2.a(kz2Var, wv0Var2, emptyList, mi3Var);
                                    try {
                                        cc2VarE2 = ji3.a().e();
                                        uj2Var2.f10368a = fl2Var;
                                        uj2Var2.f10369b = dVar;
                                        uj2Var2.f10370c = em2VarA;
                                        uj2Var2.f10371d = em2VarA;
                                        uj2Var2.f10372e = cc2VarE2;
                                        uj2Var2.f10373f = arrayListB;
                                        uj2Var2.f10374g = fl2Var;
                                        uj2Var2.f10377j = 2;
                                        Object objA2 = fl2Var.a(arrayListB, uj2Var2);
                                        if (objA2 != coroutineSingletons) {
                                            fl2Var4 = fl2Var;
                                            dVar3 = dVar;
                                            em2Var = em2VarA;
                                            em2Var2 = em2Var;
                                            objA = objA2;
                                            fl2Var5 = fl2Var4;
                                            cc2Var = cc2VarE2;
                                            try {
                                                int iIntValue = ((Number) objA).intValue();
                                                uj2Var2.f10368a = fl2Var4;
                                                uj2Var2.f10369b = dVar3;
                                                uj2Var2.f10370c = em2Var2;
                                                uj2Var2.f10371d = em2Var;
                                                uj2Var2.f10372e = cc2Var;
                                                uj2Var2.f10373f = null;
                                                uj2Var2.f10374g = null;
                                                uj2Var2.f10377j = 3;
                                                objA = fl2Var5.a((f5) null, arrayListB, iIntValue, (Integer) null, (Boolean) null, uj2Var2);
                                                if (objA != coroutineSingletons) {
                                                    r12 = em2Var;
                                                    th3Var4 = em2Var2;
                                                    r32 = dVar3;
                                                    fl2Var6 = fl2Var4;
                                                    cc2Var.L = (vr) objA;
                                                    Unit unit2 = Unit.f71706a;
                                                    CloseableKt.a(r12, null);
                                                    dVar4 = r32;
                                                    dVar5 = dVar4;
                                                    dVar5.g(null);
                                                    uj2Var2.f10368a = null;
                                                    uj2Var2.f10369b = null;
                                                    uj2Var2.f10370c = null;
                                                    uj2Var2.f10371d = null;
                                                    uj2Var2.f10372e = null;
                                                    uj2Var2.f10377j = 6;
                                                    break;
                                                }
                                            } catch (Throwable th3) {
                                                timeoutCancellationException2 = th3;
                                                em2Var3 = em2Var;
                                                th3Var4 = em2Var2;
                                                dVar6 = dVar3;
                                                try {
                                                    th3Var4.b(timeoutCancellationException2);
                                                    if (timeoutCancellationException2 instanceof b.a4) {
                                                    }
                                                } catch (Throwable th4) {
                                                }
                                            }
                                        }
                                    } catch (Throwable th5) {
                                        timeoutCancellationException2 = th5;
                                        dVar6 = dVar;
                                        th3Var4 = em2VarA;
                                        em2Var3 = em2VarA;
                                        th3Var4.b(timeoutCancellationException2);
                                        if (timeoutCancellationException2 instanceof b.a4) {
                                        }
                                    }
                                } else {
                                    th3 th3VarA = ji3.a(wv0Var2, emptyList, true);
                                    try {
                                        cc2VarE = ji3.a().e();
                                        uj2Var2.f10368a = fl2Var;
                                        uj2Var2.f10369b = dVar;
                                        uj2Var2.f10370c = th3VarA;
                                        uj2Var2.f10371d = th3VarA;
                                        uj2Var2.f10372e = cc2VarE;
                                        uj2Var2.f10373f = arrayListB;
                                        uj2Var2.f10374g = fl2Var;
                                        uj2Var2.f10377j = 4;
                                        Object objA3 = fl2Var.a(arrayListB, uj2Var2);
                                        if (objA3 != coroutineSingletons) {
                                            fl2Var2 = fl2Var;
                                            dVar2 = dVar;
                                            th3Var2 = th3VarA;
                                            th3Var3 = th3Var2;
                                            objA = objA3;
                                            fl2Var3 = fl2Var2;
                                            cc2Var2 = cc2VarE;
                                            try {
                                                int iIntValue2 = ((Number) objA).intValue();
                                                uj2Var2.f10368a = fl2Var2;
                                                uj2Var2.f10369b = dVar2;
                                                uj2Var2.f10370c = th3Var3;
                                                uj2Var2.f10371d = th3Var2;
                                                uj2Var2.f10372e = cc2Var2;
                                                uj2Var2.f10373f = null;
                                                uj2Var2.f10374g = null;
                                                uj2Var2.f10377j = 5;
                                                objA = fl2Var3.a((f5) null, arrayListB, iIntValue2, (Integer) null, (Boolean) null, uj2Var2);
                                                if (objA != coroutineSingletons) {
                                                    r13 = th3Var2;
                                                    th3Var = th3Var3;
                                                    r33 = dVar2;
                                                    fl2Var6 = fl2Var2;
                                                    cc2Var2.L = (vr) objA;
                                                    Unit unit3 = Unit.f71706a;
                                                    CloseableKt.a(r13, null);
                                                    dVar4 = r33;
                                                    dVar5 = dVar4;
                                                    dVar5.g(null);
                                                    uj2Var2.f10368a = null;
                                                    uj2Var2.f10369b = null;
                                                    uj2Var2.f10370c = null;
                                                    uj2Var2.f10371d = null;
                                                    uj2Var2.f10372e = null;
                                                    uj2Var2.f10377j = 6;
                                                }
                                            } catch (Throwable th6) {
                                                timeoutCancellationException = th6;
                                                th3Var5 = th3Var2;
                                                th3Var = th3Var3;
                                                dVar6 = dVar2;
                                                try {
                                                    th3Var.b(timeoutCancellationException);
                                                    if (timeoutCancellationException instanceof b.a4) {
                                                    }
                                                } finally {
                                                    try {
                                                        throw th;
                                                    } finally {
                                                        CloseableKt.a(th3Var5, th);
                                                    }
                                                }
                                            }
                                        }
                                    } catch (Throwable th7) {
                                        timeoutCancellationException = th7;
                                        dVar6 = dVar;
                                        th3Var = th3VarA;
                                        th3Var5 = th3VarA;
                                        th3Var.b(timeoutCancellationException);
                                        if (timeoutCancellationException instanceof b.a4) {
                                        }
                                    }
                                }
                            } catch (Throwable th8) {
                                th2 = th8;
                                dVar5 = dVar;
                                dVar5.g(null);
                                throw th2;
                            }
                        }
                        return coroutineSingletons;
                    case 1:
                        ?? r14 = (c80.a) uj2Var2.f10370c;
                        wv0Var2 = (wv0) uj2Var2.f10369b;
                        fl2 fl2Var7 = uj2Var2.f10368a;
                        ResultKt.b(objA);
                        dVar = r14;
                        fl2Var = fl2Var7;
                        if (fl2Var.E) {
                        }
                        break;
                    case 2:
                        fl2 fl2Var8 = uj2Var2.f10374g;
                        ArrayList arrayList = uj2Var2.f10373f;
                        cc2VarE2 = uj2Var2.f10372e;
                        ?? r34 = uj2Var2.f10371d;
                        ?? r42 = (th3) uj2Var2.f10370c;
                        ?? r52 = (c80.a) uj2Var2.f10369b;
                        fl2 fl2Var9 = uj2Var2.f10368a;
                        try {
                            ResultKt.b(objA);
                            em2Var = r34;
                            em2Var2 = r42;
                            dVar3 = r52;
                            fl2Var4 = fl2Var9;
                            arrayListB = arrayList;
                            fl2Var5 = fl2Var8;
                            cc2Var = cc2VarE2;
                            int iIntValue3 = ((Number) objA).intValue();
                            uj2Var2.f10368a = fl2Var4;
                            uj2Var2.f10369b = dVar3;
                            uj2Var2.f10370c = em2Var2;
                            uj2Var2.f10371d = em2Var;
                            uj2Var2.f10372e = cc2Var;
                            uj2Var2.f10373f = null;
                            uj2Var2.f10374g = null;
                            uj2Var2.f10377j = 3;
                            objA = fl2Var5.a((f5) null, arrayListB, iIntValue3, (Integer) null, (Boolean) null, uj2Var2);
                            if (objA != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th9) {
                            timeoutCancellationException2 = th9;
                            em2Var3 = r34;
                            th3Var4 = r42;
                            dVar6 = r52;
                            th3Var4.b(timeoutCancellationException2);
                            if (timeoutCancellationException2 instanceof b.a4) {
                            }
                        }
                        break;
                    case 3:
                        cc2Var = uj2Var2.f10372e;
                        r12 = uj2Var2.f10371d;
                        th3Var4 = (th3) uj2Var2.f10370c;
                        r32 = (c80.a) uj2Var2.f10369b;
                        fl2Var6 = uj2Var2.f10368a;
                        try {
                            ResultKt.b(objA);
                            r12 = r12;
                            r32 = r32;
                            cc2Var.L = (vr) objA;
                            Unit unit22 = Unit.f71706a;
                            CloseableKt.a(r12, null);
                            dVar4 = r32;
                            dVar5 = dVar4;
                            dVar5.g(null);
                            uj2Var2.f10368a = null;
                            uj2Var2.f10369b = null;
                            uj2Var2.f10370c = null;
                            uj2Var2.f10371d = null;
                            uj2Var2.f10372e = null;
                            uj2Var2.f10377j = 6;
                            break;
                        } catch (Throwable th10) {
                            timeoutCancellationException2 = th10;
                            em2Var3 = r12;
                            dVar6 = r32;
                            th3Var4.b(timeoutCancellationException2);
                            if (timeoutCancellationException2 instanceof b.a4) {
                                if (!(timeoutCancellationException2 instanceof TimeoutCancellationException) && !(timeoutCancellationException2 instanceof CancellationException)) {
                                    th3Var4.a(timeoutCancellationException2);
                                }
                                if (!(timeoutCancellationException2 instanceof TimeoutCancellationException)) {
                                    if (!(timeoutCancellationException2 instanceof CancellationException)) {
                                        if (timeoutCancellationException2 instanceof dv0) {
                                            throw timeoutCancellationException2;
                                        }
                                        throw new iu0(timeoutCancellationException2);
                                    }
                                    throw new du0(timeoutCancellationException2);
                                }
                                throw new lw0(timeoutCancellationException2);
                            }
                            throw timeoutCancellationException2;
                        }
                        break;
                    case 4:
                        fl2 fl2Var10 = uj2Var2.f10374g;
                        ArrayList arrayList2 = uj2Var2.f10373f;
                        cc2VarE = uj2Var2.f10372e;
                        ?? r35 = uj2Var2.f10371d;
                        th3 th3Var6 = (th3) uj2Var2.f10370c;
                        ?? r53 = (c80.a) uj2Var2.f10369b;
                        fl2 fl2Var11 = uj2Var2.f10368a;
                        try {
                            ResultKt.b(objA);
                            th3Var2 = r35;
                            th3Var3 = th3Var6;
                            dVar2 = r53;
                            fl2Var2 = fl2Var11;
                            arrayListB = arrayList2;
                            fl2Var3 = fl2Var10;
                            cc2Var2 = cc2VarE;
                            int iIntValue22 = ((Number) objA).intValue();
                            uj2Var2.f10368a = fl2Var2;
                            uj2Var2.f10369b = dVar2;
                            uj2Var2.f10370c = th3Var3;
                            uj2Var2.f10371d = th3Var2;
                            uj2Var2.f10372e = cc2Var2;
                            uj2Var2.f10373f = null;
                            uj2Var2.f10374g = null;
                            uj2Var2.f10377j = 5;
                            objA = fl2Var3.a((f5) null, arrayListB, iIntValue22, (Integer) null, (Boolean) null, uj2Var2);
                            if (objA != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        } catch (Throwable th11) {
                            timeoutCancellationException = th11;
                            th3Var5 = r35;
                            th3Var = th3Var6;
                            dVar6 = r53;
                            th3Var.b(timeoutCancellationException);
                            if (timeoutCancellationException instanceof b.a4) {
                            }
                        }
                        break;
                    case 5:
                        cc2Var2 = uj2Var2.f10372e;
                        r13 = uj2Var2.f10371d;
                        th3Var = (th3) uj2Var2.f10370c;
                        r33 = (c80.a) uj2Var2.f10369b;
                        fl2Var6 = uj2Var2.f10368a;
                        try {
                            ResultKt.b(objA);
                            r13 = r13;
                            r33 = r33;
                            cc2Var2.L = (vr) objA;
                            Unit unit32 = Unit.f71706a;
                            CloseableKt.a(r13, null);
                            dVar4 = r33;
                            dVar5 = dVar4;
                            dVar5.g(null);
                            uj2Var2.f10368a = null;
                            uj2Var2.f10369b = null;
                            uj2Var2.f10370c = null;
                            uj2Var2.f10371d = null;
                            uj2Var2.f10372e = null;
                            uj2Var2.f10377j = 6;
                            break;
                        } catch (Throwable th12) {
                            timeoutCancellationException = th12;
                            th3Var5 = r13;
                            dVar6 = r33;
                            th3Var.b(timeoutCancellationException);
                            if (timeoutCancellationException instanceof b.a4) {
                                if (!(timeoutCancellationException instanceof TimeoutCancellationException) && !(timeoutCancellationException instanceof CancellationException)) {
                                    th3Var.a(timeoutCancellationException);
                                }
                                if (!(timeoutCancellationException instanceof TimeoutCancellationException)) {
                                    if (!(timeoutCancellationException instanceof CancellationException)) {
                                        if (timeoutCancellationException instanceof dv0) {
                                            throw timeoutCancellationException;
                                        }
                                        throw new iu0(timeoutCancellationException);
                                    }
                                    throw new du0(timeoutCancellationException);
                                }
                                throw new lw0(timeoutCancellationException);
                            }
                            throw timeoutCancellationException;
                        }
                    case 6:
                        ResultKt.b(objA);
                        return Unit.f71706a;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable th13) {
                th2 = th13;
                dVar5.g(null);
                throw th2;
            }
        } catch (Throwable th14) {
            th2 = th14;
            dVar = dVar6;
            dVar5 = dVar;
            dVar5.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r10v11 */
    /* JADX WARN: Type inference failed for: r10v15, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r10v17 */
    /* JADX WARN: Type inference failed for: r10v3 */
    /* JADX WARN: Type inference failed for: r10v6 */
    /* JADX WARN: Type inference failed for: r11v11, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r11v9, types: [java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, LinkedHashMap linkedHashMap, Function3 function3, ContinuationImpl continuationImpl) throws Throwable {
        ok2 ok2Var;
        d dVar;
        fl2 fl2Var;
        LinkedHashMap linkedHashMap2;
        Throwable th2;
        String str2;
        ?? r102;
        d dVar2;
        f5 f5Var;
        LinkedHashMap linkedHashMap3;
        if (continuationImpl instanceof ok2) {
            ok2Var = (ok2) continuationImpl;
            int i5 = ok2Var.f7965h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ok2Var.f7965h = i5 - Integer.MIN_VALUE;
            } else {
                ok2Var = new ok2(this, continuationImpl);
            }
        }
        Object obj = ok2Var.f7963f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ok2Var.f7965h;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                ok2Var.f7958a = this;
                ok2Var.f7959b = str;
                ok2Var.f7960c = linkedHashMap;
                ok2Var.f7961d = function3;
                dVar = this.f3416p;
                ok2Var.f7962e = dVar;
                ok2Var.f7965h = 1;
                if (dVar.e(ok2Var) != coroutineSingletons) {
                    fl2Var = this;
                    linkedHashMap2 = linkedHashMap;
                }
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                r102 = (c80.a) ok2Var.f7960c;
                ?? r11 = (Map) ok2Var.f7959b;
                str2 = (String) ok2Var.f7958a;
                try {
                    ResultKt.b(obj);
                    r102 = r102;
                    linkedHashMap3 = r11;
                    f5Var = (f5) obj;
                    linkedHashMap3.put(str2, f5Var);
                    dVar2 = r102;
                    dVar2.g(null);
                    if (f5Var == null) {
                        return Boolean.FALSE;
                    }
                    ok2Var.f7958a = null;
                    ok2Var.f7959b = null;
                    ok2Var.f7960c = null;
                    ok2Var.f7961d = null;
                    ok2Var.f7962e = null;
                    ok2Var.f7965h = 3;
                    Object objH = f5Var.h(ok2Var);
                    return objH == coroutineSingletons ? coroutineSingletons : objH;
                } catch (Throwable th3) {
                    th2 = th3;
                    dVar = r102;
                    dVar.g(null);
                    throw th2;
                }
            }
            d dVar3 = ok2Var.f7962e;
            function3 = ok2Var.f7961d;
            ?? r112 = (Map) ok2Var.f7960c;
            String str3 = (String) ok2Var.f7959b;
            fl2Var = (fl2) ok2Var.f7958a;
            ResultKt.b(obj);
            dVar = dVar3;
            str = str3;
            linkedHashMap2 = r112;
            if (linkedHashMap2.containsKey(str)) {
                cz.b bVar = mu0.f7335a;
                mu0.c("There is already a PreloadConfiguration for preload ID " + str, null);
                dVar2 = dVar;
                f5Var = null;
                dVar2.g(null);
                if (f5Var == null) {
                }
            } else {
                Boolean boolValueOf = Boolean.valueOf(fl2Var.f3423w);
                Boolean boolValueOf2 = Boolean.valueOf(fl2Var.f3421u);
                ok2Var.f7958a = str;
                ok2Var.f7959b = linkedHashMap2;
                ok2Var.f7960c = dVar;
                ok2Var.f7961d = null;
                ok2Var.f7962e = null;
                ok2Var.f7965h = 2;
                Object objInvoke = function3.invoke(boolValueOf, boolValueOf2, ok2Var);
                if (objInvoke != coroutineSingletons) {
                    str2 = str;
                    r102 = dVar;
                    obj = objInvoke;
                    linkedHashMap3 = linkedHashMap2;
                    f5Var = (f5) obj;
                    linkedHashMap3.put(str2, f5Var);
                    dVar2 = r102;
                    dVar2.g(null);
                    if (f5Var == null) {
                    }
                }
            }
        } catch (Throwable th4) {
            th2 = th4;
            dVar.g(null);
            throw th2;
        }
    }

    public final ArrayList a(Function1 function1) {
        Collection collectionValues;
        ArrayList arrayList = new ArrayList();
        i70.a aVar = qw2.n;
        b70.a aVarF = c0.f(aVar, aVar);
        while (aVarF.hasNext()) {
            qw2 qw2Var = (qw2) aVarF.next();
            if (function1 == null || !((Boolean) function1.invoke(qw2Var)).booleanValue()) {
                LinkedHashMap linkedHashMapA = a(qw2Var);
                if (linkedHashMapA != null && (collectionValues = linkedHashMapA.values()) != null) {
                    arrayList.addAll(collectionValues);
                }
            }
        }
        return arrayList;
    }
}
