package ads_mobile_sdk;

import android.content.Context;
import android.net.Uri;
import androidx.webkit.Profile;
import androidx.webkit.WebViewFeature;
import b.c0;
import b.m0;
import b.o1;
import b.o2;
import c3.c1;
import c80.d;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.p2;

/* loaded from: classes2.dex */
public final class bs3 extends b.h1 {

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f1522c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f1523d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.j0 f1524e;

    /* renamed from: f, reason: collision with root package name */
    public final kz2 f1525f;

    /* renamed from: g, reason: collision with root package name */
    public final aw f1526g;

    /* renamed from: h, reason: collision with root package name */
    public final b.m5 f1527h;

    /* renamed from: i, reason: collision with root package name */
    public final m0 f1528i;

    /* renamed from: j, reason: collision with root package name */
    public final o1 f1529j;

    /* renamed from: k, reason: collision with root package name */
    public final o2 f1530k;

    /* renamed from: l, reason: collision with root package name */
    public final rg0 f1531l;

    /* renamed from: m, reason: collision with root package name */
    public Profile f1532m;
    public final d n;
    public final d o;

    /* renamed from: p, reason: collision with root package name */
    public t70.g2 f1533p;

    /* renamed from: q, reason: collision with root package name */
    public long f1534q;

    /* renamed from: r, reason: collision with root package name */
    public t70.g2 f1535r;

    /* renamed from: s, reason: collision with root package name */
    public final a70.d f1536s;

