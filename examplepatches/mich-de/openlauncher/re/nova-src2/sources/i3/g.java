package i3;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.AdaptedFunctionReference;

/* loaded from: classes2.dex */
public final /* synthetic */ class g extends AdaptedFunctionReference implements Function1 {
    public g(r1.e eVar) {
        super(1, 8, r1.e.class, eVar, "add", "add(Ljava/lang/Object;)Z");
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        ((r1.e) this.receiver).b((i) obj);
        return Unit.f71706a;
    }
}
