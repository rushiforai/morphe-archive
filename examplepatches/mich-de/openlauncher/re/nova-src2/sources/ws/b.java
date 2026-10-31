package ws;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class b extends FunctionReferenceImpl implements Function1 {
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object value;
        ou.a aVar = (ou.a) obj;
        i2 i2Var = ((e) this.receiver).f94662h;
        do {
            value = i2Var.getValue();
        } while (!i2Var.i(value, a.a((a) value, null, false, aVar, null, null, false, 239)));
        return Unit.f71706a;
    }
}
