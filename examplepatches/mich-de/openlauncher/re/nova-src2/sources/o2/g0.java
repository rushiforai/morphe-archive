package o2;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class g0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f79263j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ h0 f79264k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g0(h0 h0Var, int i5) {
        super(1);
        this.f79263j = i5;
        this.f79264k = h0Var;
    }

    /* JADX WARN: Type inference failed for: r10v3, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f79263j) {
            case 0:
                h0 h0Var = this.f79264k;
                h0Var.f79268d = true;
                h0Var.f79270f.invoke();
                return Unit.f71706a;
            default:
                k2.f fVar = (k2.f) obj;
                h0 h0Var2 = this.f79264k;
                c cVar = h0Var2.f79266b;
                float f11 = h0Var2.f79275k;
                float f12 = h0Var2.f79276l;
                k2.d drawContext = fVar.getDrawContext();
                long jMo111getSizeNHjbRc = drawContext.mo111getSizeNHjbRc();
                drawContext.getCanvas().save();
                try {
                    drawContext.getTransform().mo140scale0AR0LA0(f11, f12, 0L);
                    cVar.a(fVar);
                    a2.c.x(drawContext, jMo111getSizeNHjbRc);
                    return Unit.f71706a;
                } catch (Throwable th2) {
                    a2.c.x(drawContext, jMo111getSizeNHjbRc);
                    throw th2;
                }
        }
    }
}
