package ads_mobile_sdk;

import android.view.View;
import android.webkit.WebView;
import b.ed;
import c80.d;
import f1.t;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m72 extends o50.j {

    /* renamed from: c, reason: collision with root package name */
    public final x52 f7031c;

    /* renamed from: d, reason: collision with root package name */
    public final z1 f7032d;

    /* renamed from: e, reason: collision with root package name */
    public final d f7033e;

    /* renamed from: f, reason: collision with root package name */
    public dj1 f7034f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m72(x52 omid, z1 adConfiguration, jr0 flags, CoroutineContext uiContext) {
        super(flags, uiContext);
        Intrinsics.g(omid, "omid");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(uiContext, "uiContext");
        this.f7031c = omid;
        this.f7032d = adConfiguration;
        this.f7033e = new d();
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0082, code lost:
    
        if (r8.a$1(r7, r1) == r2) goto L29;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r14v0, types: [ads_mobile_sdk.m72, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r14v1 */
    /* JADX WARN: Type inference failed for: r14v11 */
    /* JADX WARN: Type inference failed for: r14v12 */
    /* JADX WARN: Type inference failed for: r14v13 */
    /* JADX WARN: Type inference failed for: r14v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(m72 m72Var, View view, xr0 xr0Var, ContinuationImpl continuationImpl) {
        d72 d72Var;
        m72 m72Var2;
        View view2;
        d dVar;
        xr0 xr0Var2;
        if (continuationImpl instanceof d72) {
            d72Var = (d72) continuationImpl;
            int i5 = d72Var.f2206h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d72Var.f2206h = i5 - Integer.MIN_VALUE;
            } else {
                d72Var = new d72(m72Var, continuationImpl);
            }
        }
        Object obj = d72Var.f2204f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d72Var.f2206h;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = m72Var.f7033e;
                d72Var.f2200a = m72Var;
                d72Var.f2201b = view;
                d72Var.f2202c = xr0Var;
                d72Var.f2203e = dVar2;
                d72Var.f2206h = 1;
                if (dVar2.e(d72Var) != coroutineSingletons) {
                    m72Var2 = m72Var;
                    view2 = view;
                    dVar = dVar2;
                    xr0Var2 = xr0Var;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c80.a aVar = (c80.a) d72Var.f2200a;
                ResultKt.b(obj);
                m72Var = aVar;
                return Unit.f71706a;
            }
            d dVar3 = d72Var.f2203e;
            xr0 xr0Var3 = d72Var.f2202c;
            View view3 = d72Var.f2201b;
            m72 m72Var3 = (m72) d72Var.f2200a;
            ResultKt.b(obj);
            xr0Var2 = xr0Var3;
            view2 = view3;
            m72Var2 = m72Var3;
            dVar = dVar3;
            dj1 dj1Var = m72Var2.f7034f;
            if (dj1Var == null) {
                m72Var = dVar;
            } else {
                e20.j0 j0Var = new e20.j0(m72Var2, dj1Var, view2, xr0Var2, null, 1);
                d72Var.f2200a = dVar;
                d72Var.f2201b = null;
                d72Var.f2202c = null;
                d72Var.f2203e = null;
                d72Var.f2206h = 2;
                m72Var = dVar;
            }
            return Unit.f71706a;
        } finally {
            ((d) m72Var).g(null);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.m72] */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v13 */
    /* JADX WARN: Type inference failed for: r11v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(m72 m72Var, b.j7 j7Var, ContinuationImpl continuationImpl) {
        f72 f72Var;
        m72 m72Var2;
        d dVar;
        Unit unit;
        m72 m72Var3;
        d dVar2;
        if (continuationImpl instanceof f72) {
            f72Var = (f72) continuationImpl;
            int i5 = f72Var.f3238f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f72Var.f3238f = i5 - Integer.MIN_VALUE;
            } else {
                f72Var = new f72(m72Var, continuationImpl);
            }
        }
        Object obj = f72Var.f3236d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f72Var.f3238f;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar3 = m72Var.f7033e;
                f72Var.f3233a = m72Var;
                f72Var.f3234b = j7Var;
                f72Var.f3235c = dVar3;
                f72Var.f3238f = 1;
                if (dVar3.e(f72Var) != coroutineSingletons) {
                    m72Var2 = m72Var;
                    dVar = dVar3;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c80.a aVar = (c80.a) f72Var.f3234b;
                m72Var3 = f72Var.f3233a;
                ResultKt.b(obj);
                m72Var = aVar;
                m72Var3.f7034f = null;
                unit = Unit.f71706a;
                dVar2 = m72Var;
                return unit;
            }
            d dVar4 = f72Var.f3235c;
            j7Var = (b.j7) f72Var.f3234b;
            m72 m72Var4 = f72Var.f3233a;
            ResultKt.b(obj);
            m72Var2 = m72Var4;
            dVar = dVar4;
            b.j7 j7Var2 = j7Var;
            dj1 dj1Var = m72Var2.f7034f;
            if (dj1Var == null) {
                unit = null;
                dVar2 = dVar;
                return unit;
            }
            e20.l0 l0Var = new e20.l0(m72Var2, dj1Var, j7Var2, continuation, 1);
            f72Var.f3233a = m72Var2;
            f72Var.f3234b = dVar;
            f72Var.f3235c = null;
            f72Var.f3238f = 2;
            if (m72Var2.a$1(l0Var, f72Var) != coroutineSingletons) {
                m72Var3 = m72Var2;
                m72Var = dVar;
                m72Var3.f7034f = null;
                unit = Unit.f71706a;
                dVar2 = m72Var;
                return unit;
            }
            return coroutineSingletons;
        } finally {
            ((d) m72Var).g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0076, code lost:
    
        if (r7.a$1(r5, r0) == r1) goto L30;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.m72, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v11 */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v13 */
    /* JADX WARN: Type inference failed for: r11v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(m72 m72Var, jy0 jy0Var, ContinuationImpl continuationImpl) {
        h72 h72Var;
        m72 m72Var2;
        d dVar;
        if (continuationImpl instanceof h72) {
            h72Var = (h72) continuationImpl;
            int i5 = h72Var.f4240f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h72Var.f4240f = i5 - Integer.MIN_VALUE;
            } else {
                h72Var = new h72(m72Var, continuationImpl);
            }
        }
        Object obj = h72Var.f4238d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h72Var.f4240f;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = m72Var.f7033e;
                h72Var.f4235a = m72Var;
                h72Var.f4236b = jy0Var;
                h72Var.f4237c = dVar2;
                h72Var.f4240f = 1;
                if (dVar2.e(h72Var) != coroutineSingletons) {
                    m72Var2 = m72Var;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c80.a aVar = (c80.a) h72Var.f4235a;
                ResultKt.b(obj);
                m72Var = aVar;
                Unit unit = Unit.f71706a;
                ((d) m72Var).g(null);
                return unit;
            }
            d dVar3 = h72Var.f4237c;
            jy0Var = h72Var.f4236b;
            m72 m72Var3 = (m72) h72Var.f4235a;
            ResultKt.b(obj);
            m72Var2 = m72Var3;
            dVar = dVar3;
            jy0 jy0Var2 = jy0Var;
            dj1 dj1Var = m72Var2.f7034f;
            if (dj1Var == null) {
                m72Var = dVar;
            } else {
                t tVar = new t(jy0Var2, m72Var2, dj1Var, continuation, 1);
                h72Var.f4235a = dVar;
                h72Var.f4236b = null;
                h72Var.f4237c = null;
                h72Var.f4240f = 2;
                m72Var = dVar;
            }
            Unit unit2 = Unit.f71706a;
            ((d) m72Var).g(null);
            return unit2;
        } catch (Throwable th2) {
            ((d) m72Var).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(m72 m72Var, ContinuationImpl continuationImpl) {
        j72 j72Var;
        d dVar;
        if (continuationImpl instanceof j72) {
            j72Var = (j72) continuationImpl;
            int i5 = j72Var.f5152e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j72Var.f5152e = i5 - Integer.MIN_VALUE;
            } else {
                j72Var = new j72(m72Var, continuationImpl);
            }
        }
        Object obj = j72Var.f5150c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j72Var.f5152e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = m72Var.f7033e;
            j72Var.f5148a = m72Var;
            j72Var.f5149b = dVar;
            j72Var.f5152e = 1;
            if (dVar.e(j72Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = j72Var.f5149b;
            m72 m72Var2 = j72Var.f5148a;
            ResultKt.b(obj);
            dVar = dVar2;
            m72Var = m72Var2;
        }
        try {
            if (m72Var.f7034f == null) {
                z11 = false;
            }
            return Boolean.valueOf(z11);
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r10v11, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r10v12 */
    /* JADX WARN: Type inference failed for: r10v3 */
    /* JADX WARN: Type inference failed for: r10v4 */
    /* JADX WARN: Type inference failed for: r10v5 */
    /* JADX WARN: Type inference failed for: r10v8, types: [android.webkit.WebView] */
    /* JADX WARN: Type inference failed for: r9v11, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(m72 m72Var, tx0 tx0Var, boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        k72 k72Var;
        d dVar;
        tx0 tx0Var2;
        Boolean boolValueOf;
        ?? r102;
        m72 m72Var2;
        if (continuationImpl instanceof k72) {
            k72Var = (k72) continuationImpl;
            int i5 = k72Var.f5544g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k72Var.f5544g = i5 - Integer.MIN_VALUE;
            } else {
                k72Var = new k72(m72Var, continuationImpl);
            }
        }
        Object obj = k72Var.f5542e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k72Var.f5544g;
        boolean z12 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = m72Var.f7033e;
                k72Var.f5538a = m72Var;
                k72Var.f5539b = tx0Var;
                k72Var.f5540c = dVar;
                k72Var.f5541d = z11;
                k72Var.f5544g = 1;
                tx0Var2 = tx0Var;
                if (dVar.e(k72Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                m72Var = (m72) k72Var.f5540c;
                r102 = (c80.a) k72Var.f5539b;
                m72Var2 = k72Var.f5538a;
                try {
                    ResultKt.b(obj);
                    r102 = r102;
                    m72Var.f7034f = (dj1) obj;
                    if (m72Var2.f7034f != null) {
                        z12 = false;
                    }
                    Boolean boolValueOf2 = Boolean.valueOf(z12);
                    ((d) r102).g(null);
                    return boolValueOf2;
                } catch (Throwable th2) {
                    th = th2;
                    dVar = r102;
                    dVar.g(null);
                    throw th;
                }
            }
            z11 = k72Var.f5541d;
            ?? r92 = (c80.a) k72Var.f5540c;
            ?? r103 = (WebView) k72Var.f5539b;
            m72 m72Var3 = k72Var.f5538a;
            ResultKt.b(obj);
            dVar = r92;
            m72Var = m72Var3;
            tx0Var2 = r103;
            if (m72Var.f7032d.O) {
                ci3 ci3Var = m72Var.f7031c.f11580f;
                ci3Var.getClass();
                try {
                    boolValueOf = Boolean.valueOf(ed.f15830r.f17888a);
                } catch (Exception e3) {
                    ci3Var.a("IsActive", (Throwable) e3);
                    boolValueOf = null;
                }
                if (boolValueOf != null && boolValueOf.booleanValue() && m72Var.f7032d.S.f8519c) {
                    jr0 jr0Var = (jr0) m72Var.f79577b;
                    jr0Var.getClass();
                    if (((Boolean) jr0Var.a("gads:omid_javascript_session_service:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                        if (m72Var.f7034f != null) {
                            mu0.c("Already started javascript session service", null);
                        } else {
                            l72 l72Var = new l72(m72Var, tx0Var2, z11, null);
                            k72Var.f5538a = m72Var;
                            k72Var.f5539b = dVar;
                            k72Var.f5540c = m72Var;
                            k72Var.f5544g = 2;
                            Object objA$1 = m72Var.a$1(l72Var, k72Var);
                            if (objA$1 != coroutineSingletons) {
                                d dVar2 = dVar;
                                obj = objA$1;
                                r102 = dVar2;
                                m72Var2 = m72Var;
                                m72Var.f7034f = (dj1) obj;
                                if (m72Var2.f7034f != null) {
                                }
                                Boolean boolValueOf22 = Boolean.valueOf(z12);
                                ((d) r102).g(null);
                                return boolValueOf22;
                            }
                            return coroutineSingletons;
                        }
                    }
                }
            }
            Boolean bool = Boolean.FALSE;
            dVar.g(null);
            return bool;
        } catch (Throwable th3) {
            th = th3;
            dVar.g(null);
            throw th;
        }
    }
}
