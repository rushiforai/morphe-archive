package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final /* synthetic */ class l0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53717a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x1.e f53718b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ x1.e f53719c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b2.t f53720d;

    public /* synthetic */ l0(x1.e eVar, b2.t tVar, x1.e eVar2, int i5) {
        this.f53718b = eVar;
        this.f53720d = tVar;
        this.f53719c = eVar2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f53717a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                m0.a(p1.a0.l(391), this.f53720d, oVar, this.f53718b, this.f53719c);
                break;
            default:
                a.a.h(p1.a0.l(55), this.f53720d, oVar, this.f53718b, this.f53719c);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ l0(x1.e eVar, x1.e eVar2, b2.t tVar, int i5) {
        this.f53718b = eVar;
        this.f53719c = eVar2;
        this.f53720d = tVar;
    }
}
