package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class z implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51190a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p6.t f51191b;

    public /* synthetic */ z(p6.t tVar, int i5, int i11) {
        this.f51190a = i11;
        this.f51191b = tVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f51190a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                vh.a.b(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 1:
                wh.f.g(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 2:
                a.a.x(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 3:
                android.support.v4.media.session.b.t(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 4:
                cl.l0.f(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 5:
                h00.p.c(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 6:
                io.sentry.config.a.f(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 7:
                j00.g0.b(this.f51191b, oVar, p1.a0.l(1));
                break;
            case 8:
                jk.b.g(this.f51191b, oVar, p1.a0.l(1));
                break;
            default:
                wh.f.r(this.f51191b, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
