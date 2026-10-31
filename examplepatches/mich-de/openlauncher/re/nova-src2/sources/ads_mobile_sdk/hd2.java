package ads_mobile_sdk;

import b.ed;
import b.k9;
import b.n7;
import b.o8;
import b.t4;
import c80.d;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.t0;

/* loaded from: classes2.dex */
public final class hd2 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f4330a;

    /* renamed from: b, reason: collision with root package name */
    public final pe2 f4331b;

    /* renamed from: c, reason: collision with root package name */
    public final t4 f4332c;

    /* renamed from: d, reason: collision with root package name */
    public final Map f4333d;

    /* renamed from: e, reason: collision with root package name */
    public final u5 f4334e;

    /* renamed from: f, reason: collision with root package name */
    public final kz2 f4335f;

    /* renamed from: g, reason: collision with root package name */
    public final b.m6 f4336g;

    /* renamed from: h, reason: collision with root package name */
    public final zm1 f4337h;

    /* renamed from: i, reason: collision with root package name */
    public final jx2 f4338i;

    /* renamed from: j, reason: collision with root package name */
    public final q22 f4339j;

    /* renamed from: k, reason: collision with root package name */
    public final ci3 f4340k;

    /* renamed from: l, reason: collision with root package name */
    public final rg0 f4341l;

    /* renamed from: m, reason: collision with root package name */
    public final d f4342m;
    public final LinkedHashSet n;

    public hd2(t70.j0 backgroundScope, pe2 persistentCacheManager, t4 flags, Map componentFactories, u5 adRequestKeyGenerator, kz2 rootTraceCreator, b.m6 randomGenerator, zm1 macroExpander, jx2 retryingUrlPinger, q22 networkConnectivityManager, ci3 traceLogger, rg0 rg0Var) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(persistentCacheManager, "persistentCacheManager");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(componentFactories, "componentFactories");
        Intrinsics.g(adRequestKeyGenerator, "adRequestKeyGenerator");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(randomGenerator, "randomGenerator");
        Intrinsics.g(macroExpander, "macroExpander");
        Intrinsics.g(retryingUrlPinger, "retryingUrlPinger");
        Intrinsics.g(networkConnectivityManager, "networkConnectivityManager");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f4330a = backgroundScope;
        this.f4331b = persistentCacheManager;
        this.f4332c = flags;
        this.f4333d = componentFactories;
        this.f4334e = adRequestKeyGenerator;
        this.f4335f = rootTraceCreator;
        this.f4336g = randomGenerator;
        this.f4337h = macroExpander;
        this.f4338i = retryingUrlPinger;
        this.f4339j = networkConnectivityManager;
        this.f4340k = traceLogger;
        this.f4341l = rg0Var;
        this.f4342m = new d();
        this.n = new LinkedHashSet();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c9 A[Catch: all -> 0x0037, TryCatch #0 {all -> 0x0037, blocks: (B:13:0x0032, B:33:0x00bd, B:38:0x00ce, B:37:0x00c9), top: B:45:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /* JADX WARN: Type inference failed for: r11v11, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r11v14, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r11v16 */
    /* JADX WARN: Type inference failed for: r11v2 */
    /* JADX WARN: Type inference failed for: r11v4 */
    /* JADX WARN: Type inference failed for: r11v6 */
    /* JADX WARN: Type inference failed for: r11v7 */
    /* JADX WARN: Type inference failed for: r11v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(hd2 hd2Var, Pair pair, ue2 ue2Var, ContinuationImpl continuationImpl) throws Throwable {
        ad2 ad2Var;
        int iMin;
        d dVar;
        ?? r11;
        hd2 hd2Var2;
        int i5;
        Pair pair2;
        d dVar2;
        hd2Var.getClass();
        if (continuationImpl instanceof ad2) {
            ad2Var = (ad2) continuationImpl;
            int i11 = ad2Var.f937g;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                ad2Var.f937g = i11 - Integer.MIN_VALUE;
            } else {
                ad2Var = new ad2(hd2Var, continuationImpl);
            }
        }
        Object obj = ad2Var.f935e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = ad2Var.f937g;
        boolean z11 = true;
        try {
            if (i12 == 0) {
                ResultKt.b(obj);
                int iA = hd2Var.f4331b.a((qw2) pair.f71683a);
                t4 t4Var = hd2Var.f4332c;
                t4Var.getClass();
                iMin = Math.min(((Number) t4Var.a("gads:pc:cache_fill_count_per_request", 2, jn.a$15)).intValue(), iA);
                if (ue2Var != null) {
                    iMin++;
                }
                dVar = hd2Var.f4342m;
                ad2Var.f931a = hd2Var;
                ad2Var.f932b = pair;
                ad2Var.f933c = dVar;
                ad2Var.f934d = iMin;
                ad2Var.f937g = 1;
                if (dVar.e(ad2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i12 != 1) {
                if (i12 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i5 = ad2Var.f934d;
                r11 = ad2Var.f933c;
                pair2 = ad2Var.f932b;
                hd2Var2 = ad2Var.f931a;
                try {
                    ResultKt.b(obj);
                    dVar2 = r11;
                    if (((Number) obj).intValue() >= i5) {
                        hd2Var2.n.add(pair2);
                        r11 = dVar2;
                        Boolean boolValueOf = Boolean.valueOf(z11);
                        ((d) r11).g(null);
                        return boolValueOf;
                    }
                    dVar = dVar2;
                    z11 = false;
                    r11 = dVar;
                    Boolean boolValueOf2 = Boolean.valueOf(z11);
                    ((d) r11).g(null);
                    return boolValueOf2;
                } catch (Throwable th2) {
                    th = th2;
                    ((d) r11).g(null);
                    throw th;
                }
            }
            int i13 = ad2Var.f934d;
            ?? r112 = ad2Var.f933c;
            Pair pair3 = ad2Var.f932b;
            hd2 hd2Var3 = ad2Var.f931a;
            ResultKt.b(obj);
            dVar = r112;
            pair = pair3;
            iMin = i13;
            hd2Var = hd2Var3;
            if (hd2Var.n.contains(pair)) {
                z11 = false;
                r11 = dVar;
                Boolean boolValueOf22 = Boolean.valueOf(z11);
                ((d) r11).g(null);
                return boolValueOf22;
            }
            pe2 pe2Var = hd2Var.f4331b;
            qw2 qw2Var = (qw2) pair.f71683a;
            String str = (String) pair.f71684b;
            ad2Var.f931a = hd2Var;
            ad2Var.f932b = pair;
            ad2Var.f933c = dVar;
            ad2Var.f934d = iMin;
            ad2Var.f937g = 2;
            Object objA = pe2Var.a(qw2Var, str, ad2Var);
            if (objA != coroutineSingletons) {
                hd2Var2 = hd2Var;
                i5 = iMin;
                obj = objA;
                d dVar3 = dVar;
                pair2 = pair;
                dVar2 = dVar3;
                if (((Number) obj).intValue() >= i5) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            r11 = dVar;
            ((d) r11).g(null);
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x0150, code lost:
    
        if (r1 != r3) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x015d, code lost:
    
        if (r1 != 2) goto L44;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0127  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001a  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x0150 -> B:14:0x0041). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(hd2 hd2Var, ni.k kVar, qw2 qw2Var, String str, int i5, ue2 ue2Var, ContinuationImpl continuationImpl) {
        bd2 bd2Var;
        qw2 qw2Var2;
        int i11;
        ue2 ue2Var2;
        int i12;
        bd2 bd2Var2;
        ni.k kVar2;
        String str2;
        hd2 hd2Var2;
        ni.k kVar3;
        qw2 qw2Var3;
        String str3;
        ue2 ue2Var3;
        int i13;
        int i14;
        hd2 hd2Var3;
        ni.k kVar4;
        qw2 qw2Var4;
        String str4;
        int i15;
        int i16;
        long j11;
        Object objA;
        hd2 hd2Var4 = hd2Var;
        hd2Var4.getClass();
        if (continuationImpl instanceof bd2) {
            bd2Var = (bd2) continuationImpl;
            int i17 = bd2Var.f1384k;
            if ((i17 & Integer.MIN_VALUE) != 0) {
                bd2Var.f1384k = i17 - Integer.MIN_VALUE;
            } else {
                bd2Var = new bd2(hd2Var4, continuationImpl);
            }
        }
        Object objA2 = bd2Var.f1382i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i18 = bd2Var.f1384k;
        if (i18 == 0) {
            ResultKt.b(objA2);
            qw2Var2 = qw2Var;
            int iA = hd2Var4.f4331b.a(qw2Var2);
            t4 t4Var = hd2Var4.f4332c;
            t4Var.getClass();
            int iMin = Math.min(((Number) t4Var.a("gads:pc:cache_fill_count_per_request", 2, jn.a$15)).intValue(), iA);
            i11 = i5;
            ue2Var2 = ue2Var;
            i12 = iMin;
            bd2Var2 = bd2Var;
            kVar2 = kVar;
            str2 = str;
            if (ue2Var2 == null) {
            }
            pe2 pe2Var = hd2Var4.f4331b;
            bd2Var2.f1374a = hd2Var4;
            bd2Var2.f1375b = kVar2;
            bd2Var2.f1376c = qw2Var2;
            bd2Var2.f1377d = str2;
            bd2Var2.f1378e = ue2Var2;
            bd2Var2.f1379f = i11;
            bd2Var2.f1380g = i12;
            bd2Var2.f1381h = i;
            bd2Var2.f1384k = 1;
            objA = pe2Var.a(qw2Var2, str2, bd2Var2);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i18 == 1) {
            i16 = bd2Var.f1381h;
            i15 = bd2Var.f1380g;
            i11 = bd2Var.f1379f;
            ue2Var2 = bd2Var.f1378e;
            str4 = bd2Var.f1377d;
            qw2Var4 = bd2Var.f1376c;
            kVar4 = bd2Var.f1375b;
            hd2Var3 = bd2Var.f1374a;
            ResultKt.b(objA2);
            if (((Number) objA2).intValue() < i16) {
                t4 t4Var2 = hd2Var3.f4332c;
                t4Var2.getClass();
                Duration.Companion companion = Duration.f72038b;
                j11 = ((Duration) t4Var2.a("gads:pc:refill_wait_time_ms", ed.k(30, DurationUnit.f72046e, "gads:pc:refill_wait_time_ms"), u.a$1)).f72041a;
                bd2Var.f1374a = hd2Var3;
                bd2Var.f1375b = kVar4;
                bd2Var.f1376c = qw2Var4;
                bd2Var.f1377d = str4;
                bd2Var.f1378e = ue2Var2;
                bd2Var.f1379f = i11;
                bd2Var.f1380g = i15;
                bd2Var.f1384k = 2;
                if (t0.c(j11, bd2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            return Unit.f71706a;
        }
        if (i18 != 2) {
            if (i18 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i14 = bd2Var.f1380g;
            i13 = bd2Var.f1379f;
            ue2Var3 = bd2Var.f1378e;
            str3 = bd2Var.f1377d;
            qw2Var3 = bd2Var.f1376c;
            kVar3 = bd2Var.f1375b;
            hd2Var2 = bd2Var.f1374a;
            ResultKt.b(objA2);
            hd2 hd2Var5 = hd2Var2;
            int i19 = i14;
            hd2Var4 = hd2Var5;
            qw2 qw2Var5 = qw2Var3;
            bd2Var2 = bd2Var;
            str2 = str3;
            ue2Var2 = ue2Var3;
            i11 = i13;
            qw2Var2 = qw2Var5;
            int iOrdinal = ((xc2) objA2).ordinal();
            if (iOrdinal != 0) {
                if (iOrdinal != 1) {
                }
                return Unit.f71706a;
            }
            ue2Var2 = null;
            kVar2 = kVar3;
            i12 = i19;
            int i21 = ue2Var2 == null ? i12 + 1 : i12;
            pe2 pe2Var2 = hd2Var4.f4331b;
            bd2Var2.f1374a = hd2Var4;
            bd2Var2.f1375b = kVar2;
            bd2Var2.f1376c = qw2Var2;
            bd2Var2.f1377d = str2;
            bd2Var2.f1378e = ue2Var2;
            bd2Var2.f1379f = i11;
            bd2Var2.f1380g = i12;
            bd2Var2.f1381h = i21;
            bd2Var2.f1384k = 1;
            objA = pe2Var2.a(qw2Var2, str2, bd2Var2);
            if (objA != coroutineSingletons) {
                hd2Var3 = hd2Var4;
                i16 = i21;
                kVar4 = kVar2;
                objA2 = objA;
                bd2 bd2Var3 = bd2Var2;
                str4 = str2;
                bd2Var = bd2Var3;
                int i22 = i12;
                qw2Var4 = qw2Var2;
                i15 = i22;
                if (((Number) objA2).intValue() < i16 && hd2Var3.a(kVar4, qw2Var4) == null) {
                    t4 t4Var22 = hd2Var3.f4332c;
                    t4Var22.getClass();
                    Duration.Companion companion2 = Duration.f72038b;
                    j11 = ((Duration) t4Var22.a("gads:pc:refill_wait_time_ms", ed.k(30, DurationUnit.f72046e, "gads:pc:refill_wait_time_ms"), u.a$1)).f72041a;
                    bd2Var.f1374a = hd2Var3;
                    bd2Var.f1375b = kVar4;
                    bd2Var.f1376c = qw2Var4;
                    bd2Var.f1377d = str4;
                    bd2Var.f1378e = ue2Var2;
                    bd2Var.f1379f = i11;
                    bd2Var.f1380g = i15;
                    bd2Var.f1384k = 2;
                    if (t0.c(j11, bd2Var) != coroutineSingletons) {
                        i14 = i15;
                        i13 = i11;
                        ue2Var3 = ue2Var2;
                        str3 = str4;
                        qw2Var3 = qw2Var4;
                        kVar3 = kVar4;
                        hd2Var2 = hd2Var3;
                        bd2Var.f1374a = hd2Var2;
                        bd2Var.f1375b = kVar3;
                        bd2Var.f1376c = qw2Var3;
                        bd2Var.f1377d = str3;
                        bd2Var.f1378e = ue2Var3;
                        bd2Var.f1379f = i13;
                        bd2Var.f1380g = i14;
                        bd2Var.f1384k = 3;
                        qw2 qw2Var6 = qw2Var3;
                        ni.k kVar5 = kVar3;
                        hd2 hd2Var6 = hd2Var2;
                        objA2 = hd2Var6.a(kVar5, qw2Var6, str3, i13, ue2Var3, bd2Var);
                    }
                }
                return Unit.f71706a;
            }
            return coroutineSingletons;
        }
        i14 = bd2Var.f1380g;
        i13 = bd2Var.f1379f;
        ue2Var3 = bd2Var.f1378e;
        str3 = bd2Var.f1377d;
        qw2Var3 = bd2Var.f1376c;
        kVar3 = bd2Var.f1375b;
        hd2Var2 = bd2Var.f1374a;
        ResultKt.b(objA2);
        bd2Var.f1374a = hd2Var2;
        bd2Var.f1375b = kVar3;
        bd2Var.f1376c = qw2Var3;
        bd2Var.f1377d = str3;
        bd2Var.f1378e = ue2Var3;
        bd2Var.f1379f = i13;
        bd2Var.f1380g = i14;
        bd2Var.f1384k = 3;
        qw2 qw2Var62 = qw2Var3;
        ni.k kVar52 = kVar3;
        hd2 hd2Var62 = hd2Var2;
        objA2 = hd2Var62.a(kVar52, qw2Var62, str3, i13, ue2Var3, bd2Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x0164, code lost:
    
        if (r12.a(r8, (ads_mobile_sdk.z23) null, r2, r1, r3) == r7) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x01a5, code lost:
    
        if (r12.a(r8, r4, "Failed to get ad config from server response", r1, r2) == r7) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0230, code lost:
    
        if (r14 != null) goto L99;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x024d, code lost:
    
        if (r14 == null) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0250, code lost:
    
        if (r15 != null) goto L99;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:109:0x02b5  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0307  */
    /* JADX WARN: Removed duplicated region for block: B:182:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x012d  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x022d  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0250  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Enum a(ni.k kVar, qw2 qw2Var, String str, int i5, yc2 yc2Var, ue2 ue2Var, ContinuationImpl continuationImpl) {
        cd2 cd2Var;
        String str2;
        ni.k kVar2;
        int i11;
        yc2 yc2Var2;
        qw2 qw2Var2;
        int i12;
        ue2 ue2Var2;
        hd2 hd2Var;
        o8 o8Var;
        b.a1 a1Var;
        z23 z23Var;
        z1 z1Var;
        CoroutineSingletons coroutineSingletons;
        int iOrdinal;
        CoroutineSingletons coroutineSingletons2;
        String str3;
        qw2 requestType;
        yc2 yc2Var3;
        ni.k kVar3;
        qw2 qw2Var3;
        yc2 yc2Var4;
        com.google.gson.m mVarE;
        ni.k kVar4;
        hd2 hd2Var2;
        b.a1 a1Var2;
        long j11;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof cd2) {
            cd2Var = (cd2) continuationImpl;
            int i13 = cd2Var.f1822l;
            if ((i13 & Integer.MIN_VALUE) != 0) {
                cd2Var.f1822l = i13 - Integer.MIN_VALUE;
            } else {
                cd2Var = new cd2(this, continuationImpl);
            }
        }
        Object objA = cd2Var.f1820j;
        CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
        switch (cd2Var.f1822l) {
            case 0:
                ResultKt.b(objA);
                b.m5 m5Var = (b.m5) this.f4333d.get(qw2Var);
                b.a1 a1VarA = (m5Var == null || (o8Var = (o8) m5Var.get()) == null) ? null : o8Var.a(kVar, i5);
                if (a1VarA == null) {
                    zi3.a(6, "Component factory is missing for request type: " + qw2Var, null);
                    return zc2.f12517b;
                }
                if (a1VarA instanceof pu0) {
                    zi3.a(6, "Failed to create internal request component: " + a1VarA, null);
                    return zc2.f12517b;
                }
                if (a1VarA instanceof xu0) {
                    wc1 wc1VarA = ((b.s7) ((xu0) a1VarA).f11834b).a();
                    int i14 = wc1VarA.f11148e;
                    cd2Var.f1811a = this;
                    cd2Var.f1812b = kVar;
                    cd2Var.f1813c = qw2Var;
                    str2 = str;
                    cd2Var.f1814d = str2;
                    cd2Var.f1815e = yc2Var;
                    cd2Var.f1816f = ue2Var;
                    cd2Var.f1818h = i5;
                    cd2Var.f1819i = i14;
                    cd2Var.f1822l = 1;
                    objA = wc1.a(wc1VarA, cd2Var);
                    if (objA != coroutineSingletons3) {
                        kVar2 = kVar;
                        i11 = i14;
                        yc2Var2 = yc2Var;
                        qw2Var2 = qw2Var;
                        i12 = i5;
                        ue2Var2 = ue2Var;
                        hd2Var = this;
                        a1Var = (b.a1) objA;
                        if (!(a1Var instanceof pu0)) {
                            String str4 = "Failed to load ad response: " + a1Var;
                            km0.f5780b.getClass();
                            km0 km0VarB = lm.e.b(a1Var);
                            cd2Var.f1811a = null;
                            cd2Var.f1812b = null;
                            cd2Var.f1813c = null;
                            cd2Var.f1814d = null;
                            cd2Var.f1815e = null;
                            cd2Var.f1816f = null;
                            cd2Var.f1822l = 2;
                            break;
                        } else if (a1Var instanceof xu0) {
                            z23 z23Var2 = (z23) ((xu0) a1Var).f11834b;
                            hv hvVar = z23Var2.f12428b;
                            ArrayList arrayList = z23Var2.f12427a;
                            if (hvVar.f4563s) {
                                if (arrayList.isEmpty()) {
                                    km0 km0Var = km0.f5787i;
                                    cd2Var.f1811a = null;
                                    cd2Var.f1812b = null;
                                    cd2Var.f1813c = null;
                                    cd2Var.f1814d = null;
                                    cd2Var.f1815e = null;
                                    cd2Var.f1816f = null;
                                    cd2Var.f1822l = 3;
                                    break;
                                } else {
                                    yc2 yc2Var5 = yc2Var2;
                                    z23Var = z23Var2;
                                    z1Var = (z1) b70.g.Y0(arrayList);
                                    if (z1Var != null) {
                                        hd2Var.getClass();
                                        k61 k61Var = z1Var.I;
                                        if (k61Var != null) {
                                            String str5 = k61Var.f5519a;
                                            com.google.gson.r rVar = k61Var.f5522d;
                                            t4 t4Var = hd2Var.f4332c;
                                            t4Var.getClass();
                                            if (((Boolean) t4Var.a("gads:pc:enable_sra_empty_slots_validation", Boolean.TRUE, jnVar)).booleanValue() && z1Var.f12416z0) {
                                                if (rVar != null && (mVarE = d62.e(rVar, "slots")) != 0 && (!(mVarE instanceof Collection) || !((Collection) mVarE).isEmpty())) {
                                                    Iterator it = mVarE.f34793a.iterator();
                                                    while (it.hasNext()) {
                                                        com.google.gson.m mVarE2 = d62.e(((com.google.gson.p) it.next()).j(), "ads");
                                                        if (mVarE2 != null && mVarE2.f34793a.size() > 0) {
                                                            iOrdinal = qw2Var2.ordinal();
                                                            if (iOrdinal == 3) {
                                                            }
                                                        }
                                                    }
                                                }
                                                coroutineSingletons = coroutineSingletons3;
                                            } else {
                                                iOrdinal = qw2Var2.ordinal();
                                                if (iOrdinal == 3) {
                                                    if (iOrdinal == 5) {
                                                        boolean z11 = (kVar2 instanceof ui.q) && ((ui.q) kVar2).d().contains(ui.a.f91274c);
                                                        if (rVar == null) {
                                                            if (z11) {
                                                            }
                                                            coroutineSingletons = coroutineSingletons3;
                                                        }
                                                        if (ue2Var2 != null) {
                                                            pe2 pe2Var = hd2Var.f4331b;
                                                            cd2Var.f1811a = hd2Var;
                                                            cd2Var.f1812b = kVar2;
                                                            cd2Var.f1813c = qw2Var2;
                                                            cd2Var.f1814d = str2;
                                                            cd2Var.f1815e = yc2Var5;
                                                            cd2Var.f1816f = z23Var;
                                                            cd2Var.f1817g = z1Var;
                                                            cd2Var.f1818h = i12;
                                                            cd2Var.f1819i = i11;
                                                            cd2Var.f1822l = 5;
                                                            pe2Var.getClass();
                                                            Object objB = pe2.b(pe2Var, ue2Var2, cd2Var);
                                                            coroutineSingletons2 = coroutineSingletons3;
                                                            if (objB == coroutineSingletons2) {
                                                                return coroutineSingletons2;
                                                            }
                                                            kVar3 = kVar2;
                                                            qw2Var3 = qw2Var2;
                                                            str3 = str2;
                                                            yc2Var4 = yc2Var5;
                                                            objA = objB;
                                                            ni.k kVar5 = kVar3;
                                                            yc2Var3 = yc2Var4;
                                                            requestType = qw2Var3;
                                                            kVar2 = kVar5;
                                                            pe2 pe2Var2 = hd2Var.f4331b;
                                                            String strValueOf = String.valueOf(z23Var.f12430d);
                                                            cd2Var.f1811a = hd2Var;
                                                            cd2Var.f1812b = kVar2;
                                                            cd2Var.f1813c = requestType;
                                                            cd2Var.f1814d = yc2Var3;
                                                            cd2Var.f1815e = z23Var;
                                                            cd2Var.f1816f = z1Var;
                                                            cd2Var.f1817g = null;
                                                            cd2Var.f1818h = i12;
                                                            cd2Var.f1819i = i11;
                                                            cd2Var.f1822l = 6;
                                                            pe2Var2.getClass();
                                                            objA = pe2.a(pe2Var2, requestType, str3, strValueOf, cd2Var);
                                                            if (objA == coroutineSingletons2) {
                                                                return coroutineSingletons2;
                                                            }
                                                            kVar4 = kVar2;
                                                            hd2Var2 = hd2Var;
                                                            int i15 = i12;
                                                            a1Var2 = (b.a1) objA;
                                                            if (!(a1Var2 instanceof pu0)) {
                                                                String str6 = "Failed to cache ad after #" + yc2Var3.f12006d + " attempts: " + a1Var2;
                                                                km0.f5780b.getClass();
                                                                km0 km0VarB2 = lm.e.b(a1Var2);
                                                                cd2Var.f1811a = null;
                                                                cd2Var.f1812b = null;
                                                                cd2Var.f1813c = null;
                                                                cd2Var.f1814d = null;
                                                                cd2Var.f1815e = null;
                                                                cd2Var.f1816f = null;
                                                                cd2Var.f1822l = 7;
                                                                if (hd2Var2.a(yc2Var3, z23Var, str6, i11, km0VarB2) == coroutineSingletons2) {
                                                                    return coroutineSingletons2;
                                                                }
                                                            } else {
                                                                hd2Var2.getClass();
                                                                d33 d33Var = new d33(new v23(kVar4), z23Var, false, null);
                                                                km0 km0Var2 = km0.f5781c;
                                                                Duration.f72038b.getClass();
                                                                hd2Var2.a(b70.g.t1(z1Var.f12375e, z1Var.D), z1Var, d33Var, i11, k9.s(z1Var, km0Var2, 0L, null));
                                                                xu0 xu0Var = a1Var2 instanceof xu0 ? (xu0) a1Var2 : null;
                                                                ue2 ue2Var3 = xu0Var != null ? (ue2) xu0Var.f11834b : null;
                                                                if (ue2Var3 != null) {
                                                                    mc2 mc2Var = (mc2) hd2Var2.f4341l.get();
                                                                    mc2Var.getClass();
                                                                    u uVar = u.a$1;
                                                                    String str7 = kVar4.f78283i;
                                                                    Intrinsics.g(requestType, "requestType");
                                                                    String str8 = ue2Var3.f10324a;
                                                                    t4 t4Var2 = mc2Var.f7101c;
                                                                    t4Var2.getClass();
                                                                    if (((Boolean) t4Var2.a("gads:pc:enable_auto_refresh", Boolean.FALSE, jnVar)).booleanValue()) {
                                                                        int iOrdinal2 = requestType.ordinal();
                                                                        if (iOrdinal2 == 1) {
                                                                            j11 = ((Duration) t4Var2.a("gads:pc:app_open_ad_auto_refresh_interval_millis", ed.k(6, DurationUnit.f72048g, "gads:pc:app_open_ad_auto_refresh_interval_millis"), uVar)).f72041a;
                                                                        } else if (iOrdinal2 != 3) {
                                                                            j11 = iOrdinal2 != 5 ? 0L : ((Duration) t4Var2.a("gads:pc:native_ad_auto_refresh_interval_millis", ed.k(6, DurationUnit.f72048g, "gads:pc:native_ad_auto_refresh_interval_millis"), uVar)).f72041a;
                                                                        } else {
                                                                            j11 = ((Duration) t4Var2.a("gads:pc:icon_ad_auto_refresh_interval_millis", ed.k(12, DurationUnit.f72048g, "gads:pc:icon_ad_auto_refresh_interval_millis"), uVar)).f72041a;
                                                                        }
                                                                        if (Duration.c(j11, 0L) > 0) {
                                                                            mc2Var.a(str8);
                                                                            b.i8 i8Var = rw0.f9327f;
                                                                            String strR = b.i8.r(str7);
                                                                            String str9 = strR == null ? str7 : strR;
                                                                            mc2Var.f7103e.getClass();
                                                                            long jCurrentTimeMillis = System.currentTimeMillis();
                                                                            sk skVar = new sk(str9, kVar4, requestType, i15, ue2Var3, jCurrentTimeMillis, Duration.h(j11) + jCurrentTimeMillis, m0.c());
                                                                            skVar.f9593h = mc2Var.a(skVar, j11);
                                                                            mc2Var.f7105g.put(str8, skVar);
                                                                        }
                                                                    }
                                                                }
                                                                return zc2.f12516a;
                                                            }
                                                        } else {
                                                            coroutineSingletons2 = coroutineSingletons3;
                                                            qw2 qw2Var4 = qw2Var2;
                                                            str3 = str2;
                                                            requestType = qw2Var4;
                                                            yc2Var3 = yc2Var5;
                                                            pe2 pe2Var22 = hd2Var.f4331b;
                                                            String strValueOf2 = String.valueOf(z23Var.f12430d);
                                                            cd2Var.f1811a = hd2Var;
                                                            cd2Var.f1812b = kVar2;
                                                            cd2Var.f1813c = requestType;
                                                            cd2Var.f1814d = yc2Var3;
                                                            cd2Var.f1815e = z23Var;
                                                            cd2Var.f1816f = z1Var;
                                                            cd2Var.f1817g = null;
                                                            cd2Var.f1818h = i12;
                                                            cd2Var.f1819i = i11;
                                                            cd2Var.f1822l = 6;
                                                            pe2Var22.getClass();
                                                            objA = pe2.a(pe2Var22, requestType, str3, strValueOf2, cd2Var);
                                                            if (objA == coroutineSingletons2) {
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            return zc2.f12518c;
                                        }
                                        coroutineSingletons = coroutineSingletons3;
                                        String str10 = "Failed to render ad for request type: " + qw2Var2;
                                        km0 km0Var3 = km0.f5787i;
                                        cd2Var.f1811a = null;
                                        cd2Var.f1812b = null;
                                        cd2Var.f1813c = null;
                                        cd2Var.f1814d = null;
                                        cd2Var.f1815e = null;
                                        cd2Var.f1816f = null;
                                        cd2Var.f1822l = 4;
                                        if (hd2Var.a(yc2Var5, z23Var, str10, i11, km0Var3) == coroutineSingletons) {
                                            return coroutineSingletons;
                                        }
                                    }
                                    return zc2.f12518c;
                                }
                            } else {
                                pe2 pe2Var3 = hd2Var.f4331b;
                                String adUnitId = kVar2.f78283i;
                                pe2Var3.getClass();
                                Intrinsics.g(adUnitId, "adUnitId");
                                b.i8 i8Var2 = rw0.f9327f;
                                String strR2 = b.i8.r(adUnitId);
                                if (strR2 != null) {
                                    adUnitId = strR2;
                                }
                                pe2Var3.f8242l.put(adUnitId, Boolean.FALSE);
                                mc2 mc2Var2 = (mc2) pe2Var3.f8239i.get();
                                mc2Var2.getClass();
                                Iterator it2 = mc2Var2.f7105g.entrySet().iterator();
                                while (it2.hasNext()) {
                                    Object next = it2.next();
                                    Intrinsics.f(next, "next(...)");
                                    Map.Entry entry = (Map.Entry) next;
                                    if (Intrinsics.b(((sk) entry.getValue()).f9586a, adUnitId)) {
                                        ((sk) entry.getValue()).f9593h.c(null);
                                        it2.remove();
                                    }
                                }
                                cc2 cc2VarE = ji3.a().e();
                                n7 n7VarO = rc2.o();
                                Intrinsics.f(n7VarO, "newBuilder(...)");
                                n7VarO.c(pc2.FILL_DISABLED_REASON_WEB_PROPERTY_DISABLED);
                                cc2VarE.N = (rc2) n7VarO.a();
                                return zc2.f12519d;
                            }
                        } else {
                            throw new NoWhenBranchMatchedException();
                        }
                    }
                    return coroutineSingletons3;
                }
                throw new NoWhenBranchMatchedException();
            case 1:
                i11 = cd2Var.f1819i;
                i12 = cd2Var.f1818h;
                ue2Var2 = (ue2) cd2Var.f1816f;
                yc2Var2 = (yc2) cd2Var.f1815e;
                str2 = (String) cd2Var.f1814d;
                qw2Var2 = cd2Var.f1813c;
                kVar2 = cd2Var.f1812b;
                hd2Var = cd2Var.f1811a;
                ResultKt.b(objA);
                a1Var = (b.a1) objA;
                if (!(a1Var instanceof pu0)) {
                }
                return coroutineSingletons3;
            case 2:
                ResultKt.b(objA);
                return zc2.f12518c;
            case 3:
                ResultKt.b(objA);
                return zc2.f12518c;
            case 4:
                ResultKt.b(objA);
                return zc2.f12518c;
            case 5:
                i11 = cd2Var.f1819i;
                i12 = cd2Var.f1818h;
                z1 z1Var2 = cd2Var.f1817g;
                z23Var = (z23) cd2Var.f1816f;
                yc2Var4 = (yc2) cd2Var.f1815e;
                str3 = (String) cd2Var.f1814d;
                qw2Var3 = cd2Var.f1813c;
                kVar3 = cd2Var.f1812b;
                hd2Var = cd2Var.f1811a;
                ResultKt.b(objA);
                z1Var = z1Var2;
                coroutineSingletons2 = coroutineSingletons3;
                ni.k kVar52 = kVar3;
                yc2Var3 = yc2Var4;
                requestType = qw2Var3;
                kVar2 = kVar52;
                pe2 pe2Var222 = hd2Var.f4331b;
                String strValueOf22 = String.valueOf(z23Var.f12430d);
                cd2Var.f1811a = hd2Var;
                cd2Var.f1812b = kVar2;
                cd2Var.f1813c = requestType;
                cd2Var.f1814d = yc2Var3;
                cd2Var.f1815e = z23Var;
                cd2Var.f1816f = z1Var;
                cd2Var.f1817g = null;
                cd2Var.f1818h = i12;
                cd2Var.f1819i = i11;
                cd2Var.f1822l = 6;
                pe2Var222.getClass();
                objA = pe2.a(pe2Var222, requestType, str3, strValueOf22, cd2Var);
                if (objA == coroutineSingletons2) {
                }
                break;
            case 6:
                i11 = cd2Var.f1819i;
                i12 = cd2Var.f1818h;
                z1 z1Var3 = (z1) cd2Var.f1816f;
                z23Var = (z23) cd2Var.f1815e;
                yc2Var3 = (yc2) cd2Var.f1814d;
                requestType = cd2Var.f1813c;
                kVar4 = cd2Var.f1812b;
                hd2Var2 = cd2Var.f1811a;
                ResultKt.b(objA);
                z1Var = z1Var3;
                coroutineSingletons2 = coroutineSingletons3;
                int i152 = i12;
                a1Var2 = (b.a1) objA;
                if (!(a1Var2 instanceof pu0)) {
                }
                break;
            case 7:
                ResultKt.b(objA);
                return zc2.f12518c;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    public final pc2 a(ni.k kVar, qw2 qw2Var) {
        pc2 pc2VarA = this.f4331b.a(kVar, qw2Var);
        if (pc2VarA == null) {
            t4 t4Var = this.f4332c;
            t4Var.getClass();
            pc2VarA = (((Boolean) t4Var.a("gads:pc:enable_cache_fill_on_cellular", Boolean.TRUE, jn.a$10)).booleanValue() || this.f4339j.n.get() != 0) ? null : pc2.FILL_DISABLED_REASON_CELLULAR_NETWORK;
        }
        if (pc2VarA == null) {
            return pc2VarA;
        }
        kz2 kz2Var = this.f4335f;
        wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_FILL_CHECK;
        EmptyList emptyList = EmptyList.f71733a;
        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                th3 th3VarA = ji3.a();
                cc2 cc2VarE = th3VarA.e();
                n7 n7VarO = rc2.o();
                Intrinsics.f(n7VarO, "newBuilder(...)");
                n7VarO.c(pc2VarA);
                cc2VarE.N = (rc2) n7VarO.a();
                th3VarA.f9923a.f7224a.f10463c = qw2Var;
                Unit unit = Unit.f71706a;
                em2VarA.close();
                return pc2VarA;
            } catch (Throwable th2) {
                try {
                    em2VarA.b(th2);
                    if (!(th2 instanceof b.a4)) {
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            em2VarA.a(th2);
                        }
                        if (!(th2 instanceof TimeoutCancellationException)) {
                            if (!(th2 instanceof CancellationException)) {
                                if (th2 instanceof dv0) {
                                    throw th2;
                                }
                                throw new iu0(th2);
                            }
                            throw new du0(th2);
                        }
                        throw new lw0(th2);
                    }
                    throw th2;
                } finally {
                }
            }
        } else {
            th3 th3VarA2 = ji3.a(wv0Var, emptyList, true);
            try {
                th3 th3VarA3 = ji3.a();
                cc2 cc2VarE2 = th3VarA3.e();
                n7 n7VarO2 = rc2.o();
                Intrinsics.f(n7VarO2, "newBuilder(...)");
                n7VarO2.c(pc2VarA);
                cc2VarE2.N = (rc2) n7VarO2.a();
                th3VarA3.f9923a.f7224a.f10463c = qw2Var;
                Unit unit2 = Unit.f71706a;
                th3VarA2.close();
                return pc2VarA;
            } catch (Throwable th3) {
                try {
                    th3VarA2.b(th3);
                    if (!(th3 instanceof b.a4)) {
                        if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                            th3VarA2.a(th3);
                        }
                        if (!(th3 instanceof TimeoutCancellationException)) {
                            if (!(th3 instanceof CancellationException)) {
                                if (th3 instanceof dv0) {
                                    throw th3;
                                }
                                throw new iu0(th3);
                            }
                            throw new du0(th3);
                        }
                        throw new lw0(th3);
                    }
                    throw th3;
                } finally {
                }
            }
        }
    }

    public final Unit a(yc2 yc2Var, z23 z23Var, String str, int i5, km0 km0Var) {
        if (z23Var != null) {
            d33 d33Var = new d33(new v23(yc2Var.f12004b), z23Var, false, null);
            z1 z1Var = (z1) b70.g.Y0(z23Var.f12427a);
            Duration.f72038b.getClass();
            a(z23Var.f12428b.f4559m, (z1) null, d33Var, i5, k9.s(z1Var, km0Var, 0L, null));
        }
        int i11 = yc2Var.f12006d;
        int i12 = yc2Var.f12003a;
        if (i11 < i12) {
            zi3.a(6, str, null);
        } else {
            zi3.a(6, a80.m.f(i12, "Terminal failure after ", " attempts: ", str), null);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x02f8  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0306 A[Catch: all -> 0x0312, TryCatch #0 {all -> 0x0312, blocks: (B:111:0x02ff, B:113:0x0306, B:115:0x030a, B:117:0x030e, B:120:0x0315, B:122:0x0319, B:124:0x031d, B:126:0x0321, B:127:0x0322, B:128:0x0327, B:129:0x0328, B:130:0x032f, B:131:0x0330, B:132:0x0337, B:133:0x0338), top: B:140:0x02ff }] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0338 A[Catch: all -> 0x0312, TRY_LEAVE, TryCatch #0 {all -> 0x0312, blocks: (B:111:0x02ff, B:113:0x0306, B:115:0x030a, B:117:0x030e, B:120:0x0315, B:122:0x0319, B:124:0x031d, B:126:0x0321, B:127:0x0322, B:128:0x0327, B:129:0x0328, B:130:0x032f, B:131:0x0330, B:132:0x0337, B:133:0x0338), top: B:140:0x02ff }] */
    /* JADX WARN: Removed duplicated region for block: B:138:0x033f  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0173 A[Catch: all -> 0x017f, TryCatch #7 {all -> 0x017f, blocks: (B:46:0x016c, B:48:0x0173, B:50:0x0177, B:52:0x017b, B:55:0x0182, B:57:0x0186, B:59:0x018a, B:61:0x018e, B:62:0x018f, B:63:0x0194, B:64:0x0195, B:65:0x019c, B:66:0x019d, B:67:0x01a4, B:68:0x01a5), top: B:153:0x016c }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01a5 A[Catch: all -> 0x017f, TRY_LEAVE, TryCatch #7 {all -> 0x017f, blocks: (B:46:0x016c, B:48:0x0173, B:50:0x0177, B:52:0x017b, B:55:0x0182, B:57:0x0186, B:59:0x018a, B:61:0x018e, B:62:0x018f, B:63:0x0194, B:64:0x0195, B:65:0x019c, B:66:0x019d, B:67:0x01a4, B:68:0x01a5), top: B:153:0x016c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x020e  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:103:0x02f0 -> B:102:0x02ec). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:88:0x0217 -> B:101:0x02e5). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:99:0x02d7 -> B:100:0x02de). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Enum a(ni.k kVar, qw2 qw2Var, String str, int i5, ue2 ue2Var, ContinuationImpl continuationImpl) {
        dd2 dd2Var;
        qw2 qw2Var2;
        ni.k kVar2;
        mi3 mi3Var;
        hd2 hd2Var;
        dd2 dd2Var2;
        yc2 yc2Var;
        String str2;
        int i11;
        ue2 ue2Var2;
        th3 th3VarA;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        qw2 qw2Var3;
        String str3;
        ue2 ue2Var3;
        yc2 yc2Var2;
        hd2 hd2Var2;
        ni.k kVar3;
        int i12;
        zc2 zc2Var;
        ni.k kVar4;
        ue2 ue2Var4;
        th3 th3VarA2;
        TimeoutCancellationException th3;
        th3 th3Var3;
        th3 th3Var4;
        int iOrdinal;
        hd2 hd2Var3;
        qw2 qw2Var4;
        String str4;
        mi3 mi3Var2;
        u uVar = u.a$1;
        if (continuationImpl instanceof dd2) {
            dd2Var = (dd2) continuationImpl;
            int i13 = dd2Var.f2472m;
            if ((i13 & Integer.MIN_VALUE) != 0) {
                dd2Var.f2472m = i13 - Integer.MIN_VALUE;
            } else {
                dd2Var = new dd2(this, continuationImpl);
            }
        }
        Object objA = dd2Var.f2470k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i14 = dd2Var.f2472m;
        int i15 = 1;
        if (i14 == 0) {
            ResultKt.b(objA);
            ur2 ur2Var = new ur2();
            mi3 mi3Var3 = new mi3(ur2Var, new fh1(), new tu2(), new s8());
            qw2Var2 = qw2Var;
            ur2Var.f10463c = qw2Var2;
            t4 t4Var = this.f4332c;
            t4Var.getClass();
            int iIntValue = ((Number) t4Var.a("gads:pc:max_fill_retry_attempts", 5, jn.a$15)).intValue() + 1;
            t4 t4Var2 = this.f4332c;
            t4Var2.getClass();
            Duration.Companion companion = Duration.f72038b;
            kVar2 = kVar;
            yc2 yc2Var3 = new yc2(iIntValue, kVar2, ((Duration) t4Var2.a("gads:pc:fill_initial_refresh_interval", ed.k(5, DurationUnit.f72047f, "gads:pc:fill_initial_refresh_interval"), uVar)).f72041a);
            mi3Var = mi3Var3;
            hd2Var = this;
            dd2Var2 = dd2Var;
            yc2Var = yc2Var3;
            str2 = str;
            i11 = i5;
            ue2Var2 = ue2Var;
            if (yc2Var.f12006d < yc2Var.f12003a) {
            }
        } else if (i14 == 1) {
            i12 = dd2Var.f2469j;
            th3Var4 = dd2Var.f2468i;
            th3Var3 = dd2Var.f2467h;
            yc2Var = dd2Var.f2466g;
            mi3Var2 = dd2Var.f2465f;
            ue2Var4 = dd2Var.f2464e;
            str4 = dd2Var.f2463d;
            qw2Var4 = dd2Var.f2462c;
            kVar4 = dd2Var.f2461b;
            hd2Var3 = dd2Var.f2460a;
            try {
                ResultKt.b(objA);
                zc2 zc2Var2 = (zc2) objA;
                CloseableKt.a(th3Var4, null);
                dd2Var2 = dd2Var;
                qw2Var2 = qw2Var4;
                zc2Var = zc2Var2;
                str2 = str4;
                mi3Var = mi3Var2;
                hd2Var = hd2Var3;
                iOrdinal = zc2Var.ordinal();
                if (iOrdinal == 0) {
                }
            } catch (Throwable th4) {
                th3 = th4;
                th3VarA2 = th3Var3;
                th3VarA2.b(th3);
                if (th3 instanceof b.a4) {
                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                        th3VarA2.a(th3);
                    }
                    if (!(th3 instanceof TimeoutCancellationException)) {
                        if (!(th3 instanceof CancellationException)) {
                            if (th3 instanceof dv0) {
                                throw th3;
                            }
                            throw new iu0(th3);
                        }
                        throw new du0(th3);
                    }
                    throw new lw0(th3);
                }
                throw th3;
            }
        } else {
            if (i14 != 2) {
                if (i14 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i12 = dd2Var.f2469j;
                yc2 yc2Var4 = dd2Var.f2466g;
                mi3 mi3Var4 = dd2Var.f2465f;
                ue2 ue2Var5 = dd2Var.f2464e;
                String str5 = dd2Var.f2463d;
                qw2 qw2Var5 = dd2Var.f2462c;
                ni.k kVar5 = dd2Var.f2461b;
                hd2 hd2Var4 = dd2Var.f2460a;
                ResultKt.b(objA);
                u uVar2 = uVar;
                str2 = str5;
                ni.k kVar6 = kVar5;
                CoroutineSingletons coroutineSingletons2 = coroutineSingletons;
                dd2Var2 = dd2Var;
                ue2 ue2Var6 = ue2Var5;
                mi3Var = mi3Var4;
                ue2Var4 = ue2Var6;
                yc2Var = yc2Var4;
                hd2Var = hd2Var4;
                qw2Var2 = qw2Var5;
                kVar4 = kVar6;
                uVar = uVar2;
                i11 = i12;
                ue2Var2 = ue2Var4;
                coroutineSingletons = coroutineSingletons2;
                kVar2 = kVar4;
                i15 = 1;
                if (yc2Var.f12006d < yc2Var.f12003a) {
                    if (hd2Var.a(kVar2, qw2Var2) != null) {
                        return xc2.f11670c;
                    }
                    yc2Var.f12006d += i15;
                    kz2 kz2Var = hd2Var.f4335f;
                    wv0 wv0Var = wv0.CUI_NAME_PERSISTENT_CACHE_FILL;
                    EmptyList emptyList = EmptyList.f71733a;
                    if (ji3.b().f4777a == null) {
                        th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                        try {
                            dd2Var2.f2460a = hd2Var;
                            dd2Var2.f2461b = kVar2;
                            dd2Var2.f2462c = qw2Var2;
                            dd2Var2.f2463d = str2;
                            dd2Var2.f2464e = ue2Var2;
                            dd2Var2.f2465f = mi3Var;
                            dd2Var2.f2466g = yc2Var;
                            dd2Var2.f2467h = th3VarA2;
                            dd2Var2.f2468i = th3VarA2;
                            dd2Var2.f2469j = i11;
                            dd2Var2.f2472m = 1;
                            String str6 = str2;
                            int i16 = i11;
                            ue2 ue2Var7 = ue2Var2;
                            qw2 qw2Var6 = qw2Var2;
                            dd2 dd2Var3 = dd2Var2;
                            yc2 yc2Var5 = yc2Var;
                            hd2 hd2Var5 = hd2Var;
                            ni.k kVar7 = kVar2;
                            objA = hd2Var5.a(kVar7, qw2Var6, str6, i16, yc2Var5, ue2Var7, dd2Var3);
                            qw2Var4 = qw2Var6;
                            i12 = i16;
                            yc2Var = yc2Var5;
                            ue2Var4 = ue2Var7;
                            dd2Var = dd2Var3;
                            if (objA != coroutineSingletons) {
                                kVar4 = kVar7;
                                th3Var3 = th3VarA2;
                                hd2Var3 = hd2Var5;
                                mi3Var2 = mi3Var;
                                str4 = str6;
                                th3Var4 = th3Var3;
                                zc2 zc2Var22 = (zc2) objA;
                                CloseableKt.a(th3Var4, null);
                                dd2Var2 = dd2Var;
                                qw2Var2 = qw2Var4;
                                zc2Var = zc2Var22;
                                str2 = str4;
                                mi3Var = mi3Var2;
                                hd2Var = hd2Var3;
                                iOrdinal = zc2Var.ordinal();
                                if (iOrdinal == 0) {
                                    return xc2.f11668a;
                                }
                                if (iOrdinal == 1) {
                                    return xc2.f11669b;
                                }
                                if (iOrdinal == 2) {
                                    if (yc2Var.f12006d >= yc2Var.f12003a) {
                                        i11 = i12;
                                        ue2Var2 = ue2Var4;
                                        kVar2 = kVar4;
                                        i15 = 1;
                                        if (yc2Var.f12006d < yc2Var.f12003a) {
                                        }
                                    } else {
                                        CoroutineSingletons coroutineSingletons3 = coroutineSingletons;
                                        long j11 = yc2Var.f12005c;
                                        t4 t4Var3 = hd2Var.f4332c;
                                        t4Var3.getClass();
                                        Double dValueOf = Double.valueOf(0.1d);
                                        jn jnVar = jn.a$12;
                                        double dDoubleValue = ((Number) t4Var3.a("gads:pc:fill_interval_jitter", dValueOf, jnVar)).doubleValue();
                                        t4 t4Var4 = hd2Var.f4332c;
                                        t4Var4.getClass();
                                        double dDoubleValue2 = ((Number) t4Var4.a("gads:pc:fill_retry_interval_multiplier", Double.valueOf(1.5d), jnVar)).doubleValue();
                                        t4 t4Var5 = hd2Var.f4332c;
                                        t4Var5.getClass();
                                        Duration.Companion companion2 = Duration.f72038b;
                                        long j12 = ((Duration) t4Var5.a("gads:pc:fill_max_refresh_interval", ed.k(1, DurationUnit.f72048g, "gads:pc:fill_max_refresh_interval"), uVar)).f72041a;
                                        mi3 mi3Var5 = mi3Var;
                                        uVar2 = uVar;
                                        hd2Var.f4336g.getClass();
                                        Random.f71890a.getClass();
                                        Duration duration = new Duration(Duration.o(j11, (((Random.f71891b.b() * (2 * dDoubleValue)) + 1.0d) - dDoubleValue) * dDoubleValue2));
                                        Duration duration2 = new Duration(j12);
                                        if (duration.compareTo(duration2) > 0) {
                                            duration = duration2;
                                        }
                                        long j13 = duration.f72041a;
                                        yc2Var.f12005c = j13;
                                        dd2Var2.f2460a = hd2Var;
                                        dd2Var2.f2461b = kVar4;
                                        dd2Var2.f2462c = qw2Var2;
                                        dd2Var2.f2463d = str2;
                                        dd2Var2.f2464e = ue2Var4;
                                        dd2Var2.f2465f = mi3Var5;
                                        dd2Var2.f2466g = yc2Var;
                                        dd2Var2.f2467h = null;
                                        dd2Var2.f2468i = null;
                                        dd2Var2.f2469j = i12;
                                        dd2Var2.f2472m = 3;
                                        coroutineSingletons2 = coroutineSingletons3;
                                        if (t0.c(j13, dd2Var2) == coroutineSingletons2) {
                                            return coroutineSingletons2;
                                        }
                                        ue2Var5 = ue2Var4;
                                        mi3Var4 = mi3Var5;
                                        kVar6 = kVar4;
                                        qw2Var5 = qw2Var2;
                                        hd2Var4 = hd2Var;
                                        yc2Var4 = yc2Var;
                                        ue2 ue2Var62 = ue2Var5;
                                        mi3Var = mi3Var4;
                                        ue2Var4 = ue2Var62;
                                        yc2Var = yc2Var4;
                                        hd2Var = hd2Var4;
                                        qw2Var2 = qw2Var5;
                                        kVar4 = kVar6;
                                        uVar = uVar2;
                                        i11 = i12;
                                        ue2Var2 = ue2Var4;
                                        coroutineSingletons = coroutineSingletons2;
                                        kVar2 = kVar4;
                                        i15 = 1;
                                        if (yc2Var.f12006d < yc2Var.f12003a) {
                                        }
                                    }
                                } else if (iOrdinal != 3) {
                                    uVar2 = uVar;
                                    coroutineSingletons2 = coroutineSingletons;
                                    uVar = uVar2;
                                    i11 = i12;
                                    ue2Var2 = ue2Var4;
                                    coroutineSingletons = coroutineSingletons2;
                                    kVar2 = kVar4;
                                    i15 = 1;
                                    if (yc2Var.f12006d < yc2Var.f12003a) {
                                    }
                                } else {
                                    return xc2.f11670c;
                                }
                            }
                        } catch (Throwable th5) {
                            th3 = th5;
                            th3Var4 = th3VarA2;
                            try {
                                th3VarA2.b(th3);
                                if (th3 instanceof b.a4) {
                                }
                            } finally {
                            }
                        }
                    } else {
                        ue2 ue2Var8 = ue2Var2;
                        int i17 = i11;
                        dd2 dd2Var4 = dd2Var2;
                        ni.k kVar8 = kVar2;
                        qw2 qw2Var7 = qw2Var2;
                        String str7 = str2;
                        th3VarA = ji3.a(wv0Var, emptyList, true);
                        try {
                            dd2Var4.f2460a = hd2Var;
                            dd2Var4.f2461b = kVar8;
                            dd2Var4.f2462c = qw2Var7;
                            dd2Var4.f2463d = str7;
                            dd2Var4.f2464e = ue2Var8;
                            dd2Var4.f2465f = mi3Var;
                            dd2Var4.f2466g = yc2Var;
                            dd2Var4.f2467h = th3VarA;
                            dd2Var4.f2468i = th3VarA;
                            dd2Var4.f2469j = i17;
                            dd2Var4.f2472m = 2;
                            yc2 yc2Var6 = yc2Var;
                            hd2 hd2Var6 = hd2Var;
                            objA = hd2Var6.a(kVar8, qw2Var7, str7, i17, yc2Var6, ue2Var8, dd2Var4);
                            if (objA != coroutineSingletons) {
                                th3Var = th3VarA;
                                th3Var2 = th3Var;
                                hd2Var2 = hd2Var6;
                                kVar3 = kVar8;
                                qw2Var3 = qw2Var7;
                                str3 = str7;
                                i12 = i17;
                                yc2Var2 = yc2Var6;
                                ue2Var3 = ue2Var8;
                                dd2Var = dd2Var4;
                                zc2 zc2Var3 = (zc2) objA;
                                CloseableKt.a(th3Var, null);
                                dd2 dd2Var5 = dd2Var;
                                zc2Var = zc2Var3;
                                str2 = str3;
                                kVar4 = kVar3;
                                dd2Var2 = dd2Var5;
                                hd2Var = hd2Var2;
                                yc2Var = yc2Var2;
                                ue2Var4 = ue2Var3;
                                qw2Var2 = qw2Var3;
                                iOrdinal = zc2Var.ordinal();
                                if (iOrdinal == 0) {
                                }
                            }
                        } catch (Throwable th6) {
                            th2 = th6;
                            th3Var = th3VarA;
                            try {
                                th3VarA.b(th2);
                                if (th2 instanceof b.a4) {
                                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                        th3VarA.a(th2);
                                    }
                                    if (!(th2 instanceof TimeoutCancellationException)) {
                                        if (!(th2 instanceof CancellationException)) {
                                            if (th2 instanceof dv0) {
                                                throw th2;
                                            }
                                            throw new iu0(th2);
                                        }
                                        throw new du0(th2);
                                    }
                                    throw new lw0(th2);
                                }
                                throw th2;
                            } finally {
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                return xc2.f11669b;
            }
            i12 = dd2Var.f2469j;
            th3Var = dd2Var.f2468i;
            th3Var2 = dd2Var.f2467h;
            yc2Var2 = dd2Var.f2466g;
            mi3Var = dd2Var.f2465f;
            ue2Var3 = dd2Var.f2464e;
            str3 = dd2Var.f2463d;
            qw2Var3 = dd2Var.f2462c;
            kVar3 = dd2Var.f2461b;
            hd2Var2 = dd2Var.f2460a;
            try {
                ResultKt.b(objA);
                zc2 zc2Var32 = (zc2) objA;
                CloseableKt.a(th3Var, null);
                dd2 dd2Var52 = dd2Var;
                zc2Var = zc2Var32;
                str2 = str3;
                kVar4 = kVar3;
                dd2Var2 = dd2Var52;
                hd2Var = hd2Var2;
                yc2Var = yc2Var2;
                ue2Var4 = ue2Var3;
                qw2Var2 = qw2Var3;
                iOrdinal = zc2Var.ordinal();
                if (iOrdinal == 0) {
                }
            } catch (Throwable th7) {
                th2 = th7;
                th3VarA = th3Var2;
                th3VarA.b(th2);
                if (th2 instanceof b.a4) {
                }
            }
        }
    }

    public final void a(ArrayList arrayList, z1 z1Var, d33 d33Var, int i5, String str) {
        bb1 bb1Var = new bb1(this, arrayList, d33Var, z1Var, i5, str, null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f4330a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(bb1Var, null), 2);
    }

    public final void a(ni.k kVar, qw2 requestType, int i5, ue2 ue2Var) {
        Intrinsics.g(requestType, "requestType");
        if (this.f4331b.b(kVar, requestType) && a(kVar, requestType) == null) {
            gd2 gd2Var = new gd2(this, requestType, ue2Var, kVar, i5, null);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f4330a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(gd2Var, null), 2);
        }
    }
}
