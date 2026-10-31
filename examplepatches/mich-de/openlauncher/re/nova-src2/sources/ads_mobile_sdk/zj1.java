package ads_mobile_sdk;

import android.content.Context;
import android.net.Uri;
import ar.d;
import b.e6;
import b.ed;
import b.i0;
import b.o2;
import b.x0;
import hn.n;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.p2;
import t70.s1;

/* loaded from: classes.dex */
public final class zj1 extends tk0 {

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f12552d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.j0 f12553e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f12554f;

    /* renamed from: g, reason: collision with root package name */
    public final o2 f12555g;

    /* renamed from: h, reason: collision with root package name */
    public final e6 f12556h;

    /* renamed from: i, reason: collision with root package name */
    public final zq0 f12557i;

    /* renamed from: j, reason: collision with root package name */
    public final e23 f12558j;

    /* renamed from: k, reason: collision with root package name */
    public final sp3 f12559k;

    /* renamed from: l, reason: collision with root package name */
    public final kz2 f12560l;

    /* renamed from: m, reason: collision with root package name */
    public final i0 f12561m;
    public final b.m5 n;
    public final rw0 o;

    /* renamed from: p, reason: collision with root package name */
    public fz f12562p;

    public zj1(Context context, t70.j0 uiScope, t70.j0 backgroundScope, jr0 flags, o2 clock, e6 httpClient, zq0 flagUpdater, e23 sdkCoreDataStore, x0 flagValueProvider, sp3 webViewFactory, kz2 rootTraceCreator, i0 jsContext, b.m5 configuratorProvider, rw0 gmaUtil) {
        Intrinsics.g(context, "context");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(flagUpdater, "flagUpdater");
        Intrinsics.g(sdkCoreDataStore, "sdkCoreDataStore");
        Intrinsics.g(flagValueProvider, "flagValueProvider");
        Intrinsics.g(webViewFactory, "webViewFactory");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(jsContext, "jsContext");
        Intrinsics.g(configuratorProvider, "configuratorProvider");
        Intrinsics.g(gmaUtil, "gmaUtil");
        this.f12552d = uiScope;
        this.f12553e = backgroundScope;
        this.f12554f = flags;
        this.f12555g = clock;
        this.f12556h = httpClient;
        this.f12557i = flagUpdater;
        this.f12558j = sdkCoreDataStore;
        this.f12559k = webViewFactory;
        this.f12560l = rootTraceCreator;
        this.f12561m = jsContext;
        this.n = configuratorProvider;
        this.o = gmaUtil;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0063, code lost:
    
        if (r5.c(r6, r0) == r1) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(zj1 zj1Var, String str, ContinuationImpl continuationImpl) {
        uj1 uj1Var;
        if (continuationImpl instanceof uj1) {
            uj1Var = (uj1) continuationImpl;
            int i5 = uj1Var.f10367d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uj1Var.f10367d = i5 - Integer.MIN_VALUE;
            } else {
                uj1Var = new uj1(zj1Var, continuationImpl);
            }
        }
        Object objA = uj1Var.f10365b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uj1Var.f10367d;
        if (i11 == 0) {
            ResultKt.b(objA);
            uj1Var.f10364a = zj1Var;
            uj1Var.f10367d = 1;
            objA = zj1Var.a(str, uj1Var);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        zj1Var = uj1Var.f10364a;
        ResultKt.b(objA);
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return Unit.f71706a;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        re1 re1Var = (re1) ((xu0) a1Var).f11834b;
        uj1Var.f10364a = null;
        uj1Var.f10367d = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(zj1 zj1Var, String str, ContinuationImpl continuationImpl) {
        yj1 yj1Var;
        if (continuationImpl instanceof yj1) {
            yj1Var = (yj1) continuationImpl;
            int i5 = yj1Var.f12038d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yj1Var.f12038d = i5 - Integer.MIN_VALUE;
            } else {
                yj1Var = new yj1(zj1Var, continuationImpl);
            }
        }
        Object objC = yj1Var.f12036b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yj1Var.f12038d;
        if (i11 == 0) {
            ResultKt.b(objC);
            yj1Var.f12035a = zj1Var;
            yj1Var.f12038d = 1;
            objC = zj1Var.c(str, yj1Var);
            if (objC != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            String str2 = (String) yj1Var.f12035a;
            ResultKt.b(objC);
            return str2;
        }
        zj1Var = (zj1) yj1Var.f12035a;
        ResultKt.b(objC);
        b.a1 a1Var = (b.a1) objC;
        if (a1Var instanceof pu0) {
            return null;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        ww2 ww2Var = ((a21) ((xu0) a1Var).f11834b).f812d;
        String strA = ww2Var != null ? ww2.a(ww2Var) : null;
        if (strA != null && !r70.k.U0(strA)) {
            e23 e23Var = zj1Var.f12558j;
            yj1Var.f12035a = strA;
            yj1Var.f12038d = 2;
            e23Var.getClass();
            if (e23.a(e23Var, strA, yj1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return strA;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0094 A[Catch: all -> 0x0044, TRY_LEAVE, TryCatch #2 {all -> 0x0044, blocks: (B:20:0x0040, B:31:0x008e, B:33:0x0094), top: B:107:0x0040 }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a9 A[Catch: all -> 0x00b5, TryCatch #3 {all -> 0x00b5, blocks: (B:38:0x00a2, B:40:0x00a9, B:42:0x00ad, B:44:0x00b1, B:47:0x00b7, B:49:0x00bb, B:51:0x00bf, B:53:0x00c3, B:54:0x00c4, B:55:0x00c9, B:56:0x00ca, B:57:0x00d1, B:58:0x00d2, B:59:0x00d9, B:60:0x00da), top: B:109:0x00a2 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00da A[Catch: all -> 0x00b5, TRY_LEAVE, TryCatch #3 {all -> 0x00b5, blocks: (B:38:0x00a2, B:40:0x00a9, B:42:0x00ad, B:44:0x00b1, B:47:0x00b7, B:49:0x00bb, B:51:0x00bf, B:53:0x00c3, B:54:0x00c4, B:55:0x00c9, B:56:0x00ca, B:57:0x00d1, B:58:0x00d2, B:59:0x00d9, B:60:0x00da), top: B:109:0x00a2 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0102 A[Catch: all -> 0x0031, TRY_LEAVE, TryCatch #0 {all -> 0x0031, blocks: (B:13:0x002c, B:70:0x00fc, B:72:0x0102), top: B:104:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0117 A[Catch: all -> 0x0123, TryCatch #1 {all -> 0x0123, blocks: (B:77:0x0110, B:79:0x0117, B:81:0x011b, B:83:0x011f, B:86:0x0125, B:88:0x0129, B:90:0x012d, B:92:0x0131, B:93:0x0132, B:94:0x0137, B:95:0x0138, B:96:0x013f, B:97:0x0140, B:98:0x0147, B:99:0x0148), top: B:106:0x0110 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0148 A[Catch: all -> 0x0123, TRY_LEAVE, TryCatch #1 {all -> 0x0123, blocks: (B:77:0x0110, B:79:0x0117, B:81:0x011b, B:83:0x011f, B:86:0x0125, B:88:0x0129, B:90:0x012d, B:92:0x0131, B:93:0x0132, B:94:0x0137, B:95:0x0138, B:96:0x013f, B:97:0x0140, B:98:0x0147, B:99:0x0148), top: B:106:0x0110 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ContinuationImpl continuationImpl) {
        vj1 vj1Var;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        th3 th3Var3;
        TimeoutCancellationException th3;
        th3 th3Var4;
        b.a1 a1Var;
        b.a1 a1Var2;
        if (continuationImpl instanceof vj1) {
            vj1Var = (vj1) continuationImpl;
            int i5 = vj1Var.f10803e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vj1Var.f10803e = i5 - Integer.MIN_VALUE;
            } else {
                vj1Var = new vj1(this, continuationImpl);
            }
        }
        Object obj = vj1Var.f10801c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vj1Var.f10803e;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = this.f12560l;
            wv0 wv0Var = wv0.CUI_NAME_SDKINIT_SDKCORE_REQUEST;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    e6 e6Var = this.f12556h;
                    URL url = new URL(str);
                    vj1Var.f10799a = em2VarA;
                    vj1Var.f10800b = em2VarA;
                    vj1Var.f10803e = 1;
                    Object objB = e6.b(e6Var, url, null, vj1Var, 30);
                    if (objB != coroutineSingletons) {
                        th3Var3 = em2VarA;
                        obj = objB;
                        th3Var4 = th3Var3;
                        a1Var = (b.a1) obj;
                        if (a1Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var4, null);
                        return a1Var;
                    }
                } catch (Throwable th4) {
                    th3Var3 = em2VarA;
                    th3 = th4;
                    th3Var4 = th3Var3;
                    th3Var3.b(th3);
                    if (!(th3 instanceof b.a4)) {
                    }
                }
            } else {
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    e6 e6Var2 = this.f12556h;
                    URL url2 = new URL(str);
                    vj1Var.f10799a = th3VarA;
                    vj1Var.f10800b = th3VarA;
                    vj1Var.f10803e = 2;
                    Object objB2 = e6.b(e6Var2, url2, null, vj1Var, 30);
                    if (objB2 != coroutineSingletons) {
                        th3Var = th3VarA;
                        obj = objB2;
                        th3Var2 = th3Var;
                        a1Var2 = (b.a1) obj;
                        if (a1Var2 instanceof pu0) {
                        }
                        CloseableKt.a(th3Var2, null);
                        return a1Var2;
                    }
                } catch (Throwable th5) {
                    th3Var = th3VarA;
                    th2 = th5;
                    th3Var2 = th3Var;
                    th3Var.b(th2);
                    if (!(th2 instanceof b.a4)) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var2 = vj1Var.f10800b;
            th3Var = vj1Var.f10799a;
            try {
                ResultKt.b(obj);
                a1Var2 = (b.a1) obj;
                if (a1Var2 instanceof pu0) {
                    zi3.a((pu0) a1Var2, false);
                }
                CloseableKt.a(th3Var2, null);
                return a1Var2;
            } catch (Throwable th6) {
                th2 = th6;
                try {
                    th3Var.b(th2);
                    if (!(th2 instanceof b.a4)) {
                        throw th2;
                    }
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        th3Var.a(th2);
                    }
                    if (th2 instanceof TimeoutCancellationException) {
                        throw new lw0(th2);
                    }
                    if (th2 instanceof CancellationException) {
                        throw new du0(th2);
                    }
                    if (th2 instanceof dv0) {
                        throw th2;
                    }
                    throw new iu0(th2);
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        th3Var4 = vj1Var.f10800b;
        th3Var3 = vj1Var.f10799a;
        try {
            ResultKt.b(obj);
            a1Var = (b.a1) obj;
            if (a1Var instanceof pu0) {
                zi3.a((pu0) a1Var, false);
            }
            CloseableKt.a(th3Var4, null);
            return a1Var;
        } catch (Throwable th7) {
            th3 = th7;
            try {
                th3Var3.b(th3);
                if (!(th3 instanceof b.a4)) {
                    throw th3;
                }
                if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                    th3Var3.a(th3);
                }
                if (th3 instanceof TimeoutCancellationException) {
                    throw new lw0(th3);
                }
                if (th3 instanceof CancellationException) {
                    throw new du0(th3);
                }
                if (th3 instanceof dv0) {
                    throw th3;
                }
                throw new iu0(th3);
            } finally {
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ContinuationImpl continuationImpl) throws Throwable {
        tj1 tj1Var;
        Object objA;
        zj1 zj1Var;
        zj1 zj1Var2;
        b.a1 a1Var;
        if (continuationImpl instanceof tj1) {
            tj1Var = (tj1) continuationImpl;
            int i5 = tj1Var.f9950d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tj1Var.f9950d = i5 - Integer.MIN_VALUE;
            } else {
                tj1Var = new tj1(this, continuationImpl);
            }
        }
        Object objB = tj1Var.f9948b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tj1Var.f9950d;
        if (i11 == 0) {
            ResultKt.b(objB);
            tj1Var.f9947a = this;
            tj1Var.f9950d = 1;
            pn pnVar = (pn) ((x0) this.f12554f.f18817a);
            if (pnVar.o.get() || (objA = pnVar.a((a70) null, tj1Var)) != coroutineSingletons) {
                objA = Unit.f71706a;
            }
            if (objA != coroutineSingletons) {
                objA = Unit.f71706a;
            }
            if (objA != coroutineSingletons) {
                zj1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            zj1Var2 = tj1Var.f9947a;
            ResultKt.b(objB);
            a1Var = (b.a1) objB;
            if (!(a1Var instanceof pu0)) {
                return (pu0) a1Var;
            }
            Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
            return ((pn) ((x0) zj1Var2.f12554f.f18817a)).o.get() ? new xu0(Unit.f71706a) : new tu0("Failed to get the CSRB flags", wd1.f11213a);
        }
        zj1Var = tj1Var.f9947a;
        ResultKt.b(objB);
        if (((pn) ((x0) zj1Var.f12554f.f18817a)).o.get()) {
            return new xu0(Unit.f71706a);
        }
        tj1Var.f9947a = zj1Var;
        tj1Var.f9950d = 2;
        objB = zj1Var.b(tj1Var);
        if (objB != coroutineSingletons) {
            zj1Var2 = zj1Var;
            a1Var = (b.a1) objB;
            if (!(a1Var instanceof pu0)) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(zj1 zj1Var, ContinuationImpl continuationImpl) {
        wj1 wj1Var;
        long j11;
        long jH;
        b.k3 k3Var;
        u uVar = u.a$3;
        if (continuationImpl instanceof wj1) {
            wj1Var = (wj1) continuationImpl;
            int i5 = wj1Var.f11304e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wj1Var.f11304e = i5 - Integer.MIN_VALUE;
            } else {
                wj1Var = new wj1(zj1Var, continuationImpl);
            }
        }
        Object objA = wj1Var.f11302c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wj1Var.f11304e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objA);
            e23 e23Var = zj1Var.f12558j;
            wj1Var.f11300a = zj1Var;
            wj1Var.f11304e = 1;
            e23Var.getClass();
            objA = e23.a(e23Var, wj1Var);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = wj1Var.f11301b;
            zj1Var = wj1Var.f11300a;
            ResultKt.b(objA);
            jH = DurationKt.h(((y13) objA).q(), DurationUnit.f72045d);
            k3Var = zj1Var.f12554f.f5357s;
            k3Var.getClass();
            Duration.Companion companion = Duration.f72038b;
            if (Duration.c(j11, Duration.m(jH, ((Duration) k3Var.a("gads:sdk_core_ttl_seconds", ed.k(30, DurationUnit.f72049h, "gads:sdk_core_ttl_seconds"), uVar)).f72041a)) >= 0) {
                z11 = false;
            }
            return Boolean.valueOf(z11);
        }
        zj1Var = wj1Var.f11300a;
        ResultKt.b(objA);
        String strO = ((y13) objA).o();
        Intrinsics.f(strO, "getCachedSdkCore(...)");
        if (!r70.k.U0(strO)) {
            b.k3 k3Var2 = zj1Var.f12554f.f5357s;
            k3Var2.getClass();
            Duration.Companion companion2 = Duration.f72038b;
            long j12 = ((Duration) k3Var2.a("gads:sdk_core_ttl_seconds", ed.k(30, DurationUnit.f72049h, "gads:sdk_core_ttl_seconds"), uVar)).f72041a;
            companion2.getClass();
            if (Duration.c(j12, 0L) > 0) {
                zj1Var.f12555g.getClass();
                long jH2 = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
                e23 e23Var2 = zj1Var.f12558j;
                wj1Var.f11300a = zj1Var;
                wj1Var.f11301b = jH2;
                wj1Var.f11304e = 2;
                e23Var2.getClass();
                objA = e23.a(e23Var2, wj1Var);
                if (objA != coroutineSingletons) {
                    j11 = jH2;
                    jH = DurationKt.h(((y13) objA).q(), DurationUnit.f72045d);
                    k3Var = zj1Var.f12554f.f5357s;
                    k3Var.getClass();
                    Duration.Companion companion3 = Duration.f72038b;
                    if (Duration.c(j11, Duration.m(jH, ((Duration) k3Var.a("gads:sdk_core_ttl_seconds", ed.k(30, DurationUnit.f72049h, "gads:sdk_core_ttl_seconds"), uVar)).f72041a)) >= 0) {
                    }
                }
                return coroutineSingletons;
            }
        }
        return Boolean.valueOf(z11);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, ContinuationImpl continuationImpl) {
        mj1 mj1Var;
        boolean zEquals;
        String str2;
        zj1 zj1Var;
        Ref.ObjectRef objectRef;
        u uVar = u.a$7;
        if (continuationImpl instanceof mj1) {
            mj1Var = (mj1) continuationImpl;
            int i5 = mj1Var.f7232e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mj1Var.f7232e = i5 - Integer.MIN_VALUE;
            } else {
                mj1Var = new mj1(this, continuationImpl);
            }
        }
        mj1 mj1Var2 = mj1Var;
        Object objC = mj1Var2.f7230c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mj1Var2.f7232e;
        Continuation continuation = null;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = b.u4.l(objC);
            String str3 = rw0.a(this.o.f9331a).f8853b;
            if (str3 != null) {
                String lowerCase = str3.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                zEquals = lowerCase.equals("ru");
            } else {
                zEquals = false;
            }
            jr0 jr0Var = this.f12554f;
            if (zEquals) {
                b.k3 k3Var = jr0Var.f5357s;
                k3Var.getClass();
                str2 = (String) k3Var.a("gads:sdk_core_location:decagon", "https://mediation.goog/mads/static/sdk/native/sdk-core-v40.html", uVar);
            } else {
                b.k3 k3Var2 = jr0Var.f5357s;
                k3Var2.getClass();
                str2 = (String) k3Var2.a("gads:sdk_core_location:decagon", "https://googleads.g.doubleclick.net/mads/static/sdk/native/sdk-core-android.html", uVar);
            }
            Uri.Builder builderBuildUpon = Uri.parse(str2).buildUpon();
            b.k3 k3Var3 = jr0Var.f5357s;
            b.k3 k3Var4 = jr0Var.f5357s;
            k3Var3.getClass();
            Iterator it = ((hn.m) ((com.google.gson.r) k3Var3.a("sdk_core_query_params", new com.google.gson.r(), jn.a$19)).f34795a.entrySet()).iterator();
            while (((hn.l) it).hasNext()) {
                n nVarB = ((hn.l) it).b();
                com.google.gson.p pVar = (com.google.gson.p) nVarB.getValue();
                pVar.getClass();
                if ((pVar instanceof com.google.gson.s) && (((com.google.gson.p) nVarB.getValue()).k().f34796a instanceof String)) {
                    builderBuildUpon.appendQueryParameter((String) nVarB.getKey(), ((com.google.gson.p) nVarB.getValue()).o());
                }
            }
            String string = builderBuildUpon.build().toString();
            Intrinsics.f(string, "toString(...)");
            k3Var4.getClass();
            Boolean bool = Boolean.TRUE;
            jn jnVar = jn.a$10;
            boolean zBooleanValue = ((Boolean) k3Var4.a("gads:cache_sdk_core:enabled", bool, jnVar)).booleanValue();
            k3Var4.getClass();
            boolean zBooleanValue2 = ((Boolean) k3Var4.a("gads:fetch_initial_sdk_core_separately:enabled", Boolean.FALSE, jnVar)).booleanValue();
            try {
                long j11 = k3Var4.j();
                qj1 qj1Var = new qj1(str, zBooleanValue, this, zBooleanValue2, objectRefL, string, null);
                mj1Var2.f7228a = this;
                mj1Var2.f7229b = objectRefL;
                mj1Var2.f7232e = 1;
                objC = p2.c(j11, qj1Var, mj1Var2);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
                zj1Var = this;
                objectRef = objectRefL;
            } catch (lw0 e3) {
                e = e3;
                zj1Var = this;
                objectRef = objectRefL;
                m0.t(zj1Var.f12552d, t70.c2.f88780b, null, new rj1(objectRef, continuation, 1), 2);
                return new yu0("Timed out waiting on /jsLoaded gmsg while loading a JavascriptEngine", e);
            } catch (TimeoutCancellationException e11) {
                e = e11;
                zj1Var = this;
                objectRef = objectRefL;
                m0.t(zj1Var.f12552d, t70.c2.f88780b, null, new rj1(objectRef, continuation, 0), 2);
                return new yu0("Timed out waiting on /jsLoaded gmsg while loading a JavascriptEngine", e);
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = mj1Var2.f7229b;
            zj1Var = mj1Var2.f7228a;
            try {
                ResultKt.b(objC);
            } catch (lw0 e12) {
                e = e12;
                m0.t(zj1Var.f12552d, t70.c2.f88780b, null, new rj1(objectRef, continuation, 1), 2);
                return new yu0("Timed out waiting on /jsLoaded gmsg while loading a JavascriptEngine", e);
            } catch (TimeoutCancellationException e13) {
                e = e13;
                m0.t(zj1Var.f12552d, t70.c2.f88780b, null, new rj1(objectRef, continuation, 0), 2);
                return new yu0("Timed out waiting on /jsLoaded gmsg while loading a JavascriptEngine", e);
            }
        }
        return (b.a1) objC;
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00ac, code lost:
    
        if (ads_mobile_sdk.zq0.a(r2, r14, (com.google.gson.r) r15, r0) != r1) goto L43;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.tk0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(re1 re1Var, Continuation continuation) {
        ij1 ij1Var;
        zj1 zj1Var;
        zq0 zq0Var;
        if (continuation instanceof ij1) {
            ij1Var = (ij1) continuation;
            int i5 = ij1Var.f4787e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ij1Var.f4787e = i5 - Integer.MIN_VALUE;
            } else {
                ij1Var = new ij1(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = ij1Var.f4785c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ij1Var.f4787e;
        Continuation continuation2 = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (re1Var == null) {
                return Unit.f71706a;
            }
            jr0 jr0Var = this.f12554f;
            if ((jr0Var.f5361w || jr0Var.f5362x > 0.0d) && !((pn) ((x0) jr0Var.f18817a)).o.get()) {
                fz fzVar = this.f12562p;
                if (fzVar != null) {
                    s1 s1Var = fzVar.B;
                    ij1Var.f4783a = this;
                    ij1Var.f4784b = re1Var;
                    ij1Var.f4787e = 1;
                    if (s1Var.K(ij1Var) != coroutineSingletons) {
                        zj1Var = this;
                    }
                    return coroutineSingletons;
                }
                Intrinsics.m("consentStringsProvider");
                throw null;
            }
            b00.q qVar = new b00.q(this, re1Var, continuation2, 2);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f12553e;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
            return Unit.f71706a;
        }
        if (i11 == 1) {
            re1Var = ij1Var.f4784b;
            zj1Var = (zj1) ij1Var.f4783a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            re1Var = ij1Var.f4784b;
            zq0Var = (zq0) ij1Var.f4783a;
            ResultKt.b(obj);
            ij1Var.f4783a = null;
            ij1Var.f4784b = null;
            ij1Var.f4787e = 3;
            zq0Var.getClass();
        }
        zq0 zq0Var2 = zj1Var.f12557i;
        fz fzVar2 = zj1Var.f12562p;
        if (fzVar2 != null) {
            ij1Var.f4783a = zq0Var2;
            ij1Var.f4784b = re1Var;
            ij1Var.f4787e = 2;
            Object objD = fz.d(fzVar2, ij1Var);
            if (objD != coroutineSingletons) {
                zq0Var = zq0Var2;
                obj = objD;
                ij1Var.f4783a = null;
                ij1Var.f4784b = null;
                ij1Var.f4787e = 3;
                zq0Var.getClass();
            }
            return coroutineSingletons;
        }
        Intrinsics.m("consentStringsProvider");
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x008d A[Catch: all -> 0x0046, TRY_LEAVE, TryCatch #3 {all -> 0x0046, blocks: (B:20:0x0042, B:31:0x0087, B:33:0x008d), top: B:109:0x0042 }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00a2 A[Catch: all -> 0x00ae, TryCatch #7 {all -> 0x00ae, blocks: (B:38:0x009b, B:40:0x00a2, B:42:0x00a6, B:44:0x00aa, B:47:0x00b0, B:49:0x00b4, B:51:0x00b8, B:53:0x00bc, B:54:0x00bd, B:55:0x00c2, B:56:0x00c3, B:57:0x00ca, B:58:0x00cb, B:59:0x00d2, B:60:0x00d3), top: B:117:0x009b }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00d3 A[Catch: all -> 0x00ae, TRY_LEAVE, TryCatch #7 {all -> 0x00ae, blocks: (B:38:0x009b, B:40:0x00a2, B:42:0x00a6, B:44:0x00aa, B:47:0x00b0, B:49:0x00b4, B:51:0x00b8, B:53:0x00bc, B:54:0x00bd, B:55:0x00c2, B:56:0x00c3, B:57:0x00ca, B:58:0x00cb, B:59:0x00d2, B:60:0x00d3), top: B:117:0x009b }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f4 A[Catch: all -> 0x0033, TRY_LEAVE, TryCatch #0 {all -> 0x0033, blocks: (B:13:0x002e, B:70:0x00ee, B:72:0x00f4), top: B:104:0x002e }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0109 A[Catch: all -> 0x0115, TryCatch #2 {all -> 0x0115, blocks: (B:77:0x0102, B:79:0x0109, B:81:0x010d, B:83:0x0111, B:86:0x0117, B:88:0x011b, B:90:0x011f, B:92:0x0123, B:93:0x0124, B:94:0x0129, B:95:0x012a, B:96:0x0131, B:97:0x0132, B:98:0x0139, B:99:0x013a), top: B:108:0x0102 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x013a A[Catch: all -> 0x0115, TRY_LEAVE, TryCatch #2 {all -> 0x0115, blocks: (B:77:0x0102, B:79:0x0109, B:81:0x010d, B:83:0x0111, B:86:0x0117, B:88:0x011b, B:90:0x011f, B:92:0x0123, B:93:0x0124, B:94:0x0129, B:95:0x012a, B:96:0x0131, B:97:0x0132, B:98:0x0139, B:99:0x013a), top: B:108:0x0102 }] */
    @Override // ads_mobile_sdk.tk0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Continuation continuation) {
        lj1 lj1Var;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        th3 th3Var3;
        TimeoutCancellationException th3;
        th3 th3Var4;
        b.a1 a1Var;
        b.a1 a1Var2;
        if (continuation instanceof lj1) {
            lj1Var = (lj1) continuation;
            int i5 = lj1Var.f6252e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lj1Var.f6252e = i5 - Integer.MIN_VALUE;
            } else {
                lj1Var = new lj1(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = lj1Var.f6250c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = lj1Var.f6252e;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = this.f12560l;
            wv0 wv0Var = wv0.CUI_NAME_SDKINIT_SDKCORE;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    lj1Var.f6248a = em2VarA;
                    lj1Var.f6249b = em2VarA;
                    lj1Var.f6252e = 1;
                    Object objB = b(str, lj1Var);
                    if (objB != obj2) {
                        th3Var3 = em2VarA;
                        obj = objB;
                        th3Var4 = th3Var3;
                        a1Var = (b.a1) obj;
                        if (a1Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var4, null);
                        return a1Var;
                    }
                } catch (Throwable th4) {
                    th3Var3 = em2VarA;
                    th3 = th4;
                    th3Var4 = th3Var3;
                    th3Var3.b(th3);
                    if (th3 instanceof b.a4) {
                    }
                }
            } else {
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    lj1Var.f6248a = th3VarA;
                    lj1Var.f6249b = th3VarA;
                    lj1Var.f6252e = 2;
                    Object objB2 = b(str, lj1Var);
                    if (objB2 != obj2) {
                        th3Var = th3VarA;
                        obj = objB2;
                        th3Var2 = th3Var;
                        a1Var2 = (b.a1) obj;
                        if (a1Var2 instanceof pu0) {
                        }
                        CloseableKt.a(th3Var2, null);
                        return a1Var2;
                    }
                } catch (Throwable th5) {
                    th3Var = th3VarA;
                    th2 = th5;
                    th3Var2 = th3Var;
                    th3Var.b(th2);
                    if (th2 instanceof b.a4) {
                    }
                }
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var2 = lj1Var.f6249b;
            th3Var = lj1Var.f6248a;
            try {
                ResultKt.b(obj);
                a1Var2 = (b.a1) obj;
                if (a1Var2 instanceof pu0) {
                    zi3.a((pu0) a1Var2, false);
                }
                CloseableKt.a(th3Var2, null);
                return a1Var2;
            } catch (Throwable th6) {
                th2 = th6;
                try {
                    th3Var.b(th2);
                    if (th2 instanceof b.a4) {
                        if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                            th3Var.a(th2);
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
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        th3Var4 = lj1Var.f6249b;
        th3Var3 = lj1Var.f6248a;
        try {
            ResultKt.b(obj);
            a1Var = (b.a1) obj;
            if (a1Var instanceof pu0) {
                zi3.a((pu0) a1Var, false);
            }
            CloseableKt.a(th3Var4, null);
            return a1Var;
        } catch (Throwable th7) {
            th3 = th7;
            try {
                th3Var3.b(th3);
                if (th3 instanceof b.a4) {
                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                        th3Var3.a(th3);
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

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(List list, Executor executor, ContinuationImpl continuationImpl) throws Throwable {
        xj1 xj1Var;
        Object objY;
        if (continuationImpl instanceof xj1) {
            xj1Var = (xj1) continuationImpl;
            int i5 = xj1Var.f11744e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xj1Var.f11744e = i5 - Integer.MIN_VALUE;
            } else {
                xj1Var = new xj1(this, continuationImpl);
            }
        }
        Object objB = xj1Var.f11742c;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = xj1Var.f11744e;
        if (i11 == 0) {
            ResultKt.b(objB);
            xj1Var.f11740a = list;
            xj1Var.f11741b = executor;
            xj1Var.f11744e = 1;
            objB = b(xj1Var);
            if (objB != obj) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            return objB;
        }
        executor = xj1Var.f11741b;
        list = xj1Var.f11740a;
        ResultKt.b(objB);
        b.a1 a1Var = (b.a1) objB;
        if (a1Var instanceof pu0) {
            return Boolean.FALSE;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        re1 re1Var = (re1) ((xu0) a1Var).f11834b;
        Continuation continuation = null;
        xj1Var.f11740a = null;
        xj1Var.f11741b = null;
        xj1Var.f11744e = 2;
        tx0 tx0Var = re1Var.f9121a;
        if (tx0Var == null) {
            objY = Boolean.FALSE;
        } else {
            tx0Var.f10144z.offer(list);
            objY = m0.y(re1Var.f9122b.getCoroutineContext(), new d(tx0Var, executor, continuation, 8), xj1Var);
        }
        return objY == obj ? obj : objY;
    }
}
