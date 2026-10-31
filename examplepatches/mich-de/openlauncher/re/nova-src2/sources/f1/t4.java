package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final /* synthetic */ class t4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54001a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f54002b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f54003c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function3 f54004d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function2 f54005e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function2 f54006f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f54007g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ float f54008h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f54009i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function2 f54010j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ k0.o1 f54011k;

    public /* synthetic */ t4(b2.t tVar, Function2 function2, Function2 function22, Function3 function3, Function2 function23, Function2 function24, boolean z11, float f11, k0.o1 o1Var, int i5) {
        this.f54002b = tVar;
        this.f54003c = function2;
        this.f54005e = function22;
        this.f54004d = function3;
        this.f54006f = function23;
        this.f54010j = function24;
        this.f54007g = z11;
        this.f54008h = f11;
        this.f54011k = o1Var;
        this.f54009i = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f54001a) {
            case 0:
                ((Integer) obj2).getClass();
                w4.b(this.f54002b, this.f54003c, this.f54005e, this.f54004d, this.f54006f, this.f54010j, this.f54007g, this.f54008h, this.f54011k, (p1.o) obj, p1.a0.l(this.f54009i | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                mw.l.a(this.f54002b, (x1.e) this.f54010j, this.f54003c, this.f54004d, this.f54005e, this.f54006f, this.f54007g, this.f54008h, (k0.p1) this.f54011k, (p1.o) obj, p1.a0.l(this.f54009i | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ t4(b2.t tVar, x1.e eVar, Function2 function2, Function3 function3, Function2 function22, Function2 function23, boolean z11, float f11, k0.p1 p1Var, int i5) {
        this.f54002b = tVar;
        this.f54010j = eVar;
        this.f54003c = function2;
        this.f54004d = function3;
        this.f54005e = function22;
        this.f54006f = function23;
        this.f54007g = z11;
        this.f54008h = f11;
        this.f54011k = p1Var;
        this.f54009i = i5;
    }
}
