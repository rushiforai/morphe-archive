package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class i3 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f73438j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ c0.r0 f73439k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f73440l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f73441m;
    public final /* synthetic */ p1.y2 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i3(boolean z11, c0.r0 r0Var, p1.e1 e1Var, c0.y1 y1Var, c0.y1 y1Var2) {
        super(1);
        this.f73438j = z11;
        this.f73439k = r0Var;
        this.f73440l = e1Var;
        this.f73441m = y1Var;
        this.n = y1Var2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        i2.a0 a0Var = (i2.a0) obj;
        p1.e1 e1Var = this.f73439k.f18939l;
        float fFloatValue = 0.8f;
        p1.y2 y2Var = this.f73441m;
        float fFloatValue2 = 1.0f;
        boolean z11 = this.f73438j;
        i2.s0 s0Var = (i2.s0) a0Var;
        s0Var.i(!z11 ? ((Number) y2Var.getValue()).floatValue() : ((Boolean) ((p1.s2) e1Var).getValue()).booleanValue() ? 1.0f : 0.8f);
        if (!z11) {
            fFloatValue = ((Number) y2Var.getValue()).floatValue();
        } else if (((Boolean) ((p1.s2) e1Var).getValue()).booleanValue()) {
            fFloatValue = 1.0f;
        }
        s0Var.j(fFloatValue);
        if (!z11) {
            fFloatValue2 = ((Number) this.n.getValue()).floatValue();
        } else if (!((Boolean) ((p1.s2) e1Var).getValue()).booleanValue()) {
            fFloatValue2 = 0.0f;
        }
        s0Var.a(fFloatValue2);
        s0Var.o(((i2.y0) this.f73440l.getValue()).f61193a);
        return Unit.f71706a;
    }
}
