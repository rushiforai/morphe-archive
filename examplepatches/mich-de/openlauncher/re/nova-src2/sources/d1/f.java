package d1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import z2.h1;
import z2.i1;

/* loaded from: classes.dex */
public final /* synthetic */ class f implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48776a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i1 f48777b;

    public /* synthetic */ f(i1 i1Var, int i5) {
        this.f48776a = i5;
        this.f48777b = i1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        h1 h1Var = (h1) obj;
        switch (this.f48776a) {
            case 0:
                h1Var.i(this.f48777b, 0, 0, 0.0f);
                break;
            case 1:
                h1.m(h1Var, this.f48777b, 0, 0);
                break;
            case 2:
                h1.m(h1Var, this.f48777b, 0, 0);
                break;
            default:
                h1.m(h1Var, this.f48777b, 0, 0);
                break;
        }
        return Unit.f71706a;
    }
}