    public bs3(Context context, jr0 flags, CoroutineContext uiContext, t70.j0 backgroundScope, kz2 rootTraceCreator, b.y3 userAgentProvider, aw concurrencyObjects, b.m5 m5Var, m0 webViewFeatureWrapper, o1 webViewProfileStoreWrapper, o2 clock, rg0 rg0Var) {
        Intrinsics.g(context, "context");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(concurrencyObjects, "concurrencyObjects");
        Intrinsics.g(webViewFeatureWrapper, "webViewFeatureWrapper");
        Intrinsics.g(webViewProfileStoreWrapper, "webViewProfileStoreWrapper");
        Intrinsics.g(clock, "clock");
        this.f1522c = flags;
        this.f1523d = uiContext;
        this.f1524e = backgroundScope;
        this.f1525f = rootTraceCreator;
        this.f1526g = concurrencyObjects;
        this.f1527h = m5Var;
        this.f1528i = webViewFeatureWrapper;
        this.f1529j = webViewProfileStoreWrapper;
        this.f1530k = clock;
        this.f1531l = rg0Var;
        this.n = new d();
        this.o = new d();
        this.f1536s = LazyKt.a(new c1(this, 1));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:106:0x019d A[Catch: all -> 0x01a9, TryCatch #6 {all -> 0x01a9, blocks: (B:104:0x0196, B:106:0x019d, B:108:0x01a1, B:110:0x01a5, B:113:0x01ac, B:115:0x01b0, B:117:0x01b4, B:119:0x01b8, B:120:0x01b9, B:121:0x01be, B:122:0x01bf, B:123:0x01c6, B:124:0x01c7, B:125:0x01ce, B:126:0x01cf), top: B:143:0x0196 }] */
    /* JADX WARN: Removed duplicated region for block: B:126:0x01cf A[Catch: all -> 0x01a9, TRY_LEAVE, TryCatch #6 {all -> 0x01a9, blocks: (B:104:0x0196, B:106:0x019d, B:108:0x01a1, B:110:0x01a5, B:113:0x01ac, B:115:0x01b0, B:117:0x01b4, B:119:0x01b8, B:120:0x01b9, B:121:0x01be, B:122:0x01bf, B:123:0x01c6, B:124:0x01c7, B:125:0x01ce, B:126:0x01cf), top: B:143:0x0196 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00e0 A[Catch: all -> 0x0109, TRY_LEAVE, TryCatch #5 {all -> 0x0109, blocks: (B:38:0x00c4, B:45:0x00e0, B:48:0x00e9, B:43:0x00da, B:41:0x00d5), top: B:142:0x00c4, inners: #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00e9 A[Catch: all -> 0x0109, TRY_ENTER, TRY_LEAVE, TryCatch #5 {all -> 0x0109, blocks: (B:38:0x00c4, B:45:0x00e0, B:48:0x00e9, B:43:0x00da, B:41:0x00d5), top: B:142:0x00c4, inners: #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0112 A[Catch: all -> 0x011e, TryCatch #9 {all -> 0x011e, blocks: (B:57:0x010b, B:59:0x0112, B:61:0x0116, B:63:0x011a, B:66:0x0121, B:68:0x0125, B:70:0x0129, B:72:0x012d, B:73:0x012e, B:74:0x0133, B:75:0x0134, B:76:0x013b, B:77:0x013c, B:78:0x0143, B:79:0x0144), top: B:148:0x010b }] */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0144 A[Catch: all -> 0x011e, TRY_LEAVE, TryCatch #9 {all -> 0x011e, blocks: (B:57:0x010b, B:59:0x0112, B:61:0x0116, B:63:0x011a, B:66:0x0121, B:68:0x0125, B:70:0x0129, B:72:0x012d, B:73:0x012e, B:74:0x0133, B:75:0x0134, B:76:0x013b, B:77:0x013c, B:78:0x0143, B:79:0x0144), top: B:148:0x010b }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x016c A[Catch: all -> 0x0194, TRY_LEAVE, TryCatch #2 {all -> 0x0194, blocks: (B:85:0x0150, B:92:0x016c, B:95:0x0175, B:90:0x0166, B:88:0x0161), top: B:137:0x0150, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0175 A[Catch: all -> 0x0194, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x0194, blocks: (B:85:0x0150, B:92:0x016c, B:95:0x0175, B:90:0x0166, B:88:0x0161), top: B:137:0x0150, inners: #3 }] */
    /* JADX WARN: Type inference failed for: r2v10, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(bs3 bs3Var, ContinuationImpl continuationImpl) {
        gr3 gr3Var;
        th3 th3VarA;
        th3 th3Var;
        boolean zA;
        th3 th3Var2;
        em2 em2VarA;
        th3 th3Var3;
        boolean zA2;
        ?? r22;
        bs3 bs3Var2 = bs3Var;
        if (continuationImpl instanceof gr3) {
            gr3Var = (gr3) continuationImpl;
            int i5 = gr3Var.f4043e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gr3Var.f4043e = i5 - Integer.MIN_VALUE;
            } else {
                gr3Var = new gr3(bs3Var2, continuationImpl);
            }
        }
        Object obj = gr3Var.f4041c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gr3Var.f4043e;
        int i12 = 0;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = bs3Var2.f1522c;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:webview_quic_hints_enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                return Unit.f71706a;
            }
            iq3 iq3Var = (iq3) bs3Var2.f1527h.get();
            gr3Var.f4039a = bs3Var2;
            gr3Var.f4043e = 1;
            if (iq3Var.a(gr3Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            bs3Var2 = (bs3) gr3Var.f4039a;
            ResultKt.b(obj);
        } else if (i11 == 2) {
            th3Var3 = gr3Var.f4040b;
            r22 = (th3) gr3Var.f4039a;
            try {
                ResultKt.b(obj);
                r22 = r22;
                Unit unit = Unit.f71706a;
                CloseableKt.a(th3Var3, null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                th = th2;
                em2VarA = r22;
                try {
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
                } finally {
                }
            }
        } else {
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var = gr3Var.f4040b;
            th3Var2 = (th3) gr3Var.f4039a;
            try {
                ResultKt.b(obj);
                Unit unit2 = Unit.f71706a;
                CloseableKt.a(th3Var, null);
                return Unit.f71706a;
            } catch (Throwable th3) {
                th = th3;
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
        Profile profile = bs3Var2.f1532m;
        if (profile != null) {
            kz2 kz2Var = bs3Var2.f1525f;
            wv0 wv0Var = wv0.CUI_NAME_WEBVIEW_PROFILE_QUIC_HINTS;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    AtomicBoolean atomicBoolean = lp3.f6929a;
                    m0 featureWrapper = bs3Var2.f1528i;
                    Intrinsics.g(featureWrapper, "featureWrapper");
                    AtomicBoolean atomicBoolean2 = lp3.f6930b;
                    if (atomicBoolean2.get()) {
                        try {
                            zA2 = WebViewFeature.a(WebViewFeature.ADD_QUIC_HINTS_V1);
                        } catch (Throwable unused) {
                            atomicBoolean2.set(false);
                        }
                        if (zA2) {
                        }
                    } else {
                        zA2 = false;
                        if (zA2) {
                            zi3.a(6, "Quic hints are not supported", null);
                            Unit unit3 = Unit.f71706a;
                            em2VarA.close();
                            return unit3;
                        }
                        CoroutineContext coroutineContext = bs3Var2.f1523d;
                        hr3 hr3Var = new hr3(profile, bs3Var2, continuation, i12);
                        gr3Var.f4039a = em2VarA;
                        gr3Var.f4040b = em2VarA;
                        gr3Var.f4043e = 2;
                        if (t70.m0.y(coroutineContext, hr3Var, gr3Var) != coroutineSingletons) {
                            em2 em2Var = em2VarA;
                            th3Var3 = em2Var;
                            r22 = em2Var;
                            Unit unit4 = Unit.f71706a;
                            CloseableKt.a(th3Var3, null);
                        }
                    }
                } catch (Throwable th4) {
                    th = th4;
                    th3Var3 = em2VarA;
                    em2VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    AtomicBoolean atomicBoolean3 = lp3.f6929a;
                    m0 featureWrapper2 = bs3Var2.f1528i;
                    Intrinsics.g(featureWrapper2, "featureWrapper");
                    AtomicBoolean atomicBoolean4 = lp3.f6930b;
                    if (atomicBoolean4.get()) {
                        try {
                            zA = WebViewFeature.a(WebViewFeature.ADD_QUIC_HINTS_V1);
                        } catch (Throwable unused2) {
                            atomicBoolean4.set(false);
                        }
                        if (zA) {
                        }
                    } else {
                        zA = false;
                        if (zA) {
                            zi3.a(6, "Quic hints are not supported", null);
                            Unit unit5 = Unit.f71706a;
                            th3VarA.close();
                            return unit5;
                        }
                        CoroutineContext coroutineContext2 = bs3Var2.f1523d;
                        hr3 hr3Var2 = new hr3(profile, bs3Var2, continuation, i12);
                        gr3Var.f4039a = th3VarA;
                        gr3Var.f4040b = th3VarA;
                        gr3Var.f4043e = 3;
                        if (t70.m0.y(coroutineContext2, hr3Var2, gr3Var) != coroutineSingletons) {
                            th3Var2 = th3VarA;
                            th3Var = th3Var2;
                            Unit unit22 = Unit.f71706a;
                            CloseableKt.a(th3Var, null);
                        }
                    }
                } catch (Throwable th5) {
                    th = th5;
                    th3Var = th3VarA;
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
            return coroutineSingletons;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00c2 A[Catch: all -> 0x00ce, TryCatch #7 {all -> 0x00ce, blocks: (B:35:0x00bb, B:37:0x00c2, B:39:0x00c6, B:41:0x00ca, B:44:0x00d0, B:46:0x00d4, B:48:0x00d8, B:50:0x00dc, B:51:0x00dd, B:52:0x00e2, B:53:0x00e3, B:54:0x00ea, B:55:0x00eb, B:56:0x00f2, B:57:0x00f3), top: B:113:0x00bb }] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00f3 A[Catch: all -> 0x00ce, TRY_LEAVE, TryCatch #7 {all -> 0x00ce, blocks: (B:35:0x00bb, B:37:0x00c2, B:39:0x00c6, B:41:0x00ca, B:44:0x00d0, B:46:0x00d4, B:48:0x00d8, B:50:0x00dc, B:51:0x00dd, B:52:0x00e2, B:53:0x00e3, B:54:0x00ea, B:55:0x00eb, B:56:0x00f2, B:57:0x00f3), top: B:113:0x00bb }] */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0160 A[Catch: all -> 0x016c, TryCatch #6 {all -> 0x016c, blocks: (B:73:0x0159, B:75:0x0160, B:77:0x0164, B:79:0x0168, B:82:0x016e, B:84:0x0172, B:86:0x0176, B:88:0x017a, B:89:0x017b, B:90:0x0180, B:91:0x0181, B:92:0x0188, B:93:0x0189, B:94:0x0190, B:95:0x0191), top: B:112:0x0159 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0191 A[Catch: all -> 0x016c, TRY_LEAVE, TryCatch #6 {all -> 0x016c, blocks: (B:73:0x0159, B:75:0x0160, B:77:0x0164, B:79:0x0168, B:82:0x016e, B:84:0x0172, B:86:0x0176, B:88:0x017a, B:89:0x017b, B:90:0x0180, B:91:0x0181, B:92:0x0188, B:93:0x0189, B:94:0x0190, B:95:0x0191), top: B:112:0x0159 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(bs3 bs3Var, ContinuationImpl continuationImpl) {
        ir3 ir3Var;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        bs3 bs3Var2;
        th3 th3Var3;
        TimeoutCancellationException th3;
        th3 th3Var4;
        u uVar = u.a$3;
        if (continuationImpl instanceof ir3) {
            ir3Var = (ir3) continuationImpl;
            int i5 = ir3Var.f4918f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ir3Var.f4918f = i5 - Integer.MIN_VALUE;
            } else {
                ir3Var = new ir3(bs3Var, continuationImpl);
            }
        }
        Object obj = ir3Var.f4916d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ir3Var.f4918f;
        int i12 = 0;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = bs3Var.f1525f;
            wv0 wv0Var = wv0.CUI_NAME_WEBVIEW_PROFILE_INIT;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            int i13 = 7;
            if (ji3.b().f4777a == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    jr0 jr0Var = bs3Var.f1522c;
                    jr0Var.getClass();
                    Duration.Companion companion = Duration.f72038b;
                    long j11 = ((Duration) jr0Var.a("gads:webview_profile_timeout", new Duration(DurationKt.g(2, DurationUnit.f72046e)), uVar)).f72041a;
                    ar.a aVar = new ar.a(bs3Var, continuation, i13);
                    ir3Var.f4913a = bs3Var;
                    ir3Var.f4914b = em2VarA;
                    ir3Var.f4915c = em2VarA;
                    ir3Var.f4918f = 1;
                    if (p2.c(j11, aVar, ir3Var) != coroutineSingletons) {
                        bs3Var2 = bs3Var;
                        th3Var4 = em2VarA;
                        th3Var3 = th3Var4;
                        Unit unit = Unit.f71706a;
                        CloseableKt.a(th3Var4, null);
                    }
                } catch (Throwable th4) {
                    th3Var3 = em2VarA;
                    th3 = th4;
                    th3Var4 = th3Var3;
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
                }
            } else {
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    jr0 jr0Var2 = bs3Var.f1522c;
                    jr0Var2.getClass();
                    Duration.Companion companion2 = Duration.f72038b;
                    long j12 = ((Duration) jr0Var2.a("gads:webview_profile_timeout", new Duration(DurationKt.g(2, DurationUnit.f72046e)), uVar)).f72041a;
                    ar.a aVar2 = new ar.a(bs3Var, continuation, i13);
                    ir3Var.f4913a = bs3Var;
                    ir3Var.f4914b = th3VarA;
                    ir3Var.f4915c = th3VarA;
                    ir3Var.f4918f = 2;
                    if (p2.c(j12, aVar2, ir3Var) != coroutineSingletons) {
                        bs3Var2 = bs3Var;
                        th3Var2 = th3VarA;
                        th3Var = th3Var2;
                        Unit unit2 = Unit.f71706a;
                        CloseableKt.a(th3Var2, null);
                    }
                } catch (Throwable th5) {
                    th3Var = th3VarA;
                    th2 = th5;
                    th3Var2 = th3Var;
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
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            th3Var4 = ir3Var.f4915c;
            th3Var3 = ir3Var.f4914b;
            bs3Var2 = ir3Var.f4913a;
            try {
                ResultKt.b(obj);
                Unit unit3 = Unit.f71706a;
                CloseableKt.a(th3Var4, null);
            } catch (Throwable th6) {
                th3 = th6;
                try {
                    th3Var3.b(th3);
                    if (!(th3 instanceof b.a4)) {
                    }
                } finally {
                }
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var2 = ir3Var.f4915c;
            th3Var = ir3Var.f4914b;
            bs3Var2 = ir3Var.f4913a;
            try {
                ResultKt.b(obj);
                Unit unit22 = Unit.f71706a;
                CloseableKt.a(th3Var2, null);
            } catch (Throwable th7) {
                th2 = th7;
                try {
                    th3Var.b(th2);
                    if (!(th2 instanceof b.a4)) {
                    }
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        t70.j0 j0Var = bs3Var2.f1524e;
        lr3 lr3Var = new lr3(bs3Var2, continuation, i12);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        t70.m0.t(j0Var, context, null, new ar.a(lr3Var, null), 2);
        bs3Var2.c();
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:48:0x0118, code lost:
    
        if (r0.a(r1, r4) == r5) goto L131;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01ba, code lost:
    
        if (r0.a(r1, r4) == r5) goto L136;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x01cf A[Catch: all -> 0x01db, TryCatch #4 {all -> 0x01db, blocks: (B:98:0x01c8, B:100:0x01cf, B:102:0x01d3, B:104:0x01d7, B:107:0x01de, B:109:0x01e2, B:111:0x01e6, B:113:0x01ea, B:114:0x01eb, B:115:0x01f0, B:116:0x01f1, B:117:0x01f8, B:118:0x01f9, B:119:0x0200, B:120:0x0201), top: B:135:0x01c8 }] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0201 A[Catch: all -> 0x01db, TRY_LEAVE, TryCatch #4 {all -> 0x01db, blocks: (B:98:0x01c8, B:100:0x01cf, B:102:0x01d3, B:104:0x01d7, B:107:0x01de, B:109:0x01e2, B:111:0x01e6, B:113:0x01ea, B:114:0x01eb, B:115:0x01f0, B:116:0x01f1, B:117:0x01f8, B:118:0x01f9, B:119:0x0200, B:120:0x0201), top: B:135:0x01c8 }] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x012f A[Catch: all -> 0x013b, TryCatch #3 {all -> 0x013b, blocks: (B:55:0x0128, B:57:0x012f, B:59:0x0133, B:61:0x0137, B:64:0x013e, B:66:0x0142, B:68:0x0146, B:70:0x014a, B:71:0x014b, B:72:0x0150, B:73:0x0151, B:74:0x0158, B:75:0x0159, B:76:0x0160, B:77:0x0161), top: B:134:0x0128 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0161 A[Catch: all -> 0x013b, TRY_LEAVE, TryCatch #3 {all -> 0x013b, blocks: (B:55:0x0128, B:57:0x012f, B:59:0x0133, B:61:0x0137, B:64:0x013e, B:66:0x0142, B:68:0x0146, B:70:0x014a, B:71:0x014b, B:72:0x0150, B:73:0x0151, B:74:0x0158, B:75:0x0159, B:76:0x0160, B:77:0x0161), top: B:134:0x0128 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Type inference failed for: r0v27, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r2v20, types: [ads_mobile_sdk.th3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(bs3 bs3Var, ContinuationImpl continuationImpl) {
        qr3 qr3Var;
        th3 th3VarA;
        th3 th3Var;
        th3 th3Var2;
        em2 em2VarA;
        em2 em2Var;
        em2 em2Var2;
        bs3 bs3Var2 = bs3Var;
        u uVar = u.a$3;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof qr3) {
            qr3Var = (qr3) continuationImpl;
            int i5 = qr3Var.f8787e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qr3Var.f8787e = i5 - Integer.MIN_VALUE;
            } else {
                qr3Var = new qr3(bs3Var2, continuationImpl);
            }
        }
        Object obj = qr3Var.f8785c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qr3Var.f8787e;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = bs3Var2.f1522c;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:webview_preconnect_enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                return Unit.f71706a;
            }
            iq3 iq3Var = (iq3) bs3Var2.f1527h.get();
            qr3Var.f8783a = bs3Var2;
            qr3Var.f8787e = 1;
            if (iq3Var.a(qr3Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            bs3Var2 = (bs3) qr3Var.f8783a;
            ResultKt.b(obj);
        } else if (i11 == 2 || i11 == 3) {
            ?? r02 = qr3Var.f8784b;
            em2Var2 = (th3) qr3Var.f8783a;
            em2Var = r02;
            try {
                ResultKt.b(obj);
                Unit unit = Unit.f71706a;
                CloseableKt.a(em2Var, null);
                return Unit.f71706a;
            } catch (Throwable th2) {
                th = th2;
                em2VarA = em2Var2;
                try {
                    em2VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                } finally {
                }
            }
        } else {
            if (i11 != 4 && i11 != 5) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3 th3Var3 = qr3Var.f8784b;
            th3Var2 = (th3) qr3Var.f8783a;
            th3Var = th3Var3;
            try {
                ResultKt.b(obj);
                Unit unit2 = Unit.f71706a;
                CloseableKt.a(th3Var, null);
                return Unit.f71706a;
            } catch (Throwable th3) {
                th = th3;
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
        Profile profile = bs3Var2.f1532m;
        if (profile != null) {
            kz2 kz2Var = bs3Var2.f1525f;
            wv0 wv0Var = wv0.CUI_NAME_WEBVIEW_PROFILE_PRECONNECT;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    jr0 jr0Var2 = bs3Var2.f1522c;
                    jr0Var2.getClass();
                    if (((Boolean) jr0Var2.a("gads:enable_preconnect_timeout", Boolean.FALSE, jnVar)).booleanValue()) {
                        jr0 jr0Var3 = bs3Var2.f1522c;
                        jr0Var3.getClass();
                        Duration.Companion companion = Duration.f72038b;
                        long j11 = ((Duration) jr0Var3.a("gads:webview_profile_preconnect_timeout", new Duration(DurationKt.g(2, DurationUnit.f72046e)), uVar)).f72041a;
                        ar.a aVar = new ar.a(profile, bs3Var2, (Continuation) null);
                        qr3Var.f8783a = em2VarA;
                        qr3Var.f8784b = em2VarA;
                        qr3Var.f8787e = 2;
                        if (p2.c(j11, aVar, qr3Var) == coroutineSingletons) {
                        }
                        em2Var = em2VarA;
                        em2Var2 = em2Var;
                        Unit unit3 = Unit.f71706a;
                        CloseableKt.a(em2Var, null);
                    } else {
                        qr3Var.f8783a = em2VarA;
                        qr3Var.f8784b = em2VarA;
                        qr3Var.f8787e = 3;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    em2Var = em2VarA;
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
                    jr0 jr0Var4 = bs3Var2.f1522c;
                    jr0Var4.getClass();
                    if (((Boolean) jr0Var4.a("gads:enable_preconnect_timeout", Boolean.FALSE, jnVar)).booleanValue()) {
                        jr0 jr0Var5 = bs3Var2.f1522c;
                        jr0Var5.getClass();
                        Duration.Companion companion2 = Duration.f72038b;
                        long j12 = ((Duration) jr0Var5.a("gads:webview_profile_preconnect_timeout", new Duration(DurationKt.g(2, DurationUnit.f72046e)), uVar)).f72041a;
                        ar.a aVar2 = new ar.a(profile, bs3Var2, (Continuation) null);
                        qr3Var.f8783a = th3VarA;
                        qr3Var.f8784b = th3VarA;
                        qr3Var.f8787e = 4;
                        if (p2.c(j12, aVar2, qr3Var) == coroutineSingletons) {
                        }
                        th3Var = th3VarA;
                        th3Var2 = th3Var;
                        Unit unit22 = Unit.f71706a;
                        CloseableKt.a(th3Var, null);
                    } else {
                        qr3Var.f8783a = th3VarA;
                        qr3Var.f8784b = th3VarA;
                        qr3Var.f8787e = 5;
                    }
                } catch (Throwable th5) {
                    th = th5;
                    th3Var = th3VarA;
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
            return coroutineSingletons;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(bs3 bs3Var, ContinuationImpl continuationImpl) {
        mr3 mr3Var;
        d dVar;
        if (continuationImpl instanceof mr3) {
            mr3Var = (mr3) continuationImpl;
            int i5 = mr3Var.f7323e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mr3Var.f7323e = i5 - Integer.MIN_VALUE;
            } else {
                mr3Var = new mr3(bs3Var, continuationImpl);
            }
        }
        Object obj = mr3Var.f7321c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mr3Var.f7323e;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = bs3Var.f1522c;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:webview_profile:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                return Unit.f71706a;
            }
            dVar = bs3Var.n;
            mr3Var.f7319a = bs3Var;
            mr3Var.f7320b = dVar;
            mr3Var.f7323e = 1;
            if (dVar.e(mr3Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = mr3Var.f7320b;
            bs3 bs3Var2 = mr3Var.f7319a;
            ResultKt.b(obj);
            dVar = dVar2;
            bs3Var = bs3Var2;
        }
        Continuation continuation = null;
        try {
            if (bs3Var.f1532m == null && bs3Var.f1533p == null) {
                bs3Var.f1533p = t70.m0.t(bs3Var.f1524e, null, null, new lr3(bs3Var, continuation, 1), 3);
                return Unit.f71706a;
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
    public static Object e(bs3 bs3Var, ContinuationImpl continuationImpl) {
        xr3 xr3Var;
        if (continuationImpl instanceof xr3) {
            xr3Var = (xr3) continuationImpl;
            int i5 = xr3Var.f11809c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xr3Var.f11809c = i5 - Integer.MIN_VALUE;
            } else {
                xr3Var = new xr3(bs3Var, continuationImpl);
            }
        }
        Object obj = xr3Var.f11807a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xr3Var.f11809c;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = bs3Var.f1522c;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("init_profile_in_post_init_task:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                xr3Var.f11809c = 1;
                if (d(bs3Var, xr3Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return new xu0(Unit.f71706a);
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return e(this, (ContinuationImpl) continuation);
    }

    public final boolean b() {
        return ((Boolean) this.f1536s.getValue()).booleanValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:116:0x020d, code lost:
    
        if (r2 == r5) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x014d, code lost:
    
        if (r2 == r5) goto L117;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x01c4 A[Catch: all -> 0x0214, TryCatch #6 {all -> 0x0214, blocks: (B:101:0x01bc, B:103:0x01c4, B:104:0x01cb, B:112:0x01e8, B:115:0x01f1, B:110:0x01e2, B:107:0x01dc), top: B:161:0x01bc, inners: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:104:0x01cb A[Catch: all -> 0x0214, TRY_LEAVE, TryCatch #6 {all -> 0x0214, blocks: (B:101:0x01bc, B:103:0x01c4, B:104:0x01cb, B:112:0x01e8, B:115:0x01f1, B:110:0x01e2, B:107:0x01dc), top: B:161:0x01bc, inners: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0221 A[Catch: all -> 0x022d, TryCatch #4 {all -> 0x022d, blocks: (B:124:0x021a, B:126:0x0221, B:128:0x0225, B:130:0x0229, B:133:0x0230, B:135:0x0234, B:137:0x0238, B:139:0x023c, B:140:0x023d, B:141:0x0242, B:142:0x0243, B:143:0x024a, B:144:0x024b, B:145:0x0252, B:146:0x0253), top: B:159:0x021a }] */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0253 A[Catch: all -> 0x022d, TRY_LEAVE, TryCatch #4 {all -> 0x022d, blocks: (B:124:0x021a, B:126:0x0221, B:128:0x0225, B:130:0x0229, B:133:0x0230, B:135:0x0234, B:137:0x0238, B:139:0x023c, B:140:0x023d, B:141:0x0242, B:142:0x0243, B:143:0x024a, B:144:0x024b, B:145:0x0252, B:146:0x0253), top: B:159:0x021a }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0104 A[Catch: all -> 0x0155, TryCatch #7 {all -> 0x0155, blocks: (B:46:0x00fc, B:48:0x0104, B:49:0x010b, B:57:0x0128, B:60:0x0131, B:55:0x0122, B:52:0x011c), top: B:162:0x00fc, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x010b A[Catch: all -> 0x0155, TRY_LEAVE, TryCatch #7 {all -> 0x0155, blocks: (B:46:0x00fc, B:48:0x0104, B:49:0x010b, B:57:0x0128, B:60:0x0131, B:55:0x0122, B:52:0x011c), top: B:162:0x00fc, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0128 A[Catch: all -> 0x0155, TRY_LEAVE, TryCatch #7 {all -> 0x0155, blocks: (B:46:0x00fc, B:48:0x0104, B:49:0x010b, B:57:0x0128, B:60:0x0131, B:55:0x0122, B:52:0x011c), top: B:162:0x00fc, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0131 A[Catch: all -> 0x0155, TRY_ENTER, TRY_LEAVE, TryCatch #7 {all -> 0x0155, blocks: (B:46:0x00fc, B:48:0x0104, B:49:0x010b, B:57:0x0128, B:60:0x0131, B:55:0x0122, B:52:0x011c), top: B:162:0x00fc, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0162 A[Catch: all -> 0x016e, TryCatch #5 {all -> 0x016e, blocks: (B:69:0x015b, B:71:0x0162, B:73:0x0166, B:75:0x016a, B:78:0x0171, B:80:0x0175, B:82:0x0179, B:84:0x017d, B:85:0x017e, B:86:0x0183, B:87:0x0184, B:88:0x018b, B:89:0x018c, B:90:0x0193, B:91:0x0194), top: B:160:0x015b }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0194 A[Catch: all -> 0x016e, TRY_LEAVE, TryCatch #5 {all -> 0x016e, blocks: (B:69:0x015b, B:71:0x0162, B:73:0x0166, B:75:0x016a, B:78:0x0171, B:80:0x0175, B:82:0x0179, B:84:0x017d, B:85:0x017e, B:86:0x0183, B:87:0x0184, B:88:0x018b, B:89:0x018c, B:90:0x0193, B:91:0x0194), top: B:160:0x015b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(List list, ContinuationImpl continuationImpl) {
        wr3 wr3Var;
        Boolean bool;
        th3 th3VarA;
        Closeable closeable;
        th3 th3Var;
        bs3 bs3Var;
        th3 th3VarA2;
        Closeable closeable2;
        th3 th3Var2;
        bs3 bs3Var2;
        boolean zA;
        Throwable th2;
        Throwable th3;
        boolean zA2;
        Throwable th4;
        Throwable th5;
        Closeable closeable3;
        List list2 = list;
        Boolean bool2 = Boolean.FALSE;
        if (continuationImpl instanceof wr3) {
            wr3Var = (wr3) continuationImpl;
            int i5 = wr3Var.f11377g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wr3Var.f11377g = i5 - Integer.MIN_VALUE;
            } else {
                wr3Var = new wr3(this, continuationImpl);
            }
        }
        Object objC = wr3Var.f11375e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wr3Var.f11377g;
        if (i11 == 0) {
            ResultKt.b(objC);
            jr0 jr0Var = this.f1522c;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:webview_prerender_resources_enabled", bool2, jn.a$10)).booleanValue()) {
                return bool2;
            }
            kz2 kz2Var = this.f1525f;
            wv0 wv0Var = wv0.CUI_NAME_WEBVIEW_PRERENDER_RESOURCES;
            EmptyList emptyList = EmptyList.f71733a;
            bool = bool2;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    zj1 zj1Var = (zj1) this.f1531l.get();
                    wr3Var.f11371a = this;
                    wr3Var.f11372b = list2;
                    wr3Var.f11373c = th3VarA2;
                    wr3Var.f11374d = th3VarA2;
                    wr3Var.f11377g = 1;
                    objC = zj1Var.c(wr3Var);
                    if (objC != coroutineSingletons) {
                        bs3Var2 = this;
                        closeable2 = th3VarA2;
                        if (((Boolean) objC).booleanValue()) {
                        }
                        CloseableKt.a(closeable2, th3);
                        return bool;
                    }
                } catch (Throwable th6) {
                    th = th6;
                    closeable2 = th3VarA2;
                    th3Var2 = closeable2;
                    th3Var2.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    zj1 zj1Var2 = (zj1) this.f1531l.get();
                    wr3Var.f11371a = this;
                    wr3Var.f11372b = list2;
                    wr3Var.f11373c = th3VarA;
                    wr3Var.f11374d = th3VarA;
                    wr3Var.f11377g = 3;
                    objC = zj1Var2.c(wr3Var);
                    if (objC != coroutineSingletons) {
                        bs3Var = this;
                        closeable = th3VarA;
                        if (((Boolean) objC).booleanValue()) {
                        }
                        CloseableKt.a(closeable, th5);
                        return bool;
                    }
                } catch (Throwable th7) {
                    th = th7;
                    closeable = th3VarA;
                    th3Var = closeable;
                    th3Var.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            th3 th3Var3 = wr3Var.f11374d;
            th3VarA2 = wr3Var.f11373c;
            list2 = (List) wr3Var.f11372b;
            bs3Var2 = (bs3) wr3Var.f11371a;
            try {
                ResultKt.b(objC);
                bool = bool2;
                closeable2 = th3Var3;
                try {
                    if (((Boolean) objC).booleanValue()) {
                        zi3.a(6, "SDK Core is not loaded", null);
                        th3 = null;
                    } else {
                        AtomicBoolean atomicBoolean = lp3.f6929a;
                        m0 featureWrapper = bs3Var2.f1528i;
                        Intrinsics.g(featureWrapper, "featureWrapper");
                        AtomicBoolean atomicBoolean2 = lp3.f6933e;
                        if (atomicBoolean2.get()) {
                            try {
                                zA = WebViewFeature.a(WebViewFeature.PRERENDER_WITH_URL);
                            } catch (Throwable unused) {
                                atomicBoolean2.set(false);
                            }
                            if (zA) {
                                th3 = null;
                                zi3.a(6, "Prerender is not supported", null);
                            } else {
                                zj1 zj1Var3 = (zj1) bs3Var2.f1531l.get();
                                zv zvVar = bs3Var2.f1526g.f1155d;
                                wr3Var.f11371a = th3VarA2;
                                wr3Var.f11372b = closeable2;
                                th2 = null;
                                wr3Var.f11373c = null;
                                wr3Var.f11374d = null;
                                wr3Var.f11377g = 2;
                                objC = zj1Var3.a(list2, zvVar, wr3Var);
                            }
                        }
                        zA = false;
                        if (zA) {
                        }
                    }
                    CloseableKt.a(closeable2, th3);
                    return bool;
                } catch (Throwable th8) {
                    th = th8;
                    th3Var2 = th3VarA2;
                    th3Var2.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var2.a(th);
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
            } catch (Throwable th9) {
                th = th9;
                closeable2 = th3Var3;
                th3Var2 = th3VarA2;
                th3Var2.b(th);
                if (th instanceof b.a4) {
                }
            }
        } else if (i11 == 2) {
            closeable2 = (Closeable) wr3Var.f11372b;
            th3Var2 = (th3) wr3Var.f11371a;
            try {
                ResultKt.b(objC);
                th2 = null;
                CloseableKt.a(closeable2, th2);
                return objC;
            } catch (Throwable th10) {
                th = th10;
                try {
                    th3Var2.b(th);
                    if (th instanceof b.a4) {
                    }
                } finally {
                }
            }
        } else if (i11 == 3) {
            th3 th3Var4 = wr3Var.f11374d;
            th3VarA = wr3Var.f11373c;
            list2 = (List) wr3Var.f11372b;
            bs3Var = (bs3) wr3Var.f11371a;
            try {
                ResultKt.b(objC);
                bool = bool2;
                closeable = th3Var4;
            } catch (Throwable th11) {
                th = th11;
                closeable = th3Var4;
                th3Var = th3VarA;
                th3Var.b(th);
                if (th instanceof b.a4) {
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var.a(th);
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
            try {
                if (((Boolean) objC).booleanValue()) {
                    zi3.a(6, "SDK Core is not loaded", null);
                    th5 = null;
                } else {
                    AtomicBoolean atomicBoolean3 = lp3.f6929a;
                    m0 featureWrapper2 = bs3Var.f1528i;
                    Intrinsics.g(featureWrapper2, "featureWrapper");
                    AtomicBoolean atomicBoolean4 = lp3.f6933e;
                    if (atomicBoolean4.get()) {
                        try {
                            zA2 = WebViewFeature.a(WebViewFeature.PRERENDER_WITH_URL);
                        } catch (Throwable unused2) {
                            atomicBoolean4.set(false);
                            zA2 = false;
                        }
                    } else {
                        zA2 = false;
                    }
                    if (!zA2) {
                        th5 = null;
                        zi3.a(6, "Prerender is not supported", null);
                    } else {
                        zj1 zj1Var4 = (zj1) bs3Var.f1531l.get();
                        zv zvVar2 = bs3Var.f1526g.f1155d;
                        wr3Var.f11371a = th3VarA;
                        wr3Var.f11372b = closeable;
                        th4 = null;
                        wr3Var.f11373c = null;
                        wr3Var.f11374d = null;
                        wr3Var.f11377g = 4;
                        objC = zj1Var4.a(list2, zvVar2, wr3Var);
                        closeable3 = closeable;
                    }
                }
                CloseableKt.a(closeable, th5);
                return bool;
            } catch (Throwable th12) {
                th = th12;
                th3Var = th3VarA;
                th3Var.b(th);
                if (th instanceof b.a4) {
                }
            }
        } else {
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            closeable = (Closeable) wr3Var.f11372b;
            th3Var = (th3) wr3Var.f11371a;
            try {
                ResultKt.b(objC);
                th4 = null;
                closeable3 = closeable;
                CloseableKt.a(closeable3, th4);
                return objC;
            } catch (Throwable th13) {
                th = th13;
                try {
                    th3Var.b(th);
                    if (th instanceof b.a4) {
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

    public final Object a(Profile profile, ContinuationImpl continuationImpl) throws Throwable {
        AtomicBoolean atomicBoolean = lp3.f6929a;
        m0 featureWrapper = this.f1528i;
        Intrinsics.g(featureWrapper, "featureWrapper");
        Continuation continuation = null;
        if (lp3.f6931c.get()) {
            try {
                if (WebViewFeature.a(WebViewFeature.PRECONNECT)) {
                    Object objY = t70.m0.y(this.f1523d, new hr3(profile, this, continuation, 1), continuationImpl);
                    return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
                }
            } catch (Throwable unused) {
                lp3.f6931c.set(false);
            }
        }
        zi3.a(6, "Preconnect is not supported", null);
        return Unit.f71706a;
    }

    public final void c() {
        androidx.room.q qVar = new androidx.room.q(this, (Continuation) null, 13);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f1524e;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        t70.m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x00b6, code lost:
    
        if (r11.a(r12, r0) == r1) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00ce, code lost:
    
        if (r11.a(r2, r0) == r1) goto L50;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v10, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(bs3 bs3Var, List list, ContinuationImpl continuationImpl) {
        tr3 tr3Var;
        ArrayList arrayList;
        boolean zBooleanValue;
        bs3 bs3Var2;
        ArrayList arrayList2;
        if (continuationImpl instanceof tr3) {
            tr3Var = (tr3) continuationImpl;
            int i5 = tr3Var.f10043f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tr3Var.f10043f = i5 - Integer.MIN_VALUE;
            } else {
                tr3Var = new tr3(bs3Var, continuationImpl);
            }
        }
        Object objB = tr3Var.f10041d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tr3Var.f10043f;
        if (i11 == 0) {
            ArrayList arrayListX = c0.x(objB);
            arrayList = new ArrayList();
            for (Object obj : list) {
                String path = Uri.parse((String) obj).getPath();
                if (path == null) {
                    path = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                if (!r70.j.A0(path, ".js", true) && !r70.j.A0(path, ".css", true)) {
                    arrayList.add(obj);
                } else {
                    arrayListX.add(obj);
                }
            }
            if (!arrayListX.isEmpty()) {
                tr3Var.f10038a = bs3Var;
                tr3Var.f10039b = list;
                tr3Var.f10040c = arrayList;
                tr3Var.f10043f = 1;
                objB = bs3Var.b(arrayListX, tr3Var);
                if (objB != coroutineSingletons) {
                    bs3Var2 = bs3Var;
                    arrayList2 = arrayList;
                }
                return coroutineSingletons;
            }
            zBooleanValue = false;
            if (zBooleanValue) {
                tr3Var.f10038a = null;
                tr3Var.f10039b = null;
                tr3Var.f10040c = null;
                tr3Var.f10043f = 2;
            } else {
                if (arrayList.isEmpty()) {
                    return Unit.f71706a;
                }
                tr3Var.f10038a = null;
                tr3Var.f10039b = null;
                tr3Var.f10040c = null;
                tr3Var.f10043f = 3;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(objB);
                return Unit.f71706a;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            return Unit.f71706a;
        }
        ?? r11 = tr3Var.f10040c;
        list = tr3Var.f10039b;
        bs3Var2 = tr3Var.f10038a;
        ResultKt.b(objB);
        arrayList2 = r11;
        zBooleanValue = ((Boolean) objB).booleanValue();
        bs3 bs3Var3 = bs3Var2;
        arrayList = arrayList2;
        bs3Var = bs3Var3;
        if (zBooleanValue) {
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00d6 A[Catch: all -> 0x00b4, TRY_LEAVE, TryCatch #2 {all -> 0x00b4, blocks: (B:25:0x00a7, B:27:0x00ab, B:32:0x00b6, B:40:0x00d6, B:43:0x00df, B:44:0x00e3, B:46:0x00e9, B:47:0x010c, B:38:0x00d0, B:35:0x00c8), top: B:134:0x00a7, inners: #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00df A[Catch: all -> 0x00b4, TRY_ENTER, TryCatch #2 {all -> 0x00b4, blocks: (B:25:0x00a7, B:27:0x00ab, B:32:0x00b6, B:40:0x00d6, B:43:0x00df, B:44:0x00e3, B:46:0x00e9, B:47:0x010c, B:38:0x00d0, B:35:0x00c8), top: B:134:0x00a7, inners: #7 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r10v2, types: [kotlin.coroutines.Continuation, t70.l0] */
    /* JADX WARN: Type inference failed for: r11v7, types: [kotlin.coroutines.Continuation, t70.l0] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(List list, ContinuationImpl continuationImpl) {
        ur3 ur3Var;
        bs3 bs3Var;
        List<String> list2;
        boolean zA;
        boolean zA2;
        if (continuationImpl instanceof ur3) {
            ur3Var = (ur3) continuationImpl;
            int i5 = ur3Var.f10472e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ur3Var.f10472e = i5 - Integer.MIN_VALUE;
            } else {
                ur3Var = new ur3(this, continuationImpl);
            }
        }
        Object obj = ur3Var.f10470c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ur3Var.f10472e;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = this.f1522c;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:webview_prefetch_resources_enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
                return Unit.f71706a;
            }
            iq3 iq3Var = (iq3) this.f1527h.get();
            ur3Var.f10468a = this;
            ur3Var.f10469b = list;
            ur3Var.f10472e = 1;
            if (iq3Var.a(ur3Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            bs3Var = this;
            list2 = list;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list2 = ur3Var.f10469b;
            bs3 bs3Var2 = ur3Var.f10468a;
            ResultKt.b(obj);
            bs3Var = bs3Var2;
        }
        kz2 kz2Var = bs3Var.f1525f;
        wv0 wv0Var = wv0.CUI_NAME_WEBVIEW_PROFILE_PREFETCH_RESOURCES;
        EmptyList emptyList = EmptyList.f71733a;
        mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
        Object obj2 = null;
        Continuation continuation = null;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                Profile profile = bs3Var.f1532m;
                if (profile == null) {
                    zi3.a(6, "Profile has not been initialized yet", null);
                    Unit unit = Unit.f71706a;
                    em2VarA.close();
                    return unit;
                }
                AtomicBoolean atomicBoolean = lp3.f6929a;
                m0 featureWrapper = bs3Var.f1528i;
                Intrinsics.g(featureWrapper, "featureWrapper");
                AtomicBoolean atomicBoolean2 = lp3.f6932d;
                if (atomicBoolean2.get()) {
                    try {
                        zA2 = WebViewFeature.a(WebViewFeature.PROFILE_URL_PREFETCH);
                    } catch (Throwable unused) {
                        atomicBoolean2.set(false);
                    }
                    if (zA2) {
                    }
                } else {
                    zA2 = false;
                    if (zA2) {
                        zi3.a(6, "Profile prefetch is not supported", null);
                        Unit unit2 = Unit.f71706a;
                        em2VarA.close();
                        return unit2;
                    }
                    for (String str : list2) {
                        t70.j0 j0Var = bs3Var.f1524e;
                        Continuation continuation2 = continuation;
                        b10.k kVar = new b10.k(profile, str, bs3Var, continuation2, 6);
                        ?? r11 = continuation2;
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var, "<this>");
                        Intrinsics.g(context, "context");
                        t70.m0.t(j0Var, context, r11, new ar.a(kVar, r11), 2);
                        continuation = r11;
                    }
                    Unit unit3 = Unit.f71706a;
                    em2VarA.close();
                }
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
            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
            try {
                Profile profile2 = bs3Var.f1532m;
                if (profile2 == null) {
                    zi3.a(6, "Profile has not been initialized yet", null);
                    Unit unit4 = Unit.f71706a;
                    th3VarA.close();
                    return unit4;
                }
                AtomicBoolean atomicBoolean3 = lp3.f6929a;
                m0 featureWrapper2 = bs3Var.f1528i;
                Intrinsics.g(featureWrapper2, "featureWrapper");
                AtomicBoolean atomicBoolean4 = lp3.f6932d;
                if (atomicBoolean4.get()) {
                    try {
                        zA = WebViewFeature.a(WebViewFeature.PROFILE_URL_PREFETCH);
                    } catch (Throwable unused2) {
                        atomicBoolean4.set(false);
                        zA = false;
                    }
                } else {
                    zA = false;
                }
                if (!zA) {
                    zi3.a(6, "Profile prefetch is not supported", null);
                    Unit unit5 = Unit.f71706a;
                    th3VarA.close();
                    return unit5;
                }
                for (String str2 : list2) {
                    t70.j0 j0Var2 = bs3Var.f1524e;
                    ?? r102 = obj2;
                    b10.k kVar2 = new b10.k(profile2, str2, bs3Var, (Continuation) r102, 6);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    t70.m0.t(j0Var2, context2, r102, new ar.a(kVar2, r102), 2);
                    obj2 = r102;
                }
                Unit unit6 = Unit.f71706a;
                th3VarA.close();
            } catch (Throwable th3) {
                try {
                    th3VarA.b(th3);
                    if (!(th3 instanceof b.a4)) {
                        if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                            th3VarA.a(th3);
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
                } catch (Throwable th4) {
                    try {
                        throw th4;
                    } catch (Throwable th5) {
                        CloseableKt.a(th3VarA, th4);
                        throw th5;
                    }
                }
            }
        }
        return Unit.f71706a;
    }
}
