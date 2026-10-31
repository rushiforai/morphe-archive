package mo;

import b2.t;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;
import ps.i0;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76513a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t f76514b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f76515c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f76516d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f76517e;

    public /* synthetic */ b(long j11, int i5, t tVar, int i11) {
        this.f76515c = j11;
        this.f76516d = i5;
        this.f76514b = tVar;
        this.f76517e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f76513a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = a0.l(this.f76517e | 1);
                d.b(this.f76516d, iL, this.f76515c, this.f76514b, (p1.o) obj);
                break;
            default:
                ((Integer) obj2).getClass();
                i0.d(a0.l(this.f76516d | 1), this.f76517e, this.f76515c, this.f76514b, (p1.o) obj);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ b(t tVar, long j11, int i5, int i11) {
        this.f76514b = tVar;
        this.f76515c = j11;
        this.f76516d = i5;
        this.f76517e = i11;
    }
}
