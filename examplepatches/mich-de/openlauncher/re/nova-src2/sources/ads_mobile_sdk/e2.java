package ads_mobile_sdk;

import b.h7;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.p0;
import t70.p2;

/* loaded from: classes.dex */
public abstract class e2 implements b.b {

    /* renamed from: a, reason: collision with root package name */
    public final mi3 f2706a;

    /* renamed from: b, reason: collision with root package name */
    public final ni.q f2707b;

    /* renamed from: c, reason: collision with root package name */
    public final qw2 f2708c;

    /* renamed from: d, reason: collision with root package name */
    public final long f2709d;

    /* renamed from: e, reason: collision with root package name */
    public final int f2710e;

    /* renamed from: f, reason: collision with root package name */
    public final z1 f2711f;

    /* renamed from: g, reason: collision with root package name */
    public final hv f2712g;

    /* renamed from: h, reason: collision with root package name */
    public final d33 f2713h;

    /* renamed from: i, reason: collision with root package name */
    public final String f2714i;

    /* renamed from: j, reason: collision with root package name */
    public final eg2 f2715j;

    /* renamed from: k, reason: collision with root package name */
    public final m31 f2716k;

    public /* synthetic */ e2(mi3 mi3Var, ni.q qVar, qw2 qw2Var, long j11, int i5, z1 z1Var, hv hvVar, d33 d33Var, String str, eg2 eg2Var) {
        this(mi3Var, qVar, qw2Var, j11, i5, z1Var, hvVar, d33Var, str, eg2Var, new m31());
    }

    public final h7 a(h7 componentBuilder, boolean z11) {
        Intrinsics.g(componentBuilder, "componentBuilder");
        h7 h7Var = (h7) ((h7) ((h7) componentBuilder.a(this.f2711f)).a(this.f2712g)).a(this.f2713h);
        mi3 mi3Var = this.f2706a;
        return (h7) ((h7) ((h7) ((h7) ((h7) ((h7) ((h7) ((h7) ((h7) ((h7) ((h7) h7Var.a(mi3Var.f7224a)).a(mi3Var.f7225b)).a(mi3Var.f7226c)).a(mi3Var.f7227d)).a(this.f2708c)).a(this.f2707b)).a(this.f2709d)).a(z11)).a(this.f2710e)).a(this.f2715j)).a(this.f2716k);
    }

    public abstract Object a(boolean z11, Continuation continuation);

    public e2(mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String uniqueRenderId, eg2 placementIdWrapper, m31 m31Var) {
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(uniqueRenderId, "uniqueRenderId");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        this.f2706a = traceMetaSet;
        this.f2707b = baseRequest;
        this.f2708c = requestType;
        this.f2709d = j11;
        this.f2710e = i5;
        this.f2711f = adConfiguration;
        this.f2712g = commonConfiguration;
        this.f2713h = serverTransaction;
        this.f2714i = uniqueRenderId;
        this.f2715j = placementIdWrapper;
        this.f2716k = m31Var;
    }

