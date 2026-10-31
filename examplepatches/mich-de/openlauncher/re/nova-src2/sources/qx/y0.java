package qx;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class y0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84656a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i1 f84657b;

    public /* synthetic */ y0(i1 i1Var, int i5) {
        this.f84656a = i5;
        this.f84657b = i1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        sx.j jVar = (sx.j) obj;
        Double d5 = (Double) obj2;
        switch (this.f84656a) {
            case 0:
                this.f84657b.f().e(jVar, d5.doubleValue());
                break;
            case 1:
                this.f84657b.f().e(jVar, d5.doubleValue());
                break;
            default:
                this.f84657b.f().e(jVar, d5.doubleValue());
                break;
        }
        return Unit.f71706a;
    }
}
