package f50;

import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.i0;
import t70.m0;
import t70.q0;
import t70.q1;
import t70.r1;
import t70.s1;

/* loaded from: classes.dex */
public abstract class a {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(g50.e eVar, k50.d dVar, ContinuationImpl continuationImpl) {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f54315w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f54315w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuationImpl);
            }
        }
        Object objPlus = bVar.f54314v;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = bVar.f54315w;
        int i12 = 2;
        int i13 = 1;
        if (i11 == 0) {
            ResultKt.b(objPlus);
            r1 r1Var = dVar.f71127e;
            bVar.f54312t = eVar;
            bVar.f54313u = dVar;
            bVar.f54315w = 1;
            i0 i0Var = i.f54328a;
            s1 s1Var = new s1(r1Var);
            objPlus = eVar.getCoroutineContext().plus(s1Var).plus(i.f54328a);
            r1 r1Var2 = (r1) bVar.getContext().get(q1.f88853a);
            if (r1Var2 != null) {
                s1Var.w(new f20.h(r1Var2.P(new f20.h(s1Var, i12), true, true), i13));
            }
            if (objPlus != obj) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objPlus);
            return objPlus;
        }
        dVar = bVar.f54313u;
        eVar = bVar.f54312t;
        ResultKt.b(objPlus);
        CoroutineContext coroutineContext = (CoroutineContext) objPlus;
        q0 q0VarE = m0.e(eVar, coroutineContext.plus(new k(coroutineContext)), new b00.e(eVar, dVar, null, 28), 2);
        bVar.f54312t = null;
        bVar.f54313u = null;
        bVar.f54315w = 2;
        Object objY = q0VarE.y(bVar);
        return objY == obj ? obj : objY;
    }
}
