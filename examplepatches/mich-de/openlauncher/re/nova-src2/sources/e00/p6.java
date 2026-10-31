package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class p6 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50892a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f50893b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f50894c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f50895d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f50896e;

    public /* synthetic */ p6(int i5, int i11, int i12, Object obj, Object obj2) {
        this.f50892a = i12;
        this.f50895d = obj;
        this.f50896e = obj2;
        this.f50893b = i5;
        this.f50894c = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50892a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(385);
                g90.k.y(this.f50893b, this.f50894c, (Function0) this.f50895d, (Function2) this.f50896e, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                os.a.a((hw.m) this.f50895d, (x1.e) this.f50896e, (p1.o) obj, p1.a0.l(this.f50893b | 1), this.f50894c);
                break;
            case 2:
                ((Integer) obj2).getClass();
                ps.f0.d((b2.t) this.f50895d, (y3.f) this.f50896e, (p1.o) obj, p1.a0.l(this.f50893b | 1), this.f50894c);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(this.f50894c | 1);
                ps.j0.c((ps.k0) this.f50895d, (b2.t) this.f50896e, this.f50893b, (p1.o) obj, iL2);
                break;
            case 4:
                ((Integer) obj2).getClass();
                ps.e0.b((Function2) this.f50896e, (x1.e) this.f50895d, (p1.o) obj, p1.a0.l(this.f50893b | 1), this.f50894c);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(1);
                z10.a.b(this.f50893b, this.f50894c, iL3, (String) this.f50895d, (m3.p0) this.f50896e, (p1.o) obj);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ p6(int i5, int i11, Function0 function0, Function2 function2, int i12) {
        this.f50892a = 0;
        this.f50893b = i5;
        this.f50894c = i11;
        this.f50895d = function0;
        this.f50896e = function2;
    }

    public /* synthetic */ p6(String str, int i5, m3.p0 p0Var, int i11, int i12) {
        this.f50892a = 5;
        this.f50895d = str;
        this.f50893b = i5;
        this.f50896e = p0Var;
        this.f50894c = i11;
    }

    public /* synthetic */ p6(Function2 function2, x1.e eVar, int i5, int i11) {
        this.f50892a = 4;
        this.f50896e = function2;
        this.f50895d = eVar;
        this.f50893b = i5;
        this.f50894c = i11;
    }
}
