package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final /* synthetic */ class l4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53731a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f53732b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ m3.p0 f53733c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function2 f53734d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f53735e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f53736f;

    public /* synthetic */ l4(long j11, m3.p0 p0Var, Function2 function2, int i5, int i11, int i12) {
        this.f53731a = i12;
        this.f53732b = j11;
        this.f53733c = p0Var;
        this.f53734d = function2;
        this.f53735e = i5;
        this.f53736f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f53731a) {
            case 0:
                ((Integer) obj2).getClass();
                s4.b(this.f53732b, this.f53733c, this.f53734d, (p1.o) obj, p1.a0.l(this.f53735e | 1), this.f53736f);
                break;
            default:
                ((Integer) obj2).getClass();
                mw.j.d(this.f53732b, this.f53733c, this.f53734d, (p1.o) obj, p1.a0.l(this.f53735e | 1), this.f53736f);
                break;
        }
        return Unit.f71706a;
    }
}
