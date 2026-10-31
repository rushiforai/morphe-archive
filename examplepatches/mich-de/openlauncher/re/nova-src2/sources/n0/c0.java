package n0;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final /* synthetic */ class c0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77402a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f77403b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f77404c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f77405d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f77406e;

    public /* synthetic */ c0(int i5, int i11, Object obj, Object obj2, Object obj3) {
        this.f77402a = i11;
        this.f77405d = obj;
        this.f77403b = obj2;
        this.f77406e = obj3;
        this.f77404c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f77402a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                z.d((d0) this.f77405d, this.f77403b, this.f77404c, this.f77406e, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(this.f77404c | 1);
                ((y0) this.f77405d).f(this.f77403b, (x1.e) this.f77406e, (p1.o) obj, iL2);
                break;
            case 2:
                ((Integer) obj2).intValue();
                int iL3 = p1.a0.l(this.f77404c) | 1;
                ((x1.e) this.f77405d).g(this.f77403b, this.f77406e, (p1.o) obj, iL3);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL4 = p1.a0.l(this.f77404c | 1);
                ((y1.d) this.f77405d).f(this.f77403b, (x1.e) this.f77406e, (p1.o) obj, iL4);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ c0(d0 d0Var, Object obj, int i5, Object obj2, int i11) {
        this.f77402a = 0;
        this.f77405d = d0Var;
        this.f77403b = obj;
        this.f77404c = i5;
        this.f77406e = obj2;
    }
}
