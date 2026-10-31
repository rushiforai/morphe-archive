package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class e2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60227a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n2 f60228b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f60229c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f60230d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f60231e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function0 f60232f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f60233g;

    public /* synthetic */ e2(n2 n2Var, boolean z11, boolean z12, float f11, Function0 function0, int i5) {
        this.f60228b = n2Var;
        this.f60229c = z11;
        this.f60230d = z12;
        this.f60231e = f11;
        this.f60232f = function0;
        this.f60233g = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60227a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f60233g | 1);
                k2.c(this.f60231e, iL, this.f60228b, this.f60232f, (p1.o) obj, this.f60229c, this.f60230d);
                break;
            default:
                ((Integer) obj2).intValue();
                int iL2 = p1.a0.l(this.f60233g | 1);
                k2.b(this.f60231e, iL2, this.f60228b, this.f60232f, (p1.o) obj, this.f60229c, this.f60230d);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ e2(n2 n2Var, boolean z11, boolean z12, Function0 function0, float f11, int i5) {
        this.f60228b = n2Var;
        this.f60229c = z11;
        this.f60230d = z12;
        this.f60232f = function0;
        this.f60231e = f11;
        this.f60233g = i5;
    }
}
