package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class u6 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f74078j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ x6 f74079k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u6(boolean z11, x6 x6Var) {
        super(1);
        this.f74078j = z11;
        this.f74079k = x6Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        j3.b0 b0Var = (j3.b0) obj;
        if (!this.f74078j) {
            j3.y.a(b0Var);
        }
        j3.y.h(b0Var, new r6(this.f74079k, 1));
        return Unit.f71706a;
    }
}
