package cw;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48110a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f48111b;

    public /* synthetic */ d(b2.t tVar, int i5, int i11) {
        this.f48110a = i11;
        this.f48111b = tVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f48110a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                cl.k0.a(this.f48111b, oVar, p1.a0.l(1));
                break;
            case 1:
                hv.a3.g(this.f48111b, oVar, p1.a0.l(1));
                break;
            case 2:
                p7.u.r(this.f48111b, oVar, p1.a0.l(7));
                break;
            case 3:
                wh.f.u(this.f48111b, oVar, p1.a0.l(1));
                break;
            case 4:
                mo.d.c(this.f48111b, oVar, p1.a0.l(7));
                break;
            case 5:
                ps.c.d(this.f48111b, oVar, p1.a0.l(7));
                break;
            case 6:
                ts.f.c(this.f48111b, oVar, p1.a0.l(1));
                break;
            default:
                ts.f.d(this.f48111b, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
