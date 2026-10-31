package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public abstract class m1 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(e0.a2 a2Var, float f11, c0.m mVar, ContinuationImpl continuationImpl) {
        i1 i1Var;
        Ref.FloatRef floatRef;
        if (continuationImpl instanceof i1) {
            i1Var = (i1) continuationImpl;
            int i5 = i1Var.f56580v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i1Var.f56580v = i5 - Integer.MIN_VALUE;
            } else {
                i1Var = new i1(continuationImpl);
            }
        }
        Object obj = i1Var.f56579u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = i1Var.f56580v;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ref.FloatRef floatRef2 = new Ref.FloatRef();
            Function2 j1Var = new j1(f11, mVar, floatRef2, null);
            i1Var.f56578t = floatRef2;
            i1Var.f56580v = 1;
            if (a2Var.d(e0.f1.f49976a, j1Var, i1Var) == obj2) {
                return obj2;
            }
            floatRef = floatRef2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            floatRef = i1Var.f56578t;
            ResultKt.b(obj);
        }
        return new Float(floatRef.f71860a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(b2 b2Var, float f11, ContinuationImpl continuationImpl) {
        k1 k1Var;
        Ref.FloatRef floatRef;
        if (continuationImpl instanceof k1) {
            k1Var = (k1) continuationImpl;
            int i5 = k1Var.f56609v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k1Var.f56609v = i5 - Integer.MIN_VALUE;
            } else {
                k1Var = new k1(continuationImpl);
            }
        }
        Object obj = k1Var.f56608u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = k1Var.f56609v;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ref.FloatRef floatRef2 = new Ref.FloatRef();
            Function2 l1Var = new l1(floatRef2, f11, null);
            k1Var.f56607t = floatRef2;
            k1Var.f56609v = 1;
            if (b2Var.d(e0.f1.f49976a, l1Var, k1Var) == obj2) {
                return obj2;
            }
            floatRef = floatRef2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            floatRef = k1Var.f56607t;
            ResultKt.b(obj);
        }
        return new Float(floatRef.f71860a);
    }

    public static Object c(b2 b2Var, ContinuationImpl continuationImpl) {
        Object objD = b2Var.d(e0.f1.f49976a, new b.x1(2, null, 22), continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }
}
