package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class g3 extends b.h1 {

    /* renamed from: c, reason: collision with root package name */
    public final d3 f3624c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f3625d;

    public g3(d3 adIdInfoSignalSource, jr0 flags) {
        Intrinsics.g(adIdInfoSignalSource, "adIdInfoSignalSource");
        Intrinsics.g(flags, "flags");
        this.f3624c = adIdInfoSignalSource;
        this.f3625d = flags;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.c61
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(Continuation continuation) {
        f3 f3Var;
        if (continuation instanceof f3) {
            f3Var = (f3) continuation;
            int i5 = f3Var.f3133c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f3Var.f3133c = i5 - Integer.MIN_VALUE;
            } else {
                f3Var = new f3(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = f3Var.f3131a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f3Var.f3133c;
        if (i11 == 0) {
            ResultKt.b(objA);
            jr0 jr0Var = this.f3625d;
            jr0Var.getClass();
            Boolean bool = Boolean.TRUE;
            jn jnVar = jn.a$10;
            if (((Boolean) jr0Var.a("gads:ad_id_init_enabled", bool, jnVar)).booleanValue() && !((Boolean) jr0Var.a("gads:ad_id_init_from_signal_source_enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                f3Var.f3133c = 1;
                d3 d3Var = this.f3624c;
                d3Var.getClass();
                objA = dr.a(d3Var, f3Var);
                if (objA == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return new xu0(Unit.f71706a);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(objA);
        return new xu0(Unit.f71706a);
    }
}
