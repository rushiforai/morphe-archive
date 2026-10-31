package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class u3 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f74068j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ v3 f74069k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u3(v3 v3Var, int i5) {
        super(1);
        this.f74068j = i5;
        this.f74069k = v3Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f74068j) {
            case 0:
                v3 v3Var = this.f74069k;
                if (v3Var.f74108e.f73443b) {
                    v3Var.f74107d.invoke();
                }
                return Unit.f71706a;
            default:
                v3 v3Var2 = this.f74069k;
                v3Var2.show();
                return new a1.j(v3Var2, 11);
        }
    }
}
