package d20;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import ps.j0;

/* loaded from: classes4.dex */
public final /* synthetic */ class v implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48930a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x1.e f48931b;

    public /* synthetic */ v(x1.e eVar, int i5) {
        this.f48930a = 2;
        float f11 = jy.k.f70493a;
        float f12 = jy.k.f70493a;
        this.f48931b = eVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f48930a;
        x1.e eVar = this.f48931b;
        switch (i5) {
            case 0:
                ((Integer) obj2).getClass();
                z.b(eVar, (p1.o) obj, p1.a0.l(55));
                break;
            case 1:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.A(eVar, (p1.o) obj, p1.a0.l(7));
                break;
            case 2:
                float f11 = jy.k.f70493a;
                float f12 = jy.k.f70493a;
                ((Integer) obj2).getClass();
                jy.k.c(eVar, (p1.o) obj, p1.a0.l(439));
                break;
            case 3:
                ((Integer) obj2).getClass();
                ky.l.f(eVar, (p1.o) obj, p1.a0.l(7));
                break;
            default:
                ((Integer) obj2).getClass();
                j0.g(eVar, (p1.o) obj, p1.a0.l(7));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ v(x1.e eVar, int i5, int i11) {
        this.f48930a = i11;
        this.f48931b = eVar;
    }
}
