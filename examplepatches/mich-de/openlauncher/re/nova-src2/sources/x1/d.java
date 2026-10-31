package x1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.AdaptedFunctionReference;

/* loaded from: classes.dex */
public final /* synthetic */ class d extends AdaptedFunctionReference implements Function2 {
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int iIntValue = ((Number) obj2).intValue();
        ((e) this.receiver).i((p1.o) obj, iIntValue);
        return Unit.f71706a;
    }
}
