package ads_mobile_sdk;

import b.q2;
import java.io.Closeable;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class b02 {

    /* renamed from: a, reason: collision with root package name */
    public final kz2 f1211a;

    /* renamed from: b, reason: collision with root package name */
    public final sp3 f1212b;

    /* renamed from: c, reason: collision with root package name */
    public final q2 f1213c;

    /* renamed from: d, reason: collision with root package name */
    public tx0 f1214d;

    public b02(kz2 rootTraceCreator, sp3 webViewFactory, q2 nativeOnePointFiveClickOverlayConfigurator) {
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(webViewFactory, "webViewFactory");
        Intrinsics.g(nativeOnePointFiveClickOverlayConfigurator, "nativeOnePointFiveClickOverlayConfigurator");
        this.f1211a = rootTraceCreator;
        this.f1212b = webViewFactory;
        this.f1213c = nativeOnePointFiveClickOverlayConfigurator;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0184 A[Catch: all -> 0x0059, TryCatch #8 {all -> 0x0059, blocks: (B:119:0x01ba, B:121:0x01be, B:22:0x0054, B:104:0x017e, B:106:0x0184, B:107:0x0187, B:109:0x018e, B:112:0x019f), top: B:175:0x0054 }] */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0187 A[Catch: all -> 0x0059, TRY_LEAVE, TryCatch #8 {all -> 0x0059, blocks: (B:119:0x01ba, B:121:0x01be, B:22:0x0054, B:104:0x017e, B:106:0x0184, B:107:0x0187, B:109:0x018e, B:112:0x019f), top: B:175:0x0054 }] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x01be A[Catch: all -> 0x0059, TRY_LEAVE, TryCatch #8 {all -> 0x0059, blocks: (B:119:0x01ba, B:121:0x01be, B:22:0x0054, B:104:0x017e, B:106:0x0184, B:107:0x0187, B:109:0x018e, B:112:0x019f), top: B:175:0x0054 }] */
    /* JADX WARN: Removed duplicated region for block: B:136:0x01dc A[Catch: all -> 0x01e8, TryCatch #6 {all -> 0x01e8, blocks: (B:134:0x01d5, B:136:0x01dc, B:138:0x01e0, B:140:0x01e4, B:143:0x01eb, B:145:0x01ef, B:147:0x01f3, B:149:0x01f7, B:150:0x01f8, B:151:0x01fd, B:152:0x01fe, B:153:0x0205, B:154:0x0206, B:155:0x020d, B:156:0x020e), top: B:172:0x01d5 }] */
    /* JADX WARN: Removed duplicated region for block: B:156:0x020e A[Catch: all -> 0x01e8, TRY_LEAVE, TryCatch #6 {all -> 0x01e8, blocks: (B:134:0x01d5, B:136:0x01dc, B:138:0x01e0, B:140:0x01e4, B:143:0x01eb, B:145:0x01ef, B:147:0x01f3, B:149:0x01f7, B:150:0x01f8, B:151:0x01fd, B:152:0x01fe, B:153:0x0205, B:154:0x0206, B:155:0x020d, B:156:0x020e), top: B:172:0x01d5 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00cd A[Catch: all -> 0x0078, TryCatch #5 {all -> 0x0078, blocks: (B:57:0x0103, B:59:0x0107, B:32:0x0074, B:43:0x00c7, B:45:0x00cd, B:46:0x00d0, B:48:0x00d7, B:50:0x00e7), top: B:170:0x0074 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d0 A[Catch: all -> 0x0078, TRY_LEAVE, TryCatch #5 {all -> 0x0078, blocks: (B:57:0x0103, B:59:0x0107, B:32:0x0074, B:43:0x00c7, B:45:0x00cd, B:46:0x00d0, B:48:0x00d7, B:50:0x00e7), top: B:170:0x0074 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0107 A[Catch: all -> 0x0078, TRY_LEAVE, TryCatch #5 {all -> 0x0078, blocks: (B:57:0x0103, B:59:0x0107, B:32:0x0074, B:43:0x00c7, B:45:0x00cd, B:46:0x00d0, B:48:0x00d7, B:50:0x00e7), top: B:170:0x0074 }] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0125 A[Catch: all -> 0x0131, TryCatch #1 {all -> 0x0131, blocks: (B:72:0x011e, B:74:0x0125, B:76:0x0129, B:78:0x012d, B:81:0x0134, B:83:0x0138, B:85:0x013c, B:87:0x0140, B:88:0x0141, B:89:0x0146, B:90:0x0147, B:91:0x014e, B:92:0x014f, B:93:0x0156, B:94:0x0157), top: B:163:0x011e }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0157 A[Catch: all -> 0x0131, TRY_LEAVE, TryCatch #1 {all -> 0x0131, blocks: (B:72:0x011e, B:74:0x0125, B:76:0x0129, B:78:0x012d, B:81:0x0134, B:83:0x0138, B:85:0x013c, B:87:0x0140, B:88:0x0141, B:89:0x0146, B:90:0x0147, B:91:0x014e, B:92:0x014f, B:93:0x0156, B:94:0x0157), top: B:163:0x011e }] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v25, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v28 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v12, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v16 */
    /* JADX WARN: Type inference failed for: r7v17 */
    /* JADX WARN: Type inference failed for: r7v5, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(b02 b02Var, ContinuationImpl continuationImpl) {
        zz1 zz1Var;
        th3 th3VarA;
        Closeable closeable;
        th3 th3Var;
        Closeable closeable2;
        em2 em2VarA;
        Closeable closeable3;
        Closeable closeable4;
        ?? r72;
        b.a1 a1Var;
        b02 b02Var2;
        tx0 tx0Var;
        ?? r42;
        Object xu0Var;
        em2 em2Var;
        b.a1 a1Var2;
        b02 b02Var3;
        tx0 tx0Var2;
        th3 th3Var2;
        Object xu0Var2;
        b02 b02Var4 = b02Var;
        if (continuationImpl instanceof zz1) {
            zz1Var = (zz1) continuationImpl;
            int i5 = zz1Var.f12734g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zz1Var.f12734g = i5 - Integer.MIN_VALUE;
            } else {
                zz1Var = new zz1(b02Var4, continuationImpl);
            }
        }
        Object obj = zz1Var.f12732e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zz1Var.f12734g;
        int i12 = 0;
        if (i11 == 0) {
            ResultKt.b(obj);
            kz2 kz2Var = b02Var4.f1211a;
            wv0 wv0Var = wv0.CUI_NAME_NATIVE_1_5_CLICK_WEBVIEW_CREATE;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            int i13 = 14;
            if (ji3.b().f4777a == null) {
                em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    sp3 sp3Var = b02Var4.f1212b;
                    fs3 fs3Var = new fs3(es3.f2964a, i12, i12, i13);
                    zz1Var.f12728a = b02Var4;
                    zz1Var.f12729b = em2VarA;
                    zz1Var.f12730c = em2VarA;
                    zz1Var.f12734g = 1;
                    Object objA = sp3Var.a(fs3Var, null, true, zz1Var);
                    if (objA != coroutineSingletons) {
                        em2 em2Var2 = em2VarA;
                        obj = objA;
                        closeable4 = em2Var2;
                        r72 = em2Var2;
                        a1Var = (b.a1) obj;
                        if (!(a1Var instanceof pu0)) {
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    closeable3 = em2VarA;
                    em2VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    sp3 sp3Var2 = b02Var4.f1212b;
                    fs3 fs3Var2 = new fs3(es3.f2964a, i12, i12, i13);
                    zz1Var.f12728a = b02Var4;
                    zz1Var.f12729b = th3VarA;
                    zz1Var.f12730c = th3VarA;
                    zz1Var.f12734g = 3;
                    Object objA2 = sp3Var2.a(fs3Var2, null, true, zz1Var);
                    if (objA2 != coroutineSingletons) {
                        th3Var = th3VarA;
                        obj = objA2;
                        closeable2 = th3Var;
                        a1Var2 = (b.a1) obj;
                        if (!(a1Var2 instanceof pu0)) {
                        }
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
            return coroutineSingletons;
        }
        if (i11 == 1) {
            closeable4 = zz1Var.f12730c;
            r72 = zz1Var.f12729b;
            b02Var4 = zz1Var.f12728a;
            try {
                ResultKt.b(obj);
                r72 = r72;
                a1Var = (b.a1) obj;
                if (!(a1Var instanceof pu0)) {
                    xu0Var = (pu0) a1Var;
                    r72 = r72;
                    if (xu0Var instanceof pu0) {
                    }
                    CloseableKt.a(closeable4, null);
                    return xu0Var;
                }
                Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                try {
                    tx0 tx0Var3 = (tx0) ((xu0) a1Var).f11834b;
                    q2 q2Var = b02Var4.f1213c;
                    b.u7 u7VarC = tx0Var3.c();
                    zz1Var.f12728a = b02Var4;
                    zz1Var.f12729b = r72;
                    zz1Var.f12730c = closeable4;
                    zz1Var.f12731d = tx0Var3;
                    zz1Var.f12734g = 2;
                    if (q2Var.a(u7VarC, zz1Var) != coroutineSingletons) {
                        b02Var2 = b02Var4;
                        tx0Var = tx0Var3;
                        closeable3 = closeable4;
                        r42 = r72;
                        tx0Var.setVisibility(8);
                        b02Var2.f1214d = tx0Var;
                        xu0Var = new xu0(tx0Var);
                        r72 = r42;
                        closeable4 = closeable3;
                        if (xu0Var instanceof pu0) {
                        }
                        CloseableKt.a(closeable4, null);
                        return xu0Var;
                    }
                    return coroutineSingletons;
                } catch (Throwable th4) {
                    th = th4;
                    closeable3 = closeable4;
                    em2Var = r72;
                    em2VarA = em2Var;
                    em2VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } catch (Throwable th5) {
                th = th5;
                closeable3 = closeable4;
                em2Var = r72;
                em2VarA = em2Var;
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
        } else if (i11 == 2) {
            tx0Var = zz1Var.f12731d;
            closeable3 = zz1Var.f12730c;
            r42 = zz1Var.f12729b;
            b02Var2 = zz1Var.f12728a;
            try {
                ResultKt.b(obj);
                r42 = r42;
                tx0Var.setVisibility(8);
                b02Var2.f1214d = tx0Var;
                xu0Var = new xu0(tx0Var);
                r72 = r42;
                closeable4 = closeable3;
                if (xu0Var instanceof pu0) {
                    zi3.a((pu0) xu0Var, false);
                }
                CloseableKt.a(closeable4, null);
                return xu0Var;
            } catch (Throwable th6) {
                th = th6;
                em2VarA = r42;
                try {
                    em2VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                } finally {
                }
            }
        } else if (i11 == 3) {
            closeable2 = zz1Var.f12730c;
            th3Var = zz1Var.f12729b;
            b02Var4 = zz1Var.f12728a;
            try {
                ResultKt.b(obj);
                a1Var2 = (b.a1) obj;
                if (!(a1Var2 instanceof pu0)) {
                    xu0Var2 = (pu0) a1Var2;
                    if (xu0Var2 instanceof pu0) {
                    }
                    CloseableKt.a(closeable2, null);
                    return xu0Var2;
                }
                Intrinsics.e(a1Var2, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                try {
                    tx0 tx0Var4 = (tx0) ((xu0) a1Var2).f11834b;
                    q2 q2Var2 = b02Var4.f1213c;
                    b.u7 u7VarC2 = tx0Var4.c();
                    zz1Var.f12728a = b02Var4;
                    zz1Var.f12729b = th3Var;
                    zz1Var.f12730c = closeable2;
                    zz1Var.f12731d = tx0Var4;
                    zz1Var.f12734g = 4;
                    if (q2Var2.a(u7VarC2, zz1Var) != coroutineSingletons) {
                        b02Var3 = b02Var4;
                        tx0Var2 = tx0Var4;
                        closeable = closeable2;
                        th3Var2 = th3Var;
                        tx0Var2.setVisibility(8);
                        b02Var3.f1214d = tx0Var2;
                        xu0Var2 = new xu0(tx0Var2);
                        th3Var = th3Var2;
                        closeable2 = closeable;
                        if (xu0Var2 instanceof pu0) {
                        }
                        CloseableKt.a(closeable2, null);
                        return xu0Var2;
                    }
                    return coroutineSingletons;
                } catch (Throwable th7) {
                    th = th7;
                    closeable = closeable2;
                    th3VarA = th3Var;
                    th3VarA.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                }
            } catch (Throwable th8) {
                th = th8;
                closeable = closeable2;
                th3VarA = th3Var;
                th3VarA.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        } else {
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tx0Var2 = zz1Var.f12731d;
            closeable = zz1Var.f12730c;
            th3Var2 = zz1Var.f12729b;
            b02Var3 = zz1Var.f12728a;
            try {
                ResultKt.b(obj);
                tx0Var2.setVisibility(8);
                b02Var3.f1214d = tx0Var2;
                xu0Var2 = new xu0(tx0Var2);
                th3Var = th3Var2;
                closeable2 = closeable;
                if (xu0Var2 instanceof pu0) {
                    zi3.a((pu0) xu0Var2, false);
                }
                CloseableKt.a(closeable2, null);
                return xu0Var2;
            } catch (Throwable th9) {
                th = th9;
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
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(b02 b02Var, ContinuationImpl continuationImpl) {
        a02 a02Var;
        if (continuationImpl instanceof a02) {
            a02Var = (a02) continuationImpl;
            int i5 = a02Var.f792d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a02Var.f792d = i5 - Integer.MIN_VALUE;
            } else {
                a02Var = new a02(b02Var, continuationImpl);
            }
        }
        Object obj = a02Var.f790b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a02Var.f792d;
        if (i11 == 0) {
            ResultKt.b(obj);
            tx0 tx0Var = b02Var.f1214d;
            if (tx0Var != null) {
                a02Var.f789a = b02Var;
                a02Var.f792d = 1;
                if (tx0Var.a(a02Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            b02Var = a02Var.f789a;
            ResultKt.b(obj);
        }
        b02Var.f1214d = null;
        return Unit.f71706a;
    }
}
