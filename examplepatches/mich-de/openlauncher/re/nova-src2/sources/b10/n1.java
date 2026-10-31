package b10;

import f1.d3;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.y2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16805a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y2 f16806b;

    public /* synthetic */ n1(y2 y2Var, int i5) {
        this.f16805a = i5;
        this.f16806b = y2Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16805a) {
            case 0:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 1:
                d3 it = (d3) obj;
                Intrinsics.g(it, "it");
                break;
            case 2:
                d3 it2 = (d3) obj;
                Intrinsics.g(it2, "it");
                break;
            case 3:
                d3 proposedValue = (d3) obj;
                Intrinsics.g(proposedValue, "proposedValue");
                break;
            case 4:
                ((i2.s0) ((i2.a0) obj)).g(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 5:
                ((i2.s0) ((i2.a0) obj)).q(-((Number) this.f16806b.getValue()).floatValue());
                break;
            case 6:
                i2.s0 s0Var = (i2.s0) ((i2.a0) obj);
                s0Var.g(180.0f);
                s0Var.q(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 7:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                j3.y.j(semantics, 0);
                hv.s2 s2Var = (hv.s2) this.f16806b.getValue();
                if (s2Var == null || !s2Var.f60585e) {
                    j3.y.a(semantics);
                }
                break;
            case 8:
                i2.a0 graphicsLayer = (i2.a0) obj;
                Intrinsics.g(graphicsLayer, "$this$graphicsLayer");
                y2 y2Var = this.f16806b;
                i2.s0 s0Var2 = (i2.s0) graphicsLayer;
                s0Var2.i(((Number) y2Var.getValue()).floatValue());
                s0Var2.j(((Number) y2Var.getValue()).floatValue());
                break;
            case 9:
                i2.a0 graphicsLayer2 = (i2.a0) obj;
                Intrinsics.g(graphicsLayer2, "$this$graphicsLayer");
                ((i2.s0) graphicsLayer2).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 10:
                d3 it3 = (d3) obj;
                Intrinsics.g(it3, "it");
                break;
            case 11:
                d3 it4 = (d3) obj;
                Intrinsics.g(it4, "it");
                break;
            case 12:
                i2.a0 graphicsLayer3 = (i2.a0) obj;
                Intrinsics.g(graphicsLayer3, "$this$graphicsLayer");
                i2.s0 s0Var3 = (i2.s0) graphicsLayer3;
                s0Var3.k(s0Var3.f61162p.getDensity() * ((y3.f) this.f16806b.getValue()).f96602a);
                break;
            case 13:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 14:
                y2 y2Var2 = this.f16806b;
                i2.s0 s0Var4 = (i2.s0) ((i2.a0) obj);
                s0Var4.i(((Number) y2Var2.getValue()).floatValue());
                s0Var4.j(((Number) y2Var2.getValue()).floatValue());
                break;
            case 15:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 16:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 17:
                y2 y2Var3 = this.f16806b;
                i2.s0 s0Var5 = (i2.s0) ((i2.a0) obj);
                s0Var5.i(((Number) y2Var3.getValue()).floatValue());
                s0Var5.j(((Number) y2Var3.getValue()).floatValue());
                break;
            case 18:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 19:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 20:
                y2 y2Var4 = this.f16806b;
                i2.s0 s0Var6 = (i2.s0) ((i2.a0) obj);
                s0Var6.i(((Number) y2Var4.getValue()).floatValue());
                s0Var6.j(((Number) y2Var4.getValue()).floatValue());
                break;
            case 21:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 22:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
            case 23:
                y2 y2Var5 = this.f16806b;
                i2.s0 s0Var7 = (i2.s0) ((i2.a0) obj);
                s0Var7.i(((Number) y2Var5.getValue()).floatValue());
                s0Var7.j(((Number) y2Var5.getValue()).floatValue());
                break;
            case 24:
                y2 y2Var6 = this.f16806b;
                i2.s0 s0Var8 = (i2.s0) ((i2.a0) obj);
                s0Var8.i(((Number) y2Var6.getValue()).floatValue());
                s0Var8.j(((Number) y2Var6.getValue()).floatValue());
                break;
            default:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16806b.getValue()).floatValue());
                break;
        }
        return Unit.f71706a;
    }
}
