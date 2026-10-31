package ads_mobile_sdk;

import android.os.SystemClock;
import androidx.compose.ui.node.LayoutNode;
import b.m3;
import b.o2;
import c80.d;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.s1;
import w70.u1;

/* loaded from: classes2.dex */
public final class fb2 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f3288a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f3289b;

    /* renamed from: c, reason: collision with root package name */
    public final bw2 f3290c;

    /* renamed from: d, reason: collision with root package name */
    public final o2 f3291d;

    /* renamed from: e, reason: collision with root package name */
    public final cv2 f3292e;

    /* renamed from: f, reason: collision with root package name */
    public final b.r4 f3293f;

    /* renamed from: g, reason: collision with root package name */
    public ArrayList f3294g;

    /* renamed from: h, reason: collision with root package name */
    public d33 f3295h;

    /* renamed from: i, reason: collision with root package name */
    public final d f3296i;

    /* renamed from: j, reason: collision with root package name */
    public xu0 f3297j;

    /* renamed from: k, reason: collision with root package name */
    public int f3298k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f3299l;

    /* renamed from: m, reason: collision with root package name */
    public final HashSet f3300m;
    public final ArrayList n;
    public s1 o;

    /* renamed from: p, reason: collision with root package name */
    public ArrayList f3301p;

    public fb2(t70.j0 backgroundScope, CoroutineContext backgroundContext, bw2 requestThrottler, o2 clock, cv2 renderingMonitor, b.r4 adRendererProvider) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(backgroundContext, "backgroundContext");
        Intrinsics.g(requestThrottler, "requestThrottler");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(renderingMonitor, "renderingMonitor");
        Intrinsics.g(adRendererProvider, "adRendererProvider");
        this.f3288a = backgroundScope;
        this.f3289b = backgroundContext;
        this.f3290c = requestThrottler;
        this.f3291d = clock;
        this.f3292e = renderingMonitor;
        this.f3293f = adRendererProvider;
        this.f3296i = new d();
        this.f3298k = LayoutNode.NotPlacedPlaceOrder;
        this.f3300m = new HashSet();
        this.n = new ArrayList();
        s1 s1VarC = m0.c();
        s1VarC.j0();
        this.o = s1VarC;
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x00e8, code lost:
    
        if (r13 == r1) goto L52;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005e A[PHI: r12 r13
      0x005e: PHI (r12v7 ads_mobile_sdk.fb2) = (r12v11 ads_mobile_sdk.fb2), (r12v16 ads_mobile_sdk.fb2) binds: [B:27:0x0071, B:23:0x0059] A[DONT_GENERATE, DONT_INLINE]
      0x005e: PHI (r13v19 java.lang.Object) = (r13v21 java.lang.Object), (r13v1 java.lang.Object) binds: [B:27:0x0071, B:23:0x0059] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00a8 A[Catch: all -> 0x003a, TryCatch #0 {all -> 0x003a, blocks: (B:15:0x0035, B:53:0x00eb, B:55:0x00ef, B:40:0x00a4, B:42:0x00a8, B:43:0x00ad, B:45:0x00c0, B:47:0x00c6, B:49:0x00ca, B:50:0x00d3), top: B:67:0x0035 }] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c0 A[Catch: all -> 0x003a, TryCatch #0 {all -> 0x003a, blocks: (B:15:0x0035, B:53:0x00eb, B:55:0x00ef, B:40:0x00a4, B:42:0x00a8, B:43:0x00ad, B:45:0x00c0, B:47:0x00c6, B:49:0x00ca, B:50:0x00d3), top: B:67:0x0035 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0102 A[Catch: all -> 0x011e, TryCatch #1 {all -> 0x011e, blocks: (B:57:0x00fc, B:59:0x0102, B:62:0x0120), top: B:69:0x00fc }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r12v18, types: [c80.a] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00be -> B:56:0x00fa). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x00c4 -> B:56:0x00fa). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:49:0x00ca -> B:56:0x00fa). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:51:0x00e8 -> B:53:0x00eb). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(fb2 fb2Var, ContinuationImpl continuationImpl) throws Throwable {
        cb2 cb2Var;
        Object obj;
        Throwable th2;
        d dVar;
        fb2 fb2Var2;
        z1 z1Var;
        b.a1 a1Var;
        z1 z1Var2;
        fb2 fb2Var3;
        d dVar2;
        Object obj2;
        if (continuationImpl instanceof cb2) {
            cb2Var = (cb2) continuationImpl;
            int i5 = cb2Var.f1773g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cb2Var.f1773g = i5 - Integer.MIN_VALUE;
            } else {
                cb2Var = new cb2(fb2Var, continuationImpl);
            }
        }
        Object objO = cb2Var.f1771e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cb2Var.f1773g;
        int i12 = 3;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objO);
            cb2Var.f1767a = fb2Var;
            cb2Var.f1768b = null;
            cb2Var.f1769c = null;
            cb2Var.f1770d = null;
            cb2Var.f1773g = 1;
            objO = fb2Var.a(cb2Var);
            if (objO != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            fb2Var = cb2Var.f1767a;
            ResultKt.b(objO);
            fb2Var3 = fb2Var;
            z1Var2 = (z1) objO;
            if (z1Var2 != null) {
            }
        } else {
            if (i11 == 2) {
                z1Var2 = cb2Var.f1768b;
                fb2Var3 = cb2Var.f1767a;
                ResultKt.b(objO);
                b.a1 a1Var2 = (b.a1) objO;
                dVar2 = fb2Var3.f3296i;
                cb2Var.f1767a = fb2Var3;
                cb2Var.f1768b = z1Var2;
                cb2Var.f1769c = a1Var2;
                cb2Var.f1770d = dVar2;
                cb2Var.f1773g = 3;
                if (dVar2.e(cb2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 == 3) {
                ?? r12 = cb2Var.f1770d;
                a1Var = cb2Var.f1769c;
                z1Var = cb2Var.f1768b;
                fb2Var2 = cb2Var.f1767a;
                ResultKt.b(objO);
                dVar = r12;
                if (z1Var.f12370b0) {
                }
                fb2Var2.n.remove(z1Var);
                HashSet hashSet = fb2Var2.f3300m;
                String str = z1Var.T;
                TypeIntrinsics.a(hashSet);
                hashSet.remove(str);
                obj2 = dVar;
                if (a1Var instanceof xu0) {
                }
                obj = obj2;
                fb2Var = fb2Var2;
                if (!fb2Var.a()) {
                }
                Unit unit = Unit.f71706a;
                ((d) obj).g(null);
                cb2Var.f1767a = fb2Var;
                cb2Var.f1768b = null;
                cb2Var.f1769c = null;
                cb2Var.f1770d = null;
                cb2Var.f1773g = 1;
                objO = fb2Var.a(cb2Var);
                if (objO != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Object obj3 = cb2Var.f1770d;
            a1Var = cb2Var.f1769c;
            z1Var = cb2Var.f1768b;
            fb2Var2 = cb2Var.f1767a;
            try {
                ResultKt.b(objO);
                obj3 = obj3;
            } catch (Throwable th3) {
                obj = obj3;
                th2 = th3;
                ((d) obj).g(null);
                throw th2;
            }
            try {
                obj2 = obj3;
                if (objO instanceof xu0) {
                    fb2Var2.f3298k = z1Var.f12409w;
                    fb2Var2.f3297j = (xu0) a1Var;
                    fb2Var2.f3299l = false;
                    obj2 = obj3;
                }
                if (!fb2Var.a()) {
                    t70.j0 j0Var = fb2Var.f3288a;
                    androidx.room.c cVar = new androidx.room.c(fb2Var, continuation, i12);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(cVar, null), 2);
                }
                Unit unit2 = Unit.f71706a;
                ((d) obj).g(null);
                cb2Var.f1767a = fb2Var;
                cb2Var.f1768b = null;
                cb2Var.f1769c = null;
                cb2Var.f1770d = null;
                cb2Var.f1773g = 1;
                objO = fb2Var.a(cb2Var);
                if (objO != coroutineSingletons) {
                    fb2Var3 = fb2Var;
                    z1Var2 = (z1) objO;
                    if (z1Var2 != null) {
                        return Unit.f71706a;
                    }
                    cb2Var.f1767a = fb2Var3;
                    cb2Var.f1768b = z1Var2;
                    cb2Var.f1773g = 2;
                    objO = fb2Var3.a(z1Var2, cb2Var);
                    if (objO != coroutineSingletons) {
                        b.a1 a1Var22 = (b.a1) objO;
                        dVar2 = fb2Var3.f3296i;
                        cb2Var.f1767a = fb2Var3;
                        cb2Var.f1768b = z1Var2;
                        cb2Var.f1769c = a1Var22;
                        cb2Var.f1770d = dVar2;
                        cb2Var.f1773g = 3;
                        if (dVar2.e(cb2Var) != coroutineSingletons) {
                            z1Var = z1Var2;
                            dVar = dVar2;
                            fb2Var2 = fb2Var3;
                            a1Var = a1Var22;
                            if (z1Var.f12370b0) {
                                fb2Var2.o.j0();
                            }
                            fb2Var2.n.remove(z1Var);
                            HashSet hashSet2 = fb2Var2.f3300m;
                            String str2 = z1Var.T;
                            TypeIntrinsics.a(hashSet2);
                            hashSet2.remove(str2);
                            obj2 = dVar;
                            if (a1Var instanceof xu0) {
                                int i13 = z1Var.f12409w;
                                obj2 = dVar;
                                if (i13 < fb2Var2.f3298k) {
                                    if (z1Var.f12416z0) {
                                        fb2Var2.f3298k = i13;
                                        fb2Var2.f3297j = (xu0) a1Var;
                                        fb2Var2.f3299l = true;
                                        obj2 = dVar;
                                    } else {
                                        w70.m mVar = (w70.m) ((xu0) a1Var).f11834b;
                                        cb2Var.f1767a = fb2Var2;
                                        cb2Var.f1768b = z1Var;
                                        cb2Var.f1769c = a1Var;
                                        cb2Var.f1770d = dVar;
                                        cb2Var.f1773g = 4;
                                        objO = u1.o(mVar, cb2Var);
                                        obj3 = dVar;
                                    }
                                }
                            }
                            obj = obj2;
                            fb2Var = fb2Var2;
                            if (!fb2Var.a()) {
                            }
                            Unit unit22 = Unit.f71706a;
                            ((d) obj).g(null);
                            cb2Var.f1767a = fb2Var;
                            cb2Var.f1768b = null;
                            cb2Var.f1769c = null;
                            cb2Var.f1770d = null;
                            cb2Var.f1773g = 1;
                            objO = fb2Var.a(cb2Var);
                            if (objO != coroutineSingletons) {
                            }
                        }
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                th2 = th4;
                ((d) obj).g(null);
                throw th2;
            }
            obj = obj2;
            fb2Var = fb2Var2;
        }
    }

    public final String b() {
        d33 d33Var = this.f3295h;
        if (d33Var == null) {
            Intrinsics.m("serverTransaction");
            throw null;
        }
        mp mpVar = d33Var.f2166b.f12428b.f4553g;
        if (mpVar != null) {
            return String.valueOf(mpVar);
        }
        sl0 sl0Var = sl0.f9598b;
        return "No fill.";
    }

    public final z1 c() {
        HashSet hashSet;
        Object next;
        ArrayList arrayList = this.f3301p;
        if (arrayList == null) {
            Intrinsics.m("remainingAdConfigs");
            throw null;
        }
        Iterator it = arrayList.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            hashSet = this.f3300m;
            if (!zHasNext) {
                next = null;
                break;
            }
            next = it.next();
            if (!b70.g.O0(hashSet, ((z1) next).T)) {
                break;
            }
        }
        z1 z1Var = (z1) next;
        if (z1Var == null || z1Var.f12409w > this.f3298k) {
            return null;
        }
        this.n.add(z1Var);
        ArrayList arrayList2 = this.f3301p;
        if (arrayList2 == null) {
            Intrinsics.m("remainingAdConfigs");
            throw null;
        }
        arrayList2.remove(z1Var);
        String str = z1Var.T;
        if (str != null && str.length() != 0) {
            hashSet.add(str);
        }
        if (z1Var.f12370b0) {
            this.o = m0.c();
        }
        return z1Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0056 A[PHI: r2
      0x0056: PHI (r2v6 ads_mobile_sdk.fb2) = (r2v4 ads_mobile_sdk.fb2), (r2v8 ads_mobile_sdk.fb2) binds: [B:29:0x00a7, B:15:0x0051] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0102  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x011d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d3 A[EXC_TOP_SPLITTER, PHI: r2 r4 r10
      0x00d3: PHI (r2v15 c80.d) = (r2v12 c80.d), (r2v18 c80.d) binds: [B:36:0x00d0, B:13:0x0037] A[DONT_GENERATE, DONT_INLINE]
      0x00d3: PHI (r4v5 ads_mobile_sdk.fb2) = (r4v3 ads_mobile_sdk.fb2), (r4v8 ads_mobile_sdk.fb2) binds: [B:36:0x00d0, B:13:0x0037] A[DONT_GENERATE, DONT_INLINE]
      0x00d3: PHI (r10v17 ads_mobile_sdk.xu0) = (r10v16 ads_mobile_sdk.xu0), (r10v21 ads_mobile_sdk.xu0) binds: [B:36:0x00d0, B:13:0x0037] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00ba A[EXC_TOP_SPLITTER, PHI: r2 r4
      0x00ba: PHI (r2v9 java.lang.Object) = (r2v19 java.lang.Object), (r2v20 java.lang.Object) binds: [B:32:0x00b7, B:14:0x0046] A[DONT_GENERATE, DONT_INLINE]
      0x00ba: PHI (r4v3 ads_mobile_sdk.fb2) = (r4v2 ads_mobile_sdk.fb2), (r4v4 ads_mobile_sdk.fb2) binds: [B:32:0x00b7, B:14:0x0046] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        za2 za2Var;
        fb2 fb2Var;
        d33 d33Var;
        cv2 cv2Var;
        fb2 fb2Var2;
        Object objE;
        Object obj;
        xu0 xu0Var;
        d dVar;
        xu0 xu0Var2;
        b.a1 a1Var;
        w70.m mVar;
        fb2 fb2Var3;
        xu0 xu0Var3;
        b.ja jaVar;
        mi3 mi3VarA;
        if (continuationImpl instanceof za2) {
            za2Var = (za2) continuationImpl;
            int i5 = za2Var.f12506f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                za2Var.f12506f = i5 - Integer.MIN_VALUE;
            } else {
                za2Var = new za2(this, continuationImpl);
            }
        }
        Object obj2 = za2Var.f12504d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        tu2 tu2Var = null;
        switch (za2Var.f12506f) {
            case 0:
                ResultKt.b(obj2);
                za2Var.f12501a = this;
                za2Var.f12506f = 1;
                if (c(za2Var) != coroutineSingletons) {
                    fb2Var = this;
                    d33Var = fb2Var.f3295h;
                    if (d33Var == null) {
                        ar.a aVar = new ar.a(fb2Var, Integer.max(1, d33Var.f2166b.f12428b.f4558l), (Continuation) null);
                        za2Var.f12501a = fb2Var;
                        za2Var.f12506f = 2;
                        t70.h2 h2Var = new t70.h2(za2Var.getContext(), za2Var, 0);
                        if (w20.e.r(h2Var, true, h2Var, aVar) != coroutineSingletons) {
                            cv2Var = fb2Var.f3292e;
                            za2Var.f12501a = fb2Var;
                            za2Var.f12506f = 3;
                            if (cv2Var.a(za2Var) != coroutineSingletons) {
                                fb2Var2 = fb2Var;
                                d dVar2 = fb2Var2.f3296i;
                                za2Var.f12501a = fb2Var2;
                                za2Var.f12502b = dVar2;
                                za2Var.f12506f = 4;
                                objE = dVar2.e(za2Var);
                                obj = dVar2;
                                if (objE != coroutineSingletons) {
                                    try {
                                        xu0Var = fb2Var2.f3297j;
                                        ((d) obj).g(null);
                                        dVar = fb2Var2.f3296i;
                                        za2Var.f12501a = fb2Var2;
                                        za2Var.f12502b = xu0Var;
                                        za2Var.f12503c = dVar;
                                        za2Var.f12506f = 5;
                                        if (dVar.e(za2Var) != coroutineSingletons) {
                                            try {
                                                if (!fb2Var2.f3299l) {
                                                    if (xu0Var == null || (mVar = (w70.m) xu0Var.f11834b) == null) {
                                                        xu0Var2 = xu0Var;
                                                        a1Var = null;
                                                        xu0Var3 = a1Var instanceof xu0 ? (xu0) a1Var : null;
                                                        if (xu0Var3 != null && (jaVar = (b.ja) xu0Var3.f11834b) != null && (mi3VarA = jaVar.a()) != null) {
                                                            tu2Var = mi3VarA.f7226c;
                                                        }
                                                        if (tu2Var != null) {
                                                            tu2Var.f10109f = Boolean.TRUE;
                                                        }
                                                        xu0Var = xu0Var2;
                                                    } else {
                                                        za2Var.f12501a = fb2Var2;
                                                        za2Var.f12502b = xu0Var;
                                                        za2Var.f12503c = null;
                                                        za2Var.f12506f = 6;
                                                        Object objO = u1.o(mVar, za2Var);
                                                        if (objO != coroutineSingletons) {
                                                            xu0Var2 = xu0Var;
                                                            obj2 = objO;
                                                            fb2Var3 = fb2Var2;
                                                            a1Var = (b.a1) obj2;
                                                            fb2Var2 = fb2Var3;
                                                            if (a1Var instanceof xu0) {
                                                            }
                                                            if (xu0Var3 != null) {
                                                                tu2Var = mi3VarA.f7226c;
                                                            }
                                                            if (tu2Var != null) {
                                                            }
                                                            xu0Var = xu0Var2;
                                                        }
                                                    }
                                                }
                                                return xu0Var != null ? xu0Var : new uu0(fb2Var2.b(), 2);
                                            } finally {
                                                dVar.g(null);
                                            }
                                        }
                                    } catch (Throwable th2) {
                                        ((d) obj).g(null);
                                        throw th2;
                                    }
                                }
                            }
                        }
                    } else {
                        Intrinsics.m("serverTransaction");
                        throw null;
                    }
                }
                return coroutineSingletons;
            case 1:
                fb2Var = za2Var.f12501a;
                ResultKt.b(obj2);
                d33Var = fb2Var.f3295h;
                if (d33Var == null) {
                }
                break;
            case 2:
                fb2Var = za2Var.f12501a;
                ResultKt.b(obj2);
                cv2Var = fb2Var.f3292e;
                za2Var.f12501a = fb2Var;
                za2Var.f12506f = 3;
                if (cv2Var.a(za2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 3:
                fb2Var = za2Var.f12501a;
                ResultKt.b(obj2);
                fb2Var2 = fb2Var;
                d dVar22 = fb2Var2.f3296i;
                za2Var.f12501a = fb2Var2;
                za2Var.f12502b = dVar22;
                za2Var.f12506f = 4;
                objE = dVar22.e(za2Var);
                obj = dVar22;
                if (objE != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 4:
                Object obj3 = (c80.a) za2Var.f12502b;
                fb2Var2 = za2Var.f12501a;
                ResultKt.b(obj2);
                obj = obj3;
                xu0Var = fb2Var2.f3297j;
                ((d) obj).g(null);
                dVar = fb2Var2.f3296i;
                za2Var.f12501a = fb2Var2;
                za2Var.f12502b = xu0Var;
                za2Var.f12503c = dVar;
                za2Var.f12506f = 5;
                if (dVar.e(za2Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            case 5:
                dVar = za2Var.f12503c;
                xu0 xu0Var4 = (xu0) za2Var.f12502b;
                fb2 fb2Var4 = za2Var.f12501a;
                ResultKt.b(obj2);
                xu0Var = xu0Var4;
                fb2Var2 = fb2Var4;
                if (!fb2Var2.f3299l) {
                }
                if (xu0Var != null) {
                }
                break;
            case 6:
                xu0Var2 = (xu0) za2Var.f12502b;
                fb2Var3 = za2Var.f12501a;
                ResultKt.b(obj2);
                a1Var = (b.a1) obj2;
                fb2Var2 = fb2Var3;
                if (a1Var instanceof xu0) {
                }
                if (xu0Var3 != null) {
                }
                if (tu2Var != null) {
                }
                xu0Var = xu0Var2;
                if (xu0Var != null) {
                }
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0073, code lost:
    
        if (r2.a(r4, r0) == r1) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) {
        eb2 eb2Var;
        d dVar;
        fb2 fb2Var;
        if (continuationImpl instanceof eb2) {
            eb2Var = (eb2) continuationImpl;
            int i5 = eb2Var.f2838e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eb2Var.f2838e = i5 - Integer.MIN_VALUE;
            } else {
                eb2Var = new eb2(this, continuationImpl);
            }
        }
        Object obj = eb2Var.f2836c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eb2Var.f2838e;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                eb2Var.f2834a = this;
                dVar = this.f3296i;
                eb2Var.f2835b = dVar;
                eb2Var.f2838e = 1;
                if (dVar.e(eb2Var) != coroutineSingletons) {
                    fb2Var = this;
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
            dVar = eb2Var.f2835b;
            fb2Var = eb2Var.f2834a;
            ResultKt.b(obj);
            d33 d33Var = fb2Var.f3295h;
            if (d33Var != null) {
                fb2Var.f3301p = b70.g.K1(d33Var.f2166b.f12427a);
                Unit unit = Unit.f71706a;
                dVar.g(null);
                cv2 cv2Var = fb2Var.f3292e;
                d33 d33Var2 = fb2Var.f3295h;
                if (d33Var2 == null) {
                    Intrinsics.m("serverTransaction");
                    throw null;
                }
                eb2Var.f2834a = null;
                eb2Var.f2835b = null;
                eb2Var.f2838e = 2;
            } else {
                Intrinsics.m("serverTransaction");
                throw null;
            }
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    public final boolean a() {
        ArrayList arrayList = this.n;
        if (arrayList == null || !arrayList.isEmpty()) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                if (((z1) it.next()).f12409w < this.f3298k) {
                    return true;
                }
            }
        }
        ArrayList arrayList2 = this.f3301p;
        if (arrayList2 != null) {
            if (arrayList2.isEmpty()) {
                return false;
            }
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                if (((z1) it2.next()).f12409w < this.f3298k) {
                    return true;
                }
            }
            return false;
        }
        Intrinsics.m("remainingAdConfigs");
        throw null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x008a, code lost:
    
        if (r10 == r1) goto L45;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0080 A[Catch: all -> 0x0052, TRY_LEAVE, TryCatch #0 {all -> 0x0052, blocks: (B:30:0x0078, B:32:0x0080, B:37:0x0093, B:20:0x004e), top: B:51:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0093 A[Catch: all -> 0x0052, TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x0052, blocks: (B:30:0x0078, B:32:0x0080, B:37:0x0093, B:20:0x004e), top: B:51:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00b8 -> B:26:0x0065). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        va2 va2Var;
        fb2 fb2Var;
        fb2 fb2Var2;
        d dVar;
        va2 va2Var2;
        d dVar2;
        Object objK;
        Object obj;
        va2 va2Var3;
        d dVar3;
        va2 va2Var4;
        if (continuationImpl instanceof va2) {
            va2 va2Var5 = (va2) continuationImpl;
            int i5 = va2Var5.f10661e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                va2Var5.f10661e = i5 - Integer.MIN_VALUE;
                va2Var = va2Var5;
            } else {
                va2Var = new va2(this, continuationImpl);
            }
        }
        Object objC = va2Var.f10659c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = va2Var.f10661e;
        try {
            if (i11 == 0) {
                ResultKt.b(objC);
                fb2Var = this;
                va2Var4 = va2Var;
            } else {
                if (i11 == 1) {
                    d dVar4 = va2Var.f10658b;
                    fb2Var2 = (fb2) va2Var.f10657a;
                    ResultKt.b(objC);
                    va2Var3 = va2Var;
                    dVar3 = dVar4;
                    if (!fb2Var2.o.isCompleted()) {
                        va2Var3.f10657a = dVar3;
                        va2Var3.f10658b = null;
                        va2Var3.f10661e = 2;
                        objC = fb2Var2.c();
                        obj = dVar3;
                    } else {
                        Unit unit = Unit.f71706a;
                        dVar3.g(null);
                        dVar = fb2Var2.f3296i;
                        va2Var3.f10657a = fb2Var2;
                        va2Var3.f10658b = dVar;
                        va2Var3.f10661e = 3;
                        if (dVar.e(va2Var3) != coroutineSingletons) {
                            va2Var2 = va2Var3;
                            dVar2 = dVar;
                            fb2Var = fb2Var2;
                            s1 s1Var = fb2Var.o;
                            dVar2.g(null);
                            va2Var2.f10657a = fb2Var;
                            va2Var2.f10658b = null;
                            va2Var2.f10661e = 4;
                            objK = s1Var.K(va2Var2);
                            va2Var4 = va2Var2;
                            if (objK != coroutineSingletons) {
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                if (i11 == 2) {
                    Object obj2 = (c80.a) va2Var.f10657a;
                    ResultKt.b(objC);
                    obj = obj2;
                    return objC;
                }
                if (i11 == 3) {
                    dVar = va2Var.f10658b;
                    fb2Var2 = (fb2) va2Var.f10657a;
                    ResultKt.b(objC);
                    va2Var2 = va2Var;
                    dVar2 = dVar;
                    fb2Var = fb2Var2;
                    try {
                        s1 s1Var2 = fb2Var.o;
                        dVar2.g(null);
                        va2Var2.f10657a = fb2Var;
                        va2Var2.f10658b = null;
                        va2Var2.f10661e = 4;
                        objK = s1Var2.K(va2Var2);
                        va2Var4 = va2Var2;
                        if (objK != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    } catch (Throwable th2) {
                        dVar2.g(null);
                        throw th2;
                    }
                }
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                fb2Var = (fb2) va2Var.f10657a;
                ResultKt.b(objC);
                va2Var4 = va2Var;
            }
            d dVar5 = fb2Var.f3296i;
            va2Var4.f10657a = fb2Var;
            va2Var4.f10658b = dVar5;
            va2Var4.f10661e = 1;
            if (dVar5.e(va2Var4) != coroutineSingletons) {
                va2 va2Var6 = va2Var4;
                dVar3 = dVar5;
                va2Var3 = va2Var6;
                fb2Var2 = fb2Var;
                if (!fb2Var2.o.isCompleted()) {
                }
            }
            return coroutineSingletons;
        } finally {
            ((d) va2Var).g(null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x00cb, code lost:
    
        if (ads_mobile_sdk.bw2.a(r7, r2, r0) == r1) goto L81;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00ed A[Catch: all -> 0x0037, TRY_LEAVE, TryCatch #3 {all -> 0x0037, blocks: (B:14:0x0032, B:45:0x00e7, B:47:0x00ed), top: B:87:0x0032 }] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0109 A[Catch: all -> 0x0115, TryCatch #2 {all -> 0x0115, blocks: (B:54:0x0102, B:56:0x0109, B:58:0x010d, B:60:0x0111, B:63:0x0117, B:65:0x011b, B:67:0x011f, B:69:0x0123, B:70:0x0124, B:71:0x0129, B:72:0x012a, B:73:0x0131, B:74:0x0132, B:75:0x0139, B:76:0x013a), top: B:86:0x0102 }] */
    /* JADX WARN: Removed duplicated region for block: B:76:0x013a A[Catch: all -> 0x0115, TRY_LEAVE, TryCatch #2 {all -> 0x0115, blocks: (B:54:0x0102, B:56:0x0109, B:58:0x010d, B:60:0x0111, B:63:0x0117, B:65:0x011b, B:67:0x011f, B:69:0x0123, B:70:0x0124, B:71:0x0129, B:72:0x012a, B:73:0x0131, B:74:0x0132, B:75:0x0139, B:76:0x013a), top: B:86:0x0102 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.d33, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v13 */
    /* JADX WARN: Type inference failed for: r11v14, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r11v19 */
    /* JADX WARN: Type inference failed for: r11v22 */
    /* JADX WARN: Type inference failed for: r11v4 */
    /* JADX WARN: Type inference failed for: r11v8, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v27 */
    /* JADX WARN: Type inference failed for: r2v28 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(d33 d33Var, ContinuationImpl continuationImpl) {
        wa2 wa2Var;
        th3 th3Var;
        th3 th3Var2;
        d33 d33Var2;
        fb2 fb2Var;
        th3 th3VarA;
        th3 th3Var3;
        th3 th3Var4;
        b.a1 a1Var;
        d33 d33Var3;
        th3 th3Var5;
        if (continuationImpl instanceof wa2) {
            wa2Var = (wa2) continuationImpl;
            int i5 = wa2Var.f11125g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wa2Var.f11125g = i5 - Integer.MIN_VALUE;
            } else {
                wa2Var = new wa2(this, continuationImpl);
            }
        }
        Object obj = wa2Var.f11123e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r22 = wa2Var.f11125g;
        try {
            if (r22 == 0) {
                ResultKt.b(obj);
                th3VarA = ji3.a(wv0.CUI_NAME_ADREQUEST_MEDIATION, ul.b.P("Mediation"), true);
                try {
                    fh1 fh1Var = ji3.a().f9923a.f7225b;
                    z23 z23Var = d33Var.f2166b;
                    v23 v23Var = d33Var.f2165a;
                    fh1Var.f3355e = z23Var.f12427a.size();
                    boolean zIsEmpty = d33Var.f2166b.f12427a.isEmpty();
                    bw2 bw2Var = this.f3290c;
                    if (!zIsEmpty) {
                        String strL = v23Var.f10559a.l();
                        wa2Var.f11119a = this;
                        wa2Var.f11120b = d33Var;
                        wa2Var.f11121c = th3VarA;
                        wa2Var.f11122d = th3VarA;
                        wa2Var.f11125g = 1;
                        bw2Var.getClass();
                        if (bw2.b(bw2Var, strL, wa2Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        fb2Var = this;
                        th3Var5 = th3VarA;
                        d33Var3 = d33Var;
                    } else {
                        String strL2 = v23Var.f10559a.l();
                        wa2Var.f11119a = this;
                        wa2Var.f11120b = d33Var;
                        wa2Var.f11121c = th3VarA;
                        wa2Var.f11122d = th3VarA;
                        wa2Var.f11125g = 2;
                        bw2Var.getClass();
                    }
                } catch (Throwable th2) {
                    th3 th3Var6 = th3VarA;
                    th = th2;
                    th3Var3 = th3Var6;
                    th3Var4 = th3Var6;
                    th3Var4.b(th);
                    if (th instanceof b.a4) {
                        if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                            th3Var4.a(th);
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
            } else {
                try {
                    if (r22 == 1) {
                        th3Var2 = wa2Var.f11122d;
                        th3 th3Var7 = wa2Var.f11121c;
                        d33Var2 = (d33) wa2Var.f11120b;
                        fb2Var = (fb2) wa2Var.f11119a;
                        ResultKt.b(obj);
                        r22 = th3Var7;
                    } else if (r22 == 2) {
                        th3Var2 = wa2Var.f11122d;
                        th3 th3Var8 = wa2Var.f11121c;
                        d33Var2 = (d33) wa2Var.f11120b;
                        fb2Var = (fb2) wa2Var.f11119a;
                        ResultKt.b(obj);
                        r22 = th3Var8;
                    } else {
                        if (r22 != 3) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        d33Var = (Closeable) wa2Var.f11120b;
                        th3Var = (th3) wa2Var.f11119a;
                        try {
                            ResultKt.b(obj);
                            d33Var = d33Var;
                            a1Var = (b.a1) obj;
                            if (a1Var instanceof pu0) {
                                zi3.a((pu0) a1Var, false);
                            }
                            CloseableKt.a(d33Var, null);
                            return a1Var;
                        } catch (Throwable th3) {
                            th = th3;
                            th3Var4 = th3Var;
                            th3Var3 = d33Var;
                            try {
                                th3Var4.b(th);
                                if (th instanceof b.a4) {
                                }
                            } finally {
                            }
                        }
                    }
                    th3VarA = th3Var2;
                    d33Var = d33Var2;
                    th3Var5 = r22;
                    d33Var3 = d33Var;
                } catch (Throwable th4) {
                    th = th4;
                    th3Var = r22;
                    th3Var4 = th3Var;
                    th3Var3 = d33Var;
                    th3Var4.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            }
            fb2Var.f3295h = d33Var3;
            wa2Var.f11119a = th3Var5;
            wa2Var.f11120b = th3VarA;
            wa2Var.f11121c = null;
            wa2Var.f11122d = null;
            wa2Var.f11125g = 3;
            Object objB = fb2Var.b(wa2Var);
            if (objB != coroutineSingletons) {
                th3 th3Var9 = th3VarA;
                obj = objB;
                d33Var = th3Var9;
                th3Var = th3Var5;
                a1Var = (b.a1) obj;
                if (a1Var instanceof pu0) {
                }
                CloseableKt.a(d33Var, null);
                return a1Var;
            }
            return coroutineSingletons;
        } catch (Throwable th5) {
            th3 th3Var10 = th3VarA;
            th = th5;
            th3Var3 = th3Var10;
            th3Var4 = th3Var5;
            th3Var4.b(th);
            if (th instanceof b.a4) {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00b5, code lost:
    
        r1 = r20.f3292e;
        r6.f11652a = r20;
        r6.f11653b = r3;
        r6.f11654c = r8;
        r6.f11655d = r13;
        r6.f11659h = 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c5, code lost:
    
        if (r1.a(r3, r6) != r9) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c9, code lost:
    
        r4 = r20;
        r2 = r13;
     */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0121 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0170 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(z1 z1Var, ContinuationImpl continuationImpl) {
        xa2 xa2Var;
        z1 z1Var2;
        fb2 fb2Var;
        t70.c2 c2Var;
        androidx.room.q qVar;
        String str;
        b.b bVar;
        long jElapsedRealtime;
        Object objA;
        o2 o2Var;
        fb2 fb2Var2;
        z1 z1Var3;
        long jH;
        b.a1 a1Var;
        cv2 cv2Var;
        z1 z1Var4 = z1Var;
        if (continuationImpl instanceof xa2) {
            xa2Var = (xa2) continuationImpl;
            int i5 = xa2Var.f11659h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xa2Var.f11659h = i5 - Integer.MIN_VALUE;
            } else {
                xa2Var = new xa2(this, continuationImpl);
            }
        }
        xa2 xa2Var2 = xa2Var;
        Object obj = xa2Var2.f11657f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xa2Var2.f11659h;
        Continuation continuation = null;
        try {
        } catch (CancellationException unused) {
            z1Var2 = z1Var4;
            fb2Var = 5;
        }
        if (i11 == 0) {
            ResultKt.b(obj);
            d33 d33Var = this.f3295h;
            if (d33Var != null) {
                m3 m3VarA = this.f3293f.a(d33Var, z1Var4);
                try {
                    Iterator it = z1Var4.f12368a0.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            str = (String) it.next();
                            b.b bVarA = m3VarA.a(str);
                            if (bVarA != null && bVarA.b()) {
                                break;
                            }
                        } else {
                            uu0 uu0Var = new uu0(b(), 2);
                            Duration.f72038b.getClass();
                            xa2Var2.f11652a = uu0Var;
                            xa2Var2.f11659h = 5;
                            if (this.f3292e.a(uu0Var, z1Var4, 0L, xa2Var2) != coroutineSingletons) {
                                return uu0Var;
                            }
                        }
                    }
                    b.i8 i8Var = rw0.f9327f;
                    o2 o2Var2 = fb2Var.f3291d;
                    o2Var2.getClass();
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                    int i12 = z1Var4.f12409w;
                    xa2Var2.f11652a = fb2Var;
                    xa2Var2.f11653b = z1Var4;
                    xa2Var2.f11654c = o2Var2;
                    xa2Var2.f11655d = null;
                    xa2Var2.f11656e = jElapsedRealtime;
                    xa2Var2.f11659h = 2;
                    objA = bVar.a(str, i12, xa2Var2);
                    if (objA != coroutineSingletons) {
                    }
                } catch (CancellationException unused2) {
                    z1Var2 = z1Var;
                    fb2Var = this;
                }
            } else {
                Intrinsics.m("serverTransaction");
                throw null;
            }
        } else {
            if (i11 == 1) {
                bVar = xa2Var2.f11655d;
                String str2 = (String) xa2Var2.f11654c;
                z1 z1Var5 = xa2Var2.f11653b;
                fb2 fb2Var3 = (fb2) xa2Var2.f11652a;
                try {
                    ResultKt.b(obj);
                    str = str2;
                    z1Var4 = z1Var5;
                    fb2 fb2Var4 = fb2Var3;
                    b.i8 i8Var2 = rw0.f9327f;
                    o2 o2Var22 = fb2Var4.f3291d;
                    o2Var22.getClass();
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                    int i122 = z1Var4.f12409w;
                    xa2Var2.f11652a = fb2Var4;
                    xa2Var2.f11653b = z1Var4;
                    xa2Var2.f11654c = o2Var22;
                    xa2Var2.f11655d = null;
                    xa2Var2.f11656e = jElapsedRealtime;
                    xa2Var2.f11659h = 2;
                    objA = bVar.a(str, i122, xa2Var2);
                    if (objA != coroutineSingletons) {
                        fb2 fb2Var5 = fb2Var4;
                        o2Var = o2Var22;
                        obj = objA;
                        fb2Var2 = fb2Var5;
                        Duration.Companion companion = Duration.f72038b;
                        o2Var.getClass();
                        jH = DurationKt.h(SystemClock.elapsedRealtime() - jElapsedRealtime, DurationUnit.f72045d);
                        a1Var = (b.a1) obj;
                        cv2Var = fb2Var2.f3292e;
                        xa2Var2.f11652a = fb2Var2;
                        xa2Var2.f11653b = z1Var4;
                        xa2Var2.f11654c = a1Var;
                        xa2Var2.f11659h = 3;
                        z1Var3 = z1Var4;
                        if (cv2Var.a(a1Var, z1Var3, jH, xa2Var2) == coroutineSingletons) {
                        }
                    }
                } catch (CancellationException unused3) {
                    z1Var2 = z1Var5;
                    fb2Var = fb2Var3;
                }
            } else {
                if (i11 != 2) {
                    if (i11 == 3) {
                        b.a1 a1Var2 = (b.a1) xa2Var2.f11654c;
                        z1 z1Var6 = xa2Var2.f11653b;
                        ResultKt.b(obj);
                        return a1Var2;
                    }
                    if (i11 != 4 && i11 != 5) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    uu0 uu0Var2 = (uu0) xa2Var2.f11652a;
                    ResultKt.b(obj);
                    return uu0Var2;
                }
                long j11 = xa2Var2.f11656e;
                o2Var = (o2) xa2Var2.f11654c;
                z1 z1Var7 = xa2Var2.f11653b;
                fb2 fb2Var6 = (fb2) xa2Var2.f11652a;
                try {
                    ResultKt.b(obj);
                    jElapsedRealtime = j11;
                    z1Var4 = z1Var7;
                    fb2Var2 = fb2Var6;
                    try {
                        Duration.Companion companion2 = Duration.f72038b;
                        o2Var.getClass();
                        jH = DurationKt.h(SystemClock.elapsedRealtime() - jElapsedRealtime, DurationUnit.f72045d);
                        a1Var = (b.a1) obj;
                        cv2Var = fb2Var2.f3292e;
                        xa2Var2.f11652a = fb2Var2;
                        xa2Var2.f11653b = z1Var4;
                        xa2Var2.f11654c = a1Var;
                        xa2Var2.f11659h = 3;
                        z1Var3 = z1Var4;
                        try {
                            if (cv2Var.a(a1Var, z1Var3, jH, xa2Var2) == coroutineSingletons) {
                                return a1Var;
                            }
                        } catch (CancellationException unused4) {
                            xa2Var2 = xa2Var2;
                            fb2Var = fb2Var2;
                            z1Var2 = z1Var3;
                            uu0 uu0Var3 = new uu0(fb2Var.b(), 2);
                            c2Var = t70.c2.f88780b;
                            qVar = new androidx.room.q(fb2Var, uu0Var3, z1Var2, continuation, 18);
                            xa2Var2.f11652a = uu0Var3;
                            xa2Var2.f11653b = null;
                            xa2Var2.f11654c = null;
                            xa2Var2.f11655d = null;
                            xa2Var2.f11659h = 4;
                            if (m0.y(c2Var, qVar, xa2Var2) != coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        }
                    } catch (CancellationException unused5) {
                        z1Var3 = z1Var4;
                    }
                } catch (CancellationException unused6) {
                    z1Var2 = z1Var7;
                    fb2Var = fb2Var6;
                }
            }
            uu0 uu0Var32 = new uu0(fb2Var.b(), 2);
            c2Var = t70.c2.f88780b;
            qVar = new androidx.room.q(fb2Var, uu0Var32, z1Var2, continuation, 18);
            xa2Var2.f11652a = uu0Var32;
            xa2Var2.f11653b = null;
            xa2Var2.f11654c = null;
            xa2Var2.f11655d = null;
            xa2Var2.f11659h = 4;
            if (m0.y(c2Var, qVar, xa2Var2) != coroutineSingletons) {
                return uu0Var32;
            }
        }
        return coroutineSingletons;
    }
}
