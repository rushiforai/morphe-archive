package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import ar.d;
import b.t2;
import b.w6;
import b.wa;
import java.io.Serializable;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import t70.m0;
import w70.q1;
import w70.u1;

/* loaded from: classes2.dex */
public abstract class dq2 extends wo2 {
    public static final /* synthetic */ KProperty[] C = {t2.C(dq2.class, "refreshCallback", "getRefreshCallback()Lcom/google/android/libraries/ads/mobile/sdk/banner/BannerAdRefreshCallback;")};
    public t70.g2 A;
    public ViewGroup B;
    public final Context n;
    public final CoroutineContext o;

    /* renamed from: p, reason: collision with root package name */
    public final CoroutineContext f2587p;

    /* renamed from: q, reason: collision with root package name */
    public final ab0 f2588q;

    /* renamed from: r, reason: collision with root package name */
    public final lu2 f2589r;

    /* renamed from: s, reason: collision with root package name */
    public final dj0 f2590s;

    /* renamed from: t, reason: collision with root package name */
    public final mi.g f2591t;

    /* renamed from: u, reason: collision with root package name */
    public final c7 f2592u;

    /* renamed from: v, reason: collision with root package name */
    public final io.sentry.e3 f2593v;

    /* renamed from: w, reason: collision with root package name */
    public final AtomicBoolean f2594w;

    /* renamed from: x, reason: collision with root package name */
    public final AtomicBoolean f2595x;

    /* renamed from: y, reason: collision with root package name */
    public qd1 f2596y;

