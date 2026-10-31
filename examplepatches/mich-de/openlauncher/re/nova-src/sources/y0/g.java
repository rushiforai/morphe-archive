package y0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import p1.e1;
import z2.y;

/* loaded from: classes2.dex */
public final /* synthetic */ class g implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96521a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f96522b;

    public /* synthetic */ g(e1 e1Var, int i5) {
        this.f96521a = i5;
        this.f96522b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f96521a) {
            case 0:
                this.f96522b.setValue((y) obj);
                break;
            default:
                this.f96522b.setValue((y) obj);
                break;
        }
        return Unit.f71706a;
    }
}
