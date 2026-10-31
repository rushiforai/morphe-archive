package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class w2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51109a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f51110b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f51111c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f51112d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f51113e;

    public /* synthetic */ w2(int i5, int i11, int i12, b2.t tVar) {
        this.f51110b = i5;
        this.f51113e = tVar;
        this.f51111c = i11;
        this.f51112d = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f51109a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f51111c | 1);
                e10.z2.d((b2.t) this.f51113e, this.f51110b, iL, (p1.o) obj, this.f51112d);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(this.f51112d | 1);
                ((e10.p) this.f51113e).d(this.f51110b, this.f51111c, (p1.o) obj, iL2);
                break;
            default:
                ((Integer) obj2).intValue();
                int iL3 = p1.a0.l(this.f51112d | 1);
                p10.y1.r(this.f51110b, this.f51111c, (p10.z1) this.f51113e, (p1.o) obj, iL3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ w2(int i5, int i11, p10.z1 z1Var, int i12) {
        this.f51110b = i5;
        this.f51111c = i11;
        this.f51113e = z1Var;
        this.f51112d = i12;
    }

    public /* synthetic */ w2(e10.p pVar, int i5, int i11, int i12) {
        this.f51113e = pVar;
        this.f51110b = i5;
        this.f51111c = i11;
        this.f51112d = i12;
    }
}
