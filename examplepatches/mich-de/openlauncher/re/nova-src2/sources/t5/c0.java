package t5;

import androidx.datastore.core.CorruptionException;
import java.util.List;
import kotlin.ExceptionsKt;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import l1.a2;
import t70.g2;
import w70.p1;

/* loaded from: classes2.dex */
public final class c0 implements g {

    /* renamed from: a, reason: collision with root package name */
    public final j1 f88543a;

    /* renamed from: b, reason: collision with root package name */
    public final b f88544b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f88545c;

    /* renamed from: d, reason: collision with root package name */
    public final p1 f88546d;

    /* renamed from: f, reason: collision with root package name */
    public int f88548f;

    /* renamed from: g, reason: collision with root package name */
    public g2 f88549g;

    /* renamed from: i, reason: collision with root package name */
    public final a2 f88551i;

    /* renamed from: j, reason: collision with root package name */
    public final a70.d f88552j;

    /* renamed from: k, reason: collision with root package name */
    public final a70.d f88553k;

    /* renamed from: l, reason: collision with root package name */
    public final e1 f88554l;

    /* renamed from: e, reason: collision with root package name */
    public final c80.d f88547e = new c80.d();

    /* renamed from: h, reason: collision with root package name */
    public final d0 f88550h = new d0(0);

