package ads_mobile_sdk;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import zk.d;

/* loaded from: classes2.dex */
public final class tm3 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final fz f10014a;

    /* renamed from: b, reason: collision with root package name */
    public final ci3 f10015b;

    public tm3(fz consentManager, ci3 traceLogger) {
        Intrinsics.g(consentManager, "consentManager");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f10014a = consentManager;
        this.f10015b = traceLogger;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        sm3 sm3Var;
        tm3 tm3Var;
        if (continuation instanceof sm3) {
            sm3Var = (sm3) continuation;
            int i5 = sm3Var.f9618d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                sm3Var.f9618d = i5 - Integer.MIN_VALUE;
            } else {
                sm3Var = new sm3(this, continuation);
            }
        }
        Object obj = sm3Var.f9616b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = sm3Var.f9618d;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tm3Var = sm3Var.f9615a;
            try {
                ResultKt.b(obj);
                return Unit.f71706a;
            } catch (yi1 e3) {
                e = e3;
                zi3.a(null, e, true, false);
                tm3Var.f10015b.a("Allowlist proto deserialization failed.", (Throwable) e);
                return Unit.f71706a;
            }
        }
        ResultKt.b(obj);
        String str = (String) map.get("allowlist");
        if (str == null) {
            zi3.a(6, "Allowlist is missing from an updateAllowlist GMSG: " + map, null);
            return Unit.f71706a;
        }
        try {
            byte[] bArrA = d.f98548e.a(str);
            try {
                fz fzVar = this.f10014a;
                ax axVarA = ax.a(bArrA);
                Intrinsics.f(axVarA, "parseFrom(...)");
                sm3Var.f9615a = this;
                sm3Var.f9618d = 1;
                if (fzVar.b(axVarA, sm3Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            } catch (yi1 e11) {
                e = e11;
                tm3Var = this;
                zi3.a(null, e, true, false);
                tm3Var.f10015b.a("Allowlist proto deserialization failed.", (Throwable) e);
                return Unit.f71706a;
            }
        } catch (IllegalArgumentException e12) {
            zi3.a(null, e12, true, false);
            this.f10015b.a("Allowlist gmsg param is not a valid encoded string.", (Throwable) e12);
            return Unit.f71706a;
        }
    }

    @Override // b.gb
    public final int b() {
        return 12;
    }
}
