package p10;

import java.util.ArrayList;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81770a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f81771b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f81772c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f81773d;

    public /* synthetic */ g0(Object obj, float f11, Object obj2, int i5, int i11) {
        this.f81770a = i11;
        this.f81772c = obj;
        this.f81771b = f11;
        this.f81773d = obj2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f81770a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                wh.f.i((m0) this.f81772c, this.f81771b, (l0) this.f81773d, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                y1.h((String) this.f81772c, this.f81771b, (z1) this.f81773d, (p1.o) obj, iL2);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(1);
                t00.q.h((mx.j) this.f81772c, this.f81771b, (Function1) this.f81773d, (p1.o) obj, iL3);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL4 = p1.a0.l(1);
                z10.d.a((b2.t) this.f81772c, this.f81771b, (ArrayList) this.f81773d, (p1.o) obj, iL4);
                break;
        }
        return Unit.f71706a;
    }
}
