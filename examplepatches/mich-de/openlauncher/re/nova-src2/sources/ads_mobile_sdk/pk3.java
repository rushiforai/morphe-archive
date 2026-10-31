package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.Toolbar;
import ar.d;
import b.b9;
import b.o0;
import b.p0;
import b.p5;
import c0.b1;
import java.io.Closeable;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes2.dex */
public final class pk3 extends kt0 {
    public static final /* synthetic */ int Y = 0;
    public final x60 Q;
    public final mi3 R;
    public final sp3 S;
    public final o0 T;
    public final kz2 U;
    public tx0 V;
    public boolean W;
    public String X;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pk3(Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, String afmaVersion, qw2 requestType, z1 adConfiguration, g0 activityTracker, y2 adEventEmitter, b9 omidMonitor, rw0 gmaUtil, x60 csiTicker, mi3 traceMetaSet, sp3 webViewFactory, o0 twoPieceExpandedWebViewConfigurator, p0 backButtonStateDelegate, kz2 rootTraceCreator) {
        super(applicationContext, uiScope, uiContext, backgroundScope, flags, traceLogger, afmaVersion, requestType, adConfiguration, activityTracker, adEventEmitter, omidMonitor, gmaUtil, backButtonStateDelegate);
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(omidMonitor, "omidMonitor");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(csiTicker, "csiTicker");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(webViewFactory, "webViewFactory");
        Intrinsics.g(twoPieceExpandedWebViewConfigurator, "twoPieceExpandedWebViewConfigurator");
        Intrinsics.g(backButtonStateDelegate, "backButtonStateDelegate");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        this.Q = csiTicker;
        this.R = traceMetaSet;
        this.S = webViewFactory;
        this.T = twoPieceExpandedWebViewConfigurator;
        this.U = rootTraceCreator;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0057, code lost:
    
        if (r5.a(r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(pk3 pk3Var, ContinuationImpl continuationImpl) {
        fk3 fk3Var;
        if (continuationImpl instanceof fk3) {
            fk3Var = (fk3) continuationImpl;
            int i5 = fk3Var.f3388d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fk3Var.f3388d = i5 - Integer.MIN_VALUE;
            } else {
                fk3Var = new fk3(pk3Var, continuationImpl);
            }
        }
        Object obj = fk3Var.f3386b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fk3Var.f3388d;
        if (i11 == 0) {
            ResultKt.b(obj);
            fk3Var.f3385a = pk3Var;
            fk3Var.f3388d = 1;
            if (kt0.a((kt0) pk3Var, (ContinuationImpl) fk3Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        pk3Var = fk3Var.f3385a;
        ResultKt.b(obj);
        tx0 tx0Var = (tx0) pk3Var.H.getValue();
        fk3Var.f3385a = null;
        fk3Var.f3388d = 2;
    }

    @Override // ads_mobile_sdk.kt0, ads_mobile_sdk.et0
    public final Object b(ContinuationImpl continuationImpl) {
        return a(this, continuationImpl);
    }

    @Override // ads_mobile_sdk.et0
    public final Object c(SuspendLambda suspendLambda) {
        return b(this, (ContinuationImpl) suspendLambda);
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x005b, code lost:
    
        if (r5.a(r6, (kotlin.coroutines.jvm.internal.ContinuationImpl) r0) == r1) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(pk3 pk3Var, ContinuationImpl continuationImpl) {
        gk3 gk3Var;
        if (continuationImpl instanceof gk3) {
            gk3Var = (gk3) continuationImpl;
            int i5 = gk3Var.f3986d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gk3Var.f3986d = i5 - Integer.MIN_VALUE;
            } else {
                gk3Var = new gk3(pk3Var, continuationImpl);
            }
        }
        Object objB = gk3Var.f3984b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gk3Var.f3986d;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objB);
            gk3Var.f3983a = pk3Var;
            gk3Var.f3986d = 1;
            objB = kt0.b(pk3Var, gk3Var);
            if (objB != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            return Boolean.valueOf(z11);
        }
        pk3Var = gk3Var.f3983a;
        ResultKt.b(objB);
        if (((Boolean) objB).booleanValue()) {
            tx0 tx0Var = pk3Var.V;
            if (tx0Var == null) {
                Intrinsics.m("previousWebView");
                throw null;
            }
            gk3Var.f3983a = null;
            gk3Var.f3986d = 2;
        } else {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }

    @Override // ads_mobile_sdk.et0
    public final Toolbar a(RelativeLayout relativeLayout) {
        return a(relativeLayout, this.X);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:115:0x019a A[Catch: all -> 0x0174, TRY_LEAVE, TryCatch #7 {all -> 0x0174, blocks: (B:93:0x0161, B:95:0x0168, B:97:0x016c, B:99:0x0170, B:102:0x0177, B:104:0x017b, B:106:0x017f, B:108:0x0183, B:109:0x0184, B:110:0x0189, B:111:0x018a, B:112:0x0191, B:113:0x0192, B:114:0x0199, B:115:0x019a), top: B:207:0x0161 }] */
    /* JADX WARN: Removed duplicated region for block: B:141:0x01f4 A[Catch: all -> 0x01ff, TRY_LEAVE, TryCatch #15 {all -> 0x01ff, blocks: (B:138:0x01ee, B:139:0x01f0, B:141:0x01f4, B:143:0x01f9, B:153:0x020d, B:155:0x021b), top: B:218:0x01ee }] */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0207 A[Catch: all -> 0x0205, TRY_ENTER, TryCatch #4 {all -> 0x0205, blocks: (B:142:0x01f6, B:150:0x0207, B:152:0x020b, B:154:0x0217), top: B:204:0x01f2 }] */
    /* JADX WARN: Removed duplicated region for block: B:173:0x024a A[Catch: all -> 0x0256, TryCatch #9 {all -> 0x0256, blocks: (B:171:0x0243, B:173:0x024a, B:175:0x024e, B:177:0x0252, B:180:0x0259, B:182:0x025d, B:184:0x0261, B:186:0x0265, B:187:0x0266, B:188:0x026b, B:189:0x026c, B:190:0x0273, B:191:0x0274, B:192:0x027b, B:193:0x027c), top: B:208:0x0243 }] */
    /* JADX WARN: Removed duplicated region for block: B:193:0x027c A[Catch: all -> 0x0256, TRY_LEAVE, TryCatch #9 {all -> 0x0256, blocks: (B:171:0x0243, B:173:0x024a, B:175:0x024e, B:177:0x0252, B:180:0x0259, B:182:0x025d, B:184:0x0261, B:186:0x0265, B:187:0x0266, B:188:0x026b, B:189:0x026c, B:190:0x0273, B:191:0x0274, B:192:0x027b, B:193:0x027c), top: B:208:0x0243 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0110 A[Catch: all -> 0x011b, TRY_LEAVE, TryCatch #10 {all -> 0x011b, blocks: (B:59:0x010a, B:60:0x010c, B:62:0x0110, B:64:0x0115, B:74:0x0129, B:77:0x0138), top: B:209:0x010a }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0123 A[Catch: all -> 0x0121, TRY_ENTER, TryCatch #1 {all -> 0x0121, blocks: (B:63:0x0112, B:71:0x0123, B:73:0x0127, B:75:0x0133), top: B:200:0x010e }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0168 A[Catch: all -> 0x0174, TryCatch #7 {all -> 0x0174, blocks: (B:93:0x0161, B:95:0x0168, B:97:0x016c, B:99:0x0170, B:102:0x0177, B:104:0x017b, B:106:0x017f, B:108:0x0183, B:109:0x0184, B:110:0x0189, B:111:0x018a, B:112:0x0191, B:113:0x0192, B:114:0x0199, B:115:0x019a), top: B:207:0x0161 }] */
    /* JADX WARN: Type inference failed for: r15v0, types: [ads_mobile_sdk.tx0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r15v11 */
    /* JADX WARN: Type inference failed for: r15v30 */
    /* JADX WARN: Type inference failed for: r15v31, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r15v34, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r15v46 */
    /* JADX WARN: Type inference failed for: r15v47, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r15v5 */
    /* JADX WARN: Type inference failed for: r15v50, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r15v54 */
    /* JADX WARN: Type inference failed for: r15v55 */
    /* JADX WARN: Type inference failed for: r15v61 */
    /* JADX WARN: Type inference failed for: r15v62 */
    /* JADX WARN: Type inference failed for: r3v0, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, String str, String str2, String str3, ContinuationImpl continuationImpl) {
        hk3 hk3Var;
        th3 th3Var;
        th3 th3Var2;
        TimeoutCancellationException timeoutCancellationException;
        th3 th3Var3;
        th3 th3VarA;
        TimeoutCancellationException timeoutCancellationException2;
        th3 th3Var4;
        th3 th3VarA2;
        pk3 pk3Var;
        th3 th3Var5;
        tx0 tx0Var2;
        th3 th3Var6;
        Object objB;
        pk3 pk3Var2;
        th3 th3Var7;
        tx0 tx0Var3;
        th3 th3Var8;
        Object objB2;
        tx0 tx0Var4;
        th3 th3Var9;
        b.a1 a1Var;
        th3 th3Var10;
        tx0 tx0Var5;
        th3 th3Var11;
        b.a1 a1Var2;
        th3 th3Var12;
        if (continuationImpl instanceof hk3) {
            hk3Var = (hk3) continuationImpl;
            int i5 = hk3Var.f4429g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hk3Var.f4429g = i5 - Integer.MIN_VALUE;
            } else {
                hk3Var = new hk3(this, continuationImpl);
            }
        }
        hk3 hk3Var2 = hk3Var;
        Object objY = hk3Var2.f4427e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r32 = hk3Var2.f4429g;
        Continuation continuation = null;
        try {
            try {
                switch (r32) {
                    case 0:
                        ResultKt.b(objY);
                        kz2 kz2Var = this.U;
                        wv0 wv0Var = wv0.CUI_NAME_TWO_PIECE_EXPANDABLE_LOAD;
                        mi3 mi3Var = this.R;
                        EmptyList emptyList = EmptyList.f71733a;
                        if (ji3.b().f4777a == null) {
                            th3VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                            try {
                                if (str != null) {
                                    hk3Var2.f4423a = this;
                                    hk3Var2.f4424b = tx0Var;
                                    hk3Var2.f4425c = th3VarA;
                                    hk3Var2.f4426d = th3VarA;
                                    hk3Var2.f4429g = 1;
                                    objB2 = tx0Var.b(str, hk3Var2);
                                    if (objB2 != coroutineSingletons) {
                                        pk3Var2 = this;
                                        th3Var7 = th3VarA;
                                        tx0Var4 = tx0Var;
                                        try {
                                            b.a1 a1Var3 = (b.a1) objB2;
                                            tx0Var3 = tx0Var4;
                                            th3Var9 = th3VarA;
                                            a1Var = a1Var3;
                                            try {
                                                if (!(a1Var instanceof pu0)) {
                                                    zi3.a((pu0) a1Var, false);
                                                    Boolean bool = Boolean.FALSE;
                                                    CloseableKt.a(th3Var9, null);
                                                    return bool;
                                                }
                                                Toolbar toolbar = pk3Var2.f2991x;
                                                if (toolbar != null) {
                                                    CoroutineContext coroutineContext = pk3Var2.f2972c;
                                                    d dVar = new d(tx0Var3, toolbar, continuation, 3);
                                                    hk3Var2.f4423a = th3Var7;
                                                    hk3Var2.f4424b = th3Var9;
                                                    hk3Var2.f4425c = null;
                                                    hk3Var2.f4426d = null;
                                                    hk3Var2.f4429g = 3;
                                                    objY = m0.y(coroutineContext, dVar, hk3Var2);
                                                    if (objY != coroutineSingletons) {
                                                        th3Var2 = th3Var7;
                                                        th3Var10 = th3Var9;
                                                        tx0Var = th3Var10;
                                                        Boolean bool2 = Boolean.TRUE;
                                                        CloseableKt.a(tx0Var, null);
                                                        return bool2;
                                                    }
                                                } else {
                                                    th3Var2 = th3Var7;
                                                    tx0Var = th3Var9;
                                                    Boolean bool22 = Boolean.TRUE;
                                                    CloseableKt.a(tx0Var, null);
                                                    return bool22;
                                                }
                                            } catch (Throwable th2) {
                                                th3Var3 = th3Var9;
                                                timeoutCancellationException = th2;
                                                th3VarA = th3Var7;
                                                try {
                                                    th3VarA.b(timeoutCancellationException);
                                                    if (!(timeoutCancellationException instanceof b.a4)) {
                                                        if (!(timeoutCancellationException instanceof TimeoutCancellationException) && !(timeoutCancellationException instanceof CancellationException)) {
                                                            th3VarA.a(timeoutCancellationException);
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
                                                } finally {
                                                }
                                            }
                                        } catch (Throwable th3) {
                                            timeoutCancellationException = th3;
                                            th3Var3 = th3VarA;
                                            th3VarA = th3Var7;
                                            th3VarA.b(timeoutCancellationException);
                                            if (!(timeoutCancellationException instanceof b.a4)) {
                                            }
                                        }
                                    }
                                } else if (str2 != null) {
                                    hk3Var2.f4423a = this;
                                    hk3Var2.f4424b = tx0Var;
                                    hk3Var2.f4425c = th3VarA;
                                    hk3Var2.f4426d = th3VarA;
                                    hk3Var2.f4429g = 2;
                                    Object objA = tx0.a((tx0) tx0Var, str2, str3, false, (ContinuationImpl) hk3Var2, 12);
                                    if (objA != coroutineSingletons) {
                                        pk3Var2 = this;
                                        th3Var7 = th3VarA;
                                        objY = objA;
                                        tx0Var3 = tx0Var;
                                        th3Var8 = th3Var7;
                                        try {
                                            a1Var = (b.a1) objY;
                                            th3Var9 = th3Var8;
                                            if (!(a1Var instanceof pu0)) {
                                            }
                                        } catch (Throwable th4) {
                                            th3 th3Var13 = th3Var8;
                                            timeoutCancellationException = th4;
                                            th3VarA = th3Var7;
                                            th3Var3 = th3Var13;
                                            th3VarA.b(timeoutCancellationException);
                                            if (!(timeoutCancellationException instanceof b.a4)) {
                                            }
                                        }
                                    }
                                } else {
                                    zi3.a(6, "Cannot open two piece expandable with no url or html", null);
                                    Boolean bool3 = Boolean.FALSE;
                                    th3VarA.close();
                                    return bool3;
                                }
                            } catch (Throwable th5) {
                                timeoutCancellationException = th5;
                                th3Var3 = th3VarA;
                                th3VarA.b(timeoutCancellationException);
                                if (!(timeoutCancellationException instanceof b.a4)) {
                                }
                            }
                        } else {
                            th3VarA2 = ji3.a(wv0Var, emptyList, true);
                            try {
                                if (str != null) {
                                    hk3Var2.f4423a = this;
                                    hk3Var2.f4424b = tx0Var;
                                    hk3Var2.f4425c = th3VarA2;
                                    hk3Var2.f4426d = th3VarA2;
                                    hk3Var2.f4429g = 4;
                                    objB = tx0Var.b(str, hk3Var2);
                                    if (objB != coroutineSingletons) {
                                        pk3Var = this;
                                        th3Var5 = th3VarA2;
                                        tx0Var5 = tx0Var;
                                        try {
                                            b.a1 a1Var4 = (b.a1) objB;
                                            tx0Var2 = tx0Var5;
                                            th3Var11 = th3VarA2;
                                            a1Var2 = a1Var4;
                                        } catch (Throwable th6) {
                                            timeoutCancellationException2 = th6;
                                            th3Var4 = th3VarA2;
                                            th3VarA2 = th3Var5;
                                            try {
                                                th3VarA2.b(timeoutCancellationException2);
                                                if (!(timeoutCancellationException2 instanceof b.a4)) {
                                                }
                                            } finally {
                                                try {
                                                    throw th;
                                                } finally {
                                                }
                                            }
                                        }
                                        try {
                                            if (!(a1Var2 instanceof pu0)) {
                                                zi3.a((pu0) a1Var2, false);
                                                Boolean bool4 = Boolean.FALSE;
                                                CloseableKt.a(th3Var11, null);
                                                return bool4;
                                            }
                                            Toolbar toolbar2 = pk3Var.f2991x;
                                            if (toolbar2 != null) {
                                                CoroutineContext coroutineContext2 = pk3Var.f2972c;
                                                d dVar2 = new d(tx0Var2, toolbar2, continuation, 3);
                                                hk3Var2.f4423a = th3Var5;
                                                hk3Var2.f4424b = th3Var11;
                                                hk3Var2.f4425c = null;
                                                hk3Var2.f4426d = null;
                                                hk3Var2.f4429g = 6;
                                                objY = m0.y(coroutineContext2, dVar2, hk3Var2);
                                                if (objY != coroutineSingletons) {
                                                    th3Var = th3Var5;
                                                    th3Var12 = th3Var11;
                                                    tx0Var = th3Var12;
                                                    Boolean bool5 = Boolean.TRUE;
                                                    CloseableKt.a(tx0Var, null);
                                                    return bool5;
                                                }
                                            } else {
                                                th3Var = th3Var5;
                                                tx0Var = th3Var11;
                                                Boolean bool52 = Boolean.TRUE;
                                                CloseableKt.a(tx0Var, null);
                                                return bool52;
                                            }
                                        } catch (Throwable th7) {
                                            th3Var4 = th3Var11;
                                            timeoutCancellationException2 = th7;
                                            th3VarA2 = th3Var5;
                                            th3VarA2.b(timeoutCancellationException2);
                                            if (!(timeoutCancellationException2 instanceof b.a4)) {
                                            }
                                        }
                                    }
                                } else if (str2 != null) {
                                    hk3Var2.f4423a = this;
                                    hk3Var2.f4424b = tx0Var;
                                    hk3Var2.f4425c = th3VarA2;
                                    hk3Var2.f4426d = th3VarA2;
                                    hk3Var2.f4429g = 5;
                                    Object objA2 = tx0.a((tx0) tx0Var, str2, str3, false, (ContinuationImpl) hk3Var2, 12);
                                    if (objA2 != coroutineSingletons) {
                                        pk3Var = this;
                                        th3Var5 = th3VarA2;
                                        objY = objA2;
                                        tx0Var2 = tx0Var;
                                        th3Var6 = th3Var5;
                                        try {
                                            a1Var2 = (b.a1) objY;
                                            th3Var11 = th3Var6;
                                            if (!(a1Var2 instanceof pu0)) {
                                            }
                                        } catch (Throwable th8) {
                                            th3 th3Var14 = th3Var6;
                                            timeoutCancellationException2 = th8;
                                            th3VarA2 = th3Var5;
                                            th3Var4 = th3Var14;
                                            th3VarA2.b(timeoutCancellationException2);
                                            if (!(timeoutCancellationException2 instanceof b.a4)) {
                                            }
                                        }
                                    }
                                } else {
                                    zi3.a(6, "Cannot open two piece expandable with no url or html", null);
                                    Boolean bool6 = Boolean.FALSE;
                                    th3VarA2.close();
                                    return bool6;
                                }
                            } catch (Throwable th9) {
                                timeoutCancellationException2 = th9;
                                th3Var4 = th3VarA2;
                                th3VarA2.b(timeoutCancellationException2);
                                if (!(timeoutCancellationException2 instanceof b.a4)) {
                                }
                            }
                        }
                        return coroutineSingletons;
                    case 1:
                        th3 th3Var15 = hk3Var2.f4426d;
                        th3Var7 = hk3Var2.f4425c;
                        tx0 tx0Var6 = (tx0) hk3Var2.f4424b;
                        pk3Var2 = (pk3) hk3Var2.f4423a;
                        ResultKt.b(objY);
                        th3VarA = th3Var15;
                        tx0Var4 = tx0Var6;
                        objB2 = objY;
                        b.a1 a1Var32 = (b.a1) objB2;
                        tx0Var3 = tx0Var4;
                        th3Var9 = th3VarA;
                        a1Var = a1Var32;
                        if (!(a1Var instanceof pu0)) {
                        }
                        break;
                    case 2:
                        th3 th3Var16 = hk3Var2.f4426d;
                        th3Var7 = hk3Var2.f4425c;
                        tx0Var3 = (tx0) hk3Var2.f4424b;
                        pk3Var2 = (pk3) hk3Var2.f4423a;
                        ResultKt.b(objY);
                        th3Var8 = th3Var16;
                        a1Var = (b.a1) objY;
                        th3Var9 = th3Var8;
                        if (!(a1Var instanceof pu0)) {
                        }
                        break;
                    case 3:
                        tx0Var = (Closeable) hk3Var2.f4424b;
                        th3Var2 = (th3) hk3Var2.f4423a;
                        try {
                            ResultKt.b(objY);
                            th3Var10 = tx0Var;
                            tx0Var = th3Var10;
                            Boolean bool222 = Boolean.TRUE;
                            CloseableKt.a(tx0Var, null);
                            return bool222;
                        } catch (Throwable th10) {
                            th = th10;
                            th3VarA = th3Var2;
                            th3Var3 = tx0Var;
                            timeoutCancellationException = th;
                            th3VarA.b(timeoutCancellationException);
                            if (!(timeoutCancellationException instanceof b.a4)) {
                            }
                        }
                        break;
                    case 4:
                        th3 th3Var17 = hk3Var2.f4426d;
                        th3Var5 = hk3Var2.f4425c;
                        tx0 tx0Var7 = (tx0) hk3Var2.f4424b;
                        pk3Var = (pk3) hk3Var2.f4423a;
                        ResultKt.b(objY);
                        th3VarA2 = th3Var17;
                        tx0Var5 = tx0Var7;
                        objB = objY;
                        b.a1 a1Var42 = (b.a1) objB;
                        tx0Var2 = tx0Var5;
                        th3Var11 = th3VarA2;
                        a1Var2 = a1Var42;
                        if (!(a1Var2 instanceof pu0)) {
                        }
                        break;
                    case 5:
                        th3 th3Var18 = hk3Var2.f4426d;
                        th3Var5 = hk3Var2.f4425c;
                        tx0Var2 = (tx0) hk3Var2.f4424b;
                        pk3Var = (pk3) hk3Var2.f4423a;
                        ResultKt.b(objY);
                        th3Var6 = th3Var18;
                        a1Var2 = (b.a1) objY;
                        th3Var11 = th3Var6;
                        if (!(a1Var2 instanceof pu0)) {
                        }
                        break;
                    case 6:
                        tx0Var = (Closeable) hk3Var2.f4424b;
                        th3Var = (th3) hk3Var2.f4423a;
                        try {
                            ResultKt.b(objY);
                            th3Var12 = tx0Var;
                            tx0Var = th3Var12;
                            Boolean bool522 = Boolean.TRUE;
                            CloseableKt.a(tx0Var, null);
                            return bool522;
                        } catch (Throwable th11) {
                            th = th11;
                            th3VarA2 = th3Var;
                            th3Var4 = tx0Var;
                            timeoutCancellationException2 = th;
                            th3VarA2.b(timeoutCancellationException2);
                            if (!(timeoutCancellationException2 instanceof b.a4)) {
                                if (!(timeoutCancellationException2 instanceof TimeoutCancellationException) && !(timeoutCancellationException2 instanceof CancellationException)) {
                                    th3VarA2.a(timeoutCancellationException2);
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
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable th12) {
                th = th12;
                th3Var2 = r32;
            }
        } catch (Throwable th13) {
            th = th13;
            th3Var = r32;
        }
    }

    @Override // ads_mobile_sdk.kt0, ads_mobile_sdk.cs0, ads_mobile_sdk.et0
    public final Object a(View view, Continuation continuation) {
        return a(this, (RelativeLayout) view, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0099, code lost:
    
        if (t70.m0.y(r8, r9, r0) != r1) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(pk3 pk3Var, RelativeLayout relativeLayout, ContinuationImpl continuationImpl) {
        jk3 jk3Var;
        if (continuationImpl instanceof jk3) {
            jk3Var = (jk3) continuationImpl;
            int i5 = jk3Var.f5289d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jk3Var.f5289d = i5 - Integer.MIN_VALUE;
            } else {
                jk3Var = new jk3(pk3Var, continuationImpl);
            }
        }
        Object obj = jk3Var.f5287b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jk3Var.f5289d;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            jk3Var.f5286a = pk3Var;
            jk3Var.f5289d = 1;
            if (kt0.a(pk3Var, relativeLayout, jk3Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            pk3Var = jk3Var.f5286a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            pk3Var = jk3Var.f5286a;
            ResultKt.b(obj);
            t70.j0 j0Var = pk3Var.f2973d;
            kk3 kk3Var = new kk3(pk3Var, continuation, 0);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(kk3Var, null), 2);
            CoroutineContext coroutineContext = pk3Var.f2972c;
            kk3 kk3Var2 = new kk3(pk3Var, continuation, 1);
            jk3Var.f5286a = null;
            jk3Var.f5289d = 3;
        }
        if (pk3Var.W) {
            tx0 tx0Var = pk3Var.V;
            if (tx0Var != null) {
                et0 et0Var = tx0Var.o;
                if (et0Var != null) {
                    jk3Var.f5286a = pk3Var;
                    jk3Var.f5289d = 2;
                    if (et0Var.a(jk3Var) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
            } else {
                Intrinsics.m("previousWebView");
                throw null;
            }
        }
        t70.j0 j0Var2 = pk3Var.f2973d;
        kk3 kk3Var3 = new kk3(pk3Var, continuation, 0);
        EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var2, "<this>");
        Intrinsics.g(context2, "context");
        m0.t(j0Var2, context2, null, new ar.a(kk3Var3, null), 2);
        CoroutineContext coroutineContext2 = pk3Var.f2972c;
        kk3 kk3Var22 = new kk3(pk3Var, continuation, 1);
        jk3Var.f5286a = null;
        jk3Var.f5289d = 3;
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x01eb  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01f3  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0208  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x020d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0222  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0252  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x028f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, int i5, boolean z12, String str, String str2, String str3, tx0 tx0Var, boolean z13, boolean z14, ContinuationImpl continuationImpl) {
        mk3 mk3Var;
        boolean z15;
        boolean z16;
        int i11;
        boolean z17;
        String str4;
        String str5;
        String str6;
        boolean z18;
        pk3 pk3Var;
        boolean z19;
        boolean z21;
        String str7;
        String str8;
        int i12;
        String str9;
        boolean z22;
        String str10;
        String str11;
        jy0 jy0Var;
        jr0 jr0Var;
        jy0 jy0Var2;
        String str12;
        String str13;
        boolean z23;
        boolean z24;
        pk3 pk3Var2;
        boolean z25;
        boolean z26;
        tx0 tx0Var2;
        boolean z27;
        if (continuationImpl instanceof mk3) {
            mk3Var = (mk3) continuationImpl;
            int i13 = mk3Var.f7261m;
            if ((i13 & Integer.MIN_VALUE) != 0) {
                mk3Var.f7261m = i13 - Integer.MIN_VALUE;
            } else {
                mk3Var = new mk3(this, continuationImpl);
            }
        }
        mk3 mk3Var2 = mk3Var;
        Object objA = mk3Var2.f7259k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i14 = mk3Var2.f7261m;
        if (i14 == 0) {
            ResultKt.b(objA);
            this.X = str;
            this.V = tx0Var;
            fs3 fs3Var = new fs3(es3.f2967d, 0, 0, 14);
            mk3Var2.f7249a = this;
            mk3Var2.f7250b = str;
            mk3Var2.f7251c = str2;
            mk3Var2.f7252d = str3;
            mk3Var2.f7254f = z11;
            mk3Var2.f7258j = i5;
            mk3Var2.f7255g = z12;
            mk3Var2.f7256h = z13;
            mk3Var2.f7257i = z14;
            mk3Var2.f7261m = 1;
            z15 = true;
            z16 = false;
            Object objA2 = sp3.a(this.S, fs3Var, this.R, this.Q, null, null, mk3Var2, 56);
            if (objA2 != coroutineSingletons) {
                i11 = i5;
                z17 = z12;
                str4 = str;
                str5 = str2;
                objA = objA2;
                str6 = str3;
                z18 = z11;
                pk3Var = this;
                z19 = z13;
                z21 = z14;
            }
            return coroutineSingletons;
        }
        if (i14 == 1) {
            z21 = mk3Var2.f7257i;
            z19 = mk3Var2.f7256h;
            z17 = mk3Var2.f7255g;
            i11 = mk3Var2.f7258j;
            z18 = mk3Var2.f7254f;
            str6 = mk3Var2.f7252d;
            str5 = mk3Var2.f7251c;
            str4 = (String) mk3Var2.f7250b;
            pk3Var = mk3Var2.f7249a;
            ResultKt.b(objA);
            z16 = false;
            z15 = true;
        } else {
            if (i14 != 2) {
                if (i14 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z21 = mk3Var2.f7257i;
                z23 = mk3Var2.f7256h;
                z24 = mk3Var2.f7255g;
                i12 = mk3Var2.f7258j;
                z22 = mk3Var2.f7254f;
                jy0Var2 = (jy0) mk3Var2.f7250b;
                pk3Var2 = mk3Var2.f7249a;
                ResultKt.b(objA);
                z15 = true;
                str12 = "context";
                str13 = "<this>";
                if (((Boolean) objA).booleanValue()) {
                    return Unit.f71706a;
                }
                z17 = z24;
                pk3Var = pk3Var2;
                z19 = z23;
                jy0 jy0Var3 = jy0Var2;
                if (z17) {
                    tx0 tx0Var3 = pk3Var.V;
                    if (tx0Var3 != null) {
                        if (!tx0Var3.n.get()) {
                            z25 = z15;
                        }
                    } else {
                        Intrinsics.m("previousWebView");
                        throw null;
                    }
                } else {
                    z25 = false;
                }
                pk3Var.O = z25;
                if (z21) {
                    tx0 tx0Var4 = pk3Var.V;
                    if (tx0Var4 != null) {
                        if (!tx0Var4.n.get()) {
                            z26 = z15;
                        }
                    } else {
                        Intrinsics.m("previousWebView");
                        throw null;
                    }
                } else {
                    z26 = false;
                }
                pk3Var.W = z26;
                tx0Var2 = pk3Var.V;
                if (tx0Var2 == null) {
                    if (tx0Var2.n.get()) {
                        z27 = false;
                    } else {
                        tx0 tx0Var5 = pk3Var.V;
                        if (tx0Var5 != null) {
                            if (!Intrinsics.b(tx0Var5.e(), new fs3(es3.f2967d, 0, 0, 14))) {
                                z27 = z15;
                            }
                        } else {
                            Intrinsics.m("previousWebView");
                            throw null;
                        }
                    }
                    pk3Var.P = z27;
                    pk3Var.f2986s = z22;
                    pk3Var.J = i12;
                    pk3Var.f2988u = false;
                    pk3Var.f2990w = z19;
                    Object objB = pk3Var.M.b();
                    if (objB == null) {
                        objB = pk3Var.f2970a;
                    }
                    Intrinsics.g(jy0Var3, "<set-?>");
                    pk3Var.f2984q = jy0Var3;
                    pk3Var.G = jy0Var3;
                    t70.j0 j0Var = pk3Var.f2971b;
                    d dVar = new d(pk3Var, objB, null, 7);
                    EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, str13);
                    Intrinsics.g(emptyCoroutineContext, str12);
                    m0.t(j0Var, emptyCoroutineContext, null, new ar.a(dVar, null), 2);
                    return Unit.f71706a;
                }
                Intrinsics.m("previousWebView");
                throw null;
            }
            z21 = mk3Var2.f7257i;
            z19 = mk3Var2.f7256h;
            boolean z28 = mk3Var2.f7255g;
            int i15 = mk3Var2.f7258j;
            boolean z29 = mk3Var2.f7254f;
            jy0Var = mk3Var2.f7253e;
            str11 = mk3Var2.f7252d;
            str9 = mk3Var2.f7251c;
            str10 = (String) mk3Var2.f7250b;
            pk3Var = mk3Var2.f7249a;
            ResultKt.b(objA);
            z22 = z29;
            z17 = z28;
            i12 = i15;
            str7 = "context";
            str8 = "<this>";
            z15 = true;
            if (str10 != null && str9 == null) {
                zi3.a(6, "Cannot open two piece expandable with no url or html", null);
                return Unit.f71706a;
            }
            jr0Var = pk3Var.f2974e;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:should_show_two_piece_activity_before_load", Boolean.TRUE, jn.a$10)).booleanValue()) {
                t70.j0 j0Var2 = pk3Var.f2973d;
                jy0 jy0Var4 = jy0Var;
                b1 b1Var = new b1(pk3Var, jy0Var4, str10, str9, str11, (Continuation) null, 4);
                jy0Var2 = jy0Var4;
                EmptyCoroutineContext emptyCoroutineContext2 = EmptyCoroutineContext.f71803a;
                str13 = str8;
                Intrinsics.g(j0Var2, str13);
                str12 = str7;
                Intrinsics.g(emptyCoroutineContext2, str12);
                m0.t(j0Var2, emptyCoroutineContext2, null, new ar.a(b1Var, null), 2);
                jy0 jy0Var32 = jy0Var2;
                if (z17) {
                }
                pk3Var.O = z25;
                if (z21) {
                }
                pk3Var.W = z26;
                tx0Var2 = pk3Var.V;
                if (tx0Var2 == null) {
                }
            } else {
                String str14 = str11;
                jy0Var2 = jy0Var;
                String str15 = str9;
                String str16 = str10;
                str12 = str7;
                str13 = str8;
                tx0 tx0Var6 = jy0Var2.f5452a;
                mk3Var2.f7249a = pk3Var;
                mk3Var2.f7250b = jy0Var2;
                mk3Var2.f7251c = null;
                mk3Var2.f7252d = null;
                mk3Var2.f7253e = null;
                mk3Var2.f7254f = z22;
                mk3Var2.f7258j = i12;
                mk3Var2.f7255g = z17;
                mk3Var2.f7256h = z19;
                mk3Var2.f7257i = z21;
                mk3Var2.f7261m = 3;
                objA = pk3Var.a(tx0Var6, str16, str15, str14, mk3Var2);
                if (objA != coroutineSingletons) {
                    z23 = z19;
                    z24 = z17;
                    pk3Var2 = pk3Var;
                    if (((Boolean) objA).booleanValue()) {
                    }
                }
                return coroutineSingletons;
            }
        }
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            zi3.a((pu0) a1Var, z16);
            return Unit.f71706a;
        }
        if (a1Var instanceof xu0) {
            jy0 jy0Var5 = (jy0) ((xu0) a1Var).f11834b;
            tx0 tx0Var7 = jy0Var5.f5452a;
            o0 o0Var = pk3Var.T;
            str7 = "context";
            b.u7 u7VarC = tx0Var7.c();
            str8 = "<this>";
            p5 nh0Var = u7VarC instanceof p5 ? (p5) u7VarC : null;
            if (nh0Var == null) {
                nh0Var = new nh0(tx0Var7);
            }
            mk3Var2.f7249a = pk3Var;
            mk3Var2.f7250b = str4;
            mk3Var2.f7251c = str5;
            mk3Var2.f7252d = str6;
            mk3Var2.f7253e = jy0Var5;
            mk3Var2.f7254f = z18;
            mk3Var2.f7258j = i11;
            mk3Var2.f7255g = z17;
            mk3Var2.f7256h = z19;
            mk3Var2.f7257i = z21;
            mk3Var2.f7261m = 2;
            if (o0Var.a(nh0Var, mk3Var2) != coroutineSingletons) {
                String str17 = str5;
                i12 = i11;
                str9 = str17;
                String str18 = str4;
                z22 = z18;
                str10 = str18;
                str11 = str6;
                jy0Var = jy0Var5;
                if (str10 != null) {
                }
                jr0Var = pk3Var.f2974e;
                jr0Var.getClass();
                if (!((Boolean) jr0Var.a("gads:should_show_two_piece_activity_before_load", Boolean.TRUE, jn.a$10)).booleanValue()) {
                }
            }
            return coroutineSingletons;
        }
        throw new NoWhenBranchMatchedException();
    }
}
