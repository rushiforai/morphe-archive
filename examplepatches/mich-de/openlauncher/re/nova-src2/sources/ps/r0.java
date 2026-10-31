package ps;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p10.y1;

/* loaded from: classes4.dex */
public final /* synthetic */ class r0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82960a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f82961b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ x1.e f82962c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f82963d;

    public /* synthetic */ r0(b2.t tVar, x1.e eVar, int i5, int i11) {
        this.f82960a = i11;
        this.f82961b = tVar;
        this.f82962c = eVar;
        this.f82963d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f82960a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                y1.p(this.f82961b, this.f82962c, oVar, p1.a0.l(this.f82963d | 1));
                break;
            case 1:
                o0.g(this.f82961b, this.f82962c, oVar, p1.a0.l(this.f82963d | 1));
                break;
            case 2:
                o0.h(this.f82961b, this.f82962c, oVar, p1.a0.l(this.f82963d | 1));
                break;
            case 3:
                y0.l.d(this.f82961b, this.f82962c, oVar, p1.a0.l(this.f82963d | 1));
                break;
            case 4:
                y1.k(this.f82961b, this.f82962c, oVar, p1.a0.l(this.f82963d | 1));
                break;
            default:
                y1.j(this.f82961b, this.f82962c, oVar, p1.a0.l(this.f82963d | 1));
                break;
        }
        return Unit.f71706a;
    }
}
