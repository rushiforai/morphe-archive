package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class y3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51179a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ cy.h f51180b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ cy.m0 f51181c;

    public /* synthetic */ y3(cy.h hVar, cy.m0 m0Var, int i5, int i11) {
        this.f51179a = i11;
        this.f51180b = hVar;
        this.f51181c = m0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f51179a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                android.support.v4.media.session.b.v(this.f51180b, this.f51181c, oVar, p1.a0.l(1));
                break;
            case 1:
                android.support.v4.media.session.b.a(this.f51180b, this.f51181c, oVar, p1.a0.l(1));
                break;
            default:
                android.support.v4.media.session.b.x(this.f51180b, this.f51181c, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
