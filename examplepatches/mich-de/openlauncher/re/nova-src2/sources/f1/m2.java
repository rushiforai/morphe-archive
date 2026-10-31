package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final /* synthetic */ class m2 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53764a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f53765b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f53766c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f53767d;

    public /* synthetic */ m2(p1.e1 e1Var, c0.y1 y1Var, c0.y1 y1Var2, int i5) {
        this.f53764a = i5;
        this.f53765b = e1Var;
        this.f53766c = y1Var;
        this.f53767d = y1Var2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        i2.a0 a0Var = (i2.a0) obj;
        switch (this.f53764a) {
            case 0:
                p1.y2 y2Var = this.f53766c;
                i2.s0 s0Var = (i2.s0) a0Var;
                s0Var.i(((Number) y2Var.getValue()).floatValue());
                s0Var.j(((Number) y2Var.getValue()).floatValue());
                s0Var.a(((Number) this.f53767d.getValue()).floatValue());
                s0Var.o(((i2.y0) this.f53765b.getValue()).f61193a);
                break;
            default:
                p1.y2 y2Var2 = this.f53766c;
                i2.s0 s0Var2 = (i2.s0) a0Var;
                s0Var2.i(((Number) y2Var2.getValue()).floatValue());
                s0Var2.j(((Number) y2Var2.getValue()).floatValue());
                s0Var2.a(((Number) this.f53767d.getValue()).floatValue());
                s0Var2.o(((i2.y0) this.f53765b.getValue()).f61193a);
                break;
        }
        return Unit.f71706a;
    }
}
