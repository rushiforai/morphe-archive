package g0;

import androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException;
import b.u4;
import java.util.List;
import kotlin.Function;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.BaseContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import l1.v6;

/* loaded from: classes2.dex */
public abstract class t2 {

    /* renamed from: a, reason: collision with root package name */
    public static final h0 f56708a = new h0(3, null, 2);

    /* JADX WARN: Removed duplicated region for block: B:17:0x003e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004e A[LOOP:0: B:19:0x004c->B:20:0x004e, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x003c -> B:18:0x003f). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(v2.b bVar, BaseContinuationImpl baseContinuationImpl) {
        k2 k2Var;
        int size;
        int i5;
        int i11;
        int size2;
        if (baseContinuationImpl instanceof k2) {
            k2Var = (k2) baseContinuationImpl;
            int i12 = k2Var.f56612v;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                k2Var.f56612v = i12 - Integer.MIN_VALUE;
            } else {
                k2Var = new k2(baseContinuationImpl);
            }
        }
        Object objF = k2Var.f56611u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = k2Var.f56612v;
        if (i13 == 0) {
            ResultKt.b(objF);
            k2Var.f56610t = bVar;
            k2Var.f56612v = 1;
            objF = ((v2.j0) bVar).f(v2.n.f91981b, k2Var);
            if (objF == coroutineSingletons) {
            }
            v2.m mVar = (v2.m) objF;
            List list = mVar.f91975a;
            size = list.size();
            i5 = 0;
            while (i11 < size) {
            }
            List list2 = mVar.f91975a;
            size2 = list2.size();
            while (i5 < size2) {
            }
            return Unit.f71706a;
        }
        if (i13 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        bVar = k2Var.f56610t;
        ResultKt.b(objF);
        v2.m mVar2 = (v2.m) objF;
        List list3 = mVar2.f91975a;
        size = list3.size();
        i5 = 0;
        for (i11 = 0; i11 < size; i11++) {
            ((v2.t) list3.get(i11)).a();
        }
        List list22 = mVar2.f91975a;
        size2 = list22.size();
        while (i5 < size2) {
            if (((v2.t) list22.get(i5)).f91993d) {
                k2Var.f56610t = bVar;
                k2Var.f56612v = 1;
                objF = ((v2.j0) bVar).f(v2.n.f91981b, k2Var);
                if (objF == coroutineSingletons) {
                    return coroutineSingletons;
                }
                v2.m mVar22 = (v2.m) objF;
                List list32 = mVar22.f91975a;
                size = list32.size();
                i5 = 0;
                while (i11 < size) {
                }
                List list222 = mVar22.f91975a;
                size2 = list222.size();
                while (i5 < size2) {
                }
            } else {
                i5++;
            }
        }
        return Unit.f71706a;
    }

    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /* JADX WARN: Removed duplicated region for block: B:17:0x004c A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x004a -> B:18:0x004d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final java.lang.Object b(v2.b r5, boolean r6, v2.n r7, kotlin.coroutines.Continuation r8) {
        /*
            boolean r0 = r8 instanceof g0.i2
            if (r0 == 0) goto L13
            r0 = r8
            g0.i2 r0 = (g0.i2) r0
            int r1 = r0.f56585x
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f56585x = r1
            goto L18
        L13:
            g0.i2 r0 = new g0.i2
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.f56584w
            kotlin.coroutines.intrinsics.CoroutineSingletons r1 = kotlin.coroutines.intrinsics.CoroutineSingletons.f71806a
            int r2 = r0.f56585x
            r3 = 1
            if (r2 == 0) goto L39
            if (r2 != r3) goto L31
            boolean r5 = r0.f56583v
            v2.n r6 = r0.f56582u
            v2.b r7 = r0.f56581t
            kotlin.ResultKt.b(r8)
            r4 = r6
            r6 = r5
            r5 = r7
            r7 = r4
            goto L4d
        L31:
            java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            r5.<init>(r6)
            throw r5
        L39:
            kotlin.ResultKt.b(r8)
        L3c:
            r0.f56581t = r5
            r0.f56582u = r7
            r0.f56583v = r6
            r0.f56585x = r3
            v2.j0 r5 = (v2.j0) r5
            java.lang.Object r8 = r5.f(r7, r0)
            if (r8 != r1) goto L4d
            return r1
        L4d:
            v2.m r8 = (v2.m) r8
            boolean r2 = f(r8, r6)
            if (r2 == 0) goto L3c
            java.util.List r5 = r8.f91975a
            r6 = 0
            java.lang.Object r5 = r5.get(r6)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: g0.t2.b(v2.b, boolean, v2.n, kotlin.coroutines.Continuation):java.lang.Object");
    }

    public static /* synthetic */ Object c(v2.b bVar, Continuation continuation, int i5) {
        v2.n nVar = v2.n.f91980a;
        boolean z11 = (i5 & 1) != 0;
        if ((i5 & 2) != 0) {
            nVar = v2.n.f91981b;
        }
        return b(bVar, z11, nVar, continuation);
    }

