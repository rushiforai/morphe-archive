package ws;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c extends FunctionReferenceImpl implements Function1 {
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object value;
        ft.b p02 = (ft.b) obj;
        Intrinsics.g(p02, "p0");
        i2 i2Var = ((e) this.receiver).f94662h;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, a.a((a) value, null, false, null, p02, null, false, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE)));
        return Unit.f71706a;
    }
}
