package ads_mobile_sdk;

import android.content.Context;
import b.o0;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import ni.i0;

/* loaded from: classes2.dex */
public final class xy1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f11885a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f11886b;

    /* renamed from: c, reason: collision with root package name */
    public final sp3 f11887c;

    /* renamed from: d, reason: collision with root package name */
    public final o0 f11888d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f11889e;

    /* renamed from: f, reason: collision with root package name */
    public final ui.q f11890f;

    public xy1(Context applicationContext, t70.j0 uiScope, sp3 webViewFactory, o0 nativeMediaWebViewConfigurator, jr0 flags, ui.q nativeRequest) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(webViewFactory, "webViewFactory");
        Intrinsics.g(nativeMediaWebViewConfigurator, "nativeMediaWebViewConfigurator");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(nativeRequest, "nativeRequest");
        this.f11885a = applicationContext;
        this.f11886b = uiScope;
        this.f11887c = webViewFactory;
        this.f11888d = nativeMediaWebViewConfigurator;
        this.f11889e = flags;
        this.f11890f = nativeRequest;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a9, code lost:
    
        if (r11.a(r12, r6) == r0) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00be A[Catch: all -> 0x00ca, TryCatch #3 {all -> 0x00ca, blocks: (B:40:0x00b7, B:42:0x00be, B:44:0x00c2, B:46:0x00c6, B:49:0x00cd, B:51:0x00d1, B:53:0x00d5, B:55:0x00d9, B:56:0x00da, B:57:0x00df, B:58:0x00e0, B:59:0x00e7, B:60:0x00e8, B:61:0x00ef, B:62:0x00f0), top: B:73:0x00b7 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00f0 A[Catch: all -> 0x00ca, TRY_LEAVE, TryCatch #3 {all -> 0x00ca, blocks: (B:40:0x00b7, B:42:0x00be, B:44:0x00c2, B:46:0x00c6, B:49:0x00cd, B:51:0x00d1, B:53:0x00d5, B:55:0x00d9, B:56:0x00da, B:57:0x00df, B:58:0x00e0, B:59:0x00e7, B:60:0x00e8, B:61:0x00ef, B:62:0x00f0), top: B:73:0x00b7 }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(xy1 xy1Var, fs3 fs3Var, eg2 eg2Var, ContinuationImpl continuationImpl) {
        py1 py1Var;
        TimeoutCancellationException timeoutCancellationException;
        th3 th3Var;
        th3 th3Var2;
        xy1 xy1Var2;
        tx0 tx0Var;
        xy1Var.getClass();
        if (continuationImpl instanceof py1) {
            py1Var = (py1) continuationImpl;
            int i5 = py1Var.f8419f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                py1Var.f8419f = i5 - Integer.MIN_VALUE;
            } else {
                py1Var = new py1(xy1Var, continuationImpl);
            }
        }
        py1 py1Var2 = py1Var;
        Object obj = py1Var2.f8417d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = py1Var2.f8419f;
        if (i11 == 0) {
            ResultKt.b(obj);
            WeakHashMap weakHashMap = ji3.f5253a;
            th3 th3VarA = ji3.a(wv0.CUI_NAME_CREATIVE_WEBVIEW_INITIALIZATION, EmptyList.f71733a, true);
            try {
                sp3 sp3Var = xy1Var.f11887c;
                py1Var2.f8414a = xy1Var;
                py1Var2.f8415b = th3VarA;
                py1Var2.f8416c = th3VarA;
                py1Var2.f8419f = 1;
                Object objA = sp3.a(sp3Var, fs3Var, null, false, eg2Var, py1Var2, 48);
                if (objA != coroutineSingletons) {
                    xy1Var2 = xy1Var;
                    th3Var = th3VarA;
                    obj = objA;
                    th3Var2 = th3Var;
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                timeoutCancellationException = th2;
                th3Var = th3VarA;
                th3Var2 = th3Var;
                th3Var2.b(timeoutCancellationException);
                if (!(timeoutCancellationException instanceof b.a4)) {
                    throw timeoutCancellationException;
                }
                if (!(timeoutCancellationException instanceof TimeoutCancellationException) && !(timeoutCancellationException instanceof CancellationException)) {
                    th3Var2.a(timeoutCancellationException);
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
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tx0Var = (tx0) py1Var2.f8414a;
            ResultKt.b(obj);
            return new xu0(tx0Var);
        }
        th3Var = py1Var2.f8416c;
        th3Var2 = py1Var2.f8415b;
        xy1Var2 = (xy1) py1Var2.f8414a;
        try {
            ResultKt.b(obj);
        } catch (Throwable th3) {
            timeoutCancellationException = th3;
            try {
                th3Var2.b(timeoutCancellationException);
                if (!(timeoutCancellationException instanceof b.a4)) {
                }
            } finally {
            }
        }
        b.a1 a1Var = (b.a1) obj;
        if (a1Var instanceof pu0) {
            zi3.a((pu0) a1Var, false);
        }
        CloseableKt.a(th3Var, null);
        if (a1Var instanceof pu0) {
            return (pu0) a1Var;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        tx0Var = (tx0) ((xu0) a1Var).f11834b;
        o0 o0Var = xy1Var2.f11888d;
        b.u7 u7VarC = tx0Var.c();
        py1Var2.f8414a = tx0Var;
        py1Var2.f8415b = null;
        py1Var2.f8416c = null;
        py1Var2.f8419f = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(xy1 xy1Var, tx0 tx0Var, ContinuationImpl continuationImpl) {
        wy1 wy1Var;
        i0 i0VarC;
        xy1Var.getClass();
        if (continuationImpl instanceof wy1) {
            wy1Var = (wy1) continuationImpl;
            int i5 = wy1Var.f11518d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wy1Var.f11518d = i5 - Integer.MIN_VALUE;
            } else {
                wy1Var = new wy1(xy1Var, continuationImpl);
            }
        }
        Object obj = wy1Var.f11516b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wy1Var.f11518d;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tx0 tx0Var2 = wy1Var.f11515a;
            ResultKt.b(obj);
            return tx0Var2;
        }
        ResultKt.b(obj);
        sy0 sy0VarD = tx0Var.d();
        if (sy0VarD != null && (i0VarC = xy1Var.f11890f.c()) != null) {
            wy1Var.f11515a = tx0Var;
            wy1Var.f11518d = 1;
            if (sy0VarD.a(i0VarC, wy1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return tx0Var;
    }
}
