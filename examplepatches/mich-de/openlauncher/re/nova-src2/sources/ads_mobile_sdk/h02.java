package ads_mobile_sdk;

import b.q2;
import java.io.Closeable;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class h02 {

    /* renamed from: a, reason: collision with root package name */
    public final kz2 f4162a;

    /* renamed from: b, reason: collision with root package name */
    public final sp3 f4163b;

    /* renamed from: c, reason: collision with root package name */
    public final q2 f4164c;

    public h02(kz2 rootTraceCreator, sp3 webViewFactory, q2 nativePolicyValidatorOverlayConfigurator) {
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(webViewFactory, "webViewFactory");
        Intrinsics.g(nativePolicyValidatorOverlayConfigurator, "nativePolicyValidatorOverlayConfigurator");
        this.f4162a = rootTraceCreator;
        this.f4163b = webViewFactory;
        this.f4164c = nativePolicyValidatorOverlayConfigurator;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:103:0x01d1 A[Catch: all -> 0x0046, TRY_LEAVE, TryCatch #5 {all -> 0x0046, blocks: (B:15:0x0040, B:100:0x01c2, B:101:0x01cd, B:103:0x01d1), top: B:148:0x0040 }] */
    /* JADX WARN: Removed duplicated region for block: B:113:0x01ee A[Catch: all -> 0x01fa, TryCatch #8 {all -> 0x01fa, blocks: (B:111:0x01e7, B:113:0x01ee, B:115:0x01f2, B:117:0x01f6, B:120:0x01fd, B:122:0x0201, B:124:0x0205, B:126:0x0209, B:127:0x020a, B:128:0x020f, B:129:0x0210, B:130:0x0217, B:131:0x0218, B:132:0x021f, B:133:0x0220), top: B:153:0x01e7 }] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0220 A[Catch: all -> 0x01fa, TRY_LEAVE, TryCatch #8 {all -> 0x01fa, blocks: (B:111:0x01e7, B:113:0x01ee, B:115:0x01f2, B:117:0x01f6, B:120:0x01fd, B:122:0x0201, B:124:0x0205, B:126:0x0209, B:127:0x020a, B:128:0x020f, B:129:0x0210, B:130:0x0217, B:131:0x0218, B:132:0x021f, B:133:0x0220), top: B:153:0x01e7 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00e9 A[Catch: all -> 0x012e, TryCatch #10 {all -> 0x012e, blocks: (B:43:0x00e3, B:45:0x00e9, B:46:0x00ee), top: B:156:0x00e3 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00ee A[Catch: all -> 0x012e, TRY_LEAVE, TryCatch #10 {all -> 0x012e, blocks: (B:43:0x00e3, B:45:0x00e9, B:46:0x00ee), top: B:156:0x00e3 }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0121 A[Catch: all -> 0x007c, TRY_LEAVE, TryCatch #9 {all -> 0x007c, blocks: (B:27:0x0076, B:50:0x0112, B:51:0x011d, B:53:0x0121), top: B:154:0x0076 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x013e A[Catch: all -> 0x014a, TryCatch #7 {all -> 0x014a, blocks: (B:61:0x0137, B:63:0x013e, B:65:0x0142, B:67:0x0146, B:70:0x014d, B:72:0x0151, B:74:0x0155, B:76:0x0159, B:77:0x015a, B:78:0x015f, B:79:0x0160, B:80:0x0167, B:81:0x0168, B:82:0x016f, B:83:0x0170), top: B:152:0x0137 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0170 A[Catch: all -> 0x014a, TRY_LEAVE, TryCatch #7 {all -> 0x014a, blocks: (B:61:0x0137, B:63:0x013e, B:65:0x0142, B:67:0x0146, B:70:0x014d, B:72:0x0151, B:74:0x0155, B:76:0x0159, B:77:0x015a, B:78:0x015f, B:79:0x0160, B:80:0x0167, B:81:0x0168, B:82:0x016f, B:83:0x0170), top: B:152:0x0137 }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x019b A[Catch: all -> 0x01de, TryCatch #11 {all -> 0x01de, blocks: (B:93:0x0195, B:95:0x019b, B:96:0x01a0), top: B:157:0x0195 }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01a0 A[Catch: all -> 0x01de, TRY_LEAVE, TryCatch #11 {all -> 0x01de, blocks: (B:93:0x0195, B:95:0x019b, B:96:0x01a0), top: B:157:0x0195 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(h02 h02Var, ContinuationImpl continuationImpl) {
        g02 g02Var;
        Closeable closeableA;
        th3 th3Var;
        Closeable closeable;
        Closeable closeableA2;
        th3 th3Var2;
        Closeable closeable2;
        th3 th3Var3;
        b.a1 a1Var;
        tx0 tx0Var;
        th3 th3Var4;
        Closeable closeable3;
        int i5;
        Object xu0Var;
        th3 th3Var5;
        b.a1 a1Var2;
        int i11;
        tx0 tx0Var2;
        th3 th3Var6;
        Closeable closeable4;
        Object xu0Var2;
        h02 h02Var2 = h02Var;
        if (continuationImpl instanceof g02) {
            g02Var = (g02) continuationImpl;
            int i12 = g02Var.f3607f;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                g02Var.f3607f = i12 - Integer.MIN_VALUE;
            } else {
                g02Var = new g02(h02Var2, continuationImpl);
            }
        }
        Object objA = g02Var.f3605d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = g02Var.f3607f;
        int i14 = 0;
        if (i13 == 0) {
            ResultKt.b(objA);
            kz2 kz2Var = h02Var2.f4162a;
            wv0 wv0Var = wv0.CUI_NAME_NATIVE_POLICY_VALIDATOR_WEBVIEW_CREATE;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            int i15 = 14;
            if (ji3.b().f4777a == null) {
                closeableA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    sp3 sp3Var = h02Var2.f4163b;
                    fs3 fs3Var = new fs3(es3.f2964a, i14, i14, i15);
                    g02Var.f3602a = h02Var2;
                    g02Var.f3603b = closeableA2;
                    g02Var.f3604c = closeableA2;
                    g02Var.f3607f = 1;
                    objA = sp3Var.a(fs3Var, null, true, g02Var);
                    if (objA != coroutineSingletons) {
                        closeable2 = closeableA2;
                        th3Var3 = closeableA2;
                        a1Var = (b.a1) objA;
                        if (!(a1Var instanceof pu0)) {
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    th3Var2 = closeableA2;
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                        throw th;
                    }
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var2.a(th);
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
                closeableA = ji3.a(wv0Var, emptyList, true);
                try {
                    sp3 sp3Var2 = h02Var2.f4163b;
                    fs3 fs3Var2 = new fs3(es3.f2964a, i14, i14, i15);
                    g02Var.f3602a = h02Var2;
                    g02Var.f3603b = closeableA;
                    g02Var.f3604c = closeableA;
                    g02Var.f3607f = 3;
                    objA = sp3Var2.a(fs3Var2, null, true, g02Var);
                    if (objA != coroutineSingletons) {
                        closeable = closeableA;
                        th3Var5 = closeableA;
                        a1Var2 = (b.a1) objA;
                        if (!(a1Var2 instanceof pu0)) {
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var = closeableA;
                    th3Var.b(th);
                    if (!(th instanceof b.a4)) {
                        throw th;
                    }
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var.a(th);
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
        if (i13 == 1) {
            closeableA2 = (Closeable) g02Var.f3604c;
            th3Var2 = (th3) g02Var.f3603b;
            h02Var2 = (h02) g02Var.f3602a;
            try {
                ResultKt.b(objA);
                closeable2 = closeableA2;
                th3Var3 = th3Var2;
            } catch (Throwable th4) {
                th = th4;
                th3Var2.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
            try {
                a1Var = (b.a1) objA;
                if (!(a1Var instanceof pu0)) {
                    xu0Var = (pu0) a1Var;
                    th3Var4 = th3Var3;
                    closeable3 = closeable2;
                    if (xu0Var instanceof pu0) {
                    }
                    CloseableKt.a(closeable3, null);
                    return xu0Var;
                }
                Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                tx0 tx0Var3 = (tx0) ((xu0) a1Var).f11834b;
                q2 q2Var = h02Var2.f4164c;
                b.u7 u7VarC = tx0Var3.c();
                g02Var.f3602a = th3Var3;
                g02Var.f3603b = closeable2;
                g02Var.f3604c = tx0Var3;
                g02Var.f3607f = 2;
                if (q2Var.a(u7VarC, g02Var) != coroutineSingletons) {
                    tx0Var = tx0Var3;
                    th3Var4 = th3Var3;
                    closeable3 = closeable2;
                    i5 = 4;
                    tx0Var.setVisibility(i5);
                    tx0Var.setContentDescription("policy_validator");
                    xu0Var = new xu0(tx0Var);
                    if (xu0Var instanceof pu0) {
                    }
                    CloseableKt.a(closeable3, null);
                    return xu0Var;
                }
                return coroutineSingletons;
            } catch (Throwable th5) {
                th = th5;
                Closeable closeable5 = closeable2;
                th3Var2 = th3Var3;
                closeableA2 = closeable5;
                th3Var2.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        } else if (i13 == 2) {
            tx0Var = (tx0) g02Var.f3604c;
            closeable3 = g02Var.f3603b;
            th3Var4 = (th3) g02Var.f3602a;
            try {
                ResultKt.b(objA);
                i5 = 4;
                tx0Var.setVisibility(i5);
                tx0Var.setContentDescription("policy_validator");
                xu0Var = new xu0(tx0Var);
                if (xu0Var instanceof pu0) {
                    zi3.a((pu0) xu0Var, false);
                }
                CloseableKt.a(closeable3, null);
                return xu0Var;
            } catch (Throwable th6) {
                th = th6;
                th3Var2 = th3Var4;
                closeableA2 = closeable3;
                try {
                    th3Var2.b(th);
                    if (!(th instanceof b.a4)) {
                    }
                } finally {
                }
            }
        } else if (i13 == 3) {
            closeableA = (Closeable) g02Var.f3604c;
            th3Var = (th3) g02Var.f3603b;
            h02Var2 = (h02) g02Var.f3602a;
            try {
                ResultKt.b(objA);
                closeable = closeableA;
                th3Var5 = th3Var;
            } catch (Throwable th7) {
                th = th7;
                th3Var.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
            try {
                a1Var2 = (b.a1) objA;
                if (!(a1Var2 instanceof pu0)) {
                    xu0Var2 = (pu0) a1Var2;
                    th3Var6 = th3Var5;
                    closeable4 = closeable;
                    if (xu0Var2 instanceof pu0) {
                    }
                    CloseableKt.a(closeable4, null);
                    return xu0Var2;
                }
                Intrinsics.e(a1Var2, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
                tx0 tx0Var4 = (tx0) ((xu0) a1Var2).f11834b;
                q2 q2Var2 = h02Var2.f4164c;
                b.u7 u7VarC2 = tx0Var4.c();
                g02Var.f3602a = th3Var5;
                g02Var.f3603b = closeable;
                g02Var.f3604c = tx0Var4;
                i11 = 4;
                g02Var.f3607f = 4;
                if (q2Var2.a(u7VarC2, g02Var) != coroutineSingletons) {
                    tx0Var2 = tx0Var4;
                    th3Var6 = th3Var5;
                    closeable4 = closeable;
                    tx0Var2.setVisibility(i11);
                    tx0Var2.setContentDescription("policy_validator");
                    xu0Var2 = new xu0(tx0Var2);
                    if (xu0Var2 instanceof pu0) {
                    }
                    CloseableKt.a(closeable4, null);
                    return xu0Var2;
                }
                return coroutineSingletons;
            } catch (Throwable th8) {
                th = th8;
                Closeable closeable6 = closeable;
                th3Var = th3Var5;
                closeableA = closeable6;
                th3Var.b(th);
                if (!(th instanceof b.a4)) {
                }
            }
        } else {
            if (i13 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tx0Var2 = (tx0) g02Var.f3604c;
            closeable4 = g02Var.f3603b;
            th3Var6 = (th3) g02Var.f3602a;
            try {
                ResultKt.b(objA);
                i11 = 4;
                tx0Var2.setVisibility(i11);
                tx0Var2.setContentDescription("policy_validator");
                xu0Var2 = new xu0(tx0Var2);
                if (xu0Var2 instanceof pu0) {
                    zi3.a((pu0) xu0Var2, false);
                }
                CloseableKt.a(closeable4, null);
                return xu0Var2;
            } catch (Throwable th9) {
                th = th9;
                th3Var = th3Var6;
                closeableA = closeable4;
                try {
                    th3Var.b(th);
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
}
