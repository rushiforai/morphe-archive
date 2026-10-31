package ads_mobile_sdk;

import android.os.SystemClock;
import b.ed;
import b.o2;
import b0.b0;
import c80.d;
import java.util.concurrent.CancellationException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;
import t70.s1;
import w70.q1;

/* loaded from: classes.dex */
public final class lu2 implements b.ka, b.c7 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f6961a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f6962b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f6963c;

    /* renamed from: d, reason: collision with root package name */
    public dq2 f6964d;

    /* renamed from: e, reason: collision with root package name */
    public final d f6965e;

    /* renamed from: f, reason: collision with root package name */
    public t70.g2 f6966f;

    /* renamed from: g, reason: collision with root package name */
    public s1 f6967g;

    /* renamed from: h, reason: collision with root package name */
    public s1 f6968h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f6969i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f6970j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f6971k;

    /* renamed from: l, reason: collision with root package name */
    public long f6972l;

    /* renamed from: m, reason: collision with root package name */
    public long f6973m;
    public long n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public long f6974p;

    public lu2(t70.j0 backgroundScope, o2 clock, jr0 flags) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        this.f6961a = backgroundScope;
        this.f6962b = clock;
        this.f6963c = flags;
        this.f6965e = new d();
        s1 s1VarC = m0.c();
        s1VarC.j0();
        this.f6967g = s1VarC;
        s1 s1VarC2 = m0.c();
        s1VarC2.j0();
        this.f6968h = s1VarC2;
        Duration.f72038b.getClass();
        this.f6972l = 0L;
        this.f6973m = 0L;
        this.n = 0L;
        DurationUnit durationUnit = DurationUnit.f72046e;
        Duration durationK = ed.k(60, durationUnit, "gads:banner_refresh_time:seconds");
        u uVar = u.a$1;
        this.o = ((Duration) flags.a("gads:banner_refresh_time:seconds", durationK, uVar)).f72041a;
        this.f6974p = ((Duration) flags.a("gads:banner_refresh_load_ad_delay:seconds", new Duration(DurationKt.g(30, durationUnit)), uVar)).f72041a;
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x00a8 A[EXC_TOP_SPLITTER, PHI: r12 r13
      0x00a8: PHI (r12v36 ads_mobile_sdk.lu2) = (r12v17 ads_mobile_sdk.lu2), (r12v38 ads_mobile_sdk.lu2) binds: [B:45:0x008c, B:50:0x00a4] A[DONT_GENERATE, DONT_INLINE]
      0x00a8: PHI (r13v19 c80.a) = (r13v6 c80.a), (r13v25 c80.a) binds: [B:45:0x008c, B:50:0x00a4] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:111:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:112:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0098 A[Catch: CancellationException -> 0x003a, kq2 -> 0x003d, PHI: r12
      0x0098: PHI (r12v38 ads_mobile_sdk.lu2) = (r12v0 ads_mobile_sdk.lu2), (r12v26 ads_mobile_sdk.lu2), (r12v39 ads_mobile_sdk.lu2) binds: [B:48:0x0095, B:84:0x0154, B:14:0x0035] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TRY_LEAVE, TryCatch #6 {kq2 -> 0x003d, CancellationException -> 0x003a, blocks: (B:14:0x0035, B:49:0x0098, B:56:0x00ba, B:58:0x00c1, B:60:0x00c4, B:63:0x00d8, B:65:0x00dc, B:68:0x00f1, B:83:0x0147, B:91:0x0160, B:92:0x0163, B:94:0x0165, B:95:0x016a, B:38:0x0078, B:41:0x007f, B:52:0x00a8), top: B:110:0x0023, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00c1 A[Catch: CancellationException -> 0x003a, kq2 -> 0x003d, TryCatch #6 {kq2 -> 0x003d, CancellationException -> 0x003a, blocks: (B:14:0x0035, B:49:0x0098, B:56:0x00ba, B:58:0x00c1, B:60:0x00c4, B:63:0x00d8, B:65:0x00dc, B:68:0x00f1, B:83:0x0147, B:91:0x0160, B:92:0x0163, B:94:0x0165, B:95:0x016a, B:38:0x0078, B:41:0x007f, B:52:0x00a8), top: B:110:0x0023, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00c4 A[Catch: CancellationException -> 0x003a, kq2 -> 0x003d, TryCatch #6 {kq2 -> 0x003d, CancellationException -> 0x003a, blocks: (B:14:0x0035, B:49:0x0098, B:56:0x00ba, B:58:0x00c1, B:60:0x00c4, B:63:0x00d8, B:65:0x00dc, B:68:0x00f1, B:83:0x0147, B:91:0x0160, B:92:0x0163, B:94:0x0165, B:95:0x016a, B:38:0x0078, B:41:0x007f, B:52:0x00a8), top: B:110:0x0023, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00dc A[Catch: CancellationException -> 0x003a, kq2 -> 0x003d, TryCatch #6 {kq2 -> 0x003d, CancellationException -> 0x003a, blocks: (B:14:0x0035, B:49:0x0098, B:56:0x00ba, B:58:0x00c1, B:60:0x00c4, B:63:0x00d8, B:65:0x00dc, B:68:0x00f1, B:83:0x0147, B:91:0x0160, B:92:0x0163, B:94:0x0165, B:95:0x016a, B:38:0x0078, B:41:0x007f, B:52:0x00a8), top: B:110:0x0023, inners: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0127  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0134 A[Catch: CancellationException -> 0x0060, kq2 -> 0x0063, TRY_LEAVE, TryCatch #8 {kq2 -> 0x0063, CancellationException -> 0x0060, blocks: (B:72:0x0113, B:77:0x012d, B:79:0x0134, B:86:0x0157, B:87:0x015a, B:89:0x015c, B:90:0x015f, B:28:0x005b, B:35:0x006e, B:76:0x0129), top: B:110:0x0023, inners: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0157 A[Catch: CancellationException -> 0x0060, kq2 -> 0x0063, TRY_ENTER, TryCatch #8 {kq2 -> 0x0063, CancellationException -> 0x0060, blocks: (B:72:0x0113, B:77:0x012d, B:79:0x0134, B:86:0x0157, B:87:0x015a, B:89:0x015c, B:90:0x015f, B:28:0x005b, B:35:0x006e, B:76:0x0129), top: B:110:0x0023, inners: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0160 A[Catch: CancellationException -> 0x003a, kq2 -> 0x003d, TRY_ENTER, TryCatch #6 {kq2 -> 0x003d, CancellationException -> 0x003a, blocks: (B:14:0x0035, B:49:0x0098, B:56:0x00ba, B:58:0x00c1, B:60:0x00c4, B:63:0x00d8, B:65:0x00dc, B:68:0x00f1, B:83:0x0147, B:91:0x0160, B:92:0x0163, B:94:0x0165, B:95:0x016a, B:38:0x0078, B:41:0x007f, B:52:0x00a8), top: B:110:0x0023, inners: #2 }] */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:84:0x0154 -> B:49:0x0098). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(lu2 lu2Var, ContinuationImpl continuationImpl) throws Throwable {
        rt2 rt2Var;
        lu2 lu2Var2;
        CancellationException e3;
        kq2 e11;
        t70.c2 c2Var;
        ar.a aVar;
        t70.c2 c2Var2;
        b00.e eVar;
        c80.a aVar2;
        ni.g0 g0Var;
        b.a1 a1Var;
        d dVar;
        b.a1 a1Var2;
        dq2 dq2Var;
        d dVar2;
        st2 st2Var;
        dq2 dq2Var2;
        long j11;
        Object objE;
        if (continuationImpl instanceof rt2) {
            rt2Var = (rt2) continuationImpl;
            int i5 = rt2Var.f9308g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rt2Var.f9308g = i5 - Integer.MIN_VALUE;
            } else {
                rt2Var = new rt2(lu2Var, continuationImpl);
            }
        }
        Object objY = rt2Var.f9306e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r22 = rt2Var.f9308g;
        Continuation continuation = null;
        try {
            try {
                try {
                } catch (kq2 e12) {
                    e11 = e12;
                    c2Var2 = t70.c2.f88780b;
                    eVar = new b00.e(lu2Var2, e11, continuation, 20);
                    rt2Var.f9302a = null;
                    rt2Var.f9303b = null;
                    rt2Var.f9304c = null;
                    rt2Var.f9305d = null;
                    rt2Var.f9308g = 8;
                    if (m0.y(c2Var2, eVar, rt2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    return Unit.f71706a;
                } catch (CancellationException e13) {
                    e3 = e13;
                    c2Var = t70.c2.f88780b;
                    aVar = new ar.a(lu2Var2, e3, continuation, 12);
                    rt2Var.f9302a = null;
                    rt2Var.f9303b = null;
                    rt2Var.f9304c = null;
                    rt2Var.f9305d = null;
                    rt2Var.f9308g = 9;
                    if (m0.y(c2Var, aVar, rt2Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    return Unit.f71706a;
                }
            } catch (kq2 e14) {
                e11 = e14;
                lu2Var2 = r22;
                c2Var2 = t70.c2.f88780b;
                eVar = new b00.e(lu2Var2, e11, continuation, 20);
                rt2Var.f9302a = null;
                rt2Var.f9303b = null;
                rt2Var.f9304c = null;
                rt2Var.f9305d = null;
                rt2Var.f9308g = 8;
                if (m0.y(c2Var2, eVar, rt2Var) == coroutineSingletons) {
                }
                return Unit.f71706a;
            } catch (CancellationException e15) {
                e3 = e15;
                lu2Var2 = r22;
                c2Var = t70.c2.f88780b;
                aVar = new ar.a(lu2Var2, e3, continuation, 12);
                rt2Var.f9302a = null;
                rt2Var.f9303b = null;
                rt2Var.f9304c = null;
                rt2Var.f9305d = null;
                rt2Var.f9308g = 9;
                if (m0.y(c2Var, aVar, rt2Var) == coroutineSingletons) {
                }
                return Unit.f71706a;
            }
        } catch (kq2 e16) {
            lu2Var2 = lu2Var;
            e11 = e16;
            c2Var2 = t70.c2.f88780b;
            eVar = new b00.e(lu2Var2, e11, continuation, 20);
            rt2Var.f9302a = null;
            rt2Var.f9303b = null;
            rt2Var.f9304c = null;
            rt2Var.f9305d = null;
            rt2Var.f9308g = 8;
            if (m0.y(c2Var2, eVar, rt2Var) == coroutineSingletons) {
            }
            return Unit.f71706a;
        } catch (CancellationException e17) {
            lu2Var2 = lu2Var;
            e3 = e17;
            c2Var = t70.c2.f88780b;
            aVar = new ar.a(lu2Var2, e3, continuation, 12);
            rt2Var.f9302a = null;
            rt2Var.f9303b = null;
            rt2Var.f9304c = null;
            rt2Var.f9305d = null;
            rt2Var.f9308g = 9;
            if (m0.y(c2Var, aVar, rt2Var) == coroutineSingletons) {
            }
            return Unit.f71706a;
        }
        switch (r22) {
            case 0:
                ResultKt.b(objY);
                d dVar3 = lu2Var.f6965e;
                rt2Var.f9302a = lu2Var;
                rt2Var.f9303b = dVar3;
                rt2Var.f9308g = 1;
                objE = dVar3.e(rt2Var);
                aVar2 = dVar3;
                if (objE != coroutineSingletons) {
                    try {
                        j11 = lu2Var.o;
                        Duration.f72038b.getClass();
                        if (!(Duration.c(j11, 0L) > 0)) {
                            return Unit.f71706a;
                        }
                        st2 st2Var2 = new st2(lu2Var, null, 0);
                        rt2Var.f9302a = lu2Var;
                        rt2Var.f9303b = null;
                        rt2Var.f9308g = 2;
                        if (lu2Var.a(st2Var2, rt2Var) != coroutineSingletons) {
                            dq2Var2 = lu2Var.f6964d;
                            if (dq2Var2 != null) {
                                Intrinsics.m("adLoader");
                                throw null;
                            }
                            rt2Var.f9302a = lu2Var;
                            rt2Var.f9308g = 3;
                            objY = m0.y(dq2Var2.f2587p, new b0(dq2Var2, continuation, 16), rt2Var);
                            if (objY != coroutineSingletons) {
                                Pair pair = (Pair) objY;
                                b.a1 a1Var3 = (b.a1) pair.f71683a;
                                ni.g0 g0Var2 = (ni.g0) pair.f71684b;
                                st2Var = new st2(lu2Var, null, 1);
                                rt2Var.f9302a = lu2Var;
                                rt2Var.f9303b = a1Var3;
                                rt2Var.f9304c = g0Var2;
                                rt2Var.f9308g = 4;
                                if (lu2Var.a(st2Var, rt2Var) != coroutineSingletons) {
                                    lu2Var2 = lu2Var;
                                    a1Var = a1Var3;
                                    g0Var = g0Var2;
                                    dVar2 = lu2Var2.f6965e;
                                    rt2Var.f9302a = lu2Var2;
                                    rt2Var.f9303b = a1Var;
                                    rt2Var.f9304c = g0Var;
                                    rt2Var.f9305d = dVar2;
                                    rt2Var.f9308g = 5;
                                    if (dVar2.e(rt2Var) != coroutineSingletons) {
                                        a1Var2 = a1Var;
                                        dVar = dVar2;
                                        try {
                                            lu2Var2.f6971k = false;
                                            Unit unit = Unit.f71706a;
                                            dVar.g(null);
                                            dq2Var = lu2Var2.f6964d;
                                            if (dq2Var != null) {
                                                Intrinsics.m("adLoader");
                                                throw null;
                                            }
                                            rt2Var.f9302a = lu2Var2;
                                            rt2Var.f9303b = a1Var2;
                                            rt2Var.f9304c = null;
                                            rt2Var.f9305d = null;
                                            rt2Var.f9308g = 6;
                                            if (dq2Var.a(a1Var2, g0Var, rt2Var) != coroutineSingletons) {
                                                lu2Var = lu2Var2;
                                                rt2Var.f9302a = lu2Var;
                                                rt2Var.f9303b = null;
                                                rt2Var.f9308g = 7;
                                                if (lu2Var.c(a1Var2 instanceof xu0, rt2Var) != coroutineSingletons) {
                                                    d dVar32 = lu2Var.f6965e;
                                                    rt2Var.f9302a = lu2Var;
                                                    rt2Var.f9303b = dVar32;
                                                    rt2Var.f9308g = 1;
                                                    objE = dVar32.e(rt2Var);
                                                    aVar2 = dVar32;
                                                    if (objE != coroutineSingletons) {
                                                    }
                                                }
                                            }
                                        } catch (Throwable th2) {
                                            dVar.g(null);
                                            throw th2;
                                        }
                                    }
                                }
                            }
                        }
                    } finally {
                        ((d) aVar2).g(null);
                    }
                }
                return coroutineSingletons;
            case 1:
                c80.a aVar3 = (c80.a) rt2Var.f9303b;
                lu2 lu2Var3 = rt2Var.f9302a;
                ResultKt.b(objY);
                aVar2 = aVar3;
                lu2Var = lu2Var3;
                j11 = lu2Var.o;
                Duration.f72038b.getClass();
                if (!(Duration.c(j11, 0L) > 0)) {
                }
                break;
            case 2:
                lu2Var = rt2Var.f9302a;
                ResultKt.b(objY);
                dq2Var2 = lu2Var.f6964d;
                if (dq2Var2 != null) {
                }
                break;
            case 3:
                lu2Var = rt2Var.f9302a;
                ResultKt.b(objY);
                Pair pair2 = (Pair) objY;
                b.a1 a1Var32 = (b.a1) pair2.f71683a;
                ni.g0 g0Var22 = (ni.g0) pair2.f71684b;
                st2Var = new st2(lu2Var, null, 1);
                rt2Var.f9302a = lu2Var;
                rt2Var.f9303b = a1Var32;
                rt2Var.f9304c = g0Var22;
                rt2Var.f9308g = 4;
                if (lu2Var.a(st2Var, rt2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 4:
                ni.g0 g0Var3 = rt2Var.f9304c;
                b.a1 a1Var4 = (b.a1) rt2Var.f9303b;
                lu2Var2 = rt2Var.f9302a;
                ResultKt.b(objY);
                g0Var = g0Var3;
                a1Var = a1Var4;
                dVar2 = lu2Var2.f6965e;
                rt2Var.f9302a = lu2Var2;
                rt2Var.f9303b = a1Var;
                rt2Var.f9304c = g0Var;
                rt2Var.f9305d = dVar2;
                rt2Var.f9308g = 5;
                if (dVar2.e(rt2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                dVar = rt2Var.f9305d;
                g0Var = rt2Var.f9304c;
                a1Var2 = (b.a1) rt2Var.f9303b;
                lu2Var2 = rt2Var.f9302a;
                ResultKt.b(objY);
                lu2Var2.f6971k = false;
                Unit unit2 = Unit.f71706a;
                dVar.g(null);
                dq2Var = lu2Var2.f6964d;
                if (dq2Var != null) {
                }
                break;
            case 6:
                b.a1 a1Var5 = (b.a1) rt2Var.f9303b;
                lu2 lu2Var4 = rt2Var.f9302a;
                ResultKt.b(objY);
                a1Var2 = a1Var5;
                lu2Var = lu2Var4;
                rt2Var.f9302a = lu2Var;
                rt2Var.f9303b = null;
                rt2Var.f9308g = 7;
                if (lu2Var.c(a1Var2 instanceof xu0, rt2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 7:
                lu2Var = rt2Var.f9302a;
                ResultKt.b(objY);
                d dVar322 = lu2Var.f6965e;
                rt2Var.f9302a = lu2Var;
                rt2Var.f9303b = dVar322;
                rt2Var.f9308g = 1;
                objE = dVar322.e(rt2Var);
                aVar2 = dVar322;
                if (objE != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 8:
            case 9:
                ResultKt.b(objY);
                return Unit.f71706a;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    public final long b() {
        Duration.Companion companion = Duration.f72038b;
        this.f6962b.getClass();
        return DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Continuation continuation) {
        pt2 pt2Var;
        lu2 lu2Var;
        d dVar;
        if (continuation instanceof pt2) {
            pt2Var = (pt2) continuation;
            int i5 = pt2Var.f8383e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                pt2Var.f8383e = i5 - Integer.MIN_VALUE;
            } else {
                pt2Var = new pt2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = pt2Var.f8381c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = pt2Var.f8383e;
        if (i11 == 0) {
            ResultKt.b(obj);
            pt2Var.f8379a = this;
            d dVar2 = this.f6965e;
            pt2Var.f8380b = dVar2;
            pt2Var.f8383e = 1;
            if (dVar2.e(pt2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lu2Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = pt2Var.f8380b;
            lu2Var = pt2Var.f8379a;
            ResultKt.b(obj);
        }
        try {
            t70.g2 g2Var = lu2Var.f6966f;
            if (g2Var != null) {
                g2Var.c(null);
            }
            lu2Var.f6970j = true;
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0077 A[Catch: all -> 0x007c, TRY_LEAVE, TryCatch #1 {all -> 0x007c, blocks: (B:30:0x0072, B:32:0x0077), top: B:58:0x0072 }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        gu2 gu2Var;
        d dVar;
        lu2 lu2Var;
        d dVar2;
        lu2 lu2Var2;
        if (continuation instanceof gu2) {
            gu2Var = (gu2) continuation;
            int i5 = gu2Var.f4085e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gu2Var.f4085e = i5 - Integer.MIN_VALUE;
            } else {
                gu2Var = new gu2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = gu2Var.f4083c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gu2Var.f4085e;
        boolean z11 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                gu2Var.f4081a = this;
                dVar = this.f6965e;
                gu2Var.f4082b = dVar;
                gu2Var.f4085e = 1;
                if (dVar.e(gu2Var) != coroutineSingletons) {
                    lu2Var = this;
                }
            }
            if (i11 == 1) {
                dVar = gu2Var.f4082b;
                lu2Var = gu2Var.f4081a;
                ResultKt.b(obj);
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                dVar2 = gu2Var.f4082b;
                lu2Var2 = gu2Var.f4081a;
                ResultKt.b(obj);
                try {
                    if (!lu2Var2.f6969i) {
                        if (lu2Var2.f6970j) {
                        }
                        if (!z11) {
                            z11 = false;
                            return Boolean.valueOf(z11);
                        }
                        dq2 dq2Var = lu2Var2.f6964d;
                        if (dq2Var == null) {
                            Intrinsics.m("adLoader");
                            throw null;
                        }
                        gu2Var.f4081a = null;
                        gu2Var.f4082b = null;
                        gu2Var.f4085e = 3;
                        Object objE = dq2Var.e(gu2Var);
                        return objE == coroutineSingletons ? coroutineSingletons : objE;
                    }
                    z11 = false;
                    if (!z11) {
                    }
                } finally {
                }
            }
            if (!lu2Var.f6971k) {
                dVar2 = lu2Var.f6965e;
                gu2Var.f4081a = lu2Var;
                gu2Var.f4082b = dVar2;
                gu2Var.f4085e = 2;
                if (dVar2.e(gu2Var) != coroutineSingletons) {
                    lu2Var2 = lu2Var;
                    if (!lu2Var2.f6969i) {
                    }
                    z11 = false;
                    if (!z11) {
                    }
                }
            }
            return Boolean.valueOf(z11);
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.c7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(boolean z11, Continuation continuation) {
        zt2 zt2Var;
        lu2 lu2Var;
        d dVar;
        if (continuation instanceof zt2) {
            zt2Var = (zt2) continuation;
            int i5 = zt2Var.f12663f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zt2Var.f12663f = i5 - Integer.MIN_VALUE;
            } else {
                zt2Var = new zt2(this, continuation);
            }
        }
        Object obj = zt2Var.f12661d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zt2Var.f12663f;
        if (i11 == 0) {
            ResultKt.b(obj);
            zt2Var.f12658a = this;
            d dVar2 = this.f6965e;
            zt2Var.f12659b = dVar2;
            zt2Var.f12660c = z11;
            zt2Var.f12663f = 1;
            if (dVar2.e(zt2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lu2Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = zt2Var.f12660c;
            dVar = zt2Var.f12659b;
            lu2Var = zt2Var.f12658a;
            ResultKt.b(obj);
        }
        try {
            if (z11) {
                lu2Var.f6969i = false;
            } else {
                lu2Var.f6970j = false;
            }
            if (!lu2Var.f6969i && !lu2Var.f6970j && !lu2Var.f6967g.isCompleted()) {
                long jL = Duration.l(lu2Var.b(), lu2Var.f6972l);
                lu2Var.n = Duration.m(lu2Var.n, jL);
                lu2Var.f6973m = Duration.m(lu2Var.f6973m, jL);
                lu2Var.f6967g.j0();
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00af A[Catch: all -> 0x0081, TryCatch #0 {all -> 0x0081, blocks: (B:19:0x004c, B:21:0x0067, B:24:0x0078, B:32:0x009e, B:34:0x00b9, B:27:0x0083, B:31:0x009c, B:30:0x0092, B:33:0x00af), top: B:39:0x004c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(boolean z11, ContinuationImpl continuationImpl) {
        qt2 qt2Var;
        lu2 lu2Var;
        d dVar;
        if (continuationImpl instanceof qt2) {
            qt2Var = (qt2) continuationImpl;
            int i5 = qt2Var.f8810f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qt2Var.f8810f = i5 - Integer.MIN_VALUE;
            } else {
                qt2Var = new qt2(this, continuationImpl);
            }
        }
        Object obj = qt2Var.f8808d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qt2Var.f8810f;
        if (i11 == 0) {
            ResultKt.b(obj);
            qt2Var.f8805a = this;
            d dVar2 = this.f6965e;
            qt2Var.f8806b = dVar2;
            qt2Var.f8807c = z11;
            qt2Var.f8810f = 1;
            if (dVar2.e(qt2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lu2Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = qt2Var.f8807c;
            dVar = qt2Var.f8806b;
            lu2Var = qt2Var.f8805a;
            ResultKt.b(obj);
        }
        try {
            long jB = lu2Var.b();
            jr0 jr0Var = lu2Var.f6963c;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:proactive_banner_refresh:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                long j11 = lu2Var.f6974p;
                Duration.f72038b.getClass();
                if (Duration.c(j11, 0L) > 0) {
                    if (z11) {
                        lu2Var.f6973m = Duration.m(jB, lu2Var.f6974p);
                    } else {
                        long jL = Duration.l(jB, lu2Var.n);
                        if (Duration.c(jL, lu2Var.f6974p) < 0) {
                            jB = Duration.l(Duration.m(jB, lu2Var.f6974p), jL);
                        }
                        lu2Var.f6973m = jB;
                    }
                    lu2Var.n = Duration.l(Duration.m(lu2Var.f6973m, lu2Var.o), lu2Var.f6974p);
                } else {
                    long jM = Duration.m(jB, lu2Var.o);
                    lu2Var.n = jM;
                    lu2Var.f6973m = jM;
                }
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00bc, code lost:
    
        if (r13.K(r0) != r1) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(long j11, lu2 lu2Var, ContinuationImpl continuationImpl) {
        hu2 hu2Var;
        lu2 lu2Var2;
        d dVar;
        d dVar2;
        long j12;
        lu2 lu2Var3;
        if (continuationImpl instanceof hu2) {
            hu2Var = (hu2) continuationImpl;
            int i5 = hu2Var.f4546f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hu2Var.f4546f = i5 - Integer.MIN_VALUE;
            } else {
                hu2Var = new hu2(lu2Var, continuationImpl);
            }
        }
        Object obj = hu2Var.f4544d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hu2Var.f4546f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                Duration.f72038b.getClass();
                if (Duration.c(j11, 0L) <= 0) {
                    return Unit.f71706a;
                }
                d dVar3 = lu2Var.f6965e;
                hu2Var.f4541a = lu2Var;
                hu2Var.f4542b = dVar3;
                hu2Var.f4543c = j11;
                hu2Var.f4546f = 1;
                if (dVar3.e(hu2Var) != coroutineSingletons) {
                    lu2Var2 = lu2Var;
                    dVar = dVar3;
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                j11 = hu2Var.f4543c;
                dVar = hu2Var.f4542b;
                lu2 lu2Var4 = hu2Var.f4541a;
                ResultKt.b(obj);
                lu2Var2 = lu2Var4;
            } else {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                dVar2 = hu2Var.f4542b;
                lu2Var3 = hu2Var.f4541a;
                ResultKt.b(obj);
                try {
                    s1 s1Var = lu2Var3.f6968h;
                    dVar2.g(null);
                    hu2Var.f4541a = null;
                    hu2Var.f4542b = null;
                    hu2Var.f4546f = 3;
                } finally {
                }
            }
            lu2Var2.f6968h.j0();
            lu2Var2.f6968h = m0.c();
            t70.j0 j0Var = lu2Var2.f6961a;
            br brVar = new br(j12, lu2Var2, null, 1);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(brVar, null), 2);
            dVar2.g(null);
            dVar2 = lu2Var2.f6965e;
            hu2Var.f4541a = lu2Var2;
            hu2Var.f4542b = dVar2;
            hu2Var.f4546f = 2;
            if (dVar2.e(hu2Var) != coroutineSingletons) {
                lu2Var3 = lu2Var2;
                s1 s1Var2 = lu2Var3.f6968h;
                dVar2.g(null);
                hu2Var.f4541a = null;
                hu2Var.f4542b = null;
                hu2Var.f4546f = 3;
            }
            return coroutineSingletons;
        } finally {
        }
        j12 = j11;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.ka
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(d33 d33Var, Continuation continuation) {
        wt2 wt2Var;
        d dVar;
        lu2 lu2Var;
        if (continuation instanceof wt2) {
            wt2Var = (wt2) continuation;
            int i5 = wt2Var.f11396f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wt2Var.f11396f = i5 - Integer.MIN_VALUE;
            } else {
                wt2Var = new wt2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = wt2Var.f11394d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wt2Var.f11396f;
        if (i11 == 0) {
            ResultKt.b(obj);
            wt2Var.f11391a = this;
            wt2Var.f11392b = d33Var;
            dVar = this.f6965e;
            wt2Var.f11393c = dVar;
            wt2Var.f11396f = 1;
            if (dVar.e(wt2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lu2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = wt2Var.f11393c;
            d33 d33Var2 = wt2Var.f11392b;
            lu2Var = wt2Var.f11391a;
            ResultKt.b(obj);
            dVar = dVar2;
            d33Var = d33Var2;
        }
        try {
            hv hvVar = d33Var.f2166b.f12428b;
            lu2Var.f6974p = hvVar.o;
            lu2Var.o = hvVar.n;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.c7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        xt2 xt2Var;
        lu2 lu2Var;
        d dVar;
        if (continuation instanceof xt2) {
            xt2Var = (xt2) continuation;
            int i5 = xt2Var.f11828e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xt2Var.f11828e = i5 - Integer.MIN_VALUE;
            } else {
                xt2Var = new xt2(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = xt2Var.f11826c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xt2Var.f11828e;
        if (i11 == 0) {
            ResultKt.b(obj);
            xt2Var.f11824a = this;
            d dVar2 = this.f6965e;
            xt2Var.f11825b = dVar2;
            xt2Var.f11828e = 1;
            if (dVar2.e(xt2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lu2Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = xt2Var.f11825b;
            lu2Var = xt2Var.f11824a;
            ResultKt.b(obj);
        }
        try {
            lu2Var.f6969i = false;
            lu2Var.f6970j = false;
            lu2Var.f6971k = true;
            long jB = lu2Var.b();
            lu2Var.f6973m = jB;
            lu2Var.n = jB;
            lu2Var.f6967g.j0();
            lu2Var.f6968h.j0();
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.c7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, Continuation continuation) {
        yt2 yt2Var;
        lu2 lu2Var;
        d dVar;
        if (continuation instanceof yt2) {
            yt2Var = (yt2) continuation;
            int i5 = yt2Var.f12283f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yt2Var.f12283f = i5 - Integer.MIN_VALUE;
            } else {
                yt2Var = new yt2(this, continuation);
            }
        }
        Object obj = yt2Var.f12281d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yt2Var.f12283f;
        if (i11 == 0) {
            ResultKt.b(obj);
            yt2Var.f12278a = this;
            d dVar2 = this.f6965e;
            yt2Var.f12279b = dVar2;
            yt2Var.f12280c = z11;
            yt2Var.f12283f = 1;
            if (dVar2.e(yt2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            lu2Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = yt2Var.f12280c;
            dVar = yt2Var.f12279b;
            lu2Var = yt2Var.f12278a;
            ResultKt.b(obj);
        }
        try {
            if (!lu2Var.f6969i && !lu2Var.f6970j) {
                lu2Var.f6967g = m0.c();
                lu2Var.f6972l = lu2Var.b();
            }
            if (z11) {
                lu2Var.f6969i = true;
            } else {
                lu2Var.f6970j = true;
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a8, code lost:
    
        if (r10.invoke(r0) == r1) goto L41;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0041 A[PHI: r2 r10
      0x0041: PHI (r2v5 ads_mobile_sdk.lu2) = (r2v1 ads_mobile_sdk.lu2), (r2v9 ads_mobile_sdk.lu2) binds: [B:31:0x008d, B:17:0x003a] A[DONT_GENERATE, DONT_INLINE]
      0x0041: PHI (r10v5 ??) = (r10v14 ??), (r10v15 ??) binds: [B:31:0x008d, B:17:0x003a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x006c A[EXC_TOP_SPLITTER, PHI: r8 r10 r11
      0x006c: PHI (r8v1 ads_mobile_sdk.lu2) = (r8v2 ads_mobile_sdk.lu2), (r8v4 ads_mobile_sdk.lu2) binds: [B:23:0x0069, B:20:0x004b] A[DONT_GENERATE, DONT_INLINE]
      0x006c: PHI (r10v2 ads_mobile_sdk.gb) = (r10v18 ads_mobile_sdk.gb), (r10v10 ads_mobile_sdk.gb) binds: [B:23:0x0069, B:20:0x004b] A[DONT_GENERATE, DONT_INLINE]
      0x006c: PHI (r11v4 c80.d) = (r11v6 c80.d), (r11v10 c80.d) binds: [B:23:0x0069, B:20:0x004b] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r10v11, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r10v15 */
    /* JADX WARN: Type inference failed for: r10v5, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r2v7, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x008d -> B:18:0x0041). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(gb gbVar, ContinuationImpl continuationImpl) {
        au2 au2Var;
        lu2 lu2Var;
        gb gbVar2;
        lu2 lu2Var2;
        d dVar;
        d dVar2;
        gb gbVar3;
        s1 s1Var;
        gb gbVar4;
        ?? r102;
        if (continuationImpl instanceof au2) {
            au2Var = (au2) continuationImpl;
            int i5 = au2Var.f1101f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                au2Var.f1101f = i5 - Integer.MIN_VALUE;
            } else {
                au2Var = new au2(this, continuationImpl);
            }
        }
        Object obj = au2Var.f1099d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = au2Var.f1101f;
        if (i11 == 0) {
            ResultKt.b(obj);
            lu2Var = this;
            gbVar4 = gbVar;
            dVar2 = lu2Var.f6965e;
            au2Var.f1096a = lu2Var;
            au2Var.f1097b = gbVar4;
            au2Var.f1098c = dVar2;
            au2Var.f1101f = 1;
            gbVar3 = gbVar4;
            if (dVar2.e(au2Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            d dVar3 = au2Var.f1098c;
            ?? r22 = au2Var.f1097b;
            lu2Var = au2Var.f1096a;
            ResultKt.b(obj);
            dVar2 = dVar3;
            gbVar3 = r22;
            s1Var = lu2Var.f6967g;
            dVar2.g(null);
            au2Var.f1096a = lu2Var;
            au2Var.f1097b = gbVar3;
            au2Var.f1098c = null;
            au2Var.f1101f = 2;
            if (s1Var.K(au2Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 2) {
            ?? r103 = au2Var.f1097b;
            lu2Var2 = au2Var.f1096a;
            ResultKt.b(obj);
            gbVar2 = r103;
            dVar = lu2Var2.f6965e;
            au2Var.f1096a = lu2Var2;
            au2Var.f1097b = gbVar2;
            au2Var.f1101f = 3;
            r102 = gbVar2;
            if (dVar.e(au2Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 3) {
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        Function1 function1 = au2Var.f1097b;
        lu2Var2 = au2Var.f1096a;
        ResultKt.b(obj);
        r102 = function1;
        lu2Var = lu2Var2;
        try {
            boolean z11 = lu2Var.f6969i;
            d dVar4 = lu2Var.f6965e;
            if (z11 && !lu2Var.f6970j) {
                dVar4.g(null);
                au2Var.f1096a = null;
                au2Var.f1097b = null;
                au2Var.f1101f = 4;
            } else {
                dVar4.g(null);
                gbVar4 = r102;
                dVar2 = lu2Var.f6965e;
                au2Var.f1096a = lu2Var;
                au2Var.f1097b = gbVar4;
                au2Var.f1098c = dVar2;
                au2Var.f1101f = 1;
                gbVar3 = gbVar4;
                if (dVar2.e(au2Var) != coroutineSingletons) {
                    try {
                        s1Var = lu2Var.f6967g;
                        dVar2.g(null);
                        au2Var.f1096a = lu2Var;
                        au2Var.f1097b = gbVar3;
                        au2Var.f1098c = null;
                        au2Var.f1101f = 2;
                        if (s1Var.K(au2Var) != coroutineSingletons) {
                            lu2Var2 = lu2Var;
                            gbVar2 = gbVar3;
                            dVar = lu2Var2.f6965e;
                            au2Var.f1096a = lu2Var2;
                            au2Var.f1097b = gbVar2;
                            au2Var.f1101f = 3;
                            r102 = gbVar2;
                            if (dVar.e(au2Var) != coroutineSingletons) {
                                lu2Var = lu2Var2;
                                boolean z112 = lu2Var.f6969i;
                                d dVar42 = lu2Var.f6965e;
                                if (z112) {
                                }
                                dVar42.g(null);
                                gbVar4 = r102;
                                dVar2 = lu2Var.f6965e;
                                au2Var.f1096a = lu2Var;
                                au2Var.f1097b = gbVar4;
                                au2Var.f1098c = dVar2;
                                au2Var.f1101f = 1;
                                gbVar3 = gbVar4;
                                if (dVar2.e(au2Var) != coroutineSingletons) {
                                }
                            }
                        }
                    } catch (Throwable th2) {
                        dVar2.g(null);
                        throw th2;
                    }
                }
                return coroutineSingletons;
            }
        } catch (Throwable th3) {
            lu2Var.f6965e.g(null);
            throw th3;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(dq2 dq2Var, q1 q1Var, ContinuationImpl continuationImpl) {
        bu2 bu2Var;
        lu2 lu2Var;
        lu2 lu2Var2;
        d dVar;
        d dVar2;
        lu2 lu2Var3;
        t70.g2 g2Var;
        if (continuationImpl instanceof bu2) {
            bu2Var = (bu2) continuationImpl;
            int i5 = bu2Var.f1573f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bu2Var.f1573f = i5 - Integer.MIN_VALUE;
            } else {
                bu2Var = new bu2(this, continuationImpl);
            }
        }
        Object obj = bu2Var.f1571d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bu2Var.f1573f;
        int i12 = 3;
        int i13 = 2;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            this.f6964d = dq2Var;
            bu2Var.f1568a = this;
            bu2Var.f1569b = q1Var;
            bu2Var.f1573f = 1;
            if (c(true, bu2Var) != coroutineSingletons) {
                lu2Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                dVar2 = bu2Var.f1570c;
                q1Var = bu2Var.f1569b;
                lu2Var3 = bu2Var.f1568a;
                ResultKt.b(obj);
                try {
                    g2Var = lu2Var3.f6966f;
                    if (g2Var != null) {
                        return Unit.f71706a;
                    }
                    t70.j0 j0Var = lu2Var3.f6961a;
                    b00.e eVar = new b00.e(q1Var, g2Var, continuation, i13);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    g2Var.w(new du2(m0.t(j0Var, context, null, new ar.a(eVar, null), 2), 0));
                    return Unit.f71706a;
                } finally {
                }
            }
            dVar = bu2Var.f1570c;
            q1Var = bu2Var.f1569b;
            lu2Var2 = bu2Var.f1568a;
            ResultKt.b(obj);
            try {
                t70.j0 j0Var2 = lu2Var2.f6961a;
                a60.d dVar3 = new a60.d(lu2Var2, continuation, i12);
                EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var2, "<this>");
                Intrinsics.g(context2, "context");
                lu2Var2.f6966f = m0.t(j0Var2, context2, null, new ar.a(dVar3, null), 2);
                Unit unit = Unit.f71706a;
                if (q1Var != null) {
                    dVar2 = lu2Var2.f6965e;
                    bu2Var.f1568a = lu2Var2;
                    bu2Var.f1569b = q1Var;
                    bu2Var.f1570c = dVar2;
                    bu2Var.f1573f = 3;
                    if (dVar2.e(bu2Var) != coroutineSingletons) {
                        lu2Var3 = lu2Var2;
                        g2Var = lu2Var3.f6966f;
                        if (g2Var != null) {
                        }
                    }
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            } finally {
            }
        }
        q1Var = bu2Var.f1569b;
        lu2Var = bu2Var.f1568a;
        ResultKt.b(obj);
        d dVar4 = lu2Var.f6965e;
        bu2Var.f1568a = lu2Var;
        bu2Var.f1569b = q1Var;
        bu2Var.f1570c = dVar4;
        bu2Var.f1573f = 2;
        if (dVar4.e(bu2Var) != coroutineSingletons) {
            lu2Var2 = lu2Var;
            dVar = dVar4;
            t70.j0 j0Var22 = lu2Var2.f6961a;
            a60.d dVar32 = new a60.d(lu2Var2, continuation, i12);
            EmptyCoroutineContext context22 = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var22, "<this>");
            Intrinsics.g(context22, "context");
            lu2Var2.f6966f = m0.t(j0Var22, context22, null, new ar.a(dVar32, null), 2);
            Unit unit2 = Unit.f71706a;
            if (q1Var != null) {
            }
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0080 A[PHI: r2 r13 r14
      0x0080: PHI (r2v4 ads_mobile_sdk.lu2) = (r2v5 ads_mobile_sdk.lu2), (r2v11 ads_mobile_sdk.lu2) binds: [B:28:0x007d, B:20:0x004a] A[DONT_GENERATE, DONT_INLINE]
      0x0080: PHI (r13v4 kotlin.jvm.functions.Function1) = (r13v5 kotlin.jvm.functions.Function1), (r13v10 kotlin.jvm.functions.Function1) binds: [B:28:0x007d, B:20:0x004a] A[DONT_GENERATE, DONT_INLINE]
      0x0080: PHI (r14v7 java.lang.Object) = (r14v12 java.lang.Object), (r14v1 java.lang.Object) binds: [B:28:0x007d, B:20:0x004a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:42:0x00b7 -> B:15:0x0036). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x00df -> B:23:0x005e). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Function1 function1, ContinuationImpl continuationImpl) {
        ju2 ju2Var;
        lu2 lu2Var;
        lu2 lu2Var2;
        lu2 lu2Var3;
        gb gbVar;
        if (continuationImpl instanceof ju2) {
            ju2Var = (ju2) continuationImpl;
            int i5 = ju2Var.f5416f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ju2Var.f5416f = i5 - Integer.MIN_VALUE;
            } else {
                ju2Var = new ju2(this, continuationImpl);
            }
        }
        Object objD = ju2Var.f5414d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ju2Var.f5416f;
        if (i11 == 0) {
            ResultKt.b(objD);
            lu2Var = this;
            gbVar = new gb(lu2Var, null, function1);
            ju2Var.f5411a = lu2Var;
            ju2Var.f5412b = function1;
            ju2Var.f5413c = null;
            ju2Var.f5416f = 1;
            if (lu2Var.a(gbVar, (ContinuationImpl) ju2Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            function1 = ju2Var.f5412b;
            lu2Var2 = ju2Var.f5411a;
            ResultKt.b(objD);
            ju2Var.f5411a = lu2Var2;
            ju2Var.f5412b = function1;
            ju2Var.f5416f = 2;
            objD = function1.invoke(ju2Var);
            if (objD != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 2) {
            function1 = ju2Var.f5412b;
            lu2Var2 = ju2Var.f5411a;
            ResultKt.b(objD);
            if (Duration.c(((Duration) objD).f72041a, lu2Var2.b()) <= 0) {
            }
        } else {
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                d dVar = ju2Var.f5413c;
                Function1 function12 = ju2Var.f5412b;
                lu2Var3 = ju2Var.f5411a;
                ResultKt.b(objD);
                lu2Var = lu2Var3;
                try {
                    if (!lu2Var.f6969i && !lu2Var.f6970j) {
                        long jM = Duration.m(lu2Var.b(), lu2Var.o);
                        lu2Var.f6973m = jM;
                        lu2Var.n = jM;
                    }
                    Unit unit = Unit.f71706a;
                    dVar.g(null);
                    function1 = function12;
                    gbVar = new gb(lu2Var, null, function1);
                    ju2Var.f5411a = lu2Var;
                    ju2Var.f5412b = function1;
                    ju2Var.f5413c = null;
                    ju2Var.f5416f = 1;
                    if (lu2Var.a(gbVar, (ContinuationImpl) ju2Var) != coroutineSingletons) {
                        lu2Var2 = lu2Var;
                        ju2Var.f5411a = lu2Var2;
                        ju2Var.f5412b = function1;
                        ju2Var.f5416f = 2;
                        objD = function1.invoke(ju2Var);
                        if (objD != coroutineSingletons) {
                            if (Duration.c(((Duration) objD).f72041a, lu2Var2.b()) <= 0) {
                                lu2Var = lu2Var2;
                                gbVar = new gb(lu2Var, null, function1);
                                ju2Var.f5411a = lu2Var;
                                ju2Var.f5412b = function1;
                                ju2Var.f5413c = null;
                                ju2Var.f5416f = 1;
                                if (lu2Var.a(gbVar, (ContinuationImpl) ju2Var) != coroutineSingletons) {
                                }
                            } else {
                                ju2Var.f5411a = lu2Var2;
                                ju2Var.f5412b = function1;
                                ju2Var.f5416f = 3;
                                objD = lu2Var2.d(ju2Var);
                                if (objD != coroutineSingletons) {
                                    lu2Var3 = lu2Var2;
                                    if (!((Boolean) objD).booleanValue()) {
                                        return Unit.f71706a;
                                    }
                                    d dVar2 = lu2Var3.f6965e;
                                    ju2Var.f5411a = lu2Var3;
                                    ju2Var.f5412b = function1;
                                    ju2Var.f5413c = dVar2;
                                    ju2Var.f5416f = 4;
                                    if (dVar2.e(ju2Var) != coroutineSingletons) {
                                        function12 = function1;
                                        dVar = dVar2;
                                        lu2Var = lu2Var3;
                                        if (!lu2Var.f6969i) {
                                            long jM2 = Duration.m(lu2Var.b(), lu2Var.o);
                                            lu2Var.f6973m = jM2;
                                            lu2Var.n = jM2;
                                        }
                                        Unit unit2 = Unit.f71706a;
                                        dVar.g(null);
                                        function1 = function12;
                                        gbVar = new gb(lu2Var, null, function1);
                                        ju2Var.f5411a = lu2Var;
                                        ju2Var.f5412b = function1;
                                        ju2Var.f5413c = null;
                                        ju2Var.f5416f = 1;
                                        if (lu2Var.a(gbVar, (ContinuationImpl) ju2Var) != coroutineSingletons) {
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return coroutineSingletons;
                } catch (Throwable th2) {
                    dVar.g(null);
                    throw th2;
                }
            }
            function1 = ju2Var.f5412b;
            lu2Var2 = ju2Var.f5411a;
            ResultKt.b(objD);
            lu2Var3 = lu2Var2;
            if (!((Boolean) objD).booleanValue()) {
            }
        }
    }
}
