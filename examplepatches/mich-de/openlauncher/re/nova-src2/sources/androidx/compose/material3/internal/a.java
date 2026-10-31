package androidx.compose.material3.internal;

import b2.t;
import e0.f1;
import f1.y;
import g0.d1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import m1.f;
import m1.h;
import m1.i;
import m1.l;
import t70.k0;

/* loaded from: classes2.dex */
public abstract class a {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(Function0 function0, Function2 function2, ContinuationImpl continuationImpl) {
        i iVar;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f75694u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f75694u = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(continuationImpl);
            }
        }
        Object obj = iVar.f75693t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f75694u;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                l lVar = new l(function0, function2, null);
                iVar.f75694u = 1;
                if (k0.d(lVar, iVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
        } catch (f unused) {
        }
        return Unit.f71706a;
    }

    public static final Object b(y yVar, Object obj, float f11, SuspendLambda suspendLambda) {
        Object objC = yVar.c(obj, f1.f49976a, new h(yVar, f11, null), suspendLambda);
        return objC == CoroutineSingletons.f71806a ? objC : Unit.f71706a;
    }

    public static final t c(t tVar, y yVar, Function2 function2) {
        d1 d1Var = d1.f56493a;
        return tVar.then(new DraggableAnchorsElement(yVar, function2));
    }
}