    /* JADX WARN: Code restructure failed: missing block: B:70:0x00d1, code lost:
    
        if (r7 == r1) goto L71;
     */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0093 A[Catch: all -> 0x009f, TryCatch #3 {all -> 0x009f, blocks: (B:42:0x008c, B:44:0x0093, B:46:0x0097, B:48:0x009b, B:51:0x00a1, B:53:0x00a5, B:55:0x00a9, B:57:0x00ad, B:58:0x00ae, B:59:0x00b3, B:60:0x00b4, B:61:0x00bb, B:62:0x00bc, B:63:0x00c3, B:64:0x00c4), top: B:92:0x008c, outer: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00c4 A[Catch: all -> 0x009f, TRY_LEAVE, TryCatch #3 {all -> 0x009f, blocks: (B:42:0x008c, B:44:0x0093, B:46:0x0097, B:48:0x009b, B:51:0x00a1, B:53:0x00a5, B:55:0x00a9, B:57:0x00ad, B:58:0x00ae, B:59:0x00b3, B:60:0x00b4, B:61:0x00bb, B:62:0x00bc, B:63:0x00c3, B:64:0x00c4), top: B:92:0x008c, outer: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        b2 b2Var;
        th3 th3Var;
        TimeoutCancellationException th2;
        th3 th3Var2;
        String strA;
        if (continuationImpl instanceof b2) {
            b2Var = (b2) continuationImpl;
            int i5 = b2Var.f1234e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b2Var.f1234e = i5 - Integer.MIN_VALUE;
            } else {
                b2Var = new b2(this, continuationImpl);
            }
        }
        Object objL = b2Var.f1232c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b2Var.f1234e;
        try {
            if (i11 == 0) {
                ResultKt.b(objL);
                k61 k61Var = this.f2711f.I;
                if (k61Var == null) {
                    return new tu0("First party ad configuration has no inline ad field.", wd1.f11213a);
                }
                p0 p0Var = k61Var.f5520b;
                if (p0Var != null) {
                    this.f2706a.f7226c.f10111h = true;
                    if (p0Var.b()) {
                        wv0 wv0Var = wv0.CUI_NAME_ADREQUEST_WAIT_FOR_RESPONSE;
                        WeakHashMap weakHashMap = ji3.f5253a;
                        th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
                        try {
                            b2Var.f1230a = th3VarA;
                            b2Var.f1231b = th3VarA;
                            b2Var.f1234e = 1;
                            Object objL2 = p0Var.l(b2Var);
                            if (objL2 != coroutineSingletons) {
                                th3Var = th3VarA;
                                objL = objL2;
                                th3Var2 = th3Var;
                                strA = ww2.a((ww2) objL);
                                CloseableKt.a(th3Var, null);
                            }
                        } catch (Throwable th3) {
                            th3Var = th3VarA;
                            th2 = th3;
                            th3Var2 = th3Var;
                            th3Var2.b(th2);
                            if (th2 instanceof b.a4) {
                                if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                    th3Var2.a(th2);
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
                        }
                    } else {
                        b2Var.f1234e = 2;
                        objL = p0Var.l(b2Var);
                    }
                    return coroutineSingletons;
                }
                String str = k61Var.f5519a;
                if (str == null) {
                    return new tu0("First party ad configuration has no body.", wd1.f11213a);
                }
                return new xu0(str);
            }
            if (i11 == 1) {
                th3Var = b2Var.f1231b;
                th3Var2 = b2Var.f1230a;
                try {
                    ResultKt.b(objL);
                    strA = ww2.a((ww2) objL);
                    CloseableKt.a(th3Var, null);
                } catch (Throwable th4) {
                    th2 = th4;
                    try {
                        th3Var2.b(th2);
                        if (th2 instanceof b.a4) {
                        }
                    } finally {
                    }
                }
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objL);
                strA = ww2.a((ww2) objL);
            }
            if (r70.k.U0(strA)) {
                return new tu0("First party ad configuration has an empty body.", wd1.f11213a);
            }
            return new xu0(strA);
        } catch (Exception e3) {
            return new qu0(e3, wd1.f11217e, null, 4);
        }
    }

    @Override // b.b
    public final Object a(String str, int i5, ContinuationImpl continuationImpl) {
        return a(this, str, i5, continuationImpl);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00c5 A[Catch: all -> 0x0091, TRY_LEAVE, TryCatch #0 {all -> 0x0091, blocks: (B:32:0x008e, B:47:0x00c1, B:49:0x00c5, B:46:0x00a2), top: B:80:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00d7 A[Catch: all -> 0x00e3, TryCatch #1 {all -> 0x00e3, blocks: (B:53:0x00d0, B:55:0x00d7, B:57:0x00db, B:59:0x00df, B:62:0x00e5, B:64:0x00e9, B:66:0x00ed, B:68:0x00f1, B:69:0x00f2, B:70:0x00f7, B:71:0x00f8, B:72:0x00ff, B:73:0x0100, B:74:0x0107, B:75:0x0108), top: B:82:0x00d0 }] */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0108 A[Catch: all -> 0x00e3, TRY_LEAVE, TryCatch #1 {all -> 0x00e3, blocks: (B:53:0x00d0, B:55:0x00d7, B:57:0x00db, B:59:0x00df, B:62:0x00e5, B:64:0x00e9, B:66:0x00ed, B:68:0x00f1, B:69:0x00f2, B:70:0x00f7, B:71:0x00f8, B:72:0x00ff, B:73:0x0100, B:74:0x0107, B:75:0x0108), top: B:82:0x00d0 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r10v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r10v1 */
    /* JADX WARN: Type inference failed for: r10v10 */
    /* JADX WARN: Type inference failed for: r10v16 */
    /* JADX WARN: Type inference failed for: r10v19 */
    /* JADX WARN: Type inference failed for: r10v2, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r10v21 */
    /* JADX WARN: Type inference failed for: r10v22 */
    /* JADX WARN: Type inference failed for: r10v23 */
    /* JADX WARN: Type inference failed for: r10v25, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r10v26 */
    /* JADX WARN: Type inference failed for: r10v27 */
    /* JADX WARN: Type inference failed for: r10v28 */
    /* JADX WARN: Type inference failed for: r12v1, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r12v10, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r12v16 */
    /* JADX WARN: Type inference failed for: r12v17 */
    /* JADX WARN: Type inference failed for: r12v2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(e2 e2Var, String str, int i5, ContinuationImpl continuationImpl) {
        c2 c2Var;
        TimeoutCancellationException th2;
        th3 th3Var;
        th3 th3VarA;
        TimeoutCancellationException e3;
        Object obj;
        b.a1 yu0Var;
        mi3 mi3Var = e2Var.f2706a;
        if (continuationImpl instanceof c2) {
            c2Var = (c2) continuationImpl;
            int i11 = c2Var.f1631f;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                c2Var.f1631f = i11 - Integer.MIN_VALUE;
            } else {
                c2Var = new c2(e2Var, continuationImpl);
            }
        }
        ?? r12 = c2Var.f1629d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = c2Var.f1631f;
        Continuation continuation = null;
        try {
            if (i12 == 0) {
                ResultKt.b(r12);
                WeakHashMap weakHashMap = ji3.f5253a;
                th3VarA = ji3.a(wv0.CUI_NAME_ADREQUEST_MEDIATION_ADAPTER, EmptyList.f71733a, true);
                try {
                    th3 th3VarA2 = ji3.a();
                    z1 z1Var = e2Var.f2711f;
                    th3VarA2.a(mi3Var);
                    tu2 tu2Var = mi3Var.f7226c;
                    tu2Var.f10104a = e2Var.f2714i;
                    tu2Var.f10106c = str;
                    tu2Var.f10105b = i5;
                    tu2Var.f10107d = z1Var.f12377f;
                    tu2Var.f10110g = z1Var.f12404t0 != null;
                    try {
                        long j11 = z1Var.f12374d0;
                        a60.a aVar = new a60.a(e2Var, continuation, 5);
                        try {
                            c2Var.f1626a = e2Var;
                            c2Var.f1627b = th3VarA;
                            c2Var.f1628c = th3VarA;
                            c2Var.f1631f = 1;
                            Object objC = p2.c(j11, aVar, c2Var);
                            if (objC == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                            obj = objC;
                            str = th3VarA;
                            th3VarA = th3VarA;
                            yu0Var = (b.a1) obj;
                            str = str;
                            r12 = th3VarA;
                        } catch (Throwable th3) {
                            th = th3;
                            th2 = th;
                            th3Var = th3VarA;
                            str = th3Var;
                            str.b(th2);
                            if (th2 instanceof b.a4) {
                                if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                    str.a(th2);
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
                        }
                    } catch (TimeoutCancellationException e11) {
                        e3 = e11;
                        str = th3VarA;
                        yu0Var = new yu0("Timed out while waiting " + Duration.r(e2Var.f2711f.f12374d0) + " for rendering.", e3);
                        str = str;
                        r12 = th3VarA;
                        if (yu0Var instanceof pu0) {
                        }
                        CloseableKt.a(r12, null);
                        return yu0Var;
                    }
                } catch (Throwable th4) {
                    th = th4;
                }
            } else {
                if (i12 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                th3Var = c2Var.f1628c;
                str = c2Var.f1627b;
                e2 e2Var2 = c2Var.f1626a;
                try {
                    ResultKt.b(r12);
                    th3VarA = th3Var;
                    e2Var = e2Var2;
                    obj = r12;
                    str = str;
                    try {
                        yu0Var = (b.a1) obj;
                        str = str;
                        r12 = th3VarA;
                    } catch (TimeoutCancellationException e12) {
                        e3 = e12;
                        yu0Var = new yu0("Timed out while waiting " + Duration.r(e2Var.f2711f.f12374d0) + " for rendering.", e3);
                        str = str;
                        r12 = th3VarA;
                        if (yu0Var instanceof pu0) {
                        }
                        CloseableKt.a(r12, null);
                        return yu0Var;
                    }
                } catch (TimeoutCancellationException e13) {
                    th3VarA = th3Var;
                    e2Var = e2Var2;
                    e3 = e13;
                    yu0Var = new yu0("Timed out while waiting " + Duration.r(e2Var.f2711f.f12374d0) + " for rendering.", e3);
                    str = str;
                    r12 = th3VarA;
                    if (yu0Var instanceof pu0) {
                    }
                    CloseableKt.a(r12, null);
                    return yu0Var;
                } catch (Throwable th5) {
                    th2 = th5;
                    try {
                        str.b(th2);
                        if (th2 instanceof b.a4) {
                        }
                    } finally {
                    }
                }
            }
            if (yu0Var instanceof pu0) {
                zi3.a((pu0) yu0Var, false);
            }
            CloseableKt.a(r12, null);
            return yu0Var;
        } catch (Throwable th6) {
            th2 = th6;
            th3Var = r12;
        }
    }
}
