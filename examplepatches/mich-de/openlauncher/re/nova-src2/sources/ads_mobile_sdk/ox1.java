package ads_mobile_sdk;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ox1 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final y2 f8032a;

    public ox1(y2 adEventEmitter) {
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        this.f8032a = adEventEmitter;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x006b, code lost:
    
        if (r6.e(r5) == r0) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        nx1 nx1Var;
        ox1 ox1Var;
        if (continuation instanceof nx1) {
            nx1Var = (nx1) continuation;
            int i5 = nx1Var.f7719e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nx1Var.f7719e = i5 - Integer.MIN_VALUE;
            } else {
                nx1Var = new nx1(this, continuation);
            }
        }
        Object obj = nx1Var.f7717c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nx1Var.f7719e;
        if (i11 == 0) {
            ResultKt.b(obj);
            nx1Var.f7715a = this;
            nx1Var.f7716b = map;
            nx1Var.f7719e = 1;
            if (this.f8032a.n(nx1Var) != coroutineSingletons) {
                ox1Var = this;
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
        map = nx1Var.f7716b;
        ox1Var = nx1Var.f7715a;
        ResultKt.b(obj);
        CharSequence charSequence = (CharSequence) map.get("sccg");
        if (charSequence == null || charSequence.length() == 0) {
            return Unit.f71706a;
        }
        y2 y2Var = ox1Var.f8032a;
        nx1Var.f7715a = null;
        nx1Var.f7716b = null;
        nx1Var.f7719e = 2;
    }

    @Override // b.gb
    public final int b() {
        return 36;
    }
}
