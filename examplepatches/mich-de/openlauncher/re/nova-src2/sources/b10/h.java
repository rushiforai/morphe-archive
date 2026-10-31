package b10;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class h implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16696a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k2 f16697b;

    public /* synthetic */ h(k2 k2Var, int i5) {
        this.f16696a = i5;
        this.f16697b = k2Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16696a) {
            case 0:
                this.f16697b.d((cy.m0) obj);
                break;
            case 1:
                this.f16697b.b((String) obj);
                break;
            case 2:
                this.f16697b.d((cy.m0) obj);
                break;
            default:
                this.f16697b.b((String) obj);
                break;
        }
        return Unit.f71706a;
    }
}
