package ads_mobile_sdk;

import android.view.View;
import android.view.ViewGroup;
import b.b9;
import c80.d;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class w62 extends o50.j implements b9 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f11070c;

    /* renamed from: d, reason: collision with root package name */
    public final z1 f11071d;

    /* renamed from: e, reason: collision with root package name */
    public final x52 f11072e;

    /* renamed from: f, reason: collision with root package name */
    public final jy0 f11073f;

    /* renamed from: g, reason: collision with root package name */
    public final m72 f11074g;

    /* renamed from: h, reason: collision with root package name */
    public final d f11075h;

    /* renamed from: i, reason: collision with root package name */
    public b.v3 f11076i;

    /* renamed from: j, reason: collision with root package name */
    public final List f11077j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w62(CoroutineContext uiContext, t70.j0 uiScope, z1 adConfiguration, x52 omid, jy0 webViewContainer, m72 omidJavaScriptSessionService, jr0 flags) {
        super(flags, uiContext);
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(omid, "omid");
        Intrinsics.g(webViewContainer, "webViewContainer");
        Intrinsics.g(omidJavaScriptSessionService, "omidJavaScriptSessionService");
        Intrinsics.g(flags, "flags");
        this.f11070c = uiScope;
        this.f11071d = adConfiguration;
        this.f11072e = omid;
        this.f11073f = webViewContainer;
        this.f11074g = omidJavaScriptSessionService;
        this.f11075h = new d();
        this.f11077j = Collections.synchronizedList(new ArrayList());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v17, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r7v19 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(w62 w62Var, ContinuationImpl continuationImpl) throws Throwable {
        p62 p62Var;
        d dVar;
        d dVar2;
        ?? r72;
        if (continuationImpl instanceof p62) {
            p62Var = (p62) continuationImpl;
            int i5 = p62Var.f8117e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                p62Var.f8117e = i5 - Integer.MIN_VALUE;
            } else {
                p62Var = new p62(w62Var, continuationImpl);
            }
        }
        Object obj = p62Var.f8115c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = p62Var.f8117e;
        boolean z11 = true;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = w62Var.f11075h;
                p62Var.f8113a = w62Var;
                p62Var.f8114b = dVar;
                p62Var.f8117e = 1;
                if (dVar.e(p62Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r72 = (c80.a) p62Var.f8113a;
                try {
                    ResultKt.b(obj);
                    dVar2 = r72;
                    if (((Boolean) obj).booleanValue()) {
                        z11 = false;
                        r72 = dVar2;
                        Boolean boolValueOf = Boolean.valueOf(z11);
                        ((d) r72).g(null);
                        return boolValueOf;
                    }
                    dVar = dVar2;
                    r72 = dVar;
                    Boolean boolValueOf2 = Boolean.valueOf(z11);
                    ((d) r72).g(null);
                    return boolValueOf2;
                } catch (Throwable th2) {
                    dVar = r72;
                    th = th2;
                    dVar.g(null);
                    throw th;
                }
            }
            d dVar3 = p62Var.f8114b;
            w62 w62Var2 = (w62) p62Var.f8113a;
            ResultKt.b(obj);
            dVar = dVar3;
            w62Var = w62Var2;
            if (w62Var.f11076i == null) {
                m72 m72Var = w62Var.f11074g;
                p62Var.f8113a = dVar;
                p62Var.f8114b = null;
                p62Var.f8117e = 2;
                m72Var.getClass();
                Object objA = m72.a(m72Var, p62Var);
                if (objA != coroutineSingletons) {
                    d dVar4 = dVar;
                    obj = objA;
                    dVar2 = dVar4;
                    if (((Boolean) obj).booleanValue()) {
                    }
                }
                return coroutineSingletons;
            }
            r72 = dVar;
            Boolean boolValueOf22 = Boolean.valueOf(z11);
            ((d) r72).g(null);
            return boolValueOf22;
        } catch (Throwable th3) {
            th = th3;
            dVar.g(null);
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x007f, code lost:
    
        if (r7.a$1(r6, r1) == r2) goto L30;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r12v0, types: [ads_mobile_sdk.w62, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r12v1 */
    /* JADX WARN: Type inference failed for: r12v11 */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v13 */
    /* JADX WARN: Type inference failed for: r12v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(w62 w62Var, ContinuationImpl continuationImpl) {
        q62 q62Var;
        w62 w62Var2;
        d dVar;
        if (continuationImpl instanceof q62) {
            q62Var = (q62) continuationImpl;
            int i5 = q62Var.f8502e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q62Var.f8502e = i5 - Integer.MIN_VALUE;
            } else {
                q62Var = new q62(w62Var, continuationImpl);
            }
        }
        Object obj = q62Var.f8500c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q62Var.f8502e;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                d dVar2 = w62Var.f11075h;
                q62Var.f8498a = w62Var;
                q62Var.f8499b = dVar2;
                q62Var.f8502e = 1;
                if (dVar2.e(q62Var) != coroutineSingletons) {
                    w62Var2 = w62Var;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c80.a aVar = (c80.a) q62Var.f8498a;
                ResultKt.b(obj);
                w62Var = aVar;
                Unit unit = Unit.f71706a;
                ((d) w62Var).g(null);
                return unit;
            }
            d dVar3 = q62Var.f8499b;
            w62 w62Var3 = (w62) q62Var.f8498a;
            ResultKt.b(obj);
            w62Var2 = w62Var3;
            dVar = dVar3;
            b.v3 v3Var = w62Var2.f11076i;
            List omidRegisteredViews = w62Var2.f11077j;
            w62Var = dVar;
            if (v3Var != null) {
                Intrinsics.f(omidRegisteredViews, "omidRegisteredViews");
                b70.d.I0(omidRegisteredViews);
                View view = (View) b70.g.i1(omidRegisteredViews);
                if (view == null) {
                    view = w62Var2.f11073f;
                }
                r62 r62Var = new r62(w62Var2, v3Var, view, continuation, 0);
                q62Var.f8498a = dVar;
                q62Var.f8499b = null;
                q62Var.f8502e = 2;
                w62Var = dVar;
            }
            Unit unit2 = Unit.f71706a;
            ((d) w62Var).g(null);
            return unit2;
        } catch (Throwable th2) {
            ((d) w62Var).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00b2, code lost:
    
        if (r9.a(r4, "onSdkImpression", r0) == r1) goto L44;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0098 A[Catch: all -> 0x0033, TRY_LEAVE, TryCatch #0 {all -> 0x0033, blocks: (B:14:0x002e, B:45:0x00b5, B:36:0x0090, B:38:0x0098, B:42:0x00a1), top: B:51:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v12, types: [boolean] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v4 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(w62 w62Var, ContinuationImpl continuationImpl) throws Throwable {
        s62 s62Var;
        Object obj;
        tx0 tx0Var;
        Object obj2;
        Object obj3;
        if (continuationImpl instanceof s62) {
            s62Var = (s62) continuationImpl;
            int i5 = s62Var.f9426e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s62Var.f9426e = i5 - Integer.MIN_VALUE;
            } else {
                s62Var = new s62(w62Var, continuationImpl);
            }
        }
        Object obj4 = s62Var.f9424c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? BooleanValue = s62Var.f9426e;
        try {
            try {
                if (BooleanValue == 0) {
                    ResultKt.b(obj4);
                    d dVar = w62Var.f11075h;
                    s62Var.f9422a = w62Var;
                    s62Var.f9423b = dVar;
                    s62Var.f9426e = 1;
                    if (dVar.e(s62Var) != coroutineSingletons) {
                        obj = dVar;
                    }
                    return coroutineSingletons;
                }
                if (BooleanValue == 1) {
                    Object obj5 = (c80.a) s62Var.f9423b;
                    w62 w62Var2 = (w62) s62Var.f9422a;
                    ResultKt.b(obj4);
                    obj = obj5;
                    w62Var = w62Var2;
                } else {
                    if (BooleanValue != 2) {
                        if (BooleanValue != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        obj2 = (c80.a) s62Var.f9422a;
                        ResultKt.b(obj4);
                        Unit unit = Unit.f71706a;
                        ((d) obj2).g(null);
                        return unit;
                    }
                    tx0 tx0Var2 = (tx0) s62Var.f9423b;
                    Object obj6 = (c80.a) s62Var.f9422a;
                    ResultKt.b(obj4);
                    tx0Var = tx0Var2;
                    obj2 = obj6;
                    obj3 = obj4;
                    BooleanValue = ((Boolean) obj3).booleanValue();
                    if (BooleanValue == 0) {
                        Unit unit2 = Unit.f71706a;
                        ((d) obj2).g(null);
                        return unit2;
                    }
                    com.google.gson.r rVar = new com.google.gson.r();
                    s62Var.f9422a = obj2;
                    s62Var.f9423b = null;
                    s62Var.f9426e = 3;
                }
                tx0Var = w62Var.f11073f.f5452a;
                if (w62Var.f11076i == null) {
                    m72 m72Var = w62Var.f11074g;
                    s62Var.f9422a = obj;
                    s62Var.f9423b = tx0Var;
                    s62Var.f9426e = 2;
                    m72Var.getClass();
                    Object objA = m72.a(m72Var, s62Var);
                    if (objA != coroutineSingletons) {
                        Object obj7 = obj;
                        obj3 = objA;
                        obj2 = obj7;
                        BooleanValue = ((Boolean) obj3).booleanValue();
                        if (BooleanValue == 0) {
                        }
                        com.google.gson.r rVar2 = new com.google.gson.r();
                        s62Var.f9422a = obj2;
                        s62Var.f9423b = null;
                        s62Var.f9426e = 3;
                    }
                    return coroutineSingletons;
                }
                obj2 = obj;
                com.google.gson.r rVar22 = new com.google.gson.r();
                s62Var.f9422a = obj2;
                s62Var.f9423b = null;
                s62Var.f9426e = 3;
            } catch (Throwable th2) {
                BooleanValue = w62Var;
                th = th2;
                ((d) BooleanValue).g(null);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            ((d) BooleanValue).g(null);
            throw th;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0073, code lost:
    
        if (ads_mobile_sdk.m72.a(r7, r6, r0) == r1) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0083, code lost:
    
        if (r6.a(r7, (kotlin.coroutines.jvm.internal.ContinuationImpl) r0) == r1) goto L34;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object e(w62 w62Var, ContinuationImpl continuationImpl) {
        t62 t62Var;
        if (continuationImpl instanceof t62) {
            t62Var = (t62) continuationImpl;
            int i5 = t62Var.f9798d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                t62Var.f9798d = i5 - Integer.MIN_VALUE;
            } else {
                t62Var = new t62(w62Var, continuationImpl);
            }
        }
        Object objA = t62Var.f9796b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = t62Var.f9798d;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (!w62Var.f11071d.O) {
                return Unit.f71706a;
            }
            m72 m72Var = w62Var.f11074g;
            t62Var.f9795a = w62Var;
            t62Var.f9798d = 1;
            m72Var.getClass();
            objA = m72.a(m72Var, t62Var);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(objA);
                return Unit.f71706a;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        w62Var = t62Var.f9795a;
        ResultKt.b(objA);
        if (((Boolean) objA).booleanValue()) {
            m72 m72Var2 = w62Var.f11074g;
            jy0 jy0Var = w62Var.f11073f;
            t62Var.f9795a = null;
            t62Var.f9798d = 2;
            m72Var2.getClass();
        } else {
            jy0 jy0Var2 = w62Var.f11073f;
            t62Var.f9795a = null;
            t62Var.f9798d = 3;
        }
        return coroutineSingletons;
    }

    @Override // b.b9
    public final Object a(View view, xr0 xr0Var, SuspendLambda suspendLambda) {
        return a(this, (ViewGroup) view, xr0Var, suspendLambda);
    }

    @Override // b.va
    public final Object i(Continuation continuation) {
        return e(this, (ContinuationImpl) continuation);
    }

    @Override // b.b9
    public final Object l(mq3 mq3Var) {
        return b(this, mq3Var);
    }

    @Override // b.b9
    public final Object m(ht0 ht0Var) {
        return c(this, ht0Var);
    }

    @Override // b.va
    public final Object q(Continuation continuation) {
        return d(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(w62 w62Var, ViewGroup viewGroup, xr0 xr0Var, ContinuationImpl continuationImpl) {
        i62 i62Var;
        if (continuationImpl instanceof i62) {
            i62Var = (i62) continuationImpl;
            int i5 = i62Var.f4645g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i62Var.f4645g = i5 - Integer.MIN_VALUE;
            } else {
                i62Var = new i62(w62Var, continuationImpl);
            }
        }
        Object objA = i62Var.f4643e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = i62Var.f4645g;
        if (i11 == 0) {
            ResultKt.b(objA);
            m72 m72Var = w62Var.f11074g;
            i62Var.f4640a = w62Var;
            i62Var.f4641b = viewGroup;
            i62Var.f4642c = xr0Var;
            i62Var.f4645g = 1;
            m72Var.getClass();
            objA = m72.a(m72Var, i62Var);
            if (objA != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return objA;
        }
        xr0Var = i62Var.f4642c;
        viewGroup = i62Var.f4641b;
        w62Var = i62Var.f4640a;
        ResultKt.b(objA);
        o50.j jVar = w62Var;
        ViewGroup viewGroup2 = viewGroup;
        xr0 xr0Var2 = xr0Var;
        if (!((Boolean) objA).booleanValue()) {
            return Unit.f71706a;
        }
        db dbVar = new db(jVar, viewGroup2, xr0Var2, null, 1);
        i62Var.f4640a = null;
        i62Var.f4641b = null;
        i62Var.f4642c = null;
        i62Var.f4645g = 2;
        Object objA$1 = jVar.a$1(dbVar, i62Var);
        return objA$1 == coroutineSingletons ? coroutineSingletons : objA$1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0071, code lost:
    
        if (t70.m0.y(r9, r6, r0) == r1) goto L26;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r8v0, types: [ads_mobile_sdk.jy0] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(jy0 jy0Var, ContinuationImpl continuationImpl) {
        k62 k62Var;
        w62 w62Var;
        jy0 jy0Var2;
        d dVar;
        if (continuationImpl instanceof k62) {
            k62Var = (k62) continuationImpl;
            int i5 = k62Var.f5530f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k62Var.f5530f = i5 - Integer.MIN_VALUE;
            } else {
                k62Var = new k62(this, continuationImpl);
            }
        }
        Object obj = k62Var.f5528d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k62Var.f5530f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                k62Var.f5525a = this;
                k62Var.f5526b = jy0Var;
                d dVar2 = this.f11075h;
                k62Var.f5527c = dVar2;
                k62Var.f5530f = 1;
                if (dVar2.e(k62Var) != coroutineSingletons) {
                    w62Var = this;
                    jy0Var2 = jy0Var;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c80.a aVar = (c80.a) k62Var.f5525a;
                ResultKt.b(obj);
                jy0Var = aVar;
                return Unit.f71706a;
            }
            d dVar3 = k62Var.f5527c;
            jy0Var2 = k62Var.f5526b;
            w62Var = (w62) k62Var.f5525a;
            ResultKt.b(obj);
            dVar = dVar3;
            CoroutineContext coroutineContext = (CoroutineContext) w62Var.o;
            androidx.room.q qVar = new androidx.room.q(w62Var, jy0Var2, (Continuation) null);
            k62Var.f5525a = dVar;
            k62Var.f5526b = null;
            k62Var.f5527c = null;
            k62Var.f5530f = 2;
            jy0Var = dVar;
        } finally {
            ((d) jy0Var).g(null);
        }
    }

    @Override // b.b9
    public final Object a(mq3 mq3Var) {
        return a(this, mq3Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(w62 w62Var, ContinuationImpl continuationImpl) throws Throwable {
        m62 m62Var;
        d dVar;
        Throwable th2;
        c80.a aVar;
        if (continuationImpl instanceof m62) {
            m62Var = (m62) continuationImpl;
            int i5 = m62Var.f7027e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                m62Var.f7027e = i5 - Integer.MIN_VALUE;
            } else {
                m62Var = new m62(w62Var, continuationImpl);
            }
        }
        Object obj = m62Var.f7025c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = m62Var.f7027e;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = w62Var.f11075h;
                m62Var.f7023a = w62Var;
                m62Var.f7024b = dVar;
                m62Var.f7027e = 1;
                if (dVar.e(m62Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = (c80.a) m62Var.f7023a;
                try {
                    ResultKt.b(obj);
                    Unit unit = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((d) aVar).g(null);
                    throw th2;
                }
            }
            d dVar2 = m62Var.f7024b;
            w62 w62Var2 = (w62) m62Var.f7023a;
            ResultKt.b(obj);
            dVar = dVar2;
            w62Var = w62Var2;
            CoroutineContext coroutineContext = (CoroutineContext) w62Var.o;
            b00.e eVar = new b00.e(w62Var, continuation, 13);
            m62Var.f7023a = dVar;
            m62Var.f7024b = null;
            m62Var.f7027e = 2;
            if (m0.y(coroutineContext, eVar, m62Var) != coroutineSingletons) {
                aVar = dVar;
                Unit unit2 = Unit.f71706a;
                ((d) aVar).g(null);
                return unit2;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            d dVar3 = dVar;
            th2 = th4;
            aVar = dVar3;
            ((d) aVar).g(null);
            throw th2;
        }
    }

    @Override // b.b9
    public final Object a(View view, Continuation continuation) {
        return a(this, view, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.w62] */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v13 */
    /* JADX WARN: Type inference failed for: r11v14 */
    /* JADX WARN: Type inference failed for: r11v5 */
    /* JADX WARN: Type inference failed for: r11v8, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(w62 w62Var, View view, ContinuationImpl continuationImpl) {
        u62 u62Var;
        w62 w62Var2;
        d dVar;
        w62 w62Var3;
        View view2;
        Object obj;
        if (continuationImpl instanceof u62) {
            u62Var = (u62) continuationImpl;
            int i5 = u62Var.f10217f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u62Var.f10217f = i5 - Integer.MIN_VALUE;
            } else {
                u62Var = new u62(w62Var, continuationImpl);
            }
        }
        Object obj2 = u62Var.f10215d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u62Var.f10217f;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj2);
                d dVar2 = w62Var.f11075h;
                u62Var.f10212a = w62Var;
                u62Var.f10213b = view;
                u62Var.f10214c = dVar2;
                u62Var.f10217f = 1;
                if (dVar2.e(u62Var) != coroutineSingletons) {
                    w62Var2 = w62Var;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                Object obj3 = u62Var.f10214c;
                view2 = u62Var.f10213b;
                w62Var3 = u62Var.f10212a;
                ResultKt.b(obj2);
                obj = obj3;
                w62Var3.f11077j.add(view2);
                w62Var = obj;
                Unit unit = Unit.f71706a;
                ((d) w62Var).g(null);
                return unit;
            }
            ?? r11 = u62Var.f10214c;
            view = u62Var.f10213b;
            w62 w62Var4 = u62Var.f10212a;
            ResultKt.b(obj2);
            w62Var2 = w62Var4;
            dVar = r11;
            View view3 = view;
            b.v3 v3Var = w62Var2.f11076i;
            w62Var = dVar;
            if (v3Var != null) {
                r62 r62Var = new r62(w62Var2, v3Var, view3, continuation, 1);
                u62Var.f10212a = w62Var2;
                u62Var.f10213b = view3;
                u62Var.f10214c = dVar;
                u62Var.f10217f = 2;
                if (w62Var2.a$1(r62Var, u62Var) != coroutineSingletons) {
                    w62Var3 = w62Var2;
                    view2 = view3;
                    obj = dVar;
                    w62Var3.f11077j.add(view2);
                    w62Var = obj;
                }
                return coroutineSingletons;
            }
            Unit unit2 = Unit.f71706a;
            ((d) w62Var).g(null);
            return unit2;
        } catch (Throwable th2) {
            ((d) w62Var).g(null);
            throw th2;
        }
    }
}
