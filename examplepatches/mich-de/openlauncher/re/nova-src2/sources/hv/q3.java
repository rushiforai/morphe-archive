package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class q3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60520a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f60521b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b2.t f60522c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f60523d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f60524e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f60525f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f60526g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f60527h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f60528i;

    public /* synthetic */ q3(boolean z11, kw.o1 o1Var, b2.t tVar, Function2 function2, boolean z12, boolean z13, g2.s sVar, int i5, int i11) {
        this.f60521b = z11;
        this.f60526g = o1Var;
        this.f60522c = tVar;
        this.f60527h = function2;
        this.f60523d = z12;
        this.f60524e = z13;
        this.f60528i = sVar;
        this.f60525f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f60520a;
        Object obj3 = this.f60528i;
        Object obj4 = this.f60527h;
        Object obj5 = this.f60526g;
        switch (i5) {
            case 0:
                k0.g gVar = k0.k.f70655a;
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f60525f | 1);
                boolean z11 = this.f60521b;
                boolean z12 = this.f60523d;
                boolean z13 = this.f60524e;
                mk.v.p(z11, z12, z13, (Function0) obj5, (k0.p1) obj4, this.f60522c, (x1.e) obj3, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(65);
                boolean z14 = this.f60521b;
                b2.t tVar = this.f60522c;
                boolean z15 = this.f60523d;
                boolean z16 = this.f60524e;
                g90.k.p(z14, (kw.o1) obj5, tVar, (Function2) obj4, z15, z16, (g2.s) obj3, this.f60525f, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ q3(boolean z11, boolean z12, boolean z13, Function0 function0, k0.p1 p1Var, b2.t tVar, x1.e eVar, int i5) {
        k0.g gVar = k0.k.f70655a;
        this.f60521b = z11;
        this.f60523d = z12;
        this.f60524e = z13;
        this.f60526g = function0;
        this.f60527h = p1Var;
        this.f60522c = tVar;
        this.f60528i = eVar;
        this.f60525f = i5;
    }
}
