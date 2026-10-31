package e1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final /* synthetic */ class v implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51398a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t0.g1 f51399b;

    public /* synthetic */ v(t0.g1 g1Var, int i5) {
        this.f51398a = i5;
        this.f51399b = g1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f51398a) {
            case 0:
                v2.t tVar = (v2.t) obj;
                this.f51399b.d(v2.g0.j(tVar, false));
                tVar.a();
                break;
            default:
                this.f51399b.b(((h2.b) obj).f59016a);
                break;
        }
        return Unit.f71706a;
    }
}
