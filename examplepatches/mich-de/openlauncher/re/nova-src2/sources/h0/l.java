package h0;

import c0.l1;
import c0.n;
import c0.s1;
import c0.y;
import com.vungle.ads.internal.protos.Sdk;
import g0.n1;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static final float f58760a = Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE;

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(n1 n1Var, float f11, n nVar, y yVar, Function1 function1, ContinuationImpl continuationImpl) {
        j jVar;
        float f12;
        Ref.FloatRef floatRef;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f58753x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f58753x = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(continuationImpl);
            }
        }
        Object obj = jVar.f58752w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f58753x;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ref.FloatRef floatRef2 = new Ref.FloatRef();
            boolean z11 = ((Number) nVar.a()).floatValue() == 0.0f;
            i iVar = new i(f11, floatRef2, n1Var, function1, 0);
            jVar.f58750u = nVar;
            jVar.f58751v = floatRef2;
            jVar.f58749t = f11;
            jVar.f58753x = 1;
            if (s1.d(nVar, yVar, !z11, iVar, jVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            f12 = f11;
            floatRef = floatRef2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            f12 = jVar.f58749t;
            floatRef = jVar.f58751v;
            nVar = jVar.f58750u;
            ResultKt.b(obj);
        }
        return new a(new Float(f12 - floatRef.f71860a), nVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(n1 n1Var, float f11, float f12, n nVar, l1 l1Var, Function1 function1, ContinuationImpl continuationImpl) {
        k kVar;
        float fFloatValue;
        n nVar2;
        Ref.FloatRef floatRef;
        float f13 = f11;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f58759y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f58759y = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(continuationImpl);
            }
        }
        k kVar2 = kVar;
        Object obj = kVar2.f58758x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar2.f58759y;
        if (i11 == 0) {
            ResultKt.b(obj);
            Ref.FloatRef floatRef2 = new Ref.FloatRef();
            fFloatValue = ((Number) nVar.a()).floatValue();
            Float f14 = new Float(f13);
            boolean z11 = ((Number) nVar.a()).floatValue() == 0.0f;
            i iVar = new i(f12, floatRef2, n1Var, function1, 1);
            kVar2.f58756v = nVar;
            kVar2.f58757w = floatRef2;
            kVar2.f58754t = f13;
            kVar2.f58755u = fFloatValue;
            kVar2.f58759y = 1;
            if (s1.e(nVar, f14, l1Var, !z11, iVar, kVar2) == coroutineSingletons) {
                return coroutineSingletons;
            }
            nVar2 = nVar;
            floatRef = floatRef2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            float f15 = kVar2.f58755u;
            float f16 = kVar2.f58754t;
            floatRef = kVar2.f58757w;
            nVar2 = kVar2.f58756v;
            ResultKt.b(obj);
            fFloatValue = f15;
            f13 = f16;
        }
        return new a(new Float(f13 - floatRef.f71860a), c0.f.e(nVar2, 0.0f, d(((Number) nVar2.a()).floatValue(), fFloatValue), 29));
    }

    public static final void c(c0.l lVar, n1 n1Var, Function1 function1, float f11) {
        float fA;
        try {
            fA = n1Var.a(f11);
        } catch (CancellationException unused) {
            lVar.a();
            fA = 0.0f;
        }
        function1.invoke(Float.valueOf(fA));
        if (Math.abs(f11 - fA) > 0.5f) {
            lVar.a();
        }
    }

    public static final float d(float f11, float f12) {
        if (f12 == 0.0f) {
            return 0.0f;
        }
        return (f12 <= 0.0f ? f11 >= f12 : f11 <= f12) ? f11 : f12;
    }
}
