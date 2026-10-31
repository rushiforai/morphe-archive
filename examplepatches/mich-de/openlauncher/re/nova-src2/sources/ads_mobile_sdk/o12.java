package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public final class o12 implements b.ka {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f7734a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f7735b;

    public o12(jr0 flags, b.m5 singletonEngineProvider) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(singletonEngineProvider, "singletonEngineProvider");
        this.f7734a = flags;
        this.f7735b = singletonEngineProvider;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0075, code lost:
    
        if (r8.d(r0) == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.ka
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ni.q qVar, Continuation continuation) {
        n12 n12Var;
        o12 o12Var;
        if (continuation instanceof n12) {
            n12Var = (n12) continuation;
            int i5 = n12Var.f7396d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n12Var.f7396d = i5 - Integer.MIN_VALUE;
            } else {
                n12Var = new n12(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = n12Var.f7394b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n12Var.f7396d;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = this.f7734a;
            jr0Var.getClass();
            if (!((Boolean) jr0Var.a("gads:preload_native_singleton:enabled", Boolean.FALSE, jn.a$10)).booleanValue() || !(qVar instanceof ui.q)) {
                return Unit.f71706a;
            }
            n12Var.f7393a = this;
            n12Var.f7396d = 1;
            if (m0.z(n12Var) != coroutineSingletons) {
                o12Var = this;
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
        o12Var = n12Var.f7393a;
        ResultKt.b(obj);
        wa3 wa3Var = (wa3) o12Var.f7735b.get();
        n12Var.f7393a = null;
        n12Var.f7396d = 2;
    }
}
