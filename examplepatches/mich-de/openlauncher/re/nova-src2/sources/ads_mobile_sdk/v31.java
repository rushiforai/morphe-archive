package ads_mobile_sdk;

import b.x2;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class v31 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final xj f10563a;

    public v31(xj appState) {
        Intrinsics.g(appState, "appState");
        this.f10563a = appState;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.IN_MEMORY_SDK_CORE_DATA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        u31 u31Var;
        if (continuation instanceof u31) {
            u31Var = (u31) continuation;
            int i5 = u31Var.f10193c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u31Var.f10193c = i5 - Integer.MIN_VALUE;
            } else {
                u31Var = new u31(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = u31Var.f10191a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u31Var.f10193c;
        if (i11 == 0) {
            ResultKt.b(objA);
            u31Var.f10193c = 1;
            xj xjVar = this.f10563a;
            xjVar.getClass();
            objA = xj.a(xjVar, u31Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        return new xu0(new t31((Map) objA));
    }
}
