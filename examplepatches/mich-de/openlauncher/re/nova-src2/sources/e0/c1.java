package e0;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import p1.s2;

/* loaded from: classes2.dex */
public final /* synthetic */ class c1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49933a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d1 f49934b;

    public /* synthetic */ c1(d1 d1Var, int i5) {
        this.f49933a = i5;
        this.f49934b = d1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f49933a) {
            case 0:
                this.f49934b.E();
                return Unit.f71706a;
            case 1:
                return new h2.b(this.f49934b.o);
            default:
                z2.y yVar = (z2.y) ((s2) this.f49934b.f49958m).getValue();
                return new h2.b(yVar != null ? yVar.M(0L) : 9205357640488583168L);
        }
    }
}