    public c0(j1 j1Var, List list, b bVar, t70.j0 j0Var) {
        this.f88543a = j1Var;
        this.f88544b = bVar;
        this.f88545c = j0Var;
        Continuation continuation = null;
        this.f88546d = new p1(new pu.h(this, continuation, 8));
        a2 a2Var = new a2();
        a2Var.f73010d = this;
        a2Var.f73007a = new c80.d();
        a2Var.f73008b = t70.m0.b();
        a2Var.f73009c = b70.g.I1(list);
        this.f88551i = a2Var;
        this.f88552j = LazyKt.a(new m(this, 1));
        this.f88553k = LazyKt.a(new m(this, 0));
        this.f88554l = new e1(j0Var, new androidx.fragment.app.p(this, 28), new pu.q(this, continuation, 26));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(c0 c0Var, ContinuationImpl continuationImpl) {
        q qVar;
        c80.d dVar;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f88670x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f88670x = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(c0Var, continuationImpl);
            }
        }
        Object obj = qVar.f88668v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f88670x;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = c0Var.f88547e;
            qVar.f88666t = c0Var;
            qVar.f88667u = dVar;
            qVar.f88670x = 1;
            if (dVar.e(qVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c80.d dVar2 = qVar.f88667u;
            c0 c0Var2 = qVar.f88666t;
            ResultKt.b(obj);
            dVar = dVar2;
            c0Var = c0Var2;
        }
        try {
            int i12 = c0Var.f88548f - 1;
            c0Var.f88548f = i12;
            if (i12 == 0) {
                g2 g2Var = c0Var.f88549g;
                if (g2Var != null) {
                    g2Var.c(null);
                }
                c0Var.f88549g = null;
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(10:0|2|(2:4|(1:6)(1:7))(0)|8|71|(8:(1:(1:(2:18|19))(3:20|21|22))|13|14|51|64|(1:66)(1:67)|68|69)(5:23|70|24|(3:26|73|27)(3:37|(1:39)(1:40)|(2:42|(2:44|(1:46))(2:55|56))(2:57|(2:59|60)(2:61|62)))|50)|47|75|48|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0073, code lost:
    
        if (r9 == r1) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0076, code lost:
    
        r8 = r11;
        r11 = r9;
        r9 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00b7, code lost:
    
        if (r9 == r1) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00bd, code lost:
    
        r9 = th;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v7, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r2v8, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r9v0, types: [t5.c0] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v13 */
    /* JADX WARN: Type inference failed for: r9v15 */
    /* JADX WARN: Type inference failed for: r9v17 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v27 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(c0 c0Var, q0 q0Var, ContinuationImpl continuationImpl) {
        r rVar;
        t70.s sVar;
        Throwable thA;
        t70.s sVar2;
        Object objE;
        c0 c0Var2;
        if (continuationImpl instanceof r) {
            rVar = (r) continuationImpl;
            int i5 = rVar.f88680y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f88680y = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(c0Var, continuationImpl);
            }
        }
        Object objA = rVar.f88678w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f88680y;
        boolean z11 = true;
        try {
        } catch (Throwable th2) {
            th = th2;
        }
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 == 2) {
                    t70.s sVar3 = rVar.f88677v;
                    c0 c0Var3 = rVar.f88676u;
                    q0 q0Var2 = (q0) rVar.f88675t;
                    ResultKt.b(objA);
                    sVar2 = sVar3;
                    c0Var2 = c0Var3;
                    q0Var = q0Var2;
                } else if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            }
            t70.r rVar2 = (t70.r) rVar.f88675t;
            ResultKt.b(objA);
            c0Var = rVar2;
            int i12 = Result.f71687b;
            sVar = c0Var;
            thA = Result.a(objA);
            t70.s sVar4 = sVar;
            if (thA != null) {
                sVar4.X(objA);
            } else {
                sVar4.j0(thA);
            }
            return Unit.f71706a;
        }
        ResultKt.b(objA);
        sVar2 = q0Var.f88672b;
        try {
            int i13 = Result.f71687b;
            i1 i1VarN = c0Var.f88550h.n();
            if (i1VarN instanceof c) {
                ?? r22 = q0Var.f88671a;
                CoroutineContext coroutineContext = q0Var.f88674d;
                rVar.f88675t = sVar2;
                rVar.f88680y = 1;
                try {
                    objE = c0Var.g().e(new y(c0Var, coroutineContext, r22, null), rVar);
                } catch (Throwable th3) {
                    th = th3;
                    th = th;
                    c0Var = sVar2;
                    int i14 = Result.f71687b;
                    objA = ResultKt.a(th);
                    sVar = c0Var;
                    thA = Result.a(objA);
                    t70.s sVar42 = sVar;
                    if (thA != null) {
                    }
                    return Unit.f71706a;
                }
            } else {
                if (!(i1VarN instanceof z0)) {
                    z11 = i1VarN instanceof l1;
                }
                if (!z11) {
                    if (i1VarN instanceof n0) {
                        throw ((n0) i1VarN).f88657b;
                    }
                    throw new NoWhenBranchMatchedException();
                }
                if (i1VarN != q0Var.f88673c) {
                    Intrinsics.e(i1VarN, "null cannot be cast to non-null type androidx.datastore.core.ReadException<T of androidx.datastore.core.DataStoreImpl.handleUpdate$lambda$2>");
                    throw ((z0) i1VarN).f88757b;
                }
                rVar.f88675t = q0Var;
                rVar.f88676u = c0Var;
                rVar.f88677v = sVar2;
                rVar.f88680y = 2;
                Object objH = c0Var.h(rVar);
                c0Var2 = c0Var;
                if (objH == coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            th = th4;
            c0Var = sVar2;
            int i142 = Result.f71687b;
            objA = ResultKt.a(th);
            sVar = c0Var;
            thA = Result.a(objA);
            t70.s sVar422 = sVar;
            if (thA != null) {
            }
            return Unit.f71706a;
        }
        ?? r23 = q0Var.f88671a;
        CoroutineContext coroutineContext2 = q0Var.f88674d;
        rVar.f88675t = sVar2;
        rVar.f88676u = null;
        rVar.f88677v = null;
        rVar.f88680y = 3;
        objE = c0Var2.g().e(new y(c0Var2, coroutineContext2, r23, null), rVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(c0 c0Var, ContinuationImpl continuationImpl) {
        s sVar;
        c80.d dVar;
        if (continuationImpl instanceof s) {
            sVar = (s) continuationImpl;
            int i5 = sVar.f88689x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sVar.f88689x = i5 - Integer.MIN_VALUE;
            } else {
                sVar = new s(c0Var, continuationImpl);
            }
        }
        Object obj = sVar.f88687v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sVar.f88689x;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = c0Var.f88547e;
            sVar.f88685t = c0Var;
            sVar.f88686u = dVar;
            sVar.f88689x = 1;
            if (dVar.e(sVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c80.d dVar2 = sVar.f88686u;
            c0 c0Var2 = sVar.f88685t;
            ResultKt.b(obj);
            dVar = dVar2;
            c0Var = c0Var2;
        }
        Continuation continuation = null;
        try {
            int i13 = c0Var.f88548f + 1;
            c0Var.f88548f = i13;
            if (i13 == 1) {
                c0Var.f88549g = t70.m0.t(c0Var.f88545c, null, null, new n(c0Var, continuation, i12), 3);
            }
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(c0 c0Var, boolean z11, Continuation continuation) {
        u uVar;
        c0 c0Var2;
        i1 i1Var;
        c0 c0Var3;
        Pair pair;
        if (continuation instanceof u) {
            uVar = (u) continuation;
            int i5 = uVar.f88704y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f88704y = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(c0Var, continuation);
            }
        }
        Object objA = uVar.f88702w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f88704y;
        if (i11 == 0) {
            ResultKt.b(objA);
            i1 i1VarN = c0Var.f88550h.n();
            if (i1VarN instanceof l1) {
                throw new IllegalStateException("This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542");
            }
            p0 p0VarG = c0Var.g();
            uVar.f88699t = c0Var;
            uVar.f88700u = i1VarN;
            uVar.f88701v = z11;
            uVar.f88704y = 1;
            Object objD = p0VarG.d(uVar);
            if (objD != coroutineSingletons) {
                c0Var2 = c0Var;
                i1Var = i1VarN;
                objA = objD;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                c0Var3 = uVar.f88699t;
                ResultKt.b(objA);
                pair = (Pair) objA;
                i1 i1Var2 = (i1) pair.f71683a;
                if (((Boolean) pair.f71684b).booleanValue()) {
                }
                return i1Var2;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c0Var3 = uVar.f88699t;
            ResultKt.b(objA);
            pair = (Pair) objA;
            i1 i1Var22 = (i1) pair.f71683a;
            if (((Boolean) pair.f71684b).booleanValue()) {
                c0Var3.f88550h.K(i1Var22);
            }
            return i1Var22;
        }
        z11 = uVar.f88701v;
        i1Var = uVar.f88700u;
        c0Var2 = uVar.f88699t;
        ResultKt.b(objA);
        int iIntValue = ((Number) objA).intValue();
        boolean z12 = i1Var instanceof c;
        int i12 = z12 ? i1Var.f88613a : -1;
        if (z12 && iIntValue == i12) {
            return i1Var;
        }
        Continuation continuation2 = null;
        if (z11) {
            p0 p0VarG2 = c0Var2.g();
            a1.c cVar = new a1.c(c0Var2, null);
            uVar.f88699t = c0Var2;
            uVar.f88700u = null;
            uVar.f88704y = 2;
            objA = p0VarG2.e(cVar, uVar);
            if (objA != coroutineSingletons) {
                c0Var3 = c0Var2;
                pair = (Pair) objA;
                i1 i1Var222 = (i1) pair.f71683a;
                if (((Boolean) pair.f71684b).booleanValue()) {
                }
                return i1Var222;
            }
        } else {
            p0 p0VarG3 = c0Var2.g();
            v vVar = new v(c0Var2, i12, continuation2, 0);
            uVar.f88699t = c0Var2;
            uVar.f88700u = null;
            uVar.f88704y = 3;
            objA = p0VarG3.a(vVar, uVar);
            if (objA != coroutineSingletons) {
                c0Var3 = c0Var2;
                pair = (Pair) objA;
                i1 i1Var2222 = (i1) pair.f71683a;
                if (((Boolean) pair.f71684b).booleanValue()) {
                }
                return i1Var2222;
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x009f A[Catch: CorruptionException -> 0x005f, TryCatch #3 {CorruptionException -> 0x005f, blocks: (B:19:0x005a, B:54:0x00ff, B:24:0x0068, B:51:0x00e0, B:32:0x0085, B:40:0x009f, B:42:0x00a5, B:36:0x008e, B:48:0x00cd), top: B:83:0x0020 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x013c A[Catch: all -> 0x016a, TryCatch #1 {all -> 0x016a, blocks: (B:61:0x012a, B:63:0x013c, B:64:0x0144), top: B:80:0x012a }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0144 A[Catch: all -> 0x016a, TRY_LEAVE, TryCatch #1 {all -> 0x016a, blocks: (B:61:0x012a, B:63:0x013c, B:64:0x0144), top: B:80:0x012a }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object f(c0 c0Var, boolean z11, ContinuationImpl continuationImpl) {
        w wVar;
        Ref.ObjectRef objectRef;
        CorruptionException corruptionException;
        c0 c0Var2;
        boolean z12;
        Ref.ObjectRef objectRef2;
        CorruptionException corruptionException2;
        Object objE;
        Ref.IntRef intRef;
        Ref.ObjectRef objectRef3;
        Object objD;
        c0 c0Var3;
        int i5;
        Object obj;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i11 = wVar.B;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                wVar.B = i11 - Integer.MIN_VALUE;
            } else {
                wVar = new w(c0Var, continuationImpl);
            }
        }
        Object objD2 = wVar.f88730z;
        Object cVar = CoroutineSingletons.f71806a;
        Continuation continuation = null;
        try {
        } catch (CorruptionException e3) {
            e = e3;
        }
        switch (wVar.B) {
            case 0:
                ResultKt.b(objD2);
                if (z11) {
                    wVar.f88724t = c0Var;
                    wVar.f88728x = z11;
                    wVar.B = 1;
                    objD2 = c0Var.i(wVar);
                    if (objD2 != cVar) {
                        int iHashCode = objD2 == null ? objD2.hashCode() : 0;
                        p0 p0VarG = c0Var.g();
                        wVar.f88724t = c0Var;
                        wVar.f88725u = objD2;
                        wVar.f88728x = z11;
                        wVar.f88729y = iHashCode;
                        wVar.B = 2;
                        objD = p0VarG.d(wVar);
                        if (objD != cVar) {
                            c0Var3 = c0Var;
                            i5 = iHashCode;
                            obj = objD2;
                            objD2 = objD;
                            return new c(obj, i5, ((Number) objD2).intValue());
                        }
                    }
                } else {
                    p0 p0VarG2 = c0Var.g();
                    wVar.f88724t = c0Var;
                    wVar.f88728x = z11;
                    wVar.B = 3;
                    objD2 = p0VarG2.d(wVar);
                    if (objD2 != cVar) {
                        int iIntValue = ((Number) objD2).intValue();
                        p0 p0VarG3 = c0Var.g();
                        v vVar = new v(c0Var, iIntValue, continuation, 1);
                        wVar.f88724t = c0Var;
                        wVar.f88728x = z11;
                        wVar.B = 4;
                        objD2 = p0VarG3.a(vVar, wVar);
                        if (objD2 == cVar) {
                        }
                        return (c) objD2;
                    }
                }
                return cVar;
            case 1:
                z11 = wVar.f88728x;
                c0Var = (c0) wVar.f88724t;
                ResultKt.b(objD2);
                if (objD2 == null) {
                }
                p0 p0VarG4 = c0Var.g();
                wVar.f88724t = c0Var;
                wVar.f88725u = objD2;
                wVar.f88728x = z11;
                wVar.f88729y = iHashCode;
                wVar.B = 2;
                objD = p0VarG4.d(wVar);
                if (objD != cVar) {
                }
                return cVar;
            case 2:
                i5 = wVar.f88729y;
                z11 = wVar.f88728x;
                obj = wVar.f88725u;
                c0Var3 = (c0) wVar.f88724t;
                try {
                    ResultKt.b(objD2);
                    return new c(obj, i5, ((Number) objD2).intValue());
                } catch (CorruptionException e11) {
                    e = e11;
                    c0Var = c0Var3;
                    objectRef = new Ref.ObjectRef();
                    b bVar = c0Var.f88544b;
                    wVar.f88724t = c0Var;
                    wVar.f88725u = e;
                    wVar.f88726v = objectRef;
                    wVar.f88727w = objectRef;
                    wVar.f88728x = z11;
                    wVar.B = 5;
                    Object objJ = bVar.j(e);
                    if (objJ != cVar) {
                        corruptionException = e;
                        objD2 = objJ;
                        c0Var2 = c0Var;
                        z12 = z11;
                        objectRef2 = objectRef;
                        objectRef2.f71863a = objD2;
                        Ref.IntRef intRef2 = new Ref.IntRef();
                        try {
                            x xVar = new x(objectRef, c0Var2, intRef2, null);
                            wVar.f88724t = corruptionException;
                            wVar.f88725u = objectRef;
                            wVar.f88726v = intRef2;
                            wVar.f88727w = null;
                            wVar.B = 6;
                            if (z12) {
                            }
                            if (objE != cVar) {
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            corruptionException2 = corruptionException;
                            ExceptionsKt.a(corruptionException2, th);
                            throw corruptionException2;
                        }
                    }
                    return cVar;
                }
            case 3:
                z11 = wVar.f88728x;
                c0Var = (c0) wVar.f88724t;
                ResultKt.b(objD2);
                int iIntValue2 = ((Number) objD2).intValue();
                p0 p0VarG32 = c0Var.g();
                v vVar2 = new v(c0Var, iIntValue2, continuation, 1);
                wVar.f88724t = c0Var;
                wVar.f88728x = z11;
                wVar.B = 4;
                objD2 = p0VarG32.a(vVar2, wVar);
                if (objD2 == cVar) {
                }
                return (c) objD2;
            case 4:
                boolean z13 = wVar.f88728x;
                ResultKt.b(objD2);
                return (c) objD2;
            case 5:
                z12 = wVar.f88728x;
                objectRef2 = wVar.f88727w;
                objectRef = (Ref.ObjectRef) wVar.f88726v;
                corruptionException = (CorruptionException) wVar.f88725u;
                c0Var2 = (c0) wVar.f88724t;
                ResultKt.b(objD2);
                objectRef2.f71863a = objD2;
                Ref.IntRef intRef22 = new Ref.IntRef();
                x xVar2 = new x(objectRef, c0Var2, intRef22, null);
                wVar.f88724t = corruptionException;
                wVar.f88725u = objectRef;
                wVar.f88726v = intRef22;
                wVar.f88727w = null;
                wVar.B = 6;
                if (z12) {
                    objE = c0Var2.g().e(new c0.g0(xVar2, continuation, 8), wVar);
                } else {
                    c0Var2.getClass();
                    objE = xVar2.invoke(wVar);
                }
                if (objE != cVar) {
                    intRef = intRef22;
                    objectRef3 = objectRef;
                    Object obj2 = objectRef3.f71863a;
                    cVar = new c(obj2, obj2 != null ? obj2.hashCode() : 0, intRef.f71861a);
                }
                return cVar;
            case 6:
                intRef = (Ref.IntRef) wVar.f88726v;
                objectRef3 = (Ref.ObjectRef) wVar.f88725u;
                corruptionException2 = (CorruptionException) wVar.f88724t;
                try {
                    ResultKt.b(objD2);
                    Object obj22 = objectRef3.f71863a;
                    cVar = new c(obj22, obj22 != null ? obj22.hashCode() : 0, intRef.f71861a);
                    return cVar;
                } catch (Throwable th3) {
                    th = th3;
                    ExceptionsKt.a(corruptionException2, th);
                    throw corruptionException2;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    @Override // t5.g
    public final Object a(Function2 function2, Continuation continuation) {
        n1 n1Var = (n1) continuation.getContext().get(m1.f88653a);
        if (n1Var != null) {
            n1Var.a(this);
        }
        return t70.m0.y(new n1(n1Var, this), new pu.h(this, function2, (Continuation) null), continuation);
    }

    public final p0 g() {
        return (p0) this.f88553k.getValue();
    }

    @Override // t5.g
    public final w70.m getData() {
        return this.f88546d;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0063, code lost:
    
        if (r4.h(r0) == r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(ContinuationImpl continuationImpl) throws Throwable {
        t tVar;
        c0 c0Var;
        int iIntValue;
        int i5;
        Throwable th2;
        c0 c0Var2;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i11 = tVar.f88696x;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                tVar.f88696x = i11 - Integer.MIN_VALUE;
            } else {
                tVar = new t(this, continuationImpl);
            }
        }
        Object objD = tVar.f88694v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = tVar.f88696x;
        try {
            if (i12 == 0) {
                ResultKt.b(objD);
                p0 p0VarG = g();
                tVar.f88692t = this;
                tVar.f88696x = 1;
                objD = p0VarG.d(tVar);
                if (objD != coroutineSingletons) {
                    c0Var = this;
                }
                return coroutineSingletons;
            }
            if (i12 != 1) {
                if (i12 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i5 = tVar.f88693u;
                c0Var2 = tVar.f88692t;
                try {
                    ResultKt.b(objD);
                    return Unit.f71706a;
                } catch (Throwable th3) {
                    th2 = th3;
                    c0Var2.f88550h.K(new z0(i5, th2));
                    throw th2;
                }
            }
            c0Var = tVar.f88692t;
            ResultKt.b(objD);
            a2 a2Var = c0Var.f88551i;
            tVar.f88692t = c0Var;
            tVar.f88693u = iIntValue;
            tVar.f88696x = 2;
        } catch (Throwable th4) {
            i5 = iIntValue;
            th2 = th4;
            c0Var2 = c0Var;
            c0Var2.f88550h.K(new z0(i5, th2));
            throw th2;
        }
        iIntValue = ((Number) objD).intValue();
    }

    public final Object i(ContinuationImpl continuationImpl) {
        return ((k1) this.f88552j.getValue()).a(new o(3, (Continuation) null), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object j(Object obj, boolean z11, ContinuationImpl continuationImpl) {
        a0 a0Var;
        Ref.IntRef intRef;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f88528w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f88528w = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        Object obj2 = a0Var.f88526u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a0Var.f88528w;
        if (i11 == 0) {
            ResultKt.b(obj2);
            Ref.IntRef intRef2 = new Ref.IntRef();
            k1 k1Var = (k1) this.f88552j.getValue();
            b0 b0Var = new b0(intRef2, this, obj, z11, null);
            a0Var.f88525t = intRef2;
            a0Var.f88528w = 1;
            if (k1Var.d(b0Var, a0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            intRef = intRef2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            intRef = a0Var.f88525t;
            ResultKt.b(obj2);
        }
        return new Integer(intRef.f71861a);
    }
}
