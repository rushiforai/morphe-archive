package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class x0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51142a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z1 f51143b;

    public /* synthetic */ x0(z1 z1Var, int i5) {
        this.f51142a = i5;
        this.f51143b = z1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f51142a) {
            case 0:
                p6.t.n(this.f51143b.a(), "SearchBarDesktop", null, 6);
                break;
            default:
                p6.t.n(this.f51143b.a(), "Dock", null, 6);
                break;
        }
        return Unit.f71706a;
    }
}
