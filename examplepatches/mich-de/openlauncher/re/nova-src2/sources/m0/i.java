package m0;

import e1.a1;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.r1;
import t0.t0;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75425a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f75426b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f75427c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f75428d;

    public /* synthetic */ i(Object obj, Object obj2, int i5, int i11) {
        this.f75425a = i11;
        this.f75428d = obj;
        this.f75427c = obj2;
        this.f75426b = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f75425a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                ((j) this.f75428d).e(this.f75426b, this.f75427c, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                ((o0.g) this.f75428d).e(this.f75426b, this.f75427c, (p1.o) obj, iL2);
                break;
            case 2:
                ((Integer) obj2).intValue();
                p1.a0.a((r1) this.f75428d, (Function2) this.f75427c, (p1.o) obj, p1.a0.l(this.f75426b | 1));
                break;
            case 3:
                ((Integer) obj2).intValue();
                p1.a0.b((r1[]) this.f75428d, (Function2) this.f75427c, (p1.o) obj, p1.a0.l(this.f75426b | 1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                t0.g((a1) this.f75428d, (x1.e) this.f75427c, (p1.o) obj, p1.a0.l(this.f75426b | 1));
                break;
            default:
                ((Integer) obj2).intValue();
                int iL3 = p1.a0.l(this.f75426b) | 1;
                ((x1.e) this.f75428d).h(this.f75427c, (p1.o) obj, iL3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ i(n0.d0 d0Var, int i5, Object obj, int i11, int i12) {
        this.f75425a = i12;
        this.f75428d = d0Var;
        this.f75426b = i5;
        this.f75427c = obj;
    }
}
