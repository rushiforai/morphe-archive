package c4;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class a extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19550j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b0 f19551k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(b0 b0Var, int i5) {
        super(1);
        this.f19550j = i5;
        this.f19551k = b0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19550j) {
            case 0:
                return new a1.j(this.f19551k, 2);
            default:
                b0 b0Var = this.f19551k;
                if (b0Var.f19558e.f19643a) {
                    b0Var.f19557d.invoke();
                }
                return Unit.f71706a;
        }
    }
}
