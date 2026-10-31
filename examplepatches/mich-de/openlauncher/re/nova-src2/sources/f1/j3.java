package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class j3 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53682a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f53683b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f53684c;

    public /* synthetic */ j3(p1.y2 y2Var, p1.y2 y2Var2, int i5) {
        this.f53682a = i5;
        this.f53683b = y2Var;
        this.f53684c = y2Var2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f53682a) {
            case 0:
                k2.f fVar = (k2.f) obj;
                float fMo102toPx0680j_4 = fVar.mo102toPx0680j_4(l3.f53730f);
                p1.y2 y2Var = this.f53683b;
                float f11 = fMo102toPx0680j_4 / 2;
                fVar.mo81drawCircleVaOC9Bg(((i2.s) y2Var.getValue()).f61148a, fVar.mo102toPx0680j_4(l3.f53728d) - f11, (120 & 4) != 0 ? fVar.mo93getCenterF1C5BW0() : 0L, 1.0f, (120 & 16) != 0 ? k2.j.f70871a : new k2.k(fMo102toPx0680j_4, 0.0f, 0, 0, 30), null, 3);
                p1.y2 y2Var2 = this.f53684c;
                if (Float.compare(((y3.f) y2Var2.getValue()).f96602a, 0) > 0) {
                    fVar.mo81drawCircleVaOC9Bg(((i2.s) y2Var.getValue()).f61148a, fVar.mo102toPx0680j_4(((y3.f) y2Var2.getValue()).f96602a) - f11, (120 & 4) != 0 ? fVar.mo93getCenterF1C5BW0() : 0L, 1.0f, (120 & 16) != 0 ? k2.j.f70871a : k2.j.f70871a, null, 3);
                }
                break;
            case 1:
                i2.a0 graphicsLayer = (i2.a0) obj;
                Intrinsics.g(graphicsLayer, "$this$graphicsLayer");
                i2.s0 s0Var = (i2.s0) graphicsLayer;
                s0Var.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 2:
                i2.s0 s0Var2 = (i2.s0) ((i2.a0) obj);
                s0Var2.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var2.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 3:
                i2.s0 s0Var3 = (i2.s0) ((i2.a0) obj);
                s0Var3.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var3.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 4:
                i2.s0 s0Var4 = (i2.s0) ((i2.a0) obj);
                s0Var4.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var4.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 5:
                i2.s0 s0Var5 = (i2.s0) ((i2.a0) obj);
                s0Var5.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var5.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 6:
                i2.s0 s0Var6 = (i2.s0) ((i2.a0) obj);
                s0Var6.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var6.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 7:
                i2.s0 s0Var7 = (i2.s0) ((i2.a0) obj);
                s0Var7.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var7.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 8:
                i2.s0 s0Var8 = (i2.s0) ((i2.a0) obj);
                s0Var8.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var8.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 9:
                i2.s0 s0Var9 = (i2.s0) ((i2.a0) obj);
                s0Var9.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var9.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            case 10:
                i2.s0 s0Var10 = (i2.s0) ((i2.a0) obj);
                s0Var10.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var10.t(((Number) this.f53684c.getValue()).floatValue());
                break;
            default:
                i2.s0 s0Var11 = (i2.s0) ((i2.a0) obj);
                s0Var11.a(((Number) this.f53683b.getValue()).floatValue());
                s0Var11.t(((Number) this.f53684c.getValue()).floatValue());
                break;
        }
        return Unit.f71706a;
    }
}
