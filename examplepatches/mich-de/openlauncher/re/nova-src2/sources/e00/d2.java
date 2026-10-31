package e00;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class d2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50274a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f50275b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f50276c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f50277d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function f50278e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f50279f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f50280g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f50281h;

    public /* synthetic */ d2(String str, float f11, int i5, fz.q qVar, Function1 function1, Function1 function12, int i11) {
        this.f50275b = str;
        this.f50276c = f11;
        this.f50277d = i5;
        this.f50280g = qVar;
        this.f50278e = function1;
        this.f50281h = function12;
        this.f50279f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50274a) {
            case 0:
                ((Integer) obj2).intValue();
                zg.a.d((String) this.f50275b, this.f50276c, this.f50277d, (fz.q) this.f50280g, (Function1) this.f50278e, (Function1) this.f50281h, (p1.o) obj, p1.a0.l(this.f50279f | 1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                hy.a0.c((String) this.f50275b, this.f50276c, (hy.h) this.f50280g, (b2.t) this.f50281h, this.f50277d, (Function1) this.f50278e, (p1.o) obj, p1.a0.l(this.f50279f | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                ps.f0.b((lw.l) this.f50275b, (b2.t) this.f50280g, this.f50276c, (Function0) this.f50278e, (x1.e) this.f50281h, (p1.o) obj, p1.a0.l(this.f50277d | 1), this.f50279f);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ d2(String str, float f11, hy.h hVar, b2.t tVar, int i5, Function1 function1, int i11) {
        this.f50275b = str;
        this.f50276c = f11;
        this.f50280g = hVar;
        this.f50281h = tVar;
        this.f50277d = i5;
        this.f50278e = function1;
        this.f50279f = i11;
    }

    public /* synthetic */ d2(lw.l lVar, b2.t tVar, float f11, Function0 function0, x1.e eVar, int i5, int i11) {
        this.f50275b = lVar;
        this.f50280g = tVar;
        this.f50276c = f11;
        this.f50278e = function0;
        this.f50281h = eVar;
        this.f50277d = i5;
        this.f50279f = i11;
    }
}
