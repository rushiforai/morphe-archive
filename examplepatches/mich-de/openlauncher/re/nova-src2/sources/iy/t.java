package iy;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class t implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68367a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tz.o f68368b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f68369c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f68370d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ long f68371e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ float f68372f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Function1 f68373g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Function1 f68374h;

    public /* synthetic */ t(tz.o oVar, int i5, int i11, long j11, float f11, Function1 function1, Function1 function12, int i12, int i13) {
        this.f68367a = i13;
        this.f68368b = oVar;
        this.f68369c = i5;
        this.f68370d = i11;
        this.f68371e = j11;
        this.f68372f = f11;
        this.f68373g = function1;
        this.f68374h = function12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68367a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                p0.l(this.f68368b, this.f68369c, this.f68370d, this.f68371e, this.f68372f, this.f68373g, this.f68374h, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                p0.a(this.f68368b, this.f68369c, this.f68370d, this.f68371e, this.f68372f, this.f68373g, this.f68374h, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }
}
