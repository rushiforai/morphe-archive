package dv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49612a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f49613b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f49614c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f49615d;

    public /* synthetic */ l(b2.t tVar, Function0 function0, int i5) {
        this.f49613b = tVar;
        this.f49614c = function0;
        this.f49615d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f49612a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                ex.i.d(p1.a0.l(this.f49615d | 1), this.f49613b, this.f49614c, oVar);
                break;
            case 1:
                ky.l.e(p1.a0.l(this.f49615d | 1), this.f49613b, this.f49614c, oVar);
                break;
            default:
                mk.v.o(this.f49613b, this.f49614c, oVar, p1.a0.l(49), this.f49615d);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ l(b2.t tVar, Function0 function0, int i5, int i11) {
        this.f49613b = tVar;
        this.f49614c = function0;
        this.f49615d = i11;
    }

    public /* synthetic */ l(Function0 function0, b2.t tVar, int i5) {
        this.f49614c = function0;
        this.f49613b = tVar;
        this.f49615d = i5;
    }
}