    public static final Object d(v2.x xVar, t0.p1 p1Var, iy.s sVar, Continuation continuation) {
        Object objD = t70.k0.d(new c0.b1(xVar, p1Var, sVar, new h1(xVar), (Continuation) null, 9), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public static Object e(v2.x xVar, v6 v6Var, Function1 function1, Continuation continuation, int i5) {
        Function function = v6Var;
        if ((i5 & 4) != 0) {
            function = f56708a;
        }
        Object objD = t70.k0.d(new c0.g(xVar, function, (Function) null, (Function) null, function1, (Continuation) null, 3), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public static boolean f(v2.m mVar, boolean z11) {
        List list = mVar.f91975a;
        int size = list.size();
        int i5 = 0;
        while (true) {
            boolean zB = true;
            if (i5 >= size) {
                return true;
            }
            v2.t tVar = (v2.t) list.get(i5);
            if (!z11) {
                zB = v2.g0.b(tVar);
            } else if (tVar.l() || tVar.f91997h || !tVar.f91993d) {
                zB = false;
            }
            if (!zB) {
                return false;
            }
            i5++;
        }
    }

    public static t70.g2 g(t70.j0 j0Var, t70.r1 r1Var, Function2 function2) {
        return t70.m0.t(j0Var, null, t70.l0.f88816d, new dm.c(r1Var, function2, null), 1);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object h(v2.b bVar, v2.n nVar, BaseContinuationImpl baseContinuationImpl) {
        q2 q2Var;
        Ref.ObjectRef objectRef;
        if (baseContinuationImpl instanceof q2) {
            q2Var = (q2) baseContinuationImpl;
            int i5 = q2Var.f56671v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q2Var.f56671v = i5 - Integer.MIN_VALUE;
            } else {
                q2Var = new q2(baseContinuationImpl);
            }
        }
        Object obj = q2Var.f56670u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q2Var.f56671v;
        try {
            if (i11 == 0) {
                Ref.ObjectRef objectRefL = u4.l(obj);
                objectRefL.f71863a = r0.f56676a;
                long jB = ((v2.j0) bVar).f91952f.E().b();
                r2 r2Var = new r2(nVar, objectRefL, null);
                q2Var.f56669t = objectRefL;
                q2Var.f56671v = 1;
                if (((v2.j0) bVar).k(jB, r2Var, q2Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                objectRef = objectRefL;
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                objectRef = q2Var.f56669t;
                ResultKt.b(obj);
            }
            return objectRef.f71863a;
        } catch (PointerEventTimeoutCancellationException unused) {
            return t0.f56702a;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00b7, code lost:
    
        if (r0 == r2) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00b7 -> B:13:0x0030). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object i(v2.b bVar, v2.n nVar, BaseContinuationImpl baseContinuationImpl) {
        s2 s2Var;
        v2.b bVar2;
        s2 s2Var2;
        v2.n nVar2;
        v2.b bVar3;
        v2.n nVar3;
        int size;
        int i5;
        if (baseContinuationImpl instanceof s2) {
            s2Var = (s2) baseContinuationImpl;
            int i11 = s2Var.f56694w;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                s2Var.f56694w = i11 - Integer.MIN_VALUE;
            } else {
                s2Var = new s2(baseContinuationImpl);
            }
        }
        Object objF = s2Var.f56693v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = s2Var.f56694w;
        if (i12 == 0) {
            ResultKt.b(objF);
            bVar2 = bVar;
            s2Var2 = s2Var;
            nVar2 = nVar;
            s2Var2.f56691t = bVar2;
            s2Var2.f56692u = nVar2;
            s2Var2.f56694w = 1;
            v2.j0 j0Var = (v2.j0) bVar2;
            objF = j0Var.f(nVar2, s2Var2);
            if (objF != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i12 == 1) {
            nVar3 = s2Var.f56692u;
            v2.b bVar4 = s2Var.f56691t;
            ResultKt.b(objF);
            bVar3 = bVar4;
            List list = ((v2.m) objF).f91975a;
            size = list.size();
            while (i5 < size) {
            }
            return list.get(0);
        }
        if (i12 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        nVar3 = s2Var.f56692u;
        v2.b bVar5 = s2Var.f56691t;
        ResultKt.b(objF);
        v2.b bVar6 = bVar5;
        v2.n nVar4 = nVar3;
        s2Var2 = s2Var;
        nVar2 = nVar4;
        List list2 = ((v2.m) objF).f91975a;
        int size2 = list2.size();
        for (int i13 = 0; i13 < size2; i13++) {
            if (((v2.t) list2.get(i13)).l()) {
                return null;
            }
        }
        bVar2 = bVar6;
        s2Var2.f56691t = bVar2;
        s2Var2.f56692u = nVar2;
        s2Var2.f56694w = 1;
        v2.j0 j0Var2 = (v2.j0) bVar2;
        objF = j0Var2.f(nVar2, s2Var2);
        if (objF != coroutineSingletons) {
            s2 s2Var3 = s2Var2;
            nVar3 = nVar2;
            s2Var = s2Var3;
            bVar3 = j0Var2;
            List list3 = ((v2.m) objF).f91975a;
            size = list3.size();
            for (i5 = 0; i5 < size; i5++) {
                if (!v2.g0.c((v2.t) list3.get(i5))) {
                    int size3 = list3.size();
                    for (int i14 = 0; i14 < size3; i14++) {
                        v2.t tVar = (v2.t) list3.get(i14);
                        if (tVar.l()) {
                            return null;
                        }
                        v2.j0 j0Var3 = (v2.j0) bVar3;
                        if (v2.g0.i(tVar, j0Var3.f91952f.f91974j, j0Var3.j())) {
                            return null;
                        }
                    }
                    v2.n nVar5 = v2.n.f91982c;
                    s2Var.f56691t = bVar3;
                    s2Var.f56692u = nVar3;
                    s2Var.f56694w = 2;
                    v2.j0 j0Var4 = (v2.j0) bVar3;
                    objF = j0Var4.f(nVar5, s2Var);
                    bVar6 = j0Var4;
                }
            }
            return list3.get(0);
        }
        return coroutineSingletons;
    }
}
