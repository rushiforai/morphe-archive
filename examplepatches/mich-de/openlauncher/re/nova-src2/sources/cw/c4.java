package cw;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48108a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f48109b;

    public /* synthetic */ c4(boolean z11) {
        this.f48108a = 0;
        this.f48109b = z11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f48108a;
        boolean z11 = true;
        boolean z12 = this.f48109b;
        switch (i5) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
                if (!zBooleanValue || (!z12 && !zBooleanValue2)) {
                    z11 = false;
                }
                break;
            case 1:
                x1.e eVar = r10.e0.f85132a;
                ((Integer) obj2).getClass();
                g90.k.u(z12, (p1.o) obj, p1.a0.l(49));
                break;
            case 2:
                ((Integer) obj2).getClass();
                wh.f.h(z12, (p1.o) obj, p1.a0.l(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                ux.q.b(z12, (p1.o) obj, p1.a0.l(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                ux.t.d(z12, (p1.o) obj, p1.a0.l(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                ux.z.f(z12, (p1.o) obj, p1.a0.l(1));
                break;
            default:
                ((Integer) obj2).getClass();
                xs.g.e(z12, (p1.o) obj, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ c4(boolean z11, int i5) {
        this.f48108a = 1;
        x1.e eVar = r10.e0.f85132a;
        this.f48109b = z11;
    }

    public /* synthetic */ c4(boolean z11, int i5, int i11) {
        this.f48108a = i11;
        this.f48109b = z11;
    }
}
