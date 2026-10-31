package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51152a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ cy.h f51153b;

    public /* synthetic */ x3(cy.h hVar, int i5, int i11) {
        this.f51152a = i11;
        this.f51153b = hVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f51152a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                android.support.v4.media.session.b.z(this.f51153b, oVar, p1.a0.l(1));
                break;
            default:
                android.support.v4.media.session.b.y(this.f51153b, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