    /* renamed from: z, reason: collision with root package name */
    public vw2 f2597z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dq2(Context applicationContext, CoroutineContext uiContext, CoroutineContext loadContext, t70.j0 loadScope, t70.j0 backgroundScope, ab0 componentProvider, lu2 refreshHelper, dj0 displayUtil, mi.g bannerAdRequest, mi3 traceMetaSet, jr0 flags, kz2 rootTraceCreator, String publisherRequestId, qw2 requestType, b41 initializationConfigWrapper, boolean z11, b71 inspectorAdLifecycleMonitor, q1 cancellationChannel, xj appState) {
        super(loadScope, backgroundScope, traceMetaSet, flags, rootTraceCreator, publisherRequestId, requestType, bannerAdRequest, z11, initializationConfigWrapper, inspectorAdLifecycleMonitor, cancellationChannel, appState);
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(loadContext, "loadContext");
        Intrinsics.g(loadScope, "loadScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(componentProvider, "componentProvider");
        Intrinsics.g(refreshHelper, "refreshHelper");
        Intrinsics.g(displayUtil, "displayUtil");
        Intrinsics.g(bannerAdRequest, "bannerAdRequest");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(publisherRequestId, "publisherRequestId");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        Intrinsics.g(inspectorAdLifecycleMonitor, "inspectorAdLifecycleMonitor");
        Intrinsics.g(cancellationChannel, "cancellationChannel");
        Intrinsics.g(appState, "appState");
        this.n = applicationContext;
        this.o = uiContext;
        this.f2587p = loadContext;
        this.f2588q = componentProvider;
        this.f2589r = refreshHelper;
        this.f2590s = displayUtil;
        this.f2591t = bannerAdRequest;
        this.f2592u = new c7(9, (byte) 0);
        Object obj = null;
        this.f2593v = new io.sentry.e3(1, obj, obj);
        this.f2594w = new AtomicBoolean(false);
        this.f2595x = new AtomicBoolean(false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0058, code lost:
    
        if (r7 == r1) goto L28;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Serializable a(dq2 dq2Var, ContinuationImpl continuationImpl) {
        qp2 qp2Var;
        dq2Var.getClass();
        if (continuationImpl instanceof qp2) {
            qp2Var = (qp2) continuationImpl;
            int i5 = qp2Var.f8776d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qp2Var.f8776d = i5 - Integer.MIN_VALUE;
            } else {
                qp2Var = new qp2(dq2Var, continuationImpl);
            }
        }
        Object objB = qp2Var.f8774b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qp2Var.f8776d;
        try {
            if (i11 == 0) {
                ResultKt.b(objB);
                qp2Var.f8773a = dq2Var;
                qp2Var.f8776d = 1;
                objB = dq2Var.b(qp2Var);
                if (objB == coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                dq2Var = qp2Var.f8773a;
                ResultKt.b(objB);
                Pair pair = (Pair) objB;
                b.a1 a1Var = (b.a1) pair.f71683a;
                if (a1Var instanceof xu0) {
                    dq2Var.f2594w.set(dq2Var.f2590s.a(dq2Var.f11346g, ((od1) ((xu0) a1Var).f11834b).b()));
                    return pair;
                }
                if (a1Var instanceof pu0) {
                    zi3.a((pu0) a1Var, false);
                }
                return pair;
            }
            dq2Var = qp2Var.f8773a;
            ResultKt.b(objB);
            qp2Var.f8773a = dq2Var;
            qp2Var.f8776d = 2;
            objB = u1.o((w70.m) objB, qp2Var);
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(e3);
            return new Pair(new qu0(e3, null, null, 6), null);
        }
    }

    public abstract vw2 a(Context context, mi.a aVar);

    @Override // ads_mobile_sdk.wo2
    public final Object b(Continuation continuation) {
        if (this.A == null) {
            lp2 lp2Var = new lp2(this, null, 1);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f11341b;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            this.A = m0.t(j0Var, context, null, new ar.a(lp2Var, null), 2);
        }
        mi3 mi3Var = this.f11342c;
        mi3Var.getClass();
        mi3Var.f7225b = new fh1();
        mi3Var.f7226c = new tu2();
        mi3Var.f7227d = new s8();
        qb0 qb0Var = (qb0) ((wa) a((w6) this.f2588q.get(), this.f2591t));
        qb0Var.n = Boolean.valueOf(this.f2595x.getAndSet(true));
        lu2 refreshListener = this.f2589r;
        Intrinsics.g(refreshListener, "refreshListener");
        ou2 ou2Var = new ou2();
        ou2Var.f8016a = refreshListener;
        qb0Var.f8559m = ou2Var;
        qb0Var.f8558l = refreshListener;
        mi.g gVar = this.f2591t;
        gVar.getClass();
        qb0Var.o = gVar;
        return ((jc1) ((b.g1) qb0Var.a().E0.get())).a((ContinuationImpl) continuation);
    }

    public final vw2 c() {
        vw2 vw2Var = this.f2597z;
        if (vw2Var != null) {
            return vw2Var;
        }
        Intrinsics.m("_adFrame");
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) {
        mp2 mp2Var;
        dq2 dq2Var;
        if (continuationImpl instanceof mp2) {
            mp2Var = (mp2) continuationImpl;
            int i5 = mp2Var.f7303d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mp2Var.f7303d = i5 - Integer.MIN_VALUE;
            } else {
                mp2Var = new mp2(this, continuationImpl);
            }
        }
        Object obj = mp2Var.f7301b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mp2Var.f7303d;
        if (i11 == 0) {
            ResultKt.b(obj);
            t70.g2 g2Var = this.A;
            if (g2Var == null) {
                Intrinsics.m("adFrameJob");
                throw null;
            }
            mp2Var.f7300a = this;
            mp2Var.f7303d = 1;
            if (g2Var.K(mp2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            dq2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dq2Var = mp2Var.f7300a;
            ResultKt.b(obj);
        }
        vw2 vw2Var = dq2Var.f2597z;
        if (vw2Var != null) {
            return vw2Var;
        }
        Intrinsics.m("_adFrame");
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(ContinuationImpl continuationImpl) {
        sp2 sp2Var;
        dq2 dq2Var;
        dj0 dj0Var;
        dq2 dq2Var2;
        if (continuationImpl instanceof sp2) {
            sp2Var = (sp2) continuationImpl;
            int i5 = sp2Var.f9632e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sp2Var.f9632e = i5 - Integer.MIN_VALUE;
            } else {
                sp2Var = new sp2(this, continuationImpl);
            }
        }
        Object objD = sp2Var.f9630c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sp2Var.f9632e;
        if (i11 == 0) {
            ResultKt.b(objD);
            sp2Var.f9628a = this;
            sp2Var.f9632e = 1;
            objD = d(sp2Var);
            if (objD != coroutineSingletons) {
                dq2Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dj0Var = sp2Var.f9629b;
            dq2Var2 = sp2Var.f9628a;
            ResultKt.b(objD);
            return Boolean.valueOf(dj0Var.a((View) objD, dq2Var2.f2594w.get()));
        }
        dq2Var = sp2Var.f9628a;
        ResultKt.b(objD);
        if (!(((vw2) objD).getParent() instanceof View)) {
            return Boolean.FALSE;
        }
        dj0 dj0Var2 = dq2Var.f2590s;
        sp2Var.f9628a = dq2Var;
        sp2Var.f9629b = dj0Var2;
        sp2Var.f9632e = 2;
        Object objD2 = dq2Var.d(sp2Var);
        if (objD2 != coroutineSingletons) {
            dj0Var = dj0Var2;
            objD = objD2;
            dq2Var2 = dq2Var;
            return Boolean.valueOf(dj0Var.a((View) objD, dq2Var2.f2594w.get()));
        }
        return coroutineSingletons;
    }

    @Override // ads_mobile_sdk.wo2
    public final Object c(ContinuationImpl continuationImpl) {
        if (this.f2596y == null) {
            return Unit.f71706a;
        }
        Object objA = this.f2589r.a(this, this.f11351l, continuationImpl);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // ads_mobile_sdk.wo2
    public Object a(b.ja jaVar, fo2 fo2Var) {
        return a(this, (od1) jaVar, fo2Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00a9, code lost:
    
        if (r13.a(r12, r14, r0) != r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(dq2 dq2Var, od1 od1Var, ContinuationImpl continuationImpl) throws Throwable {
        rp2 rp2Var;
        dq2 dq2Var2;
        if (continuationImpl instanceof rp2) {
            rp2Var = (rp2) continuationImpl;
            int i5 = rp2Var.f9277e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rp2Var.f9277e = i5 - Integer.MIN_VALUE;
            } else {
                rp2Var = new rp2(dq2Var, continuationImpl);
            }
        }
        Object obj = rp2Var.f9275c;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = rp2Var.f9277e;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            t70.g2 g2Var = dq2Var.A;
            if (g2Var != null) {
                rp2Var.f9273a = dq2Var;
                rp2Var.f9274b = od1Var;
                rp2Var.f9277e = 1;
                if (g2Var.K(rp2Var) != obj2) {
                }
                return obj2;
            }
            Intrinsics.m("adFrameJob");
            throw null;
        }
        if (i11 == 1) {
            od1Var = rp2Var.f9274b;
            dq2Var = rp2Var.f9273a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            dq2Var2 = rp2Var.f9273a;
            ResultKt.b(obj);
            lu2 lu2Var = dq2Var2.f2589r;
            q1 q1Var = dq2Var2.f11351l;
            rp2Var.f9273a = null;
            rp2Var.f9277e = 3;
        }
        dq2 dq2Var3 = dq2Var;
        od1 od1Var2 = od1Var;
        dq2Var3.f2596y = null;
        c7 c7Var = dq2Var3.f2592u;
        dq2Var3.f2594w.set(dq2Var3.f2590s.a(dq2Var3.f11346g, od1Var2.b()));
        od1 od1Var3 = c7Var.f1694a != null ? (od1) c7Var.a("The backing field has not yet been initialized.") : null;
        c7Var.a(od1Var2);
        rp2Var.f9273a = dq2Var3;
        rp2Var.f9274b = null;
        rp2Var.f9277e = 2;
        Object objY = m0.y(dq2Var3.o, new androidx.room.q(od1Var3, dq2Var3, od1Var2, continuation, 1), rp2Var);
        if (objY != obj2) {
            objY = Unit.f71706a;
        }
        if (objY != obj2) {
            dq2Var2 = dq2Var3;
            lu2 lu2Var2 = dq2Var2.f2589r;
            q1 q1Var2 = dq2Var2.f11351l;
            rp2Var.f9273a = null;
            rp2Var.f9277e = 3;
        }
        return obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(od1 od1Var, ContinuationImpl continuationImpl) throws Throwable {
        bq2 bq2Var;
        od1 od1Var2;
        mi.c cVar;
        c7 c7Var = this.f2592u;
        if (continuationImpl instanceof bq2) {
            bq2Var = (bq2) continuationImpl;
            int i5 = bq2Var.f1498d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bq2Var.f1498d = i5 - Integer.MIN_VALUE;
            } else {
                bq2Var = new bq2(this, continuationImpl);
            }
        }
        Object obj = bq2Var.f1496b;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = bq2Var.f1498d;
        if (i11 == 0) {
            ResultKt.b(obj);
            Continuation continuation = null;
            od1 od1Var3 = c7Var.f1694a != null ? (od1) c7Var.a("The backing field has not yet been initialized.") : null;
            c7Var.a(od1Var);
            if (od1Var3 != null) {
                ((od1) c7Var.a("The backing field has not yet been initialized.")).c().f2863a.set(od1Var3.c().f2863a.get());
                ih0 ih0VarJ = od1Var3.j();
                synchronized (ih0VarJ) {
                    cVar = ih0VarJ.f4774g;
                }
                od1Var3.j().a$1(null);
                ((od1) this.f2592u.a("The backing field has not yet been initialized.")).j().a$1(cVar);
            }
            bq2Var.f1495a = od1Var3;
            bq2Var.f1498d = 1;
            Object objY = m0.y(this.o, new androidx.room.q(od1Var3, this, od1Var, continuation, 1), bq2Var);
            if (objY != obj2) {
                objY = Unit.f71706a;
            }
            if (objY == obj2) {
                return obj2;
            }
            od1Var2 = od1Var3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            od1Var2 = bq2Var.f1495a;
            ResultKt.b(obj);
        }
        if (od1Var2 != null) {
            od1Var2.destroy();
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x00a4, code lost:
    
        if (t70.m0.y(r0, r5, r6) != r7) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00c4, code lost:
    
        if (t70.m0.y(r9, r0, r6) == r7) goto L39;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x008d A[PHI: r1 r3
      0x008d: PHI (r1v8 b.a1) = (r1v7 b.a1), (r1v10 b.a1) binds: [B:28:0x008a, B:19:0x0040] A[DONT_GENERATE, DONT_INLINE]
      0x008d: PHI (r3v3 ads_mobile_sdk.dq2) = (r3v2 ads_mobile_sdk.dq2), (r3v5 ads_mobile_sdk.dq2) binds: [B:28:0x008a, B:19:0x0040] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(b.a1 a1Var, ni.g0 g0Var, ContinuationImpl continuationImpl) {
        tp2 tp2Var;
        dq2 dq2Var;
        b.a1 a1Var2;
        od1 od1Var;
        if (continuationImpl instanceof tp2) {
            tp2Var = (tp2) continuationImpl;
            int i5 = tp2Var.f10035e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tp2Var.f10035e = i5 - Integer.MIN_VALUE;
            } else {
                tp2Var = new tp2(this, continuationImpl);
            }
        }
        tp2 tp2Var2 = tp2Var;
        Object obj = tp2Var2.f10033c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tp2Var2.f10035e;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (a1Var instanceof xu0) {
                od1 od1Var2 = (od1) ((xu0) a1Var).f11834b;
                this.f11342c.a(od1Var2.a());
                tp2Var2.f10031a = this;
                tp2Var2.f10032b = a1Var;
                tp2Var2.f10035e = 1;
                od1Var2.getClass();
                if (vb1.a(od1Var2, tp2Var2) != coroutineSingletons) {
                    dq2Var = this;
                    a1Var2 = a1Var;
                    od1Var = (od1) ((xu0) a1Var2).f11834b;
                    tp2Var2.f10031a = dq2Var;
                    tp2Var2.f10032b = a1Var2;
                    tp2Var2.f10035e = 2;
                    if (dq2Var.b(od1Var, tp2Var2) != coroutineSingletons) {
                    }
                }
            } else {
                if (!(a1Var instanceof pu0)) {
                    return Unit.f71706a;
                }
                CoroutineContext coroutineContext = this.f11341b.getCoroutineContext();
                aq2 aq2Var = new aq2(g0Var, this, a1Var, continuation, 0);
                tp2Var2.f10035e = 4;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            a1Var2 = tp2Var2.f10032b;
            dq2Var = tp2Var2.f10031a;
            ResultKt.b(obj);
            od1Var = (od1) ((xu0) a1Var2).f11834b;
            tp2Var2.f10031a = dq2Var;
            tp2Var2.f10032b = a1Var2;
            tp2Var2.f10035e = 2;
            if (dq2Var.b(od1Var, tp2Var2) != coroutineSingletons) {
                CoroutineContext coroutineContext2 = dq2Var.f11341b.getCoroutineContext();
                d dVar = new d(dq2Var, a1Var2, continuation, 12);
                tp2Var2.f10031a = null;
                tp2Var2.f10032b = null;
                tp2Var2.f10035e = 3;
            }
            return coroutineSingletons;
        }
        if (i11 != 2) {
            if (i11 == 3) {
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        a1Var2 = tp2Var2.f10032b;
        dq2Var = tp2Var2.f10031a;
        ResultKt.b(obj);
        CoroutineContext coroutineContext22 = dq2Var.f11341b.getCoroutineContext();
        d dVar2 = new d(dq2Var, a1Var2, continuation, 12);
        tp2Var2.f10031a = null;
        tp2Var2.f10032b = null;
        tp2Var2.f10035e = 3;
    }
}
