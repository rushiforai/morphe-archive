package jy;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import m3.p0;
import n00.r;
import p1.a0;
import p1.o;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70462a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f70463b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f70464c;

    public /* synthetic */ e(long j11, x1.e eVar, int i5) {
        this.f70462a = 0;
        this.f70463b = j11;
        this.f70464c = eVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f70462a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = a0.l(49);
                k.d(this.f70463b, (x1.e) this.f70464c, (o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = a0.l(7);
                r.e((Function1) this.f70464c, this.f70463b, (o) obj, iL2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL3 = a0.l(1);
                ph.a.i((p0) this.f70464c, this.f70463b, (o) obj, iL3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ e(Object obj, long j11, int i5, int i11) {
        this.f70462a = i11;
        this.f70464c = obj;
        this.f70463b = j11;
    }
}
